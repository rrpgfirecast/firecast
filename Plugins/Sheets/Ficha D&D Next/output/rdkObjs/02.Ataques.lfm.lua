require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister2_svg()
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
    obj:setName("frmFichaRPGmeister2_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function pos(rolado)
				local dado = rolado.ops[1].resultados[1];
				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
				local valor = rolado.resultado;
				
				if (dado>=decisivo or dado==1) then
					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Confirmando Critico");
				end;
				
				if dado>1 then
					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano do Ataque " .. i,
						function (rolagem)
							if sheet.alvo1~=nil and valor>=tonumber(sheet.alvo1) then
								danoAlvo1 = danoAlvo1 + rolagem.resultado;
							end;
							if sheet.alvo2~=nil and valor>=tonumber(sheet.alvo2) then
								danoAlvo2 = danoAlvo2 + rolagem.resultado;
							end;
							if sheet.alvo3~=nil and valor>=tonumber(sheet.alvo3) then
								danoAlvo3 = danoAlvo3 + rolagem.resultado;
							end;
							if sheet.alvo4~=nil and valor>=tonumber(sheet.alvo4) then
								danoAlvo4 = danoAlvo4 + rolagem.resultado;
							end;
							if sheet.alvo5~=nil and valor>=tonumber(sheet.alvo5) then
								danoAlvo5 = danoAlvo5 + rolagem.resultado;
							end;
							
							if fimRolagem and decisivo>dado then
								if sheet.alvo1~=nil or sheet.alvo2~=nil or sheet.alvo3~=nil or sheet.alvo4~=nil or sheet.alvo5~=nil then
									mesaDoPersonagem.activeChat:enviarMensagem("Danos: Alvo 1: " .. danoAlvo1 .. ", Alvo 2: " .. danoAlvo2 .. ", Alvo 3: " .. danoAlvo3 .. ", Alvo 4: " .. danoAlvo4 .. ", Alvo 5: " .. danoAlvo5 .. ".");
								end;
							end;
							
						end);
				end;
				
				if dado>=decisivo then
					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Extra do Critico "  .. i,
						function (rolagem)
							if sheet.alvo1~=nil and valor>=tonumber(sheet.alvo1) then
								danoAlvo1 = danoAlvo1 + rolagem.resultado;
							end;
							if sheet.alvo2~=nil and valor>=tonumber(sheet.alvo2) then
								danoAlvo2 = danoAlvo2 + rolagem.resultado;
							end;
							if sheet.alvo3~=nil and valor>=tonumber(sheet.alvo3) then
								danoAlvo3 = danoAlvo3 + rolagem.resultado;
							end;
							if sheet.alvo4~=nil and valor>=tonumber(sheet.alvo4) then
								danoAlvo4 = danoAlvo4 + rolagem.resultado;
							end;
							if sheet.alvo5~=nil and valor>=tonumber(sheet.alvo5) then
								danoAlvo5 = danoAlvo5 + rolagem.resultado;
							end;
							
							if fimRolagem then
								if sheet.alvo1~=nil or sheet.alvo2~=nil or sheet.alvo3~=nil or sheet.alvo4~=nil or sheet.alvo5~=nil then
									mesaDoPersonagem.activeChat:enviarMensagem("Danos: Alvo 1: " .. danoAlvo1 .. ", Alvo 2: " .. danoAlvo2 .. ", Alvo 3: " .. danoAlvo3 .. ", Alvo 4: " .. danoAlvo4 .. ", Alvo 5: " .. danoAlvo5 .. ".");
								end;
							end;
						end);
				end;
				
				i = i+1;
				local mod = tonumber(array[i]);
				
				if mod~=nil then
					rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
					if sheet.buffAtaque ~= nil then
					rolagem = rolagem:concatenar(sheet.buffAtaque);
					end;
					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
						function (rolado)
							pos(rolado)
						end);
				else
					fimRolagem = true;
				end;
				
				
			end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1209);
    obj.layout1:setHeight(1900);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(2);
    obj.layout2:setTop(2);
    obj.layout2:setWidth(1207);
    obj.layout2:setHeight(92);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(869);
    obj.rectangle3:setTop(4);
    obj.rectangle3:setWidth(332);
    obj.rectangle3:setHeight(77);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(55);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(225);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome1");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(50);
    obj.label2:setHeight(25);
    obj.label2:setText("ARMA");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(55);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(225);
    obj.edit2:setHeight(25);
    obj.edit2:setField("arma1");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setText("TIPO");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(55);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(225);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipo1");
    obj.edit3:setName("edit3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(279);
    obj.button1:setTop(6);
    obj.button1:setWidth(73);
    obj.button1:setText("ATAQUE");
    obj.button1:setFontSize(11);
    obj.button1:setName("button1");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setType("number");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(352);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(25);
    obj.edit4:setHeight(25);
    obj.edit4:setField("ataque1a");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setType("number");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(380);
    obj.edit5:setTop(5);
    obj.edit5:setWidth(25);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ataque1b");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setType("number");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(409);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(25);
    obj.edit6:setHeight(25);
    obj.edit6:setField("ataque1c");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setType("number");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(437);
    obj.edit7:setTop(5);
    obj.edit7:setWidth(25);
    obj.edit7:setHeight(25);
    obj.edit7:setField("ataque1d");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setType("number");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(465);
    obj.edit8:setTop(5);
    obj.edit8:setWidth(25);
    obj.edit8:setHeight(25);
    obj.edit8:setField("ataque1e");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setType("number");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(493);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(25);
    obj.edit9:setHeight(25);
    obj.edit9:setField("ataque1f");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setType("number");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(522);
    obj.edit10:setTop(5);
    obj.edit10:setWidth(25);
    obj.edit10:setHeight(25);
    obj.edit10:setField("ataque1g");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setType("number");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(550);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(25);
    obj.edit11:setHeight(25);
    obj.edit11:setField("ataque1h");
    obj.edit11:setName("edit11");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(279);
    obj.button2:setTop(31);
    obj.button2:setWidth(73);
    obj.button2:setText("DANO");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(352);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(82);
    obj.edit12:setHeight(25);
    obj.edit12:setField("dano1");
    obj.edit12:setName("edit12");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(434);
    obj.button3:setTop(31);
    obj.button3:setWidth(60);
    obj.button3:setText("CRITICO");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(493);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(82);
    obj.edit13:setHeight(25);
    obj.edit13:setField("danoCritico1");
    obj.edit13:setName("edit13");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(290);
    obj.label4:setTop(55);
    obj.label4:setWidth(70);
    obj.label4:setHeight(25);
    obj.label4:setText("DECISIVO");
    obj.label4:setName("label4");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(352);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(82);
    obj.edit14:setHeight(25);
    obj.edit14:setField("decisivo1");
    obj.edit14:setName("edit14");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(445);
    obj.label5:setTop(55);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("MULTI");
    obj.label5:setName("label5");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(493);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(82);
    obj.edit15:setHeight(25);
    obj.edit15:setField("multiplicador1");
    obj.edit15:setName("edit15");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(580);
    obj.label6:setTop(5);
    obj.label6:setWidth(80);
    obj.label6:setHeight(25);
    obj.label6:setText("CATEGORIA");
    obj.label6:setName("label6");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(660);
    obj.edit16:setTop(5);
    obj.edit16:setWidth(200);
    obj.edit16:setHeight(25);
    obj.edit16:setField("categoria1");
    obj.edit16:setName("edit16");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(610);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setText("OBS");
    obj.label7:setName("label7");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(660);
    obj.edit17:setTop(30);
    obj.edit17:setWidth(200);
    obj.edit17:setHeight(25);
    obj.edit17:setField("obs1");
    obj.edit17:setName("edit17");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(590);
    obj.label8:setTop(55);
    obj.label8:setWidth(80);
    obj.label8:setHeight(25);
    obj.label8:setText("MUNIÇÃO");
    obj.label8:setName("label8");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout2);
    obj.edit18:setType("number");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(660);
    obj.edit18:setTop(55);
    obj.edit18:setWidth(69);
    obj.edit18:setHeight(25);
    obj.edit18:setField("municao1");
    obj.edit18:setName("edit18");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(735);
    obj.label9:setTop(55);
    obj.label9:setWidth(70);
    obj.label9:setHeight(25);
    obj.label9:setText("ALCANCE");
    obj.label9:setName("label9");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout2);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(795);
    obj.edit19:setTop(55);
    obj.edit19:setWidth(65);
    obj.edit19:setHeight(25);
    obj.edit19:setField("alcance1");
    obj.edit19:setName("edit19");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(870);
    obj.label10:setTop(25);
    obj.label10:setWidth(330);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Clique para adicionar imagem");
    obj.label10:setName("label10");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setField("imagemArma1");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(870);
    obj.image1:setTop(5);
    obj.image1:setWidth(330);
    obj.image1:setHeight(75);
    obj.image1:setName("image1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(2);
    obj.layout3:setTop(97);
    obj.layout3:setWidth(1207);
    obj.layout3:setHeight(92);
    obj.layout3:setName("layout3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setLeft(869);
    obj.rectangle5:setTop(4);
    obj.rectangle5:setWidth(332);
    obj.rectangle5:setHeight(77);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(5);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setText("NOME");
    obj.label11:setName("label11");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(55);
    obj.edit20:setTop(5);
    obj.edit20:setWidth(225);
    obj.edit20:setHeight(25);
    obj.edit20:setField("nome2");
    obj.edit20:setName("edit20");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(5);
    obj.label12:setTop(30);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setText("ARMA");
    obj.label12:setName("label12");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout3);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(55);
    obj.edit21:setTop(30);
    obj.edit21:setWidth(225);
    obj.edit21:setHeight(25);
    obj.edit21:setField("arma2");
    obj.edit21:setName("edit21");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(5);
    obj.label13:setTop(55);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setText("TIPO");
    obj.label13:setName("label13");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout3);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(55);
    obj.edit22:setTop(55);
    obj.edit22:setWidth(225);
    obj.edit22:setHeight(25);
    obj.edit22:setField("tipo2");
    obj.edit22:setName("edit22");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(279);
    obj.button4:setTop(6);
    obj.button4:setWidth(73);
    obj.button4:setText("ATAQUE");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout3);
    obj.edit23:setType("number");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(352);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(25);
    obj.edit23:setHeight(25);
    obj.edit23:setField("ataque2a");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout3);
    obj.edit24:setType("number");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(380);
    obj.edit24:setTop(5);
    obj.edit24:setWidth(25);
    obj.edit24:setHeight(25);
    obj.edit24:setField("ataque2b");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout3);
    obj.edit25:setType("number");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(409);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(25);
    obj.edit25:setHeight(25);
    obj.edit25:setField("ataque2c");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout3);
    obj.edit26:setType("number");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(437);
    obj.edit26:setTop(5);
    obj.edit26:setWidth(25);
    obj.edit26:setHeight(25);
    obj.edit26:setField("ataque2d");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout3);
    obj.edit27:setType("number");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(465);
    obj.edit27:setTop(5);
    obj.edit27:setWidth(25);
    obj.edit27:setHeight(25);
    obj.edit27:setField("ataque2e");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout3);
    obj.edit28:setType("number");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(493);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(25);
    obj.edit28:setHeight(25);
    obj.edit28:setField("ataque2f");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout3);
    obj.edit29:setType("number");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(522);
    obj.edit29:setTop(5);
    obj.edit29:setWidth(25);
    obj.edit29:setHeight(25);
    obj.edit29:setField("ataque2g");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout3);
    obj.edit30:setType("number");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(550);
    obj.edit30:setTop(5);
    obj.edit30:setWidth(25);
    obj.edit30:setHeight(25);
    obj.edit30:setField("ataque2h");
    obj.edit30:setName("edit30");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(279);
    obj.button5:setTop(31);
    obj.button5:setWidth(73);
    obj.button5:setText("DANO");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout3);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(352);
    obj.edit31:setTop(30);
    obj.edit31:setWidth(82);
    obj.edit31:setHeight(25);
    obj.edit31:setField("dano2");
    obj.edit31:setName("edit31");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(434);
    obj.button6:setTop(31);
    obj.button6:setWidth(60);
    obj.button6:setText("CRITICO");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout3);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(493);
    obj.edit32:setTop(30);
    obj.edit32:setWidth(82);
    obj.edit32:setHeight(25);
    obj.edit32:setField("danoCritico2");
    obj.edit32:setName("edit32");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(290);
    obj.label14:setTop(55);
    obj.label14:setWidth(70);
    obj.label14:setHeight(25);
    obj.label14:setText("DECISIVO");
    obj.label14:setName("label14");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout3);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(352);
    obj.edit33:setTop(55);
    obj.edit33:setWidth(82);
    obj.edit33:setHeight(25);
    obj.edit33:setField("decisivo2");
    obj.edit33:setName("edit33");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(445);
    obj.label15:setTop(55);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setText("MULTI");
    obj.label15:setName("label15");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout3);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(493);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(82);
    obj.edit34:setHeight(25);
    obj.edit34:setField("multiplicador2");
    obj.edit34:setName("edit34");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(580);
    obj.label16:setTop(5);
    obj.label16:setWidth(80);
    obj.label16:setHeight(25);
    obj.label16:setText("CATEGORIA");
    obj.label16:setName("label16");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout3);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(660);
    obj.edit35:setTop(5);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setField("categoria2");
    obj.edit35:setName("edit35");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(610);
    obj.label17:setTop(30);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("OBS");
    obj.label17:setName("label17");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout3);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(660);
    obj.edit36:setTop(30);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setField("obs2");
    obj.edit36:setName("edit36");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(590);
    obj.label18:setTop(55);
    obj.label18:setWidth(80);
    obj.label18:setHeight(25);
    obj.label18:setText("MUNIÇÃO");
    obj.label18:setName("label18");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout3);
    obj.edit37:setType("number");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(660);
    obj.edit37:setTop(55);
    obj.edit37:setWidth(69);
    obj.edit37:setHeight(25);
    obj.edit37:setField("municao2");
    obj.edit37:setName("edit37");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(735);
    obj.label19:setTop(55);
    obj.label19:setWidth(70);
    obj.label19:setHeight(25);
    obj.label19:setText("ALCANCE");
    obj.label19:setName("label19");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout3);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(795);
    obj.edit38:setTop(55);
    obj.edit38:setWidth(65);
    obj.edit38:setHeight(25);
    obj.edit38:setField("alcance2");
    obj.edit38:setName("edit38");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(870);
    obj.label20:setTop(25);
    obj.label20:setWidth(330);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("Clique para adicionar imagem");
    obj.label20:setName("label20");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout3);
    obj.image2:setField("imagemArma2");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(870);
    obj.image2:setTop(5);
    obj.image2:setWidth(330);
    obj.image2:setHeight(75);
    obj.image2:setName("image2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(2);
    obj.layout4:setTop(192);
    obj.layout4:setWidth(1207);
    obj.layout4:setHeight(92);
    obj.layout4:setName("layout4");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setLeft(869);
    obj.rectangle7:setTop(4);
    obj.rectangle7:setWidth(332);
    obj.rectangle7:setHeight(77);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(5);
    obj.label21:setTop(5);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setText("NOME");
    obj.label21:setName("label21");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout4);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(55);
    obj.edit39:setTop(5);
    obj.edit39:setWidth(225);
    obj.edit39:setHeight(25);
    obj.edit39:setField("nome3");
    obj.edit39:setName("edit39");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(5);
    obj.label22:setTop(30);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setText("ARMA");
    obj.label22:setName("label22");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout4);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(55);
    obj.edit40:setTop(30);
    obj.edit40:setWidth(225);
    obj.edit40:setHeight(25);
    obj.edit40:setField("arma3");
    obj.edit40:setName("edit40");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(5);
    obj.label23:setTop(55);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setText("TIPO");
    obj.label23:setName("label23");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout4);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(55);
    obj.edit41:setTop(55);
    obj.edit41:setWidth(225);
    obj.edit41:setHeight(25);
    obj.edit41:setField("tipo3");
    obj.edit41:setName("edit41");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout4);
    obj.button7:setLeft(279);
    obj.button7:setTop(6);
    obj.button7:setWidth(73);
    obj.button7:setText("ATAQUE");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout4);
    obj.edit42:setType("number");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(352);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(25);
    obj.edit42:setHeight(25);
    obj.edit42:setField("ataque3a");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout4);
    obj.edit43:setType("number");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(380);
    obj.edit43:setTop(5);
    obj.edit43:setWidth(25);
    obj.edit43:setHeight(25);
    obj.edit43:setField("ataque3b");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout4);
    obj.edit44:setType("number");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(409);
    obj.edit44:setTop(5);
    obj.edit44:setWidth(25);
    obj.edit44:setHeight(25);
    obj.edit44:setField("ataque3c");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout4);
    obj.edit45:setType("number");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(437);
    obj.edit45:setTop(5);
    obj.edit45:setWidth(25);
    obj.edit45:setHeight(25);
    obj.edit45:setField("ataque3d");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout4);
    obj.edit46:setType("number");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(465);
    obj.edit46:setTop(5);
    obj.edit46:setWidth(25);
    obj.edit46:setHeight(25);
    obj.edit46:setField("ataque3e");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout4);
    obj.edit47:setType("number");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(493);
    obj.edit47:setTop(5);
    obj.edit47:setWidth(25);
    obj.edit47:setHeight(25);
    obj.edit47:setField("ataque3f");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout4);
    obj.edit48:setType("number");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(522);
    obj.edit48:setTop(5);
    obj.edit48:setWidth(25);
    obj.edit48:setHeight(25);
    obj.edit48:setField("ataque3g");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout4);
    obj.edit49:setType("number");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(550);
    obj.edit49:setTop(5);
    obj.edit49:setWidth(25);
    obj.edit49:setHeight(25);
    obj.edit49:setField("ataque3h");
    obj.edit49:setName("edit49");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout4);
    obj.button8:setLeft(279);
    obj.button8:setTop(31);
    obj.button8:setWidth(73);
    obj.button8:setText("DANO");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout4);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(352);
    obj.edit50:setTop(30);
    obj.edit50:setWidth(82);
    obj.edit50:setHeight(25);
    obj.edit50:setField("dano3");
    obj.edit50:setName("edit50");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout4);
    obj.button9:setLeft(434);
    obj.button9:setTop(31);
    obj.button9:setWidth(60);
    obj.button9:setText("CRITICO");
    obj.button9:setFontSize(11);
    obj.button9:setName("button9");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout4);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(493);
    obj.edit51:setTop(30);
    obj.edit51:setWidth(82);
    obj.edit51:setHeight(25);
    obj.edit51:setField("danoCritico3");
    obj.edit51:setName("edit51");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(290);
    obj.label24:setTop(55);
    obj.label24:setWidth(70);
    obj.label24:setHeight(25);
    obj.label24:setText("DECISIVO");
    obj.label24:setName("label24");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout4);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(352);
    obj.edit52:setTop(55);
    obj.edit52:setWidth(82);
    obj.edit52:setHeight(25);
    obj.edit52:setField("decisivo3");
    obj.edit52:setName("edit52");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(445);
    obj.label25:setTop(55);
    obj.label25:setWidth(50);
    obj.label25:setHeight(25);
    obj.label25:setText("MULTI");
    obj.label25:setName("label25");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout4);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(493);
    obj.edit53:setTop(55);
    obj.edit53:setWidth(82);
    obj.edit53:setHeight(25);
    obj.edit53:setField("multiplicador3");
    obj.edit53:setName("edit53");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(580);
    obj.label26:setTop(5);
    obj.label26:setWidth(80);
    obj.label26:setHeight(25);
    obj.label26:setText("CATEGORIA");
    obj.label26:setName("label26");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout4);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(660);
    obj.edit54:setTop(5);
    obj.edit54:setWidth(200);
    obj.edit54:setHeight(25);
    obj.edit54:setField("categoria3");
    obj.edit54:setName("edit54");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(610);
    obj.label27:setTop(30);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setText("OBS");
    obj.label27:setName("label27");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout4);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(660);
    obj.edit55:setTop(30);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(25);
    obj.edit55:setField("obs3");
    obj.edit55:setName("edit55");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(590);
    obj.label28:setTop(55);
    obj.label28:setWidth(80);
    obj.label28:setHeight(25);
    obj.label28:setText("MUNIÇÃO");
    obj.label28:setName("label28");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout4);
    obj.edit56:setType("number");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(660);
    obj.edit56:setTop(55);
    obj.edit56:setWidth(69);
    obj.edit56:setHeight(25);
    obj.edit56:setField("municao3");
    obj.edit56:setName("edit56");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(735);
    obj.label29:setTop(55);
    obj.label29:setWidth(70);
    obj.label29:setHeight(25);
    obj.label29:setText("ALCANCE");
    obj.label29:setName("label29");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout4);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(795);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(65);
    obj.edit57:setHeight(25);
    obj.edit57:setField("alcance3");
    obj.edit57:setName("edit57");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(870);
    obj.label30:setTop(25);
    obj.label30:setWidth(330);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setText("Clique para adicionar imagem");
    obj.label30:setName("label30");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout4);
    obj.image3:setField("imagemArma3");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(870);
    obj.image3:setTop(5);
    obj.image3:setWidth(330);
    obj.image3:setHeight(75);
    obj.image3:setName("image3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(2);
    obj.layout5:setTop(288);
    obj.layout5:setWidth(1207);
    obj.layout5:setHeight(92);
    obj.layout5:setName("layout5");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout5);
    obj.rectangle9:setLeft(869);
    obj.rectangle9:setTop(4);
    obj.rectangle9:setWidth(332);
    obj.rectangle9:setHeight(77);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout5);
    obj.label31:setLeft(5);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(25);
    obj.label31:setText("NOME");
    obj.label31:setName("label31");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout5);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(55);
    obj.edit58:setTop(5);
    obj.edit58:setWidth(225);
    obj.edit58:setHeight(25);
    obj.edit58:setField("nome4");
    obj.edit58:setName("edit58");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout5);
    obj.label32:setLeft(5);
    obj.label32:setTop(30);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setText("ARMA");
    obj.label32:setName("label32");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout5);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(55);
    obj.edit59:setTop(30);
    obj.edit59:setWidth(225);
    obj.edit59:setHeight(25);
    obj.edit59:setField("arma4");
    obj.edit59:setName("edit59");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout5);
    obj.label33:setLeft(5);
    obj.label33:setTop(55);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setText("TIPO");
    obj.label33:setName("label33");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout5);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(55);
    obj.edit60:setTop(55);
    obj.edit60:setWidth(225);
    obj.edit60:setHeight(25);
    obj.edit60:setField("tipo4");
    obj.edit60:setName("edit60");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(279);
    obj.button10:setTop(6);
    obj.button10:setWidth(73);
    obj.button10:setText("ATAQUE");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout5);
    obj.edit61:setType("number");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(352);
    obj.edit61:setTop(5);
    obj.edit61:setWidth(25);
    obj.edit61:setHeight(25);
    obj.edit61:setField("ataque4a");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout5);
    obj.edit62:setType("number");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(380);
    obj.edit62:setTop(5);
    obj.edit62:setWidth(25);
    obj.edit62:setHeight(25);
    obj.edit62:setField("ataque4b");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout5);
    obj.edit63:setType("number");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(409);
    obj.edit63:setTop(5);
    obj.edit63:setWidth(25);
    obj.edit63:setHeight(25);
    obj.edit63:setField("ataque4c");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout5);
    obj.edit64:setType("number");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(437);
    obj.edit64:setTop(5);
    obj.edit64:setWidth(25);
    obj.edit64:setHeight(25);
    obj.edit64:setField("ataque4d");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout5);
    obj.edit65:setType("number");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(465);
    obj.edit65:setTop(5);
    obj.edit65:setWidth(25);
    obj.edit65:setHeight(25);
    obj.edit65:setField("ataque4e");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout5);
    obj.edit66:setType("number");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(493);
    obj.edit66:setTop(5);
    obj.edit66:setWidth(25);
    obj.edit66:setHeight(25);
    obj.edit66:setField("ataque4f");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout5);
    obj.edit67:setType("number");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(522);
    obj.edit67:setTop(5);
    obj.edit67:setWidth(25);
    obj.edit67:setHeight(25);
    obj.edit67:setField("ataque4g");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout5);
    obj.edit68:setType("number");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(550);
    obj.edit68:setTop(5);
    obj.edit68:setWidth(25);
    obj.edit68:setHeight(25);
    obj.edit68:setField("ataque4h");
    obj.edit68:setName("edit68");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout5);
    obj.button11:setLeft(279);
    obj.button11:setTop(31);
    obj.button11:setWidth(73);
    obj.button11:setText("DANO");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout5);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(352);
    obj.edit69:setTop(30);
    obj.edit69:setWidth(82);
    obj.edit69:setHeight(25);
    obj.edit69:setField("dano4");
    obj.edit69:setName("edit69");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout5);
    obj.button12:setLeft(434);
    obj.button12:setTop(31);
    obj.button12:setWidth(60);
    obj.button12:setText("CRITICO");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout5);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(493);
    obj.edit70:setTop(30);
    obj.edit70:setWidth(82);
    obj.edit70:setHeight(25);
    obj.edit70:setField("danoCritico4");
    obj.edit70:setName("edit70");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(290);
    obj.label34:setTop(55);
    obj.label34:setWidth(70);
    obj.label34:setHeight(25);
    obj.label34:setText("DECISIVO");
    obj.label34:setName("label34");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout5);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(352);
    obj.edit71:setTop(55);
    obj.edit71:setWidth(82);
    obj.edit71:setHeight(25);
    obj.edit71:setField("decisivo4");
    obj.edit71:setName("edit71");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout5);
    obj.label35:setLeft(445);
    obj.label35:setTop(55);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setText("MULTI");
    obj.label35:setName("label35");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout5);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(493);
    obj.edit72:setTop(55);
    obj.edit72:setWidth(82);
    obj.edit72:setHeight(25);
    obj.edit72:setField("multiplicador4");
    obj.edit72:setName("edit72");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(580);
    obj.label36:setTop(5);
    obj.label36:setWidth(80);
    obj.label36:setHeight(25);
    obj.label36:setText("CATEGORIA");
    obj.label36:setName("label36");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout5);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(660);
    obj.edit73:setTop(5);
    obj.edit73:setWidth(200);
    obj.edit73:setHeight(25);
    obj.edit73:setField("categoria4");
    obj.edit73:setName("edit73");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(610);
    obj.label37:setTop(30);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setText("OBS");
    obj.label37:setName("label37");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout5);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(660);
    obj.edit74:setTop(30);
    obj.edit74:setWidth(200);
    obj.edit74:setHeight(25);
    obj.edit74:setField("obs4");
    obj.edit74:setName("edit74");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(590);
    obj.label38:setTop(55);
    obj.label38:setWidth(80);
    obj.label38:setHeight(25);
    obj.label38:setText("MUNIÇÃO");
    obj.label38:setName("label38");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout5);
    obj.edit75:setType("number");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(660);
    obj.edit75:setTop(55);
    obj.edit75:setWidth(69);
    obj.edit75:setHeight(25);
    obj.edit75:setField("municao4");
    obj.edit75:setName("edit75");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(735);
    obj.label39:setTop(55);
    obj.label39:setWidth(70);
    obj.label39:setHeight(25);
    obj.label39:setText("ALCANCE");
    obj.label39:setName("label39");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout5);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(795);
    obj.edit76:setTop(55);
    obj.edit76:setWidth(65);
    obj.edit76:setHeight(25);
    obj.edit76:setField("alcance4");
    obj.edit76:setName("edit76");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(870);
    obj.label40:setTop(25);
    obj.label40:setWidth(330);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setText("Clique para adicionar imagem");
    obj.label40:setName("label40");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout5);
    obj.image4:setField("imagemArma4");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setLeft(870);
    obj.image4:setTop(5);
    obj.image4:setWidth(330);
    obj.image4:setHeight(75);
    obj.image4:setName("image4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(383);
    obj.layout6:setWidth(1207);
    obj.layout6:setHeight(92);
    obj.layout6:setName("layout6");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout6);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout6);
    obj.rectangle11:setLeft(869);
    obj.rectangle11:setTop(4);
    obj.rectangle11:setWidth(332);
    obj.rectangle11:setHeight(77);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(5);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("NOME");
    obj.label41:setName("label41");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout6);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(55);
    obj.edit77:setTop(5);
    obj.edit77:setWidth(225);
    obj.edit77:setHeight(25);
    obj.edit77:setField("nome5");
    obj.edit77:setName("edit77");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(5);
    obj.label42:setTop(30);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("ARMA");
    obj.label42:setName("label42");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout6);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(55);
    obj.edit78:setTop(30);
    obj.edit78:setWidth(225);
    obj.edit78:setHeight(25);
    obj.edit78:setField("arma5");
    obj.edit78:setName("edit78");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout6);
    obj.label43:setLeft(5);
    obj.label43:setTop(55);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setText("TIPO");
    obj.label43:setName("label43");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout6);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(55);
    obj.edit79:setTop(55);
    obj.edit79:setWidth(225);
    obj.edit79:setHeight(25);
    obj.edit79:setField("tipo5");
    obj.edit79:setName("edit79");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout6);
    obj.button13:setLeft(279);
    obj.button13:setTop(6);
    obj.button13:setWidth(73);
    obj.button13:setText("ATAQUE");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout6);
    obj.edit80:setType("number");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(352);
    obj.edit80:setTop(5);
    obj.edit80:setWidth(25);
    obj.edit80:setHeight(25);
    obj.edit80:setField("ataque5a");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout6);
    obj.edit81:setType("number");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(380);
    obj.edit81:setTop(5);
    obj.edit81:setWidth(25);
    obj.edit81:setHeight(25);
    obj.edit81:setField("ataque5b");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout6);
    obj.edit82:setType("number");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(409);
    obj.edit82:setTop(5);
    obj.edit82:setWidth(25);
    obj.edit82:setHeight(25);
    obj.edit82:setField("ataque5c");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout6);
    obj.edit83:setType("number");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(437);
    obj.edit83:setTop(5);
    obj.edit83:setWidth(25);
    obj.edit83:setHeight(25);
    obj.edit83:setField("ataque5d");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout6);
    obj.edit84:setType("number");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(465);
    obj.edit84:setTop(5);
    obj.edit84:setWidth(25);
    obj.edit84:setHeight(25);
    obj.edit84:setField("ataque5e");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout6);
    obj.edit85:setType("number");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(493);
    obj.edit85:setTop(5);
    obj.edit85:setWidth(25);
    obj.edit85:setHeight(25);
    obj.edit85:setField("ataque5f");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout6);
    obj.edit86:setType("number");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(522);
    obj.edit86:setTop(5);
    obj.edit86:setWidth(25);
    obj.edit86:setHeight(25);
    obj.edit86:setField("ataque5g");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout6);
    obj.edit87:setType("number");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(550);
    obj.edit87:setTop(5);
    obj.edit87:setWidth(25);
    obj.edit87:setHeight(25);
    obj.edit87:setField("ataque5h");
    obj.edit87:setName("edit87");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout6);
    obj.button14:setLeft(279);
    obj.button14:setTop(31);
    obj.button14:setWidth(73);
    obj.button14:setText("DANO");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout6);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(352);
    obj.edit88:setTop(30);
    obj.edit88:setWidth(82);
    obj.edit88:setHeight(25);
    obj.edit88:setField("dano5");
    obj.edit88:setName("edit88");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout6);
    obj.button15:setLeft(434);
    obj.button15:setTop(31);
    obj.button15:setWidth(60);
    obj.button15:setText("CRITICO");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout6);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(493);
    obj.edit89:setTop(30);
    obj.edit89:setWidth(82);
    obj.edit89:setHeight(25);
    obj.edit89:setField("danoCritico5");
    obj.edit89:setName("edit89");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout6);
    obj.label44:setLeft(290);
    obj.label44:setTop(55);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("DECISIVO");
    obj.label44:setName("label44");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout6);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(352);
    obj.edit90:setTop(55);
    obj.edit90:setWidth(82);
    obj.edit90:setHeight(25);
    obj.edit90:setField("decisivo5");
    obj.edit90:setName("edit90");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout6);
    obj.label45:setLeft(445);
    obj.label45:setTop(55);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setText("MULTI");
    obj.label45:setName("label45");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout6);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(493);
    obj.edit91:setTop(55);
    obj.edit91:setWidth(82);
    obj.edit91:setHeight(25);
    obj.edit91:setField("multiplicador5");
    obj.edit91:setName("edit91");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout6);
    obj.label46:setLeft(580);
    obj.label46:setTop(5);
    obj.label46:setWidth(80);
    obj.label46:setHeight(25);
    obj.label46:setText("CATEGORIA");
    obj.label46:setName("label46");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout6);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(660);
    obj.edit92:setTop(5);
    obj.edit92:setWidth(200);
    obj.edit92:setHeight(25);
    obj.edit92:setField("categoria5");
    obj.edit92:setName("edit92");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout6);
    obj.label47:setLeft(610);
    obj.label47:setTop(30);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setText("OBS");
    obj.label47:setName("label47");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout6);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(660);
    obj.edit93:setTop(30);
    obj.edit93:setWidth(200);
    obj.edit93:setHeight(25);
    obj.edit93:setField("obs5");
    obj.edit93:setName("edit93");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout6);
    obj.label48:setLeft(590);
    obj.label48:setTop(55);
    obj.label48:setWidth(80);
    obj.label48:setHeight(25);
    obj.label48:setText("MUNIÇÃO");
    obj.label48:setName("label48");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout6);
    obj.edit94:setType("number");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(660);
    obj.edit94:setTop(55);
    obj.edit94:setWidth(69);
    obj.edit94:setHeight(25);
    obj.edit94:setField("municao5");
    obj.edit94:setName("edit94");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(735);
    obj.label49:setTop(55);
    obj.label49:setWidth(70);
    obj.label49:setHeight(25);
    obj.label49:setText("ALCANCE");
    obj.label49:setName("label49");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout6);
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(795);
    obj.edit95:setTop(55);
    obj.edit95:setWidth(65);
    obj.edit95:setHeight(25);
    obj.edit95:setField("alcance5");
    obj.edit95:setName("edit95");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(870);
    obj.label50:setTop(25);
    obj.label50:setWidth(330);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Clique para adicionar imagem");
    obj.label50:setName("label50");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout6);
    obj.image5:setField("imagemArma5");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setLeft(870);
    obj.image5:setTop(5);
    obj.image5:setWidth(330);
    obj.image5:setHeight(75);
    obj.image5:setName("image5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(2);
    obj.layout7:setTop(478);
    obj.layout7:setWidth(1207);
    obj.layout7:setHeight(92);
    obj.layout7:setName("layout7");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout7);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout7);
    obj.rectangle13:setLeft(869);
    obj.rectangle13:setTop(4);
    obj.rectangle13:setWidth(332);
    obj.rectangle13:setHeight(77);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout7);
    obj.label51:setLeft(5);
    obj.label51:setTop(5);
    obj.label51:setWidth(50);
    obj.label51:setHeight(25);
    obj.label51:setText("NOME");
    obj.label51:setName("label51");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout7);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(55);
    obj.edit96:setTop(5);
    obj.edit96:setWidth(225);
    obj.edit96:setHeight(25);
    obj.edit96:setField("nome6");
    obj.edit96:setName("edit96");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout7);
    obj.label52:setLeft(5);
    obj.label52:setTop(30);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setText("ARMA");
    obj.label52:setName("label52");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout7);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(55);
    obj.edit97:setTop(30);
    obj.edit97:setWidth(225);
    obj.edit97:setHeight(25);
    obj.edit97:setField("arma6");
    obj.edit97:setName("edit97");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout7);
    obj.label53:setLeft(5);
    obj.label53:setTop(55);
    obj.label53:setWidth(50);
    obj.label53:setHeight(25);
    obj.label53:setText("TIPO");
    obj.label53:setName("label53");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout7);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(55);
    obj.edit98:setTop(55);
    obj.edit98:setWidth(225);
    obj.edit98:setHeight(25);
    obj.edit98:setField("tipo6");
    obj.edit98:setName("edit98");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout7);
    obj.button16:setLeft(279);
    obj.button16:setTop(6);
    obj.button16:setWidth(73);
    obj.button16:setText("ATAQUE");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout7);
    obj.edit99:setType("number");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(352);
    obj.edit99:setTop(5);
    obj.edit99:setWidth(25);
    obj.edit99:setHeight(25);
    obj.edit99:setField("ataque6a");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout7);
    obj.edit100:setType("number");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(380);
    obj.edit100:setTop(5);
    obj.edit100:setWidth(25);
    obj.edit100:setHeight(25);
    obj.edit100:setField("ataque6b");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout7);
    obj.edit101:setType("number");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(409);
    obj.edit101:setTop(5);
    obj.edit101:setWidth(25);
    obj.edit101:setHeight(25);
    obj.edit101:setField("ataque6c");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout7);
    obj.edit102:setType("number");
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(437);
    obj.edit102:setTop(5);
    obj.edit102:setWidth(25);
    obj.edit102:setHeight(25);
    obj.edit102:setField("ataque6d");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout7);
    obj.edit103:setType("number");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(465);
    obj.edit103:setTop(5);
    obj.edit103:setWidth(25);
    obj.edit103:setHeight(25);
    obj.edit103:setField("ataque6e");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout7);
    obj.edit104:setType("number");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(493);
    obj.edit104:setTop(5);
    obj.edit104:setWidth(25);
    obj.edit104:setHeight(25);
    obj.edit104:setField("ataque6f");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout7);
    obj.edit105:setType("number");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(522);
    obj.edit105:setTop(5);
    obj.edit105:setWidth(25);
    obj.edit105:setHeight(25);
    obj.edit105:setField("ataque6g");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout7);
    obj.edit106:setType("number");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(550);
    obj.edit106:setTop(5);
    obj.edit106:setWidth(25);
    obj.edit106:setHeight(25);
    obj.edit106:setField("ataque6h");
    obj.edit106:setName("edit106");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout7);
    obj.button17:setLeft(279);
    obj.button17:setTop(31);
    obj.button17:setWidth(73);
    obj.button17:setText("DANO");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout7);
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(352);
    obj.edit107:setTop(30);
    obj.edit107:setWidth(82);
    obj.edit107:setHeight(25);
    obj.edit107:setField("dano6");
    obj.edit107:setName("edit107");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout7);
    obj.button18:setLeft(434);
    obj.button18:setTop(31);
    obj.button18:setWidth(60);
    obj.button18:setText("CRITICO");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout7);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(493);
    obj.edit108:setTop(30);
    obj.edit108:setWidth(82);
    obj.edit108:setHeight(25);
    obj.edit108:setField("danoCritico6");
    obj.edit108:setName("edit108");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout7);
    obj.label54:setLeft(290);
    obj.label54:setTop(55);
    obj.label54:setWidth(70);
    obj.label54:setHeight(25);
    obj.label54:setText("DECISIVO");
    obj.label54:setName("label54");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout7);
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(352);
    obj.edit109:setTop(55);
    obj.edit109:setWidth(82);
    obj.edit109:setHeight(25);
    obj.edit109:setField("decisivo6");
    obj.edit109:setName("edit109");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout7);
    obj.label55:setLeft(445);
    obj.label55:setTop(55);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setText("MULTI");
    obj.label55:setName("label55");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout7);
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(493);
    obj.edit110:setTop(55);
    obj.edit110:setWidth(82);
    obj.edit110:setHeight(25);
    obj.edit110:setField("multiplicador6");
    obj.edit110:setName("edit110");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout7);
    obj.label56:setLeft(580);
    obj.label56:setTop(5);
    obj.label56:setWidth(80);
    obj.label56:setHeight(25);
    obj.label56:setText("CATEGORIA");
    obj.label56:setName("label56");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout7);
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(660);
    obj.edit111:setTop(5);
    obj.edit111:setWidth(200);
    obj.edit111:setHeight(25);
    obj.edit111:setField("categoria6");
    obj.edit111:setName("edit111");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout7);
    obj.label57:setLeft(610);
    obj.label57:setTop(30);
    obj.label57:setWidth(50);
    obj.label57:setHeight(25);
    obj.label57:setText("OBS");
    obj.label57:setName("label57");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout7);
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(660);
    obj.edit112:setTop(30);
    obj.edit112:setWidth(200);
    obj.edit112:setHeight(25);
    obj.edit112:setField("obs6");
    obj.edit112:setName("edit112");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout7);
    obj.label58:setLeft(590);
    obj.label58:setTop(55);
    obj.label58:setWidth(80);
    obj.label58:setHeight(25);
    obj.label58:setText("MUNIÇÃO");
    obj.label58:setName("label58");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout7);
    obj.edit113:setType("number");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(660);
    obj.edit113:setTop(55);
    obj.edit113:setWidth(69);
    obj.edit113:setHeight(25);
    obj.edit113:setField("municao6");
    obj.edit113:setName("edit113");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout7);
    obj.label59:setLeft(735);
    obj.label59:setTop(55);
    obj.label59:setWidth(70);
    obj.label59:setHeight(25);
    obj.label59:setText("ALCANCE");
    obj.label59:setName("label59");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout7);
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(795);
    obj.edit114:setTop(55);
    obj.edit114:setWidth(65);
    obj.edit114:setHeight(25);
    obj.edit114:setField("alcance6");
    obj.edit114:setName("edit114");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setLeft(870);
    obj.label60:setTop(25);
    obj.label60:setWidth(330);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Clique para adicionar imagem");
    obj.label60:setName("label60");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout7);
    obj.image6:setField("imagemArma6");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setLeft(870);
    obj.image6:setTop(5);
    obj.image6:setWidth(330);
    obj.image6:setHeight(75);
    obj.image6:setName("image6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(2);
    obj.layout8:setTop(573);
    obj.layout8:setWidth(1207);
    obj.layout8:setHeight(92);
    obj.layout8:setName("layout8");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout8);
    obj.rectangle15:setLeft(869);
    obj.rectangle15:setTop(4);
    obj.rectangle15:setWidth(332);
    obj.rectangle15:setHeight(77);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout8);
    obj.label61:setLeft(5);
    obj.label61:setTop(5);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setText("NOME");
    obj.label61:setName("label61");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout8);
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(55);
    obj.edit115:setTop(5);
    obj.edit115:setWidth(225);
    obj.edit115:setHeight(25);
    obj.edit115:setField("nome7");
    obj.edit115:setName("edit115");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout8);
    obj.label62:setLeft(5);
    obj.label62:setTop(30);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setText("ARMA");
    obj.label62:setName("label62");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout8);
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(55);
    obj.edit116:setTop(30);
    obj.edit116:setWidth(225);
    obj.edit116:setHeight(25);
    obj.edit116:setField("arma7");
    obj.edit116:setName("edit116");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout8);
    obj.label63:setLeft(5);
    obj.label63:setTop(55);
    obj.label63:setWidth(50);
    obj.label63:setHeight(25);
    obj.label63:setText("TIPO");
    obj.label63:setName("label63");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout8);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(55);
    obj.edit117:setTop(55);
    obj.edit117:setWidth(225);
    obj.edit117:setHeight(25);
    obj.edit117:setField("tipo7");
    obj.edit117:setName("edit117");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout8);
    obj.button19:setLeft(279);
    obj.button19:setTop(6);
    obj.button19:setWidth(73);
    obj.button19:setText("ATAQUE");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout8);
    obj.edit118:setType("number");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(352);
    obj.edit118:setTop(5);
    obj.edit118:setWidth(25);
    obj.edit118:setHeight(25);
    obj.edit118:setField("ataque7a");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout8);
    obj.edit119:setType("number");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(380);
    obj.edit119:setTop(5);
    obj.edit119:setWidth(25);
    obj.edit119:setHeight(25);
    obj.edit119:setField("ataque7b");
    obj.edit119:setName("edit119");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout8);
    obj.edit120:setType("number");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(409);
    obj.edit120:setTop(5);
    obj.edit120:setWidth(25);
    obj.edit120:setHeight(25);
    obj.edit120:setField("ataque7c");
    obj.edit120:setName("edit120");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout8);
    obj.edit121:setType("number");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(437);
    obj.edit121:setTop(5);
    obj.edit121:setWidth(25);
    obj.edit121:setHeight(25);
    obj.edit121:setField("ataque7d");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout8);
    obj.edit122:setType("number");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(465);
    obj.edit122:setTop(5);
    obj.edit122:setWidth(25);
    obj.edit122:setHeight(25);
    obj.edit122:setField("ataque7e");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout8);
    obj.edit123:setType("number");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(493);
    obj.edit123:setTop(5);
    obj.edit123:setWidth(25);
    obj.edit123:setHeight(25);
    obj.edit123:setField("ataque7f");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout8);
    obj.edit124:setType("number");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(522);
    obj.edit124:setTop(5);
    obj.edit124:setWidth(25);
    obj.edit124:setHeight(25);
    obj.edit124:setField("ataque7g");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout8);
    obj.edit125:setType("number");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(550);
    obj.edit125:setTop(5);
    obj.edit125:setWidth(25);
    obj.edit125:setHeight(25);
    obj.edit125:setField("ataque7h");
    obj.edit125:setName("edit125");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout8);
    obj.button20:setLeft(279);
    obj.button20:setTop(31);
    obj.button20:setWidth(73);
    obj.button20:setText("DANO");
    obj.button20:setFontSize(11);
    obj.button20:setName("button20");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout8);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(352);
    obj.edit126:setTop(30);
    obj.edit126:setWidth(82);
    obj.edit126:setHeight(25);
    obj.edit126:setField("dano7");
    obj.edit126:setName("edit126");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout8);
    obj.button21:setLeft(434);
    obj.button21:setTop(31);
    obj.button21:setWidth(60);
    obj.button21:setText("CRITICO");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout8);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(493);
    obj.edit127:setTop(30);
    obj.edit127:setWidth(82);
    obj.edit127:setHeight(25);
    obj.edit127:setField("danoCritico7");
    obj.edit127:setName("edit127");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout8);
    obj.label64:setLeft(290);
    obj.label64:setTop(55);
    obj.label64:setWidth(70);
    obj.label64:setHeight(25);
    obj.label64:setText("DECISIVO");
    obj.label64:setName("label64");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout8);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(352);
    obj.edit128:setTop(55);
    obj.edit128:setWidth(82);
    obj.edit128:setHeight(25);
    obj.edit128:setField("decisivo7");
    obj.edit128:setName("edit128");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout8);
    obj.label65:setLeft(445);
    obj.label65:setTop(55);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setText("MULTI");
    obj.label65:setName("label65");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout8);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(493);
    obj.edit129:setTop(55);
    obj.edit129:setWidth(82);
    obj.edit129:setHeight(25);
    obj.edit129:setField("multiplicador7");
    obj.edit129:setName("edit129");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout8);
    obj.label66:setLeft(580);
    obj.label66:setTop(5);
    obj.label66:setWidth(80);
    obj.label66:setHeight(25);
    obj.label66:setText("CATEGORIA");
    obj.label66:setName("label66");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout8);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(660);
    obj.edit130:setTop(5);
    obj.edit130:setWidth(200);
    obj.edit130:setHeight(25);
    obj.edit130:setField("categoria7");
    obj.edit130:setName("edit130");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout8);
    obj.label67:setLeft(610);
    obj.label67:setTop(30);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setText("OBS");
    obj.label67:setName("label67");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout8);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(660);
    obj.edit131:setTop(30);
    obj.edit131:setWidth(200);
    obj.edit131:setHeight(25);
    obj.edit131:setField("obs7");
    obj.edit131:setName("edit131");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout8);
    obj.label68:setLeft(590);
    obj.label68:setTop(55);
    obj.label68:setWidth(80);
    obj.label68:setHeight(25);
    obj.label68:setText("MUNIÇÃO");
    obj.label68:setName("label68");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout8);
    obj.edit132:setType("number");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(660);
    obj.edit132:setTop(55);
    obj.edit132:setWidth(69);
    obj.edit132:setHeight(25);
    obj.edit132:setField("municao7");
    obj.edit132:setName("edit132");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout8);
    obj.label69:setLeft(735);
    obj.label69:setTop(55);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("ALCANCE");
    obj.label69:setName("label69");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout8);
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(795);
    obj.edit133:setTop(55);
    obj.edit133:setWidth(65);
    obj.edit133:setHeight(25);
    obj.edit133:setField("alcance7");
    obj.edit133:setName("edit133");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout8);
    obj.label70:setLeft(870);
    obj.label70:setTop(25);
    obj.label70:setWidth(330);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Clique para adicionar imagem");
    obj.label70:setName("label70");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout8);
    obj.image7:setField("imagemArma7");
    obj.image7:setEditable(true);
    obj.image7:setStyle("autoFit");
    obj.image7:setLeft(870);
    obj.image7:setTop(5);
    obj.image7:setWidth(330);
    obj.image7:setHeight(75);
    obj.image7:setName("image7");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(2);
    obj.layout9:setTop(668);
    obj.layout9:setWidth(1207);
    obj.layout9:setHeight(92);
    obj.layout9:setName("layout9");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout9);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout9);
    obj.rectangle17:setLeft(869);
    obj.rectangle17:setTop(4);
    obj.rectangle17:setWidth(332);
    obj.rectangle17:setHeight(77);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout9);
    obj.label71:setLeft(5);
    obj.label71:setTop(5);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setText("NOME");
    obj.label71:setName("label71");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout9);
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(55);
    obj.edit134:setTop(5);
    obj.edit134:setWidth(225);
    obj.edit134:setHeight(25);
    obj.edit134:setField("nome8");
    obj.edit134:setName("edit134");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout9);
    obj.label72:setLeft(5);
    obj.label72:setTop(30);
    obj.label72:setWidth(50);
    obj.label72:setHeight(25);
    obj.label72:setText("ARMA");
    obj.label72:setName("label72");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout9);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(55);
    obj.edit135:setTop(30);
    obj.edit135:setWidth(225);
    obj.edit135:setHeight(25);
    obj.edit135:setField("arma8");
    obj.edit135:setName("edit135");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout9);
    obj.label73:setLeft(5);
    obj.label73:setTop(55);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setText("TIPO");
    obj.label73:setName("label73");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout9);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(55);
    obj.edit136:setTop(55);
    obj.edit136:setWidth(225);
    obj.edit136:setHeight(25);
    obj.edit136:setField("tipo8");
    obj.edit136:setName("edit136");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout9);
    obj.button22:setLeft(279);
    obj.button22:setTop(6);
    obj.button22:setWidth(73);
    obj.button22:setText("ATAQUE");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout9);
    obj.edit137:setType("number");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(352);
    obj.edit137:setTop(5);
    obj.edit137:setWidth(25);
    obj.edit137:setHeight(25);
    obj.edit137:setField("ataque8a");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout9);
    obj.edit138:setType("number");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(380);
    obj.edit138:setTop(5);
    obj.edit138:setWidth(25);
    obj.edit138:setHeight(25);
    obj.edit138:setField("ataque8b");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout9);
    obj.edit139:setType("number");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(409);
    obj.edit139:setTop(5);
    obj.edit139:setWidth(25);
    obj.edit139:setHeight(25);
    obj.edit139:setField("ataque8c");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout9);
    obj.edit140:setType("number");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(437);
    obj.edit140:setTop(5);
    obj.edit140:setWidth(25);
    obj.edit140:setHeight(25);
    obj.edit140:setField("ataque8d");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout9);
    obj.edit141:setType("number");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(465);
    obj.edit141:setTop(5);
    obj.edit141:setWidth(25);
    obj.edit141:setHeight(25);
    obj.edit141:setField("ataque8e");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout9);
    obj.edit142:setType("number");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(493);
    obj.edit142:setTop(5);
    obj.edit142:setWidth(25);
    obj.edit142:setHeight(25);
    obj.edit142:setField("ataque8f");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout9);
    obj.edit143:setType("number");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(522);
    obj.edit143:setTop(5);
    obj.edit143:setWidth(25);
    obj.edit143:setHeight(25);
    obj.edit143:setField("ataque8g");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout9);
    obj.edit144:setType("number");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(550);
    obj.edit144:setTop(5);
    obj.edit144:setWidth(25);
    obj.edit144:setHeight(25);
    obj.edit144:setField("ataque8h");
    obj.edit144:setName("edit144");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout9);
    obj.button23:setLeft(279);
    obj.button23:setTop(31);
    obj.button23:setWidth(73);
    obj.button23:setText("DANO");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout9);
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(352);
    obj.edit145:setTop(30);
    obj.edit145:setWidth(82);
    obj.edit145:setHeight(25);
    obj.edit145:setField("dano8");
    obj.edit145:setName("edit145");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout9);
    obj.button24:setLeft(434);
    obj.button24:setTop(31);
    obj.button24:setWidth(60);
    obj.button24:setText("CRITICO");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout9);
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(493);
    obj.edit146:setTop(30);
    obj.edit146:setWidth(82);
    obj.edit146:setHeight(25);
    obj.edit146:setField("danoCritico8");
    obj.edit146:setName("edit146");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setLeft(290);
    obj.label74:setTop(55);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("DECISIVO");
    obj.label74:setName("label74");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout9);
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(352);
    obj.edit147:setTop(55);
    obj.edit147:setWidth(82);
    obj.edit147:setHeight(25);
    obj.edit147:setField("decisivo8");
    obj.edit147:setName("edit147");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setLeft(445);
    obj.label75:setTop(55);
    obj.label75:setWidth(50);
    obj.label75:setHeight(25);
    obj.label75:setText("MULTI");
    obj.label75:setName("label75");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout9);
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(493);
    obj.edit148:setTop(55);
    obj.edit148:setWidth(82);
    obj.edit148:setHeight(25);
    obj.edit148:setField("multiplicador8");
    obj.edit148:setName("edit148");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setLeft(580);
    obj.label76:setTop(5);
    obj.label76:setWidth(80);
    obj.label76:setHeight(25);
    obj.label76:setText("CATEGORIA");
    obj.label76:setName("label76");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout9);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(660);
    obj.edit149:setTop(5);
    obj.edit149:setWidth(200);
    obj.edit149:setHeight(25);
    obj.edit149:setField("categoria8");
    obj.edit149:setName("edit149");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setLeft(610);
    obj.label77:setTop(30);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setText("OBS");
    obj.label77:setName("label77");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout9);
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(660);
    obj.edit150:setTop(30);
    obj.edit150:setWidth(200);
    obj.edit150:setHeight(25);
    obj.edit150:setField("obs8");
    obj.edit150:setName("edit150");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setLeft(590);
    obj.label78:setTop(55);
    obj.label78:setWidth(80);
    obj.label78:setHeight(25);
    obj.label78:setText("MUNIÇÃO");
    obj.label78:setName("label78");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout9);
    obj.edit151:setType("number");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(660);
    obj.edit151:setTop(55);
    obj.edit151:setWidth(69);
    obj.edit151:setHeight(25);
    obj.edit151:setField("municao8");
    obj.edit151:setName("edit151");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout9);
    obj.label79:setLeft(735);
    obj.label79:setTop(55);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("ALCANCE");
    obj.label79:setName("label79");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout9);
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(795);
    obj.edit152:setTop(55);
    obj.edit152:setWidth(65);
    obj.edit152:setHeight(25);
    obj.edit152:setField("alcance8");
    obj.edit152:setName("edit152");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout9);
    obj.label80:setLeft(870);
    obj.label80:setTop(25);
    obj.label80:setWidth(330);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Clique para adicionar imagem");
    obj.label80:setName("label80");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout9);
    obj.image8:setField("imagemArma8");
    obj.image8:setEditable(true);
    obj.image8:setStyle("autoFit");
    obj.image8:setLeft(870);
    obj.image8:setTop(5);
    obj.image8:setWidth(330);
    obj.image8:setHeight(75);
    obj.image8:setName("image8");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(2);
    obj.layout10:setTop(763);
    obj.layout10:setWidth(1207);
    obj.layout10:setHeight(92);
    obj.layout10:setName("layout10");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setLeft(869);
    obj.rectangle19:setTop(4);
    obj.rectangle19:setWidth(332);
    obj.rectangle19:setHeight(77);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout10);
    obj.label81:setLeft(5);
    obj.label81:setTop(5);
    obj.label81:setWidth(50);
    obj.label81:setHeight(25);
    obj.label81:setText("NOME");
    obj.label81:setName("label81");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout10);
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(55);
    obj.edit153:setTop(5);
    obj.edit153:setWidth(225);
    obj.edit153:setHeight(25);
    obj.edit153:setField("nome9");
    obj.edit153:setName("edit153");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setLeft(5);
    obj.label82:setTop(30);
    obj.label82:setWidth(50);
    obj.label82:setHeight(25);
    obj.label82:setText("ARMA");
    obj.label82:setName("label82");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout10);
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(55);
    obj.edit154:setTop(30);
    obj.edit154:setWidth(225);
    obj.edit154:setHeight(25);
    obj.edit154:setField("arma9");
    obj.edit154:setName("edit154");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(5);
    obj.label83:setTop(55);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setText("TIPO");
    obj.label83:setName("label83");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout10);
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(55);
    obj.edit155:setTop(55);
    obj.edit155:setWidth(225);
    obj.edit155:setHeight(25);
    obj.edit155:setField("tipo9");
    obj.edit155:setName("edit155");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout10);
    obj.button25:setLeft(279);
    obj.button25:setTop(6);
    obj.button25:setWidth(73);
    obj.button25:setText("ATAQUE");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout10);
    obj.edit156:setType("number");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(352);
    obj.edit156:setTop(5);
    obj.edit156:setWidth(25);
    obj.edit156:setHeight(25);
    obj.edit156:setField("ataque9a");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout10);
    obj.edit157:setType("number");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(380);
    obj.edit157:setTop(5);
    obj.edit157:setWidth(25);
    obj.edit157:setHeight(25);
    obj.edit157:setField("ataque9b");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout10);
    obj.edit158:setType("number");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(409);
    obj.edit158:setTop(5);
    obj.edit158:setWidth(25);
    obj.edit158:setHeight(25);
    obj.edit158:setField("ataque9c");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout10);
    obj.edit159:setType("number");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(437);
    obj.edit159:setTop(5);
    obj.edit159:setWidth(25);
    obj.edit159:setHeight(25);
    obj.edit159:setField("ataque9d");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout10);
    obj.edit160:setType("number");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(465);
    obj.edit160:setTop(5);
    obj.edit160:setWidth(25);
    obj.edit160:setHeight(25);
    obj.edit160:setField("ataque9e");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout10);
    obj.edit161:setType("number");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(493);
    obj.edit161:setTop(5);
    obj.edit161:setWidth(25);
    obj.edit161:setHeight(25);
    obj.edit161:setField("ataque9f");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout10);
    obj.edit162:setType("number");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(522);
    obj.edit162:setTop(5);
    obj.edit162:setWidth(25);
    obj.edit162:setHeight(25);
    obj.edit162:setField("ataque9g");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout10);
    obj.edit163:setType("number");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(550);
    obj.edit163:setTop(5);
    obj.edit163:setWidth(25);
    obj.edit163:setHeight(25);
    obj.edit163:setField("ataque9h");
    obj.edit163:setName("edit163");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout10);
    obj.button26:setLeft(279);
    obj.button26:setTop(31);
    obj.button26:setWidth(73);
    obj.button26:setText("DANO");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout10);
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(352);
    obj.edit164:setTop(30);
    obj.edit164:setWidth(82);
    obj.edit164:setHeight(25);
    obj.edit164:setField("dano9");
    obj.edit164:setName("edit164");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout10);
    obj.button27:setLeft(434);
    obj.button27:setTop(31);
    obj.button27:setWidth(60);
    obj.button27:setText("CRITICO");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout10);
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(493);
    obj.edit165:setTop(30);
    obj.edit165:setWidth(82);
    obj.edit165:setHeight(25);
    obj.edit165:setField("danoCritico9");
    obj.edit165:setName("edit165");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout10);
    obj.label84:setLeft(290);
    obj.label84:setTop(55);
    obj.label84:setWidth(70);
    obj.label84:setHeight(25);
    obj.label84:setText("DECISIVO");
    obj.label84:setName("label84");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout10);
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(352);
    obj.edit166:setTop(55);
    obj.edit166:setWidth(82);
    obj.edit166:setHeight(25);
    obj.edit166:setField("decisivo9");
    obj.edit166:setName("edit166");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setLeft(445);
    obj.label85:setTop(55);
    obj.label85:setWidth(50);
    obj.label85:setHeight(25);
    obj.label85:setText("MULTI");
    obj.label85:setName("label85");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout10);
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(493);
    obj.edit167:setTop(55);
    obj.edit167:setWidth(82);
    obj.edit167:setHeight(25);
    obj.edit167:setField("multiplicador9");
    obj.edit167:setName("edit167");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setLeft(580);
    obj.label86:setTop(5);
    obj.label86:setWidth(80);
    obj.label86:setHeight(25);
    obj.label86:setText("CATEGORIA");
    obj.label86:setName("label86");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout10);
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(660);
    obj.edit168:setTop(5);
    obj.edit168:setWidth(200);
    obj.edit168:setHeight(25);
    obj.edit168:setField("categoria9");
    obj.edit168:setName("edit168");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setLeft(610);
    obj.label87:setTop(30);
    obj.label87:setWidth(50);
    obj.label87:setHeight(25);
    obj.label87:setText("OBS");
    obj.label87:setName("label87");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout10);
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(660);
    obj.edit169:setTop(30);
    obj.edit169:setWidth(200);
    obj.edit169:setHeight(25);
    obj.edit169:setField("obs9");
    obj.edit169:setName("edit169");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setLeft(590);
    obj.label88:setTop(55);
    obj.label88:setWidth(80);
    obj.label88:setHeight(25);
    obj.label88:setText("MUNIÇÃO");
    obj.label88:setName("label88");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout10);
    obj.edit170:setType("number");
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(660);
    obj.edit170:setTop(55);
    obj.edit170:setWidth(69);
    obj.edit170:setHeight(25);
    obj.edit170:setField("municao9");
    obj.edit170:setName("edit170");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setLeft(735);
    obj.label89:setTop(55);
    obj.label89:setWidth(70);
    obj.label89:setHeight(25);
    obj.label89:setText("ALCANCE");
    obj.label89:setName("label89");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout10);
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(795);
    obj.edit171:setTop(55);
    obj.edit171:setWidth(65);
    obj.edit171:setHeight(25);
    obj.edit171:setField("alcance9");
    obj.edit171:setName("edit171");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout10);
    obj.label90:setLeft(870);
    obj.label90:setTop(25);
    obj.label90:setWidth(330);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("Clique para adicionar imagem");
    obj.label90:setName("label90");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout10);
    obj.image9:setField("imagemArma9");
    obj.image9:setEditable(true);
    obj.image9:setStyle("autoFit");
    obj.image9:setLeft(870);
    obj.image9:setTop(5);
    obj.image9:setWidth(330);
    obj.image9:setHeight(75);
    obj.image9:setName("image9");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(2);
    obj.layout11:setTop(858);
    obj.layout11:setWidth(1207);
    obj.layout11:setHeight(92);
    obj.layout11:setName("layout11");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setLeft(869);
    obj.rectangle21:setTop(4);
    obj.rectangle21:setWidth(332);
    obj.rectangle21:setHeight(77);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout11);
    obj.label91:setLeft(5);
    obj.label91:setTop(5);
    obj.label91:setWidth(50);
    obj.label91:setHeight(25);
    obj.label91:setText("NOME");
    obj.label91:setName("label91");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout11);
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(55);
    obj.edit172:setTop(5);
    obj.edit172:setWidth(225);
    obj.edit172:setHeight(25);
    obj.edit172:setField("nome10");
    obj.edit172:setName("edit172");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout11);
    obj.label92:setLeft(5);
    obj.label92:setTop(30);
    obj.label92:setWidth(50);
    obj.label92:setHeight(25);
    obj.label92:setText("ARMA");
    obj.label92:setName("label92");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout11);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(55);
    obj.edit173:setTop(30);
    obj.edit173:setWidth(225);
    obj.edit173:setHeight(25);
    obj.edit173:setField("arma10");
    obj.edit173:setName("edit173");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout11);
    obj.label93:setLeft(5);
    obj.label93:setTop(55);
    obj.label93:setWidth(50);
    obj.label93:setHeight(25);
    obj.label93:setText("TIPO");
    obj.label93:setName("label93");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout11);
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(55);
    obj.edit174:setTop(55);
    obj.edit174:setWidth(225);
    obj.edit174:setHeight(25);
    obj.edit174:setField("tipo10");
    obj.edit174:setName("edit174");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout11);
    obj.button28:setLeft(279);
    obj.button28:setTop(6);
    obj.button28:setWidth(73);
    obj.button28:setText("ATAQUE");
    obj.button28:setFontSize(11);
    obj.button28:setName("button28");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout11);
    obj.edit175:setType("number");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(352);
    obj.edit175:setTop(5);
    obj.edit175:setWidth(25);
    obj.edit175:setHeight(25);
    obj.edit175:setField("ataque10a");
    obj.edit175:setName("edit175");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout11);
    obj.edit176:setType("number");
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(380);
    obj.edit176:setTop(5);
    obj.edit176:setWidth(25);
    obj.edit176:setHeight(25);
    obj.edit176:setField("ataque10b");
    obj.edit176:setName("edit176");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout11);
    obj.edit177:setType("number");
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(409);
    obj.edit177:setTop(5);
    obj.edit177:setWidth(25);
    obj.edit177:setHeight(25);
    obj.edit177:setField("ataque10c");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout11);
    obj.edit178:setType("number");
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(437);
    obj.edit178:setTop(5);
    obj.edit178:setWidth(25);
    obj.edit178:setHeight(25);
    obj.edit178:setField("ataque10d");
    obj.edit178:setName("edit178");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout11);
    obj.edit179:setType("number");
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(465);
    obj.edit179:setTop(5);
    obj.edit179:setWidth(25);
    obj.edit179:setHeight(25);
    obj.edit179:setField("ataque10e");
    obj.edit179:setName("edit179");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout11);
    obj.edit180:setType("number");
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(493);
    obj.edit180:setTop(5);
    obj.edit180:setWidth(25);
    obj.edit180:setHeight(25);
    obj.edit180:setField("ataque10f");
    obj.edit180:setName("edit180");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout11);
    obj.edit181:setType("number");
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(522);
    obj.edit181:setTop(5);
    obj.edit181:setWidth(25);
    obj.edit181:setHeight(25);
    obj.edit181:setField("ataque10g");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout11);
    obj.edit182:setType("number");
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(550);
    obj.edit182:setTop(5);
    obj.edit182:setWidth(25);
    obj.edit182:setHeight(25);
    obj.edit182:setField("ataque10h");
    obj.edit182:setName("edit182");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout11);
    obj.button29:setLeft(279);
    obj.button29:setTop(31);
    obj.button29:setWidth(73);
    obj.button29:setText("DANO");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout11);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(352);
    obj.edit183:setTop(30);
    obj.edit183:setWidth(82);
    obj.edit183:setHeight(25);
    obj.edit183:setField("dano10");
    obj.edit183:setName("edit183");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout11);
    obj.button30:setLeft(434);
    obj.button30:setTop(31);
    obj.button30:setWidth(60);
    obj.button30:setText("CRITICO");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout11);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(493);
    obj.edit184:setTop(30);
    obj.edit184:setWidth(82);
    obj.edit184:setHeight(25);
    obj.edit184:setField("danoCritico10");
    obj.edit184:setName("edit184");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout11);
    obj.label94:setLeft(290);
    obj.label94:setTop(55);
    obj.label94:setWidth(70);
    obj.label94:setHeight(25);
    obj.label94:setText("DECISIVO");
    obj.label94:setName("label94");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout11);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(352);
    obj.edit185:setTop(55);
    obj.edit185:setWidth(82);
    obj.edit185:setHeight(25);
    obj.edit185:setField("decisivo10");
    obj.edit185:setName("edit185");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout11);
    obj.label95:setLeft(445);
    obj.label95:setTop(55);
    obj.label95:setWidth(50);
    obj.label95:setHeight(25);
    obj.label95:setText("MULTI");
    obj.label95:setName("label95");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout11);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(493);
    obj.edit186:setTop(55);
    obj.edit186:setWidth(82);
    obj.edit186:setHeight(25);
    obj.edit186:setField("multiplicador10");
    obj.edit186:setName("edit186");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout11);
    obj.label96:setLeft(580);
    obj.label96:setTop(5);
    obj.label96:setWidth(80);
    obj.label96:setHeight(25);
    obj.label96:setText("CATEGORIA");
    obj.label96:setName("label96");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout11);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(660);
    obj.edit187:setTop(5);
    obj.edit187:setWidth(200);
    obj.edit187:setHeight(25);
    obj.edit187:setField("categoria10");
    obj.edit187:setName("edit187");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout11);
    obj.label97:setLeft(610);
    obj.label97:setTop(30);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setText("OBS");
    obj.label97:setName("label97");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout11);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(660);
    obj.edit188:setTop(30);
    obj.edit188:setWidth(200);
    obj.edit188:setHeight(25);
    obj.edit188:setField("obs10");
    obj.edit188:setName("edit188");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout11);
    obj.label98:setLeft(590);
    obj.label98:setTop(55);
    obj.label98:setWidth(80);
    obj.label98:setHeight(25);
    obj.label98:setText("MUNIÇÃO");
    obj.label98:setName("label98");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout11);
    obj.edit189:setType("number");
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(660);
    obj.edit189:setTop(55);
    obj.edit189:setWidth(69);
    obj.edit189:setHeight(25);
    obj.edit189:setField("municao10");
    obj.edit189:setName("edit189");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout11);
    obj.label99:setLeft(735);
    obj.label99:setTop(55);
    obj.label99:setWidth(70);
    obj.label99:setHeight(25);
    obj.label99:setText("ALCANCE");
    obj.label99:setName("label99");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout11);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(795);
    obj.edit190:setTop(55);
    obj.edit190:setWidth(65);
    obj.edit190:setHeight(25);
    obj.edit190:setField("alcance10");
    obj.edit190:setName("edit190");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout11);
    obj.label100:setLeft(870);
    obj.label100:setTop(25);
    obj.label100:setWidth(330);
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Clique para adicionar imagem");
    obj.label100:setName("label100");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout11);
    obj.image10:setField("imagemArma10");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setLeft(870);
    obj.image10:setTop(5);
    obj.image10:setWidth(330);
    obj.image10:setHeight(75);
    obj.image10:setName("image10");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(2);
    obj.layout12:setTop(953);
    obj.layout12:setWidth(1207);
    obj.layout12:setHeight(92);
    obj.layout12:setName("layout12");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout12);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout12);
    obj.rectangle23:setLeft(869);
    obj.rectangle23:setTop(4);
    obj.rectangle23:setWidth(332);
    obj.rectangle23:setHeight(77);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout12);
    obj.label101:setLeft(5);
    obj.label101:setTop(5);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setText("NOME");
    obj.label101:setName("label101");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout12);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(55);
    obj.edit191:setTop(5);
    obj.edit191:setWidth(225);
    obj.edit191:setHeight(25);
    obj.edit191:setField("nome11");
    obj.edit191:setName("edit191");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout12);
    obj.label102:setLeft(5);
    obj.label102:setTop(30);
    obj.label102:setWidth(50);
    obj.label102:setHeight(25);
    obj.label102:setText("ARMA");
    obj.label102:setName("label102");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout12);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(55);
    obj.edit192:setTop(30);
    obj.edit192:setWidth(225);
    obj.edit192:setHeight(25);
    obj.edit192:setField("arma11");
    obj.edit192:setName("edit192");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout12);
    obj.label103:setLeft(5);
    obj.label103:setTop(55);
    obj.label103:setWidth(50);
    obj.label103:setHeight(25);
    obj.label103:setText("TIPO");
    obj.label103:setName("label103");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout12);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(55);
    obj.edit193:setTop(55);
    obj.edit193:setWidth(225);
    obj.edit193:setHeight(25);
    obj.edit193:setField("tipo11");
    obj.edit193:setName("edit193");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout12);
    obj.button31:setLeft(279);
    obj.button31:setTop(6);
    obj.button31:setWidth(73);
    obj.button31:setText("ATAQUE");
    obj.button31:setFontSize(11);
    obj.button31:setName("button31");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout12);
    obj.edit194:setType("number");
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(352);
    obj.edit194:setTop(5);
    obj.edit194:setWidth(25);
    obj.edit194:setHeight(25);
    obj.edit194:setField("ataque11a");
    obj.edit194:setName("edit194");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout12);
    obj.edit195:setType("number");
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(380);
    obj.edit195:setTop(5);
    obj.edit195:setWidth(25);
    obj.edit195:setHeight(25);
    obj.edit195:setField("ataque11b");
    obj.edit195:setName("edit195");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout12);
    obj.edit196:setType("number");
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(409);
    obj.edit196:setTop(5);
    obj.edit196:setWidth(25);
    obj.edit196:setHeight(25);
    obj.edit196:setField("ataque11c");
    obj.edit196:setName("edit196");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout12);
    obj.edit197:setType("number");
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(437);
    obj.edit197:setTop(5);
    obj.edit197:setWidth(25);
    obj.edit197:setHeight(25);
    obj.edit197:setField("ataque11d");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout12);
    obj.edit198:setType("number");
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(465);
    obj.edit198:setTop(5);
    obj.edit198:setWidth(25);
    obj.edit198:setHeight(25);
    obj.edit198:setField("ataque11e");
    obj.edit198:setName("edit198");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout12);
    obj.edit199:setType("number");
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(493);
    obj.edit199:setTop(5);
    obj.edit199:setWidth(25);
    obj.edit199:setHeight(25);
    obj.edit199:setField("ataque11f");
    obj.edit199:setName("edit199");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout12);
    obj.edit200:setType("number");
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(522);
    obj.edit200:setTop(5);
    obj.edit200:setWidth(25);
    obj.edit200:setHeight(25);
    obj.edit200:setField("ataque11g");
    obj.edit200:setName("edit200");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout12);
    obj.edit201:setType("number");
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(550);
    obj.edit201:setTop(5);
    obj.edit201:setWidth(25);
    obj.edit201:setHeight(25);
    obj.edit201:setField("ataque11h");
    obj.edit201:setName("edit201");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout12);
    obj.button32:setLeft(279);
    obj.button32:setTop(31);
    obj.button32:setWidth(73);
    obj.button32:setText("DANO");
    obj.button32:setFontSize(11);
    obj.button32:setName("button32");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout12);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(352);
    obj.edit202:setTop(30);
    obj.edit202:setWidth(82);
    obj.edit202:setHeight(25);
    obj.edit202:setField("dano11");
    obj.edit202:setName("edit202");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout12);
    obj.button33:setLeft(434);
    obj.button33:setTop(31);
    obj.button33:setWidth(60);
    obj.button33:setText("CRITICO");
    obj.button33:setFontSize(11);
    obj.button33:setName("button33");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout12);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(493);
    obj.edit203:setTop(30);
    obj.edit203:setWidth(82);
    obj.edit203:setHeight(25);
    obj.edit203:setField("danoCritico11");
    obj.edit203:setName("edit203");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout12);
    obj.label104:setLeft(290);
    obj.label104:setTop(55);
    obj.label104:setWidth(70);
    obj.label104:setHeight(25);
    obj.label104:setText("DECISIVO");
    obj.label104:setName("label104");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout12);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(352);
    obj.edit204:setTop(55);
    obj.edit204:setWidth(82);
    obj.edit204:setHeight(25);
    obj.edit204:setField("decisivo11");
    obj.edit204:setName("edit204");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout12);
    obj.label105:setLeft(445);
    obj.label105:setTop(55);
    obj.label105:setWidth(50);
    obj.label105:setHeight(25);
    obj.label105:setText("MULTI");
    obj.label105:setName("label105");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout12);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(493);
    obj.edit205:setTop(55);
    obj.edit205:setWidth(82);
    obj.edit205:setHeight(25);
    obj.edit205:setField("multiplicador11");
    obj.edit205:setName("edit205");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout12);
    obj.label106:setLeft(580);
    obj.label106:setTop(5);
    obj.label106:setWidth(80);
    obj.label106:setHeight(25);
    obj.label106:setText("CATEGORIA");
    obj.label106:setName("label106");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout12);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(660);
    obj.edit206:setTop(5);
    obj.edit206:setWidth(200);
    obj.edit206:setHeight(25);
    obj.edit206:setField("categoria11");
    obj.edit206:setName("edit206");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout12);
    obj.label107:setLeft(610);
    obj.label107:setTop(30);
    obj.label107:setWidth(50);
    obj.label107:setHeight(25);
    obj.label107:setText("OBS");
    obj.label107:setName("label107");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout12);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(660);
    obj.edit207:setTop(30);
    obj.edit207:setWidth(200);
    obj.edit207:setHeight(25);
    obj.edit207:setField("obs11");
    obj.edit207:setName("edit207");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout12);
    obj.label108:setLeft(590);
    obj.label108:setTop(55);
    obj.label108:setWidth(80);
    obj.label108:setHeight(25);
    obj.label108:setText("MUNIÇÃO");
    obj.label108:setName("label108");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout12);
    obj.edit208:setType("number");
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(660);
    obj.edit208:setTop(55);
    obj.edit208:setWidth(69);
    obj.edit208:setHeight(25);
    obj.edit208:setField("municao11");
    obj.edit208:setName("edit208");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout12);
    obj.label109:setLeft(735);
    obj.label109:setTop(55);
    obj.label109:setWidth(70);
    obj.label109:setHeight(25);
    obj.label109:setText("ALCANCE");
    obj.label109:setName("label109");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout12);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(795);
    obj.edit209:setTop(55);
    obj.edit209:setWidth(65);
    obj.edit209:setHeight(25);
    obj.edit209:setField("alcance11");
    obj.edit209:setName("edit209");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout12);
    obj.label110:setLeft(870);
    obj.label110:setTop(25);
    obj.label110:setWidth(330);
    obj.label110:setHeight(25);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setText("Clique para adicionar imagem");
    obj.label110:setName("label110");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout12);
    obj.image11:setField("imagemArma11");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setLeft(870);
    obj.image11:setTop(5);
    obj.image11:setWidth(330);
    obj.image11:setHeight(75);
    obj.image11:setName("image11");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(2);
    obj.layout13:setTop(1048);
    obj.layout13:setWidth(1207);
    obj.layout13:setHeight(92);
    obj.layout13:setName("layout13");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout13);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout13);
    obj.rectangle25:setLeft(869);
    obj.rectangle25:setTop(4);
    obj.rectangle25:setWidth(332);
    obj.rectangle25:setHeight(77);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout13);
    obj.label111:setLeft(5);
    obj.label111:setTop(5);
    obj.label111:setWidth(50);
    obj.label111:setHeight(25);
    obj.label111:setText("NOME");
    obj.label111:setName("label111");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout13);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(55);
    obj.edit210:setTop(5);
    obj.edit210:setWidth(225);
    obj.edit210:setHeight(25);
    obj.edit210:setField("nome12");
    obj.edit210:setName("edit210");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout13);
    obj.label112:setLeft(5);
    obj.label112:setTop(30);
    obj.label112:setWidth(50);
    obj.label112:setHeight(25);
    obj.label112:setText("ARMA");
    obj.label112:setName("label112");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout13);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(55);
    obj.edit211:setTop(30);
    obj.edit211:setWidth(225);
    obj.edit211:setHeight(25);
    obj.edit211:setField("arma12");
    obj.edit211:setName("edit211");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout13);
    obj.label113:setLeft(5);
    obj.label113:setTop(55);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setText("TIPO");
    obj.label113:setName("label113");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout13);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(55);
    obj.edit212:setTop(55);
    obj.edit212:setWidth(225);
    obj.edit212:setHeight(25);
    obj.edit212:setField("tipo12");
    obj.edit212:setName("edit212");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout13);
    obj.button34:setLeft(279);
    obj.button34:setTop(6);
    obj.button34:setWidth(73);
    obj.button34:setText("ATAQUE");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout13);
    obj.edit213:setType("number");
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(352);
    obj.edit213:setTop(5);
    obj.edit213:setWidth(25);
    obj.edit213:setHeight(25);
    obj.edit213:setField("ataque12a");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout13);
    obj.edit214:setType("number");
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(380);
    obj.edit214:setTop(5);
    obj.edit214:setWidth(25);
    obj.edit214:setHeight(25);
    obj.edit214:setField("ataque12b");
    obj.edit214:setName("edit214");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout13);
    obj.edit215:setType("number");
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(409);
    obj.edit215:setTop(5);
    obj.edit215:setWidth(25);
    obj.edit215:setHeight(25);
    obj.edit215:setField("ataque12c");
    obj.edit215:setName("edit215");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout13);
    obj.edit216:setType("number");
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(437);
    obj.edit216:setTop(5);
    obj.edit216:setWidth(25);
    obj.edit216:setHeight(25);
    obj.edit216:setField("ataque12d");
    obj.edit216:setName("edit216");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout13);
    obj.edit217:setType("number");
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(465);
    obj.edit217:setTop(5);
    obj.edit217:setWidth(25);
    obj.edit217:setHeight(25);
    obj.edit217:setField("ataque12e");
    obj.edit217:setName("edit217");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout13);
    obj.edit218:setType("number");
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(493);
    obj.edit218:setTop(5);
    obj.edit218:setWidth(25);
    obj.edit218:setHeight(25);
    obj.edit218:setField("ataque12f");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout13);
    obj.edit219:setType("number");
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(522);
    obj.edit219:setTop(5);
    obj.edit219:setWidth(25);
    obj.edit219:setHeight(25);
    obj.edit219:setField("ataque12g");
    obj.edit219:setName("edit219");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout13);
    obj.edit220:setType("number");
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(550);
    obj.edit220:setTop(5);
    obj.edit220:setWidth(25);
    obj.edit220:setHeight(25);
    obj.edit220:setField("ataque12h");
    obj.edit220:setName("edit220");

    obj.button35 = gui.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout13);
    obj.button35:setLeft(279);
    obj.button35:setTop(31);
    obj.button35:setWidth(73);
    obj.button35:setText("DANO");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout13);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(352);
    obj.edit221:setTop(30);
    obj.edit221:setWidth(82);
    obj.edit221:setHeight(25);
    obj.edit221:setField("dano12");
    obj.edit221:setName("edit221");

    obj.button36 = gui.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout13);
    obj.button36:setLeft(434);
    obj.button36:setTop(31);
    obj.button36:setWidth(60);
    obj.button36:setText("CRITICO");
    obj.button36:setFontSize(11);
    obj.button36:setName("button36");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout13);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(493);
    obj.edit222:setTop(30);
    obj.edit222:setWidth(82);
    obj.edit222:setHeight(25);
    obj.edit222:setField("danoCritico12");
    obj.edit222:setName("edit222");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout13);
    obj.label114:setLeft(290);
    obj.label114:setTop(55);
    obj.label114:setWidth(70);
    obj.label114:setHeight(25);
    obj.label114:setText("DECISIVO");
    obj.label114:setName("label114");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout13);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(352);
    obj.edit223:setTop(55);
    obj.edit223:setWidth(82);
    obj.edit223:setHeight(25);
    obj.edit223:setField("decisivo12");
    obj.edit223:setName("edit223");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout13);
    obj.label115:setLeft(445);
    obj.label115:setTop(55);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setText("MULTI");
    obj.label115:setName("label115");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout13);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(493);
    obj.edit224:setTop(55);
    obj.edit224:setWidth(82);
    obj.edit224:setHeight(25);
    obj.edit224:setField("multiplicador12");
    obj.edit224:setName("edit224");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout13);
    obj.label116:setLeft(580);
    obj.label116:setTop(5);
    obj.label116:setWidth(80);
    obj.label116:setHeight(25);
    obj.label116:setText("CATEGORIA");
    obj.label116:setName("label116");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout13);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(660);
    obj.edit225:setTop(5);
    obj.edit225:setWidth(200);
    obj.edit225:setHeight(25);
    obj.edit225:setField("categoria12");
    obj.edit225:setName("edit225");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout13);
    obj.label117:setLeft(610);
    obj.label117:setTop(30);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setText("OBS");
    obj.label117:setName("label117");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout13);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(660);
    obj.edit226:setTop(30);
    obj.edit226:setWidth(200);
    obj.edit226:setHeight(25);
    obj.edit226:setField("obs12");
    obj.edit226:setName("edit226");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout13);
    obj.label118:setLeft(590);
    obj.label118:setTop(55);
    obj.label118:setWidth(80);
    obj.label118:setHeight(25);
    obj.label118:setText("MUNIÇÃO");
    obj.label118:setName("label118");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout13);
    obj.edit227:setType("number");
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(660);
    obj.edit227:setTop(55);
    obj.edit227:setWidth(69);
    obj.edit227:setHeight(25);
    obj.edit227:setField("municao12");
    obj.edit227:setName("edit227");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout13);
    obj.label119:setLeft(735);
    obj.label119:setTop(55);
    obj.label119:setWidth(70);
    obj.label119:setHeight(25);
    obj.label119:setText("ALCANCE");
    obj.label119:setName("label119");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout13);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(795);
    obj.edit228:setTop(55);
    obj.edit228:setWidth(65);
    obj.edit228:setHeight(25);
    obj.edit228:setField("alcance12");
    obj.edit228:setName("edit228");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout13);
    obj.label120:setLeft(870);
    obj.label120:setTop(25);
    obj.label120:setWidth(330);
    obj.label120:setHeight(25);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Clique para adicionar imagem");
    obj.label120:setName("label120");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout13);
    obj.image12:setField("imagemArma12");
    obj.image12:setEditable(true);
    obj.image12:setStyle("autoFit");
    obj.image12:setLeft(870);
    obj.image12:setTop(5);
    obj.image12:setWidth(330);
    obj.image12:setHeight(75);
    obj.image12:setName("image12");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(2);
    obj.layout14:setTop(1143);
    obj.layout14:setWidth(1207);
    obj.layout14:setHeight(92);
    obj.layout14:setName("layout14");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout14);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout14);
    obj.rectangle27:setLeft(869);
    obj.rectangle27:setTop(4);
    obj.rectangle27:setWidth(332);
    obj.rectangle27:setHeight(77);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout14);
    obj.label121:setLeft(5);
    obj.label121:setTop(5);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setText("NOME");
    obj.label121:setName("label121");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout14);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(55);
    obj.edit229:setTop(5);
    obj.edit229:setWidth(225);
    obj.edit229:setHeight(25);
    obj.edit229:setField("nome13");
    obj.edit229:setName("edit229");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout14);
    obj.label122:setLeft(5);
    obj.label122:setTop(30);
    obj.label122:setWidth(50);
    obj.label122:setHeight(25);
    obj.label122:setText("ARMA");
    obj.label122:setName("label122");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout14);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(55);
    obj.edit230:setTop(30);
    obj.edit230:setWidth(225);
    obj.edit230:setHeight(25);
    obj.edit230:setField("arma13");
    obj.edit230:setName("edit230");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout14);
    obj.label123:setLeft(5);
    obj.label123:setTop(55);
    obj.label123:setWidth(50);
    obj.label123:setHeight(25);
    obj.label123:setText("TIPO");
    obj.label123:setName("label123");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout14);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(55);
    obj.edit231:setTop(55);
    obj.edit231:setWidth(225);
    obj.edit231:setHeight(25);
    obj.edit231:setField("tipo13");
    obj.edit231:setName("edit231");

    obj.button37 = gui.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout14);
    obj.button37:setLeft(279);
    obj.button37:setTop(6);
    obj.button37:setWidth(73);
    obj.button37:setText("ATAQUE");
    obj.button37:setFontSize(11);
    obj.button37:setName("button37");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout14);
    obj.edit232:setType("number");
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(352);
    obj.edit232:setTop(5);
    obj.edit232:setWidth(25);
    obj.edit232:setHeight(25);
    obj.edit232:setField("ataque13a");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout14);
    obj.edit233:setType("number");
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(380);
    obj.edit233:setTop(5);
    obj.edit233:setWidth(25);
    obj.edit233:setHeight(25);
    obj.edit233:setField("ataque13b");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout14);
    obj.edit234:setType("number");
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(409);
    obj.edit234:setTop(5);
    obj.edit234:setWidth(25);
    obj.edit234:setHeight(25);
    obj.edit234:setField("ataque13c");
    obj.edit234:setName("edit234");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout14);
    obj.edit235:setType("number");
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(437);
    obj.edit235:setTop(5);
    obj.edit235:setWidth(25);
    obj.edit235:setHeight(25);
    obj.edit235:setField("ataque13d");
    obj.edit235:setName("edit235");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout14);
    obj.edit236:setType("number");
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(465);
    obj.edit236:setTop(5);
    obj.edit236:setWidth(25);
    obj.edit236:setHeight(25);
    obj.edit236:setField("ataque13e");
    obj.edit236:setName("edit236");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout14);
    obj.edit237:setType("number");
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(493);
    obj.edit237:setTop(5);
    obj.edit237:setWidth(25);
    obj.edit237:setHeight(25);
    obj.edit237:setField("ataque13f");
    obj.edit237:setName("edit237");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout14);
    obj.edit238:setType("number");
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(522);
    obj.edit238:setTop(5);
    obj.edit238:setWidth(25);
    obj.edit238:setHeight(25);
    obj.edit238:setField("ataque13g");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout14);
    obj.edit239:setType("number");
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(550);
    obj.edit239:setTop(5);
    obj.edit239:setWidth(25);
    obj.edit239:setHeight(25);
    obj.edit239:setField("ataque13h");
    obj.edit239:setName("edit239");

    obj.button38 = gui.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout14);
    obj.button38:setLeft(279);
    obj.button38:setTop(31);
    obj.button38:setWidth(73);
    obj.button38:setText("DANO");
    obj.button38:setFontSize(11);
    obj.button38:setName("button38");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout14);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(352);
    obj.edit240:setTop(30);
    obj.edit240:setWidth(82);
    obj.edit240:setHeight(25);
    obj.edit240:setField("dano13");
    obj.edit240:setName("edit240");

    obj.button39 = gui.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout14);
    obj.button39:setLeft(434);
    obj.button39:setTop(31);
    obj.button39:setWidth(60);
    obj.button39:setText("CRITICO");
    obj.button39:setFontSize(11);
    obj.button39:setName("button39");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout14);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setLeft(493);
    obj.edit241:setTop(30);
    obj.edit241:setWidth(82);
    obj.edit241:setHeight(25);
    obj.edit241:setField("danoCritico13");
    obj.edit241:setName("edit241");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout14);
    obj.label124:setLeft(290);
    obj.label124:setTop(55);
    obj.label124:setWidth(70);
    obj.label124:setHeight(25);
    obj.label124:setText("DECISIVO");
    obj.label124:setName("label124");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout14);
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setLeft(352);
    obj.edit242:setTop(55);
    obj.edit242:setWidth(82);
    obj.edit242:setHeight(25);
    obj.edit242:setField("decisivo13");
    obj.edit242:setName("edit242");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout14);
    obj.label125:setLeft(445);
    obj.label125:setTop(55);
    obj.label125:setWidth(50);
    obj.label125:setHeight(25);
    obj.label125:setText("MULTI");
    obj.label125:setName("label125");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout14);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setLeft(493);
    obj.edit243:setTop(55);
    obj.edit243:setWidth(82);
    obj.edit243:setHeight(25);
    obj.edit243:setField("multiplicador13");
    obj.edit243:setName("edit243");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout14);
    obj.label126:setLeft(580);
    obj.label126:setTop(5);
    obj.label126:setWidth(80);
    obj.label126:setHeight(25);
    obj.label126:setText("CATEGORIA");
    obj.label126:setName("label126");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout14);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setLeft(660);
    obj.edit244:setTop(5);
    obj.edit244:setWidth(200);
    obj.edit244:setHeight(25);
    obj.edit244:setField("categoria13");
    obj.edit244:setName("edit244");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout14);
    obj.label127:setLeft(610);
    obj.label127:setTop(30);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setText("OBS");
    obj.label127:setName("label127");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout14);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setLeft(660);
    obj.edit245:setTop(30);
    obj.edit245:setWidth(200);
    obj.edit245:setHeight(25);
    obj.edit245:setField("obs13");
    obj.edit245:setName("edit245");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout14);
    obj.label128:setLeft(590);
    obj.label128:setTop(55);
    obj.label128:setWidth(80);
    obj.label128:setHeight(25);
    obj.label128:setText("MUNIÇÃO");
    obj.label128:setName("label128");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout14);
    obj.edit246:setType("number");
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setLeft(660);
    obj.edit246:setTop(55);
    obj.edit246:setWidth(69);
    obj.edit246:setHeight(25);
    obj.edit246:setField("municao13");
    obj.edit246:setName("edit246");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout14);
    obj.label129:setLeft(735);
    obj.label129:setTop(55);
    obj.label129:setWidth(70);
    obj.label129:setHeight(25);
    obj.label129:setText("ALCANCE");
    obj.label129:setName("label129");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout14);
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setLeft(795);
    obj.edit247:setTop(55);
    obj.edit247:setWidth(65);
    obj.edit247:setHeight(25);
    obj.edit247:setField("alcance13");
    obj.edit247:setName("edit247");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout14);
    obj.label130:setLeft(870);
    obj.label130:setTop(25);
    obj.label130:setWidth(330);
    obj.label130:setHeight(25);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setText("Clique para adicionar imagem");
    obj.label130:setName("label130");

    obj.image13 = gui.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout14);
    obj.image13:setField("imagemArma13");
    obj.image13:setEditable(true);
    obj.image13:setStyle("autoFit");
    obj.image13:setLeft(870);
    obj.image13:setTop(5);
    obj.image13:setWidth(330);
    obj.image13:setHeight(75);
    obj.image13:setName("image13");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(2);
    obj.layout15:setTop(1238);
    obj.layout15:setWidth(1207);
    obj.layout15:setHeight(92);
    obj.layout15:setName("layout15");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout15);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout15);
    obj.rectangle29:setLeft(869);
    obj.rectangle29:setTop(4);
    obj.rectangle29:setWidth(332);
    obj.rectangle29:setHeight(77);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout15);
    obj.label131:setLeft(5);
    obj.label131:setTop(5);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setText("NOME");
    obj.label131:setName("label131");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout15);
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setLeft(55);
    obj.edit248:setTop(5);
    obj.edit248:setWidth(225);
    obj.edit248:setHeight(25);
    obj.edit248:setField("nome14");
    obj.edit248:setName("edit248");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout15);
    obj.label132:setLeft(5);
    obj.label132:setTop(30);
    obj.label132:setWidth(50);
    obj.label132:setHeight(25);
    obj.label132:setText("ARMA");
    obj.label132:setName("label132");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout15);
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setLeft(55);
    obj.edit249:setTop(30);
    obj.edit249:setWidth(225);
    obj.edit249:setHeight(25);
    obj.edit249:setField("arma14");
    obj.edit249:setName("edit249");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout15);
    obj.label133:setLeft(5);
    obj.label133:setTop(55);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setText("TIPO");
    obj.label133:setName("label133");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout15);
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setLeft(55);
    obj.edit250:setTop(55);
    obj.edit250:setWidth(225);
    obj.edit250:setHeight(25);
    obj.edit250:setField("tipo14");
    obj.edit250:setName("edit250");

    obj.button40 = gui.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout15);
    obj.button40:setLeft(279);
    obj.button40:setTop(6);
    obj.button40:setWidth(73);
    obj.button40:setText("ATAQUE");
    obj.button40:setFontSize(11);
    obj.button40:setName("button40");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout15);
    obj.edit251:setType("number");
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setLeft(352);
    obj.edit251:setTop(5);
    obj.edit251:setWidth(25);
    obj.edit251:setHeight(25);
    obj.edit251:setField("ataque14a");
    obj.edit251:setName("edit251");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout15);
    obj.edit252:setType("number");
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setLeft(380);
    obj.edit252:setTop(5);
    obj.edit252:setWidth(25);
    obj.edit252:setHeight(25);
    obj.edit252:setField("ataque14b");
    obj.edit252:setName("edit252");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout15);
    obj.edit253:setType("number");
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setLeft(409);
    obj.edit253:setTop(5);
    obj.edit253:setWidth(25);
    obj.edit253:setHeight(25);
    obj.edit253:setField("ataque14c");
    obj.edit253:setName("edit253");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout15);
    obj.edit254:setType("number");
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setLeft(437);
    obj.edit254:setTop(5);
    obj.edit254:setWidth(25);
    obj.edit254:setHeight(25);
    obj.edit254:setField("ataque14d");
    obj.edit254:setName("edit254");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout15);
    obj.edit255:setType("number");
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setLeft(465);
    obj.edit255:setTop(5);
    obj.edit255:setWidth(25);
    obj.edit255:setHeight(25);
    obj.edit255:setField("ataque14e");
    obj.edit255:setName("edit255");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout15);
    obj.edit256:setType("number");
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setLeft(493);
    obj.edit256:setTop(5);
    obj.edit256:setWidth(25);
    obj.edit256:setHeight(25);
    obj.edit256:setField("ataque14f");
    obj.edit256:setName("edit256");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout15);
    obj.edit257:setType("number");
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setLeft(522);
    obj.edit257:setTop(5);
    obj.edit257:setWidth(25);
    obj.edit257:setHeight(25);
    obj.edit257:setField("ataque14g");
    obj.edit257:setName("edit257");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout15);
    obj.edit258:setType("number");
    obj.edit258:setVertTextAlign("center");
    obj.edit258:setLeft(550);
    obj.edit258:setTop(5);
    obj.edit258:setWidth(25);
    obj.edit258:setHeight(25);
    obj.edit258:setField("ataque14h");
    obj.edit258:setName("edit258");

    obj.button41 = gui.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout15);
    obj.button41:setLeft(279);
    obj.button41:setTop(31);
    obj.button41:setWidth(73);
    obj.button41:setText("DANO");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout15);
    obj.edit259:setVertTextAlign("center");
    obj.edit259:setLeft(352);
    obj.edit259:setTop(30);
    obj.edit259:setWidth(82);
    obj.edit259:setHeight(25);
    obj.edit259:setField("dano14");
    obj.edit259:setName("edit259");

    obj.button42 = gui.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout15);
    obj.button42:setLeft(434);
    obj.button42:setTop(31);
    obj.button42:setWidth(60);
    obj.button42:setText("CRITICO");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout15);
    obj.edit260:setVertTextAlign("center");
    obj.edit260:setLeft(493);
    obj.edit260:setTop(30);
    obj.edit260:setWidth(82);
    obj.edit260:setHeight(25);
    obj.edit260:setField("danoCritico14");
    obj.edit260:setName("edit260");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout15);
    obj.label134:setLeft(290);
    obj.label134:setTop(55);
    obj.label134:setWidth(70);
    obj.label134:setHeight(25);
    obj.label134:setText("DECISIVO");
    obj.label134:setName("label134");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout15);
    obj.edit261:setVertTextAlign("center");
    obj.edit261:setLeft(352);
    obj.edit261:setTop(55);
    obj.edit261:setWidth(82);
    obj.edit261:setHeight(25);
    obj.edit261:setField("decisivo14");
    obj.edit261:setName("edit261");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout15);
    obj.label135:setLeft(445);
    obj.label135:setTop(55);
    obj.label135:setWidth(50);
    obj.label135:setHeight(25);
    obj.label135:setText("MULTI");
    obj.label135:setName("label135");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout15);
    obj.edit262:setVertTextAlign("center");
    obj.edit262:setLeft(493);
    obj.edit262:setTop(55);
    obj.edit262:setWidth(82);
    obj.edit262:setHeight(25);
    obj.edit262:setField("multiplicador14");
    obj.edit262:setName("edit262");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout15);
    obj.label136:setLeft(580);
    obj.label136:setTop(5);
    obj.label136:setWidth(80);
    obj.label136:setHeight(25);
    obj.label136:setText("CATEGORIA");
    obj.label136:setName("label136");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout15);
    obj.edit263:setVertTextAlign("center");
    obj.edit263:setLeft(660);
    obj.edit263:setTop(5);
    obj.edit263:setWidth(200);
    obj.edit263:setHeight(25);
    obj.edit263:setField("categoria14");
    obj.edit263:setName("edit263");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout15);
    obj.label137:setLeft(610);
    obj.label137:setTop(30);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setText("OBS");
    obj.label137:setName("label137");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout15);
    obj.edit264:setVertTextAlign("center");
    obj.edit264:setLeft(660);
    obj.edit264:setTop(30);
    obj.edit264:setWidth(200);
    obj.edit264:setHeight(25);
    obj.edit264:setField("obs14");
    obj.edit264:setName("edit264");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout15);
    obj.label138:setLeft(590);
    obj.label138:setTop(55);
    obj.label138:setWidth(80);
    obj.label138:setHeight(25);
    obj.label138:setText("MUNIÇÃO");
    obj.label138:setName("label138");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout15);
    obj.edit265:setType("number");
    obj.edit265:setVertTextAlign("center");
    obj.edit265:setLeft(660);
    obj.edit265:setTop(55);
    obj.edit265:setWidth(69);
    obj.edit265:setHeight(25);
    obj.edit265:setField("municao14");
    obj.edit265:setName("edit265");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout15);
    obj.label139:setLeft(735);
    obj.label139:setTop(55);
    obj.label139:setWidth(70);
    obj.label139:setHeight(25);
    obj.label139:setText("ALCANCE");
    obj.label139:setName("label139");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout15);
    obj.edit266:setVertTextAlign("center");
    obj.edit266:setLeft(795);
    obj.edit266:setTop(55);
    obj.edit266:setWidth(65);
    obj.edit266:setHeight(25);
    obj.edit266:setField("alcance14");
    obj.edit266:setName("edit266");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout15);
    obj.label140:setLeft(870);
    obj.label140:setTop(25);
    obj.label140:setWidth(330);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setText("Clique para adicionar imagem");
    obj.label140:setName("label140");

    obj.image14 = gui.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout15);
    obj.image14:setField("imagemArma14");
    obj.image14:setEditable(true);
    obj.image14:setStyle("autoFit");
    obj.image14:setLeft(870);
    obj.image14:setTop(5);
    obj.image14:setWidth(330);
    obj.image14:setHeight(75);
    obj.image14:setName("image14");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(2);
    obj.layout16:setTop(1333);
    obj.layout16:setWidth(1207);
    obj.layout16:setHeight(92);
    obj.layout16:setName("layout16");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout16);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout16);
    obj.rectangle31:setLeft(869);
    obj.rectangle31:setTop(4);
    obj.rectangle31:setWidth(332);
    obj.rectangle31:setHeight(77);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout16);
    obj.label141:setLeft(5);
    obj.label141:setTop(5);
    obj.label141:setWidth(50);
    obj.label141:setHeight(25);
    obj.label141:setText("NOME");
    obj.label141:setName("label141");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout16);
    obj.edit267:setVertTextAlign("center");
    obj.edit267:setLeft(55);
    obj.edit267:setTop(5);
    obj.edit267:setWidth(225);
    obj.edit267:setHeight(25);
    obj.edit267:setField("nome15");
    obj.edit267:setName("edit267");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout16);
    obj.label142:setLeft(5);
    obj.label142:setTop(30);
    obj.label142:setWidth(50);
    obj.label142:setHeight(25);
    obj.label142:setText("ARMA");
    obj.label142:setName("label142");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout16);
    obj.edit268:setVertTextAlign("center");
    obj.edit268:setLeft(55);
    obj.edit268:setTop(30);
    obj.edit268:setWidth(225);
    obj.edit268:setHeight(25);
    obj.edit268:setField("arma15");
    obj.edit268:setName("edit268");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout16);
    obj.label143:setLeft(5);
    obj.label143:setTop(55);
    obj.label143:setWidth(50);
    obj.label143:setHeight(25);
    obj.label143:setText("TIPO");
    obj.label143:setName("label143");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout16);
    obj.edit269:setVertTextAlign("center");
    obj.edit269:setLeft(55);
    obj.edit269:setTop(55);
    obj.edit269:setWidth(225);
    obj.edit269:setHeight(25);
    obj.edit269:setField("tipo15");
    obj.edit269:setName("edit269");

    obj.button43 = gui.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout16);
    obj.button43:setLeft(279);
    obj.button43:setTop(6);
    obj.button43:setWidth(73);
    obj.button43:setText("ATAQUE");
    obj.button43:setFontSize(11);
    obj.button43:setName("button43");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout16);
    obj.edit270:setType("number");
    obj.edit270:setVertTextAlign("center");
    obj.edit270:setLeft(352);
    obj.edit270:setTop(5);
    obj.edit270:setWidth(25);
    obj.edit270:setHeight(25);
    obj.edit270:setField("ataque15a");
    obj.edit270:setName("edit270");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout16);
    obj.edit271:setType("number");
    obj.edit271:setVertTextAlign("center");
    obj.edit271:setLeft(380);
    obj.edit271:setTop(5);
    obj.edit271:setWidth(25);
    obj.edit271:setHeight(25);
    obj.edit271:setField("ataque15b");
    obj.edit271:setName("edit271");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout16);
    obj.edit272:setType("number");
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setLeft(409);
    obj.edit272:setTop(5);
    obj.edit272:setWidth(25);
    obj.edit272:setHeight(25);
    obj.edit272:setField("ataque15c");
    obj.edit272:setName("edit272");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout16);
    obj.edit273:setType("number");
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setLeft(437);
    obj.edit273:setTop(5);
    obj.edit273:setWidth(25);
    obj.edit273:setHeight(25);
    obj.edit273:setField("ataque15d");
    obj.edit273:setName("edit273");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout16);
    obj.edit274:setType("number");
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setLeft(465);
    obj.edit274:setTop(5);
    obj.edit274:setWidth(25);
    obj.edit274:setHeight(25);
    obj.edit274:setField("ataque15e");
    obj.edit274:setName("edit274");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout16);
    obj.edit275:setType("number");
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setLeft(493);
    obj.edit275:setTop(5);
    obj.edit275:setWidth(25);
    obj.edit275:setHeight(25);
    obj.edit275:setField("ataque15f");
    obj.edit275:setName("edit275");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout16);
    obj.edit276:setType("number");
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setLeft(522);
    obj.edit276:setTop(5);
    obj.edit276:setWidth(25);
    obj.edit276:setHeight(25);
    obj.edit276:setField("ataque15g");
    obj.edit276:setName("edit276");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout16);
    obj.edit277:setType("number");
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setLeft(550);
    obj.edit277:setTop(5);
    obj.edit277:setWidth(25);
    obj.edit277:setHeight(25);
    obj.edit277:setField("ataque15h");
    obj.edit277:setName("edit277");

    obj.button44 = gui.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout16);
    obj.button44:setLeft(279);
    obj.button44:setTop(31);
    obj.button44:setWidth(73);
    obj.button44:setText("DANO");
    obj.button44:setFontSize(11);
    obj.button44:setName("button44");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout16);
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setLeft(352);
    obj.edit278:setTop(30);
    obj.edit278:setWidth(82);
    obj.edit278:setHeight(25);
    obj.edit278:setField("dano15");
    obj.edit278:setName("edit278");

    obj.button45 = gui.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout16);
    obj.button45:setLeft(434);
    obj.button45:setTop(31);
    obj.button45:setWidth(60);
    obj.button45:setText("CRITICO");
    obj.button45:setFontSize(11);
    obj.button45:setName("button45");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout16);
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setLeft(493);
    obj.edit279:setTop(30);
    obj.edit279:setWidth(82);
    obj.edit279:setHeight(25);
    obj.edit279:setField("danoCritico15");
    obj.edit279:setName("edit279");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout16);
    obj.label144:setLeft(290);
    obj.label144:setTop(55);
    obj.label144:setWidth(70);
    obj.label144:setHeight(25);
    obj.label144:setText("DECISIVO");
    obj.label144:setName("label144");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout16);
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setLeft(352);
    obj.edit280:setTop(55);
    obj.edit280:setWidth(82);
    obj.edit280:setHeight(25);
    obj.edit280:setField("decisivo15");
    obj.edit280:setName("edit280");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout16);
    obj.label145:setLeft(445);
    obj.label145:setTop(55);
    obj.label145:setWidth(50);
    obj.label145:setHeight(25);
    obj.label145:setText("MULTI");
    obj.label145:setName("label145");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout16);
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setLeft(493);
    obj.edit281:setTop(55);
    obj.edit281:setWidth(82);
    obj.edit281:setHeight(25);
    obj.edit281:setField("multiplicador15");
    obj.edit281:setName("edit281");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout16);
    obj.label146:setLeft(580);
    obj.label146:setTop(5);
    obj.label146:setWidth(80);
    obj.label146:setHeight(25);
    obj.label146:setText("CATEGORIA");
    obj.label146:setName("label146");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout16);
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setLeft(660);
    obj.edit282:setTop(5);
    obj.edit282:setWidth(200);
    obj.edit282:setHeight(25);
    obj.edit282:setField("categoria15");
    obj.edit282:setName("edit282");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout16);
    obj.label147:setLeft(610);
    obj.label147:setTop(30);
    obj.label147:setWidth(50);
    obj.label147:setHeight(25);
    obj.label147:setText("OBS");
    obj.label147:setName("label147");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout16);
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setLeft(660);
    obj.edit283:setTop(30);
    obj.edit283:setWidth(200);
    obj.edit283:setHeight(25);
    obj.edit283:setField("obs15");
    obj.edit283:setName("edit283");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout16);
    obj.label148:setLeft(590);
    obj.label148:setTop(55);
    obj.label148:setWidth(80);
    obj.label148:setHeight(25);
    obj.label148:setText("MUNIÇÃO");
    obj.label148:setName("label148");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout16);
    obj.edit284:setType("number");
    obj.edit284:setVertTextAlign("center");
    obj.edit284:setLeft(660);
    obj.edit284:setTop(55);
    obj.edit284:setWidth(69);
    obj.edit284:setHeight(25);
    obj.edit284:setField("municao15");
    obj.edit284:setName("edit284");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout16);
    obj.label149:setLeft(735);
    obj.label149:setTop(55);
    obj.label149:setWidth(70);
    obj.label149:setHeight(25);
    obj.label149:setText("ALCANCE");
    obj.label149:setName("label149");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout16);
    obj.edit285:setVertTextAlign("center");
    obj.edit285:setLeft(795);
    obj.edit285:setTop(55);
    obj.edit285:setWidth(65);
    obj.edit285:setHeight(25);
    obj.edit285:setField("alcance15");
    obj.edit285:setName("edit285");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout16);
    obj.label150:setLeft(870);
    obj.label150:setTop(25);
    obj.label150:setWidth(330);
    obj.label150:setHeight(25);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setText("Clique para adicionar imagem");
    obj.label150:setName("label150");

    obj.image15 = gui.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout16);
    obj.image15:setField("imagemArma15");
    obj.image15:setEditable(true);
    obj.image15:setStyle("autoFit");
    obj.image15:setLeft(870);
    obj.image15:setTop(5);
    obj.image15:setWidth(330);
    obj.image15:setHeight(75);
    obj.image15:setName("image15");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(2);
    obj.layout17:setTop(1428);
    obj.layout17:setWidth(1207);
    obj.layout17:setHeight(92);
    obj.layout17:setName("layout17");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout17);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout17);
    obj.rectangle33:setLeft(869);
    obj.rectangle33:setTop(4);
    obj.rectangle33:setWidth(332);
    obj.rectangle33:setHeight(77);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout17);
    obj.label151:setLeft(5);
    obj.label151:setTop(5);
    obj.label151:setWidth(50);
    obj.label151:setHeight(25);
    obj.label151:setText("NOME");
    obj.label151:setName("label151");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout17);
    obj.edit286:setVertTextAlign("center");
    obj.edit286:setLeft(55);
    obj.edit286:setTop(5);
    obj.edit286:setWidth(225);
    obj.edit286:setHeight(25);
    obj.edit286:setField("nome16");
    obj.edit286:setName("edit286");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout17);
    obj.label152:setLeft(5);
    obj.label152:setTop(30);
    obj.label152:setWidth(50);
    obj.label152:setHeight(25);
    obj.label152:setText("ARMA");
    obj.label152:setName("label152");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout17);
    obj.edit287:setVertTextAlign("center");
    obj.edit287:setLeft(55);
    obj.edit287:setTop(30);
    obj.edit287:setWidth(225);
    obj.edit287:setHeight(25);
    obj.edit287:setField("arma16");
    obj.edit287:setName("edit287");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout17);
    obj.label153:setLeft(5);
    obj.label153:setTop(55);
    obj.label153:setWidth(50);
    obj.label153:setHeight(25);
    obj.label153:setText("TIPO");
    obj.label153:setName("label153");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout17);
    obj.edit288:setVertTextAlign("center");
    obj.edit288:setLeft(55);
    obj.edit288:setTop(55);
    obj.edit288:setWidth(225);
    obj.edit288:setHeight(25);
    obj.edit288:setField("tipo16");
    obj.edit288:setName("edit288");

    obj.button46 = gui.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout17);
    obj.button46:setLeft(279);
    obj.button46:setTop(6);
    obj.button46:setWidth(73);
    obj.button46:setText("ATAQUE");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout17);
    obj.edit289:setType("number");
    obj.edit289:setVertTextAlign("center");
    obj.edit289:setLeft(352);
    obj.edit289:setTop(5);
    obj.edit289:setWidth(25);
    obj.edit289:setHeight(25);
    obj.edit289:setField("ataque16a");
    obj.edit289:setName("edit289");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout17);
    obj.edit290:setType("number");
    obj.edit290:setVertTextAlign("center");
    obj.edit290:setLeft(380);
    obj.edit290:setTop(5);
    obj.edit290:setWidth(25);
    obj.edit290:setHeight(25);
    obj.edit290:setField("ataque16b");
    obj.edit290:setName("edit290");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout17);
    obj.edit291:setType("number");
    obj.edit291:setVertTextAlign("center");
    obj.edit291:setLeft(409);
    obj.edit291:setTop(5);
    obj.edit291:setWidth(25);
    obj.edit291:setHeight(25);
    obj.edit291:setField("ataque16c");
    obj.edit291:setName("edit291");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout17);
    obj.edit292:setType("number");
    obj.edit292:setVertTextAlign("center");
    obj.edit292:setLeft(437);
    obj.edit292:setTop(5);
    obj.edit292:setWidth(25);
    obj.edit292:setHeight(25);
    obj.edit292:setField("ataque16d");
    obj.edit292:setName("edit292");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout17);
    obj.edit293:setType("number");
    obj.edit293:setVertTextAlign("center");
    obj.edit293:setLeft(465);
    obj.edit293:setTop(5);
    obj.edit293:setWidth(25);
    obj.edit293:setHeight(25);
    obj.edit293:setField("ataque16e");
    obj.edit293:setName("edit293");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout17);
    obj.edit294:setType("number");
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setLeft(493);
    obj.edit294:setTop(5);
    obj.edit294:setWidth(25);
    obj.edit294:setHeight(25);
    obj.edit294:setField("ataque16f");
    obj.edit294:setName("edit294");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout17);
    obj.edit295:setType("number");
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setLeft(522);
    obj.edit295:setTop(5);
    obj.edit295:setWidth(25);
    obj.edit295:setHeight(25);
    obj.edit295:setField("ataque16g");
    obj.edit295:setName("edit295");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout17);
    obj.edit296:setType("number");
    obj.edit296:setVertTextAlign("center");
    obj.edit296:setLeft(550);
    obj.edit296:setTop(5);
    obj.edit296:setWidth(25);
    obj.edit296:setHeight(25);
    obj.edit296:setField("ataque16h");
    obj.edit296:setName("edit296");

    obj.button47 = gui.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout17);
    obj.button47:setLeft(279);
    obj.button47:setTop(31);
    obj.button47:setWidth(73);
    obj.button47:setText("DANO");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout17);
    obj.edit297:setVertTextAlign("center");
    obj.edit297:setLeft(352);
    obj.edit297:setTop(30);
    obj.edit297:setWidth(82);
    obj.edit297:setHeight(25);
    obj.edit297:setField("dano16");
    obj.edit297:setName("edit297");

    obj.button48 = gui.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout17);
    obj.button48:setLeft(434);
    obj.button48:setTop(31);
    obj.button48:setWidth(60);
    obj.button48:setText("CRITICO");
    obj.button48:setFontSize(11);
    obj.button48:setName("button48");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout17);
    obj.edit298:setVertTextAlign("center");
    obj.edit298:setLeft(493);
    obj.edit298:setTop(30);
    obj.edit298:setWidth(82);
    obj.edit298:setHeight(25);
    obj.edit298:setField("danoCritico16");
    obj.edit298:setName("edit298");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout17);
    obj.label154:setLeft(290);
    obj.label154:setTop(55);
    obj.label154:setWidth(70);
    obj.label154:setHeight(25);
    obj.label154:setText("DECISIVO");
    obj.label154:setName("label154");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout17);
    obj.edit299:setVertTextAlign("center");
    obj.edit299:setLeft(352);
    obj.edit299:setTop(55);
    obj.edit299:setWidth(82);
    obj.edit299:setHeight(25);
    obj.edit299:setField("decisivo16");
    obj.edit299:setName("edit299");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout17);
    obj.label155:setLeft(445);
    obj.label155:setTop(55);
    obj.label155:setWidth(50);
    obj.label155:setHeight(25);
    obj.label155:setText("MULTI");
    obj.label155:setName("label155");

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout17);
    obj.edit300:setVertTextAlign("center");
    obj.edit300:setLeft(493);
    obj.edit300:setTop(55);
    obj.edit300:setWidth(82);
    obj.edit300:setHeight(25);
    obj.edit300:setField("multiplicador16");
    obj.edit300:setName("edit300");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout17);
    obj.label156:setLeft(580);
    obj.label156:setTop(5);
    obj.label156:setWidth(80);
    obj.label156:setHeight(25);
    obj.label156:setText("CATEGORIA");
    obj.label156:setName("label156");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout17);
    obj.edit301:setVertTextAlign("center");
    obj.edit301:setLeft(660);
    obj.edit301:setTop(5);
    obj.edit301:setWidth(200);
    obj.edit301:setHeight(25);
    obj.edit301:setField("categoria16");
    obj.edit301:setName("edit301");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout17);
    obj.label157:setLeft(610);
    obj.label157:setTop(30);
    obj.label157:setWidth(50);
    obj.label157:setHeight(25);
    obj.label157:setText("OBS");
    obj.label157:setName("label157");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout17);
    obj.edit302:setVertTextAlign("center");
    obj.edit302:setLeft(660);
    obj.edit302:setTop(30);
    obj.edit302:setWidth(200);
    obj.edit302:setHeight(25);
    obj.edit302:setField("obs16");
    obj.edit302:setName("edit302");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout17);
    obj.label158:setLeft(590);
    obj.label158:setTop(55);
    obj.label158:setWidth(80);
    obj.label158:setHeight(25);
    obj.label158:setText("MUNIÇÃO");
    obj.label158:setName("label158");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout17);
    obj.edit303:setType("number");
    obj.edit303:setVertTextAlign("center");
    obj.edit303:setLeft(660);
    obj.edit303:setTop(55);
    obj.edit303:setWidth(69);
    obj.edit303:setHeight(25);
    obj.edit303:setField("municao16");
    obj.edit303:setName("edit303");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout17);
    obj.label159:setLeft(735);
    obj.label159:setTop(55);
    obj.label159:setWidth(70);
    obj.label159:setHeight(25);
    obj.label159:setText("ALCANCE");
    obj.label159:setName("label159");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout17);
    obj.edit304:setVertTextAlign("center");
    obj.edit304:setLeft(795);
    obj.edit304:setTop(55);
    obj.edit304:setWidth(65);
    obj.edit304:setHeight(25);
    obj.edit304:setField("alcance16");
    obj.edit304:setName("edit304");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout17);
    obj.label160:setLeft(870);
    obj.label160:setTop(25);
    obj.label160:setWidth(330);
    obj.label160:setHeight(25);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setText("Clique para adicionar imagem");
    obj.label160:setName("label160");

    obj.image16 = gui.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout17);
    obj.image16:setField("imagemArma16");
    obj.image16:setEditable(true);
    obj.image16:setStyle("autoFit");
    obj.image16:setLeft(870);
    obj.image16:setTop(5);
    obj.image16:setWidth(330);
    obj.image16:setHeight(75);
    obj.image16:setName("image16");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout1);
    obj.layout18:setLeft(2);
    obj.layout18:setTop(1523);
    obj.layout18:setWidth(1207);
    obj.layout18:setHeight(92);
    obj.layout18:setName("layout18");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout18);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout18);
    obj.rectangle35:setLeft(869);
    obj.rectangle35:setTop(4);
    obj.rectangle35:setWidth(332);
    obj.rectangle35:setHeight(77);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout18);
    obj.label161:setLeft(5);
    obj.label161:setTop(5);
    obj.label161:setWidth(50);
    obj.label161:setHeight(25);
    obj.label161:setText("NOME");
    obj.label161:setName("label161");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout18);
    obj.edit305:setVertTextAlign("center");
    obj.edit305:setLeft(55);
    obj.edit305:setTop(5);
    obj.edit305:setWidth(225);
    obj.edit305:setHeight(25);
    obj.edit305:setField("nome17");
    obj.edit305:setName("edit305");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout18);
    obj.label162:setLeft(5);
    obj.label162:setTop(30);
    obj.label162:setWidth(50);
    obj.label162:setHeight(25);
    obj.label162:setText("ARMA");
    obj.label162:setName("label162");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout18);
    obj.edit306:setVertTextAlign("center");
    obj.edit306:setLeft(55);
    obj.edit306:setTop(30);
    obj.edit306:setWidth(225);
    obj.edit306:setHeight(25);
    obj.edit306:setField("arma17");
    obj.edit306:setName("edit306");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout18);
    obj.label163:setLeft(5);
    obj.label163:setTop(55);
    obj.label163:setWidth(50);
    obj.label163:setHeight(25);
    obj.label163:setText("TIPO");
    obj.label163:setName("label163");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout18);
    obj.edit307:setVertTextAlign("center");
    obj.edit307:setLeft(55);
    obj.edit307:setTop(55);
    obj.edit307:setWidth(225);
    obj.edit307:setHeight(25);
    obj.edit307:setField("tipo17");
    obj.edit307:setName("edit307");

    obj.button49 = gui.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout18);
    obj.button49:setLeft(279);
    obj.button49:setTop(6);
    obj.button49:setWidth(73);
    obj.button49:setText("ATAQUE");
    obj.button49:setFontSize(11);
    obj.button49:setName("button49");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout18);
    obj.edit308:setType("number");
    obj.edit308:setVertTextAlign("center");
    obj.edit308:setLeft(352);
    obj.edit308:setTop(5);
    obj.edit308:setWidth(25);
    obj.edit308:setHeight(25);
    obj.edit308:setField("ataque17a");
    obj.edit308:setName("edit308");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout18);
    obj.edit309:setType("number");
    obj.edit309:setVertTextAlign("center");
    obj.edit309:setLeft(380);
    obj.edit309:setTop(5);
    obj.edit309:setWidth(25);
    obj.edit309:setHeight(25);
    obj.edit309:setField("ataque17b");
    obj.edit309:setName("edit309");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout18);
    obj.edit310:setType("number");
    obj.edit310:setVertTextAlign("center");
    obj.edit310:setLeft(409);
    obj.edit310:setTop(5);
    obj.edit310:setWidth(25);
    obj.edit310:setHeight(25);
    obj.edit310:setField("ataque17c");
    obj.edit310:setName("edit310");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout18);
    obj.edit311:setType("number");
    obj.edit311:setVertTextAlign("center");
    obj.edit311:setLeft(437);
    obj.edit311:setTop(5);
    obj.edit311:setWidth(25);
    obj.edit311:setHeight(25);
    obj.edit311:setField("ataque17d");
    obj.edit311:setName("edit311");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout18);
    obj.edit312:setType("number");
    obj.edit312:setVertTextAlign("center");
    obj.edit312:setLeft(465);
    obj.edit312:setTop(5);
    obj.edit312:setWidth(25);
    obj.edit312:setHeight(25);
    obj.edit312:setField("ataque17e");
    obj.edit312:setName("edit312");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout18);
    obj.edit313:setType("number");
    obj.edit313:setVertTextAlign("center");
    obj.edit313:setLeft(493);
    obj.edit313:setTop(5);
    obj.edit313:setWidth(25);
    obj.edit313:setHeight(25);
    obj.edit313:setField("ataque17f");
    obj.edit313:setName("edit313");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout18);
    obj.edit314:setType("number");
    obj.edit314:setVertTextAlign("center");
    obj.edit314:setLeft(522);
    obj.edit314:setTop(5);
    obj.edit314:setWidth(25);
    obj.edit314:setHeight(25);
    obj.edit314:setField("ataque17g");
    obj.edit314:setName("edit314");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout18);
    obj.edit315:setType("number");
    obj.edit315:setVertTextAlign("center");
    obj.edit315:setLeft(550);
    obj.edit315:setTop(5);
    obj.edit315:setWidth(25);
    obj.edit315:setHeight(25);
    obj.edit315:setField("ataque17h");
    obj.edit315:setName("edit315");

    obj.button50 = gui.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout18);
    obj.button50:setLeft(279);
    obj.button50:setTop(31);
    obj.button50:setWidth(73);
    obj.button50:setText("DANO");
    obj.button50:setFontSize(11);
    obj.button50:setName("button50");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout18);
    obj.edit316:setVertTextAlign("center");
    obj.edit316:setLeft(352);
    obj.edit316:setTop(30);
    obj.edit316:setWidth(82);
    obj.edit316:setHeight(25);
    obj.edit316:setField("dano17");
    obj.edit316:setName("edit316");

    obj.button51 = gui.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout18);
    obj.button51:setLeft(434);
    obj.button51:setTop(31);
    obj.button51:setWidth(60);
    obj.button51:setText("CRITICO");
    obj.button51:setFontSize(11);
    obj.button51:setName("button51");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout18);
    obj.edit317:setVertTextAlign("center");
    obj.edit317:setLeft(493);
    obj.edit317:setTop(30);
    obj.edit317:setWidth(82);
    obj.edit317:setHeight(25);
    obj.edit317:setField("danoCritico17");
    obj.edit317:setName("edit317");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout18);
    obj.label164:setLeft(290);
    obj.label164:setTop(55);
    obj.label164:setWidth(70);
    obj.label164:setHeight(25);
    obj.label164:setText("DECISIVO");
    obj.label164:setName("label164");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout18);
    obj.edit318:setVertTextAlign("center");
    obj.edit318:setLeft(352);
    obj.edit318:setTop(55);
    obj.edit318:setWidth(82);
    obj.edit318:setHeight(25);
    obj.edit318:setField("decisivo17");
    obj.edit318:setName("edit318");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout18);
    obj.label165:setLeft(445);
    obj.label165:setTop(55);
    obj.label165:setWidth(50);
    obj.label165:setHeight(25);
    obj.label165:setText("MULTI");
    obj.label165:setName("label165");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout18);
    obj.edit319:setVertTextAlign("center");
    obj.edit319:setLeft(493);
    obj.edit319:setTop(55);
    obj.edit319:setWidth(82);
    obj.edit319:setHeight(25);
    obj.edit319:setField("multiplicador17");
    obj.edit319:setName("edit319");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout18);
    obj.label166:setLeft(580);
    obj.label166:setTop(5);
    obj.label166:setWidth(80);
    obj.label166:setHeight(25);
    obj.label166:setText("CATEGORIA");
    obj.label166:setName("label166");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout18);
    obj.edit320:setVertTextAlign("center");
    obj.edit320:setLeft(660);
    obj.edit320:setTop(5);
    obj.edit320:setWidth(200);
    obj.edit320:setHeight(25);
    obj.edit320:setField("categoria17");
    obj.edit320:setName("edit320");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout18);
    obj.label167:setLeft(610);
    obj.label167:setTop(30);
    obj.label167:setWidth(50);
    obj.label167:setHeight(25);
    obj.label167:setText("OBS");
    obj.label167:setName("label167");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout18);
    obj.edit321:setVertTextAlign("center");
    obj.edit321:setLeft(660);
    obj.edit321:setTop(30);
    obj.edit321:setWidth(200);
    obj.edit321:setHeight(25);
    obj.edit321:setField("obs17");
    obj.edit321:setName("edit321");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout18);
    obj.label168:setLeft(590);
    obj.label168:setTop(55);
    obj.label168:setWidth(80);
    obj.label168:setHeight(25);
    obj.label168:setText("MUNIÇÃO");
    obj.label168:setName("label168");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout18);
    obj.edit322:setType("number");
    obj.edit322:setVertTextAlign("center");
    obj.edit322:setLeft(660);
    obj.edit322:setTop(55);
    obj.edit322:setWidth(69);
    obj.edit322:setHeight(25);
    obj.edit322:setField("municao17");
    obj.edit322:setName("edit322");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout18);
    obj.label169:setLeft(735);
    obj.label169:setTop(55);
    obj.label169:setWidth(70);
    obj.label169:setHeight(25);
    obj.label169:setText("ALCANCE");
    obj.label169:setName("label169");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout18);
    obj.edit323:setVertTextAlign("center");
    obj.edit323:setLeft(795);
    obj.edit323:setTop(55);
    obj.edit323:setWidth(65);
    obj.edit323:setHeight(25);
    obj.edit323:setField("alcance17");
    obj.edit323:setName("edit323");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout18);
    obj.label170:setLeft(870);
    obj.label170:setTop(25);
    obj.label170:setWidth(330);
    obj.label170:setHeight(25);
    obj.label170:setHorzTextAlign("center");
    obj.label170:setText("Clique para adicionar imagem");
    obj.label170:setName("label170");

    obj.image17 = gui.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout18);
    obj.image17:setField("imagemArma17");
    obj.image17:setEditable(true);
    obj.image17:setStyle("autoFit");
    obj.image17:setLeft(870);
    obj.image17:setTop(5);
    obj.image17:setWidth(330);
    obj.image17:setHeight(75);
    obj.image17:setName("image17");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setLeft(2);
    obj.layout19:setTop(1618);
    obj.layout19:setWidth(1207);
    obj.layout19:setHeight(92);
    obj.layout19:setName("layout19");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout19);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout19);
    obj.rectangle37:setLeft(869);
    obj.rectangle37:setTop(4);
    obj.rectangle37:setWidth(332);
    obj.rectangle37:setHeight(77);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout19);
    obj.label171:setLeft(5);
    obj.label171:setTop(5);
    obj.label171:setWidth(50);
    obj.label171:setHeight(25);
    obj.label171:setText("NOME");
    obj.label171:setName("label171");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout19);
    obj.edit324:setVertTextAlign("center");
    obj.edit324:setLeft(55);
    obj.edit324:setTop(5);
    obj.edit324:setWidth(225);
    obj.edit324:setHeight(25);
    obj.edit324:setField("nome18");
    obj.edit324:setName("edit324");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout19);
    obj.label172:setLeft(5);
    obj.label172:setTop(30);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setText("ARMA");
    obj.label172:setName("label172");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout19);
    obj.edit325:setVertTextAlign("center");
    obj.edit325:setLeft(55);
    obj.edit325:setTop(30);
    obj.edit325:setWidth(225);
    obj.edit325:setHeight(25);
    obj.edit325:setField("arma18");
    obj.edit325:setName("edit325");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout19);
    obj.label173:setLeft(5);
    obj.label173:setTop(55);
    obj.label173:setWidth(50);
    obj.label173:setHeight(25);
    obj.label173:setText("TIPO");
    obj.label173:setName("label173");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout19);
    obj.edit326:setVertTextAlign("center");
    obj.edit326:setLeft(55);
    obj.edit326:setTop(55);
    obj.edit326:setWidth(225);
    obj.edit326:setHeight(25);
    obj.edit326:setField("tipo18");
    obj.edit326:setName("edit326");

    obj.button52 = gui.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout19);
    obj.button52:setLeft(279);
    obj.button52:setTop(6);
    obj.button52:setWidth(73);
    obj.button52:setText("ATAQUE");
    obj.button52:setFontSize(11);
    obj.button52:setName("button52");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout19);
    obj.edit327:setType("number");
    obj.edit327:setVertTextAlign("center");
    obj.edit327:setLeft(352);
    obj.edit327:setTop(5);
    obj.edit327:setWidth(25);
    obj.edit327:setHeight(25);
    obj.edit327:setField("ataque18a");
    obj.edit327:setName("edit327");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout19);
    obj.edit328:setType("number");
    obj.edit328:setVertTextAlign("center");
    obj.edit328:setLeft(380);
    obj.edit328:setTop(5);
    obj.edit328:setWidth(25);
    obj.edit328:setHeight(25);
    obj.edit328:setField("ataque18b");
    obj.edit328:setName("edit328");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout19);
    obj.edit329:setType("number");
    obj.edit329:setVertTextAlign("center");
    obj.edit329:setLeft(409);
    obj.edit329:setTop(5);
    obj.edit329:setWidth(25);
    obj.edit329:setHeight(25);
    obj.edit329:setField("ataque18c");
    obj.edit329:setName("edit329");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout19);
    obj.edit330:setType("number");
    obj.edit330:setVertTextAlign("center");
    obj.edit330:setLeft(437);
    obj.edit330:setTop(5);
    obj.edit330:setWidth(25);
    obj.edit330:setHeight(25);
    obj.edit330:setField("ataque18d");
    obj.edit330:setName("edit330");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout19);
    obj.edit331:setType("number");
    obj.edit331:setVertTextAlign("center");
    obj.edit331:setLeft(465);
    obj.edit331:setTop(5);
    obj.edit331:setWidth(25);
    obj.edit331:setHeight(25);
    obj.edit331:setField("ataque18e");
    obj.edit331:setName("edit331");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout19);
    obj.edit332:setType("number");
    obj.edit332:setVertTextAlign("center");
    obj.edit332:setLeft(493);
    obj.edit332:setTop(5);
    obj.edit332:setWidth(25);
    obj.edit332:setHeight(25);
    obj.edit332:setField("ataque18f");
    obj.edit332:setName("edit332");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout19);
    obj.edit333:setType("number");
    obj.edit333:setVertTextAlign("center");
    obj.edit333:setLeft(522);
    obj.edit333:setTop(5);
    obj.edit333:setWidth(25);
    obj.edit333:setHeight(25);
    obj.edit333:setField("ataque18g");
    obj.edit333:setName("edit333");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout19);
    obj.edit334:setType("number");
    obj.edit334:setVertTextAlign("center");
    obj.edit334:setLeft(550);
    obj.edit334:setTop(5);
    obj.edit334:setWidth(25);
    obj.edit334:setHeight(25);
    obj.edit334:setField("ataque18h");
    obj.edit334:setName("edit334");

    obj.button53 = gui.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout19);
    obj.button53:setLeft(279);
    obj.button53:setTop(31);
    obj.button53:setWidth(73);
    obj.button53:setText("DANO");
    obj.button53:setFontSize(11);
    obj.button53:setName("button53");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout19);
    obj.edit335:setVertTextAlign("center");
    obj.edit335:setLeft(352);
    obj.edit335:setTop(30);
    obj.edit335:setWidth(82);
    obj.edit335:setHeight(25);
    obj.edit335:setField("dano18");
    obj.edit335:setName("edit335");

    obj.button54 = gui.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout19);
    obj.button54:setLeft(434);
    obj.button54:setTop(31);
    obj.button54:setWidth(60);
    obj.button54:setText("CRITICO");
    obj.button54:setFontSize(11);
    obj.button54:setName("button54");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout19);
    obj.edit336:setVertTextAlign("center");
    obj.edit336:setLeft(493);
    obj.edit336:setTop(30);
    obj.edit336:setWidth(82);
    obj.edit336:setHeight(25);
    obj.edit336:setField("danoCritico18");
    obj.edit336:setName("edit336");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout19);
    obj.label174:setLeft(290);
    obj.label174:setTop(55);
    obj.label174:setWidth(70);
    obj.label174:setHeight(25);
    obj.label174:setText("DECISIVO");
    obj.label174:setName("label174");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout19);
    obj.edit337:setVertTextAlign("center");
    obj.edit337:setLeft(352);
    obj.edit337:setTop(55);
    obj.edit337:setWidth(82);
    obj.edit337:setHeight(25);
    obj.edit337:setField("decisivo18");
    obj.edit337:setName("edit337");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout19);
    obj.label175:setLeft(445);
    obj.label175:setTop(55);
    obj.label175:setWidth(50);
    obj.label175:setHeight(25);
    obj.label175:setText("MULTI");
    obj.label175:setName("label175");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout19);
    obj.edit338:setVertTextAlign("center");
    obj.edit338:setLeft(493);
    obj.edit338:setTop(55);
    obj.edit338:setWidth(82);
    obj.edit338:setHeight(25);
    obj.edit338:setField("multiplicador18");
    obj.edit338:setName("edit338");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout19);
    obj.label176:setLeft(580);
    obj.label176:setTop(5);
    obj.label176:setWidth(80);
    obj.label176:setHeight(25);
    obj.label176:setText("CATEGORIA");
    obj.label176:setName("label176");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout19);
    obj.edit339:setVertTextAlign("center");
    obj.edit339:setLeft(660);
    obj.edit339:setTop(5);
    obj.edit339:setWidth(200);
    obj.edit339:setHeight(25);
    obj.edit339:setField("categoria18");
    obj.edit339:setName("edit339");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout19);
    obj.label177:setLeft(610);
    obj.label177:setTop(30);
    obj.label177:setWidth(50);
    obj.label177:setHeight(25);
    obj.label177:setText("OBS");
    obj.label177:setName("label177");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout19);
    obj.edit340:setVertTextAlign("center");
    obj.edit340:setLeft(660);
    obj.edit340:setTop(30);
    obj.edit340:setWidth(200);
    obj.edit340:setHeight(25);
    obj.edit340:setField("obs18");
    obj.edit340:setName("edit340");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout19);
    obj.label178:setLeft(590);
    obj.label178:setTop(55);
    obj.label178:setWidth(80);
    obj.label178:setHeight(25);
    obj.label178:setText("MUNIÇÃO");
    obj.label178:setName("label178");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout19);
    obj.edit341:setType("number");
    obj.edit341:setVertTextAlign("center");
    obj.edit341:setLeft(660);
    obj.edit341:setTop(55);
    obj.edit341:setWidth(69);
    obj.edit341:setHeight(25);
    obj.edit341:setField("municao18");
    obj.edit341:setName("edit341");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout19);
    obj.label179:setLeft(735);
    obj.label179:setTop(55);
    obj.label179:setWidth(70);
    obj.label179:setHeight(25);
    obj.label179:setText("ALCANCE");
    obj.label179:setName("label179");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout19);
    obj.edit342:setVertTextAlign("center");
    obj.edit342:setLeft(795);
    obj.edit342:setTop(55);
    obj.edit342:setWidth(65);
    obj.edit342:setHeight(25);
    obj.edit342:setField("alcance18");
    obj.edit342:setName("edit342");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout19);
    obj.label180:setLeft(870);
    obj.label180:setTop(25);
    obj.label180:setWidth(330);
    obj.label180:setHeight(25);
    obj.label180:setHorzTextAlign("center");
    obj.label180:setText("Clique para adicionar imagem");
    obj.label180:setName("label180");

    obj.image18 = gui.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout19);
    obj.image18:setField("imagemArma18");
    obj.image18:setEditable(true);
    obj.image18:setStyle("autoFit");
    obj.image18:setLeft(870);
    obj.image18:setTop(5);
    obj.image18:setWidth(330);
    obj.image18:setHeight(75);
    obj.image18:setName("image18");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setLeft(2);
    obj.layout20:setTop(1713);
    obj.layout20:setWidth(1207);
    obj.layout20:setHeight(92);
    obj.layout20:setName("layout20");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout20);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout20);
    obj.rectangle39:setLeft(869);
    obj.rectangle39:setTop(4);
    obj.rectangle39:setWidth(332);
    obj.rectangle39:setHeight(77);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout20);
    obj.label181:setLeft(5);
    obj.label181:setTop(5);
    obj.label181:setWidth(50);
    obj.label181:setHeight(25);
    obj.label181:setText("NOME");
    obj.label181:setName("label181");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout20);
    obj.edit343:setVertTextAlign("center");
    obj.edit343:setLeft(55);
    obj.edit343:setTop(5);
    obj.edit343:setWidth(225);
    obj.edit343:setHeight(25);
    obj.edit343:setField("nome19");
    obj.edit343:setName("edit343");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout20);
    obj.label182:setLeft(5);
    obj.label182:setTop(30);
    obj.label182:setWidth(50);
    obj.label182:setHeight(25);
    obj.label182:setText("ARMA");
    obj.label182:setName("label182");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout20);
    obj.edit344:setVertTextAlign("center");
    obj.edit344:setLeft(55);
    obj.edit344:setTop(30);
    obj.edit344:setWidth(225);
    obj.edit344:setHeight(25);
    obj.edit344:setField("arma19");
    obj.edit344:setName("edit344");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout20);
    obj.label183:setLeft(5);
    obj.label183:setTop(55);
    obj.label183:setWidth(50);
    obj.label183:setHeight(25);
    obj.label183:setText("TIPO");
    obj.label183:setName("label183");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout20);
    obj.edit345:setVertTextAlign("center");
    obj.edit345:setLeft(55);
    obj.edit345:setTop(55);
    obj.edit345:setWidth(225);
    obj.edit345:setHeight(25);
    obj.edit345:setField("tipo19");
    obj.edit345:setName("edit345");

    obj.button55 = gui.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout20);
    obj.button55:setLeft(279);
    obj.button55:setTop(6);
    obj.button55:setWidth(73);
    obj.button55:setText("ATAQUE");
    obj.button55:setFontSize(11);
    obj.button55:setName("button55");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout20);
    obj.edit346:setType("number");
    obj.edit346:setVertTextAlign("center");
    obj.edit346:setLeft(352);
    obj.edit346:setTop(5);
    obj.edit346:setWidth(25);
    obj.edit346:setHeight(25);
    obj.edit346:setField("ataque19a");
    obj.edit346:setName("edit346");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout20);
    obj.edit347:setType("number");
    obj.edit347:setVertTextAlign("center");
    obj.edit347:setLeft(380);
    obj.edit347:setTop(5);
    obj.edit347:setWidth(25);
    obj.edit347:setHeight(25);
    obj.edit347:setField("ataque19b");
    obj.edit347:setName("edit347");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout20);
    obj.edit348:setType("number");
    obj.edit348:setVertTextAlign("center");
    obj.edit348:setLeft(409);
    obj.edit348:setTop(5);
    obj.edit348:setWidth(25);
    obj.edit348:setHeight(25);
    obj.edit348:setField("ataque19c");
    obj.edit348:setName("edit348");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout20);
    obj.edit349:setType("number");
    obj.edit349:setVertTextAlign("center");
    obj.edit349:setLeft(437);
    obj.edit349:setTop(5);
    obj.edit349:setWidth(25);
    obj.edit349:setHeight(25);
    obj.edit349:setField("ataque19d");
    obj.edit349:setName("edit349");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout20);
    obj.edit350:setType("number");
    obj.edit350:setVertTextAlign("center");
    obj.edit350:setLeft(465);
    obj.edit350:setTop(5);
    obj.edit350:setWidth(25);
    obj.edit350:setHeight(25);
    obj.edit350:setField("ataque19e");
    obj.edit350:setName("edit350");

    obj.edit351 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout20);
    obj.edit351:setType("number");
    obj.edit351:setVertTextAlign("center");
    obj.edit351:setLeft(493);
    obj.edit351:setTop(5);
    obj.edit351:setWidth(25);
    obj.edit351:setHeight(25);
    obj.edit351:setField("ataque19f");
    obj.edit351:setName("edit351");

    obj.edit352 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout20);
    obj.edit352:setType("number");
    obj.edit352:setVertTextAlign("center");
    obj.edit352:setLeft(522);
    obj.edit352:setTop(5);
    obj.edit352:setWidth(25);
    obj.edit352:setHeight(25);
    obj.edit352:setField("ataque19g");
    obj.edit352:setName("edit352");

    obj.edit353 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout20);
    obj.edit353:setType("number");
    obj.edit353:setVertTextAlign("center");
    obj.edit353:setLeft(550);
    obj.edit353:setTop(5);
    obj.edit353:setWidth(25);
    obj.edit353:setHeight(25);
    obj.edit353:setField("ataque19h");
    obj.edit353:setName("edit353");

    obj.button56 = gui.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout20);
    obj.button56:setLeft(279);
    obj.button56:setTop(31);
    obj.button56:setWidth(73);
    obj.button56:setText("DANO");
    obj.button56:setFontSize(11);
    obj.button56:setName("button56");

    obj.edit354 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout20);
    obj.edit354:setVertTextAlign("center");
    obj.edit354:setLeft(352);
    obj.edit354:setTop(30);
    obj.edit354:setWidth(82);
    obj.edit354:setHeight(25);
    obj.edit354:setField("dano19");
    obj.edit354:setName("edit354");

    obj.button57 = gui.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout20);
    obj.button57:setLeft(434);
    obj.button57:setTop(31);
    obj.button57:setWidth(60);
    obj.button57:setText("CRITICO");
    obj.button57:setFontSize(11);
    obj.button57:setName("button57");

    obj.edit355 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout20);
    obj.edit355:setVertTextAlign("center");
    obj.edit355:setLeft(493);
    obj.edit355:setTop(30);
    obj.edit355:setWidth(82);
    obj.edit355:setHeight(25);
    obj.edit355:setField("danoCritico19");
    obj.edit355:setName("edit355");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout20);
    obj.label184:setLeft(290);
    obj.label184:setTop(55);
    obj.label184:setWidth(70);
    obj.label184:setHeight(25);
    obj.label184:setText("DECISIVO");
    obj.label184:setName("label184");

    obj.edit356 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout20);
    obj.edit356:setVertTextAlign("center");
    obj.edit356:setLeft(352);
    obj.edit356:setTop(55);
    obj.edit356:setWidth(82);
    obj.edit356:setHeight(25);
    obj.edit356:setField("decisivo19");
    obj.edit356:setName("edit356");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout20);
    obj.label185:setLeft(445);
    obj.label185:setTop(55);
    obj.label185:setWidth(50);
    obj.label185:setHeight(25);
    obj.label185:setText("MULTI");
    obj.label185:setName("label185");

    obj.edit357 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout20);
    obj.edit357:setVertTextAlign("center");
    obj.edit357:setLeft(493);
    obj.edit357:setTop(55);
    obj.edit357:setWidth(82);
    obj.edit357:setHeight(25);
    obj.edit357:setField("multiplicador19");
    obj.edit357:setName("edit357");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout20);
    obj.label186:setLeft(580);
    obj.label186:setTop(5);
    obj.label186:setWidth(80);
    obj.label186:setHeight(25);
    obj.label186:setText("CATEGORIA");
    obj.label186:setName("label186");

    obj.edit358 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout20);
    obj.edit358:setVertTextAlign("center");
    obj.edit358:setLeft(660);
    obj.edit358:setTop(5);
    obj.edit358:setWidth(200);
    obj.edit358:setHeight(25);
    obj.edit358:setField("categoria19");
    obj.edit358:setName("edit358");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout20);
    obj.label187:setLeft(610);
    obj.label187:setTop(30);
    obj.label187:setWidth(50);
    obj.label187:setHeight(25);
    obj.label187:setText("OBS");
    obj.label187:setName("label187");

    obj.edit359 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout20);
    obj.edit359:setVertTextAlign("center");
    obj.edit359:setLeft(660);
    obj.edit359:setTop(30);
    obj.edit359:setWidth(200);
    obj.edit359:setHeight(25);
    obj.edit359:setField("obs19");
    obj.edit359:setName("edit359");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout20);
    obj.label188:setLeft(590);
    obj.label188:setTop(55);
    obj.label188:setWidth(80);
    obj.label188:setHeight(25);
    obj.label188:setText("MUNIÇÃO");
    obj.label188:setName("label188");

    obj.edit360 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout20);
    obj.edit360:setType("number");
    obj.edit360:setVertTextAlign("center");
    obj.edit360:setLeft(660);
    obj.edit360:setTop(55);
    obj.edit360:setWidth(69);
    obj.edit360:setHeight(25);
    obj.edit360:setField("municao19");
    obj.edit360:setName("edit360");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout20);
    obj.label189:setLeft(735);
    obj.label189:setTop(55);
    obj.label189:setWidth(70);
    obj.label189:setHeight(25);
    obj.label189:setText("ALCANCE");
    obj.label189:setName("label189");

    obj.edit361 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout20);
    obj.edit361:setVertTextAlign("center");
    obj.edit361:setLeft(795);
    obj.edit361:setTop(55);
    obj.edit361:setWidth(65);
    obj.edit361:setHeight(25);
    obj.edit361:setField("alcance19");
    obj.edit361:setName("edit361");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout20);
    obj.label190:setLeft(870);
    obj.label190:setTop(25);
    obj.label190:setWidth(330);
    obj.label190:setHeight(25);
    obj.label190:setHorzTextAlign("center");
    obj.label190:setText("Clique para adicionar imagem");
    obj.label190:setName("label190");

    obj.image19 = gui.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout20);
    obj.image19:setField("imagemArma19");
    obj.image19:setEditable(true);
    obj.image19:setStyle("autoFit");
    obj.image19:setLeft(870);
    obj.image19:setTop(5);
    obj.image19:setWidth(330);
    obj.image19:setHeight(75);
    obj.image19:setName("image19");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setLeft(2);
    obj.layout21:setTop(1808);
    obj.layout21:setWidth(1207);
    obj.layout21:setHeight(92);
    obj.layout21:setName("layout21");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout21);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout21);
    obj.rectangle41:setLeft(869);
    obj.rectangle41:setTop(4);
    obj.rectangle41:setWidth(332);
    obj.rectangle41:setHeight(77);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout21);
    obj.label191:setLeft(5);
    obj.label191:setTop(5);
    obj.label191:setWidth(50);
    obj.label191:setHeight(25);
    obj.label191:setText("NOME");
    obj.label191:setName("label191");

    obj.edit362 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout21);
    obj.edit362:setVertTextAlign("center");
    obj.edit362:setLeft(55);
    obj.edit362:setTop(5);
    obj.edit362:setWidth(225);
    obj.edit362:setHeight(25);
    obj.edit362:setField("nome20");
    obj.edit362:setName("edit362");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout21);
    obj.label192:setLeft(5);
    obj.label192:setTop(30);
    obj.label192:setWidth(50);
    obj.label192:setHeight(25);
    obj.label192:setText("ARMA");
    obj.label192:setName("label192");

    obj.edit363 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout21);
    obj.edit363:setVertTextAlign("center");
    obj.edit363:setLeft(55);
    obj.edit363:setTop(30);
    obj.edit363:setWidth(225);
    obj.edit363:setHeight(25);
    obj.edit363:setField("arma20");
    obj.edit363:setName("edit363");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout21);
    obj.label193:setLeft(5);
    obj.label193:setTop(55);
    obj.label193:setWidth(50);
    obj.label193:setHeight(25);
    obj.label193:setText("TIPO");
    obj.label193:setName("label193");

    obj.edit364 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout21);
    obj.edit364:setVertTextAlign("center");
    obj.edit364:setLeft(55);
    obj.edit364:setTop(55);
    obj.edit364:setWidth(225);
    obj.edit364:setHeight(25);
    obj.edit364:setField("tipo20");
    obj.edit364:setName("edit364");

    obj.button58 = gui.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout21);
    obj.button58:setLeft(279);
    obj.button58:setTop(6);
    obj.button58:setWidth(73);
    obj.button58:setText("ATAQUE");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.edit365 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout21);
    obj.edit365:setType("number");
    obj.edit365:setVertTextAlign("center");
    obj.edit365:setLeft(352);
    obj.edit365:setTop(5);
    obj.edit365:setWidth(25);
    obj.edit365:setHeight(25);
    obj.edit365:setField("ataque20a");
    obj.edit365:setName("edit365");

    obj.edit366 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout21);
    obj.edit366:setType("number");
    obj.edit366:setVertTextAlign("center");
    obj.edit366:setLeft(380);
    obj.edit366:setTop(5);
    obj.edit366:setWidth(25);
    obj.edit366:setHeight(25);
    obj.edit366:setField("ataque20b");
    obj.edit366:setName("edit366");

    obj.edit367 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout21);
    obj.edit367:setType("number");
    obj.edit367:setVertTextAlign("center");
    obj.edit367:setLeft(409);
    obj.edit367:setTop(5);
    obj.edit367:setWidth(25);
    obj.edit367:setHeight(25);
    obj.edit367:setField("ataque20c");
    obj.edit367:setName("edit367");

    obj.edit368 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout21);
    obj.edit368:setType("number");
    obj.edit368:setVertTextAlign("center");
    obj.edit368:setLeft(437);
    obj.edit368:setTop(5);
    obj.edit368:setWidth(25);
    obj.edit368:setHeight(25);
    obj.edit368:setField("ataque20d");
    obj.edit368:setName("edit368");

    obj.edit369 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout21);
    obj.edit369:setType("number");
    obj.edit369:setVertTextAlign("center");
    obj.edit369:setLeft(465);
    obj.edit369:setTop(5);
    obj.edit369:setWidth(25);
    obj.edit369:setHeight(25);
    obj.edit369:setField("ataque20e");
    obj.edit369:setName("edit369");

    obj.edit370 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout21);
    obj.edit370:setType("number");
    obj.edit370:setVertTextAlign("center");
    obj.edit370:setLeft(493);
    obj.edit370:setTop(5);
    obj.edit370:setWidth(25);
    obj.edit370:setHeight(25);
    obj.edit370:setField("ataque20f");
    obj.edit370:setName("edit370");

    obj.edit371 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout21);
    obj.edit371:setType("number");
    obj.edit371:setVertTextAlign("center");
    obj.edit371:setLeft(522);
    obj.edit371:setTop(5);
    obj.edit371:setWidth(25);
    obj.edit371:setHeight(25);
    obj.edit371:setField("ataque20g");
    obj.edit371:setName("edit371");

    obj.edit372 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout21);
    obj.edit372:setType("number");
    obj.edit372:setVertTextAlign("center");
    obj.edit372:setLeft(550);
    obj.edit372:setTop(5);
    obj.edit372:setWidth(25);
    obj.edit372:setHeight(25);
    obj.edit372:setField("ataque20h");
    obj.edit372:setName("edit372");

    obj.button59 = gui.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout21);
    obj.button59:setLeft(279);
    obj.button59:setTop(31);
    obj.button59:setWidth(73);
    obj.button59:setText("DANO");
    obj.button59:setFontSize(11);
    obj.button59:setName("button59");

    obj.edit373 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout21);
    obj.edit373:setVertTextAlign("center");
    obj.edit373:setLeft(352);
    obj.edit373:setTop(30);
    obj.edit373:setWidth(82);
    obj.edit373:setHeight(25);
    obj.edit373:setField("dano20");
    obj.edit373:setName("edit373");

    obj.button60 = gui.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout21);
    obj.button60:setLeft(434);
    obj.button60:setTop(31);
    obj.button60:setWidth(60);
    obj.button60:setText("CRITICO");
    obj.button60:setFontSize(11);
    obj.button60:setName("button60");

    obj.edit374 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout21);
    obj.edit374:setVertTextAlign("center");
    obj.edit374:setLeft(493);
    obj.edit374:setTop(30);
    obj.edit374:setWidth(82);
    obj.edit374:setHeight(25);
    obj.edit374:setField("danoCritico20");
    obj.edit374:setName("edit374");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout21);
    obj.label194:setLeft(290);
    obj.label194:setTop(55);
    obj.label194:setWidth(70);
    obj.label194:setHeight(25);
    obj.label194:setText("DECISIVO");
    obj.label194:setName("label194");

    obj.edit375 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout21);
    obj.edit375:setVertTextAlign("center");
    obj.edit375:setLeft(352);
    obj.edit375:setTop(55);
    obj.edit375:setWidth(82);
    obj.edit375:setHeight(25);
    obj.edit375:setField("decisivo20");
    obj.edit375:setName("edit375");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout21);
    obj.label195:setLeft(445);
    obj.label195:setTop(55);
    obj.label195:setWidth(50);
    obj.label195:setHeight(25);
    obj.label195:setText("MULTI");
    obj.label195:setName("label195");

    obj.edit376 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout21);
    obj.edit376:setVertTextAlign("center");
    obj.edit376:setLeft(493);
    obj.edit376:setTop(55);
    obj.edit376:setWidth(82);
    obj.edit376:setHeight(25);
    obj.edit376:setField("multiplicador20");
    obj.edit376:setName("edit376");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout21);
    obj.label196:setLeft(580);
    obj.label196:setTop(5);
    obj.label196:setWidth(80);
    obj.label196:setHeight(25);
    obj.label196:setText("CATEGORIA");
    obj.label196:setName("label196");

    obj.edit377 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout21);
    obj.edit377:setVertTextAlign("center");
    obj.edit377:setLeft(660);
    obj.edit377:setTop(5);
    obj.edit377:setWidth(200);
    obj.edit377:setHeight(25);
    obj.edit377:setField("categoria20");
    obj.edit377:setName("edit377");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout21);
    obj.label197:setLeft(610);
    obj.label197:setTop(30);
    obj.label197:setWidth(50);
    obj.label197:setHeight(25);
    obj.label197:setText("OBS");
    obj.label197:setName("label197");

    obj.edit378 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout21);
    obj.edit378:setVertTextAlign("center");
    obj.edit378:setLeft(660);
    obj.edit378:setTop(30);
    obj.edit378:setWidth(200);
    obj.edit378:setHeight(25);
    obj.edit378:setField("obs20");
    obj.edit378:setName("edit378");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout21);
    obj.label198:setLeft(590);
    obj.label198:setTop(55);
    obj.label198:setWidth(80);
    obj.label198:setHeight(25);
    obj.label198:setText("MUNIÇÃO");
    obj.label198:setName("label198");

    obj.edit379 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout21);
    obj.edit379:setType("number");
    obj.edit379:setVertTextAlign("center");
    obj.edit379:setLeft(660);
    obj.edit379:setTop(55);
    obj.edit379:setWidth(69);
    obj.edit379:setHeight(25);
    obj.edit379:setField("municao20");
    obj.edit379:setName("edit379");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout21);
    obj.label199:setLeft(735);
    obj.label199:setTop(55);
    obj.label199:setWidth(70);
    obj.label199:setHeight(25);
    obj.label199:setText("ALCANCE");
    obj.label199:setName("label199");

    obj.edit380 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout21);
    obj.edit380:setVertTextAlign("center");
    obj.edit380:setLeft(795);
    obj.edit380:setTop(55);
    obj.edit380:setWidth(65);
    obj.edit380:setHeight(25);
    obj.edit380:setField("alcance20");
    obj.edit380:setName("edit380");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout21);
    obj.label200:setLeft(870);
    obj.label200:setTop(25);
    obj.label200:setWidth(330);
    obj.label200:setHeight(25);
    obj.label200:setHorzTextAlign("center");
    obj.label200:setText("Clique para adicionar imagem");
    obj.label200:setName("label200");

    obj.image20 = gui.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout21);
    obj.image20:setField("imagemArma20");
    obj.image20:setEditable(true);
    obj.image20:setStyle("autoFit");
    obj.image20:setLeft(870);
    obj.image20:setTop(5);
    obj.image20:setWidth(330);
    obj.image20:setHeight(75);
    obj.image20:setName("image20");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque1a, sheet.ataque1b, sheet.ataque1c, sheet.ataque1d, sheet.ataque1e, sheet.ataque1f, sheet.ataque1g, sheet.ataque1h};
            					decisivo = tonumber(string.sub(sheet.decisivo1, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano1);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico1);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome1;
            					municao = tonumber(sheet.municao1);
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao1 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano1);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome1;
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico1);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome1;
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque2a, sheet.ataque2b, sheet.ataque2c, sheet.ataque2d, sheet.ataque2e, sheet.ataque2f, sheet.ataque2g, sheet.ataque2h};
            					decisivo = tonumber(string.sub(sheet.decisivo2, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano2);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico2);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome2;
            					municao = tonumber(sheet.municao2);
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao2 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano2);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome2;
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico2);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome2;
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque3a, sheet.ataque3b, sheet.ataque3c, sheet.ataque3d, sheet.ataque3e, sheet.ataque3f, sheet.ataque3g, sheet.ataque3h};
            					decisivo = tonumber(string.sub(sheet.decisivo3, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano3);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico3);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome3;
            					municao = tonumber(sheet.municao3);
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao3 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano3);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome3;
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico3);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome3;
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque4a, sheet.ataque4b, sheet.ataque4c, sheet.ataque4d, sheet.ataque4e, sheet.ataque4f, sheet.ataque4g, sheet.ataque4h};
            					decisivo = tonumber(string.sub(sheet.decisivo4, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano4);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico4);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome4;
            					municao = tonumber(sheet.municao4);
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao4 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano4);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome4;
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico4);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome4;
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque5a, sheet.ataque5b, sheet.ataque5c, sheet.ataque5d, sheet.ataque5e, sheet.ataque5f, sheet.ataque5g, sheet.ataque5h};
            					decisivo = tonumber(string.sub(sheet.decisivo5, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano5);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico5);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome5;
            					municao = tonumber(sheet.municao5);
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao5 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano5);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome5;
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico5);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome5;
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque6a, sheet.ataque6b, sheet.ataque6c, sheet.ataque6d, sheet.ataque6e, sheet.ataque6f, sheet.ataque6g, sheet.ataque6h};
            					decisivo = tonumber(string.sub(sheet.decisivo6, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano6);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico6);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome6;
            					municao = tonumber(sheet.municao6);
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao6 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano6);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome6;
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico6);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome6;
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque7a, sheet.ataque7b, sheet.ataque7c, sheet.ataque7d, sheet.ataque7e, sheet.ataque7f, sheet.ataque7g, sheet.ataque7h};
            					decisivo = tonumber(string.sub(sheet.decisivo7, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano7);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico7);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome7;
            					municao = tonumber(sheet.municao7);
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao7 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano7);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome7;
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico7);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome7;
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque8a, sheet.ataque8b, sheet.ataque8c, sheet.ataque8d, sheet.ataque8e, sheet.ataque8f, sheet.ataque8g, sheet.ataque8h};
            					decisivo = tonumber(string.sub(sheet.decisivo8, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano8);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico8);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome8;
            					municao = tonumber(sheet.municao8);
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao8 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano8);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome8;
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico8);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome8;
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque9a, sheet.ataque9b, sheet.ataque9c, sheet.ataque9d, sheet.ataque9e, sheet.ataque9f, sheet.ataque9g, sheet.ataque9h};
            					decisivo = tonumber(string.sub(sheet.decisivo9, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano9);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico9);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome9;
            					municao = tonumber(sheet.municao9);
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao9 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano9);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome9;
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico9);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome9;
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque10a, sheet.ataque10b, sheet.ataque10c, sheet.ataque10d, sheet.ataque10e, sheet.ataque10f, sheet.ataque10g, sheet.ataque10h};
            					decisivo = tonumber(string.sub(sheet.decisivo10, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano10);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico10);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome10;
            					municao = tonumber(sheet.municao10);
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao10 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano10);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome10;
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico10);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome10;
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque11a, sheet.ataque11b, sheet.ataque11c, sheet.ataque11d, sheet.ataque11e, sheet.ataque11f, sheet.ataque11g, sheet.ataque11h};
            					decisivo = tonumber(string.sub(sheet.decisivo11, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano11);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico11);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome11;
            					municao = tonumber(sheet.municao11);
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao11 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano11);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome11;
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico11);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome11;
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque12a, sheet.ataque12b, sheet.ataque12c, sheet.ataque12d, sheet.ataque12e, sheet.ataque12f, sheet.ataque12g, sheet.ataque12h};
            					decisivo = tonumber(string.sub(sheet.decisivo12, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano12);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico12);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome12;
            					municao = tonumber(sheet.municao12);
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao12 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano12);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome12;
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico12);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome12;
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event36 = obj.button37:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque13a, sheet.ataque13b, sheet.ataque13c, sheet.ataque13d, sheet.ataque13e, sheet.ataque13f, sheet.ataque13g, sheet.ataque13h};
            					decisivo = tonumber(string.sub(sheet.decisivo13, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano13);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico13);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome13;
            					municao = tonumber(sheet.municao13);
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao13 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event37 = obj.button38:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano13);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome13;
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event38 = obj.button39:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico13);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome13;
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event39 = obj.button40:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque14a, sheet.ataque14b, sheet.ataque14c, sheet.ataque14d, sheet.ataque14e, sheet.ataque14f, sheet.ataque14g, sheet.ataque14h};
            					decisivo = tonumber(string.sub(sheet.decisivo14, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano14);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico14);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome14;
            					municao = tonumber(sheet.municao14);
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao14 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event40 = obj.button41:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano14);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome14;
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event41 = obj.button42:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico14);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome14;
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event42 = obj.button43:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque15a, sheet.ataque15b, sheet.ataque15c, sheet.ataque15d, sheet.ataque15e, sheet.ataque15f, sheet.ataque15g, sheet.ataque15h};
            					decisivo = tonumber(string.sub(sheet.decisivo15, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano15);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico15);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome15;
            					municao = tonumber(sheet.municao15);
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao15 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event43 = obj.button44:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano15);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome15;
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event44 = obj.button45:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico15);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome15;
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event45 = obj.button46:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque16a, sheet.ataque16b, sheet.ataque16c, sheet.ataque16d, sheet.ataque16e, sheet.ataque16f, sheet.ataque16g, sheet.ataque16h};
            					decisivo = tonumber(string.sub(sheet.decisivo16, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano16);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico16);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome16;
            					municao = tonumber(sheet.municao16);
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao16 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event46 = obj.button47:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano16);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome16;
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event47 = obj.button48:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico16);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome16;
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event48 = obj.button49:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque17a, sheet.ataque17b, sheet.ataque17c, sheet.ataque17d, sheet.ataque17e, sheet.ataque17f, sheet.ataque17g, sheet.ataque17h};
            					decisivo = tonumber(string.sub(sheet.decisivo17, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano17);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico17);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome17;
            					municao = tonumber(sheet.municao17);
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao17 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event49 = obj.button50:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano17);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome17;
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event50 = obj.button51:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico17);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome17;
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event51 = obj.button52:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque18a, sheet.ataque18b, sheet.ataque18c, sheet.ataque18d, sheet.ataque18e, sheet.ataque18f, sheet.ataque18g, sheet.ataque18h};
            					decisivo = tonumber(string.sub(sheet.decisivo18, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano18);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico18);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome18;
            					municao = tonumber(sheet.municao18);
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao18 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event52 = obj.button53:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano18);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome18;
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event53 = obj.button54:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico18);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome18;
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event54 = obj.button55:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque19a, sheet.ataque19b, sheet.ataque19c, sheet.ataque19d, sheet.ataque19e, sheet.ataque19f, sheet.ataque19g, sheet.ataque19h};
            					decisivo = tonumber(string.sub(sheet.decisivo19, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano19);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico19);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome19;
            					municao = tonumber(sheet.municao19);
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao19 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event55 = obj.button56:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano19);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome19;
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event56 = obj.button57:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico19);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome19;
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event57 = obj.button58:addEventListener("onClick",
        function (self)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque20a, sheet.ataque20b, sheet.ataque20c, sheet.ataque20d, sheet.ataque20e, sheet.ataque20f, sheet.ataque20g, sheet.ataque20h};
            					decisivo = tonumber(string.sub(sheet.decisivo20, 1, 2));
            					
            					dano = rrpg.interpretarRolagem(sheet.dano20);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = rrpg.interpretarRolagem(sheet.danoCritico20);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome20;
            					municao = tonumber(sheet.municao20);
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao20 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event58 = obj.button59:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local dano = rrpg.interpretarRolagem(sheet.dano20);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome20;
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event59 = obj.button60:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico20);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome20;
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    function obj:_releaseEvents()
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
        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
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
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
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
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
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
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
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
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmFichaRPGmeister2_svg);

return _frmFichaRPGmeister2_svg;
