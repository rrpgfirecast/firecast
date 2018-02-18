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
    obj.label2:setText("ETINIA/RAÇA");
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

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setLeft(255);
    obj.edit11:setTop(80);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("correr");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(305);
    obj.label13:setTop(30);
    obj.label13:setWidth(100);
    obj.label13:setHeight(20);
    obj.label13:setText("TECNICA");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setLeft(405);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("tecnica");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(305);
    obj.label14:setTop(55);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("MOVIMENTO");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(405);
    obj.edit13:setTop(55);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("movimento");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(305);
    obj.label15:setTop(80);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setText("SALTAR");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(405);
    obj.edit14:setTop(80);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("saltar");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(455);
    obj.label16:setTop(30);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setText("AUTOCONTROLE");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setLeft(555);
    obj.edit15:setTop(30);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("autocontrole");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(455);
    obj.label17:setTop(55);
    obj.label17:setWidth(100);
    obj.label17:setHeight(20);
    obj.label17:setText("TIPO CORPORAL");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setLeft(555);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("tipoCorporal");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setLeft(455);
    obj.label18:setTop(80);
    obj.label18:setWidth(100);
    obj.label18:setHeight(20);
    obj.label18:setText("LEVANTAR");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setLeft(555);
    obj.edit17:setTop(80);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("levantar");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setName("edit17");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(620);
    obj.rectangle4:setTop(70);
    obj.rectangle4:setWidth(250);
    obj.rectangle4:setHeight(250);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle4);
    obj.label19:setLeft(0);
    obj.label19:setTop(40);
    obj.label19:setWidth(250);
    obj.label19:setHeight(20);
    obj.label19:setText("Avatar");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle4);
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

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(535);
    obj.label20:setHeight(20);
    obj.label20:setText("BLINDAGEM");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(5);
    obj.label21:setTop(30);
    obj.label21:setWidth(75);
    obj.label21:setHeight(20);
    obj.label21:setText("Localização");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setLeft(5);
    obj.label22:setTop(55);
    obj.label22:setWidth(75);
    obj.label22:setHeight(20);
    obj.label22:setText("Blindagem PB");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(12);
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setLeft(80);
    obj.label23:setTop(30);
    obj.label23:setWidth(75);
    obj.label23:setHeight(20);
    obj.label23:setText("Cabeça 1");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setLeft(80);
    obj.edit18:setTop(55);
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(25);
    obj.edit18:setField("blindagemCabeca");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(155);
    obj.label24:setTop(30);
    obj.label24:setWidth(75);
    obj.label24:setHeight(20);
    obj.label24:setText("Torso 2-4");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout3);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(55);
    obj.edit19:setWidth(75);
    obj.edit19:setHeight(25);
    obj.edit19:setField("blindagemTorso");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setName("edit19");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setLeft(230);
    obj.label25:setTop(30);
    obj.label25:setWidth(75);
    obj.label25:setHeight(20);
    obj.label25:setText("Braço D. 5");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setLeft(230);
    obj.edit20:setTop(55);
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setField("blindagemBracoDireito");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setName("edit20");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setLeft(305);
    obj.label26:setTop(30);
    obj.label26:setWidth(75);
    obj.label26:setHeight(20);
    obj.label26:setText("Braço E. 6");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout3);
    obj.edit21:setLeft(305);
    obj.edit21:setTop(55);
    obj.edit21:setWidth(75);
    obj.edit21:setHeight(25);
    obj.edit21:setField("blindagemBracoEsquerdo");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setName("edit21");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setLeft(380);
    obj.label27:setTop(30);
    obj.label27:setWidth(75);
    obj.label27:setHeight(20);
    obj.label27:setText("Perna D. 7-8");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout3);
    obj.edit22:setLeft(380);
    obj.edit22:setTop(55);
    obj.edit22:setWidth(75);
    obj.edit22:setHeight(25);
    obj.edit22:setField("blindagemPernaDireita");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(455);
    obj.label28:setTop(30);
    obj.label28:setWidth(75);
    obj.label28:setHeight(20);
    obj.label28:setText("Perna E. 9-0");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout3);
    obj.edit23:setLeft(455);
    obj.edit23:setTop(55);
    obj.edit23:setWidth(75);
    obj.edit23:setHeight(25);
    obj.edit23:setField("blindagemPernaEsquerda");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setTop(285);
    obj.layout4:setWidth(535);
    obj.layout4:setHeight(185);
    obj.layout4:setName("layout4");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(0);
    obj.label29:setTop(5);
    obj.label29:setWidth(535);
    obj.label29:setHeight(20);
    obj.label29:setText("DANO");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(5);
    obj.label30:setTop(30);
    obj.label30:setWidth(75);
    obj.label30:setHeight(20);
    obj.label30:setText("VIT");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setLeft(5);
    obj.edit24:setTop(55);
    obj.edit24:setWidth(75);
    obj.edit24:setHeight(125);
    obj.edit24:setField("vit");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(80);
    obj.label31:setTop(30);
    obj.label31:setWidth(75);
    obj.label31:setHeight(20);
    obj.label31:setText("MTC");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setLeft(80);
    obj.edit25:setTop(55);
    obj.edit25:setWidth(75);
    obj.edit25:setHeight(125);
    obj.edit25:setField("mtc");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setName("edit25");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(535);
    obj.layout5:setHeight(75);
    obj.layout5:setName("layout5");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout5);
    obj.label32:setLeft(155);
    obj.label32:setTop(5);
    obj.label32:setWidth(75);
    obj.label32:setHeight(20);
    obj.label32:setText("Leve");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout5);
    obj.edit26:setLeft(155);
    obj.edit26:setTop(30);
    obj.edit26:setWidth(75);
    obj.edit26:setHeight(25);
    obj.edit26:setField("dano0");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setName("edit26");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout5);
    obj.label33:setLeft(155);
    obj.label33:setTop(55);
    obj.label33:setWidth(75);
    obj.label33:setHeight(20);
    obj.label33:setText("Atordoamento 0");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontSize(9);
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(230);
    obj.label34:setTop(5);
    obj.label34:setWidth(75);
    obj.label34:setHeight(20);
    obj.label34:setText("Grave");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout5);
    obj.edit27:setLeft(230);
    obj.edit27:setTop(30);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(25);
    obj.edit27:setField("dano1");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setName("edit27");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout5);
    obj.label35:setLeft(230);
    obj.label35:setTop(55);
    obj.label35:setWidth(75);
    obj.label35:setHeight(20);
    obj.label35:setText("Atordoamento 1");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontSize(9);
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(305);
    obj.label36:setTop(5);
    obj.label36:setWidth(75);
    obj.label36:setHeight(20);
    obj.label36:setText("Crítico");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout5);
    obj.edit28:setLeft(305);
    obj.edit28:setTop(30);
    obj.edit28:setWidth(75);
    obj.edit28:setHeight(25);
    obj.edit28:setField("dano2");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(305);
    obj.label37:setTop(55);
    obj.label37:setWidth(75);
    obj.label37:setHeight(20);
    obj.label37:setText("Atordoamento 2");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontSize(9);
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(380);
    obj.label38:setTop(5);
    obj.label38:setWidth(75);
    obj.label38:setHeight(20);
    obj.label38:setText("Mortal 0");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout5);
    obj.edit29:setLeft(380);
    obj.edit29:setTop(30);
    obj.edit29:setWidth(75);
    obj.edit29:setHeight(25);
    obj.edit29:setField("dano3");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(380);
    obj.label39:setTop(55);
    obj.label39:setWidth(75);
    obj.label39:setHeight(20);
    obj.label39:setText("Atordoamento 3");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(9);
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(455);
    obj.label40:setTop(5);
    obj.label40:setWidth(75);
    obj.label40:setHeight(20);
    obj.label40:setText("Mortal -1");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout5);
    obj.edit30:setLeft(455);
    obj.edit30:setTop(30);
    obj.edit30:setWidth(75);
    obj.edit30:setHeight(25);
    obj.edit30:setField("dano4");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(455);
    obj.label41:setTop(55);
    obj.label41:setWidth(75);
    obj.label41:setHeight(20);
    obj.label41:setText("Atordoamento 4");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setFontSize(9);
    obj.label41:setName("label41");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setTop(100);
    obj.layout6:setWidth(535);
    obj.layout6:setHeight(75);
    obj.layout6:setName("layout6");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(155);
    obj.label42:setTop(5);
    obj.label42:setWidth(75);
    obj.label42:setHeight(20);
    obj.label42:setText("Mortal -2");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout6);
    obj.edit31:setLeft(155);
    obj.edit31:setTop(30);
    obj.edit31:setWidth(75);
    obj.edit31:setHeight(25);
    obj.edit31:setField("dano5");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout6);
    obj.label43:setLeft(155);
    obj.label43:setTop(55);
    obj.label43:setWidth(75);
    obj.label43:setHeight(20);
    obj.label43:setText("Atordoamento 5");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setFontSize(9);
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout6);
    obj.label44:setLeft(230);
    obj.label44:setTop(5);
    obj.label44:setWidth(75);
    obj.label44:setHeight(20);
    obj.label44:setText("Mortal -3");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout6);
    obj.edit32:setLeft(230);
    obj.edit32:setTop(30);
    obj.edit32:setWidth(75);
    obj.edit32:setHeight(25);
    obj.edit32:setField("dano6");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout6);
    obj.label45:setLeft(230);
    obj.label45:setTop(55);
    obj.label45:setWidth(75);
    obj.label45:setHeight(20);
    obj.label45:setText("Atordoamento 6");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setFontSize(9);
    obj.label45:setName("label45");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout6);
    obj.label46:setLeft(305);
    obj.label46:setTop(5);
    obj.label46:setWidth(75);
    obj.label46:setHeight(20);
    obj.label46:setText("Mortal -4");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout6);
    obj.edit33:setLeft(305);
    obj.edit33:setTop(30);
    obj.edit33:setWidth(75);
    obj.edit33:setHeight(25);
    obj.edit33:setField("dano7");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout6);
    obj.label47:setLeft(305);
    obj.label47:setTop(55);
    obj.label47:setWidth(75);
    obj.label47:setHeight(20);
    obj.label47:setText("Atordoamento 7");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(9);
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout6);
    obj.label48:setLeft(380);
    obj.label48:setTop(5);
    obj.label48:setWidth(75);
    obj.label48:setHeight(20);
    obj.label48:setText("Mortal -5");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout6);
    obj.edit34:setLeft(380);
    obj.edit34:setTop(30);
    obj.edit34:setWidth(75);
    obj.edit34:setHeight(25);
    obj.edit34:setField("dano8");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(380);
    obj.label49:setTop(55);
    obj.label49:setWidth(75);
    obj.label49:setHeight(20);
    obj.label49:setText("Atordoamento 8");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setFontSize(9);
    obj.label49:setName("label49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(455);
    obj.label50:setTop(5);
    obj.label50:setWidth(75);
    obj.label50:setHeight(20);
    obj.label50:setText("Mortal -6");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout6);
    obj.edit35:setLeft(455);
    obj.edit35:setTop(30);
    obj.edit35:setWidth(75);
    obj.edit35:setHeight(25);
    obj.edit35:setField("dano9");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setLeft(455);
    obj.label51:setTop(55);
    obj.label51:setWidth(75);
    obj.label51:setHeight(20);
    obj.label51:setText("Atordoamento 9");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(9);
    obj.label51:setName("label51");

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

	


    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.frmSkills);
    obj.dataLink1:setFields({'atratividade', 'tipoCorporal', 'autocontrole', 'reflexos', 'tecnica', 'inteligencia', 'empatia'});
    obj.dataLink1:setName("dataLink1");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSkills);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox2);
    obj.rectangle7:setColor("#FF000000");
    obj.rectangle7:setWidth(1363);
    obj.rectangle7:setHeight(686);
    obj.rectangle7:setName("rectangle7");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox2);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(830);
    obj.layout7:setHeight(685);
    obj.layout7:setName("layout7");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout7);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout7);
    obj.label52:setText("NOME DA PERÍCIA");
    obj.label52:setLeft(20);
    obj.label52:setTop(1);
    obj.label52:setWidth(135);
    obj.label52:setHeight(20);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout7);
    obj.label53:setText("CHAVE");
    obj.label53:setLeft(165);
    obj.label53:setTop(1);
    obj.label53:setWidth(60);
    obj.label53:setHeight(20);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout7);
    obj.label54:setText("TOTAL");
    obj.label54:setLeft(245);
    obj.label54:setTop(1);
    obj.label54:setWidth(40);
    obj.label54:setHeight(20);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout7);
    obj.label55:setText("ATR");
    obj.label55:setLeft(285);
    obj.label55:setTop(1);
    obj.label55:setWidth(33);
    obj.label55:setHeight(20);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout7);
    obj.label56:setText("PTS");
    obj.label56:setLeft(320);
    obj.label56:setTop(1);
    obj.label56:setWidth(40);
    obj.label56:setHeight(20);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout7);
    obj.label57:setText("NOME DA PERÍCIA");
    obj.label57:setLeft(415);
    obj.label57:setTop(1);
    obj.label57:setWidth(135);
    obj.label57:setHeight(20);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout7);
    obj.label58:setText("CHAVE");
    obj.label58:setLeft(560);
    obj.label58:setTop(1);
    obj.label58:setWidth(60);
    obj.label58:setHeight(20);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout7);
    obj.label59:setText("TOTAL");
    obj.label59:setLeft(640);
    obj.label59:setTop(1);
    obj.label59:setWidth(40);
    obj.label59:setHeight(20);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setText("ATR");
    obj.label60:setLeft(680);
    obj.label60:setTop(1);
    obj.label60:setWidth(33);
    obj.label60:setHeight(20);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout7);
    obj.label61:setText("PTS");
    obj.label61:setLeft(715);
    obj.label61:setTop(1);
    obj.label61:setWidth(40);
    obj.label61:setHeight(20);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rclListaDasPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout7);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmSkillItem");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(820);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox2);
    obj.button1:setText("Nova Perícia");
    obj.button1:setLeft(840);
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

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox3);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(360);
    obj.layout8:setHeight(685);
    obj.layout8:setName("layout8");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout8);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout8);
    obj.label62:setText("ITEM");
    obj.label62:setLeft(5);
    obj.label62:setTop(1);
    obj.label62:setWidth(150);
    obj.label62:setHeight(20);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout8);
    obj.label63:setText("QTD");
    obj.label63:setLeft(155);
    obj.label63:setTop(1);
    obj.label63:setWidth(50);
    obj.label63:setHeight(20);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout8);
    obj.label64:setText("PREÇO");
    obj.label64:setLeft(205);
    obj.label64:setTop(1);
    obj.label64:setWidth(50);
    obj.label64:setHeight(20);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout8);
    obj.label65:setText("PESO");
    obj.label65:setLeft(255);
    obj.label65:setTop(1);
    obj.label65:setWidth(50);
    obj.label65:setHeight(20);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout8);
    obj.button2:setText("+");
    obj.button2:setLeft(305);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.rclInventory = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventory:setParent(obj.layout8);
    obj.rclInventory:setName("rclInventory");
    obj.rclInventory:setField("inventoryList");
    obj.rclInventory:setTemplateForm("frmInventoryItem");
    obj.rclInventory:setLeft(5);
    obj.rclInventory:setTop(25);
    obj.rclInventory:setWidth(350);
    obj.rclInventory:setHeight(650);
    obj.rclInventory:setLayout("vertical");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox3);
    obj.layout9:setLeft(370);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(760);
    obj.layout9:setHeight(335);
    obj.layout9:setName("layout9");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout9);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout9);
    obj.label66:setText("ARMA");
    obj.label66:setLeft(5);
    obj.label66:setTop(1);
    obj.label66:setWidth(150);
    obj.label66:setHeight(20);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout9);
    obj.label67:setText("TIPO");
    obj.label67:setLeft(155);
    obj.label67:setTop(1);
    obj.label67:setWidth(50);
    obj.label67:setHeight(20);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout9);
    obj.label68:setText("PRECISÃO");
    obj.label68:setLeft(205);
    obj.label68:setTop(1);
    obj.label68:setWidth(50);
    obj.label68:setHeight(20);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontSize(11);
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout9);
    obj.label69:setText("OCULT.");
    obj.label69:setLeft(255);
    obj.label69:setTop(1);
    obj.label69:setWidth(50);
    obj.label69:setHeight(20);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setFontSize(12);
    obj.label69:setName("label69");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout9);
    obj.label70:setText("DISP.");
    obj.label70:setLeft(305);
    obj.label70:setTop(1);
    obj.label70:setWidth(50);
    obj.label70:setHeight(20);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout9);
    obj.label71:setText("DANO");
    obj.label71:setLeft(355);
    obj.label71:setTop(1);
    obj.label71:setWidth(50);
    obj.label71:setHeight(20);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout9);
    obj.label72:setText("Nº DISP.");
    obj.label72:setLeft(405);
    obj.label72:setTop(1);
    obj.label72:setWidth(50);
    obj.label72:setHeight(20);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontSize(11);
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout9);
    obj.label73:setText("CD TIRO");
    obj.label73:setLeft(455);
    obj.label73:setTop(1);
    obj.label73:setWidth(50);
    obj.label73:setHeight(20);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setFontSize(11);
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setText("CONF.");
    obj.label74:setLeft(505);
    obj.label74:setTop(1);
    obj.label74:setWidth(50);
    obj.label74:setHeight(20);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setText("ALCANCE");
    obj.label75:setLeft(555);
    obj.label75:setTop(1);
    obj.label75:setWidth(50);
    obj.label75:setHeight(20);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setFontSize(11);
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setText("PREÇO");
    obj.label76:setLeft(605);
    obj.label76:setTop(1);
    obj.label76:setWidth(50);
    obj.label76:setHeight(20);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setText("PESO");
    obj.label77:setLeft(655);
    obj.label77:setTop(1);
    obj.label77:setWidth(50);
    obj.label77:setHeight(20);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout9);
    obj.button3:setText("+");
    obj.button3:setLeft(705);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.rclInventoryWeapon = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryWeapon:setParent(obj.layout9);
    obj.rclInventoryWeapon:setName("rclInventoryWeapon");
    obj.rclInventoryWeapon:setField("weaponList");
    obj.rclInventoryWeapon:setTemplateForm("frmInventoryWeapon");
    obj.rclInventoryWeapon:setLeft(5);
    obj.rclInventoryWeapon:setTop(25);
    obj.rclInventoryWeapon:setWidth(750);
    obj.rclInventoryWeapon:setHeight(300);
    obj.rclInventoryWeapon:setLayout("vertical");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox3);
    obj.layout10:setLeft(370);
    obj.layout10:setTop(345);
    obj.layout10:setWidth(760);
    obj.layout10:setHeight(335);
    obj.layout10:setName("layout10");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout10);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout10);
    obj.label78:setText("ARMADURA");
    obj.label78:setLeft(5);
    obj.label78:setTop(1);
    obj.label78:setWidth(150);
    obj.label78:setHeight(20);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout10);
    obj.label79:setText("CABEÇA");
    obj.label79:setLeft(155);
    obj.label79:setTop(1);
    obj.label79:setWidth(50);
    obj.label79:setHeight(20);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout10);
    obj.label80:setText("TORSO");
    obj.label80:setLeft(205);
    obj.label80:setTop(1);
    obj.label80:setWidth(50);
    obj.label80:setHeight(20);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout10);
    obj.label81:setText("BRAÇO D");
    obj.label81:setLeft(255);
    obj.label81:setTop(1);
    obj.label81:setWidth(50);
    obj.label81:setHeight(20);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setFontSize(11);
    obj.label81:setName("label81");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setText("BRAÇO E");
    obj.label82:setLeft(305);
    obj.label82:setTop(1);
    obj.label82:setWidth(50);
    obj.label82:setHeight(20);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setFontSize(11);
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setText("PERNA D");
    obj.label83:setLeft(355);
    obj.label83:setTop(1);
    obj.label83:setWidth(50);
    obj.label83:setHeight(20);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontSize(11);
    obj.label83:setName("label83");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout10);
    obj.label84:setText("PERNA E");
    obj.label84:setLeft(405);
    obj.label84:setTop(1);
    obj.label84:setWidth(50);
    obj.label84:setHeight(20);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontSize(11);
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setText("DETALHES");
    obj.label85:setLeft(455);
    obj.label85:setTop(1);
    obj.label85:setWidth(150);
    obj.label85:setHeight(20);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setText("PREÇO");
    obj.label86:setLeft(605);
    obj.label86:setTop(1);
    obj.label86:setWidth(50);
    obj.label86:setHeight(20);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setText("PESO");
    obj.label87:setLeft(655);
    obj.label87:setTop(1);
    obj.label87:setWidth(50);
    obj.label87:setHeight(20);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setText("+");
    obj.button4:setLeft(705);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setName("button4");

    obj.rclInventoryArmor = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryArmor:setParent(obj.layout10);
    obj.rclInventoryArmor:setName("rclInventoryArmor");
    obj.rclInventoryArmor:setField("armorList");
    obj.rclInventoryArmor:setTemplateForm("frmInventoryArmor");
    obj.rclInventoryArmor:setLeft(5);
    obj.rclInventoryArmor:setTop(25);
    obj.rclInventoryArmor:setWidth(750);
    obj.rclInventoryArmor:setHeight(300);
    obj.rclInventoryArmor:setLayout("vertical");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrição");
    obj.tab4:setName("tab4");

    obj.frmTemplateDescription = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab4);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateDescription);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox4);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(1205);
    obj.rectangle12:setHeight(105);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle12);
    obj.label88:setLeft(3);
    obj.label88:setTop(1);
    obj.label88:setWidth(100);
    obj.label88:setHeight(20);
    obj.label88:setText("DESCRIÇÃO");
    obj.label88:setName("label88");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle12);
    obj.label89:setLeft(10);
    obj.label89:setTop(25);
    obj.label89:setWidth(90);
    obj.label89:setHeight(20);
    obj.label89:setText("TAMANHO");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle12);
    obj.edit36:setLeft(100);
    obj.edit36:setTop(25);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setField("tamanho");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle12);
    obj.label90:setLeft(10);
    obj.label90:setTop(50);
    obj.label90:setWidth(90);
    obj.label90:setHeight(20);
    obj.label90:setText("ALTURA");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle12);
    obj.edit37:setLeft(100);
    obj.edit37:setTop(50);
    obj.edit37:setWidth(200);
    obj.edit37:setHeight(25);
    obj.edit37:setField("altura");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle12);
    obj.label91:setLeft(10);
    obj.label91:setTop(75);
    obj.label91:setWidth(90);
    obj.label91:setHeight(20);
    obj.label91:setText("PESO");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle12);
    obj.edit38:setLeft(100);
    obj.edit38:setTop(75);
    obj.edit38:setWidth(200);
    obj.edit38:setHeight(25);
    obj.edit38:setField("peso");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle12);
    obj.label92:setLeft(310);
    obj.label92:setTop(25);
    obj.label92:setWidth(90);
    obj.label92:setHeight(20);
    obj.label92:setText("IDADE");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle12);
    obj.edit39:setLeft(400);
    obj.edit39:setTop(25);
    obj.edit39:setWidth(200);
    obj.edit39:setHeight(25);
    obj.edit39:setField("idade");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle12);
    obj.label93:setLeft(310);
    obj.label93:setTop(50);
    obj.label93:setWidth(90);
    obj.label93:setHeight(20);
    obj.label93:setText("SEXO");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle12);
    obj.edit40:setLeft(400);
    obj.edit40:setTop(50);
    obj.edit40:setWidth(200);
    obj.edit40:setHeight(25);
    obj.edit40:setField("sexo");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setName("edit40");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle12);
    obj.label94:setLeft(310);
    obj.label94:setTop(75);
    obj.label94:setWidth(90);
    obj.label94:setHeight(20);
    obj.label94:setText("OUTROS");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle12);
    obj.edit41:setLeft(400);
    obj.edit41:setTop(75);
    obj.edit41:setWidth(200);
    obj.edit41:setHeight(25);
    obj.edit41:setField("aparenciaOutros");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle12);
    obj.label95:setLeft(610);
    obj.label95:setTop(25);
    obj.label95:setWidth(90);
    obj.label95:setHeight(20);
    obj.label95:setText("OLHOS");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle12);
    obj.edit42:setLeft(700);
    obj.edit42:setTop(25);
    obj.edit42:setWidth(200);
    obj.edit42:setHeight(25);
    obj.edit42:setField("aparenciaOlhos");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setName("edit42");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle12);
    obj.label96:setLeft(610);
    obj.label96:setTop(50);
    obj.label96:setWidth(90);
    obj.label96:setHeight(20);
    obj.label96:setText("PELE");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle12);
    obj.edit43:setLeft(700);
    obj.edit43:setTop(50);
    obj.edit43:setWidth(200);
    obj.edit43:setHeight(25);
    obj.edit43:setField("pele");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setName("edit43");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle12);
    obj.label97:setLeft(610);
    obj.label97:setTop(75);
    obj.label97:setWidth(90);
    obj.label97:setHeight(20);
    obj.label97:setText("CABELO");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle12);
    obj.edit44:setLeft(700);
    obj.edit44:setTop(75);
    obj.edit44:setWidth(200);
    obj.edit44:setHeight(25);
    obj.edit44:setField("cabelo");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setName("edit44");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle12);
    obj.label98:setLeft(910);
    obj.label98:setTop(25);
    obj.label98:setWidth(90);
    obj.label98:setHeight(20);
    obj.label98:setText("MARCAS");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle12);
    obj.edit45:setLeft(1000);
    obj.edit45:setTop(25);
    obj.edit45:setWidth(200);
    obj.edit45:setHeight(25);
    obj.edit45:setField("marcas");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle12);
    obj.label99:setLeft(910);
    obj.label99:setTop(50);
    obj.label99:setWidth(90);
    obj.label99:setHeight(20);
    obj.label99:setText("VESTUARIO");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle12);
    obj.edit46:setLeft(1000);
    obj.edit46:setTop(50);
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(25);
    obj.edit46:setField("vestuario");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setName("edit46");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle12);
    obj.label100:setLeft(910);
    obj.label100:setTop(75);
    obj.label100:setWidth(90);
    obj.label100:setHeight(20);
    obj.label100:setText("ANTECEDENTE");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle12);
    obj.edit47:setLeft(1000);
    obj.edit47:setTop(75);
    obj.edit47:setWidth(200);
    obj.edit47:setHeight(25);
    obj.edit47:setField("antecedente");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setName("edit47");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox4);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(375);
    obj.layout11:setHeight(140);
    obj.layout11:setName("layout11");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout11);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout11);
    obj.label101:setLeft(5);
    obj.label101:setTop(1);
    obj.label101:setWidth(100);
    obj.label101:setHeight(20);
    obj.label101:setText("APARÊNCIA");
    obj.label101:setName("label101");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout11);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox4);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(255);
    obj.layout12:setWidth(375);
    obj.layout12:setHeight(140);
    obj.layout12:setName("layout12");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout12);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout12);
    obj.label102:setLeft(5);
    obj.label102:setTop(1);
    obj.label102:setWidth(100);
    obj.label102:setHeight(20);
    obj.label102:setText("PERSONALIDADE");
    obj.label102:setName("label102");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout12);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(100);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox4);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(400);
    obj.layout13:setWidth(375);
    obj.layout13:setHeight(140);
    obj.layout13:setName("layout13");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout13);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout13);
    obj.label103:setLeft(5);
    obj.label103:setTop(1);
    obj.label103:setWidth(100);
    obj.label103:setHeight(20);
    obj.label103:setText("IDIOMAS");
    obj.label103:setName("label103");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout13);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(365);
    obj.textEditor3:setHeight(100);
    obj.textEditor3:setField("idiomas");
    obj.textEditor3:setName("textEditor3");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox4);
    obj.layout14:setLeft(380);
    obj.layout14:setTop(110);
    obj.layout14:setWidth(825);
    obj.layout14:setHeight(495);
    obj.layout14:setName("layout14");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout14);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout14);
    obj.label104:setLeft(5);
    obj.label104:setTop(1);
    obj.label104:setWidth(100);
    obj.label104:setHeight(20);
    obj.label104:setText("HISTORIA");
    obj.label104:setName("label104");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout14);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmTemplateNotes = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab5);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateNotes);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox5);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(0);
    obj.layout15:setWidth(400);
    obj.layout15:setHeight(580);
    obj.layout15:setName("layout15");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout15);
    obj.rectangle17:setLeft(0);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(400);
    obj.rectangle17:setHeight(580);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(15);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout15);
    obj.label105:setLeft(0);
    obj.label105:setTop(0);
    obj.label105:setWidth(400);
    obj.label105:setHeight(20);
    obj.label105:setText("Anotações");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout15);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes1");
    obj.textEditor4:setName("textEditor4");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox5);
    obj.layout16:setLeft(410);
    obj.layout16:setTop(0);
    obj.layout16:setWidth(400);
    obj.layout16:setHeight(580);
    obj.layout16:setName("layout16");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout16);
    obj.rectangle18:setLeft(0);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(400);
    obj.rectangle18:setHeight(580);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(15);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout16);
    obj.label106:setLeft(0);
    obj.label106:setTop(0);
    obj.label106:setWidth(400);
    obj.label106:setHeight(20);
    obj.label106:setText("Anotações");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout16);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes2");
    obj.textEditor5:setName("textEditor5");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox5);
    obj.layout17:setLeft(820);
    obj.layout17:setTop(0);
    obj.layout17:setWidth(400);
    obj.layout17:setHeight(580);
    obj.layout17:setName("layout17");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout17);
    obj.rectangle19:setLeft(0);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(400);
    obj.rectangle19:setHeight(580);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(15);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout17);
    obj.label107:setLeft(0);
    obj.label107:setTop(0);
    obj.label107:setWidth(400);
    obj.label107:setHeight(20);
    obj.label107:setText("Anotações");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout17);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(540);
    obj.textEditor6:setField("anotacoes3");
    obj.textEditor6:setName("textEditor6");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateCreditos);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(125);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Cyberpunk2020/images/cyberpunk.png");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Cyberpunk2020/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox6);
    obj.layout18:setLeft(850);
    obj.layout18:setTop(0);
    obj.layout18:setWidth(200);
    obj.layout18:setHeight(160);
    obj.layout18:setName("layout18");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout18);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(15);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout18);
    obj.label108:setLeft(0);
    obj.label108:setTop(10);
    obj.label108:setWidth(200);
    obj.label108:setHeight(20);
    obj.label108:setText("Programador: Vinny (Ambesek)");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout18);
    obj.label109:setLeft(0);
    obj.label109:setTop(35);
    obj.label109:setWidth(200);
    obj.label109:setHeight(20);
    obj.label109:setText("Consultor: francinha87");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.scrollBox6);
    obj.label110:setLeft(555);
    obj.label110:setTop(300);
    obj.label110:setWidth(100);
    obj.label110:setHeight(20);
    obj.label110:setText("Versão Atual: ");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox6);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/release.png");
    obj.image4:setName("image4");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.scrollBox6);
    obj.label111:setLeft(555);
    obj.label111:setTop(325);
    obj.label111:setWidth(100);
    obj.label111:setHeight(20);
    obj.label111:setText("Sua Versão: ");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image5:setName("image5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox6);
    obj.button5:setLeft(555);
    obj.button5:setTop(350);
    obj.button5:setWidth(100);
    obj.button5:setText("Change Log");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox6);
    obj.button6:setLeft(667);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.scrollBox6);
    obj.label112:setLeft(555);
    obj.label112:setTop(400);
    obj.label112:setWidth(200);
    obj.label112:setHeight(20);
    obj.label112:setText("Conheça as Mesas:");
    obj.label112:setName("label112");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox6);
    obj.button7:setLeft(555);
    obj.button7:setTop(425);
    obj.button7:setWidth(100);
    obj.button7:setText("RPGmeister");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox6);
    obj.button8:setLeft(667);
    obj.button8:setTop(425);
    obj.button8:setWidth(125);
    obj.button8:setText("Nova York 1920");
    obj.button8:setName("button8");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj);
    obj.image6:setAlign("client");
    obj.image6:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/root.png");
    obj.image6:setStyle("stretch");
    obj.image6:setName("image6");

    obj._e_event0 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
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

    obj._e_event2 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if utils.compareStringPtBr(nodeA.atributo, nodeB.atributo)== 0 then
            						return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            					else 
            		            	return utils.compareStringPtBr(nodeA.atributo, nodeB.atributo);
            		            end;
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclInventory:append();
        end, obj);

    obj._e_event5 = obj.rclInventory:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclInventoryWeapon:append();
        end, obj);

    obj._e_event7 = obj.rclInventoryWeapon:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclInventoryArmor:append();
        end, obj);

    obj._e_event9 = obj.rclInventoryArmor:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event10 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Cyberpunk%202020/README.md')
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Cyberpunk%202020/Ficha%20Cyberpunk%202020.rpk')
        end, obj);

    obj._e_event12 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event13 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=77684');
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.rclInventoryArmor ~= nil then self.rclInventoryArmor:destroy(); self.rclInventoryArmor = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclInventoryWeapon ~= nil then self.rclInventoryWeapon:destroy(); self.rclInventoryWeapon = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
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
