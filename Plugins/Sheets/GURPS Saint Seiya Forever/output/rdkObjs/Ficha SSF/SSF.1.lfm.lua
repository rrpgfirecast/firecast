require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSSF1()
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
    obj:setName("frmSSF1");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function pos(rolado)
				if sheet~=nil then
					local alvo = target;
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);

					local decisivo = 4;
					if alvo >= 16 then
						decisivo = 6;
					elseif alvo >= 15 then
						decisivo = 5;
					end;

					local critico = 18;
					if alvo <=15 then
						critico = 17;
					end;
					critico = math.min(critico, alvo+10);

					local resultado = rolado.resultado;
					local diferenca = math.abs(resultado-target);

					if resultado <= decisivo then
						if fulminante ~= nil then
							mesaDoPersonagem.activeChat:enviarMensagem("[§K9]ATAQUE FULMINANTE! PASSOU POR " .. diferenca .. "! " .. meme(1));
							fulminante = nil;
						else
							mesaDoPersonagem.activeChat:enviarMensagem("[§K9]SUCESSO DECISIVO! PASSOU POR " .. diferenca .. "! " .. meme(1));
						end;
					elseif resultado <= alvo then
						mesaDoPersonagem.activeChat:enviarMensagem("[§K12]SUCESSO! PASSOU POR " .. diferenca .. "! " .. meme(2));
					elseif resultado < critico then
						mesaDoPersonagem.activeChat:enviarMensagem("[§K7]FALHA! FALHOU POR " .. diferenca .. "! " .. meme(3));
					else
						mesaDoPersonagem.activeChat:enviarMensagem("[§K4]FALHA CRITICA! FALHOU POR " .. diferenca .. "! " .. meme(4));
					end;

				end;
			end;
		



			function meme(type)
				local perfect = {":troll:", ":lol:", ":megusta:", ":yeahh:", ":awyeah:", ":hue:", ":D", "8)", "xD", "*.*", "S2", ":star:"};
				local good = {":notbad:", ":truestory:", ":doge:", ":)", ":P", ";)", ":3", "^^", ":like:"};
				local bad = {":okay:", ":pokerface:", ":rage:", ":desprezo:", ":(", ":o", "Oo", "-_-", ":/", ":'(", ":dislike:"};
				local terrible = {":genius:", ":kidme:", ":alone:", ":vish:", ":yao:", ":wtf:", ":ohgod:", ":dino:", "T.T", ":poop:"};

				local memes = {};
				if type==1 then
					memes = perfect;
				elseif type==2 then
					memes = good;
				elseif type==3 then
					memes = bad;
				else
					memes = terrible;
				end

				local num = math.random(#memes);

				return memes[num];
			end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(85);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(30);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Divindade");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("divindade");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(55);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Cosmo");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setLeft(110);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(40);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(110);
    obj.label4:setTop(3);
    obj.label4:setWidth(40);
    obj.label4:setHeight(20);
    obj.label4:setField("cosmo");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(160);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("xpc_total");
    obj.edit3:setName("edit3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(210);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("Elevar");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setLeft(270);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("xpc_elevado");
    obj.edit4:setName("edit4");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setFields({'xpc_total', 'armadura_equipada', 'tipo_armadura', 'xpc_elevado'});
    obj.dataLink1:setName("dataLink1");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(300);
    obj.layout5:setTop(5);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Armadura");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("armadura");
    obj.edit5:setName("edit5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(300);
    obj.layout6:setTop(30);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("Constelação");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("constelacao");
    obj.edit6:setName("edit6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(300);
    obj.layout7:setTop(55);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("Signo");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("signo");
    obj.edit7:setName("edit7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(600);
    obj.layout8:setTop(5);
    obj.layout8:setWidth(310);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("Classificação");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("classificacao");
    obj.edit8:setName("edit8");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(600);
    obj.layout9:setTop(30);
    obj.layout9:setWidth(310);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("Título");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setLeft(110);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("titulo");
    obj.edit9:setName("edit9");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(600);
    obj.layout10:setTop(55);
    obj.layout10:setWidth(310);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("Idade");
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setLeft(110);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("idade");
    obj.edit10:setName("edit10");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(95);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(160);
    obj.layout11:setName("layout11");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout11);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout11);
    obj.label12:setLeft(0);
    obj.label12:setTop(5);
    obj.label12:setWidth(200);
    obj.label12:setHeight(20);
    obj.label12:setText("ATRIBUTOS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setLeft(50);
    obj.label13:setTop(30);
    obj.label13:setWidth(40);
    obj.label13:setHeight(20);
    obj.label13:setText("Total");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setLeft(100);
    obj.label14:setTop(30);
    obj.label14:setWidth(30);
    obj.label14:setHeight(20);
    obj.label14:setText("Inicial");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout11);
    obj.label15:setLeft(131);
    obj.label15:setTop(30);
    obj.label15:setWidth(33);
    obj.label15:setHeight(20);
    obj.label15:setText("Cosmo");
    obj.label15:setFontSize(10);
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout11);
    obj.label16:setLeft(164);
    obj.label16:setTop(30);
    obj.label16:setWidth(30);
    obj.label16:setHeight(20);
    obj.label16:setText("Custo");
    obj.label16:setFontSize(10);
    obj.label16:setName("label16");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(10);
    obj.layout12:setTop(50);
    obj.layout12:setWidth(190);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout12);
    obj.button1:setLeft(5);
    obj.button1:setTop(2);
    obj.button1:setWidth(30);
    obj.button1:setHeight(20);
    obj.button1:setText("ST");
    obj.button1:setName("button1");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout12);
    obj.rectangle4:setLeft(40);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(40);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setLeft(40);
    obj.label17:setTop(3);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setField("total_st");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setLeft(90);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setType("number");
    obj.edit11:setField("inicial_st");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setLeft(120);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setField("cosmo_st");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setLeft(150);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setField("xp_st");
    obj.edit13:setName("edit13");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout12);
    obj.dataLink2:setFields({'inicial_st', 'cosmo_st', 'xp_st'});
    obj.dataLink2:setName("dataLink2");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setLeft(10);
    obj.layout13:setTop(75);
    obj.layout13:setWidth(190);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout13);
    obj.button2:setLeft(5);
    obj.button2:setTop(2);
    obj.button2:setWidth(30);
    obj.button2:setHeight(20);
    obj.button2:setText("DX");
    obj.button2:setName("button2");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout13);
    obj.rectangle5:setLeft(40);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setLeft(40);
    obj.label18:setTop(3);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setField("total_dx");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setLeft(90);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setField("inicial_dx");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout13);
    obj.edit15:setLeft(120);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setField("cosmo_dx");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout13);
    obj.edit16:setLeft(150);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setField("xp_dx");
    obj.edit16:setName("edit16");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout13);
    obj.dataLink3:setFields({'inicial_dx', 'cosmo_dx', 'xp_dx'});
    obj.dataLink3:setName("dataLink3");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setLeft(10);
    obj.layout14:setTop(100);
    obj.layout14:setWidth(190);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout14);
    obj.button3:setLeft(5);
    obj.button3:setTop(2);
    obj.button3:setWidth(30);
    obj.button3:setHeight(20);
    obj.button3:setText("IQ");
    obj.button3:setName("button3");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout14);
    obj.rectangle6:setLeft(40);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setLeft(40);
    obj.label19:setTop(3);
    obj.label19:setWidth(40);
    obj.label19:setHeight(20);
    obj.label19:setField("total_iq");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout14);
    obj.edit17:setLeft(90);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setField("inicial_iq");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout14);
    obj.edit18:setLeft(120);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setField("cosmo_iq");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout14);
    obj.edit19:setLeft(150);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setField("xp_iq");
    obj.edit19:setName("edit19");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout14);
    obj.dataLink4:setFields({'inicial_iq', 'cosmo_iq', 'xp_iq'});
    obj.dataLink4:setName("dataLink4");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setLeft(10);
    obj.layout15:setTop(125);
    obj.layout15:setWidth(190);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout15);
    obj.button4:setLeft(5);
    obj.button4:setTop(2);
    obj.button4:setWidth(30);
    obj.button4:setHeight(20);
    obj.button4:setText("HT");
    obj.button4:setName("button4");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout15);
    obj.rectangle7:setLeft(40);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout15);
    obj.label20:setLeft(40);
    obj.label20:setTop(3);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setField("total_ht");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout15);
    obj.edit20:setLeft(90);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setField("inicial_ht");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout15);
    obj.edit21:setLeft(120);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setField("cosmo_ht");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout15);
    obj.edit22:setLeft(150);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setField("xp_ht");
    obj.edit22:setName("edit22");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout15);
    obj.dataLink5:setFields({'inicial_ht', 'cosmo_ht', 'xp_ht'});
    obj.dataLink5:setName("dataLink5");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setLeft(210);
    obj.layout16:setTop(95);
    obj.layout16:setWidth(200);
    obj.layout16:setHeight(160);
    obj.layout16:setName("layout16");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout16);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(15);
    obj.rectangle8:setYradius(15);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout16);
    obj.label21:setLeft(50);
    obj.label21:setTop(30);
    obj.label21:setWidth(40);
    obj.label21:setHeight(20);
    obj.label21:setText("Total");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout16);
    obj.label22:setLeft(96);
    obj.label22:setTop(30);
    obj.label22:setWidth(30);
    obj.label22:setHeight(20);
    obj.label22:setText("Base");
    obj.label22:setFontSize(12);
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout16);
    obj.label23:setLeft(126);
    obj.label23:setTop(30);
    obj.label23:setWidth(33);
    obj.label23:setHeight(20);
    obj.label23:setText("Cosmo");
    obj.label23:setFontSize(10);
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24:setLeft(163);
    obj.label24:setTop(30);
    obj.label24:setWidth(30);
    obj.label24:setHeight(20);
    obj.label24:setText("Custo");
    obj.label24:setFontSize(10);
    obj.label24:setName("label24");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(50);
    obj.layout17:setWidth(190);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout17);
    obj.label25:setLeft(5);
    obj.label25:setTop(5);
    obj.label25:setWidth(30);
    obj.label25:setHeight(20);
    obj.label25:setText("PV");
    obj.label25:setVisible(true);
    obj.label25:setName("label25");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout17);
    obj.button5:setLeft(0);
    obj.button5:setTop(2);
    obj.button5:setWidth(40);
    obj.button5:setHeight(20);
    obj.button5:setText("PV");
    obj.button5:setVisible(false);
    obj.button5:setName("button5");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout17);
    obj.rectangle9:setLeft(45);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout17);
    obj.label26:setLeft(45);
    obj.label26:setTop(3);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setField("total_pv");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout17);
    obj.rectangle10:setLeft(90);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setLeft(90);
    obj.label27:setTop(3);
    obj.label27:setWidth(30);
    obj.label27:setHeight(20);
    obj.label27:setField("total_st");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setLeft(120);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setField("cosmo_pv");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout17);
    obj.edit24:setLeft(150);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setField("xp_pv");
    obj.edit24:setName("edit24");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout17);
    obj.dataLink6:setFields({'total_st', 'cosmo_pv', 'xp_pv'});
    obj.dataLink6:setName("dataLink6");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout16);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(75);
    obj.layout18:setWidth(190);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout18);
    obj.label28:setLeft(5);
    obj.label28:setTop(5);
    obj.label28:setWidth(30);
    obj.label28:setHeight(20);
    obj.label28:setText("VON");
    obj.label28:setVisible(false);
    obj.label28:setName("label28");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout18);
    obj.button6:setLeft(0);
    obj.button6:setTop(2);
    obj.button6:setWidth(40);
    obj.button6:setHeight(20);
    obj.button6:setText("VON");
    obj.button6:setVisible(true);
    obj.button6:setName("button6");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout18);
    obj.rectangle11:setLeft(45);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout18);
    obj.label29:setLeft(45);
    obj.label29:setTop(3);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setField("total_von");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout18);
    obj.rectangle12:setLeft(90);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout18);
    obj.label30:setLeft(90);
    obj.label30:setTop(3);
    obj.label30:setWidth(30);
    obj.label30:setHeight(20);
    obj.label30:setField("total_iq");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout18);
    obj.edit25:setLeft(120);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setField("cosmo_von");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout18);
    obj.edit26:setLeft(150);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setField("xp_von");
    obj.edit26:setName("edit26");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout18);
    obj.dataLink7:setFields({'total_iq', 'cosmo_von', 'xp_von'});
    obj.dataLink7:setName("dataLink7");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout16);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(100);
    obj.layout19:setWidth(190);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout19);
    obj.label31:setLeft(5);
    obj.label31:setTop(5);
    obj.label31:setWidth(30);
    obj.label31:setHeight(20);
    obj.label31:setText("PER");
    obj.label31:setVisible(false);
    obj.label31:setName("label31");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout19);
    obj.button7:setLeft(0);
    obj.button7:setTop(2);
    obj.button7:setWidth(40);
    obj.button7:setHeight(20);
    obj.button7:setText("PER");
    obj.button7:setVisible(true);
    obj.button7:setName("button7");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout19);
    obj.rectangle13:setLeft(45);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout19);
    obj.label32:setLeft(45);
    obj.label32:setTop(3);
    obj.label32:setWidth(40);
    obj.label32:setHeight(20);
    obj.label32:setField("total_per");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout19);
    obj.rectangle14:setLeft(90);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout19);
    obj.label33:setLeft(90);
    obj.label33:setTop(3);
    obj.label33:setWidth(30);
    obj.label33:setHeight(20);
    obj.label33:setField("total_iq");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27:setLeft(120);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setField("cosmo_per");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout19);
    obj.edit28:setLeft(150);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setField("xp_per");
    obj.edit28:setName("edit28");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout19);
    obj.dataLink8:setFields({'total_iq', 'cosmo_per', 'xp_per'});
    obj.dataLink8:setName("dataLink8");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout16);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(125);
    obj.layout20:setWidth(190);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout20);
    obj.label34:setLeft(5);
    obj.label34:setTop(5);
    obj.label34:setWidth(30);
    obj.label34:setHeight(20);
    obj.label34:setText("PF");
    obj.label34:setVisible(true);
    obj.label34:setName("label34");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout20);
    obj.button8:setLeft(0);
    obj.button8:setTop(2);
    obj.button8:setWidth(40);
    obj.button8:setHeight(20);
    obj.button8:setText("PF");
    obj.button8:setVisible(false);
    obj.button8:setName("button8");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout20);
    obj.rectangle15:setLeft(45);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(45);
    obj.label35:setTop(3);
    obj.label35:setWidth(40);
    obj.label35:setHeight(20);
    obj.label35:setField("total_pf");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout20);
    obj.rectangle16:setLeft(90);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setLeft(90);
    obj.label36:setTop(3);
    obj.label36:setWidth(30);
    obj.label36:setHeight(20);
    obj.label36:setField("total_ht");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout20);
    obj.edit29:setLeft(120);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setField("cosmo_pf");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout20);
    obj.edit30:setLeft(150);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setField("xp_pf");
    obj.edit30:setName("edit30");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout20);
    obj.dataLink9:setFields({'total_ht', 'cosmo_pf', 'xp_pf'});
    obj.dataLink9:setName("dataLink9");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(420);
    obj.layout21:setTop(95);
    obj.layout21:setWidth(250);
    obj.layout21:setHeight(185);
    obj.layout21:setName("layout21");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout21);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(15);
    obj.rectangle17:setYradius(15);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout21);
    obj.label37:setLeft(60);
    obj.label37:setTop(5);
    obj.label37:setWidth(40);
    obj.label37:setHeight(20);
    obj.label37:setText("Total");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout21);
    obj.label38:setLeft(120);
    obj.label38:setTop(5);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setText("Outros");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout21);
    obj.label39:setLeft(170);
    obj.label39:setTop(5);
    obj.label39:setWidth(40);
    obj.label39:setHeight(20);
    obj.label39:setText("NH");
    obj.label39:setName("label39");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(25);
    obj.layout22:setWidth(240);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout22);
    obj.button9:setLeft(5);
    obj.button9:setTop(2);
    obj.button9:setWidth(50);
    obj.button9:setHeight(20);
    obj.button9:setFontSize(10);
    obj.button9:setText("Desl.");
    obj.button9:setName("button9");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout22);
    obj.rectangle18:setLeft(60);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setLeft(60);
    obj.label40:setTop(3);
    obj.label40:setWidth(40);
    obj.label40:setHeight(20);
    obj.label40:setField("total_desl");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout22);
    obj.edit31:setLeft(120);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setField("out_desl");
    obj.edit31:setName("edit31");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout22);
    obj.dataLink10:setFields({'total_dx', 'total_ht', 'out_desl'});
    obj.dataLink10:setName("dataLink10");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(50);
    obj.layout23:setWidth(240);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout23);
    obj.button10:setLeft(5);
    obj.button10:setTop(2);
    obj.button10:setWidth(50);
    obj.button10:setHeight(20);
    obj.button10:setFontSize(10);
    obj.button10:setText("Bloqueio");
    obj.button10:setName("button10");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout23);
    obj.rectangle19:setLeft(60);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout23);
    obj.label41:setLeft(60);
    obj.label41:setTop(3);
    obj.label41:setWidth(40);
    obj.label41:setHeight(20);
    obj.label41:setField("total_bloqueio");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setLeft(120);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(40);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setField("out_bloqueio");
    obj.edit32:setName("edit32");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout23);
    obj.dataLink11:setFields({'out_bloqueio', 'nh_2_2'});
    obj.dataLink11:setName("dataLink11");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(75);
    obj.layout24:setWidth(240);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout24);
    obj.button11:setLeft(5);
    obj.button11:setTop(2);
    obj.button11:setWidth(50);
    obj.button11:setHeight(20);
    obj.button11:setFontSize(10);
    obj.button11:setText("Esquiva");
    obj.button11:setName("button11");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout24);
    obj.rectangle20:setLeft(60);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout24);
    obj.label42:setLeft(60);
    obj.label42:setTop(3);
    obj.label42:setWidth(40);
    obj.label42:setHeight(20);
    obj.label42:setField("total_esq");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout24);
    obj.edit33:setLeft(120);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setField("out_esq");
    obj.edit33:setName("edit33");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout24);
    obj.dataLink12:setFields({'total_desl', 'out_esq'});
    obj.dataLink12:setName("dataLink12");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(100);
    obj.layout25:setWidth(240);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout25);
    obj.button12:setLeft(5);
    obj.button12:setTop(2);
    obj.button12:setWidth(50);
    obj.button12:setHeight(20);
    obj.button12:setFontSize(10);
    obj.button12:setText("Aparar");
    obj.button12:setName("button12");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout25);
    obj.rectangle21:setLeft(60);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout25);
    obj.label43:setLeft(60);
    obj.label43:setTop(3);
    obj.label43:setWidth(40);
    obj.label43:setHeight(20);
    obj.label43:setField("total_aparar");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout25);
    obj.edit34:setLeft(120);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(40);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setField("out_aparar");
    obj.edit34:setName("edit34");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout25);
    obj.dataLink13:setFields({'out_aparar', 'nh_1_9'});
    obj.dataLink13:setName("dataLink13");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(125);
    obj.layout26:setWidth(245);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout26);
    obj.button13:setLeft(5);
    obj.button13:setTop(2);
    obj.button13:setWidth(50);
    obj.button13:setHeight(20);
    obj.button13:setFontSize(10);
    obj.button13:setText("S. Aparar");
    obj.button13:setName("button13");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout26);
    obj.rectangle22:setLeft(60);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout26);
    obj.label44:setLeft(60);
    obj.label44:setTop(3);
    obj.label44:setWidth(40);
    obj.label44:setHeight(20);
    obj.label44:setField("total_super_aparar");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout26);
    obj.edit35:setLeft(120);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setField("out_super_aparar");
    obj.edit35:setName("edit35");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout26);
    obj.comboBox1:setLeft(160);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(85);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("nh_super_aparar");
    obj.comboBox1:setItems({'Ataque 1', 'Ataque 2', 'Ataque 3'});
    obj.comboBox1:setValues({'1', '2', '3'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout26);
    obj.dataLink14:setFields({'out_super_aparar', 'nh_3_16', 'nh_3_17', 'nh_3_18', 'nh_super_aparar'});
    obj.dataLink14:setName("dataLink14");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout21);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(150);
    obj.layout27:setWidth(245);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout27);
    obj.button14:setLeft(5);
    obj.button14:setTop(2);
    obj.button14:setWidth(50);
    obj.button14:setHeight(20);
    obj.button14:setFontSize(10);
    obj.button14:setText("T.Defesa");
    obj.button14:setName("button14");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout27);
    obj.rectangle23:setLeft(60);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout27);
    obj.label45:setLeft(60);
    obj.label45:setTop(3);
    obj.label45:setWidth(40);
    obj.label45:setHeight(20);
    obj.label45:setField("total_tecnica_defesa");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout27);
    obj.edit36:setLeft(120);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(40);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setField("out_tecnica_defesa");
    obj.edit36:setName("edit36");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout27);
    obj.comboBox2:setLeft(160);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(85);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("nh_tecnica_defesa");
    obj.comboBox2:setItems({'Defesa 1', 'Defesa 2'});
    obj.comboBox2:setValues({'1', '2'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout27);
    obj.dataLink15:setFields({'out_tecnica_defesa', 'nh_3_19', 'nh_3_20', 'nh_tecnica_defesa'});
    obj.dataLink15:setName("dataLink15");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.scrollBox1);
    obj.rectangle24:setLeft(680);
    obj.rectangle24:setTop(95);
    obj.rectangle24:setWidth(250);
    obj.rectangle24:setHeight(250);
    obj.rectangle24:setColor("DimGray");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);
    obj.rectangle24:setCornerType("innerLine");
    obj.rectangle24:setName("rectangle24");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(680);
    obj.image1:setTop(95);
    obj.image1:setWidth(250);
    obj.image1:setHeight(250);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox1);
    obj.layout28:setLeft(680);
    obj.layout28:setTop(355);
    obj.layout28:setWidth(250);
    obj.layout28:setHeight(250);
    obj.layout28:setName("layout28");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout28);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(15);
    obj.rectangle25:setYradius(15);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout28);
    obj.label46:setLeft(0);
    obj.label46:setTop(5);
    obj.label46:setWidth(250);
    obj.label46:setHeight(20);
    obj.label46:setText("REAÇÃO");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(30);
    obj.layout29:setWidth(250);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout29);
    obj.label47:setLeft(10);
    obj.label47:setTop(5);
    obj.label47:setWidth(50);
    obj.label47:setHeight(20);
    obj.label47:setText("Aparência");
    obj.label47:setFontSize(10);
    obj.label47:setName("label47");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout29);
    obj.edit37:setLeft(60);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(150);
    obj.edit37:setHeight(25);
    obj.edit37:setField("aparencia");
    obj.edit37:setName("edit37");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout28);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(55);
    obj.layout30:setWidth(250);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout30);
    obj.label48:setLeft(10);
    obj.label48:setTop(5);
    obj.label48:setWidth(50);
    obj.label48:setHeight(20);
    obj.label48:setText("Status");
    obj.label48:setFontSize(10);
    obj.label48:setName("label48");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout30);
    obj.edit38:setLeft(60);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(150);
    obj.edit38:setHeight(25);
    obj.edit38:setField("status");
    obj.edit38:setName("edit38");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout28);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(80);
    obj.layout31:setWidth(250);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout31);
    obj.label49:setLeft(10);
    obj.label49:setTop(5);
    obj.label49:setWidth(50);
    obj.label49:setHeight(20);
    obj.label49:setText("Reputação");
    obj.label49:setFontSize(10);
    obj.label49:setName("label49");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout31);
    obj.edit39:setLeft(60);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(150);
    obj.edit39:setHeight(25);
    obj.edit39:setField("reputacao");
    obj.edit39:setName("edit39");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout28);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(105);
    obj.textEditor1:setWidth(230);
    obj.textEditor1:setHeight(105);
    obj.textEditor1:setField("reputacao_descricao");
    obj.textEditor1:setName("textEditor1");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout28);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(210);
    obj.layout32:setWidth(250);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout32);
    obj.label50:setLeft(5);
    obj.label50:setTop(5);
    obj.label50:setWidth(80);
    obj.label50:setHeight(20);
    obj.label50:setText("Modificador");
    obj.label50:setFontSize(10);
    obj.label50:setName("label50");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout32);
    obj.edit40:setLeft(60);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(25);
    obj.edit40:setField("mod");
    obj.edit40:setName("edit40");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout32);
    obj.dataLink16:setField("mod");
    obj.dataLink16:setName("dataLink16");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox1);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(265);
    obj.layout33:setWidth(200);
    obj.layout33:setHeight(345);
    obj.layout33:setName("layout33");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout33);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(15);
    obj.rectangle26:setYradius(15);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout33);
    obj.label51:setLeft(0);
    obj.label51:setTop(5);
    obj.label51:setWidth(180);
    obj.label51:setHeight(20);
    obj.label51:setText("VANTAGENS & HABILIDADES");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout33);
    obj.button15:setText("+");
    obj.button15:setLeft(175);
    obj.button15:setTop(5);
    obj.button15:setWidth(20);
    obj.button15:setHeight(20);
    obj.button15:setName("button15");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout33);
    obj.rectangle27:setLeft(5);
    obj.rectangle27:setTop(30);
    obj.rectangle27:setWidth(190);
    obj.rectangle27:setHeight(310);
    obj.rectangle27:setColor("#101010");
    obj.rectangle27:setName("rectangle27");

    obj.rclListaDasVantagens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasVantagens:setParent(obj.layout33);
    obj.rclListaDasVantagens:setName("rclListaDasVantagens");
    obj.rclListaDasVantagens:setField("listaVantagens");
    obj.rclListaDasVantagens:setTemplateForm("frmSSF1_1");
    obj.rclListaDasVantagens:setLeft(5);
    obj.rclListaDasVantagens:setTop(30);
    obj.rclListaDasVantagens:setWidth(190);
    obj.rclListaDasVantagens:setHeight(310);
    obj.rclListaDasVantagens:setSelectable(true);
    obj.rclListaDasVantagens:setLayout("vertical");
    obj.rclListaDasVantagens:setMinQt(1);

    obj.boxDetalhesDasVantagens = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDasVantagens:setParent(obj.scrollBox1);
    obj.boxDetalhesDasVantagens:setName("boxDetalhesDasVantagens");
    obj.boxDetalhesDasVantagens:setVisible(false);
    obj.boxDetalhesDasVantagens:setLeft(210);
    obj.boxDetalhesDasVantagens:setTop(265);
    obj.boxDetalhesDasVantagens:setWidth(200);
    obj.boxDetalhesDasVantagens:setHeight(345);

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.boxDetalhesDasVantagens);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(15);
    obj.rectangle28:setYradius(15);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.boxDetalhesDasVantagens);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(5);
    obj.layout34:setWidth(200);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout34);
    obj.label52:setLeft(5);
    obj.label52:setTop(5);
    obj.label52:setWidth(50);
    obj.label52:setHeight(20);
    obj.label52:setText("Nome");
    obj.label52:setName("label52");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout34);
    obj.edit41:setLeft(55);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(140);
    obj.edit41:setHeight(25);
    obj.edit41:setField("nome_vantagem");
    obj.edit41:setName("edit41");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.boxDetalhesDasVantagens);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(30);
    obj.layout35:setWidth(100);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout35);
    obj.label53:setLeft(5);
    obj.label53:setTop(5);
    obj.label53:setWidth(50);
    obj.label53:setHeight(20);
    obj.label53:setText("Nível");
    obj.label53:setName("label53");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout35);
    obj.edit42:setLeft(55);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(40);
    obj.edit42:setHeight(25);
    obj.edit42:setField("nivel_vantagem");
    obj.edit42:setName("edit42");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.boxDetalhesDasVantagens);
    obj.layout36:setLeft(100);
    obj.layout36:setTop(30);
    obj.layout36:setWidth(100);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout36);
    obj.label54:setLeft(5);
    obj.label54:setTop(5);
    obj.label54:setWidth(50);
    obj.label54:setHeight(20);
    obj.label54:setText("Custo");
    obj.label54:setName("label54");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout36);
    obj.edit43:setLeft(55);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(40);
    obj.edit43:setHeight(25);
    obj.edit43:setField("custo_vantagem");
    obj.edit43:setName("edit43");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.boxDetalhesDasVantagens);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(60);
    obj.textEditor2:setWidth(190);
    obj.textEditor2:setHeight(280);
    obj.textEditor2:setField("descricao_vantagem");
    obj.textEditor2:setName("textEditor2");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.boxDetalhesDasVantagens);
    obj.dataLink17:setField("custo_vantagem");
    obj.dataLink17:setName("dataLink17");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox1);
    obj.layout37:setLeft(420);
    obj.layout37:setTop(290);
    obj.layout37:setWidth(250);
    obj.layout37:setHeight(210);
    obj.layout37:setName("layout37");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout37);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(15);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout37);
    obj.label55:setLeft(0);
    obj.label55:setTop(5);
    obj.label55:setWidth(250);
    obj.label55:setHeight(20);
    obj.label55:setText("PONTOS GASTOS");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(30);
    obj.layout38:setWidth(125);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout38);
    obj.label56:setLeft(5);
    obj.label56:setTop(5);
    obj.label56:setWidth(80);
    obj.label56:setHeight(20);
    obj.label56:setText("ATRIBUTOS");
    obj.label56:setName("label56");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout38);
    obj.rectangle30:setLeft(85);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(40);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout38);
    obj.label57:setLeft(85);
    obj.label57:setTop(3);
    obj.label57:setWidth(40);
    obj.label57:setHeight(20);
    obj.label57:setField("xp_atributos");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout38);
    obj.dataLink18:setFields({'xp_st', 'xp_dx', 'xp_iq', 'xp_ht', 'xp_pv', 'xp_von', 'xp_per', 'xp_pf'});
    obj.dataLink18:setName("dataLink18");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39:setLeft(125);
    obj.layout39:setTop(30);
    obj.layout39:setWidth(125);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout39);
    obj.label58:setLeft(5);
    obj.label58:setTop(5);
    obj.label58:setWidth(80);
    obj.label58:setHeight(20);
    obj.label58:setText("PERÍCIAS");
    obj.label58:setName("label58");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout39);
    obj.rectangle31:setLeft(75);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(40);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout39);
    obj.label59:setLeft(75);
    obj.label59:setTop(3);
    obj.label59:setWidth(40);
    obj.label59:setHeight(20);
    obj.label59:setField("xp_pericias");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout39);
    obj.dataLink19:setField("xp_pericias");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout37);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(55);
    obj.layout40:setWidth(125);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout40);
    obj.label60:setLeft(5);
    obj.label60:setTop(5);
    obj.label60:setWidth(80);
    obj.label60:setHeight(20);
    obj.label60:setText("VANTAGENS");
    obj.label60:setName("label60");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout40);
    obj.rectangle32:setLeft(85);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(40);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout40);
    obj.label61:setLeft(85);
    obj.label61:setTop(3);
    obj.label61:setWidth(40);
    obj.label61:setHeight(20);
    obj.label61:setField("xp_vantagens");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout37);
    obj.layout41:setLeft(125);
    obj.layout41:setTop(55);
    obj.layout41:setWidth(125);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout41);
    obj.label62:setLeft(5);
    obj.label62:setTop(5);
    obj.label62:setWidth(80);
    obj.label62:setHeight(20);
    obj.label62:setText("TECNICAS");
    obj.label62:setName("label62");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout41);
    obj.rectangle33:setLeft(75);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(40);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout41);
    obj.label63:setLeft(75);
    obj.label63:setTop(3);
    obj.label63:setWidth(40);
    obj.label63:setHeight(20);
    obj.label63:setField("xp_tecnicas");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout37);
    obj.label64:setLeft(0);
    obj.label64:setTop(85);
    obj.label64:setWidth(250);
    obj.label64:setHeight(20);
    obj.label64:setText("PONTOS TOTAIS");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout37);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(105);
    obj.layout42:setWidth(250);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout42);
    obj.label65:setLeft(60);
    obj.label65:setTop(5);
    obj.label65:setWidth(40);
    obj.label65:setHeight(20);
    obj.label65:setText("Inicial");
    obj.label65:setFontSize(11);
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout42);
    obj.label66:setLeft(105);
    obj.label66:setTop(5);
    obj.label66:setWidth(40);
    obj.label66:setHeight(20);
    obj.label66:setText("Ganho");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout42);
    obj.label67:setLeft(150);
    obj.label67:setTop(5);
    obj.label67:setWidth(40);
    obj.label67:setHeight(20);
    obj.label67:setText("Gasta");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout42);
    obj.label68:setLeft(195);
    obj.label68:setTop(5);
    obj.label68:setWidth(40);
    obj.label68:setHeight(20);
    obj.label68:setText("Sobra");
    obj.label68:setName("label68");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout37);
    obj.layout43:setLeft(5);
    obj.layout43:setTop(130);
    obj.layout43:setWidth(250);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout43);
    obj.label69:setLeft(5);
    obj.label69:setTop(5);
    obj.label69:setWidth(50);
    obj.label69:setHeight(20);
    obj.label69:setText("PERS");
    obj.label69:setName("label69");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout43);
    obj.edit44:setLeft(55);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(40);
    obj.edit44:setHeight(25);
    obj.edit44:setField("xpp_inicial");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout43);
    obj.edit45:setLeft(100);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(40);
    obj.edit45:setHeight(25);
    obj.edit45:setField("xpp_ganha");
    obj.edit45:setName("edit45");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout43);
    obj.rectangle34:setLeft(145);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(40);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout43);
    obj.label70:setLeft(145);
    obj.label70:setTop(3);
    obj.label70:setWidth(40);
    obj.label70:setHeight(20);
    obj.label70:setField("xpp_gasta");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout43);
    obj.rectangle35:setLeft(190);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(40);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout43);
    obj.label71:setLeft(190);
    obj.label71:setTop(3);
    obj.label71:setWidth(40);
    obj.label71:setHeight(20);
    obj.label71:setField("xpp_sobrando");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout43);
    obj.dataLink20:setFields({'xp_atributos', 'xp_pericias', 'xp_vantagens'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout43);
    obj.dataLink21:setFields({'xpp_inicial', 'xpp_gasta', 'xpp_ganha'});
    obj.dataLink21:setName("dataLink21");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout37);
    obj.layout44:setLeft(5);
    obj.layout44:setTop(155);
    obj.layout44:setWidth(250);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout44);
    obj.label72:setLeft(5);
    obj.label72:setTop(5);
    obj.label72:setWidth(50);
    obj.label72:setHeight(20);
    obj.label72:setText("TEC");
    obj.label72:setName("label72");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout44);
    obj.edit46:setLeft(55);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(40);
    obj.edit46:setHeight(25);
    obj.edit46:setField("xpt_inicial");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout44);
    obj.edit47:setLeft(100);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(40);
    obj.edit47:setHeight(25);
    obj.edit47:setField("xpt_ganha");
    obj.edit47:setName("edit47");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout44);
    obj.rectangle36:setLeft(145);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(40);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout44);
    obj.label73:setLeft(145);
    obj.label73:setTop(3);
    obj.label73:setWidth(40);
    obj.label73:setHeight(20);
    obj.label73:setField("xp_tecnicas");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout44);
    obj.rectangle37:setLeft(190);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(40);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout44);
    obj.label74:setLeft(190);
    obj.label74:setTop(3);
    obj.label74:setWidth(40);
    obj.label74:setHeight(20);
    obj.label74:setField("xpt_sobrando");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout44);
    obj.dataLink22:setFields({'xpt_inicial', 'xp_tecnicas', 'xpt_ganha'});
    obj.dataLink22:setName("dataLink22");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout37);
    obj.layout45:setLeft(5);
    obj.layout45:setTop(180);
    obj.layout45:setWidth(250);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout45);
    obj.label75:setLeft(5);
    obj.label75:setTop(5);
    obj.label75:setWidth(50);
    obj.label75:setHeight(20);
    obj.label75:setText("TOTAL");
    obj.label75:setName("label75");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout45);
    obj.rectangle38:setLeft(55);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(40);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout45);
    obj.label76:setLeft(55);
    obj.label76:setTop(3);
    obj.label76:setWidth(40);
    obj.label76:setHeight(20);
    obj.label76:setField("exp_inicial");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout45);
    obj.dataLink23:setFields({'xpt_inicial', 'xpp_inicial'});
    obj.dataLink23:setName("dataLink23");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout45);
    obj.rectangle39:setLeft(100);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(40);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout45);
    obj.label77:setLeft(100);
    obj.label77:setTop(3);
    obj.label77:setWidth(40);
    obj.label77:setHeight(20);
    obj.label77:setField("exp_ganha");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout45);
    obj.dataLink24:setFields({'xpt_ganha', 'xpp_ganha'});
    obj.dataLink24:setName("dataLink24");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout45);
    obj.rectangle40:setLeft(145);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(40);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout45);
    obj.label78:setLeft(145);
    obj.label78:setTop(3);
    obj.label78:setWidth(40);
    obj.label78:setHeight(20);
    obj.label78:setField("exp_gasta");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout45);
    obj.dataLink25:setFields({'xpp_gasta', 'xp_tecnicas'});
    obj.dataLink25:setName("dataLink25");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox1);
    obj.layout46:setLeft(420);
    obj.layout46:setTop(510);
    obj.layout46:setWidth(250);
    obj.layout46:setHeight(85);
    obj.layout46:setName("layout46");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout46);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(15);
    obj.rectangle41:setYradius(15);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout46);
    obj.label79:setLeft(0);
    obj.label79:setTop(5);
    obj.label79:setWidth(250);
    obj.label79:setHeight(20);
    obj.label79:setText("VELOCIDADE & SENTIDOS");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(30);
    obj.layout47:setWidth(250);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout47);
    obj.label80:setLeft(10);
    obj.label80:setTop(5);
    obj.label80:setWidth(35);
    obj.label80:setHeight(20);
    obj.label80:setText("Vel:");
    obj.label80:setName("label80");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout47);
    obj.edit48:setLeft(50);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(120);
    obj.edit48:setHeight(25);
    obj.edit48:setField("descricao_velocidade");
    obj.edit48:setName("edit48");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout47);
    obj.label81:setLeft(172);
    obj.label81:setTop(5);
    obj.label81:setWidth(35);
    obj.label81:setHeight(20);
    obj.label81:setText("Nível");
    obj.label81:setName("label81");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout47);
    obj.edit49:setLeft(205);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(40);
    obj.edit49:setHeight(25);
    obj.edit49:setField("nivel_velocidade");
    obj.edit49:setName("edit49");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(55);
    obj.layout48:setWidth(250);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout48);
    obj.label82:setLeft(10);
    obj.label82:setTop(5);
    obj.label82:setWidth(35);
    obj.label82:setHeight(20);
    obj.label82:setText("Sent:");
    obj.label82:setName("label82");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout48);
    obj.edit50:setLeft(50);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(195);
    obj.edit50:setHeight(25);
    obj.edit50:setField("descricao_sentido");
    obj.edit50:setName("edit50");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(1335);
    obj.image2:setHeight(615);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20SSF%20releases/imagens/ABA0.png");
    obj.image2:setName("image2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.xpc_total) or 0);
            						local cosmo = 0;
            						if mod > 3800 then
            							cosmo = 80 + math.floor((mod-3800)/100);
            						elseif mod > 2400 then
            							cosmo = 60 + math.floor((mod-2400)/70);
            						elseif mod > 1400 then
            							cosmo = 40 + math.floor((mod-1400)/50);
            						elseif mod > 600 then
            							cosmo = 20 + math.floor((mod-600)/40);
            						else 
            							cosmo = math.floor((mod)/30);
            						end
            
            						local cosmo2 = 0;
            						local cosmoMin = 0;
            						if sheet.armadura_equipada then
            							if sheet.tipo_armadura == "1" then
            								cosmoMin = 20;
            							elseif sheet.tipo_armadura == "2" then
            								cosmoMin = 40;
            							elseif sheet.tipo_armadura == "3" then
            								cosmoMin = 60;
            							end;
            
            							if cosmo < cosmoMin then
            								cosmo = cosmoMin;
            							else 
            								cosmo2 = math.floor(cosmo/10);
            								if cosmo2>5 then
            									cosmo2 = 5;
            								end;
            								cosmo = cosmo + cosmo2;
            							end
            						end;
            
            						sheet.cosmo = cosmo;
            					end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_st or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de ST [" .. (sheet.total_st or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_st) or 0);
            						xp = xp/(1*10);
            
            						local mod = (tonumber(sheet.inicial_st) or 0)+
            									(tonumber(sheet.cosmo_st) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_st = mod;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_dx or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de DX [" .. (sheet.total_dx or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_dx) or 0);
            						xp = xp/(2*10);
            
            						local mod = (tonumber(sheet.inicial_dx) or 0)+
            									(tonumber(sheet.cosmo_dx) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_dx = mod;
            					end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_iq or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de IQ [" .. (sheet.total_iq or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_iq) or 0);
            						xp = xp/(2*10);
            
            						local mod = (tonumber(sheet.inicial_iq) or 0)+
            									(tonumber(sheet.cosmo_iq) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_iq = mod;
            					end;
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_ht or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de HT [" .. (sheet.total_ht or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_ht) or 0);
            						xp = xp/(1*10);
            
            						local mod = (tonumber(sheet.inicial_ht) or 0)+
            									(tonumber(sheet.cosmo_ht) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_ht = mod;
            					end;
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_pv or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de PV [" .. (sheet.total_pv or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event10 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_pv) or 0);
            						xp = xp/(2);
            
            						local mod = (tonumber(sheet.total_st) or 0)+
            									(tonumber(sheet.cosmo_pv) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_pv = mod;
            					end;
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_von or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de VON [" .. (sheet.total_von or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event12 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_von) or 0);
            						xp = xp/(5);
            
            						local mod = (tonumber(sheet.total_iq) or 0)+
            									(tonumber(sheet.cosmo_von) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_von = mod;
            					end;
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_per or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de PER [" .. (sheet.total_per or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event14 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_per) or 0);
            						xp = xp/(5);
            
            						local mod = (tonumber(sheet.total_iq) or 0)+
            									(tonumber(sheet.cosmo_per) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_per = mod;
            					end;
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.total_pf or 0) + (tonumber(sheet.mod) or 0);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de PF [" .. (sheet.total_pf or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event16 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local xp = (tonumber(sheet.xp_pf) or 0);
            						xp = xp/(3);
            
            						local mod = (tonumber(sheet.total_ht) or 0)+
            									(tonumber(sheet.cosmo_pf) or 0)+
            									xp;
            						mod = math.floor(mod);
            						sheet.total_pf = mod;
            					end;
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("1d6+" .. (math.floor(sheet.total_desl) or 0));
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa " .. (sheet.total_desl or 0) .. " " .. (sheet.descricao_velocidade or 0) .. " (" .. (sheet.nivel_velocidade or 0) .. ")");
        end, obj);

    obj._e_event18 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.total_dx) or 0)+
            										(tonumber(sheet.total_ht) or 0);
            							mod = mod/4;
            							mod = mod +
            								(tonumber(sheet.out_desl) or 0);
            							sheet.total_desl = mod;
            						end;
        end, obj);

    obj._e_event19 = obj.button10:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("3d6");
            						target = (sheet.total_bloqueio or 0) + (tonumber(sheet.mod) or 0);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Bloqueio [" .. (sheet.total_bloqueio or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event20 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.out_bloqueio) or 0) +
            										(tonumber(sheet.nh_2_2) or 0)/2 +
            										3;
            							sheet.total_bloqueio = math.floor(mod);
            						end;
        end, obj);

    obj._e_event21 = obj.button11:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("3d6");
            						target = (sheet.total_esq or 0) + (tonumber(sheet.mod) or 0);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Esquiva [" .. (sheet.total_esq or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event22 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.total_desl) or 0) +
            										(tonumber(sheet.out_esq) or 0) + 
            										3;
            							sheet.total_esq = math.floor(mod);
            						end;
        end, obj);

    obj._e_event23 = obj.button12:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("3d6");
            						target = (sheet.total_aparar or 0) + (tonumber(sheet.mod) or 0);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Aparar [" .. (sheet.total_aparar or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event24 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.out_aparar) or 0) +
            										(tonumber(sheet.nh_1_9) or 0)/2 +
            										3;
            							sheet.total_aparar = math.floor(mod);
            						end;
        end, obj);

    obj._e_event25 = obj.button13:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("3d6");
            						target = (sheet.total_super_aparar or 0) + (tonumber(sheet.mod) or 0);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Super Aparar [" .. (sheet.total_super_aparar or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event26 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.out_super_aparar) or 0) + 2;
            
            							if sheet.nh_super_aparar == "1" then
            								mod = mod + (tonumber(sheet.nh_3_16) or 0)/2;
            							elseif sheet.nh_super_aparar == "2" then
            								mod = mod + (tonumber(sheet.nh_3_17) or 0)/2;
            							elseif sheet.nh_super_aparar == "3" then
            								mod = mod + (tonumber(sheet.nh_3_18) or 0)/2;
            							end;
            
            							sheet.total_super_aparar = math.floor(mod);
            						end;
        end, obj);

    obj._e_event27 = obj.button14:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem("3d6");
            						target = (sheet.total_tecnica_defesa or 0) + (tonumber(sheet.mod) or 0);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Defesa [" .. (sheet.total_tecnica_defesa or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event28 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.out_tecnica_defesa) or 0) + 3;
            
            							if sheet.nh_super_aparar == "1" then
            								mod = mod + (tonumber(sheet.nh_3_19) or 0)/2;
            							elseif sheet.nh_super_aparar == "2" then
            								mod = mod + (tonumber(sheet.nh_3_20) or 0)/2;
            							end;
            
            							sheet.total_tecnica_defesa = math.floor(mod);
            						end;
        end, obj);

    obj._e_event29 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							if (tonumber(sheet.mod) or 0) >= 0 then
            								sheet.sinal = "+";
            							else
            								sheet.sinal = "";
            							end;
            						end;
        end, obj);

    obj._e_event30 = obj.button15:addEventListener("onClick",
        function (self)
            self.rclListaDasVantagens:append();
        end, obj);

    obj._e_event31 = obj.rclListaDasVantagens:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDasVantagens.selectedNode;
            					self.boxDetalhesDasVantagens.node = node;
            					self.boxDetalhesDasVantagens.visible = (node ~= nil);
        end, obj);

    obj._e_event32 = obj.rclListaDasVantagens:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaDasVantagens.selectedNode == nil and sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.listaVantagens);               
            						if #nodes > 0 then
            							self.rclListaDasVantagens.selectedNode = nodes[1];
            						end;
            					end;
        end, obj);

    obj._e_event33 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = 0;
            						local nodes = ndb.getChildNodes(sheet.listaVantagens);   
            						for i=1, #nodes, 1 do
            							mod = mod + (tonumber(nodes[i].custo_vantagem) or 0);
            						end
            						sheet.xp_vantagens = mod;
            					end;
        end, obj);

    obj._e_event34 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xp_st) or 0)+
            										(tonumber(sheet.xp_dx) or 0)+
            										(tonumber(sheet.xp_iq) or 0)+
            										(tonumber(sheet.xp_ht) or 0)+
            										(tonumber(sheet.xp_pv) or 0)+
            										(tonumber(sheet.xp_von) or 0)+
            										(tonumber(sheet.xp_per) or 0)+
            										(tonumber(sheet.xp_pf) or 0);
            							sheet.xp_atributos = mod;
            						end;
        end, obj);

    obj._e_event35 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xp_atributos) or 0)+
            										(tonumber(sheet.xp_pericias) or 0)+
            										(tonumber(sheet.xp_vantagens) or 0);
            							sheet.xpp_gasta = mod;
            						end;
        end, obj);

    obj._e_event36 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							local mod = (tonumber(sheet.xpp_inicial) or 0)+
            										(tonumber(sheet.xpp_ganha) or 0)-
            										(tonumber(sheet.xpp_gasta) or 0);
            							sheet.xpp_sobrando = mod;
            						end;
        end, obj);

    obj._e_event37 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xpt_inicial) or 0)+
            										(tonumber(sheet.xpt_ganha) or 0)-
            										(tonumber(sheet.xp_tecnicas) or 0);
            							sheet.xpt_sobrando = mod;
            						end;
        end, obj);

    obj._e_event38 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xpt_inicial) or 0)+
            										(tonumber(sheet.xpp_inicial) or 0);
            							sheet.exp_inicial = mod;
            						end;
        end, obj);

    obj._e_event39 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xpt_ganha) or 0)+
            										(tonumber(sheet.xpp_ganha) or 0);
            							sheet.exp_ganha = mod;
            						end;
        end, obj);

    obj._e_event40 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            
            							local mod = (tonumber(sheet.xpp_gasta) or 0)+
            										(tonumber(sheet.xp_tecnicas) or 0);
            							sheet.exp_gasta = mod;
            						end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.boxDetalhesDasVantagens ~= nil then self.boxDetalhesDasVantagens:destroy(); self.boxDetalhesDasVantagens = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.rclListaDasVantagens ~= nil then self.rclListaDasVantagens:destroy(); self.rclListaDasVantagens = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSSF1 = {
    newEditor = newfrmSSF1, 
    new = newfrmSSF1, 
    name = "frmSSF1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSSF1 = _frmSSF1;
rrpg.registrarForm(_frmSSF1);

return _frmSSF1;
