require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMain()
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
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Cyberpunk2020");
    obj:setTitle("Ficha Cyberpunk 2020");
    obj:setAlign("client");
    obj:setTheme("dark");


		function priceCount()
			if sheet==nil then return end;

			local price = 0;

			local objetos = ndb.getChildNodes(sheet.inventoryList);
			local custo = 0;
			for i=1, #objetos, 1 do
				custo = custo + (tonumber(objetos[i].preco) or 0);
			end;
			price = price + custo;

            local objetos = ndb.getChildNodes(sheet.weaponList);
            local custo = 0;
            for i=1, #objetos, 1 do
                custo = custo + (tonumber(objetos[i].preco) or 0);
            end;
            price = price + custo;

            local objetos = ndb.getChildNodes(sheet.armorList);
            local custo = 0;
            for i=1, #objetos, 1 do
                custo = custo + (tonumber(objetos[i].preco) or 0);
            end;
            price = price + custo;

			sheet.precoGastos = price;
            showMessage(price);
		end;
	


    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmGeneral = gui.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setColor("#FF000000");
    obj.rectangle1:setWidth(1363);
    obj.rectangle1:setHeight(686);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1010);
    obj.layout1:setHeight(60);
    obj.layout1:setName("layout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(90);
    obj.label1:setHeight(20);
    obj.label1:setText("NOME");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(90);
    obj.label2:setHeight(20);
    obj.label2:setText("ETNIA/RAÇA");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(25);
    obj.edit2:setField("raca");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(405);
    obj.label3:setTop(5);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("DETALHES");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(500);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(300);
    obj.edit3:setHeight(25);
    obj.edit3:setField("detalhes");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(405);
    obj.label4:setTop(30);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("CLASSE");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(500);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(300);
    obj.edit4:setHeight(25);
    obj.edit4:setField("classe");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(805);
    obj.label5:setTop(17);
    obj.label5:setWidth(90);
    obj.label5:setHeight(20);
    obj.label5:setText("PONTOS");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(900);
    obj.edit5:setTop(15);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(30);
    obj.edit5:setField("pontos");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setTop(70);
    obj.layout2:setWidth(610);
    obj.layout2:setHeight(110);
    obj.layout2:setName("layout2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(610);
    obj.label6:setHeight(20);
    obj.label6:setText("ATRIBUTOS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(5);
    obj.label7:setTop(30);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("INTELIGÊNCIA");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(105);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("inteligencia");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(5);
    obj.label8:setTop(55);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("ATRATIVIDADE");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setLeft(105);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("atratividade");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(5);
    obj.label9:setTop(80);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("EMPATIA");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setLeft(105);
    obj.edit8:setTop(80);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("empatia");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(155);
    obj.label10:setTop(30);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("REFLEXOS");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setLeft(255);
    obj.edit9:setTop(30);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("reflexos");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(155);
    obj.label11:setTop(55);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("SORTE");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setLeft(255);
    obj.edit10:setTop(55);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("sorte");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(155);
    obj.label12:setTop(80);
    obj.label12:setWidth(100);
    obj.label12:setHeight(20);
    obj.label12:setText("CORRER");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(255);
    obj.rectangle4:setTop(80);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(255);
    obj.label13:setTop(80);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setField("correr");
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(305);
    obj.label14:setTop(30);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("TECNICA");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setLeft(405);
    obj.edit11:setTop(30);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("tecnica");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(305);
    obj.label15:setTop(55);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setText("MOVIMENTO");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setLeft(405);
    obj.edit12:setTop(55);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("movimento");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(305);
    obj.label16:setTop(80);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setText("SALTAR");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(405);
    obj.rectangle5:setTop(80);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(405);
    obj.label17:setTop(80);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setField("saltar");
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setLeft(455);
    obj.label18:setTop(30);
    obj.label18:setWidth(100);
    obj.label18:setHeight(20);
    obj.label18:setText("AUTOCONTROLE");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(555);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("autocontrole");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout2);
    obj.label19:setLeft(455);
    obj.label19:setTop(55);
    obj.label19:setWidth(100);
    obj.label19:setHeight(20);
    obj.label19:setText("TIPO CORPORAL");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(555);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("tipoCorporal");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout2);
    obj.label20:setLeft(455);
    obj.label20:setTop(80);
    obj.label20:setWidth(100);
    obj.label20:setHeight(20);
    obj.label20:setText("LEVANTAR");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(555);
    obj.rectangle6:setTop(80);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout2);
    obj.label21:setLeft(555);
    obj.label21:setTop(80);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setField("levantar");
    obj.label21:setVertTextAlign("center");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("empatia");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("movimento");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout2);
    obj.dataLink3:setField("tipoCorporal");
    obj.dataLink3:setName("dataLink3");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(620);
    obj.rectangle7:setTop(70);
    obj.rectangle7:setWidth(250);
    obj.rectangle7:setHeight(250);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle7);
    obj.label22:setLeft(0);
    obj.label22:setTop(40);
    obj.label22:setWidth(250);
    obj.label22:setHeight(20);
    obj.label22:setText("Avatar");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle7);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setTop(190);
    obj.layout3:setWidth(535);
    obj.layout3:setHeight(85);
    obj.layout3:setName("layout3");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setLeft(0);
    obj.label23:setTop(5);
    obj.label23:setWidth(535);
    obj.label23:setHeight(20);
    obj.label23:setText("BLINDAGEM");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(5);
    obj.label24:setTop(30);
    obj.label24:setWidth(75);
    obj.label24:setHeight(20);
    obj.label24:setText("Localização");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setLeft(5);
    obj.label25:setTop(55);
    obj.label25:setWidth(75);
    obj.label25:setHeight(20);
    obj.label25:setText("Blindagem PB");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(12);
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setLeft(80);
    obj.label26:setTop(30);
    obj.label26:setWidth(75);
    obj.label26:setHeight(20);
    obj.label26:setText("Cabeça 1");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setLeft(80);
    obj.rectangle9:setTop(55);
    obj.rectangle9:setWidth(75);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setLeft(80);
    obj.label27:setTop(55);
    obj.label27:setWidth(75);
    obj.label27:setHeight(25);
    obj.label27:setField("blindagemCabeca");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(155);
    obj.label28:setTop(30);
    obj.label28:setWidth(75);
    obj.label28:setHeight(20);
    obj.label28:setText("Torso 2-4");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setLeft(155);
    obj.rectangle10:setTop(55);
    obj.rectangle10:setWidth(75);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setLeft(155);
    obj.label29:setTop(55);
    obj.label29:setWidth(75);
    obj.label29:setHeight(25);
    obj.label29:setField("blindagemTorso");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setVertTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout3);
    obj.label30:setLeft(230);
    obj.label30:setTop(30);
    obj.label30:setWidth(75);
    obj.label30:setHeight(20);
    obj.label30:setText("Braço D. 5");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setLeft(230);
    obj.rectangle11:setTop(55);
    obj.rectangle11:setWidth(75);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setLeft(230);
    obj.label31:setTop(55);
    obj.label31:setWidth(75);
    obj.label31:setHeight(25);
    obj.label31:setField("blindagemBracoDireito");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setVertTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setLeft(305);
    obj.label32:setTop(30);
    obj.label32:setWidth(75);
    obj.label32:setHeight(20);
    obj.label32:setText("Braço E. 6");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setLeft(305);
    obj.rectangle12:setTop(55);
    obj.rectangle12:setWidth(75);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout3);
    obj.label33:setLeft(305);
    obj.label33:setTop(55);
    obj.label33:setWidth(75);
    obj.label33:setHeight(25);
    obj.label33:setField("blindagemBracoEsquerdo");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setVertTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setLeft(380);
    obj.label34:setTop(30);
    obj.label34:setWidth(75);
    obj.label34:setHeight(20);
    obj.label34:setText("Perna D. 7-8");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setLeft(380);
    obj.rectangle13:setTop(55);
    obj.rectangle13:setWidth(75);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout3);
    obj.label35:setLeft(380);
    obj.label35:setTop(55);
    obj.label35:setWidth(75);
    obj.label35:setHeight(25);
    obj.label35:setField("blindagemPernaDireita");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setVertTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout3);
    obj.label36:setLeft(455);
    obj.label36:setTop(30);
    obj.label36:setWidth(75);
    obj.label36:setHeight(20);
    obj.label36:setText("Perna E. 9-0");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setLeft(455);
    obj.rectangle14:setTop(55);
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout3);
    obj.label37:setLeft(455);
    obj.label37:setTop(55);
    obj.label37:setWidth(75);
    obj.label37:setHeight(25);
    obj.label37:setField("blindagemPernaEsquerda");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("center");
    obj.label37:setName("label37");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setTop(285);
    obj.layout4:setWidth(535);
    obj.layout4:setHeight(185);
    obj.layout4:setName("layout4");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout4);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setLeft(0);
    obj.label38:setTop(5);
    obj.label38:setWidth(535);
    obj.label38:setHeight(20);
    obj.label38:setText("DANO");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setLeft(5);
    obj.label39:setTop(30);
    obj.label39:setWidth(75);
    obj.label39:setHeight(20);
    obj.label39:setText("VIT");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout4);
    obj.rectangle16:setLeft(5);
    obj.rectangle16:setTop(55);
    obj.rectangle16:setWidth(75);
    obj.rectangle16:setHeight(125);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setLeft(5);
    obj.label40:setTop(55);
    obj.label40:setWidth(75);
    obj.label40:setHeight(125);
    obj.label40:setField("vit");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("center");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout4);
    obj.label41:setLeft(80);
    obj.label41:setTop(30);
    obj.label41:setWidth(75);
    obj.label41:setHeight(20);
    obj.label41:setText("MTC");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout4);
    obj.rectangle17:setLeft(80);
    obj.rectangle17:setTop(55);
    obj.rectangle17:setWidth(75);
    obj.rectangle17:setHeight(125);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout4);
    obj.label42:setLeft(80);
    obj.label42:setTop(55);
    obj.label42:setWidth(75);
    obj.label42:setHeight(125);
    obj.label42:setField("mtc");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");
    obj.label42:setName("label42");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(535);
    obj.layout5:setHeight(75);
    obj.layout5:setName("layout5");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(155);
    obj.label43:setTop(5);
    obj.label43:setWidth(75);
    obj.label43:setHeight(20);
    obj.label43:setText("Leve");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout5);
    obj.edit15:setLeft(155);
    obj.edit15:setTop(30);
    obj.edit15:setWidth(75);
    obj.edit15:setHeight(25);
    obj.edit15:setField("dano0");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(155);
    obj.label44:setTop(55);
    obj.label44:setWidth(75);
    obj.label44:setHeight(20);
    obj.label44:setText("Atordoamento 0");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontSize(9);
    obj.label44:setName("label44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setLeft(230);
    obj.label45:setTop(5);
    obj.label45:setWidth(75);
    obj.label45:setHeight(20);
    obj.label45:setText("Grave");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setLeft(230);
    obj.edit16:setTop(30);
    obj.edit16:setWidth(75);
    obj.edit16:setHeight(25);
    obj.edit16:setField("dano1");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout5);
    obj.label46:setLeft(230);
    obj.label46:setTop(55);
    obj.label46:setWidth(75);
    obj.label46:setHeight(20);
    obj.label46:setText("Atordoamento 1");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontSize(9);
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(305);
    obj.label47:setTop(5);
    obj.label47:setWidth(75);
    obj.label47:setHeight(20);
    obj.label47:setText("Crítico");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setLeft(305);
    obj.edit17:setTop(30);
    obj.edit17:setWidth(75);
    obj.edit17:setHeight(25);
    obj.edit17:setField("dano2");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setName("edit17");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(305);
    obj.label48:setTop(55);
    obj.label48:setWidth(75);
    obj.label48:setHeight(20);
    obj.label48:setText("Atordoamento 2");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontSize(9);
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout5);
    obj.label49:setLeft(380);
    obj.label49:setTop(5);
    obj.label49:setWidth(75);
    obj.label49:setHeight(20);
    obj.label49:setText("Mortal 0");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setLeft(380);
    obj.edit18:setTop(30);
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(25);
    obj.edit18:setField("dano3");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout5);
    obj.label50:setLeft(380);
    obj.label50:setTop(55);
    obj.label50:setWidth(75);
    obj.label50:setHeight(20);
    obj.label50:setText("Atordoamento 3");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontSize(9);
    obj.label50:setName("label50");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout5);
    obj.label51:setLeft(455);
    obj.label51:setTop(5);
    obj.label51:setWidth(75);
    obj.label51:setHeight(20);
    obj.label51:setText("Mortal -1");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setLeft(455);
    obj.edit19:setTop(30);
    obj.edit19:setWidth(75);
    obj.edit19:setHeight(25);
    obj.edit19:setField("dano4");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setName("edit19");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout5);
    obj.label52:setLeft(455);
    obj.label52:setTop(55);
    obj.label52:setWidth(75);
    obj.label52:setHeight(20);
    obj.label52:setText("Atordoamento 4");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(9);
    obj.label52:setName("label52");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setTop(100);
    obj.layout6:setWidth(535);
    obj.layout6:setHeight(75);
    obj.layout6:setName("layout6");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout6);
    obj.label53:setLeft(155);
    obj.label53:setTop(5);
    obj.label53:setWidth(75);
    obj.label53:setHeight(20);
    obj.label53:setText("Mortal -2");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout6);
    obj.edit20:setLeft(155);
    obj.edit20:setTop(30);
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setField("dano5");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setName("edit20");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout6);
    obj.label54:setLeft(155);
    obj.label54:setTop(55);
    obj.label54:setWidth(75);
    obj.label54:setHeight(20);
    obj.label54:setText("Atordoamento 5");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setFontSize(9);
    obj.label54:setName("label54");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout6);
    obj.label55:setLeft(230);
    obj.label55:setTop(5);
    obj.label55:setWidth(75);
    obj.label55:setHeight(20);
    obj.label55:setText("Mortal -3");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setLeft(230);
    obj.edit21:setTop(30);
    obj.edit21:setWidth(75);
    obj.edit21:setHeight(25);
    obj.edit21:setField("dano6");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setName("edit21");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout6);
    obj.label56:setLeft(230);
    obj.label56:setTop(55);
    obj.label56:setWidth(75);
    obj.label56:setHeight(20);
    obj.label56:setText("Atordoamento 6");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setFontSize(9);
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout6);
    obj.label57:setLeft(305);
    obj.label57:setTop(5);
    obj.label57:setWidth(75);
    obj.label57:setHeight(20);
    obj.label57:setText("Mortal -4");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setLeft(305);
    obj.edit22:setTop(30);
    obj.edit22:setWidth(75);
    obj.edit22:setHeight(25);
    obj.edit22:setField("dano7");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout6);
    obj.label58:setLeft(305);
    obj.label58:setTop(55);
    obj.label58:setWidth(75);
    obj.label58:setHeight(20);
    obj.label58:setText("Atordoamento 7");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setFontSize(9);
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout6);
    obj.label59:setLeft(380);
    obj.label59:setTop(5);
    obj.label59:setWidth(75);
    obj.label59:setHeight(20);
    obj.label59:setText("Mortal -5");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setLeft(380);
    obj.edit23:setTop(30);
    obj.edit23:setWidth(75);
    obj.edit23:setHeight(25);
    obj.edit23:setField("dano8");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout6);
    obj.label60:setLeft(380);
    obj.label60:setTop(55);
    obj.label60:setWidth(75);
    obj.label60:setHeight(20);
    obj.label60:setText("Atordoamento 8");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontSize(9);
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout6);
    obj.label61:setLeft(455);
    obj.label61:setTop(5);
    obj.label61:setWidth(75);
    obj.label61:setHeight(20);
    obj.label61:setText("Mortal -6");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout6);
    obj.edit24:setLeft(455);
    obj.edit24:setTop(30);
    obj.edit24:setWidth(75);
    obj.edit24:setHeight(25);
    obj.edit24:setField("dano9");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout6);
    obj.label62:setLeft(455);
    obj.label62:setTop(55);
    obj.label62:setWidth(75);
    obj.label62:setHeight(20);
    obj.label62:setText("Atordoamento 9");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontSize(9);
    obj.label62:setName("label62");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setTop(480);
    obj.layout7:setWidth(535);
    obj.layout7:setHeight(200);
    obj.layout7:setName("layout7");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout7);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout7);
    obj.label63:setLeft(5);
    obj.label63:setTop(5);
    obj.label63:setWidth(260);
    obj.label63:setHeight(20);
    obj.label63:setText("REPUTAÇÃO");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout7);
    obj.label64:setLeft(270);
    obj.label64:setTop(5);
    obj.label64:setWidth(260);
    obj.label64:setHeight(20);
    obj.label64:setText("EXPERIÊNCIA");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout7);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(260);
    obj.textEditor1:setHeight(170);
    obj.textEditor1:setField("reputacao");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout7);
    obj.textEditor2:setLeft(270);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(260);
    obj.textEditor2:setHeight(170);
    obj.textEditor2:setField("experiencia");
    obj.textEditor2:setName("textEditor2");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmSkills = gui.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab2);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");


		local function updateAtributes(num)
			local mod = 0;
			
			if num == "1" then
				mod = tonumber(sheet.atratividade) or 0;
			elseif num == "2" then
				mod = tonumber(sheet.tipoCorporal) or 0;
			elseif num == "3" then
				mod = tonumber(sheet.autocontrole) or 0;
			elseif num == "4" then
				mod = tonumber(sheet.reflexos) or 0;
			elseif num == "5" then
				mod = tonumber(sheet.tecnica) or 0;
			elseif num == "6" then
				mod = tonumber(sheet.inteligencia) or 0;
			elseif num == "7" then
				mod = tonumber(sheet.empatia) or 0;
			end;

			local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
			for i=1, #nodes, 1 do
				if nodes[i].atributo == num then
					nodes[i].atributoPericia = mod;
				end;
			end
		end;
	


    obj.popPericia = gui.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.frmSkills);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(100);
    obj.popPericia:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popPericia);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart1);
    obj.label65:setAlign("top");
    obj.label65:setFontSize(10);
    obj.label65:setText("Cibernético");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWordWrap(true);
    obj.label65:setTextTrimming("none");
    obj.label65:setAutoSize(true);
    obj.label65:setName("label65");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart1);
    obj.edit25:setAlign("client");
    obj.edit25:setField("cyber");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart2);
    obj.label66:setAlign("top");
    obj.label66:setFontSize(10);
    obj.label66:setText("Magia");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setWordWrap(true);
    obj.label66:setTextTrimming("none");
    obj.label66:setAutoSize(true);
    obj.label66:setName("label66");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart2);
    obj.edit26:setAlign("client");
    obj.edit26:setField("magia");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart3);
    obj.label67:setAlign("top");
    obj.label67:setFontSize(10);
    obj.label67:setText("Outros");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setWordWrap(true);
    obj.label67:setTextTrimming("none");
    obj.label67:setAutoSize(true);
    obj.label67:setName("label67");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart3);
    obj.edit27:setAlign("client");
    obj.edit27:setField("outros");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popPericia);
    obj.textEditor3:setAlign("bottom");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.frmSkills);
    obj.dataLink4:setFields({'atratividade', 'tipoCorporal', 'autocontrole', 'reflexos', 'tecnica', 'inteligencia', 'empatia'});
    obj.dataLink4:setName("dataLink4");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSkills);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox2);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(880);
    obj.layout8:setHeight(685);
    obj.layout8:setName("layout8");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout8);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout8);
    obj.label68:setText("NOME DA PERÍCIA");
    obj.label68:setLeft(20);
    obj.label68:setTop(1);
    obj.label68:setWidth(135);
    obj.label68:setHeight(20);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout8);
    obj.label69:setText("CHAVE");
    obj.label69:setLeft(165);
    obj.label69:setTop(1);
    obj.label69:setWidth(60);
    obj.label69:setHeight(20);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout8);
    obj.label70:setText("TOTAL");
    obj.label70:setLeft(245);
    obj.label70:setTop(1);
    obj.label70:setWidth(40);
    obj.label70:setHeight(20);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout8);
    obj.label71:setText("ATR");
    obj.label71:setLeft(285);
    obj.label71:setTop(1);
    obj.label71:setWidth(33);
    obj.label71:setHeight(20);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout8);
    obj.label72:setText("PTS");
    obj.label72:setLeft(320);
    obj.label72:setTop(1);
    obj.label72:setWidth(40);
    obj.label72:setHeight(20);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout8);
    obj.label73:setText("NOME DA PERÍCIA");
    obj.label73:setLeft(440);
    obj.label73:setTop(1);
    obj.label73:setWidth(135);
    obj.label73:setHeight(20);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout8);
    obj.label74:setText("CHAVE");
    obj.label74:setLeft(585);
    obj.label74:setTop(1);
    obj.label74:setWidth(60);
    obj.label74:setHeight(20);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout8);
    obj.label75:setText("TOTAL");
    obj.label75:setLeft(665);
    obj.label75:setTop(1);
    obj.label75:setWidth(40);
    obj.label75:setHeight(20);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout8);
    obj.label76:setText("ATR");
    obj.label76:setLeft(705);
    obj.label76:setTop(1);
    obj.label76:setWidth(33);
    obj.label76:setHeight(20);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout8);
    obj.label77:setText("PTS");
    obj.label77:setLeft(740);
    obj.label77:setTop(1);
    obj.label77:setWidth(40);
    obj.label77:setHeight(20);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.rclListaDasPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout8);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmSkillItem");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(870);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox2);
    obj.button1:setText("Nova Perícia");
    obj.button1:setLeft(890);
    obj.button1:setTop(0);
    obj.button1:setWidth(125);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmInventory = gui.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab3);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmInventory);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox3);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(360);
    obj.layout9:setHeight(685);
    obj.layout9:setName("layout9");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout9);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setText("ITEM");
    obj.label78:setLeft(5);
    obj.label78:setTop(1);
    obj.label78:setWidth(150);
    obj.label78:setHeight(20);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout9);
    obj.label79:setText("QTD");
    obj.label79:setLeft(155);
    obj.label79:setTop(1);
    obj.label79:setWidth(50);
    obj.label79:setHeight(20);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout9);
    obj.label80:setText("PREÇO");
    obj.label80:setLeft(205);
    obj.label80:setTop(1);
    obj.label80:setWidth(50);
    obj.label80:setHeight(20);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout9);
    obj.label81:setText("PESO");
    obj.label81:setLeft(255);
    obj.label81:setTop(1);
    obj.label81:setWidth(50);
    obj.label81:setHeight(20);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setText("+");
    obj.button2:setLeft(305);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.rclInventory = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventory:setParent(obj.layout9);
    obj.rclInventory:setName("rclInventory");
    obj.rclInventory:setField("inventoryList");
    obj.rclInventory:setTemplateForm("frmInventoryItem");
    obj.rclInventory:setLeft(5);
    obj.rclInventory:setTop(25);
    obj.rclInventory:setWidth(350);
    obj.rclInventory:setHeight(650);
    obj.rclInventory:setLayout("vertical");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox3);
    obj.layout10:setLeft(370);
    obj.layout10:setTop(0);
    obj.layout10:setWidth(760);
    obj.layout10:setHeight(335);
    obj.layout10:setName("layout10");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout10);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setName("rectangle21");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setText("ARMA");
    obj.label82:setLeft(5);
    obj.label82:setTop(1);
    obj.label82:setWidth(150);
    obj.label82:setHeight(20);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setText("TIPO");
    obj.label83:setLeft(155);
    obj.label83:setTop(1);
    obj.label83:setWidth(50);
    obj.label83:setHeight(20);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout10);
    obj.label84:setText("PRECISÃO");
    obj.label84:setLeft(205);
    obj.label84:setTop(1);
    obj.label84:setWidth(50);
    obj.label84:setHeight(20);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontSize(11);
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setText("OCULT.");
    obj.label85:setLeft(255);
    obj.label85:setTop(1);
    obj.label85:setWidth(50);
    obj.label85:setHeight(20);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setFontSize(12);
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setText("DISP.");
    obj.label86:setLeft(305);
    obj.label86:setTop(1);
    obj.label86:setWidth(50);
    obj.label86:setHeight(20);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setText("DANO");
    obj.label87:setLeft(355);
    obj.label87:setTop(1);
    obj.label87:setWidth(50);
    obj.label87:setHeight(20);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setText("Nº DISP.");
    obj.label88:setLeft(405);
    obj.label88:setTop(1);
    obj.label88:setWidth(50);
    obj.label88:setHeight(20);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setFontSize(11);
    obj.label88:setName("label88");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setText("CD TIRO");
    obj.label89:setLeft(455);
    obj.label89:setTop(1);
    obj.label89:setWidth(50);
    obj.label89:setHeight(20);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setFontSize(11);
    obj.label89:setName("label89");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout10);
    obj.label90:setText("CONF.");
    obj.label90:setLeft(505);
    obj.label90:setTop(1);
    obj.label90:setWidth(50);
    obj.label90:setHeight(20);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout10);
    obj.label91:setText("ALCANCE");
    obj.label91:setLeft(555);
    obj.label91:setTop(1);
    obj.label91:setWidth(50);
    obj.label91:setHeight(20);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontSize(11);
    obj.label91:setName("label91");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout10);
    obj.label92:setText("PREÇO");
    obj.label92:setLeft(605);
    obj.label92:setTop(1);
    obj.label92:setWidth(50);
    obj.label92:setHeight(20);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout10);
    obj.label93:setText("PESO");
    obj.label93:setLeft(655);
    obj.label93:setTop(1);
    obj.label93:setWidth(50);
    obj.label93:setHeight(20);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout10);
    obj.button3:setText("+");
    obj.button3:setLeft(705);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.rclInventoryWeapon = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryWeapon:setParent(obj.layout10);
    obj.rclInventoryWeapon:setName("rclInventoryWeapon");
    obj.rclInventoryWeapon:setField("weaponList");
    obj.rclInventoryWeapon:setTemplateForm("frmInventoryWeapon");
    obj.rclInventoryWeapon:setLeft(5);
    obj.rclInventoryWeapon:setTop(25);
    obj.rclInventoryWeapon:setWidth(750);
    obj.rclInventoryWeapon:setHeight(300);
    obj.rclInventoryWeapon:setLayout("vertical");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox3);
    obj.layout11:setLeft(370);
    obj.layout11:setTop(345);
    obj.layout11:setWidth(760);
    obj.layout11:setHeight(335);
    obj.layout11:setName("layout11");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout11);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout11);
    obj.label94:setText("ARMADURA");
    obj.label94:setLeft(5);
    obj.label94:setTop(1);
    obj.label94:setWidth(150);
    obj.label94:setHeight(20);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout11);
    obj.label95:setText("CABEÇA");
    obj.label95:setLeft(155);
    obj.label95:setTop(1);
    obj.label95:setWidth(50);
    obj.label95:setHeight(20);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout11);
    obj.label96:setText("TORSO");
    obj.label96:setLeft(205);
    obj.label96:setTop(1);
    obj.label96:setWidth(50);
    obj.label96:setHeight(20);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout11);
    obj.label97:setText("BRAÇO D");
    obj.label97:setLeft(255);
    obj.label97:setTop(1);
    obj.label97:setWidth(50);
    obj.label97:setHeight(20);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setFontSize(11);
    obj.label97:setName("label97");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout11);
    obj.label98:setText("BRAÇO E");
    obj.label98:setLeft(305);
    obj.label98:setTop(1);
    obj.label98:setWidth(50);
    obj.label98:setHeight(20);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontSize(11);
    obj.label98:setName("label98");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout11);
    obj.label99:setText("PERNA D");
    obj.label99:setLeft(355);
    obj.label99:setTop(1);
    obj.label99:setWidth(50);
    obj.label99:setHeight(20);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setFontSize(11);
    obj.label99:setName("label99");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout11);
    obj.label100:setText("PERNA E");
    obj.label100:setLeft(405);
    obj.label100:setTop(1);
    obj.label100:setWidth(50);
    obj.label100:setHeight(20);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setFontSize(11);
    obj.label100:setName("label100");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout11);
    obj.label101:setText("DETALHES");
    obj.label101:setLeft(455);
    obj.label101:setTop(1);
    obj.label101:setWidth(150);
    obj.label101:setHeight(20);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout11);
    obj.label102:setText("PREÇO");
    obj.label102:setLeft(605);
    obj.label102:setTop(1);
    obj.label102:setWidth(50);
    obj.label102:setHeight(20);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout11);
    obj.label103:setText("PESO");
    obj.label103:setLeft(655);
    obj.label103:setTop(1);
    obj.label103:setWidth(50);
    obj.label103:setHeight(20);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout11);
    obj.button4:setText("+");
    obj.button4:setLeft(705);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setName("button4");

    obj.rclInventoryArmor = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryArmor:setParent(obj.layout11);
    obj.rclInventoryArmor:setName("rclInventoryArmor");
    obj.rclInventoryArmor:setField("armorList");
    obj.rclInventoryArmor:setTemplateForm("frmInventoryArmor");
    obj.rclInventoryArmor:setLeft(5);
    obj.rclInventoryArmor:setTop(25);
    obj.rclInventoryArmor:setWidth(750);
    obj.rclInventoryArmor:setHeight(300);
    obj.rclInventoryArmor:setLayout("vertical");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox3);
    obj.layout12:setLeft(1140);
    obj.layout12:setTop(0);
    obj.layout12:setWidth(210);
    obj.layout12:setHeight(60);
    obj.layout12:setName("layout12");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout12);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setName("rectangle23");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout12);
    obj.label104:setLeft(5);
    obj.label104:setTop(5);
    obj.label104:setWidth(100);
    obj.label104:setHeight(20);
    obj.label104:setText("PREÇO");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout12);
    obj.rectangle24:setLeft(105);
    obj.rectangle24:setTop(5);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout12);
    obj.label105:setLeft(105);
    obj.label105:setTop(5);
    obj.label105:setWidth(50);
    obj.label105:setHeight(25);
    obj.label105:setField("itensCost");
    obj.label105:setVertTextAlign("center");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout12);
    obj.label106:setLeft(5);
    obj.label106:setTop(30);
    obj.label106:setWidth(100);
    obj.label106:setHeight(20);
    obj.label106:setText("PESO");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout12);
    obj.rectangle25:setLeft(105);
    obj.rectangle25:setTop(30);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout12);
    obj.label107:setLeft(105);
    obj.label107:setTop(30);
    obj.label107:setWidth(50);
    obj.label107:setHeight(25);
    obj.label107:setField("itensWeight");
    obj.label107:setVertTextAlign("center");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout12);
    obj.dataLink5:setFields({'inventoryWeight', 'weaponWeight', 'armorWeight'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout12);
    obj.dataLink6:setFields({'inventoryCost', 'weaponCost', 'armorCost', 'cyberCost'});
    obj.dataLink6:setName("dataLink6");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Cibernético");
    obj.tab4:setName("tab4");

    obj.frmCyber = gui.fromHandle(_obj_newObject("form"));
    obj.frmCyber:setParent(obj.tab4);
    obj.frmCyber:setName("frmCyber");
    obj.frmCyber:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmCyber);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.scrollBox4);
    obj.rectangle26:setColor("grey");
    obj.rectangle26:setWidth(1363);
    obj.rectangle26:setHeight(686);
    obj.rectangle26:setName("rectangle26");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox4);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(460);
    obj.layout13:setHeight(685);
    obj.layout13:setName("layout13");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout13);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout13);
    obj.label108:setText("NOME");
    obj.label108:setLeft(5);
    obj.label108:setTop(1);
    obj.label108:setWidth(100);
    obj.label108:setHeight(20);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout13);
    obj.label109:setText("DETALHES");
    obj.label109:setLeft(105);
    obj.label109:setTop(1);
    obj.label109:setWidth(200);
    obj.label109:setHeight(20);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout13);
    obj.label110:setText("PH");
    obj.label110:setLeft(305);
    obj.label110:setTop(1);
    obj.label110:setWidth(50);
    obj.label110:setHeight(20);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout13);
    obj.label111:setText("PREÇO");
    obj.label111:setLeft(355);
    obj.label111:setTop(1);
    obj.label111:setWidth(50);
    obj.label111:setHeight(20);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout13);
    obj.button5:setText("+");
    obj.button5:setLeft(405);
    obj.button5:setTop(0);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setName("button5");

    obj.rclCyber = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclCyber:setParent(obj.layout13);
    obj.rclCyber:setName("rclCyber");
    obj.rclCyber:setField("cyberList");
    obj.rclCyber:setTemplateForm("frmCyberItem");
    obj.rclCyber:setLeft(5);
    obj.rclCyber:setTop(25);
    obj.rclCyber:setWidth(450);
    obj.rclCyber:setHeight(650);
    obj.rclCyber:setLayout("vertical");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox4);
    obj.layout14:setLeft(470);
    obj.layout14:setTop(0);
    obj.layout14:setWidth(210);
    obj.layout14:setHeight(35);
    obj.layout14:setName("layout14");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout14);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout14);
    obj.label112:setLeft(5);
    obj.label112:setTop(5);
    obj.label112:setWidth(100);
    obj.label112:setHeight(20);
    obj.label112:setText("HUMANIDADE");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout14);
    obj.rectangle29:setLeft(105);
    obj.rectangle29:setTop(5);
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout14);
    obj.label113:setLeft(105);
    obj.label113:setTop(5);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setField("phGasto");
    obj.label113:setVertTextAlign("center");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout14);
    obj.rectangle30:setLeft(155);
    obj.rectangle30:setTop(5);
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout14);
    obj.label114:setLeft(155);
    obj.label114:setTop(5);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setField("phTotal");
    obj.label114:setVertTextAlign("center");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Descrição");
    obj.tab5:setName("tab5");

    obj.frmTemplateDescription = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab5);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateDescription);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.scrollBox5);
    obj.rectangle31:setLeft(0);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(1205);
    obj.rectangle31:setHeight(105);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle31);
    obj.label115:setLeft(3);
    obj.label115:setTop(1);
    obj.label115:setWidth(100);
    obj.label115:setHeight(20);
    obj.label115:setText("DESCRIÇÃO");
    obj.label115:setName("label115");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle31);
    obj.label116:setLeft(10);
    obj.label116:setTop(25);
    obj.label116:setWidth(90);
    obj.label116:setHeight(20);
    obj.label116:setText("TAMANHO");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle31);
    obj.edit28:setLeft(100);
    obj.edit28:setTop(25);
    obj.edit28:setWidth(200);
    obj.edit28:setHeight(25);
    obj.edit28:setField("tamanho");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle31);
    obj.label117:setLeft(10);
    obj.label117:setTop(50);
    obj.label117:setWidth(90);
    obj.label117:setHeight(20);
    obj.label117:setText("ALTURA");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle31);
    obj.edit29:setLeft(100);
    obj.edit29:setTop(50);
    obj.edit29:setWidth(200);
    obj.edit29:setHeight(25);
    obj.edit29:setField("altura");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle31);
    obj.label118:setLeft(10);
    obj.label118:setTop(75);
    obj.label118:setWidth(90);
    obj.label118:setHeight(20);
    obj.label118:setText("PESO");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle31);
    obj.edit30:setLeft(100);
    obj.edit30:setTop(75);
    obj.edit30:setWidth(200);
    obj.edit30:setHeight(25);
    obj.edit30:setField("peso");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle31);
    obj.label119:setLeft(310);
    obj.label119:setTop(25);
    obj.label119:setWidth(90);
    obj.label119:setHeight(20);
    obj.label119:setText("IDADE");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle31);
    obj.edit31:setLeft(400);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(200);
    obj.edit31:setHeight(25);
    obj.edit31:setField("idade");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle31);
    obj.label120:setLeft(310);
    obj.label120:setTop(50);
    obj.label120:setWidth(90);
    obj.label120:setHeight(20);
    obj.label120:setText("SEXO");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle31);
    obj.edit32:setLeft(400);
    obj.edit32:setTop(50);
    obj.edit32:setWidth(200);
    obj.edit32:setHeight(25);
    obj.edit32:setField("sexo");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle31);
    obj.label121:setLeft(310);
    obj.label121:setTop(75);
    obj.label121:setWidth(90);
    obj.label121:setHeight(20);
    obj.label121:setText("OUTROS");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle31);
    obj.edit33:setLeft(400);
    obj.edit33:setTop(75);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(25);
    obj.edit33:setField("aparenciaOutros");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle31);
    obj.label122:setLeft(610);
    obj.label122:setTop(25);
    obj.label122:setWidth(90);
    obj.label122:setHeight(20);
    obj.label122:setText("OLHOS");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle31);
    obj.edit34:setLeft(700);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("aparenciaOlhos");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle31);
    obj.label123:setLeft(610);
    obj.label123:setTop(50);
    obj.label123:setWidth(90);
    obj.label123:setHeight(20);
    obj.label123:setText("PELE");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle31);
    obj.edit35:setLeft(700);
    obj.edit35:setTop(50);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setField("pele");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle31);
    obj.label124:setLeft(610);
    obj.label124:setTop(75);
    obj.label124:setWidth(90);
    obj.label124:setHeight(20);
    obj.label124:setText("CABELO");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle31);
    obj.edit36:setLeft(700);
    obj.edit36:setTop(75);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setField("cabelo");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle31);
    obj.label125:setLeft(910);
    obj.label125:setTop(25);
    obj.label125:setWidth(90);
    obj.label125:setHeight(20);
    obj.label125:setText("MARCAS");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle31);
    obj.edit37:setLeft(1000);
    obj.edit37:setTop(25);
    obj.edit37:setWidth(200);
    obj.edit37:setHeight(25);
    obj.edit37:setField("marcas");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle31);
    obj.label126:setLeft(910);
    obj.label126:setTop(50);
    obj.label126:setWidth(90);
    obj.label126:setHeight(20);
    obj.label126:setText("VESTUARIO");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle31);
    obj.edit38:setLeft(1000);
    obj.edit38:setTop(50);
    obj.edit38:setWidth(200);
    obj.edit38:setHeight(25);
    obj.edit38:setField("vestuario");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle31);
    obj.label127:setLeft(910);
    obj.label127:setTop(75);
    obj.label127:setWidth(90);
    obj.label127:setHeight(20);
    obj.label127:setText("ANTECEDENTE");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle31);
    obj.edit39:setLeft(1000);
    obj.edit39:setTop(75);
    obj.edit39:setWidth(200);
    obj.edit39:setHeight(25);
    obj.edit39:setField("antecedente");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox5);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(110);
    obj.layout15:setWidth(375);
    obj.layout15:setHeight(140);
    obj.layout15:setName("layout15");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout15);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout15);
    obj.label128:setLeft(5);
    obj.label128:setTop(1);
    obj.label128:setWidth(100);
    obj.label128:setHeight(20);
    obj.label128:setText("APARÊNCIA");
    obj.label128:setName("label128");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout15);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(365);
    obj.textEditor4:setHeight(100);
    obj.textEditor4:setField("aparencia");
    obj.textEditor4:setName("textEditor4");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox5);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(255);
    obj.layout16:setWidth(375);
    obj.layout16:setHeight(140);
    obj.layout16:setName("layout16");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout16);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout16);
    obj.label129:setLeft(5);
    obj.label129:setTop(1);
    obj.label129:setWidth(100);
    obj.label129:setHeight(20);
    obj.label129:setText("PERSONALIDADE");
    obj.label129:setName("label129");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout16);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(365);
    obj.textEditor5:setHeight(100);
    obj.textEditor5:setField("personalidade");
    obj.textEditor5:setName("textEditor5");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox5);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(400);
    obj.layout17:setWidth(375);
    obj.layout17:setHeight(140);
    obj.layout17:setName("layout17");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout17);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout17);
    obj.label130:setLeft(5);
    obj.label130:setTop(1);
    obj.label130:setWidth(100);
    obj.label130:setHeight(20);
    obj.label130:setText("IDIOMAS");
    obj.label130:setName("label130");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout17);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(365);
    obj.textEditor6:setHeight(100);
    obj.textEditor6:setField("idiomas");
    obj.textEditor6:setName("textEditor6");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox5);
    obj.layout18:setLeft(380);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(825);
    obj.layout18:setHeight(495);
    obj.layout18:setName("layout18");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout18);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout18);
    obj.label131:setLeft(5);
    obj.label131:setTop(1);
    obj.label131:setWidth(100);
    obj.label131:setHeight(20);
    obj.label131:setText("HISTORIA");
    obj.label131:setName("label131");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout18);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Anotações");
    obj.tab6:setName("tab6");

    obj.frmTemplateNotes = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab6);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateNotes);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox6);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(0);
    obj.layout19:setWidth(400);
    obj.layout19:setHeight(580);
    obj.layout19:setName("layout19");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout19);
    obj.rectangle36:setLeft(0);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(400);
    obj.rectangle36:setHeight(580);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setXradius(5);
    obj.rectangle36:setYradius(15);
    obj.rectangle36:setCornerType("round");
    obj.rectangle36:setName("rectangle36");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout19);
    obj.label132:setLeft(0);
    obj.label132:setTop(0);
    obj.label132:setWidth(400);
    obj.label132:setHeight(20);
    obj.label132:setText("Anotações");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout19);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(540);
    obj.textEditor7:setField("anotacoes1");
    obj.textEditor7:setName("textEditor7");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox6);
    obj.layout20:setLeft(410);
    obj.layout20:setTop(0);
    obj.layout20:setWidth(400);
    obj.layout20:setHeight(580);
    obj.layout20:setName("layout20");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout20);
    obj.rectangle37:setLeft(0);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(400);
    obj.rectangle37:setHeight(580);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(5);
    obj.rectangle37:setYradius(15);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout20);
    obj.label133:setLeft(0);
    obj.label133:setTop(0);
    obj.label133:setWidth(400);
    obj.label133:setHeight(20);
    obj.label133:setText("Anotações");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout20);
    obj.textEditor8:setLeft(10);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(380);
    obj.textEditor8:setHeight(540);
    obj.textEditor8:setField("anotacoes2");
    obj.textEditor8:setName("textEditor8");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox6);
    obj.layout21:setLeft(820);
    obj.layout21:setTop(0);
    obj.layout21:setWidth(400);
    obj.layout21:setHeight(580);
    obj.layout21:setName("layout21");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout21);
    obj.rectangle38:setLeft(0);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(400);
    obj.rectangle38:setHeight(580);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(5);
    obj.rectangle38:setYradius(15);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout21);
    obj.label134:setLeft(0);
    obj.label134:setTop(0);
    obj.label134:setWidth(400);
    obj.label134:setHeight(20);
    obj.label134:setText("Anotações");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout21);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(380);
    obj.textEditor9:setHeight(540);
    obj.textEditor9:setField("anotacoes3");
    obj.textEditor9:setName("textEditor9");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab7);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateCreditos);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox7);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(125);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Cyberpunk2020/images/cyberpunk.png");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox7);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Cyberpunk2020/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox7);
    obj.layout22:setLeft(850);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(200);
    obj.layout22:setHeight(160);
    obj.layout22:setName("layout22");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout22);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(5);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout22);
    obj.label135:setLeft(0);
    obj.label135:setTop(10);
    obj.label135:setWidth(200);
    obj.label135:setHeight(20);
    obj.label135:setText("Programador: Vinny (Ambesek)");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout22);
    obj.label136:setLeft(0);
    obj.label136:setTop(35);
    obj.label136:setWidth(200);
    obj.label136:setHeight(20);
    obj.label136:setText("Consultor: francinha87");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.scrollBox7);
    obj.label137:setLeft(555);
    obj.label137:setTop(300);
    obj.label137:setWidth(100);
    obj.label137:setHeight(20);
    obj.label137:setText("Versão Atual: ");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox7);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/release.png");
    obj.image4:setName("image4");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.scrollBox7);
    obj.label138:setLeft(555);
    obj.label138:setTop(325);
    obj.label138:setWidth(100);
    obj.label138:setHeight(20);
    obj.label138:setText("Sua Versão: ");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox7);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao02.png");
    obj.image5:setName("image5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox7);
    obj.button6:setLeft(555);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Change Log");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox7);
    obj.button7:setLeft(667);
    obj.button7:setTop(350);
    obj.button7:setWidth(100);
    obj.button7:setText("Atualizar");
    obj.button7:setName("button7");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.scrollBox7);
    obj.label139:setLeft(555);
    obj.label139:setTop(400);
    obj.label139:setWidth(200);
    obj.label139:setHeight(20);
    obj.label139:setText("Conheça as Mesas:");
    obj.label139:setName("label139");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox7);
    obj.button8:setLeft(555);
    obj.button8:setTop(425);
    obj.button8:setWidth(100);
    obj.button8:setText("RPGmeister");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox7);
    obj.button9:setLeft(667);
    obj.button9:setTop(425);
    obj.button9:setWidth(125);
    obj.button9:setText("Nova York 1920");
    obj.button9:setName("button9");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj);
    obj.image6:setAlign("client");
    obj.image6:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/root.png");
    obj.image6:setStyle("stretch");
    obj.image6:setName("image6");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					local emp = tonumber(sheet.empatia) or 0;
            					sheet.phTotal = emp * 10;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mov = tonumber(sheet.movimento) or 0;
            					sheet.correr = mov * 3;
            					sheet.saltar = mov * 3 / 4;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					local tco = tonumber(sheet.tipoCorporal) or 0;
            					
            					sheet.levantar = tco * 10;
            
            					sheet.vit = tco;
            					
            					if tco <= 2 then
            						sheet.mtc = 0;
            					elseif tco <=4 then
            						sheet.mtc = -1;
            					elseif tco <=7 then
            						sheet.mtc = -2;
            					elseif tco <=9 then
            						sheet.mtc = -3;
            					elseif tco <=10 then
            						sheet.mtc = -4;
            					else
            						sheet.mtc = -5;
            					end;
        end, obj);

    obj._e_event3 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            			updateAtributes("1");
            			updateAtributes("2");
            			updateAtributes("3");
            			updateAtributes("4");
            			updateAtributes("5");
            			updateAtributes("6");
            			updateAtributes("7");
        end, obj);

    obj._e_event5 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if utils.compareStringPtBr(nodeA.atributo, nodeB.atributo)== 0 then
            						return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            					else 
            		            	return utils.compareStringPtBr(nodeA.atributo, nodeB.atributo);
            		            end;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclInventory:append();
        end, obj);

    obj._e_event8 = obj.rclInventory:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event9 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclInventoryWeapon:append();
        end, obj);

    obj._e_event10 = obj.rclInventoryWeapon:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclInventoryArmor:append();
        end, obj);

    obj._e_event12 = obj.rclInventoryArmor:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event13 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.itensWeight = (tonumber(sheet.inventoryWeight) or 0) + 
            										(tonumber(sheet.weaponWeight) or 0) + 
            										(tonumber(sheet.armorWeight) or 0);
        end, obj);

    obj._e_event14 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.itensCost = (tonumber(sheet.inventoryCost) or 0) + 
            										(tonumber(sheet.cyberCost) or 0) + 
            										(tonumber(sheet.weaponCost) or 0) + 
            										(tonumber(sheet.armorCost) or 0);
        end, obj);

    obj._e_event15 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclCyber:append();
        end, obj);

    obj._e_event16 = obj.rclCyber:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event17 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Cyberpunk%202020/README.md')
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/Ficha%20Cyberpunk%202020.rpk')
        end, obj);

    obj._e_event19 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event20 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=77684');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rclCyber ~= nil then self.rclCyber:destroy(); self.rclCyber = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.rclInventoryArmor ~= nil then self.rclInventoryArmor:destroy(); self.rclInventoryArmor = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rclInventoryWeapon ~= nil then self.rclInventoryWeapon:destroy(); self.rclInventoryWeapon = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.frmCyber ~= nil then self.frmCyber:destroy(); self.frmCyber = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rclInventory ~= nil then self.rclInventory:destroy(); self.rclInventory = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Nefertyne.Cyberpunk2020", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Cyberpunk 2020", 
    description=""};

frmMain = _frmMain;
rrpg.registrarForm(_frmMain);
rrpg.registrarDataType(_frmMain);

return _frmMain;
