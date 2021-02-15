require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister2_svg()
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
    obj:setName("frmFichaRPGmeister2_svg");
    obj:setAlign("client");
    obj:setMargins({top=1});


		local i;
		local max;
		local fimRolagem;
		local array;
		local decisivo;
		local dano;
		local danoCritico;

		local function pos(rolado)
			local dado = rolado.ops[1].resultados[1];
			local mesa = Firecast.getMesaDe(sheet);
			local valor = rolado.resultado;
			
			if (dado>=decisivo) then
				mesa.activeChat:rolarDados(rolagem, "Confirmando Critico");
			end;
			
			if dado>1 then
				mesa.activeChat:rolarDados(dano, "Dano do Ataque " .. i);
			end;
			
			if dado>=decisivo then
				mesa.activeChat:rolarDados(danoCritico, "Dano Extra do Critico "  .. i);
			end;
			
			i = i+1;
			local mod = tonumber(array[i]);
			
			if mod~=nil then
				rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
				if sheet.buffAtaque ~= nil then
					rolagem = rolagem:concatenar(sheet.buffAtaque);
				end;

				mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
					function (rolado)
						pos(rolado)
					end);
			else
				fimRolagem = true;
			end;
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1234);
    obj.layout1:setHeight(1900);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(2);
    obj.layout2:setTop(2);
    obj.layout2:setWidth(1232);
    obj.layout2:setHeight(92);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(55);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(225);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome1");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(50);
    obj.label2:setHeight(25);
    obj.label2:setText("ARMA");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(55);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(225);
    obj.edit2:setHeight(25);
    obj.edit2:setField("arma1");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setText("TIPO");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(55);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(225);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipo1");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(279);
    obj.button1:setTop(6);
    obj.button1:setWidth(73);
    obj.button1:setText("ATAQUE");
    obj.button1:setFontSize(11);
    obj.button1:setName("button1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setType("number");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(352);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(82);
    obj.edit4:setHeight(25);
    obj.edit4:setField("ataque1");
    obj.edit4:setName("edit4");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout2);
    obj.checkBox1:setLeft(434);
    obj.checkBox1:setTop(6);
    obj.checkBox1:setWidth(150);
    obj.checkBox1:setField("double1");
    obj.checkBox1:setText("Ataque Total");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'ataque1','double1'});
    obj.dataLink1:setName("dataLink1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(279);
    obj.button2:setTop(31);
    obj.button2:setWidth(73);
    obj.button2:setText("DANO");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(352);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(82);
    obj.edit5:setHeight(25);
    obj.edit5:setField("dano1");
    obj.edit5:setName("edit5");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(434);
    obj.button3:setTop(31);
    obj.button3:setWidth(60);
    obj.button3:setText("CRITICO");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(493);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(82);
    obj.edit6:setHeight(25);
    obj.edit6:setField("danoCritico1");
    obj.edit6:setName("edit6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(290);
    obj.label4:setTop(55);
    obj.label4:setWidth(70);
    obj.label4:setHeight(25);
    obj.label4:setText("DECISIVO");
    obj.label4:setName("label4");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(352);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(82);
    obj.edit7:setHeight(25);
    obj.edit7:setField("decisivo1");
    obj.edit7:setName("edit7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(445);
    obj.label5:setTop(55);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("MULTI");
    obj.label5:setName("label5");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(493);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(82);
    obj.edit8:setHeight(25);
    obj.edit8:setField("multiplicador1");
    obj.edit8:setName("edit8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(580);
    obj.label6:setTop(5);
    obj.label6:setWidth(80);
    obj.label6:setHeight(25);
    obj.label6:setText("CATEGORIA");
    obj.label6:setName("label6");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(660);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("categoria1");
    obj.edit9:setName("edit9");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(610);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setText("OBS");
    obj.label7:setName("label7");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(660);
    obj.edit10:setTop(30);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("obs1");
    obj.edit10:setName("edit10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(590);
    obj.label8:setTop(55);
    obj.label8:setWidth(80);
    obj.label8:setHeight(25);
    obj.label8:setText("MUNIÇÃO");
    obj.label8:setName("label8");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setType("number");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(660);
    obj.edit11:setTop(55);
    obj.edit11:setWidth(69);
    obj.edit11:setHeight(25);
    obj.edit11:setField("municao1");
    obj.edit11:setName("edit11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(735);
    obj.label9:setTop(55);
    obj.label9:setWidth(70);
    obj.label9:setHeight(25);
    obj.label9:setText("ALCANCE");
    obj.label9:setName("label9");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(795);
    obj.edit12:setTop(55);
    obj.edit12:setWidth(65);
    obj.edit12:setHeight(25);
    obj.edit12:setField("alcance1");
    obj.edit12:setName("edit12");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(869);
    obj.rectangle3:setTop(4);
    obj.rectangle3:setWidth(332);
    obj.rectangle3:setHeight(77);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(870);
    obj.label10:setTop(25);
    obj.label10:setWidth(330);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Clique para adicionar imagem");
    obj.label10:setName("label10");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setField("imagemArma1");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(870);
    obj.image1:setTop(5);
    obj.image1:setWidth(330);
    obj.image1:setHeight(75);
    obj.image1:setName("image1");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(1205);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(75);
    obj.button4:setText("X");
    obj.button4:setFontSize(15);
    obj.button4:setHint("Apaga o ataque.");
    obj.button4:setName("button4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(2);
    obj.layout3:setTop(97);
    obj.layout3:setWidth(1232);
    obj.layout3:setHeight(92);
    obj.layout3:setName("layout3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(5);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setText("NOME");
    obj.label11:setName("label11");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(55);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(225);
    obj.edit13:setHeight(25);
    obj.edit13:setField("nome2");
    obj.edit13:setName("edit13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(5);
    obj.label12:setTop(30);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setText("ARMA");
    obj.label12:setName("label12");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(55);
    obj.edit14:setTop(30);
    obj.edit14:setWidth(225);
    obj.edit14:setHeight(25);
    obj.edit14:setField("arma2");
    obj.edit14:setName("edit14");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(5);
    obj.label13:setTop(55);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setText("TIPO");
    obj.label13:setName("label13");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(55);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(225);
    obj.edit15:setHeight(25);
    obj.edit15:setField("tipo2");
    obj.edit15:setName("edit15");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(279);
    obj.button5:setTop(6);
    obj.button5:setWidth(73);
    obj.button5:setText("ATAQUE");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setType("number");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(352);
    obj.edit16:setTop(5);
    obj.edit16:setWidth(82);
    obj.edit16:setHeight(25);
    obj.edit16:setField("ataque2");
    obj.edit16:setName("edit16");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout3);
    obj.checkBox2:setLeft(434);
    obj.checkBox2:setTop(6);
    obj.checkBox2:setWidth(150);
    obj.checkBox2:setField("double2");
    obj.checkBox2:setText("Ataque Total");
    obj.checkBox2:setName("checkBox2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout3);
    obj.dataLink2:setFields({'ataque2','double2'});
    obj.dataLink2:setName("dataLink2");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(279);
    obj.button6:setTop(31);
    obj.button6:setWidth(73);
    obj.button6:setText("DANO");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(352);
    obj.edit17:setTop(30);
    obj.edit17:setWidth(82);
    obj.edit17:setHeight(25);
    obj.edit17:setField("dano2");
    obj.edit17:setName("edit17");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout3);
    obj.button7:setLeft(434);
    obj.button7:setTop(31);
    obj.button7:setWidth(60);
    obj.button7:setText("CRITICO");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(493);
    obj.edit18:setTop(30);
    obj.edit18:setWidth(82);
    obj.edit18:setHeight(25);
    obj.edit18:setField("danoCritico2");
    obj.edit18:setName("edit18");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(290);
    obj.label14:setTop(55);
    obj.label14:setWidth(70);
    obj.label14:setHeight(25);
    obj.label14:setText("DECISIVO");
    obj.label14:setName("label14");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout3);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(352);
    obj.edit19:setTop(55);
    obj.edit19:setWidth(82);
    obj.edit19:setHeight(25);
    obj.edit19:setField("decisivo2");
    obj.edit19:setName("edit19");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(445);
    obj.label15:setTop(55);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setText("MULTI");
    obj.label15:setName("label15");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(493);
    obj.edit20:setTop(55);
    obj.edit20:setWidth(82);
    obj.edit20:setHeight(25);
    obj.edit20:setField("multiplicador2");
    obj.edit20:setName("edit20");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(580);
    obj.label16:setTop(5);
    obj.label16:setWidth(80);
    obj.label16:setHeight(25);
    obj.label16:setText("CATEGORIA");
    obj.label16:setName("label16");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout3);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(660);
    obj.edit21:setTop(5);
    obj.edit21:setWidth(200);
    obj.edit21:setHeight(25);
    obj.edit21:setField("categoria2");
    obj.edit21:setName("edit21");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(610);
    obj.label17:setTop(30);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("OBS");
    obj.label17:setName("label17");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout3);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(660);
    obj.edit22:setTop(30);
    obj.edit22:setWidth(200);
    obj.edit22:setHeight(25);
    obj.edit22:setField("obs2");
    obj.edit22:setName("edit22");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(590);
    obj.label18:setTop(55);
    obj.label18:setWidth(80);
    obj.label18:setHeight(25);
    obj.label18:setText("MUNIÇÃO");
    obj.label18:setName("label18");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout3);
    obj.edit23:setType("number");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(660);
    obj.edit23:setTop(55);
    obj.edit23:setWidth(69);
    obj.edit23:setHeight(25);
    obj.edit23:setField("municao2");
    obj.edit23:setName("edit23");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(735);
    obj.label19:setTop(55);
    obj.label19:setWidth(70);
    obj.label19:setHeight(25);
    obj.label19:setText("ALCANCE");
    obj.label19:setName("label19");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout3);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(795);
    obj.edit24:setTop(55);
    obj.edit24:setWidth(65);
    obj.edit24:setHeight(25);
    obj.edit24:setField("alcance2");
    obj.edit24:setName("edit24");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setLeft(869);
    obj.rectangle5:setTop(4);
    obj.rectangle5:setWidth(332);
    obj.rectangle5:setHeight(77);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(870);
    obj.label20:setTop(25);
    obj.label20:setWidth(330);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("Clique para adicionar imagem");
    obj.label20:setName("label20");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout3);
    obj.image2:setField("imagemArma2");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(870);
    obj.image2:setTop(5);
    obj.image2:setWidth(330);
    obj.image2:setHeight(75);
    obj.image2:setName("image2");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout3);
    obj.button8:setLeft(1205);
    obj.button8:setTop(5);
    obj.button8:setWidth(25);
    obj.button8:setHeight(75);
    obj.button8:setText("X");
    obj.button8:setFontSize(15);
    obj.button8:setHint("Apaga o ataque.");
    obj.button8:setName("button8");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(2);
    obj.layout4:setTop(192);
    obj.layout4:setWidth(1232);
    obj.layout4:setHeight(92);
    obj.layout4:setName("layout4");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(5);
    obj.label21:setTop(5);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setText("NOME");
    obj.label21:setName("label21");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(55);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(225);
    obj.edit25:setHeight(25);
    obj.edit25:setField("nome3");
    obj.edit25:setName("edit25");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(5);
    obj.label22:setTop(30);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setText("ARMA");
    obj.label22:setName("label22");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(55);
    obj.edit26:setTop(30);
    obj.edit26:setWidth(225);
    obj.edit26:setHeight(25);
    obj.edit26:setField("arma3");
    obj.edit26:setName("edit26");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(5);
    obj.label23:setTop(55);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setText("TIPO");
    obj.label23:setName("label23");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(55);
    obj.edit27:setTop(55);
    obj.edit27:setWidth(225);
    obj.edit27:setHeight(25);
    obj.edit27:setField("tipo3");
    obj.edit27:setName("edit27");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout4);
    obj.button9:setLeft(279);
    obj.button9:setTop(6);
    obj.button9:setWidth(73);
    obj.button9:setText("ATAQUE");
    obj.button9:setFontSize(11);
    obj.button9:setName("button9");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setType("number");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(352);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(82);
    obj.edit28:setHeight(25);
    obj.edit28:setField("ataque3");
    obj.edit28:setName("edit28");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout4);
    obj.checkBox3:setLeft(434);
    obj.checkBox3:setTop(6);
    obj.checkBox3:setWidth(150);
    obj.checkBox3:setField("double3");
    obj.checkBox3:setText("Ataque Total");
    obj.checkBox3:setName("checkBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout4);
    obj.dataLink3:setFields({'ataque3','double3'});
    obj.dataLink3:setName("dataLink3");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout4);
    obj.button10:setLeft(279);
    obj.button10:setTop(31);
    obj.button10:setWidth(73);
    obj.button10:setText("DANO");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(352);
    obj.edit29:setTop(30);
    obj.edit29:setWidth(82);
    obj.edit29:setHeight(25);
    obj.edit29:setField("dano3");
    obj.edit29:setName("edit29");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout4);
    obj.button11:setLeft(434);
    obj.button11:setTop(31);
    obj.button11:setWidth(60);
    obj.button11:setText("CRITICO");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(493);
    obj.edit30:setTop(30);
    obj.edit30:setWidth(82);
    obj.edit30:setHeight(25);
    obj.edit30:setField("danoCritico3");
    obj.edit30:setName("edit30");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(290);
    obj.label24:setTop(55);
    obj.label24:setWidth(70);
    obj.label24:setHeight(25);
    obj.label24:setText("DECISIVO");
    obj.label24:setName("label24");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(352);
    obj.edit31:setTop(55);
    obj.edit31:setWidth(82);
    obj.edit31:setHeight(25);
    obj.edit31:setField("decisivo3");
    obj.edit31:setName("edit31");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(445);
    obj.label25:setTop(55);
    obj.label25:setWidth(50);
    obj.label25:setHeight(25);
    obj.label25:setText("MULTI");
    obj.label25:setName("label25");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout4);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(493);
    obj.edit32:setTop(55);
    obj.edit32:setWidth(82);
    obj.edit32:setHeight(25);
    obj.edit32:setField("multiplicador3");
    obj.edit32:setName("edit32");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(580);
    obj.label26:setTop(5);
    obj.label26:setWidth(80);
    obj.label26:setHeight(25);
    obj.label26:setText("CATEGORIA");
    obj.label26:setName("label26");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(660);
    obj.edit33:setTop(5);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(25);
    obj.edit33:setField("categoria3");
    obj.edit33:setName("edit33");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(610);
    obj.label27:setTop(30);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setText("OBS");
    obj.label27:setName("label27");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout4);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(660);
    obj.edit34:setTop(30);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("obs3");
    obj.edit34:setName("edit34");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(590);
    obj.label28:setTop(55);
    obj.label28:setWidth(80);
    obj.label28:setHeight(25);
    obj.label28:setText("MUNIÇÃO");
    obj.label28:setName("label28");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout4);
    obj.edit35:setType("number");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(660);
    obj.edit35:setTop(55);
    obj.edit35:setWidth(69);
    obj.edit35:setHeight(25);
    obj.edit35:setField("municao3");
    obj.edit35:setName("edit35");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(735);
    obj.label29:setTop(55);
    obj.label29:setWidth(70);
    obj.label29:setHeight(25);
    obj.label29:setText("ALCANCE");
    obj.label29:setName("label29");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout4);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(795);
    obj.edit36:setTop(55);
    obj.edit36:setWidth(65);
    obj.edit36:setHeight(25);
    obj.edit36:setField("alcance3");
    obj.edit36:setName("edit36");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setLeft(869);
    obj.rectangle7:setTop(4);
    obj.rectangle7:setWidth(332);
    obj.rectangle7:setHeight(77);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(870);
    obj.label30:setTop(25);
    obj.label30:setWidth(330);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setText("Clique para adicionar imagem");
    obj.label30:setName("label30");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout4);
    obj.image3:setField("imagemArma3");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(870);
    obj.image3:setTop(5);
    obj.image3:setWidth(330);
    obj.image3:setHeight(75);
    obj.image3:setName("image3");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout4);
    obj.button12:setLeft(1205);
    obj.button12:setTop(5);
    obj.button12:setWidth(25);
    obj.button12:setHeight(75);
    obj.button12:setText("X");
    obj.button12:setFontSize(15);
    obj.button12:setHint("Apaga o ataque.");
    obj.button12:setName("button12");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(2);
    obj.layout5:setTop(288);
    obj.layout5:setWidth(1232);
    obj.layout5:setHeight(92);
    obj.layout5:setName("layout5");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout5);
    obj.label31:setLeft(5);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(25);
    obj.label31:setText("NOME");
    obj.label31:setName("label31");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout5);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(55);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(225);
    obj.edit37:setHeight(25);
    obj.edit37:setField("nome4");
    obj.edit37:setName("edit37");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout5);
    obj.label32:setLeft(5);
    obj.label32:setTop(30);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setText("ARMA");
    obj.label32:setName("label32");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(55);
    obj.edit38:setTop(30);
    obj.edit38:setWidth(225);
    obj.edit38:setHeight(25);
    obj.edit38:setField("arma4");
    obj.edit38:setName("edit38");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout5);
    obj.label33:setLeft(5);
    obj.label33:setTop(55);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setText("TIPO");
    obj.label33:setName("label33");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(55);
    obj.edit39:setTop(55);
    obj.edit39:setWidth(225);
    obj.edit39:setHeight(25);
    obj.edit39:setField("tipo4");
    obj.edit39:setName("edit39");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout5);
    obj.button13:setLeft(279);
    obj.button13:setTop(6);
    obj.button13:setWidth(73);
    obj.button13:setText("ATAQUE");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setType("number");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(352);
    obj.edit40:setTop(5);
    obj.edit40:setWidth(82);
    obj.edit40:setHeight(25);
    obj.edit40:setField("ataque4");
    obj.edit40:setName("edit40");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout5);
    obj.checkBox4:setLeft(434);
    obj.checkBox4:setTop(6);
    obj.checkBox4:setWidth(150);
    obj.checkBox4:setField("double4");
    obj.checkBox4:setText("Ataque Total");
    obj.checkBox4:setName("checkBox4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout5);
    obj.dataLink4:setFields({'ataque4','double4'});
    obj.dataLink4:setName("dataLink4");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout5);
    obj.button14:setLeft(279);
    obj.button14:setTop(31);
    obj.button14:setWidth(73);
    obj.button14:setText("DANO");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout5);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(352);
    obj.edit41:setTop(30);
    obj.edit41:setWidth(82);
    obj.edit41:setHeight(25);
    obj.edit41:setField("dano4");
    obj.edit41:setName("edit41");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout5);
    obj.button15:setLeft(434);
    obj.button15:setTop(31);
    obj.button15:setWidth(60);
    obj.button15:setText("CRITICO");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout5);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(493);
    obj.edit42:setTop(30);
    obj.edit42:setWidth(82);
    obj.edit42:setHeight(25);
    obj.edit42:setField("danoCritico4");
    obj.edit42:setName("edit42");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(290);
    obj.label34:setTop(55);
    obj.label34:setWidth(70);
    obj.label34:setHeight(25);
    obj.label34:setText("DECISIVO");
    obj.label34:setName("label34");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout5);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(352);
    obj.edit43:setTop(55);
    obj.edit43:setWidth(82);
    obj.edit43:setHeight(25);
    obj.edit43:setField("decisivo4");
    obj.edit43:setName("edit43");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout5);
    obj.label35:setLeft(445);
    obj.label35:setTop(55);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setText("MULTI");
    obj.label35:setName("label35");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout5);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(493);
    obj.edit44:setTop(55);
    obj.edit44:setWidth(82);
    obj.edit44:setHeight(25);
    obj.edit44:setField("multiplicador4");
    obj.edit44:setName("edit44");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(580);
    obj.label36:setTop(5);
    obj.label36:setWidth(80);
    obj.label36:setHeight(25);
    obj.label36:setText("CATEGORIA");
    obj.label36:setName("label36");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout5);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(660);
    obj.edit45:setTop(5);
    obj.edit45:setWidth(200);
    obj.edit45:setHeight(25);
    obj.edit45:setField("categoria4");
    obj.edit45:setName("edit45");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(610);
    obj.label37:setTop(30);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setText("OBS");
    obj.label37:setName("label37");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout5);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(660);
    obj.edit46:setTop(30);
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(25);
    obj.edit46:setField("obs4");
    obj.edit46:setName("edit46");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(590);
    obj.label38:setTop(55);
    obj.label38:setWidth(80);
    obj.label38:setHeight(25);
    obj.label38:setText("MUNIÇÃO");
    obj.label38:setName("label38");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout5);
    obj.edit47:setType("number");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(660);
    obj.edit47:setTop(55);
    obj.edit47:setWidth(69);
    obj.edit47:setHeight(25);
    obj.edit47:setField("municao4");
    obj.edit47:setName("edit47");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(735);
    obj.label39:setTop(55);
    obj.label39:setWidth(70);
    obj.label39:setHeight(25);
    obj.label39:setText("ALCANCE");
    obj.label39:setName("label39");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout5);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(795);
    obj.edit48:setTop(55);
    obj.edit48:setWidth(65);
    obj.edit48:setHeight(25);
    obj.edit48:setField("alcance4");
    obj.edit48:setName("edit48");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout5);
    obj.rectangle9:setLeft(869);
    obj.rectangle9:setTop(4);
    obj.rectangle9:setWidth(332);
    obj.rectangle9:setHeight(77);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(870);
    obj.label40:setTop(25);
    obj.label40:setWidth(330);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setText("Clique para adicionar imagem");
    obj.label40:setName("label40");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout5);
    obj.image4:setField("imagemArma4");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setLeft(870);
    obj.image4:setTop(5);
    obj.image4:setWidth(330);
    obj.image4:setHeight(75);
    obj.image4:setName("image4");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout5);
    obj.button16:setLeft(1205);
    obj.button16:setTop(5);
    obj.button16:setWidth(25);
    obj.button16:setHeight(75);
    obj.button16:setText("X");
    obj.button16:setFontSize(15);
    obj.button16:setHint("Apaga o ataque.");
    obj.button16:setName("button16");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(383);
    obj.layout6:setWidth(1232);
    obj.layout6:setHeight(92);
    obj.layout6:setName("layout6");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout6);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(5);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("NOME");
    obj.label41:setName("label41");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout6);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(55);
    obj.edit49:setTop(5);
    obj.edit49:setWidth(225);
    obj.edit49:setHeight(25);
    obj.edit49:setField("nome5");
    obj.edit49:setName("edit49");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(5);
    obj.label42:setTop(30);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("ARMA");
    obj.label42:setName("label42");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout6);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(55);
    obj.edit50:setTop(30);
    obj.edit50:setWidth(225);
    obj.edit50:setHeight(25);
    obj.edit50:setField("arma5");
    obj.edit50:setName("edit50");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout6);
    obj.label43:setLeft(5);
    obj.label43:setTop(55);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setText("TIPO");
    obj.label43:setName("label43");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout6);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(55);
    obj.edit51:setTop(55);
    obj.edit51:setWidth(225);
    obj.edit51:setHeight(25);
    obj.edit51:setField("tipo5");
    obj.edit51:setName("edit51");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout6);
    obj.button17:setLeft(279);
    obj.button17:setTop(6);
    obj.button17:setWidth(73);
    obj.button17:setText("ATAQUE");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout6);
    obj.edit52:setType("number");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(352);
    obj.edit52:setTop(5);
    obj.edit52:setWidth(82);
    obj.edit52:setHeight(25);
    obj.edit52:setField("ataque5");
    obj.edit52:setName("edit52");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout6);
    obj.checkBox5:setLeft(434);
    obj.checkBox5:setTop(6);
    obj.checkBox5:setWidth(150);
    obj.checkBox5:setField("double5");
    obj.checkBox5:setText("Ataque Total");
    obj.checkBox5:setName("checkBox5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout6);
    obj.dataLink5:setFields({'ataque5','double5'});
    obj.dataLink5:setName("dataLink5");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout6);
    obj.button18:setLeft(279);
    obj.button18:setTop(31);
    obj.button18:setWidth(73);
    obj.button18:setText("DANO");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout6);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(352);
    obj.edit53:setTop(30);
    obj.edit53:setWidth(82);
    obj.edit53:setHeight(25);
    obj.edit53:setField("dano5");
    obj.edit53:setName("edit53");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout6);
    obj.button19:setLeft(434);
    obj.button19:setTop(31);
    obj.button19:setWidth(60);
    obj.button19:setText("CRITICO");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout6);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(493);
    obj.edit54:setTop(30);
    obj.edit54:setWidth(82);
    obj.edit54:setHeight(25);
    obj.edit54:setField("danoCritico5");
    obj.edit54:setName("edit54");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout6);
    obj.label44:setLeft(290);
    obj.label44:setTop(55);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("DECISIVO");
    obj.label44:setName("label44");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout6);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(352);
    obj.edit55:setTop(55);
    obj.edit55:setWidth(82);
    obj.edit55:setHeight(25);
    obj.edit55:setField("decisivo5");
    obj.edit55:setName("edit55");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout6);
    obj.label45:setLeft(445);
    obj.label45:setTop(55);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setText("MULTI");
    obj.label45:setName("label45");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout6);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(493);
    obj.edit56:setTop(55);
    obj.edit56:setWidth(82);
    obj.edit56:setHeight(25);
    obj.edit56:setField("multiplicador5");
    obj.edit56:setName("edit56");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout6);
    obj.label46:setLeft(580);
    obj.label46:setTop(5);
    obj.label46:setWidth(80);
    obj.label46:setHeight(25);
    obj.label46:setText("CATEGORIA");
    obj.label46:setName("label46");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout6);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(660);
    obj.edit57:setTop(5);
    obj.edit57:setWidth(200);
    obj.edit57:setHeight(25);
    obj.edit57:setField("categoria5");
    obj.edit57:setName("edit57");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout6);
    obj.label47:setLeft(610);
    obj.label47:setTop(30);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setText("OBS");
    obj.label47:setName("label47");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout6);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(660);
    obj.edit58:setTop(30);
    obj.edit58:setWidth(200);
    obj.edit58:setHeight(25);
    obj.edit58:setField("obs5");
    obj.edit58:setName("edit58");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout6);
    obj.label48:setLeft(590);
    obj.label48:setTop(55);
    obj.label48:setWidth(80);
    obj.label48:setHeight(25);
    obj.label48:setText("MUNIÇÃO");
    obj.label48:setName("label48");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout6);
    obj.edit59:setType("number");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(660);
    obj.edit59:setTop(55);
    obj.edit59:setWidth(69);
    obj.edit59:setHeight(25);
    obj.edit59:setField("municao5");
    obj.edit59:setName("edit59");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(735);
    obj.label49:setTop(55);
    obj.label49:setWidth(70);
    obj.label49:setHeight(25);
    obj.label49:setText("ALCANCE");
    obj.label49:setName("label49");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout6);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(795);
    obj.edit60:setTop(55);
    obj.edit60:setWidth(65);
    obj.edit60:setHeight(25);
    obj.edit60:setField("alcance5");
    obj.edit60:setName("edit60");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout6);
    obj.rectangle11:setLeft(869);
    obj.rectangle11:setTop(4);
    obj.rectangle11:setWidth(332);
    obj.rectangle11:setHeight(77);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(870);
    obj.label50:setTop(25);
    obj.label50:setWidth(330);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Clique para adicionar imagem");
    obj.label50:setName("label50");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout6);
    obj.image5:setField("imagemArma5");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setLeft(870);
    obj.image5:setTop(5);
    obj.image5:setWidth(330);
    obj.image5:setHeight(75);
    obj.image5:setName("image5");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout6);
    obj.button20:setLeft(1205);
    obj.button20:setTop(5);
    obj.button20:setWidth(25);
    obj.button20:setHeight(75);
    obj.button20:setText("X");
    obj.button20:setFontSize(15);
    obj.button20:setHint("Apaga o ataque.");
    obj.button20:setName("button20");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(2);
    obj.layout7:setTop(478);
    obj.layout7:setWidth(1232);
    obj.layout7:setHeight(92);
    obj.layout7:setName("layout7");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout7);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout7);
    obj.label51:setLeft(5);
    obj.label51:setTop(5);
    obj.label51:setWidth(50);
    obj.label51:setHeight(25);
    obj.label51:setText("NOME");
    obj.label51:setName("label51");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout7);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(55);
    obj.edit61:setTop(5);
    obj.edit61:setWidth(225);
    obj.edit61:setHeight(25);
    obj.edit61:setField("nome6");
    obj.edit61:setName("edit61");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout7);
    obj.label52:setLeft(5);
    obj.label52:setTop(30);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setText("ARMA");
    obj.label52:setName("label52");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout7);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(55);
    obj.edit62:setTop(30);
    obj.edit62:setWidth(225);
    obj.edit62:setHeight(25);
    obj.edit62:setField("arma6");
    obj.edit62:setName("edit62");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout7);
    obj.label53:setLeft(5);
    obj.label53:setTop(55);
    obj.label53:setWidth(50);
    obj.label53:setHeight(25);
    obj.label53:setText("TIPO");
    obj.label53:setName("label53");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout7);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(55);
    obj.edit63:setTop(55);
    obj.edit63:setWidth(225);
    obj.edit63:setHeight(25);
    obj.edit63:setField("tipo6");
    obj.edit63:setName("edit63");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout7);
    obj.button21:setLeft(279);
    obj.button21:setTop(6);
    obj.button21:setWidth(73);
    obj.button21:setText("ATAQUE");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout7);
    obj.edit64:setType("number");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(352);
    obj.edit64:setTop(5);
    obj.edit64:setWidth(82);
    obj.edit64:setHeight(25);
    obj.edit64:setField("ataque6");
    obj.edit64:setName("edit64");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout7);
    obj.checkBox6:setLeft(434);
    obj.checkBox6:setTop(6);
    obj.checkBox6:setWidth(150);
    obj.checkBox6:setField("double6");
    obj.checkBox6:setText("Ataque Total");
    obj.checkBox6:setName("checkBox6");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout7);
    obj.dataLink6:setFields({'ataque6','double6'});
    obj.dataLink6:setName("dataLink6");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout7);
    obj.button22:setLeft(279);
    obj.button22:setTop(31);
    obj.button22:setWidth(73);
    obj.button22:setText("DANO");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout7);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(352);
    obj.edit65:setTop(30);
    obj.edit65:setWidth(82);
    obj.edit65:setHeight(25);
    obj.edit65:setField("dano6");
    obj.edit65:setName("edit65");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout7);
    obj.button23:setLeft(434);
    obj.button23:setTop(31);
    obj.button23:setWidth(60);
    obj.button23:setText("CRITICO");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout7);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(493);
    obj.edit66:setTop(30);
    obj.edit66:setWidth(82);
    obj.edit66:setHeight(25);
    obj.edit66:setField("danoCritico6");
    obj.edit66:setName("edit66");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout7);
    obj.label54:setLeft(290);
    obj.label54:setTop(55);
    obj.label54:setWidth(70);
    obj.label54:setHeight(25);
    obj.label54:setText("DECISIVO");
    obj.label54:setName("label54");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout7);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(352);
    obj.edit67:setTop(55);
    obj.edit67:setWidth(82);
    obj.edit67:setHeight(25);
    obj.edit67:setField("decisivo6");
    obj.edit67:setName("edit67");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout7);
    obj.label55:setLeft(445);
    obj.label55:setTop(55);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setText("MULTI");
    obj.label55:setName("label55");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout7);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(493);
    obj.edit68:setTop(55);
    obj.edit68:setWidth(82);
    obj.edit68:setHeight(25);
    obj.edit68:setField("multiplicador6");
    obj.edit68:setName("edit68");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout7);
    obj.label56:setLeft(580);
    obj.label56:setTop(5);
    obj.label56:setWidth(80);
    obj.label56:setHeight(25);
    obj.label56:setText("CATEGORIA");
    obj.label56:setName("label56");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout7);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(660);
    obj.edit69:setTop(5);
    obj.edit69:setWidth(200);
    obj.edit69:setHeight(25);
    obj.edit69:setField("categoria6");
    obj.edit69:setName("edit69");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout7);
    obj.label57:setLeft(610);
    obj.label57:setTop(30);
    obj.label57:setWidth(50);
    obj.label57:setHeight(25);
    obj.label57:setText("OBS");
    obj.label57:setName("label57");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout7);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(660);
    obj.edit70:setTop(30);
    obj.edit70:setWidth(200);
    obj.edit70:setHeight(25);
    obj.edit70:setField("obs6");
    obj.edit70:setName("edit70");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout7);
    obj.label58:setLeft(590);
    obj.label58:setTop(55);
    obj.label58:setWidth(80);
    obj.label58:setHeight(25);
    obj.label58:setText("MUNIÇÃO");
    obj.label58:setName("label58");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout7);
    obj.edit71:setType("number");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(660);
    obj.edit71:setTop(55);
    obj.edit71:setWidth(69);
    obj.edit71:setHeight(25);
    obj.edit71:setField("municao6");
    obj.edit71:setName("edit71");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout7);
    obj.label59:setLeft(735);
    obj.label59:setTop(55);
    obj.label59:setWidth(70);
    obj.label59:setHeight(25);
    obj.label59:setText("ALCANCE");
    obj.label59:setName("label59");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout7);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(795);
    obj.edit72:setTop(55);
    obj.edit72:setWidth(65);
    obj.edit72:setHeight(25);
    obj.edit72:setField("alcance6");
    obj.edit72:setName("edit72");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout7);
    obj.rectangle13:setLeft(869);
    obj.rectangle13:setTop(4);
    obj.rectangle13:setWidth(332);
    obj.rectangle13:setHeight(77);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setLeft(870);
    obj.label60:setTop(25);
    obj.label60:setWidth(330);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Clique para adicionar imagem");
    obj.label60:setName("label60");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout7);
    obj.image6:setField("imagemArma6");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setLeft(870);
    obj.image6:setTop(5);
    obj.image6:setWidth(330);
    obj.image6:setHeight(75);
    obj.image6:setName("image6");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout7);
    obj.button24:setLeft(1205);
    obj.button24:setTop(5);
    obj.button24:setWidth(25);
    obj.button24:setHeight(75);
    obj.button24:setText("X");
    obj.button24:setFontSize(15);
    obj.button24:setHint("Apaga o ataque.");
    obj.button24:setName("button24");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(2);
    obj.layout8:setTop(573);
    obj.layout8:setWidth(1232);
    obj.layout8:setHeight(92);
    obj.layout8:setName("layout8");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout8);
    obj.label61:setLeft(5);
    obj.label61:setTop(5);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setText("NOME");
    obj.label61:setName("label61");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout8);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(55);
    obj.edit73:setTop(5);
    obj.edit73:setWidth(225);
    obj.edit73:setHeight(25);
    obj.edit73:setField("nome7");
    obj.edit73:setName("edit73");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout8);
    obj.label62:setLeft(5);
    obj.label62:setTop(30);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setText("ARMA");
    obj.label62:setName("label62");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout8);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(55);
    obj.edit74:setTop(30);
    obj.edit74:setWidth(225);
    obj.edit74:setHeight(25);
    obj.edit74:setField("arma7");
    obj.edit74:setName("edit74");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout8);
    obj.label63:setLeft(5);
    obj.label63:setTop(55);
    obj.label63:setWidth(50);
    obj.label63:setHeight(25);
    obj.label63:setText("TIPO");
    obj.label63:setName("label63");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout8);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(55);
    obj.edit75:setTop(55);
    obj.edit75:setWidth(225);
    obj.edit75:setHeight(25);
    obj.edit75:setField("tipo7");
    obj.edit75:setName("edit75");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout8);
    obj.button25:setLeft(279);
    obj.button25:setTop(6);
    obj.button25:setWidth(73);
    obj.button25:setText("ATAQUE");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout8);
    obj.edit76:setType("number");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(352);
    obj.edit76:setTop(5);
    obj.edit76:setWidth(82);
    obj.edit76:setHeight(25);
    obj.edit76:setField("ataque7");
    obj.edit76:setName("edit76");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout8);
    obj.checkBox7:setLeft(434);
    obj.checkBox7:setTop(6);
    obj.checkBox7:setWidth(150);
    obj.checkBox7:setField("double7");
    obj.checkBox7:setText("Ataque Total");
    obj.checkBox7:setName("checkBox7");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout8);
    obj.dataLink7:setFields({'ataque7','double7'});
    obj.dataLink7:setName("dataLink7");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout8);
    obj.button26:setLeft(279);
    obj.button26:setTop(31);
    obj.button26:setWidth(73);
    obj.button26:setText("DANO");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout8);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(352);
    obj.edit77:setTop(30);
    obj.edit77:setWidth(82);
    obj.edit77:setHeight(25);
    obj.edit77:setField("dano7");
    obj.edit77:setName("edit77");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout8);
    obj.button27:setLeft(434);
    obj.button27:setTop(31);
    obj.button27:setWidth(60);
    obj.button27:setText("CRITICO");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout8);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(493);
    obj.edit78:setTop(30);
    obj.edit78:setWidth(82);
    obj.edit78:setHeight(25);
    obj.edit78:setField("danoCritico7");
    obj.edit78:setName("edit78");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout8);
    obj.label64:setLeft(290);
    obj.label64:setTop(55);
    obj.label64:setWidth(70);
    obj.label64:setHeight(25);
    obj.label64:setText("DECISIVO");
    obj.label64:setName("label64");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout8);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(352);
    obj.edit79:setTop(55);
    obj.edit79:setWidth(82);
    obj.edit79:setHeight(25);
    obj.edit79:setField("decisivo7");
    obj.edit79:setName("edit79");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout8);
    obj.label65:setLeft(445);
    obj.label65:setTop(55);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setText("MULTI");
    obj.label65:setName("label65");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout8);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(493);
    obj.edit80:setTop(55);
    obj.edit80:setWidth(82);
    obj.edit80:setHeight(25);
    obj.edit80:setField("multiplicador7");
    obj.edit80:setName("edit80");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout8);
    obj.label66:setLeft(580);
    obj.label66:setTop(5);
    obj.label66:setWidth(80);
    obj.label66:setHeight(25);
    obj.label66:setText("CATEGORIA");
    obj.label66:setName("label66");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout8);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(660);
    obj.edit81:setTop(5);
    obj.edit81:setWidth(200);
    obj.edit81:setHeight(25);
    obj.edit81:setField("categoria7");
    obj.edit81:setName("edit81");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout8);
    obj.label67:setLeft(610);
    obj.label67:setTop(30);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setText("OBS");
    obj.label67:setName("label67");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout8);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(660);
    obj.edit82:setTop(30);
    obj.edit82:setWidth(200);
    obj.edit82:setHeight(25);
    obj.edit82:setField("obs7");
    obj.edit82:setName("edit82");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout8);
    obj.label68:setLeft(590);
    obj.label68:setTop(55);
    obj.label68:setWidth(80);
    obj.label68:setHeight(25);
    obj.label68:setText("MUNIÇÃO");
    obj.label68:setName("label68");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout8);
    obj.edit83:setType("number");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(660);
    obj.edit83:setTop(55);
    obj.edit83:setWidth(69);
    obj.edit83:setHeight(25);
    obj.edit83:setField("municao7");
    obj.edit83:setName("edit83");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout8);
    obj.label69:setLeft(735);
    obj.label69:setTop(55);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("ALCANCE");
    obj.label69:setName("label69");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout8);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(795);
    obj.edit84:setTop(55);
    obj.edit84:setWidth(65);
    obj.edit84:setHeight(25);
    obj.edit84:setField("alcance7");
    obj.edit84:setName("edit84");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout8);
    obj.rectangle15:setLeft(869);
    obj.rectangle15:setTop(4);
    obj.rectangle15:setWidth(332);
    obj.rectangle15:setHeight(77);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout8);
    obj.label70:setLeft(870);
    obj.label70:setTop(25);
    obj.label70:setWidth(330);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Clique para adicionar imagem");
    obj.label70:setName("label70");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout8);
    obj.image7:setField("imagemArma7");
    obj.image7:setEditable(true);
    obj.image7:setStyle("autoFit");
    obj.image7:setLeft(870);
    obj.image7:setTop(5);
    obj.image7:setWidth(330);
    obj.image7:setHeight(75);
    obj.image7:setName("image7");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout8);
    obj.button28:setLeft(1205);
    obj.button28:setTop(5);
    obj.button28:setWidth(25);
    obj.button28:setHeight(75);
    obj.button28:setText("X");
    obj.button28:setFontSize(15);
    obj.button28:setHint("Apaga o ataque.");
    obj.button28:setName("button28");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(2);
    obj.layout9:setTop(668);
    obj.layout9:setWidth(1232);
    obj.layout9:setHeight(92);
    obj.layout9:setName("layout9");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout9);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout9);
    obj.label71:setLeft(5);
    obj.label71:setTop(5);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setText("NOME");
    obj.label71:setName("label71");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout9);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(55);
    obj.edit85:setTop(5);
    obj.edit85:setWidth(225);
    obj.edit85:setHeight(25);
    obj.edit85:setField("nome8");
    obj.edit85:setName("edit85");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout9);
    obj.label72:setLeft(5);
    obj.label72:setTop(30);
    obj.label72:setWidth(50);
    obj.label72:setHeight(25);
    obj.label72:setText("ARMA");
    obj.label72:setName("label72");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout9);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(55);
    obj.edit86:setTop(30);
    obj.edit86:setWidth(225);
    obj.edit86:setHeight(25);
    obj.edit86:setField("arma8");
    obj.edit86:setName("edit86");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout9);
    obj.label73:setLeft(5);
    obj.label73:setTop(55);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setText("TIPO");
    obj.label73:setName("label73");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout9);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(55);
    obj.edit87:setTop(55);
    obj.edit87:setWidth(225);
    obj.edit87:setHeight(25);
    obj.edit87:setField("tipo8");
    obj.edit87:setName("edit87");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout9);
    obj.button29:setLeft(279);
    obj.button29:setTop(6);
    obj.button29:setWidth(73);
    obj.button29:setText("ATAQUE");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout9);
    obj.edit88:setType("number");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(352);
    obj.edit88:setTop(5);
    obj.edit88:setWidth(82);
    obj.edit88:setHeight(25);
    obj.edit88:setField("ataque8");
    obj.edit88:setName("edit88");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout9);
    obj.checkBox8:setLeft(434);
    obj.checkBox8:setTop(6);
    obj.checkBox8:setWidth(150);
    obj.checkBox8:setField("double8");
    obj.checkBox8:setText("Ataque Total");
    obj.checkBox8:setName("checkBox8");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout9);
    obj.dataLink8:setFields({'ataque8','double8'});
    obj.dataLink8:setName("dataLink8");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout9);
    obj.button30:setLeft(279);
    obj.button30:setTop(31);
    obj.button30:setWidth(73);
    obj.button30:setText("DANO");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout9);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(352);
    obj.edit89:setTop(30);
    obj.edit89:setWidth(82);
    obj.edit89:setHeight(25);
    obj.edit89:setField("dano8");
    obj.edit89:setName("edit89");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout9);
    obj.button31:setLeft(434);
    obj.button31:setTop(31);
    obj.button31:setWidth(60);
    obj.button31:setText("CRITICO");
    obj.button31:setFontSize(11);
    obj.button31:setName("button31");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout9);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(493);
    obj.edit90:setTop(30);
    obj.edit90:setWidth(82);
    obj.edit90:setHeight(25);
    obj.edit90:setField("danoCritico8");
    obj.edit90:setName("edit90");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setLeft(290);
    obj.label74:setTop(55);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("DECISIVO");
    obj.label74:setName("label74");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout9);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(352);
    obj.edit91:setTop(55);
    obj.edit91:setWidth(82);
    obj.edit91:setHeight(25);
    obj.edit91:setField("decisivo8");
    obj.edit91:setName("edit91");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setLeft(445);
    obj.label75:setTop(55);
    obj.label75:setWidth(50);
    obj.label75:setHeight(25);
    obj.label75:setText("MULTI");
    obj.label75:setName("label75");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout9);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(493);
    obj.edit92:setTop(55);
    obj.edit92:setWidth(82);
    obj.edit92:setHeight(25);
    obj.edit92:setField("multiplicador8");
    obj.edit92:setName("edit92");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setLeft(580);
    obj.label76:setTop(5);
    obj.label76:setWidth(80);
    obj.label76:setHeight(25);
    obj.label76:setText("CATEGORIA");
    obj.label76:setName("label76");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout9);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(660);
    obj.edit93:setTop(5);
    obj.edit93:setWidth(200);
    obj.edit93:setHeight(25);
    obj.edit93:setField("categoria8");
    obj.edit93:setName("edit93");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setLeft(610);
    obj.label77:setTop(30);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setText("OBS");
    obj.label77:setName("label77");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout9);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(660);
    obj.edit94:setTop(30);
    obj.edit94:setWidth(200);
    obj.edit94:setHeight(25);
    obj.edit94:setField("obs8");
    obj.edit94:setName("edit94");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setLeft(590);
    obj.label78:setTop(55);
    obj.label78:setWidth(80);
    obj.label78:setHeight(25);
    obj.label78:setText("MUNIÇÃO");
    obj.label78:setName("label78");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout9);
    obj.edit95:setType("number");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(660);
    obj.edit95:setTop(55);
    obj.edit95:setWidth(69);
    obj.edit95:setHeight(25);
    obj.edit95:setField("municao8");
    obj.edit95:setName("edit95");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout9);
    obj.label79:setLeft(735);
    obj.label79:setTop(55);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("ALCANCE");
    obj.label79:setName("label79");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout9);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(795);
    obj.edit96:setTop(55);
    obj.edit96:setWidth(65);
    obj.edit96:setHeight(25);
    obj.edit96:setField("alcance8");
    obj.edit96:setName("edit96");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout9);
    obj.rectangle17:setLeft(869);
    obj.rectangle17:setTop(4);
    obj.rectangle17:setWidth(332);
    obj.rectangle17:setHeight(77);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout9);
    obj.label80:setLeft(870);
    obj.label80:setTop(25);
    obj.label80:setWidth(330);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Clique para adicionar imagem");
    obj.label80:setName("label80");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout9);
    obj.image8:setField("imagemArma8");
    obj.image8:setEditable(true);
    obj.image8:setStyle("autoFit");
    obj.image8:setLeft(870);
    obj.image8:setTop(5);
    obj.image8:setWidth(330);
    obj.image8:setHeight(75);
    obj.image8:setName("image8");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout9);
    obj.button32:setLeft(1205);
    obj.button32:setTop(5);
    obj.button32:setWidth(25);
    obj.button32:setHeight(75);
    obj.button32:setText("X");
    obj.button32:setFontSize(15);
    obj.button32:setHint("Apaga o ataque.");
    obj.button32:setName("button32");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(2);
    obj.layout10:setTop(763);
    obj.layout10:setWidth(1232);
    obj.layout10:setHeight(92);
    obj.layout10:setName("layout10");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout10);
    obj.label81:setLeft(5);
    obj.label81:setTop(5);
    obj.label81:setWidth(50);
    obj.label81:setHeight(25);
    obj.label81:setText("NOME");
    obj.label81:setName("label81");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout10);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(55);
    obj.edit97:setTop(5);
    obj.edit97:setWidth(225);
    obj.edit97:setHeight(25);
    obj.edit97:setField("nome9");
    obj.edit97:setName("edit97");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setLeft(5);
    obj.label82:setTop(30);
    obj.label82:setWidth(50);
    obj.label82:setHeight(25);
    obj.label82:setText("ARMA");
    obj.label82:setName("label82");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout10);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(55);
    obj.edit98:setTop(30);
    obj.edit98:setWidth(225);
    obj.edit98:setHeight(25);
    obj.edit98:setField("arma9");
    obj.edit98:setName("edit98");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(5);
    obj.label83:setTop(55);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setText("TIPO");
    obj.label83:setName("label83");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout10);
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(55);
    obj.edit99:setTop(55);
    obj.edit99:setWidth(225);
    obj.edit99:setHeight(25);
    obj.edit99:setField("tipo9");
    obj.edit99:setName("edit99");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout10);
    obj.button33:setLeft(279);
    obj.button33:setTop(6);
    obj.button33:setWidth(73);
    obj.button33:setText("ATAQUE");
    obj.button33:setFontSize(11);
    obj.button33:setName("button33");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout10);
    obj.edit100:setType("number");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(352);
    obj.edit100:setTop(5);
    obj.edit100:setWidth(82);
    obj.edit100:setHeight(25);
    obj.edit100:setField("ataque9");
    obj.edit100:setName("edit100");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout10);
    obj.checkBox9:setLeft(434);
    obj.checkBox9:setTop(6);
    obj.checkBox9:setWidth(150);
    obj.checkBox9:setField("double9");
    obj.checkBox9:setText("Ataque Total");
    obj.checkBox9:setName("checkBox9");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout10);
    obj.dataLink9:setFields({'ataque9','double9'});
    obj.dataLink9:setName("dataLink9");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout10);
    obj.button34:setLeft(279);
    obj.button34:setTop(31);
    obj.button34:setWidth(73);
    obj.button34:setText("DANO");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout10);
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(352);
    obj.edit101:setTop(30);
    obj.edit101:setWidth(82);
    obj.edit101:setHeight(25);
    obj.edit101:setField("dano9");
    obj.edit101:setName("edit101");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout10);
    obj.button35:setLeft(434);
    obj.button35:setTop(31);
    obj.button35:setWidth(60);
    obj.button35:setText("CRITICO");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout10);
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(493);
    obj.edit102:setTop(30);
    obj.edit102:setWidth(82);
    obj.edit102:setHeight(25);
    obj.edit102:setField("danoCritico9");
    obj.edit102:setName("edit102");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout10);
    obj.label84:setLeft(290);
    obj.label84:setTop(55);
    obj.label84:setWidth(70);
    obj.label84:setHeight(25);
    obj.label84:setText("DECISIVO");
    obj.label84:setName("label84");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout10);
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(352);
    obj.edit103:setTop(55);
    obj.edit103:setWidth(82);
    obj.edit103:setHeight(25);
    obj.edit103:setField("decisivo9");
    obj.edit103:setName("edit103");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setLeft(445);
    obj.label85:setTop(55);
    obj.label85:setWidth(50);
    obj.label85:setHeight(25);
    obj.label85:setText("MULTI");
    obj.label85:setName("label85");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout10);
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(493);
    obj.edit104:setTop(55);
    obj.edit104:setWidth(82);
    obj.edit104:setHeight(25);
    obj.edit104:setField("multiplicador9");
    obj.edit104:setName("edit104");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setLeft(580);
    obj.label86:setTop(5);
    obj.label86:setWidth(80);
    obj.label86:setHeight(25);
    obj.label86:setText("CATEGORIA");
    obj.label86:setName("label86");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout10);
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(660);
    obj.edit105:setTop(5);
    obj.edit105:setWidth(200);
    obj.edit105:setHeight(25);
    obj.edit105:setField("categoria9");
    obj.edit105:setName("edit105");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setLeft(610);
    obj.label87:setTop(30);
    obj.label87:setWidth(50);
    obj.label87:setHeight(25);
    obj.label87:setText("OBS");
    obj.label87:setName("label87");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout10);
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(660);
    obj.edit106:setTop(30);
    obj.edit106:setWidth(200);
    obj.edit106:setHeight(25);
    obj.edit106:setField("obs9");
    obj.edit106:setName("edit106");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setLeft(590);
    obj.label88:setTop(55);
    obj.label88:setWidth(80);
    obj.label88:setHeight(25);
    obj.label88:setText("MUNIÇÃO");
    obj.label88:setName("label88");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout10);
    obj.edit107:setType("number");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(660);
    obj.edit107:setTop(55);
    obj.edit107:setWidth(69);
    obj.edit107:setHeight(25);
    obj.edit107:setField("municao9");
    obj.edit107:setName("edit107");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setLeft(735);
    obj.label89:setTop(55);
    obj.label89:setWidth(70);
    obj.label89:setHeight(25);
    obj.label89:setText("ALCANCE");
    obj.label89:setName("label89");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout10);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(795);
    obj.edit108:setTop(55);
    obj.edit108:setWidth(65);
    obj.edit108:setHeight(25);
    obj.edit108:setField("alcance9");
    obj.edit108:setName("edit108");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setLeft(869);
    obj.rectangle19:setTop(4);
    obj.rectangle19:setWidth(332);
    obj.rectangle19:setHeight(77);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout10);
    obj.label90:setLeft(870);
    obj.label90:setTop(25);
    obj.label90:setWidth(330);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("Clique para adicionar imagem");
    obj.label90:setName("label90");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout10);
    obj.image9:setField("imagemArma9");
    obj.image9:setEditable(true);
    obj.image9:setStyle("autoFit");
    obj.image9:setLeft(870);
    obj.image9:setTop(5);
    obj.image9:setWidth(330);
    obj.image9:setHeight(75);
    obj.image9:setName("image9");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout10);
    obj.button36:setLeft(1205);
    obj.button36:setTop(5);
    obj.button36:setWidth(25);
    obj.button36:setHeight(75);
    obj.button36:setText("X");
    obj.button36:setFontSize(15);
    obj.button36:setHint("Apaga o ataque.");
    obj.button36:setName("button36");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(2);
    obj.layout11:setTop(858);
    obj.layout11:setWidth(1232);
    obj.layout11:setHeight(92);
    obj.layout11:setName("layout11");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout11);
    obj.label91:setLeft(5);
    obj.label91:setTop(5);
    obj.label91:setWidth(50);
    obj.label91:setHeight(25);
    obj.label91:setText("NOME");
    obj.label91:setName("label91");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout11);
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(55);
    obj.edit109:setTop(5);
    obj.edit109:setWidth(225);
    obj.edit109:setHeight(25);
    obj.edit109:setField("nome10");
    obj.edit109:setName("edit109");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout11);
    obj.label92:setLeft(5);
    obj.label92:setTop(30);
    obj.label92:setWidth(50);
    obj.label92:setHeight(25);
    obj.label92:setText("ARMA");
    obj.label92:setName("label92");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout11);
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(55);
    obj.edit110:setTop(30);
    obj.edit110:setWidth(225);
    obj.edit110:setHeight(25);
    obj.edit110:setField("arma10");
    obj.edit110:setName("edit110");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout11);
    obj.label93:setLeft(5);
    obj.label93:setTop(55);
    obj.label93:setWidth(50);
    obj.label93:setHeight(25);
    obj.label93:setText("TIPO");
    obj.label93:setName("label93");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout11);
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(55);
    obj.edit111:setTop(55);
    obj.edit111:setWidth(225);
    obj.edit111:setHeight(25);
    obj.edit111:setField("tipo10");
    obj.edit111:setName("edit111");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout11);
    obj.button37:setLeft(279);
    obj.button37:setTop(6);
    obj.button37:setWidth(73);
    obj.button37:setText("ATAQUE");
    obj.button37:setFontSize(11);
    obj.button37:setName("button37");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout11);
    obj.edit112:setType("number");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(352);
    obj.edit112:setTop(5);
    obj.edit112:setWidth(82);
    obj.edit112:setHeight(25);
    obj.edit112:setField("ataque10");
    obj.edit112:setName("edit112");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout11);
    obj.checkBox10:setLeft(434);
    obj.checkBox10:setTop(6);
    obj.checkBox10:setWidth(150);
    obj.checkBox10:setField("double10");
    obj.checkBox10:setText("Ataque Total");
    obj.checkBox10:setName("checkBox10");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout11);
    obj.dataLink10:setFields({'ataque10','double10'});
    obj.dataLink10:setName("dataLink10");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout11);
    obj.button38:setLeft(279);
    obj.button38:setTop(31);
    obj.button38:setWidth(73);
    obj.button38:setText("DANO");
    obj.button38:setFontSize(11);
    obj.button38:setName("button38");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout11);
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(352);
    obj.edit113:setTop(30);
    obj.edit113:setWidth(82);
    obj.edit113:setHeight(25);
    obj.edit113:setField("dano10");
    obj.edit113:setName("edit113");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout11);
    obj.button39:setLeft(434);
    obj.button39:setTop(31);
    obj.button39:setWidth(60);
    obj.button39:setText("CRITICO");
    obj.button39:setFontSize(11);
    obj.button39:setName("button39");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout11);
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(493);
    obj.edit114:setTop(30);
    obj.edit114:setWidth(82);
    obj.edit114:setHeight(25);
    obj.edit114:setField("danoCritico10");
    obj.edit114:setName("edit114");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout11);
    obj.label94:setLeft(290);
    obj.label94:setTop(55);
    obj.label94:setWidth(70);
    obj.label94:setHeight(25);
    obj.label94:setText("DECISIVO");
    obj.label94:setName("label94");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout11);
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(352);
    obj.edit115:setTop(55);
    obj.edit115:setWidth(82);
    obj.edit115:setHeight(25);
    obj.edit115:setField("decisivo10");
    obj.edit115:setName("edit115");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout11);
    obj.label95:setLeft(445);
    obj.label95:setTop(55);
    obj.label95:setWidth(50);
    obj.label95:setHeight(25);
    obj.label95:setText("MULTI");
    obj.label95:setName("label95");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout11);
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(493);
    obj.edit116:setTop(55);
    obj.edit116:setWidth(82);
    obj.edit116:setHeight(25);
    obj.edit116:setField("multiplicador10");
    obj.edit116:setName("edit116");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout11);
    obj.label96:setLeft(580);
    obj.label96:setTop(5);
    obj.label96:setWidth(80);
    obj.label96:setHeight(25);
    obj.label96:setText("CATEGORIA");
    obj.label96:setName("label96");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout11);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(660);
    obj.edit117:setTop(5);
    obj.edit117:setWidth(200);
    obj.edit117:setHeight(25);
    obj.edit117:setField("categoria10");
    obj.edit117:setName("edit117");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout11);
    obj.label97:setLeft(610);
    obj.label97:setTop(30);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setText("OBS");
    obj.label97:setName("label97");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout11);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(660);
    obj.edit118:setTop(30);
    obj.edit118:setWidth(200);
    obj.edit118:setHeight(25);
    obj.edit118:setField("obs10");
    obj.edit118:setName("edit118");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout11);
    obj.label98:setLeft(590);
    obj.label98:setTop(55);
    obj.label98:setWidth(80);
    obj.label98:setHeight(25);
    obj.label98:setText("MUNIÇÃO");
    obj.label98:setName("label98");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout11);
    obj.edit119:setType("number");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(660);
    obj.edit119:setTop(55);
    obj.edit119:setWidth(69);
    obj.edit119:setHeight(25);
    obj.edit119:setField("municao10");
    obj.edit119:setName("edit119");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout11);
    obj.label99:setLeft(735);
    obj.label99:setTop(55);
    obj.label99:setWidth(70);
    obj.label99:setHeight(25);
    obj.label99:setText("ALCANCE");
    obj.label99:setName("label99");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout11);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(795);
    obj.edit120:setTop(55);
    obj.edit120:setWidth(65);
    obj.edit120:setHeight(25);
    obj.edit120:setField("alcance10");
    obj.edit120:setName("edit120");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setLeft(869);
    obj.rectangle21:setTop(4);
    obj.rectangle21:setWidth(332);
    obj.rectangle21:setHeight(77);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout11);
    obj.label100:setLeft(870);
    obj.label100:setTop(25);
    obj.label100:setWidth(330);
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Clique para adicionar imagem");
    obj.label100:setName("label100");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout11);
    obj.image10:setField("imagemArma10");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setLeft(870);
    obj.image10:setTop(5);
    obj.image10:setWidth(330);
    obj.image10:setHeight(75);
    obj.image10:setName("image10");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout11);
    obj.button40:setLeft(1205);
    obj.button40:setTop(5);
    obj.button40:setWidth(25);
    obj.button40:setHeight(75);
    obj.button40:setText("X");
    obj.button40:setFontSize(15);
    obj.button40:setHint("Apaga o ataque.");
    obj.button40:setName("button40");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(2);
    obj.layout12:setTop(953);
    obj.layout12:setWidth(1232);
    obj.layout12:setHeight(92);
    obj.layout12:setName("layout12");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout12);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout12);
    obj.label101:setLeft(5);
    obj.label101:setTop(5);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setText("NOME");
    obj.label101:setName("label101");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout12);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(55);
    obj.edit121:setTop(5);
    obj.edit121:setWidth(225);
    obj.edit121:setHeight(25);
    obj.edit121:setField("nome11");
    obj.edit121:setName("edit121");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout12);
    obj.label102:setLeft(5);
    obj.label102:setTop(30);
    obj.label102:setWidth(50);
    obj.label102:setHeight(25);
    obj.label102:setText("ARMA");
    obj.label102:setName("label102");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout12);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(55);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(225);
    obj.edit122:setHeight(25);
    obj.edit122:setField("arma11");
    obj.edit122:setName("edit122");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout12);
    obj.label103:setLeft(5);
    obj.label103:setTop(55);
    obj.label103:setWidth(50);
    obj.label103:setHeight(25);
    obj.label103:setText("TIPO");
    obj.label103:setName("label103");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout12);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(55);
    obj.edit123:setTop(55);
    obj.edit123:setWidth(225);
    obj.edit123:setHeight(25);
    obj.edit123:setField("tipo11");
    obj.edit123:setName("edit123");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout12);
    obj.button41:setLeft(279);
    obj.button41:setTop(6);
    obj.button41:setWidth(73);
    obj.button41:setText("ATAQUE");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout12);
    obj.edit124:setType("number");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(352);
    obj.edit124:setTop(5);
    obj.edit124:setWidth(82);
    obj.edit124:setHeight(25);
    obj.edit124:setField("ataque11");
    obj.edit124:setName("edit124");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout12);
    obj.checkBox11:setLeft(434);
    obj.checkBox11:setTop(6);
    obj.checkBox11:setWidth(150);
    obj.checkBox11:setField("double11");
    obj.checkBox11:setText("Ataque Total");
    obj.checkBox11:setName("checkBox11");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout12);
    obj.dataLink11:setFields({'ataque11','double11'});
    obj.dataLink11:setName("dataLink11");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout12);
    obj.button42:setLeft(279);
    obj.button42:setTop(31);
    obj.button42:setWidth(73);
    obj.button42:setText("DANO");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout12);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(352);
    obj.edit125:setTop(30);
    obj.edit125:setWidth(82);
    obj.edit125:setHeight(25);
    obj.edit125:setField("dano11");
    obj.edit125:setName("edit125");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout12);
    obj.button43:setLeft(434);
    obj.button43:setTop(31);
    obj.button43:setWidth(60);
    obj.button43:setText("CRITICO");
    obj.button43:setFontSize(11);
    obj.button43:setName("button43");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout12);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(493);
    obj.edit126:setTop(30);
    obj.edit126:setWidth(82);
    obj.edit126:setHeight(25);
    obj.edit126:setField("danoCritico11");
    obj.edit126:setName("edit126");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout12);
    obj.label104:setLeft(290);
    obj.label104:setTop(55);
    obj.label104:setWidth(70);
    obj.label104:setHeight(25);
    obj.label104:setText("DECISIVO");
    obj.label104:setName("label104");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout12);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(352);
    obj.edit127:setTop(55);
    obj.edit127:setWidth(82);
    obj.edit127:setHeight(25);
    obj.edit127:setField("decisivo11");
    obj.edit127:setName("edit127");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout12);
    obj.label105:setLeft(445);
    obj.label105:setTop(55);
    obj.label105:setWidth(50);
    obj.label105:setHeight(25);
    obj.label105:setText("MULTI");
    obj.label105:setName("label105");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout12);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(493);
    obj.edit128:setTop(55);
    obj.edit128:setWidth(82);
    obj.edit128:setHeight(25);
    obj.edit128:setField("multiplicador11");
    obj.edit128:setName("edit128");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout12);
    obj.label106:setLeft(580);
    obj.label106:setTop(5);
    obj.label106:setWidth(80);
    obj.label106:setHeight(25);
    obj.label106:setText("CATEGORIA");
    obj.label106:setName("label106");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout12);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(660);
    obj.edit129:setTop(5);
    obj.edit129:setWidth(200);
    obj.edit129:setHeight(25);
    obj.edit129:setField("categoria11");
    obj.edit129:setName("edit129");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout12);
    obj.label107:setLeft(610);
    obj.label107:setTop(30);
    obj.label107:setWidth(50);
    obj.label107:setHeight(25);
    obj.label107:setText("OBS");
    obj.label107:setName("label107");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout12);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(660);
    obj.edit130:setTop(30);
    obj.edit130:setWidth(200);
    obj.edit130:setHeight(25);
    obj.edit130:setField("obs11");
    obj.edit130:setName("edit130");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout12);
    obj.label108:setLeft(590);
    obj.label108:setTop(55);
    obj.label108:setWidth(80);
    obj.label108:setHeight(25);
    obj.label108:setText("MUNIÇÃO");
    obj.label108:setName("label108");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout12);
    obj.edit131:setType("number");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(660);
    obj.edit131:setTop(55);
    obj.edit131:setWidth(69);
    obj.edit131:setHeight(25);
    obj.edit131:setField("municao11");
    obj.edit131:setName("edit131");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout12);
    obj.label109:setLeft(735);
    obj.label109:setTop(55);
    obj.label109:setWidth(70);
    obj.label109:setHeight(25);
    obj.label109:setText("ALCANCE");
    obj.label109:setName("label109");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout12);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(795);
    obj.edit132:setTop(55);
    obj.edit132:setWidth(65);
    obj.edit132:setHeight(25);
    obj.edit132:setField("alcance11");
    obj.edit132:setName("edit132");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout12);
    obj.rectangle23:setLeft(869);
    obj.rectangle23:setTop(4);
    obj.rectangle23:setWidth(332);
    obj.rectangle23:setHeight(77);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout12);
    obj.label110:setLeft(870);
    obj.label110:setTop(25);
    obj.label110:setWidth(330);
    obj.label110:setHeight(25);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setText("Clique para adicionar imagem");
    obj.label110:setName("label110");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout12);
    obj.image11:setField("imagemArma11");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setLeft(870);
    obj.image11:setTop(5);
    obj.image11:setWidth(330);
    obj.image11:setHeight(75);
    obj.image11:setName("image11");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout12);
    obj.button44:setLeft(1205);
    obj.button44:setTop(5);
    obj.button44:setWidth(25);
    obj.button44:setHeight(75);
    obj.button44:setText("X");
    obj.button44:setFontSize(15);
    obj.button44:setHint("Apaga o ataque.");
    obj.button44:setName("button44");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(2);
    obj.layout13:setTop(1048);
    obj.layout13:setWidth(1232);
    obj.layout13:setHeight(92);
    obj.layout13:setName("layout13");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout13);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout13);
    obj.label111:setLeft(5);
    obj.label111:setTop(5);
    obj.label111:setWidth(50);
    obj.label111:setHeight(25);
    obj.label111:setText("NOME");
    obj.label111:setName("label111");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout13);
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(55);
    obj.edit133:setTop(5);
    obj.edit133:setWidth(225);
    obj.edit133:setHeight(25);
    obj.edit133:setField("nome12");
    obj.edit133:setName("edit133");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout13);
    obj.label112:setLeft(5);
    obj.label112:setTop(30);
    obj.label112:setWidth(50);
    obj.label112:setHeight(25);
    obj.label112:setText("ARMA");
    obj.label112:setName("label112");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout13);
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(55);
    obj.edit134:setTop(30);
    obj.edit134:setWidth(225);
    obj.edit134:setHeight(25);
    obj.edit134:setField("arma12");
    obj.edit134:setName("edit134");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout13);
    obj.label113:setLeft(5);
    obj.label113:setTop(55);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setText("TIPO");
    obj.label113:setName("label113");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout13);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(55);
    obj.edit135:setTop(55);
    obj.edit135:setWidth(225);
    obj.edit135:setHeight(25);
    obj.edit135:setField("tipo12");
    obj.edit135:setName("edit135");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout13);
    obj.button45:setLeft(279);
    obj.button45:setTop(6);
    obj.button45:setWidth(73);
    obj.button45:setText("ATAQUE");
    obj.button45:setFontSize(11);
    obj.button45:setName("button45");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout13);
    obj.edit136:setType("number");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(352);
    obj.edit136:setTop(5);
    obj.edit136:setWidth(82);
    obj.edit136:setHeight(25);
    obj.edit136:setField("ataque12");
    obj.edit136:setName("edit136");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout13);
    obj.checkBox12:setLeft(434);
    obj.checkBox12:setTop(6);
    obj.checkBox12:setWidth(150);
    obj.checkBox12:setField("double12");
    obj.checkBox12:setText("Ataque Total");
    obj.checkBox12:setName("checkBox12");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout13);
    obj.dataLink12:setFields({'ataque12','double12'});
    obj.dataLink12:setName("dataLink12");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout13);
    obj.button46:setLeft(279);
    obj.button46:setTop(31);
    obj.button46:setWidth(73);
    obj.button46:setText("DANO");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout13);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(352);
    obj.edit137:setTop(30);
    obj.edit137:setWidth(82);
    obj.edit137:setHeight(25);
    obj.edit137:setField("dano12");
    obj.edit137:setName("edit137");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout13);
    obj.button47:setLeft(434);
    obj.button47:setTop(31);
    obj.button47:setWidth(60);
    obj.button47:setText("CRITICO");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout13);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(493);
    obj.edit138:setTop(30);
    obj.edit138:setWidth(82);
    obj.edit138:setHeight(25);
    obj.edit138:setField("danoCritico12");
    obj.edit138:setName("edit138");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout13);
    obj.label114:setLeft(290);
    obj.label114:setTop(55);
    obj.label114:setWidth(70);
    obj.label114:setHeight(25);
    obj.label114:setText("DECISIVO");
    obj.label114:setName("label114");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout13);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(352);
    obj.edit139:setTop(55);
    obj.edit139:setWidth(82);
    obj.edit139:setHeight(25);
    obj.edit139:setField("decisivo12");
    obj.edit139:setName("edit139");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout13);
    obj.label115:setLeft(445);
    obj.label115:setTop(55);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setText("MULTI");
    obj.label115:setName("label115");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout13);
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(493);
    obj.edit140:setTop(55);
    obj.edit140:setWidth(82);
    obj.edit140:setHeight(25);
    obj.edit140:setField("multiplicador12");
    obj.edit140:setName("edit140");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout13);
    obj.label116:setLeft(580);
    obj.label116:setTop(5);
    obj.label116:setWidth(80);
    obj.label116:setHeight(25);
    obj.label116:setText("CATEGORIA");
    obj.label116:setName("label116");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout13);
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(660);
    obj.edit141:setTop(5);
    obj.edit141:setWidth(200);
    obj.edit141:setHeight(25);
    obj.edit141:setField("categoria12");
    obj.edit141:setName("edit141");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout13);
    obj.label117:setLeft(610);
    obj.label117:setTop(30);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setText("OBS");
    obj.label117:setName("label117");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout13);
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(660);
    obj.edit142:setTop(30);
    obj.edit142:setWidth(200);
    obj.edit142:setHeight(25);
    obj.edit142:setField("obs12");
    obj.edit142:setName("edit142");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout13);
    obj.label118:setLeft(590);
    obj.label118:setTop(55);
    obj.label118:setWidth(80);
    obj.label118:setHeight(25);
    obj.label118:setText("MUNIÇÃO");
    obj.label118:setName("label118");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout13);
    obj.edit143:setType("number");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(660);
    obj.edit143:setTop(55);
    obj.edit143:setWidth(69);
    obj.edit143:setHeight(25);
    obj.edit143:setField("municao12");
    obj.edit143:setName("edit143");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout13);
    obj.label119:setLeft(735);
    obj.label119:setTop(55);
    obj.label119:setWidth(70);
    obj.label119:setHeight(25);
    obj.label119:setText("ALCANCE");
    obj.label119:setName("label119");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout13);
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(795);
    obj.edit144:setTop(55);
    obj.edit144:setWidth(65);
    obj.edit144:setHeight(25);
    obj.edit144:setField("alcance12");
    obj.edit144:setName("edit144");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout13);
    obj.rectangle25:setLeft(869);
    obj.rectangle25:setTop(4);
    obj.rectangle25:setWidth(332);
    obj.rectangle25:setHeight(77);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout13);
    obj.label120:setLeft(870);
    obj.label120:setTop(25);
    obj.label120:setWidth(330);
    obj.label120:setHeight(25);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Clique para adicionar imagem");
    obj.label120:setName("label120");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout13);
    obj.image12:setField("imagemArma12");
    obj.image12:setEditable(true);
    obj.image12:setStyle("autoFit");
    obj.image12:setLeft(870);
    obj.image12:setTop(5);
    obj.image12:setWidth(330);
    obj.image12:setHeight(75);
    obj.image12:setName("image12");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout13);
    obj.button48:setLeft(1205);
    obj.button48:setTop(5);
    obj.button48:setWidth(25);
    obj.button48:setHeight(75);
    obj.button48:setText("X");
    obj.button48:setFontSize(15);
    obj.button48:setHint("Apaga o ataque.");
    obj.button48:setName("button48");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(2);
    obj.layout14:setTop(1143);
    obj.layout14:setWidth(1232);
    obj.layout14:setHeight(92);
    obj.layout14:setName("layout14");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout14);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout14);
    obj.label121:setLeft(5);
    obj.label121:setTop(5);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setText("NOME");
    obj.label121:setName("label121");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout14);
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(55);
    obj.edit145:setTop(5);
    obj.edit145:setWidth(225);
    obj.edit145:setHeight(25);
    obj.edit145:setField("nome13");
    obj.edit145:setName("edit145");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout14);
    obj.label122:setLeft(5);
    obj.label122:setTop(30);
    obj.label122:setWidth(50);
    obj.label122:setHeight(25);
    obj.label122:setText("ARMA");
    obj.label122:setName("label122");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout14);
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(55);
    obj.edit146:setTop(30);
    obj.edit146:setWidth(225);
    obj.edit146:setHeight(25);
    obj.edit146:setField("arma13");
    obj.edit146:setName("edit146");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout14);
    obj.label123:setLeft(5);
    obj.label123:setTop(55);
    obj.label123:setWidth(50);
    obj.label123:setHeight(25);
    obj.label123:setText("TIPO");
    obj.label123:setName("label123");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout14);
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(55);
    obj.edit147:setTop(55);
    obj.edit147:setWidth(225);
    obj.edit147:setHeight(25);
    obj.edit147:setField("tipo13");
    obj.edit147:setName("edit147");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout14);
    obj.button49:setLeft(279);
    obj.button49:setTop(6);
    obj.button49:setWidth(73);
    obj.button49:setText("ATAQUE");
    obj.button49:setFontSize(11);
    obj.button49:setName("button49");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout14);
    obj.edit148:setType("number");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(352);
    obj.edit148:setTop(5);
    obj.edit148:setWidth(82);
    obj.edit148:setHeight(25);
    obj.edit148:setField("ataque13");
    obj.edit148:setName("edit148");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout14);
    obj.checkBox13:setLeft(434);
    obj.checkBox13:setTop(6);
    obj.checkBox13:setWidth(150);
    obj.checkBox13:setField("double13");
    obj.checkBox13:setText("Ataque Total");
    obj.checkBox13:setName("checkBox13");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout14);
    obj.dataLink13:setFields({'ataque13','double13'});
    obj.dataLink13:setName("dataLink13");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout14);
    obj.button50:setLeft(279);
    obj.button50:setTop(31);
    obj.button50:setWidth(73);
    obj.button50:setText("DANO");
    obj.button50:setFontSize(11);
    obj.button50:setName("button50");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout14);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(352);
    obj.edit149:setTop(30);
    obj.edit149:setWidth(82);
    obj.edit149:setHeight(25);
    obj.edit149:setField("dano13");
    obj.edit149:setName("edit149");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout14);
    obj.button51:setLeft(434);
    obj.button51:setTop(31);
    obj.button51:setWidth(60);
    obj.button51:setText("CRITICO");
    obj.button51:setFontSize(11);
    obj.button51:setName("button51");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout14);
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(493);
    obj.edit150:setTop(30);
    obj.edit150:setWidth(82);
    obj.edit150:setHeight(25);
    obj.edit150:setField("danoCritico13");
    obj.edit150:setName("edit150");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout14);
    obj.label124:setLeft(290);
    obj.label124:setTop(55);
    obj.label124:setWidth(70);
    obj.label124:setHeight(25);
    obj.label124:setText("DECISIVO");
    obj.label124:setName("label124");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout14);
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(352);
    obj.edit151:setTop(55);
    obj.edit151:setWidth(82);
    obj.edit151:setHeight(25);
    obj.edit151:setField("decisivo13");
    obj.edit151:setName("edit151");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout14);
    obj.label125:setLeft(445);
    obj.label125:setTop(55);
    obj.label125:setWidth(50);
    obj.label125:setHeight(25);
    obj.label125:setText("MULTI");
    obj.label125:setName("label125");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout14);
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(493);
    obj.edit152:setTop(55);
    obj.edit152:setWidth(82);
    obj.edit152:setHeight(25);
    obj.edit152:setField("multiplicador13");
    obj.edit152:setName("edit152");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout14);
    obj.label126:setLeft(580);
    obj.label126:setTop(5);
    obj.label126:setWidth(80);
    obj.label126:setHeight(25);
    obj.label126:setText("CATEGORIA");
    obj.label126:setName("label126");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout14);
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(660);
    obj.edit153:setTop(5);
    obj.edit153:setWidth(200);
    obj.edit153:setHeight(25);
    obj.edit153:setField("categoria13");
    obj.edit153:setName("edit153");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout14);
    obj.label127:setLeft(610);
    obj.label127:setTop(30);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setText("OBS");
    obj.label127:setName("label127");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout14);
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(660);
    obj.edit154:setTop(30);
    obj.edit154:setWidth(200);
    obj.edit154:setHeight(25);
    obj.edit154:setField("obs13");
    obj.edit154:setName("edit154");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout14);
    obj.label128:setLeft(590);
    obj.label128:setTop(55);
    obj.label128:setWidth(80);
    obj.label128:setHeight(25);
    obj.label128:setText("MUNIÇÃO");
    obj.label128:setName("label128");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout14);
    obj.edit155:setType("number");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(660);
    obj.edit155:setTop(55);
    obj.edit155:setWidth(69);
    obj.edit155:setHeight(25);
    obj.edit155:setField("municao13");
    obj.edit155:setName("edit155");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout14);
    obj.label129:setLeft(735);
    obj.label129:setTop(55);
    obj.label129:setWidth(70);
    obj.label129:setHeight(25);
    obj.label129:setText("ALCANCE");
    obj.label129:setName("label129");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout14);
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(795);
    obj.edit156:setTop(55);
    obj.edit156:setWidth(65);
    obj.edit156:setHeight(25);
    obj.edit156:setField("alcance13");
    obj.edit156:setName("edit156");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout14);
    obj.rectangle27:setLeft(869);
    obj.rectangle27:setTop(4);
    obj.rectangle27:setWidth(332);
    obj.rectangle27:setHeight(77);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout14);
    obj.label130:setLeft(870);
    obj.label130:setTop(25);
    obj.label130:setWidth(330);
    obj.label130:setHeight(25);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setText("Clique para adicionar imagem");
    obj.label130:setName("label130");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout14);
    obj.image13:setField("imagemArma13");
    obj.image13:setEditable(true);
    obj.image13:setStyle("autoFit");
    obj.image13:setLeft(870);
    obj.image13:setTop(5);
    obj.image13:setWidth(330);
    obj.image13:setHeight(75);
    obj.image13:setName("image13");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout14);
    obj.button52:setLeft(1205);
    obj.button52:setTop(5);
    obj.button52:setWidth(25);
    obj.button52:setHeight(75);
    obj.button52:setText("X");
    obj.button52:setFontSize(15);
    obj.button52:setHint("Apaga o ataque.");
    obj.button52:setName("button52");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(2);
    obj.layout15:setTop(1238);
    obj.layout15:setWidth(1232);
    obj.layout15:setHeight(92);
    obj.layout15:setName("layout15");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout15);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout15);
    obj.label131:setLeft(5);
    obj.label131:setTop(5);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setText("NOME");
    obj.label131:setName("label131");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout15);
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(55);
    obj.edit157:setTop(5);
    obj.edit157:setWidth(225);
    obj.edit157:setHeight(25);
    obj.edit157:setField("nome14");
    obj.edit157:setName("edit157");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout15);
    obj.label132:setLeft(5);
    obj.label132:setTop(30);
    obj.label132:setWidth(50);
    obj.label132:setHeight(25);
    obj.label132:setText("ARMA");
    obj.label132:setName("label132");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout15);
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(55);
    obj.edit158:setTop(30);
    obj.edit158:setWidth(225);
    obj.edit158:setHeight(25);
    obj.edit158:setField("arma14");
    obj.edit158:setName("edit158");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout15);
    obj.label133:setLeft(5);
    obj.label133:setTop(55);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setText("TIPO");
    obj.label133:setName("label133");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout15);
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(55);
    obj.edit159:setTop(55);
    obj.edit159:setWidth(225);
    obj.edit159:setHeight(25);
    obj.edit159:setField("tipo14");
    obj.edit159:setName("edit159");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout15);
    obj.button53:setLeft(279);
    obj.button53:setTop(6);
    obj.button53:setWidth(73);
    obj.button53:setText("ATAQUE");
    obj.button53:setFontSize(11);
    obj.button53:setName("button53");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout15);
    obj.edit160:setType("number");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(352);
    obj.edit160:setTop(5);
    obj.edit160:setWidth(82);
    obj.edit160:setHeight(25);
    obj.edit160:setField("ataque14");
    obj.edit160:setName("edit160");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout15);
    obj.checkBox14:setLeft(434);
    obj.checkBox14:setTop(6);
    obj.checkBox14:setWidth(150);
    obj.checkBox14:setField("double14");
    obj.checkBox14:setText("Ataque Total");
    obj.checkBox14:setName("checkBox14");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout15);
    obj.dataLink14:setFields({'ataque14','double14'});
    obj.dataLink14:setName("dataLink14");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout15);
    obj.button54:setLeft(279);
    obj.button54:setTop(31);
    obj.button54:setWidth(73);
    obj.button54:setText("DANO");
    obj.button54:setFontSize(11);
    obj.button54:setName("button54");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout15);
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(352);
    obj.edit161:setTop(30);
    obj.edit161:setWidth(82);
    obj.edit161:setHeight(25);
    obj.edit161:setField("dano14");
    obj.edit161:setName("edit161");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout15);
    obj.button55:setLeft(434);
    obj.button55:setTop(31);
    obj.button55:setWidth(60);
    obj.button55:setText("CRITICO");
    obj.button55:setFontSize(11);
    obj.button55:setName("button55");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout15);
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(493);
    obj.edit162:setTop(30);
    obj.edit162:setWidth(82);
    obj.edit162:setHeight(25);
    obj.edit162:setField("danoCritico14");
    obj.edit162:setName("edit162");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout15);
    obj.label134:setLeft(290);
    obj.label134:setTop(55);
    obj.label134:setWidth(70);
    obj.label134:setHeight(25);
    obj.label134:setText("DECISIVO");
    obj.label134:setName("label134");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout15);
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(352);
    obj.edit163:setTop(55);
    obj.edit163:setWidth(82);
    obj.edit163:setHeight(25);
    obj.edit163:setField("decisivo14");
    obj.edit163:setName("edit163");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout15);
    obj.label135:setLeft(445);
    obj.label135:setTop(55);
    obj.label135:setWidth(50);
    obj.label135:setHeight(25);
    obj.label135:setText("MULTI");
    obj.label135:setName("label135");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout15);
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(493);
    obj.edit164:setTop(55);
    obj.edit164:setWidth(82);
    obj.edit164:setHeight(25);
    obj.edit164:setField("multiplicador14");
    obj.edit164:setName("edit164");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout15);
    obj.label136:setLeft(580);
    obj.label136:setTop(5);
    obj.label136:setWidth(80);
    obj.label136:setHeight(25);
    obj.label136:setText("CATEGORIA");
    obj.label136:setName("label136");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout15);
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(660);
    obj.edit165:setTop(5);
    obj.edit165:setWidth(200);
    obj.edit165:setHeight(25);
    obj.edit165:setField("categoria14");
    obj.edit165:setName("edit165");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout15);
    obj.label137:setLeft(610);
    obj.label137:setTop(30);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setText("OBS");
    obj.label137:setName("label137");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout15);
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(660);
    obj.edit166:setTop(30);
    obj.edit166:setWidth(200);
    obj.edit166:setHeight(25);
    obj.edit166:setField("obs14");
    obj.edit166:setName("edit166");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout15);
    obj.label138:setLeft(590);
    obj.label138:setTop(55);
    obj.label138:setWidth(80);
    obj.label138:setHeight(25);
    obj.label138:setText("MUNIÇÃO");
    obj.label138:setName("label138");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout15);
    obj.edit167:setType("number");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(660);
    obj.edit167:setTop(55);
    obj.edit167:setWidth(69);
    obj.edit167:setHeight(25);
    obj.edit167:setField("municao14");
    obj.edit167:setName("edit167");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout15);
    obj.label139:setLeft(735);
    obj.label139:setTop(55);
    obj.label139:setWidth(70);
    obj.label139:setHeight(25);
    obj.label139:setText("ALCANCE");
    obj.label139:setName("label139");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout15);
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(795);
    obj.edit168:setTop(55);
    obj.edit168:setWidth(65);
    obj.edit168:setHeight(25);
    obj.edit168:setField("alcance14");
    obj.edit168:setName("edit168");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout15);
    obj.rectangle29:setLeft(869);
    obj.rectangle29:setTop(4);
    obj.rectangle29:setWidth(332);
    obj.rectangle29:setHeight(77);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout15);
    obj.label140:setLeft(870);
    obj.label140:setTop(25);
    obj.label140:setWidth(330);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setText("Clique para adicionar imagem");
    obj.label140:setName("label140");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout15);
    obj.image14:setField("imagemArma14");
    obj.image14:setEditable(true);
    obj.image14:setStyle("autoFit");
    obj.image14:setLeft(870);
    obj.image14:setTop(5);
    obj.image14:setWidth(330);
    obj.image14:setHeight(75);
    obj.image14:setName("image14");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout15);
    obj.button56:setLeft(1205);
    obj.button56:setTop(5);
    obj.button56:setWidth(25);
    obj.button56:setHeight(75);
    obj.button56:setText("X");
    obj.button56:setFontSize(15);
    obj.button56:setHint("Apaga o ataque.");
    obj.button56:setName("button56");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(2);
    obj.layout16:setTop(1333);
    obj.layout16:setWidth(1232);
    obj.layout16:setHeight(92);
    obj.layout16:setName("layout16");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout16);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout16);
    obj.label141:setLeft(5);
    obj.label141:setTop(5);
    obj.label141:setWidth(50);
    obj.label141:setHeight(25);
    obj.label141:setText("NOME");
    obj.label141:setName("label141");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout16);
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(55);
    obj.edit169:setTop(5);
    obj.edit169:setWidth(225);
    obj.edit169:setHeight(25);
    obj.edit169:setField("nome15");
    obj.edit169:setName("edit169");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout16);
    obj.label142:setLeft(5);
    obj.label142:setTop(30);
    obj.label142:setWidth(50);
    obj.label142:setHeight(25);
    obj.label142:setText("ARMA");
    obj.label142:setName("label142");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout16);
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(55);
    obj.edit170:setTop(30);
    obj.edit170:setWidth(225);
    obj.edit170:setHeight(25);
    obj.edit170:setField("arma15");
    obj.edit170:setName("edit170");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout16);
    obj.label143:setLeft(5);
    obj.label143:setTop(55);
    obj.label143:setWidth(50);
    obj.label143:setHeight(25);
    obj.label143:setText("TIPO");
    obj.label143:setName("label143");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout16);
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(55);
    obj.edit171:setTop(55);
    obj.edit171:setWidth(225);
    obj.edit171:setHeight(25);
    obj.edit171:setField("tipo15");
    obj.edit171:setName("edit171");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout16);
    obj.button57:setLeft(279);
    obj.button57:setTop(6);
    obj.button57:setWidth(73);
    obj.button57:setText("ATAQUE");
    obj.button57:setFontSize(11);
    obj.button57:setName("button57");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout16);
    obj.edit172:setType("number");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(352);
    obj.edit172:setTop(5);
    obj.edit172:setWidth(82);
    obj.edit172:setHeight(25);
    obj.edit172:setField("ataque15");
    obj.edit172:setName("edit172");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout16);
    obj.checkBox15:setLeft(434);
    obj.checkBox15:setTop(6);
    obj.checkBox15:setWidth(150);
    obj.checkBox15:setField("double15");
    obj.checkBox15:setText("Ataque Total");
    obj.checkBox15:setName("checkBox15");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout16);
    obj.dataLink15:setFields({'ataque15','double15'});
    obj.dataLink15:setName("dataLink15");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout16);
    obj.button58:setLeft(279);
    obj.button58:setTop(31);
    obj.button58:setWidth(73);
    obj.button58:setText("DANO");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout16);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(352);
    obj.edit173:setTop(30);
    obj.edit173:setWidth(82);
    obj.edit173:setHeight(25);
    obj.edit173:setField("dano15");
    obj.edit173:setName("edit173");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout16);
    obj.button59:setLeft(434);
    obj.button59:setTop(31);
    obj.button59:setWidth(60);
    obj.button59:setText("CRITICO");
    obj.button59:setFontSize(11);
    obj.button59:setName("button59");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout16);
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(493);
    obj.edit174:setTop(30);
    obj.edit174:setWidth(82);
    obj.edit174:setHeight(25);
    obj.edit174:setField("danoCritico15");
    obj.edit174:setName("edit174");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout16);
    obj.label144:setLeft(290);
    obj.label144:setTop(55);
    obj.label144:setWidth(70);
    obj.label144:setHeight(25);
    obj.label144:setText("DECISIVO");
    obj.label144:setName("label144");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout16);
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(352);
    obj.edit175:setTop(55);
    obj.edit175:setWidth(82);
    obj.edit175:setHeight(25);
    obj.edit175:setField("decisivo15");
    obj.edit175:setName("edit175");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout16);
    obj.label145:setLeft(445);
    obj.label145:setTop(55);
    obj.label145:setWidth(50);
    obj.label145:setHeight(25);
    obj.label145:setText("MULTI");
    obj.label145:setName("label145");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout16);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(493);
    obj.edit176:setTop(55);
    obj.edit176:setWidth(82);
    obj.edit176:setHeight(25);
    obj.edit176:setField("multiplicador15");
    obj.edit176:setName("edit176");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout16);
    obj.label146:setLeft(580);
    obj.label146:setTop(5);
    obj.label146:setWidth(80);
    obj.label146:setHeight(25);
    obj.label146:setText("CATEGORIA");
    obj.label146:setName("label146");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout16);
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(660);
    obj.edit177:setTop(5);
    obj.edit177:setWidth(200);
    obj.edit177:setHeight(25);
    obj.edit177:setField("categoria15");
    obj.edit177:setName("edit177");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout16);
    obj.label147:setLeft(610);
    obj.label147:setTop(30);
    obj.label147:setWidth(50);
    obj.label147:setHeight(25);
    obj.label147:setText("OBS");
    obj.label147:setName("label147");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout16);
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(660);
    obj.edit178:setTop(30);
    obj.edit178:setWidth(200);
    obj.edit178:setHeight(25);
    obj.edit178:setField("obs15");
    obj.edit178:setName("edit178");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout16);
    obj.label148:setLeft(590);
    obj.label148:setTop(55);
    obj.label148:setWidth(80);
    obj.label148:setHeight(25);
    obj.label148:setText("MUNIÇÃO");
    obj.label148:setName("label148");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout16);
    obj.edit179:setType("number");
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(660);
    obj.edit179:setTop(55);
    obj.edit179:setWidth(69);
    obj.edit179:setHeight(25);
    obj.edit179:setField("municao15");
    obj.edit179:setName("edit179");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout16);
    obj.label149:setLeft(735);
    obj.label149:setTop(55);
    obj.label149:setWidth(70);
    obj.label149:setHeight(25);
    obj.label149:setText("ALCANCE");
    obj.label149:setName("label149");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout16);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(795);
    obj.edit180:setTop(55);
    obj.edit180:setWidth(65);
    obj.edit180:setHeight(25);
    obj.edit180:setField("alcance15");
    obj.edit180:setName("edit180");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout16);
    obj.rectangle31:setLeft(869);
    obj.rectangle31:setTop(4);
    obj.rectangle31:setWidth(332);
    obj.rectangle31:setHeight(77);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout16);
    obj.label150:setLeft(870);
    obj.label150:setTop(25);
    obj.label150:setWidth(330);
    obj.label150:setHeight(25);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setText("Clique para adicionar imagem");
    obj.label150:setName("label150");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout16);
    obj.image15:setField("imagemArma15");
    obj.image15:setEditable(true);
    obj.image15:setStyle("autoFit");
    obj.image15:setLeft(870);
    obj.image15:setTop(5);
    obj.image15:setWidth(330);
    obj.image15:setHeight(75);
    obj.image15:setName("image15");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout16);
    obj.button60:setLeft(1205);
    obj.button60:setTop(5);
    obj.button60:setWidth(25);
    obj.button60:setHeight(75);
    obj.button60:setText("X");
    obj.button60:setFontSize(15);
    obj.button60:setHint("Apaga o ataque.");
    obj.button60:setName("button60");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(2);
    obj.layout17:setTop(1428);
    obj.layout17:setWidth(1232);
    obj.layout17:setHeight(92);
    obj.layout17:setName("layout17");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout17);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout17);
    obj.label151:setLeft(5);
    obj.label151:setTop(5);
    obj.label151:setWidth(50);
    obj.label151:setHeight(25);
    obj.label151:setText("NOME");
    obj.label151:setName("label151");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout17);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(55);
    obj.edit181:setTop(5);
    obj.edit181:setWidth(225);
    obj.edit181:setHeight(25);
    obj.edit181:setField("nome16");
    obj.edit181:setName("edit181");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout17);
    obj.label152:setLeft(5);
    obj.label152:setTop(30);
    obj.label152:setWidth(50);
    obj.label152:setHeight(25);
    obj.label152:setText("ARMA");
    obj.label152:setName("label152");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout17);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(55);
    obj.edit182:setTop(30);
    obj.edit182:setWidth(225);
    obj.edit182:setHeight(25);
    obj.edit182:setField("arma16");
    obj.edit182:setName("edit182");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout17);
    obj.label153:setLeft(5);
    obj.label153:setTop(55);
    obj.label153:setWidth(50);
    obj.label153:setHeight(25);
    obj.label153:setText("TIPO");
    obj.label153:setName("label153");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout17);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(55);
    obj.edit183:setTop(55);
    obj.edit183:setWidth(225);
    obj.edit183:setHeight(25);
    obj.edit183:setField("tipo16");
    obj.edit183:setName("edit183");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout17);
    obj.button61:setLeft(279);
    obj.button61:setTop(6);
    obj.button61:setWidth(73);
    obj.button61:setText("ATAQUE");
    obj.button61:setFontSize(11);
    obj.button61:setName("button61");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout17);
    obj.edit184:setType("number");
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(352);
    obj.edit184:setTop(5);
    obj.edit184:setWidth(82);
    obj.edit184:setHeight(25);
    obj.edit184:setField("ataque16");
    obj.edit184:setName("edit184");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout17);
    obj.checkBox16:setLeft(434);
    obj.checkBox16:setTop(6);
    obj.checkBox16:setWidth(150);
    obj.checkBox16:setField("double16");
    obj.checkBox16:setText("Ataque Total");
    obj.checkBox16:setName("checkBox16");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout17);
    obj.dataLink16:setFields({'ataque16','double16'});
    obj.dataLink16:setName("dataLink16");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout17);
    obj.button62:setLeft(279);
    obj.button62:setTop(31);
    obj.button62:setWidth(73);
    obj.button62:setText("DANO");
    obj.button62:setFontSize(11);
    obj.button62:setName("button62");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout17);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(352);
    obj.edit185:setTop(30);
    obj.edit185:setWidth(82);
    obj.edit185:setHeight(25);
    obj.edit185:setField("dano16");
    obj.edit185:setName("edit185");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout17);
    obj.button63:setLeft(434);
    obj.button63:setTop(31);
    obj.button63:setWidth(60);
    obj.button63:setText("CRITICO");
    obj.button63:setFontSize(11);
    obj.button63:setName("button63");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout17);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(493);
    obj.edit186:setTop(30);
    obj.edit186:setWidth(82);
    obj.edit186:setHeight(25);
    obj.edit186:setField("danoCritico16");
    obj.edit186:setName("edit186");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout17);
    obj.label154:setLeft(290);
    obj.label154:setTop(55);
    obj.label154:setWidth(70);
    obj.label154:setHeight(25);
    obj.label154:setText("DECISIVO");
    obj.label154:setName("label154");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout17);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(352);
    obj.edit187:setTop(55);
    obj.edit187:setWidth(82);
    obj.edit187:setHeight(25);
    obj.edit187:setField("decisivo16");
    obj.edit187:setName("edit187");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout17);
    obj.label155:setLeft(445);
    obj.label155:setTop(55);
    obj.label155:setWidth(50);
    obj.label155:setHeight(25);
    obj.label155:setText("MULTI");
    obj.label155:setName("label155");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout17);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(493);
    obj.edit188:setTop(55);
    obj.edit188:setWidth(82);
    obj.edit188:setHeight(25);
    obj.edit188:setField("multiplicador16");
    obj.edit188:setName("edit188");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout17);
    obj.label156:setLeft(580);
    obj.label156:setTop(5);
    obj.label156:setWidth(80);
    obj.label156:setHeight(25);
    obj.label156:setText("CATEGORIA");
    obj.label156:setName("label156");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout17);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(660);
    obj.edit189:setTop(5);
    obj.edit189:setWidth(200);
    obj.edit189:setHeight(25);
    obj.edit189:setField("categoria16");
    obj.edit189:setName("edit189");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout17);
    obj.label157:setLeft(610);
    obj.label157:setTop(30);
    obj.label157:setWidth(50);
    obj.label157:setHeight(25);
    obj.label157:setText("OBS");
    obj.label157:setName("label157");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout17);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(660);
    obj.edit190:setTop(30);
    obj.edit190:setWidth(200);
    obj.edit190:setHeight(25);
    obj.edit190:setField("obs16");
    obj.edit190:setName("edit190");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout17);
    obj.label158:setLeft(590);
    obj.label158:setTop(55);
    obj.label158:setWidth(80);
    obj.label158:setHeight(25);
    obj.label158:setText("MUNIÇÃO");
    obj.label158:setName("label158");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout17);
    obj.edit191:setType("number");
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(660);
    obj.edit191:setTop(55);
    obj.edit191:setWidth(69);
    obj.edit191:setHeight(25);
    obj.edit191:setField("municao16");
    obj.edit191:setName("edit191");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout17);
    obj.label159:setLeft(735);
    obj.label159:setTop(55);
    obj.label159:setWidth(70);
    obj.label159:setHeight(25);
    obj.label159:setText("ALCANCE");
    obj.label159:setName("label159");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout17);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(795);
    obj.edit192:setTop(55);
    obj.edit192:setWidth(65);
    obj.edit192:setHeight(25);
    obj.edit192:setField("alcance16");
    obj.edit192:setName("edit192");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout17);
    obj.rectangle33:setLeft(869);
    obj.rectangle33:setTop(4);
    obj.rectangle33:setWidth(332);
    obj.rectangle33:setHeight(77);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout17);
    obj.label160:setLeft(870);
    obj.label160:setTop(25);
    obj.label160:setWidth(330);
    obj.label160:setHeight(25);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setText("Clique para adicionar imagem");
    obj.label160:setName("label160");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout17);
    obj.image16:setField("imagemArma16");
    obj.image16:setEditable(true);
    obj.image16:setStyle("autoFit");
    obj.image16:setLeft(870);
    obj.image16:setTop(5);
    obj.image16:setWidth(330);
    obj.image16:setHeight(75);
    obj.image16:setName("image16");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout17);
    obj.button64:setLeft(1205);
    obj.button64:setTop(5);
    obj.button64:setWidth(25);
    obj.button64:setHeight(75);
    obj.button64:setText("X");
    obj.button64:setFontSize(15);
    obj.button64:setHint("Apaga o ataque.");
    obj.button64:setName("button64");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout1);
    obj.layout18:setLeft(2);
    obj.layout18:setTop(1523);
    obj.layout18:setWidth(1232);
    obj.layout18:setHeight(92);
    obj.layout18:setName("layout18");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout18);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout18);
    obj.label161:setLeft(5);
    obj.label161:setTop(5);
    obj.label161:setWidth(50);
    obj.label161:setHeight(25);
    obj.label161:setText("NOME");
    obj.label161:setName("label161");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout18);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(55);
    obj.edit193:setTop(5);
    obj.edit193:setWidth(225);
    obj.edit193:setHeight(25);
    obj.edit193:setField("nome17");
    obj.edit193:setName("edit193");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout18);
    obj.label162:setLeft(5);
    obj.label162:setTop(30);
    obj.label162:setWidth(50);
    obj.label162:setHeight(25);
    obj.label162:setText("ARMA");
    obj.label162:setName("label162");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout18);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(55);
    obj.edit194:setTop(30);
    obj.edit194:setWidth(225);
    obj.edit194:setHeight(25);
    obj.edit194:setField("arma17");
    obj.edit194:setName("edit194");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout18);
    obj.label163:setLeft(5);
    obj.label163:setTop(55);
    obj.label163:setWidth(50);
    obj.label163:setHeight(25);
    obj.label163:setText("TIPO");
    obj.label163:setName("label163");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout18);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(55);
    obj.edit195:setTop(55);
    obj.edit195:setWidth(225);
    obj.edit195:setHeight(25);
    obj.edit195:setField("tipo17");
    obj.edit195:setName("edit195");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout18);
    obj.button65:setLeft(279);
    obj.button65:setTop(6);
    obj.button65:setWidth(73);
    obj.button65:setText("ATAQUE");
    obj.button65:setFontSize(11);
    obj.button65:setName("button65");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout18);
    obj.edit196:setType("number");
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(352);
    obj.edit196:setTop(5);
    obj.edit196:setWidth(82);
    obj.edit196:setHeight(25);
    obj.edit196:setField("ataque17");
    obj.edit196:setName("edit196");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout18);
    obj.checkBox17:setLeft(434);
    obj.checkBox17:setTop(6);
    obj.checkBox17:setWidth(150);
    obj.checkBox17:setField("double17");
    obj.checkBox17:setText("Ataque Total");
    obj.checkBox17:setName("checkBox17");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout18);
    obj.dataLink17:setFields({'ataque17','double17'});
    obj.dataLink17:setName("dataLink17");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout18);
    obj.button66:setLeft(279);
    obj.button66:setTop(31);
    obj.button66:setWidth(73);
    obj.button66:setText("DANO");
    obj.button66:setFontSize(11);
    obj.button66:setName("button66");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout18);
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(352);
    obj.edit197:setTop(30);
    obj.edit197:setWidth(82);
    obj.edit197:setHeight(25);
    obj.edit197:setField("dano17");
    obj.edit197:setName("edit197");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout18);
    obj.button67:setLeft(434);
    obj.button67:setTop(31);
    obj.button67:setWidth(60);
    obj.button67:setText("CRITICO");
    obj.button67:setFontSize(11);
    obj.button67:setName("button67");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout18);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(493);
    obj.edit198:setTop(30);
    obj.edit198:setWidth(82);
    obj.edit198:setHeight(25);
    obj.edit198:setField("danoCritico17");
    obj.edit198:setName("edit198");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout18);
    obj.label164:setLeft(290);
    obj.label164:setTop(55);
    obj.label164:setWidth(70);
    obj.label164:setHeight(25);
    obj.label164:setText("DECISIVO");
    obj.label164:setName("label164");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout18);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(352);
    obj.edit199:setTop(55);
    obj.edit199:setWidth(82);
    obj.edit199:setHeight(25);
    obj.edit199:setField("decisivo17");
    obj.edit199:setName("edit199");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout18);
    obj.label165:setLeft(445);
    obj.label165:setTop(55);
    obj.label165:setWidth(50);
    obj.label165:setHeight(25);
    obj.label165:setText("MULTI");
    obj.label165:setName("label165");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout18);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(493);
    obj.edit200:setTop(55);
    obj.edit200:setWidth(82);
    obj.edit200:setHeight(25);
    obj.edit200:setField("multiplicador17");
    obj.edit200:setName("edit200");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout18);
    obj.label166:setLeft(580);
    obj.label166:setTop(5);
    obj.label166:setWidth(80);
    obj.label166:setHeight(25);
    obj.label166:setText("CATEGORIA");
    obj.label166:setName("label166");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout18);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(660);
    obj.edit201:setTop(5);
    obj.edit201:setWidth(200);
    obj.edit201:setHeight(25);
    obj.edit201:setField("categoria17");
    obj.edit201:setName("edit201");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout18);
    obj.label167:setLeft(610);
    obj.label167:setTop(30);
    obj.label167:setWidth(50);
    obj.label167:setHeight(25);
    obj.label167:setText("OBS");
    obj.label167:setName("label167");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout18);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(660);
    obj.edit202:setTop(30);
    obj.edit202:setWidth(200);
    obj.edit202:setHeight(25);
    obj.edit202:setField("obs17");
    obj.edit202:setName("edit202");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout18);
    obj.label168:setLeft(590);
    obj.label168:setTop(55);
    obj.label168:setWidth(80);
    obj.label168:setHeight(25);
    obj.label168:setText("MUNIÇÃO");
    obj.label168:setName("label168");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout18);
    obj.edit203:setType("number");
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(660);
    obj.edit203:setTop(55);
    obj.edit203:setWidth(69);
    obj.edit203:setHeight(25);
    obj.edit203:setField("municao17");
    obj.edit203:setName("edit203");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout18);
    obj.label169:setLeft(735);
    obj.label169:setTop(55);
    obj.label169:setWidth(70);
    obj.label169:setHeight(25);
    obj.label169:setText("ALCANCE");
    obj.label169:setName("label169");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout18);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(795);
    obj.edit204:setTop(55);
    obj.edit204:setWidth(65);
    obj.edit204:setHeight(25);
    obj.edit204:setField("alcance17");
    obj.edit204:setName("edit204");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout18);
    obj.rectangle35:setLeft(869);
    obj.rectangle35:setTop(4);
    obj.rectangle35:setWidth(332);
    obj.rectangle35:setHeight(77);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout18);
    obj.label170:setLeft(870);
    obj.label170:setTop(25);
    obj.label170:setWidth(330);
    obj.label170:setHeight(25);
    obj.label170:setHorzTextAlign("center");
    obj.label170:setText("Clique para adicionar imagem");
    obj.label170:setName("label170");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout18);
    obj.image17:setField("imagemArma17");
    obj.image17:setEditable(true);
    obj.image17:setStyle("autoFit");
    obj.image17:setLeft(870);
    obj.image17:setTop(5);
    obj.image17:setWidth(330);
    obj.image17:setHeight(75);
    obj.image17:setName("image17");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout18);
    obj.button68:setLeft(1205);
    obj.button68:setTop(5);
    obj.button68:setWidth(25);
    obj.button68:setHeight(75);
    obj.button68:setText("X");
    obj.button68:setFontSize(15);
    obj.button68:setHint("Apaga o ataque.");
    obj.button68:setName("button68");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setLeft(2);
    obj.layout19:setTop(1618);
    obj.layout19:setWidth(1232);
    obj.layout19:setHeight(92);
    obj.layout19:setName("layout19");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout19);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout19);
    obj.label171:setLeft(5);
    obj.label171:setTop(5);
    obj.label171:setWidth(50);
    obj.label171:setHeight(25);
    obj.label171:setText("NOME");
    obj.label171:setName("label171");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout19);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(55);
    obj.edit205:setTop(5);
    obj.edit205:setWidth(225);
    obj.edit205:setHeight(25);
    obj.edit205:setField("nome18");
    obj.edit205:setName("edit205");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout19);
    obj.label172:setLeft(5);
    obj.label172:setTop(30);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setText("ARMA");
    obj.label172:setName("label172");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout19);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(55);
    obj.edit206:setTop(30);
    obj.edit206:setWidth(225);
    obj.edit206:setHeight(25);
    obj.edit206:setField("arma18");
    obj.edit206:setName("edit206");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout19);
    obj.label173:setLeft(5);
    obj.label173:setTop(55);
    obj.label173:setWidth(50);
    obj.label173:setHeight(25);
    obj.label173:setText("TIPO");
    obj.label173:setName("label173");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout19);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(55);
    obj.edit207:setTop(55);
    obj.edit207:setWidth(225);
    obj.edit207:setHeight(25);
    obj.edit207:setField("tipo18");
    obj.edit207:setName("edit207");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout19);
    obj.button69:setLeft(279);
    obj.button69:setTop(6);
    obj.button69:setWidth(73);
    obj.button69:setText("ATAQUE");
    obj.button69:setFontSize(11);
    obj.button69:setName("button69");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout19);
    obj.edit208:setType("number");
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(352);
    obj.edit208:setTop(5);
    obj.edit208:setWidth(82);
    obj.edit208:setHeight(25);
    obj.edit208:setField("ataque18");
    obj.edit208:setName("edit208");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout19);
    obj.checkBox18:setLeft(434);
    obj.checkBox18:setTop(6);
    obj.checkBox18:setWidth(150);
    obj.checkBox18:setField("double18");
    obj.checkBox18:setText("Ataque Total");
    obj.checkBox18:setName("checkBox18");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout19);
    obj.dataLink18:setFields({'ataque18','double18'});
    obj.dataLink18:setName("dataLink18");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout19);
    obj.button70:setLeft(279);
    obj.button70:setTop(31);
    obj.button70:setWidth(73);
    obj.button70:setText("DANO");
    obj.button70:setFontSize(11);
    obj.button70:setName("button70");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout19);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(352);
    obj.edit209:setTop(30);
    obj.edit209:setWidth(82);
    obj.edit209:setHeight(25);
    obj.edit209:setField("dano18");
    obj.edit209:setName("edit209");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout19);
    obj.button71:setLeft(434);
    obj.button71:setTop(31);
    obj.button71:setWidth(60);
    obj.button71:setText("CRITICO");
    obj.button71:setFontSize(11);
    obj.button71:setName("button71");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout19);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(493);
    obj.edit210:setTop(30);
    obj.edit210:setWidth(82);
    obj.edit210:setHeight(25);
    obj.edit210:setField("danoCritico18");
    obj.edit210:setName("edit210");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout19);
    obj.label174:setLeft(290);
    obj.label174:setTop(55);
    obj.label174:setWidth(70);
    obj.label174:setHeight(25);
    obj.label174:setText("DECISIVO");
    obj.label174:setName("label174");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout19);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(352);
    obj.edit211:setTop(55);
    obj.edit211:setWidth(82);
    obj.edit211:setHeight(25);
    obj.edit211:setField("decisivo18");
    obj.edit211:setName("edit211");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout19);
    obj.label175:setLeft(445);
    obj.label175:setTop(55);
    obj.label175:setWidth(50);
    obj.label175:setHeight(25);
    obj.label175:setText("MULTI");
    obj.label175:setName("label175");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout19);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(493);
    obj.edit212:setTop(55);
    obj.edit212:setWidth(82);
    obj.edit212:setHeight(25);
    obj.edit212:setField("multiplicador18");
    obj.edit212:setName("edit212");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout19);
    obj.label176:setLeft(580);
    obj.label176:setTop(5);
    obj.label176:setWidth(80);
    obj.label176:setHeight(25);
    obj.label176:setText("CATEGORIA");
    obj.label176:setName("label176");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout19);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(660);
    obj.edit213:setTop(5);
    obj.edit213:setWidth(200);
    obj.edit213:setHeight(25);
    obj.edit213:setField("categoria18");
    obj.edit213:setName("edit213");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout19);
    obj.label177:setLeft(610);
    obj.label177:setTop(30);
    obj.label177:setWidth(50);
    obj.label177:setHeight(25);
    obj.label177:setText("OBS");
    obj.label177:setName("label177");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout19);
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(660);
    obj.edit214:setTop(30);
    obj.edit214:setWidth(200);
    obj.edit214:setHeight(25);
    obj.edit214:setField("obs18");
    obj.edit214:setName("edit214");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout19);
    obj.label178:setLeft(590);
    obj.label178:setTop(55);
    obj.label178:setWidth(80);
    obj.label178:setHeight(25);
    obj.label178:setText("MUNIÇÃO");
    obj.label178:setName("label178");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout19);
    obj.edit215:setType("number");
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(660);
    obj.edit215:setTop(55);
    obj.edit215:setWidth(69);
    obj.edit215:setHeight(25);
    obj.edit215:setField("municao18");
    obj.edit215:setName("edit215");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout19);
    obj.label179:setLeft(735);
    obj.label179:setTop(55);
    obj.label179:setWidth(70);
    obj.label179:setHeight(25);
    obj.label179:setText("ALCANCE");
    obj.label179:setName("label179");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout19);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(795);
    obj.edit216:setTop(55);
    obj.edit216:setWidth(65);
    obj.edit216:setHeight(25);
    obj.edit216:setField("alcance18");
    obj.edit216:setName("edit216");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout19);
    obj.rectangle37:setLeft(869);
    obj.rectangle37:setTop(4);
    obj.rectangle37:setWidth(332);
    obj.rectangle37:setHeight(77);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout19);
    obj.label180:setLeft(870);
    obj.label180:setTop(25);
    obj.label180:setWidth(330);
    obj.label180:setHeight(25);
    obj.label180:setHorzTextAlign("center");
    obj.label180:setText("Clique para adicionar imagem");
    obj.label180:setName("label180");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout19);
    obj.image18:setField("imagemArma18");
    obj.image18:setEditable(true);
    obj.image18:setStyle("autoFit");
    obj.image18:setLeft(870);
    obj.image18:setTop(5);
    obj.image18:setWidth(330);
    obj.image18:setHeight(75);
    obj.image18:setName("image18");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout19);
    obj.button72:setLeft(1205);
    obj.button72:setTop(5);
    obj.button72:setWidth(25);
    obj.button72:setHeight(75);
    obj.button72:setText("X");
    obj.button72:setFontSize(15);
    obj.button72:setHint("Apaga o ataque.");
    obj.button72:setName("button72");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setLeft(2);
    obj.layout20:setTop(1713);
    obj.layout20:setWidth(1232);
    obj.layout20:setHeight(92);
    obj.layout20:setName("layout20");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout20);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout20);
    obj.label181:setLeft(5);
    obj.label181:setTop(5);
    obj.label181:setWidth(50);
    obj.label181:setHeight(25);
    obj.label181:setText("NOME");
    obj.label181:setName("label181");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout20);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(55);
    obj.edit217:setTop(5);
    obj.edit217:setWidth(225);
    obj.edit217:setHeight(25);
    obj.edit217:setField("nome19");
    obj.edit217:setName("edit217");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout20);
    obj.label182:setLeft(5);
    obj.label182:setTop(30);
    obj.label182:setWidth(50);
    obj.label182:setHeight(25);
    obj.label182:setText("ARMA");
    obj.label182:setName("label182");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout20);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(55);
    obj.edit218:setTop(30);
    obj.edit218:setWidth(225);
    obj.edit218:setHeight(25);
    obj.edit218:setField("arma19");
    obj.edit218:setName("edit218");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout20);
    obj.label183:setLeft(5);
    obj.label183:setTop(55);
    obj.label183:setWidth(50);
    obj.label183:setHeight(25);
    obj.label183:setText("TIPO");
    obj.label183:setName("label183");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout20);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(55);
    obj.edit219:setTop(55);
    obj.edit219:setWidth(225);
    obj.edit219:setHeight(25);
    obj.edit219:setField("tipo19");
    obj.edit219:setName("edit219");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout20);
    obj.button73:setLeft(279);
    obj.button73:setTop(6);
    obj.button73:setWidth(73);
    obj.button73:setText("ATAQUE");
    obj.button73:setFontSize(11);
    obj.button73:setName("button73");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout20);
    obj.edit220:setType("number");
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(352);
    obj.edit220:setTop(5);
    obj.edit220:setWidth(82);
    obj.edit220:setHeight(25);
    obj.edit220:setField("ataque19");
    obj.edit220:setName("edit220");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout20);
    obj.checkBox19:setLeft(434);
    obj.checkBox19:setTop(6);
    obj.checkBox19:setWidth(150);
    obj.checkBox19:setField("double19");
    obj.checkBox19:setText("Ataque Total");
    obj.checkBox19:setName("checkBox19");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout20);
    obj.dataLink19:setFields({'ataque19','double19'});
    obj.dataLink19:setName("dataLink19");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout20);
    obj.button74:setLeft(279);
    obj.button74:setTop(31);
    obj.button74:setWidth(73);
    obj.button74:setText("DANO");
    obj.button74:setFontSize(11);
    obj.button74:setName("button74");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout20);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(352);
    obj.edit221:setTop(30);
    obj.edit221:setWidth(82);
    obj.edit221:setHeight(25);
    obj.edit221:setField("dano19");
    obj.edit221:setName("edit221");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout20);
    obj.button75:setLeft(434);
    obj.button75:setTop(31);
    obj.button75:setWidth(60);
    obj.button75:setText("CRITICO");
    obj.button75:setFontSize(11);
    obj.button75:setName("button75");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout20);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(493);
    obj.edit222:setTop(30);
    obj.edit222:setWidth(82);
    obj.edit222:setHeight(25);
    obj.edit222:setField("danoCritico19");
    obj.edit222:setName("edit222");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout20);
    obj.label184:setLeft(290);
    obj.label184:setTop(55);
    obj.label184:setWidth(70);
    obj.label184:setHeight(25);
    obj.label184:setText("DECISIVO");
    obj.label184:setName("label184");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout20);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(352);
    obj.edit223:setTop(55);
    obj.edit223:setWidth(82);
    obj.edit223:setHeight(25);
    obj.edit223:setField("decisivo19");
    obj.edit223:setName("edit223");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout20);
    obj.label185:setLeft(445);
    obj.label185:setTop(55);
    obj.label185:setWidth(50);
    obj.label185:setHeight(25);
    obj.label185:setText("MULTI");
    obj.label185:setName("label185");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout20);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(493);
    obj.edit224:setTop(55);
    obj.edit224:setWidth(82);
    obj.edit224:setHeight(25);
    obj.edit224:setField("multiplicador19");
    obj.edit224:setName("edit224");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout20);
    obj.label186:setLeft(580);
    obj.label186:setTop(5);
    obj.label186:setWidth(80);
    obj.label186:setHeight(25);
    obj.label186:setText("CATEGORIA");
    obj.label186:setName("label186");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout20);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(660);
    obj.edit225:setTop(5);
    obj.edit225:setWidth(200);
    obj.edit225:setHeight(25);
    obj.edit225:setField("categoria19");
    obj.edit225:setName("edit225");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout20);
    obj.label187:setLeft(610);
    obj.label187:setTop(30);
    obj.label187:setWidth(50);
    obj.label187:setHeight(25);
    obj.label187:setText("OBS");
    obj.label187:setName("label187");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout20);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(660);
    obj.edit226:setTop(30);
    obj.edit226:setWidth(200);
    obj.edit226:setHeight(25);
    obj.edit226:setField("obs19");
    obj.edit226:setName("edit226");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout20);
    obj.label188:setLeft(590);
    obj.label188:setTop(55);
    obj.label188:setWidth(80);
    obj.label188:setHeight(25);
    obj.label188:setText("MUNIÇÃO");
    obj.label188:setName("label188");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout20);
    obj.edit227:setType("number");
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(660);
    obj.edit227:setTop(55);
    obj.edit227:setWidth(69);
    obj.edit227:setHeight(25);
    obj.edit227:setField("municao19");
    obj.edit227:setName("edit227");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout20);
    obj.label189:setLeft(735);
    obj.label189:setTop(55);
    obj.label189:setWidth(70);
    obj.label189:setHeight(25);
    obj.label189:setText("ALCANCE");
    obj.label189:setName("label189");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout20);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(795);
    obj.edit228:setTop(55);
    obj.edit228:setWidth(65);
    obj.edit228:setHeight(25);
    obj.edit228:setField("alcance19");
    obj.edit228:setName("edit228");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout20);
    obj.rectangle39:setLeft(869);
    obj.rectangle39:setTop(4);
    obj.rectangle39:setWidth(332);
    obj.rectangle39:setHeight(77);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout20);
    obj.label190:setLeft(870);
    obj.label190:setTop(25);
    obj.label190:setWidth(330);
    obj.label190:setHeight(25);
    obj.label190:setHorzTextAlign("center");
    obj.label190:setText("Clique para adicionar imagem");
    obj.label190:setName("label190");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout20);
    obj.image19:setField("imagemArma19");
    obj.image19:setEditable(true);
    obj.image19:setStyle("autoFit");
    obj.image19:setLeft(870);
    obj.image19:setTop(5);
    obj.image19:setWidth(330);
    obj.image19:setHeight(75);
    obj.image19:setName("image19");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout20);
    obj.button76:setLeft(1205);
    obj.button76:setTop(5);
    obj.button76:setWidth(25);
    obj.button76:setHeight(75);
    obj.button76:setText("X");
    obj.button76:setFontSize(15);
    obj.button76:setHint("Apaga o ataque.");
    obj.button76:setName("button76");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setLeft(2);
    obj.layout21:setTop(1808);
    obj.layout21:setWidth(1232);
    obj.layout21:setHeight(92);
    obj.layout21:setName("layout21");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout21);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout21);
    obj.label191:setLeft(5);
    obj.label191:setTop(5);
    obj.label191:setWidth(50);
    obj.label191:setHeight(25);
    obj.label191:setText("NOME");
    obj.label191:setName("label191");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout21);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(55);
    obj.edit229:setTop(5);
    obj.edit229:setWidth(225);
    obj.edit229:setHeight(25);
    obj.edit229:setField("nome20");
    obj.edit229:setName("edit229");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout21);
    obj.label192:setLeft(5);
    obj.label192:setTop(30);
    obj.label192:setWidth(50);
    obj.label192:setHeight(25);
    obj.label192:setText("ARMA");
    obj.label192:setName("label192");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout21);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(55);
    obj.edit230:setTop(30);
    obj.edit230:setWidth(225);
    obj.edit230:setHeight(25);
    obj.edit230:setField("arma20");
    obj.edit230:setName("edit230");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout21);
    obj.label193:setLeft(5);
    obj.label193:setTop(55);
    obj.label193:setWidth(50);
    obj.label193:setHeight(25);
    obj.label193:setText("TIPO");
    obj.label193:setName("label193");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout21);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(55);
    obj.edit231:setTop(55);
    obj.edit231:setWidth(225);
    obj.edit231:setHeight(25);
    obj.edit231:setField("tipo20");
    obj.edit231:setName("edit231");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout21);
    obj.button77:setLeft(279);
    obj.button77:setTop(6);
    obj.button77:setWidth(73);
    obj.button77:setText("ATAQUE");
    obj.button77:setFontSize(11);
    obj.button77:setName("button77");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout21);
    obj.edit232:setType("number");
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(352);
    obj.edit232:setTop(5);
    obj.edit232:setWidth(82);
    obj.edit232:setHeight(25);
    obj.edit232:setField("ataque20");
    obj.edit232:setName("edit232");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout21);
    obj.checkBox20:setLeft(434);
    obj.checkBox20:setTop(6);
    obj.checkBox20:setWidth(150);
    obj.checkBox20:setField("double20");
    obj.checkBox20:setText("Ataque Total");
    obj.checkBox20:setName("checkBox20");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout21);
    obj.dataLink20:setFields({'ataque20','double20'});
    obj.dataLink20:setName("dataLink20");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout21);
    obj.button78:setLeft(279);
    obj.button78:setTop(31);
    obj.button78:setWidth(73);
    obj.button78:setText("DANO");
    obj.button78:setFontSize(11);
    obj.button78:setName("button78");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout21);
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(352);
    obj.edit233:setTop(30);
    obj.edit233:setWidth(82);
    obj.edit233:setHeight(25);
    obj.edit233:setField("dano20");
    obj.edit233:setName("edit233");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout21);
    obj.button79:setLeft(434);
    obj.button79:setTop(31);
    obj.button79:setWidth(60);
    obj.button79:setText("CRITICO");
    obj.button79:setFontSize(11);
    obj.button79:setName("button79");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout21);
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(493);
    obj.edit234:setTop(30);
    obj.edit234:setWidth(82);
    obj.edit234:setHeight(25);
    obj.edit234:setField("danoCritico20");
    obj.edit234:setName("edit234");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout21);
    obj.label194:setLeft(290);
    obj.label194:setTop(55);
    obj.label194:setWidth(70);
    obj.label194:setHeight(25);
    obj.label194:setText("DECISIVO");
    obj.label194:setName("label194");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout21);
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(352);
    obj.edit235:setTop(55);
    obj.edit235:setWidth(82);
    obj.edit235:setHeight(25);
    obj.edit235:setField("decisivo20");
    obj.edit235:setName("edit235");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout21);
    obj.label195:setLeft(445);
    obj.label195:setTop(55);
    obj.label195:setWidth(50);
    obj.label195:setHeight(25);
    obj.label195:setText("MULTI");
    obj.label195:setName("label195");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout21);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(493);
    obj.edit236:setTop(55);
    obj.edit236:setWidth(82);
    obj.edit236:setHeight(25);
    obj.edit236:setField("multiplicador20");
    obj.edit236:setName("edit236");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout21);
    obj.label196:setLeft(580);
    obj.label196:setTop(5);
    obj.label196:setWidth(80);
    obj.label196:setHeight(25);
    obj.label196:setText("CATEGORIA");
    obj.label196:setName("label196");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout21);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(660);
    obj.edit237:setTop(5);
    obj.edit237:setWidth(200);
    obj.edit237:setHeight(25);
    obj.edit237:setField("categoria20");
    obj.edit237:setName("edit237");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout21);
    obj.label197:setLeft(610);
    obj.label197:setTop(30);
    obj.label197:setWidth(50);
    obj.label197:setHeight(25);
    obj.label197:setText("OBS");
    obj.label197:setName("label197");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout21);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(660);
    obj.edit238:setTop(30);
    obj.edit238:setWidth(200);
    obj.edit238:setHeight(25);
    obj.edit238:setField("obs20");
    obj.edit238:setName("edit238");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout21);
    obj.label198:setLeft(590);
    obj.label198:setTop(55);
    obj.label198:setWidth(80);
    obj.label198:setHeight(25);
    obj.label198:setText("MUNIÇÃO");
    obj.label198:setName("label198");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout21);
    obj.edit239:setType("number");
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(660);
    obj.edit239:setTop(55);
    obj.edit239:setWidth(69);
    obj.edit239:setHeight(25);
    obj.edit239:setField("municao20");
    obj.edit239:setName("edit239");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout21);
    obj.label199:setLeft(735);
    obj.label199:setTop(55);
    obj.label199:setWidth(70);
    obj.label199:setHeight(25);
    obj.label199:setText("ALCANCE");
    obj.label199:setName("label199");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout21);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(795);
    obj.edit240:setTop(55);
    obj.edit240:setWidth(65);
    obj.edit240:setHeight(25);
    obj.edit240:setField("alcance20");
    obj.edit240:setName("edit240");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout21);
    obj.rectangle41:setLeft(869);
    obj.rectangle41:setTop(4);
    obj.rectangle41:setWidth(332);
    obj.rectangle41:setHeight(77);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout21);
    obj.label200:setLeft(870);
    obj.label200:setTop(25);
    obj.label200:setWidth(330);
    obj.label200:setHeight(25);
    obj.label200:setHorzTextAlign("center");
    obj.label200:setText("Clique para adicionar imagem");
    obj.label200:setName("label200");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout21);
    obj.image20:setField("imagemArma20");
    obj.image20:setEditable(true);
    obj.image20:setStyle("autoFit");
    obj.image20:setLeft(870);
    obj.image20:setTop(5);
    obj.image20:setWidth(330);
    obj.image20:setHeight(75);
    obj.image20:setName("image20");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout21);
    obj.button80:setLeft(1205);
    obj.button80:setTop(5);
    obj.button80:setWidth(25);
    obj.button80:setHeight(75);
    obj.button80:setText("X");
    obj.button80:setFontSize(15);
    obj.button80:setHint("Apaga o ataque.");
    obj.button80:setName("button80");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque1a, sheet.ataque1b};
            	
            				decisivo = sheet.decisivo1 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano1 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico1 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome1;
            				if armamento==nil then armamento = sheet.arma1 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao1);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao1 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque1) or 0;
            
            				if sheet.double1 then
            					atk = atk - 4;
            					sheet.ataque1a = atk;
            					sheet.ataque1b = atk;
            				else
            					sheet.ataque1a = atk;
            					sheet.ataque1b = nil;
            				end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano1 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome1;
            				if armamento==nil then armamento = sheet.arma1 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico1 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome1;
            				if armamento==nil then armamento = sheet.arma1 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome1 = nil;
            							sheet.arma1 = nil;
            							sheet.tipo1 = nil;
            							sheet.ataque1 = nil;
            							sheet.ataque1a = nil;
            							sheet.ataque1b = nil;
            							sheet.dano1 = nil;
            							sheet.danoCritico1 = nil;
            							sheet.decisivo1 = nil;
            							sheet.multiplicador1 = nil;
            							sheet.categoria1 = nil;
            							sheet.obs1 = nil;
            							sheet.municao1 = nil;
            							sheet.alcance1 = nil;
            							sheet.imagemArma1 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque2a, sheet.ataque2b};
            	
            				decisivo = sheet.decisivo2 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano2 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico2 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome2;
            				if armamento==nil then armamento = sheet.arma2 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao2);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao2 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque2) or 0;
            
            				if sheet.double2 then
            					atk = atk - 4;
            					sheet.ataque2a = atk;
            					sheet.ataque2b = atk;
            				else
            					sheet.ataque2a = atk;
            					sheet.ataque2b = nil;
            				end;
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano2 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome2;
            				if armamento==nil then armamento = sheet.arma2 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico2 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome2;
            				if armamento==nil then armamento = sheet.arma2 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome2 = nil;
            							sheet.arma2 = nil;
            							sheet.tipo2 = nil;
            							sheet.ataque2 = nil;
            							sheet.ataque2a = nil;
            							sheet.ataque2b = nil;
            							sheet.dano2 = nil;
            							sheet.danoCritico2 = nil;
            							sheet.decisivo2 = nil;
            							sheet.multiplicador2 = nil;
            							sheet.categoria2 = nil;
            							sheet.obs2 = nil;
            							sheet.municao2 = nil;
            							sheet.alcance2 = nil;
            							sheet.imagemArma2 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque3a, sheet.ataque3b};
            	
            				decisivo = sheet.decisivo3 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano3 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico3 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome3;
            				if armamento==nil then armamento = sheet.arma3 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao3);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao3 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event11 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque3) or 0;
            
            				if sheet.double3 then
            					atk = atk - 4;
            					sheet.ataque3a = atk;
            					sheet.ataque3b = atk;
            				else
            					sheet.ataque3a = atk;
            					sheet.ataque3b = nil;
            				end;
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano3 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome3;
            				if armamento==nil then armamento = sheet.arma3 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event13 = obj.button11:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico3 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome3;
            				if armamento==nil then armamento = sheet.arma3 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event14 = obj.button12:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome3 = nil;
            							sheet.arma3 = nil;
            							sheet.tipo3 = nil;
            							sheet.ataque3 = nil;
            							sheet.ataque3a = nil;
            							sheet.ataque3b = nil;
            							sheet.dano3 = nil;
            							sheet.danoCritico3 = nil;
            							sheet.decisivo3 = nil;
            							sheet.multiplicador3 = nil;
            							sheet.categoria3 = nil;
            							sheet.obs3 = nil;
            							sheet.municao3 = nil;
            							sheet.alcance3 = nil;
            							sheet.imagemArma3 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event15 = obj.button13:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque4a, sheet.ataque4b};
            	
            				decisivo = sheet.decisivo4 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano4 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico4 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome4;
            				if armamento==nil then armamento = sheet.arma4 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao4);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao4 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event16 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque4) or 0;
            
            				if sheet.double4 then
            					atk = atk - 4;
            					sheet.ataque4a = atk;
            					sheet.ataque4b = atk;
            				else
            					sheet.ataque4a = atk;
            					sheet.ataque4b = nil;
            				end;
        end, obj);

    obj._e_event17 = obj.button14:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano4 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome4;
            				if armamento==nil then armamento = sheet.arma4 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event18 = obj.button15:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico4 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome4;
            				if armamento==nil then armamento = sheet.arma4 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event19 = obj.button16:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome4 = nil;
            							sheet.arma4 = nil;
            							sheet.tipo4 = nil;
            							sheet.ataque4 = nil;
            							sheet.ataque4a = nil;
            							sheet.ataque4b = nil;
            							sheet.dano4 = nil;
            							sheet.danoCritico4 = nil;
            							sheet.decisivo4 = nil;
            							sheet.multiplicador4 = nil;
            							sheet.categoria4 = nil;
            							sheet.obs4 = nil;
            							sheet.municao4 = nil;
            							sheet.alcance4 = nil;
            							sheet.imagemArma4 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event20 = obj.button17:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque5a, sheet.ataque5b};
            	
            				decisivo = sheet.decisivo5 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano5 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico5 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome5;
            				if armamento==nil then armamento = sheet.arma5 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao5);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao5 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event21 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque5) or 0;
            
            				if sheet.double5 then
            					atk = atk - 4;
            					sheet.ataque5a = atk;
            					sheet.ataque5b = atk;
            				else
            					sheet.ataque5a = atk;
            					sheet.ataque5b = nil;
            				end;
        end, obj);

    obj._e_event22 = obj.button18:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano5 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome5;
            				if armamento==nil then armamento = sheet.arma5 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event23 = obj.button19:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico5 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome5;
            				if armamento==nil then armamento = sheet.arma5 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event24 = obj.button20:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome5 = nil;
            							sheet.arma5 = nil;
            							sheet.tipo5 = nil;
            							sheet.ataque5 = nil;
            							sheet.ataque5a = nil;
            							sheet.ataque5b = nil;
            							sheet.dano5 = nil;
            							sheet.danoCritico5 = nil;
            							sheet.decisivo5 = nil;
            							sheet.multiplicador5 = nil;
            							sheet.categoria5 = nil;
            							sheet.obs5 = nil;
            							sheet.municao5 = nil;
            							sheet.alcance5 = nil;
            							sheet.imagemArma5 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event25 = obj.button21:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque6a, sheet.ataque6b};
            	
            				decisivo = sheet.decisivo6 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano6 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico6 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome6;
            				if armamento==nil then armamento = sheet.arma6 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao6);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao6 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event26 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque6) or 0;
            
            				if sheet.double6 then
            					atk = atk - 4;
            					sheet.ataque6a = atk;
            					sheet.ataque6b = atk;
            				else
            					sheet.ataque6a = atk;
            					sheet.ataque6b = nil;
            				end;
        end, obj);

    obj._e_event27 = obj.button22:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano6 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome6;
            				if armamento==nil then armamento = sheet.arma6 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event28 = obj.button23:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico6 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome6;
            				if armamento==nil then armamento = sheet.arma6 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event29 = obj.button24:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome6 = nil;
            							sheet.arma6 = nil;
            							sheet.tipo6 = nil;
            							sheet.ataque6 = nil;
            							sheet.ataque6a = nil;
            							sheet.ataque6b = nil;
            							sheet.dano6 = nil;
            							sheet.danoCritico6 = nil;
            							sheet.decisivo6 = nil;
            							sheet.multiplicador6 = nil;
            							sheet.categoria6 = nil;
            							sheet.obs6 = nil;
            							sheet.municao6 = nil;
            							sheet.alcance6 = nil;
            							sheet.imagemArma6 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event30 = obj.button25:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque7a, sheet.ataque7b};
            	
            				decisivo = sheet.decisivo7 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano7 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico7 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome7;
            				if armamento==nil then armamento = sheet.arma7 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao7);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao7 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event31 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque7) or 0;
            
            				if sheet.double7 then
            					atk = atk - 4;
            					sheet.ataque7a = atk;
            					sheet.ataque7b = atk;
            				else
            					sheet.ataque7a = atk;
            					sheet.ataque7b = nil;
            				end;
        end, obj);

    obj._e_event32 = obj.button26:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano7 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome7;
            				if armamento==nil then armamento = sheet.arma7 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event33 = obj.button27:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico7 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome7;
            				if armamento==nil then armamento = sheet.arma7 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event34 = obj.button28:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome7 = nil;
            							sheet.arma7 = nil;
            							sheet.tipo7 = nil;
            							sheet.ataque7 = nil;
            							sheet.ataque7a = nil;
            							sheet.ataque7b = nil;
            							sheet.dano7 = nil;
            							sheet.danoCritico7 = nil;
            							sheet.decisivo7 = nil;
            							sheet.multiplicador7 = nil;
            							sheet.categoria7 = nil;
            							sheet.obs7 = nil;
            							sheet.municao7 = nil;
            							sheet.alcance7 = nil;
            							sheet.imagemArma7 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event35 = obj.button29:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque8a, sheet.ataque8b};
            	
            				decisivo = sheet.decisivo8 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano8 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico8 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome8;
            				if armamento==nil then armamento = sheet.arma8 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao8);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao8 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event36 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque8) or 0;
            
            				if sheet.double8 then
            					atk = atk - 4;
            					sheet.ataque8a = atk;
            					sheet.ataque8b = atk;
            				else
            					sheet.ataque8a = atk;
            					sheet.ataque8b = nil;
            				end;
        end, obj);

    obj._e_event37 = obj.button30:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano8 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome8;
            				if armamento==nil then armamento = sheet.arma8 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event38 = obj.button31:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico8 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome8;
            				if armamento==nil then armamento = sheet.arma8 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event39 = obj.button32:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome8 = nil;
            							sheet.arma8 = nil;
            							sheet.tipo8 = nil;
            							sheet.ataque8 = nil;
            							sheet.ataque8a = nil;
            							sheet.ataque8b = nil;
            							sheet.dano8 = nil;
            							sheet.danoCritico8 = nil;
            							sheet.decisivo8 = nil;
            							sheet.multiplicador8 = nil;
            							sheet.categoria8 = nil;
            							sheet.obs8 = nil;
            							sheet.municao8 = nil;
            							sheet.alcance8 = nil;
            							sheet.imagemArma8 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event40 = obj.button33:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque9a, sheet.ataque9b};
            	
            				decisivo = sheet.decisivo9 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano9 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico9 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome9;
            				if armamento==nil then armamento = sheet.arma9 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao9);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao9 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event41 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque9) or 0;
            
            				if sheet.double9 then
            					atk = atk - 4;
            					sheet.ataque9a = atk;
            					sheet.ataque9b = atk;
            				else
            					sheet.ataque9a = atk;
            					sheet.ataque9b = nil;
            				end;
        end, obj);

    obj._e_event42 = obj.button34:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano9 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome9;
            				if armamento==nil then armamento = sheet.arma9 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event43 = obj.button35:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico9 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome9;
            				if armamento==nil then armamento = sheet.arma9 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event44 = obj.button36:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome9 = nil;
            							sheet.arma9 = nil;
            							sheet.tipo9 = nil;
            							sheet.ataque9 = nil;
            							sheet.ataque9a = nil;
            							sheet.ataque9b = nil;
            							sheet.dano9 = nil;
            							sheet.danoCritico9 = nil;
            							sheet.decisivo9 = nil;
            							sheet.multiplicador9 = nil;
            							sheet.categoria9 = nil;
            							sheet.obs9 = nil;
            							sheet.municao9 = nil;
            							sheet.alcance9 = nil;
            							sheet.imagemArma9 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event45 = obj.button37:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque10a, sheet.ataque10b};
            	
            				decisivo = sheet.decisivo10 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano10 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico10 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome10;
            				if armamento==nil then armamento = sheet.arma10 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao10);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao10 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event46 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque10) or 0;
            
            				if sheet.double10 then
            					atk = atk - 4;
            					sheet.ataque10a = atk;
            					sheet.ataque10b = atk;
            				else
            					sheet.ataque10a = atk;
            					sheet.ataque10b = nil;
            				end;
        end, obj);

    obj._e_event47 = obj.button38:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano10 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome10;
            				if armamento==nil then armamento = sheet.arma10 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event48 = obj.button39:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico10 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome10;
            				if armamento==nil then armamento = sheet.arma10 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event49 = obj.button40:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome10 = nil;
            							sheet.arma10 = nil;
            							sheet.tipo10 = nil;
            							sheet.ataque10 = nil;
            							sheet.ataque10a = nil;
            							sheet.ataque10b = nil;
            							sheet.dano10 = nil;
            							sheet.danoCritico10 = nil;
            							sheet.decisivo10 = nil;
            							sheet.multiplicador10 = nil;
            							sheet.categoria10 = nil;
            							sheet.obs10 = nil;
            							sheet.municao10 = nil;
            							sheet.alcance10 = nil;
            							sheet.imagemArma10 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event50 = obj.button41:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque11a, sheet.ataque11b};
            	
            				decisivo = sheet.decisivo11 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano11 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico11 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome11;
            				if armamento==nil then armamento = sheet.arma11 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao11);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao11 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event51 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque11) or 0;
            
            				if sheet.double11 then
            					atk = atk - 4;
            					sheet.ataque11a = atk;
            					sheet.ataque11b = atk;
            				else
            					sheet.ataque11a = atk;
            					sheet.ataque11b = nil;
            				end;
        end, obj);

    obj._e_event52 = obj.button42:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano11 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome11;
            				if armamento==nil then armamento = sheet.arma11 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event53 = obj.button43:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico11 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome11;
            				if armamento==nil then armamento = sheet.arma11 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event54 = obj.button44:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome11 = nil;
            							sheet.arma11 = nil;
            							sheet.tipo11 = nil;
            							sheet.ataque11 = nil;
            							sheet.ataque11a = nil;
            							sheet.ataque11b = nil;
            							sheet.dano11 = nil;
            							sheet.danoCritico11 = nil;
            							sheet.decisivo11 = nil;
            							sheet.multiplicador11 = nil;
            							sheet.categoria11 = nil;
            							sheet.obs11 = nil;
            							sheet.municao11 = nil;
            							sheet.alcance11 = nil;
            							sheet.imagemArma11 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event55 = obj.button45:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque12a, sheet.ataque12b};
            	
            				decisivo = sheet.decisivo12 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano12 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico12 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome12;
            				if armamento==nil then armamento = sheet.arma12 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao12);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao12 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event56 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque12) or 0;
            
            				if sheet.double12 then
            					atk = atk - 4;
            					sheet.ataque12a = atk;
            					sheet.ataque12b = atk;
            				else
            					sheet.ataque12a = atk;
            					sheet.ataque12b = nil;
            				end;
        end, obj);

    obj._e_event57 = obj.button46:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano12 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome12;
            				if armamento==nil then armamento = sheet.arma12 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event58 = obj.button47:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico12 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome12;
            				if armamento==nil then armamento = sheet.arma12 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event59 = obj.button48:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome12 = nil;
            							sheet.arma12 = nil;
            							sheet.tipo12 = nil;
            							sheet.ataque12 = nil;
            							sheet.ataque12a = nil;
            							sheet.ataque12b = nil;
            							sheet.dano12 = nil;
            							sheet.danoCritico12 = nil;
            							sheet.decisivo12 = nil;
            							sheet.multiplicador12 = nil;
            							sheet.categoria12 = nil;
            							sheet.obs12 = nil;
            							sheet.municao12 = nil;
            							sheet.alcance12 = nil;
            							sheet.imagemArma12 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event60 = obj.button49:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque13a, sheet.ataque13b};
            	
            				decisivo = sheet.decisivo13 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano13 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico13 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome13;
            				if armamento==nil then armamento = sheet.arma13 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao13);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao13 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event61 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque13) or 0;
            
            				if sheet.double13 then
            					atk = atk - 4;
            					sheet.ataque13a = atk;
            					sheet.ataque13b = atk;
            				else
            					sheet.ataque13a = atk;
            					sheet.ataque13b = nil;
            				end;
        end, obj);

    obj._e_event62 = obj.button50:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano13 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome13;
            				if armamento==nil then armamento = sheet.arma13 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event63 = obj.button51:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico13 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome13;
            				if armamento==nil then armamento = sheet.arma13 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event64 = obj.button52:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome13 = nil;
            							sheet.arma13 = nil;
            							sheet.tipo13 = nil;
            							sheet.ataque13 = nil;
            							sheet.ataque13a = nil;
            							sheet.ataque13b = nil;
            							sheet.dano13 = nil;
            							sheet.danoCritico13 = nil;
            							sheet.decisivo13 = nil;
            							sheet.multiplicador13 = nil;
            							sheet.categoria13 = nil;
            							sheet.obs13 = nil;
            							sheet.municao13 = nil;
            							sheet.alcance13 = nil;
            							sheet.imagemArma13 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event65 = obj.button53:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque14a, sheet.ataque14b};
            	
            				decisivo = sheet.decisivo14 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano14 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico14 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome14;
            				if armamento==nil then armamento = sheet.arma14 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao14);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao14 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event66 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque14) or 0;
            
            				if sheet.double14 then
            					atk = atk - 4;
            					sheet.ataque14a = atk;
            					sheet.ataque14b = atk;
            				else
            					sheet.ataque14a = atk;
            					sheet.ataque14b = nil;
            				end;
        end, obj);

    obj._e_event67 = obj.button54:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano14 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome14;
            				if armamento==nil then armamento = sheet.arma14 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event68 = obj.button55:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico14 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome14;
            				if armamento==nil then armamento = sheet.arma14 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event69 = obj.button56:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome14 = nil;
            							sheet.arma14 = nil;
            							sheet.tipo14 = nil;
            							sheet.ataque14 = nil;
            							sheet.ataque14a = nil;
            							sheet.ataque14b = nil;
            							sheet.dano14 = nil;
            							sheet.danoCritico14 = nil;
            							sheet.decisivo14 = nil;
            							sheet.multiplicador14 = nil;
            							sheet.categoria14 = nil;
            							sheet.obs14 = nil;
            							sheet.municao14 = nil;
            							sheet.alcance14 = nil;
            							sheet.imagemArma14 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event70 = obj.button57:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque15a, sheet.ataque15b};
            	
            				decisivo = sheet.decisivo15 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano15 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico15 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome15;
            				if armamento==nil then armamento = sheet.arma15 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao15);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao15 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event71 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque15) or 0;
            
            				if sheet.double15 then
            					atk = atk - 4;
            					sheet.ataque15a = atk;
            					sheet.ataque15b = atk;
            				else
            					sheet.ataque15a = atk;
            					sheet.ataque15b = nil;
            				end;
        end, obj);

    obj._e_event72 = obj.button58:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano15 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome15;
            				if armamento==nil then armamento = sheet.arma15 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event73 = obj.button59:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico15 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome15;
            				if armamento==nil then armamento = sheet.arma15 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event74 = obj.button60:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome15 = nil;
            							sheet.arma15 = nil;
            							sheet.tipo15 = nil;
            							sheet.ataque15 = nil;
            							sheet.ataque15a = nil;
            							sheet.ataque15b = nil;
            							sheet.dano15 = nil;
            							sheet.danoCritico15 = nil;
            							sheet.decisivo15 = nil;
            							sheet.multiplicador15 = nil;
            							sheet.categoria15 = nil;
            							sheet.obs15 = nil;
            							sheet.municao15 = nil;
            							sheet.alcance15 = nil;
            							sheet.imagemArma15 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event75 = obj.button61:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque16a, sheet.ataque16b};
            	
            				decisivo = sheet.decisivo16 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano16 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico16 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome16;
            				if armamento==nil then armamento = sheet.arma16 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao16);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao16 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event76 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque16) or 0;
            
            				if sheet.double16 then
            					atk = atk - 4;
            					sheet.ataque16a = atk;
            					sheet.ataque16b = atk;
            				else
            					sheet.ataque16a = atk;
            					sheet.ataque16b = nil;
            				end;
        end, obj);

    obj._e_event77 = obj.button62:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano16 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome16;
            				if armamento==nil then armamento = sheet.arma16 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event78 = obj.button63:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico16 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome16;
            				if armamento==nil then armamento = sheet.arma16 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event79 = obj.button64:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome16 = nil;
            							sheet.arma16 = nil;
            							sheet.tipo16 = nil;
            							sheet.ataque16 = nil;
            							sheet.ataque16a = nil;
            							sheet.ataque16b = nil;
            							sheet.dano16 = nil;
            							sheet.danoCritico16 = nil;
            							sheet.decisivo16 = nil;
            							sheet.multiplicador16 = nil;
            							sheet.categoria16 = nil;
            							sheet.obs16 = nil;
            							sheet.municao16 = nil;
            							sheet.alcance16 = nil;
            							sheet.imagemArma16 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event80 = obj.button65:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque17a, sheet.ataque17b};
            	
            				decisivo = sheet.decisivo17 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano17 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico17 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome17;
            				if armamento==nil then armamento = sheet.arma17 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao17);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao17 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event81 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque17) or 0;
            
            				if sheet.double17 then
            					atk = atk - 4;
            					sheet.ataque17a = atk;
            					sheet.ataque17b = atk;
            				else
            					sheet.ataque17a = atk;
            					sheet.ataque17b = nil;
            				end;
        end, obj);

    obj._e_event82 = obj.button66:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano17 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome17;
            				if armamento==nil then armamento = sheet.arma17 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event83 = obj.button67:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico17 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome17;
            				if armamento==nil then armamento = sheet.arma17 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event84 = obj.button68:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome17 = nil;
            							sheet.arma17 = nil;
            							sheet.tipo17 = nil;
            							sheet.ataque17 = nil;
            							sheet.ataque17a = nil;
            							sheet.ataque17b = nil;
            							sheet.dano17 = nil;
            							sheet.danoCritico17 = nil;
            							sheet.decisivo17 = nil;
            							sheet.multiplicador17 = nil;
            							sheet.categoria17 = nil;
            							sheet.obs17 = nil;
            							sheet.municao17 = nil;
            							sheet.alcance17 = nil;
            							sheet.imagemArma17 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event85 = obj.button69:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque18a, sheet.ataque18b};
            	
            				decisivo = sheet.decisivo18 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano18 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico18 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome18;
            				if armamento==nil then armamento = sheet.arma18 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao18);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao18 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event86 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque18) or 0;
            
            				if sheet.double18 then
            					atk = atk - 4;
            					sheet.ataque18a = atk;
            					sheet.ataque18b = atk;
            				else
            					sheet.ataque18a = atk;
            					sheet.ataque18b = nil;
            				end;
        end, obj);

    obj._e_event87 = obj.button70:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano18 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome18;
            				if armamento==nil then armamento = sheet.arma18 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event88 = obj.button71:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico18 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome18;
            				if armamento==nil then armamento = sheet.arma18 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event89 = obj.button72:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome18 = nil;
            							sheet.arma18 = nil;
            							sheet.tipo18 = nil;
            							sheet.ataque18 = nil;
            							sheet.ataque18a = nil;
            							sheet.ataque18b = nil;
            							sheet.dano18 = nil;
            							sheet.danoCritico18 = nil;
            							sheet.decisivo18 = nil;
            							sheet.multiplicador18 = nil;
            							sheet.categoria18 = nil;
            							sheet.obs18 = nil;
            							sheet.municao18 = nil;
            							sheet.alcance18 = nil;
            							sheet.imagemArma18 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event90 = obj.button73:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque19a, sheet.ataque19b};
            	
            				decisivo = sheet.decisivo19 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano19 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico19 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome19;
            				if armamento==nil then armamento = sheet.arma19 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao19);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao19 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event91 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque19) or 0;
            
            				if sheet.double19 then
            					atk = atk - 4;
            					sheet.ataque19a = atk;
            					sheet.ataque19b = atk;
            				else
            					sheet.ataque19a = atk;
            					sheet.ataque19b = nil;
            				end;
        end, obj);

    obj._e_event92 = obj.button74:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano19 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome19;
            				if armamento==nil then armamento = sheet.arma19 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event93 = obj.button75:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico19 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome19;
            				if armamento==nil then armamento = sheet.arma19 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event94 = obj.button76:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome19 = nil;
            							sheet.arma19 = nil;
            							sheet.tipo19 = nil;
            							sheet.ataque19 = nil;
            							sheet.ataque19a = nil;
            							sheet.ataque19b = nil;
            							sheet.dano19 = nil;
            							sheet.danoCritico19 = nil;
            							sheet.decisivo19 = nil;
            							sheet.multiplicador19 = nil;
            							sheet.categoria19 = nil;
            							sheet.obs19 = nil;
            							sheet.municao19 = nil;
            							sheet.alcance19 = nil;
            							sheet.imagemArma19 = nil;
            						end;
            					end);
        end, obj);

    obj._e_event95 = obj.button77:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				fimRolagem = false;
            				
            				array = {sheet.ataque20a, sheet.ataque20b};
            	
            				decisivo = sheet.decisivo20 or "20";
            				decisivo = tonumber(string.sub(decisivo, 1, 2));
            				
            				dano = sheet.dano20 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = sheet.danoCritico20 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome20;
            				if armamento==nil then armamento = sheet.arma20 end;
            				if armamento==nil then armamento = "arma" end;
            
            				municao = tonumber(sheet.municao20);
            				
            				local mesa = Firecast.getMesaDe(sheet);
            				while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local ataque = tonumber(array[1]) or 0;
            				if ataque~=nil then
            					rolagem = Firecast.interpretarRolagem("1d20 + " .. ataque);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            
            					mesa.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao20 = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event96 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atk = tonumber(sheet.ataque20) or 0;
            
            				if sheet.double20 then
            					atk = atk - 4;
            					sheet.ataque20a = atk;
            					sheet.ataque20b = atk;
            				else
            					sheet.ataque20a = atk;
            					sheet.ataque20b = nil;
            				end;
        end, obj);

    obj._e_event97 = obj.button78:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local dano = sheet.dano20 or "1d1";
            				dano = Firecast.interpretarRolagem(dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome20;
            				if armamento==nil then armamento = sheet.arma20 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(dano, "Dano com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event98 = obj.button79:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local danoCritico = sheet.danoCritico20 or "1d1";
            				danoCritico = Firecast.interpretarRolagem(danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome20;
            				if armamento==nil then armamento = sheet.arma20 end;
            				if armamento==nil then armamento = "arma" end;
            				
            				mesa.activeChat:rolarDados(danoCritico, "Dano Critico com " .. armamento .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event99 = obj.button80:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							sheet.nome20 = nil;
            							sheet.arma20 = nil;
            							sheet.tipo20 = nil;
            							sheet.ataque20 = nil;
            							sheet.ataque20a = nil;
            							sheet.ataque20b = nil;
            							sheet.dano20 = nil;
            							sheet.danoCritico20 = nil;
            							sheet.decisivo20 = nil;
            							sheet.multiplicador20 = nil;
            							sheet.categoria20 = nil;
            							sheet.obs20 = nil;
            							sheet.municao20 = nil;
            							sheet.alcance20 = nil;
            							sheet.imagemArma20 = nil;
            						end;
            					end);
        end, obj);

    function obj:_releaseEvents()
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
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
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
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister2_svg = {
    newEditor = newfrmFichaRPGmeister2_svg, 
    new = newfrmFichaRPGmeister2_svg, 
    name = "frmFichaRPGmeister2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister2_svg = _frmFichaRPGmeister2_svg;
Firecast.registrarForm(_frmFichaRPGmeister2_svg);

return _frmFichaRPGmeister2_svg;
