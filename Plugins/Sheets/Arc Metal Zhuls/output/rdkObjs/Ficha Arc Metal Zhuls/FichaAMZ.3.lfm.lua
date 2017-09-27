require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ3()
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
    obj:setName("frmAMZ3");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(270);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(220);
    obj.layout1:setHeight(180);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(220);
    obj.label1:setHeight(20);
    obj.label1:setText("Atributos - Allei");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(110);
    obj.label2:setTop(5);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setText("Bônus");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(160);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setText("Total");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(50);
    obj.layout3:setWidth(210);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");


			local function rolagemCallbackdes(rolagem)
				local chance = (tonumber(sheet.chance_des) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(110);
    obj.button1:setHeight(20);
    obj.button1:setText("Destreza (DES)");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setFontSize(13);
    obj.button1:setName("button1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("atr_bonus_des");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(160);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(160);
    obj.label4:setTop(0);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("atr_efetivo_des");
    obj.label4:setName("label4");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout3);
    obj.dataLink1:setFields({'atr_total_des', 'atr_bonus_des'});
    obj.dataLink1:setName("dataLink1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(75);
    obj.layout4:setWidth(210);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");


			local function rolagemCallbackper(rolagem)
				local chance = (tonumber(sheet.chance_per) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(110);
    obj.button2:setHeight(20);
    obj.button2:setText("Percepção (PER)");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setFontSize(13);
    obj.button2:setName("button2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("atr_bonus_per");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setLeft(160);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(160);
    obj.label5:setTop(0);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("atr_efetivo_per");
    obj.label5:setName("label5");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setFields({'atr_total_per', 'atr_bonus_per'});
    obj.dataLink2:setName("dataLink2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(100);
    obj.layout5:setWidth(210);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");


			local function rolagemCallbackint(rolagem)
				local chance = (tonumber(sheet.chance_int) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout5);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setWidth(110);
    obj.button3:setHeight(20);
    obj.button3:setText("Inteligência (INT)");
    obj.button3:setHorzTextAlign("center");
    obj.button3:setFontSize(13);
    obj.button3:setName("button3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("atr_bonus_int");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout5);
    obj.rectangle4:setLeft(160);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setLeft(160);
    obj.label6:setTop(0);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setField("atr_efetivo_int");
    obj.label6:setName("label6");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setFields({'atr_total_int', 'atr_bonus_int'});
    obj.dataLink3:setName("dataLink3");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(125);
    obj.layout6:setWidth(210);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");


			local function rolagemCallbackcon(rolagem)
				local chance = (tonumber(sheet.chance_con) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout6);
    obj.button4:setLeft(0);
    obj.button4:setTop(0);
    obj.button4:setWidth(110);
    obj.button4:setHeight(20);
    obj.button4:setText("Concentração (CON)");
    obj.button4:setHorzTextAlign("center");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("atr_bonus_con");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout6);
    obj.rectangle5:setLeft(160);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setLeft(160);
    obj.label7:setTop(0);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("atr_efetivo_con");
    obj.label7:setName("label7");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout6);
    obj.dataLink4:setFields({'atr_total_con', 'atr_bonus_con'});
    obj.dataLink4:setName("dataLink4");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(150);
    obj.layout7:setWidth(210);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");


			local function rolagemCallbackfv(rolagem)
				local chance = (tonumber(sheet.chance_fv) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout7);
    obj.button5:setLeft(0);
    obj.button5:setTop(0);
    obj.button5:setWidth(110);
    obj.button5:setHeight(20);
    obj.button5:setText("Força de Vontade (FV)");
    obj.button5:setHorzTextAlign("center");
    obj.button5:setFontSize(10);
    obj.button5:setName("button5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atr_bonus_fv");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout7);
    obj.rectangle6:setLeft(160);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setLeft(160);
    obj.label8:setTop(0);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setField("atr_efetivo_fv");
    obj.label8:setName("label8");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout7);
    obj.dataLink5:setFields({'atr_total_fv', 'atr_bonus_fv'});
    obj.dataLink5:setName("dataLink5");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(500);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(220);
    obj.layout8:setHeight(180);
    obj.layout8:setName("layout8");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout8);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(220);
    obj.label9:setHeight(20);
    obj.label9:setText("Talentos - Allei");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(210);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(110);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("Bônus");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setLeft(160);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("Total");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(50);
    obj.layout10:setWidth(210);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");


			local function rolagemCallbackmir(rolagem)
				local chance = (tonumber(sheet.chance_mir) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout10);
    obj.button6:setLeft(0);
    obj.button6:setTop(0);
    obj.button6:setWidth(110);
    obj.button6:setHeight(20);
    obj.button6:setText("Mira (MIR)");
    obj.button6:setHorzTextAlign("center");
    obj.button6:setFontSize(13);
    obj.button6:setName("button6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("atr_bonus_mir");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setLeft(160);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setLeft(160);
    obj.label12:setTop(0);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setField("atr_efetivo_mir");
    obj.label12:setName("label12");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setFields({'atr_total_mir', 'atr_bonus_mir'});
    obj.dataLink6:setName("dataLink6");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(75);
    obj.layout11:setWidth(210);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");


			local function rolagemCallbackrac(rolagem)
				local chance = (tonumber(sheet.chance_rac) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout11);
    obj.button7:setLeft(0);
    obj.button7:setTop(0);
    obj.button7:setWidth(110);
    obj.button7:setHeight(20);
    obj.button7:setText("Raciocínio (RAC)");
    obj.button7:setHorzTextAlign("center");
    obj.button7:setFontSize(13);
    obj.button7:setName("button7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout11);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("atr_bonus_rac");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout11);
    obj.rectangle9:setLeft(160);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setLeft(160);
    obj.label13:setTop(0);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("atr_efetivo_rac");
    obj.label13:setName("label13");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout11);
    obj.dataLink7:setFields({'atr_total_rac', 'atr_bonus_rac'});
    obj.dataLink7:setName("dataLink7");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(100);
    obj.layout12:setWidth(210);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");


			local function rolagemCallbackref(rolagem)
				local chance = (tonumber(sheet.chance_ref) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout12);
    obj.button8:setLeft(0);
    obj.button8:setTop(0);
    obj.button8:setWidth(110);
    obj.button8:setHeight(20);
    obj.button8:setText("Reflexo (REF)");
    obj.button8:setHorzTextAlign("center");
    obj.button8:setFontSize(13);
    obj.button8:setName("button8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atr_bonus_ref");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout12);
    obj.rectangle10:setLeft(160);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout12);
    obj.label14:setLeft(160);
    obj.label14:setTop(0);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setField("atr_efetivo_ref");
    obj.label14:setName("label14");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout12);
    obj.dataLink8:setFields({'atr_total_ref', 'atr_bonus_ref'});
    obj.dataLink8:setName("dataLink8");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(125);
    obj.layout13:setWidth(210);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");


			local function rolagemCallbackhab(rolagem)
				local chance = (tonumber(sheet.chance_hab) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout13);
    obj.button9:setLeft(0);
    obj.button9:setTop(0);
    obj.button9:setWidth(110);
    obj.button9:setHeight(20);
    obj.button9:setText("Habilidade (HAB)");
    obj.button9:setHorzTextAlign("center");
    obj.button9:setFontSize(13);
    obj.button9:setName("button9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setLeft(110);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atr_bonus_hab");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setLeft(160);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setLeft(160);
    obj.label15:setTop(0);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setField("atr_efetivo_hab");
    obj.label15:setName("label15");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout13);
    obj.dataLink9:setFields({'atr_total_hab', 'atr_bonus_hab'});
    obj.dataLink9:setName("dataLink9");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(730);
    obj.layout14:setTop(0);
    obj.layout14:setWidth(220);
    obj.layout14:setHeight(180);
    obj.layout14:setName("layout14");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout14);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout14);
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(220);
    obj.label16:setHeight(20);
    obj.label16:setText("Atributos - Zhul");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(25);
    obj.layout15:setWidth(210);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setLeft(110);
    obj.label17:setTop(5);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("Bônus");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
    obj.label18:setLeft(160);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("Total");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(50);
    obj.layout16:setWidth(210);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");


			local function rolagemCallbackfor(rolagem)
				local chance = (tonumber(sheet.chance_for) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout16);
    obj.button10:setLeft(0);
    obj.button10:setTop(0);
    obj.button10:setWidth(110);
    obj.button10:setHeight(20);
    obj.button10:setText("Força (FOR)");
    obj.button10:setHorzTextAlign("center");
    obj.button10:setFontSize(13);
    obj.button10:setName("button10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout16);
    obj.edit10:setLeft(110);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atr_bonus_for");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout16);
    obj.rectangle13:setLeft(160);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setLeft(160);
    obj.label19:setTop(0);
    obj.label19:setWidth(50);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setField("atr_efetivo_for");
    obj.label19:setName("label19");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout16);
    obj.dataLink10:setFields({'atr_total_for', 'atr_bonus_for'});
    obj.dataLink10:setName("dataLink10");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(75);
    obj.layout17:setWidth(210);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");


			local function rolagemCallbackvel(rolagem)
				local chance = (tonumber(sheet.chance_vel) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout17);
    obj.button11:setLeft(0);
    obj.button11:setTop(0);
    obj.button11:setWidth(110);
    obj.button11:setHeight(20);
    obj.button11:setText("Velocidade (VEL)");
    obj.button11:setHorzTextAlign("center");
    obj.button11:setFontSize(13);
    obj.button11:setName("button11");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout17);
    obj.edit11:setLeft(110);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atr_bonus_vel");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout17);
    obj.rectangle14:setLeft(160);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout17);
    obj.label20:setLeft(160);
    obj.label20:setTop(0);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("atr_efetivo_vel");
    obj.label20:setName("label20");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout17);
    obj.dataLink11:setFields({'atr_total_vel', 'atr_bonus_vel'});
    obj.dataLink11:setName("dataLink11");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout14);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(100);
    obj.layout18:setWidth(210);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");


			local function rolagemCallbackmaq(rolagem)
				local chance = (tonumber(sheet.chance_maq) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout18);
    obj.button12:setLeft(0);
    obj.button12:setTop(0);
    obj.button12:setWidth(110);
    obj.button12:setHeight(20);
    obj.button12:setText("Maquinário (MAQ)");
    obj.button12:setHorzTextAlign("center");
    obj.button12:setFontSize(13);
    obj.button12:setName("button12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout18);
    obj.edit12:setLeft(110);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atr_bonus_maq");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout18);
    obj.rectangle15:setLeft(160);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout18);
    obj.label21:setLeft(160);
    obj.label21:setTop(0);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("atr_efetivo_maq");
    obj.label21:setName("label21");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout18);
    obj.dataLink12:setFields({'atr_total_maq', 'atr_bonus_maq'});
    obj.dataLink12:setName("dataLink12");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout14);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(125);
    obj.layout19:setWidth(210);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");


			local function rolagemCallbackce(rolagem)
				local chance = (tonumber(sheet.chance_ce) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout19);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setWidth(110);
    obj.button13:setHeight(20);
    obj.button13:setText("Construção Elemental (CE)");
    obj.button13:setHorzTextAlign("center");
    obj.button13:setFontSize(8);
    obj.button13:setName("button13");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setLeft(110);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atr_bonus_ce");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout19);
    obj.rectangle16:setLeft(160);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setLeft(160);
    obj.label22:setTop(0);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setField("atr_efetivo_ce");
    obj.label22:setName("label22");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout19);
    obj.dataLink13:setFields({'atr_total_ce', 'atr_bonus_ce'});
    obj.dataLink13:setName("dataLink13");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(960);
    obj.layout20:setTop(0);
    obj.layout20:setWidth(220);
    obj.layout20:setHeight(180);
    obj.layout20:setName("layout20");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout20);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(5);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout20);
    obj.label23:setLeft(0);
    obj.label23:setTop(0);
    obj.label23:setWidth(220);
    obj.label23:setHeight(20);
    obj.label23:setText("Talentos - Zhul");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(25);
    obj.layout21:setWidth(210);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout21);
    obj.label24:setLeft(110);
    obj.label24:setTop(5);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("Bônus");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout21);
    obj.label25:setLeft(160);
    obj.label25:setTop(5);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("Total");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(50);
    obj.layout22:setWidth(210);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");


			local function rolagemCallbackpf(rolagem)
				local chance = (tonumber(sheet.chance_pf) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout22);
    obj.button14:setLeft(0);
    obj.button14:setTop(0);
    obj.button14:setWidth(110);
    obj.button14:setHeight(20);
    obj.button14:setText("Poder de Fogo (PF)");
    obj.button14:setHorzTextAlign("center");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout22);
    obj.edit14:setLeft(110);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atr_bonus_pf");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout22);
    obj.rectangle18:setLeft(160);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout22);
    obj.label26:setLeft(160);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("atr_efetivo_pf");
    obj.label26:setName("label26");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout22);
    obj.dataLink14:setFields({'atr_total_pf', 'atr_bonus_pf'});
    obj.dataLink14:setName("dataLink14");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(75);
    obj.layout23:setWidth(210);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");


			local function rolagemCallbackagi(rolagem)
				local chance = (tonumber(sheet.chance_agi) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout23);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setWidth(110);
    obj.button15:setHeight(20);
    obj.button15:setText("Agilidade (AGI)");
    obj.button15:setHorzTextAlign("center");
    obj.button15:setFontSize(13);
    obj.button15:setName("button15");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setLeft(110);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atr_bonus_agi");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout23);
    obj.rectangle19:setLeft(160);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout23);
    obj.label27:setLeft(160);
    obj.label27:setTop(0);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("atr_efetivo_agi");
    obj.label27:setName("label27");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout23);
    obj.dataLink15:setFields({'atr_total_agi', 'atr_bonus_agi'});
    obj.dataLink15:setName("dataLink15");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(100);
    obj.layout24:setWidth(210);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");


			local function rolagemCallbackres(rolagem)
				local chance = (tonumber(sheet.chance_res) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout24);
    obj.button16:setLeft(0);
    obj.button16:setTop(0);
    obj.button16:setWidth(110);
    obj.button16:setHeight(20);
    obj.button16:setText("Resistência (RES)");
    obj.button16:setHorzTextAlign("center");
    obj.button16:setFontSize(13);
    obj.button16:setName("button16");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout24);
    obj.edit16:setLeft(110);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atr_bonus_res");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout24);
    obj.rectangle20:setLeft(160);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout24);
    obj.label28:setLeft(160);
    obj.label28:setTop(0);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("atr_efetivo_res");
    obj.label28:setName("label28");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout24);
    obj.dataLink16:setFields({'atr_total_res', 'atr_bonus_res'});
    obj.dataLink16:setName("dataLink16");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout20);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(125);
    obj.layout25:setWidth(210);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");


			local function rolagemCallbackvoo(rolagem)
				local chance = (tonumber(sheet.chance_voo) or 0);
				local resultado = rolagem.resultado;
				local mesa = rrpg.getMesaDe(sheet);

				if resultado <= chance then
					mesa.activeChat:enviarMensagem("Sucesso!");
				else
					mesa.activeChat:enviarMensagem("Falha!");
				end;

			end;
			


    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout25);
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setWidth(110);
    obj.button17:setHeight(20);
    obj.button17:setText("Voo");
    obj.button17:setHorzTextAlign("center");
    obj.button17:setFontSize(13);
    obj.button17:setName("button17");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout25);
    obj.edit17:setLeft(110);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atr_bonus_voo");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout25);
    obj.rectangle21:setLeft(160);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout25);
    obj.label29:setLeft(160);
    obj.label29:setTop(0);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setField("atr_efetivo_voo");
    obj.label29:setName("label29");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout25);
    obj.dataLink17:setFields({'atr_total_voo', 'atr_bonus_voo'});
    obj.dataLink17:setName("dataLink17");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(0);
    obj.layout26:setWidth(260);
    obj.layout26:setHeight(305);
    obj.layout26:setName("layout26");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout26);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout26);
    obj.label30:setLeft(0);
    obj.label30:setTop(5);
    obj.label30:setWidth(220);
    obj.label30:setHeight(20);
    obj.label30:setText("Êxitos");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(25);
    obj.layout27:setWidth(250);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout27);
    obj.button18:setLeft(0);
    obj.button18:setTop(0);
    obj.button18:setWidth(110);
    obj.button18:setHeight(20);
    obj.button18:setText("Iniciativa");
    obj.button18:setHorzTextAlign("center");
    obj.button18:setFontSize(13);
    obj.button18:setName("button18");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout27);
    obj.rectangle23:setLeft(110);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(100);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout27);
    obj.label31:setLeft(110);
    obj.label31:setTop(0);
    obj.label31:setWidth(100);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("roll_iniciativa");
    obj.label31:setName("label31");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout27);
    obj.edit18:setLeft(210);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("extra_iniciativa");
    obj.edit18:setName("edit18");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout27);
    obj.dataLink18:setFields({'atr_efetivo_ref', 'atr_efetivo_agi', 'extra_iniciativa'});
    obj.dataLink18:setName("dataLink18");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout26);
    obj.label32:setLeft(0);
    obj.label32:setTop(55);
    obj.label32:setWidth(220);
    obj.label32:setHeight(20);
    obj.label32:setText("Acertos");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(75);
    obj.layout28:setWidth(250);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout28);
    obj.button19:setLeft(0);
    obj.button19:setTop(0);
    obj.button19:setWidth(110);
    obj.button19:setHeight(20);
    obj.button19:setText("Ataque Corp.");
    obj.button19:setHorzTextAlign("center");
    obj.button19:setFontSize(13);
    obj.button19:setName("button19");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout28);
    obj.rectangle24:setLeft(110);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(100);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout28);
    obj.label33:setLeft(110);
    obj.label33:setTop(0);
    obj.label33:setWidth(100);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setField("roll_acertos_cac");
    obj.label33:setName("label33");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout28);
    obj.edit19:setLeft(210);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("extra_acertos_cac");
    obj.edit19:setName("edit19");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout28);
    obj.dataLink19:setFields({'atr_efetivo_des', 'atr_efetivo_vel', 'extra_acertos_cac'});
    obj.dataLink19:setName("dataLink19");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout26);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(100);
    obj.layout29:setWidth(250);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout29);
    obj.button20:setLeft(0);
    obj.button20:setTop(0);
    obj.button20:setWidth(110);
    obj.button20:setHeight(20);
    obj.button20:setText("Ataque a Dist.");
    obj.button20:setHorzTextAlign("center");
    obj.button20:setFontSize(13);
    obj.button20:setName("button20");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout29);
    obj.rectangle25:setLeft(110);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(100);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout29);
    obj.label34:setLeft(110);
    obj.label34:setTop(0);
    obj.label34:setWidth(100);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("roll_acertos_dist");
    obj.label34:setName("label34");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout29);
    obj.edit20:setLeft(210);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("extra_acertos_dist");
    obj.edit20:setName("edit20");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout29);
    obj.dataLink20:setFields({'atr_efetivo_mir', 'atr_efetivo_agi', 'extra_acertos_dist'});
    obj.dataLink20:setName("dataLink20");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout26);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(125);
    obj.layout30:setWidth(250);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout30);
    obj.button21:setLeft(0);
    obj.button21:setTop(0);
    obj.button21:setWidth(110);
    obj.button21:setHeight(20);
    obj.button21:setText("Bloqueio");
    obj.button21:setHorzTextAlign("center");
    obj.button21:setFontSize(13);
    obj.button21:setName("button21");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout30);
    obj.rectangle26:setLeft(110);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(100);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout30);
    obj.label35:setLeft(110);
    obj.label35:setTop(0);
    obj.label35:setWidth(100);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("roll_acertos_bloqueio");
    obj.label35:setName("label35");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout30);
    obj.edit21:setLeft(210);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setField("extra_acertos_bloqueio");
    obj.edit21:setName("edit21");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout30);
    obj.dataLink21:setFields({'atr_efetivo_ref', 'atr_efetivo_vel', 'extra_acertos_bloqueio'});
    obj.dataLink21:setName("dataLink21");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout26);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(150);
    obj.layout31:setWidth(250);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout31);
    obj.button22:setLeft(0);
    obj.button22:setTop(0);
    obj.button22:setWidth(110);
    obj.button22:setHeight(20);
    obj.button22:setText("Escape");
    obj.button22:setHorzTextAlign("center");
    obj.button22:setFontSize(13);
    obj.button22:setName("button22");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout31);
    obj.rectangle27:setLeft(110);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(100);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout31);
    obj.label36:setLeft(110);
    obj.label36:setTop(0);
    obj.label36:setWidth(100);
    obj.label36:setHeight(25);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setField("roll_acertos_escape");
    obj.label36:setName("label36");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout31);
    obj.edit22:setLeft(210);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setField("extra_acertos_escape");
    obj.edit22:setName("edit22");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout31);
    obj.dataLink22:setFields({'atr_efetivo_per', 'atr_efetivo_agi', 'extra_acertos_escape'});
    obj.dataLink22:setName("dataLink22");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout26);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(175);
    obj.layout32:setWidth(250);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout32);
    obj.button23:setLeft(0);
    obj.button23:setTop(0);
    obj.button23:setWidth(110);
    obj.button23:setHeight(20);
    obj.button23:setText("Agarrão");
    obj.button23:setHorzTextAlign("center");
    obj.button23:setFontSize(13);
    obj.button23:setName("button23");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout32);
    obj.rectangle28:setLeft(110);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(100);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout32);
    obj.label37:setLeft(110);
    obj.label37:setTop(0);
    obj.label37:setWidth(100);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("roll_acertos_agarrao");
    obj.label37:setName("label37");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout32);
    obj.edit23:setLeft(210);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setField("extra_acertos_agarrao");
    obj.edit23:setName("edit23");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout32);
    obj.dataLink23:setFields({'atr_efetivo_for', 'atr_efetivo_des', 'extra_acertos_agarrao'});
    obj.dataLink23:setName("dataLink23");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout26);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(200);
    obj.layout33:setWidth(250);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout33);
    obj.button24:setLeft(0);
    obj.button24:setTop(0);
    obj.button24:setWidth(110);
    obj.button24:setHeight(20);
    obj.button24:setText("Counter");
    obj.button24:setHorzTextAlign("center");
    obj.button24:setFontSize(13);
    obj.button24:setName("button24");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout33);
    obj.rectangle29:setLeft(110);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(100);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout33);
    obj.label38:setLeft(110);
    obj.label38:setTop(0);
    obj.label38:setWidth(100);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setField("roll_acertos_counter");
    obj.label38:setName("label38");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout33);
    obj.edit24:setLeft(210);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setField("extra_acertos_counter");
    obj.edit24:setName("edit24");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout33);
    obj.dataLink24:setFields({'atr_efetivo_hab', 'atr_efetivo_vel', 'extra_acertos_counter'});
    obj.dataLink24:setName("dataLink24");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout26);
    obj.label39:setLeft(0);
    obj.label39:setTop(230);
    obj.label39:setWidth(220);
    obj.label39:setHeight(20);
    obj.label39:setText("Ataques");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout26);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(250);
    obj.layout34:setWidth(250);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout34);
    obj.button25:setLeft(0);
    obj.button25:setTop(0);
    obj.button25:setWidth(110);
    obj.button25:setHeight(20);
    obj.button25:setText("Corpo-a-Corpo");
    obj.button25:setHorzTextAlign("center");
    obj.button25:setFontSize(13);
    obj.button25:setName("button25");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout34);
    obj.rectangle30:setLeft(110);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(100);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout34);
    obj.label40:setLeft(110);
    obj.label40:setTop(0);
    obj.label40:setWidth(100);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("roll_ataques_cac");
    obj.label40:setName("label40");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout34);
    obj.edit25:setLeft(210);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("extra_ataques_cac");
    obj.edit25:setName("edit25");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout34);
    obj.dataLink25:setFields({'atr_efetivo_for', 'empty', 'extra_ataques_cac'});
    obj.dataLink25:setName("dataLink25");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout26);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(275);
    obj.layout35:setWidth(250);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout35);
    obj.button26:setLeft(0);
    obj.button26:setTop(0);
    obj.button26:setWidth(110);
    obj.button26:setHeight(20);
    obj.button26:setText("À Distancia");
    obj.button26:setHorzTextAlign("center");
    obj.button26:setFontSize(13);
    obj.button26:setName("button26");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout35);
    obj.rectangle31:setLeft(110);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(100);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout35);
    obj.label41:setLeft(110);
    obj.label41:setTop(0);
    obj.label41:setWidth(100);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setField("roll_ataques_dist");
    obj.label41:setName("label41");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout35);
    obj.edit26:setLeft(210);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("extra_ataques_dist");
    obj.edit26:setName("edit26");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout35);
    obj.dataLink26:setFields({'atr_efetivo_pf', 'empty', 'extra_ataques_dist'});
    obj.dataLink26:setName("dataLink26");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox1);
    obj.layout36:setLeft(270);
    obj.layout36:setTop(190);
    obj.layout36:setWidth(485);
    obj.layout36:setHeight(425);
    obj.layout36:setName("layout36");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout36);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(5);
    obj.rectangle32:setCornerType("round");
    obj.rectangle32:setName("rectangle32");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout36);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(485);
    obj.label42:setHeight(20);
    obj.label42:setText("Habilidades");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rclHabilidadesIniciaisPequeno = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesIniciaisPequeno:setParent(obj.layout36);
    obj.rclHabilidadesIniciaisPequeno:setName("rclHabilidadesIniciaisPequeno");
    obj.rclHabilidadesIniciaisPequeno:setField("campoDosHabilidadesIniciais");
    obj.rclHabilidadesIniciaisPequeno:setTemplateForm("frmAMZ3_1");
    obj.rclHabilidadesIniciaisPequeno:setLeft(5);
    obj.rclHabilidadesIniciaisPequeno:setTop(25);
    obj.rclHabilidadesIniciaisPequeno:setWidth(475);
    obj.rclHabilidadesIniciaisPequeno:setHeight(395);
    obj.rclHabilidadesIniciaisPequeno:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_des) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_des = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Destreza (DES) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackdes);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_des) or 0) +
            									(tonumber(sheet.atr_bonus_des) or 0);
            					sheet.atr_efetivo_des = total;
            				end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_per) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_per = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Percepção (PER) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackper);
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_per) or 0) +
            									(tonumber(sheet.atr_bonus_per) or 0);
            					sheet.atr_efetivo_per = total;
            				end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_int) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_int = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Inteligência (INT) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackint);
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_int) or 0) +
            									(tonumber(sheet.atr_bonus_int) or 0);
            					sheet.atr_efetivo_int = total;
            				end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_con) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_con = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Concentração (CON) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackcon);
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_con) or 0) +
            									(tonumber(sheet.atr_bonus_con) or 0);
            					sheet.atr_efetivo_con = total;
            				end;
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_fv) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_fv = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Força de Vontade (FV) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackfv);
        end, obj);

    obj._e_event9 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_fv) or 0) +
            									(tonumber(sheet.atr_bonus_fv) or 0);
            					sheet.atr_efetivo_fv = total;
            				end;
        end, obj);

    obj._e_event10 = obj.button6:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_mir) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_mir = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Mira (MIR) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackmir);
        end, obj);

    obj._e_event11 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_mir) or 0) +
            									(tonumber(sheet.atr_bonus_mir) or 0);
            					sheet.atr_efetivo_mir = total;
            				end;
        end, obj);

    obj._e_event12 = obj.button7:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_rac) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_rac = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Raciocínio (RAC) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackrac);
        end, obj);

    obj._e_event13 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_rac) or 0) +
            									(tonumber(sheet.atr_bonus_rac) or 0);
            					sheet.atr_efetivo_rac = total;
            				end;
        end, obj);

    obj._e_event14 = obj.button8:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_ref) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_ref = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Reflexo (REF) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackref);
        end, obj);

    obj._e_event15 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_ref) or 0) +
            									(tonumber(sheet.atr_bonus_ref) or 0);
            					sheet.atr_efetivo_ref = total;
            				end;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_hab) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_hab = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Habilidade (HAB) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackhab);
        end, obj);

    obj._e_event17 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_hab) or 0) +
            									(tonumber(sheet.atr_bonus_hab) or 0);
            					sheet.atr_efetivo_hab = total;
            				end;
        end, obj);

    obj._e_event18 = obj.button10:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_for) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_for = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Força (FOR) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackfor);
        end, obj);

    obj._e_event19 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_for) or 0) +
            									(tonumber(sheet.atr_bonus_for) or 0);
            					sheet.atr_efetivo_for = total;
            				end;
        end, obj);

    obj._e_event20 = obj.button11:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_vel) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_vel = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Velocidade (VEL) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackvel);
        end, obj);

    obj._e_event21 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_vel) or 0) +
            									(tonumber(sheet.atr_bonus_vel) or 0);
            					sheet.atr_efetivo_vel = total;
            				end;
        end, obj);

    obj._e_event22 = obj.button12:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_maq) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_maq = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Maquinário (MAQ) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackmaq);
        end, obj);

    obj._e_event23 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_maq) or 0) +
            									(tonumber(sheet.atr_bonus_maq) or 0);
            					sheet.atr_efetivo_maq = total;
            				end;
        end, obj);

    obj._e_event24 = obj.button13:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_ce) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_ce = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Construção Elemental (CE) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackce);
        end, obj);

    obj._e_event25 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_ce) or 0) +
            									(tonumber(sheet.atr_bonus_ce) or 0);
            					sheet.atr_efetivo_ce = total;
            				end;
        end, obj);

    obj._e_event26 = obj.button14:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_pf) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_pf = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Poder de Fogo (PF) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackpf);
        end, obj);

    obj._e_event27 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_pf) or 0) +
            									(tonumber(sheet.atr_bonus_pf) or 0);
            					sheet.atr_efetivo_pf = total;
            				end;
        end, obj);

    obj._e_event28 = obj.button15:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_agi) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_agi = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Agilidade (AGI) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackagi);
        end, obj);

    obj._e_event29 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_agi) or 0) +
            									(tonumber(sheet.atr_bonus_agi) or 0);
            					sheet.atr_efetivo_agi = total;
            				end;
        end, obj);

    obj._e_event30 = obj.button16:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_res) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_res = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Resistência (RES) " .. atributo .. " (" .. chance .. "%)", rolagemCallbackres);
        end, obj);

    obj._e_event31 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_res) or 0) +
            									(tonumber(sheet.atr_bonus_res) or 0);
            					sheet.atr_efetivo_res = total;
            				end;
        end, obj);

    obj._e_event32 = obj.button17:addEventListener("onClick",
        function (self)
            local atributo = (tonumber(sheet.atr_efetivo_voo) or 0);
            
            				local chance = 30;
            
            				if atributo > 95 then
            					chance = 100;
            				else
            					local p1 = math.min(atributo, 25);
            					local p2 = math.max(math.min(atributo-25, 20), 0);
            					local p3 = math.max(math.min(atributo-45, 50), 0);
            
            					chance = 30 + p1 + (p2 * 0.75) + (p3 * 0.5);
            				end;
            
            				sheet.chance_voo = chance;
            
            				local rolagem = rrpg.interpretarRolagem("1d100");
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Voo " .. atributo .. " (" .. chance .. "%)", rolagemCallbackvoo);
        end, obj);

    obj._e_event33 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_total_voo) or 0) +
            									(tonumber(sheet.atr_bonus_voo) or 0);
            					sheet.atr_efetivo_voo = total;
            				end;
        end, obj);

    obj._e_event34 = obj.button18:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_iniciativa or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event35 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_ref) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_agi) or 0;
            				local f3 = tonumber(sheet.extra_iniciativa) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_iniciativa = "1d20 + " .. mod;
        end, obj);

    obj._e_event36 = obj.button19:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_cac or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event37 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_des) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_vel) or 0;
            				local f3 = tonumber(sheet.extra_acertos_cac) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_cac = "1d20 + " .. mod;
        end, obj);

    obj._e_event38 = obj.button20:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_dist or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event39 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_mir) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_agi) or 0;
            				local f3 = tonumber(sheet.extra_acertos_dist) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_dist = "1d20 + " .. mod;
        end, obj);

    obj._e_event40 = obj.button21:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_bloqueio or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event41 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_ref) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_vel) or 0;
            				local f3 = tonumber(sheet.extra_acertos_bloqueio) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_bloqueio = "1d20 + " .. mod;
        end, obj);

    obj._e_event42 = obj.button22:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_escape or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event43 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_per) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_agi) or 0;
            				local f3 = tonumber(sheet.extra_acertos_escape) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_escape = "1d20 + " .. mod;
        end, obj);

    obj._e_event44 = obj.button23:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_agarrao or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event45 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_for) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_des) or 0;
            				local f3 = tonumber(sheet.extra_acertos_agarrao) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_agarrao = "1d10 + " .. mod;
        end, obj);

    obj._e_event46 = obj.button24:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_acertos_counter or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event47 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_hab) or 0;
            				local f2 = tonumber(sheet.atr_efetivo_vel) or 0;
            				local f3 = tonumber(sheet.extra_acertos_counter) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_acertos_counter = "1d20 + " .. mod;
        end, obj);

    obj._e_event48 = obj.button25:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_ataques_cac or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event49 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_for) or 0;
            				local f2 = tonumber(sheet.empty) or 0;
            				local f3 = tonumber(sheet.extra_ataques_cac) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_ataques_cac = "1d10 + " .. mod;
        end, obj);

    obj._e_event50 = obj.button26:addEventListener("onClick",
        function (self)
            local roll = sheet.roll_ataques_dist or "1d1-1";
            				local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event51 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            
            				local f1 = tonumber(sheet.atr_efetivo_pf) or 0;
            				local f2 = tonumber(sheet.empty) or 0;
            				local f3 = tonumber(sheet.extra_ataques_dist) or 0;
            				local mod = f1 + f2 + f3;
            
            				sheet.roll_ataques_dist = "1d10 + " .. mod;
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.rclHabilidadesIniciaisPequeno ~= nil then self.rclHabilidadesIniciaisPequeno:destroy(); self.rclHabilidadesIniciaisPequeno = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ3 = {
    newEditor = newfrmAMZ3, 
    new = newfrmAMZ3, 
    name = "frmAMZ3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ3 = _frmAMZ3;
rrpg.registrarForm(_frmAMZ3);

return _frmAMZ3;
