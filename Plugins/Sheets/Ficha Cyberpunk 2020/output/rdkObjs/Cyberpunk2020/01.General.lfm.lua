require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGeneral()
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
    obj:setName("frmGeneral");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGeneral = {
    newEditor = newfrmGeneral, 
    new = newfrmGeneral, 
    name = "frmGeneral", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneral = _frmGeneral;
rrpg.registrarForm(_frmGeneral);

return _frmGeneral;
