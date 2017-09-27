require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister7_svg()
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
    obj:setName("frmFichaRPGmeister7_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(475);
    obj.layout1:setHeight(330);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(30);
    obj.label1:setTop(5);
    obj.label1:setWidth(435);
    obj.label1:setHeight(20);
    obj.label1:setText("ARMAS E ESCUDOS                                     Kg         $");
    obj.label1:setName("label1");

    obj.rclListaDasArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasArmas:setParent(obj.layout1);
    obj.rclListaDasArmas:setName("rclListaDasArmas");
    obj.rclListaDasArmas:setField("campoDasArmas");
    obj.rclListaDasArmas:setTemplateForm("frmFichaRPGmeister7A_svg");
    obj.rclListaDasArmas:setLeft(5);
    obj.rclListaDasArmas:setTop(25);
    obj.rclListaDasArmas:setWidth(465);
    obj.rclListaDasArmas:setHeight(275);
    obj.rclListaDasArmas:setLayout("vertical");
    obj.rclListaDasArmas:setMinQt(1);

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(260);
    obj.label2:setTop(305);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setText("Kg");
    obj.label2:setName("label2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(280);
    obj.rectangle2:setTop(305);
    obj.rectangle2:setWidth(70);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setLeft(280);
    obj.label3:setTop(305);
    obj.label3:setWidth(70);
    obj.label3:setHeight(20);
    obj.label3:setField("pesoArmas");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(360);
    obj.label4:setTop(305);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("$");
    obj.label4:setName("label4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(375);
    obj.rectangle3:setTop(305);
    obj.rectangle3:setWidth(91);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setLeft(375);
    obj.label5:setTop(305);
    obj.label5:setWidth(91);
    obj.label5:setHeight(20);
    obj.label5:setField("precoArmas");
    obj.label5:setName("label5");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(335);
    obj.layout2:setWidth(475);
    obj.layout2:setHeight(335);
    obj.layout2:setName("layout2");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(5);
    obj.label6:setTop(1);
    obj.label6:setWidth(200);
    obj.label6:setHeight(20);
    obj.label6:setText("MOCHILA");
    obj.label6:setName("label6");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(465);
    obj.textEditor1:setHeight(280);
    obj.textEditor1:setField("mochila");
    obj.textEditor1:setName("textEditor1");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(280);
    obj.label7:setTop(310);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Kg");
    obj.label7:setName("label7");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setLeft(300);
    obj.edit1:setTop(310);
    obj.edit1:setWidth(70);
    obj.edit1:setHeight(20);
    obj.edit1:setField("pesoMochila");
    obj.edit1:setName("edit1");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(380);
    obj.label8:setTop(310);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("$");
    obj.label8:setName("label8");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(395);
    obj.edit2:setTop(310);
    obj.edit2:setWidth(71);
    obj.edit2:setHeight(20);
    obj.edit2:setField("precoMochila");
    obj.edit2:setName("edit2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(480);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(220);
    obj.layout3:setName("layout3");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(5);
    obj.label9:setTop(1);
    obj.label9:setWidth(150);
    obj.label9:setHeight(20);
    obj.label9:setText("PERMANENCIAS");
    obj.label9:setName("label9");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout3);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(190);
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setField("permanencias");
    obj.textEditor2:setName("textEditor2");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(5);
    obj.label10:setTop(195);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("Kg");
    obj.label10:setName("label10");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(25);
    obj.edit3:setTop(195);
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(20);
    obj.edit3:setField("pesoPermanencias");
    obj.edit3:setName("edit3");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(105);
    obj.label11:setTop(195);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("$");
    obj.label11:setName("label11");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setLeft(120);
    obj.edit4:setTop(195);
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(20);
    obj.edit4:setField("precoPermanencias");
    obj.edit4:setName("edit4");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(685);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(220);
    obj.layout4:setName("layout4");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setLeft(5);
    obj.label12:setTop(1);
    obj.label12:setWidth(150);
    obj.label12:setHeight(20);
    obj.label12:setText("LIVRES");
    obj.label12:setName("label12");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(190);
    obj.textEditor3:setHeight(165);
    obj.textEditor3:setField("livres");
    obj.textEditor3:setName("textEditor3");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setLeft(5);
    obj.label13:setTop(195);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setText("Kg");
    obj.label13:setName("label13");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(25);
    obj.edit5:setTop(195);
    obj.edit5:setWidth(70);
    obj.edit5:setHeight(20);
    obj.edit5:setField("pesoLivres");
    obj.edit5:setName("edit5");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setLeft(105);
    obj.label14:setTop(195);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("$");
    obj.label14:setName("label14");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(120);
    obj.edit6:setTop(195);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(20);
    obj.edit6:setField("precoLivres");
    obj.edit6:setName("edit6");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(480);
    obj.layout5:setTop(225);
    obj.layout5:setWidth(200);
    obj.layout5:setHeight(220);
    obj.layout5:setName("layout5");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout5);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout5);
    obj.label15:setLeft(5);
    obj.label15:setTop(1);
    obj.label15:setWidth(150);
    obj.label15:setHeight(20);
    obj.label15:setText("OUTROS");
    obj.label15:setName("label15");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout5);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(190);
    obj.textEditor4:setHeight(165);
    obj.textEditor4:setField("outros");
    obj.textEditor4:setName("textEditor4");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout5);
    obj.label16:setLeft(5);
    obj.label16:setTop(195);
    obj.label16:setWidth(50);
    obj.label16:setHeight(20);
    obj.label16:setText("Kg");
    obj.label16:setName("label16");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(25);
    obj.edit7:setTop(195);
    obj.edit7:setWidth(70);
    obj.edit7:setHeight(20);
    obj.edit7:setField("pesoOutros");
    obj.edit7:setName("edit7");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout5);
    obj.label17:setLeft(105);
    obj.label17:setTop(195);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("$");
    obj.label17:setName("label17");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(120);
    obj.edit8:setTop(195);
    obj.edit8:setWidth(70);
    obj.edit8:setHeight(20);
    obj.edit8:setField("precoOutros");
    obj.edit8:setName("edit8");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(685);
    obj.layout6:setTop(225);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(220);
    obj.layout6:setName("layout6");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout6);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout6);
    obj.label18:setLeft(5);
    obj.label18:setTop(1);
    obj.label18:setWidth(150);
    obj.label18:setHeight(20);
    obj.label18:setText("MUNIÇÕES");
    obj.label18:setName("label18");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout6);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(190);
    obj.textEditor5:setHeight(165);
    obj.textEditor5:setField("municoes");
    obj.textEditor5:setName("textEditor5");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout6);
    obj.label19:setLeft(5);
    obj.label19:setTop(195);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setText("Kg");
    obj.label19:setName("label19");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(25);
    obj.edit9:setTop(195);
    obj.edit9:setWidth(70);
    obj.edit9:setHeight(20);
    obj.edit9:setField("pesoMunicoes");
    obj.edit9:setName("edit9");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout6);
    obj.label20:setLeft(105);
    obj.label20:setTop(195);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("$");
    obj.label20:setName("label20");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setLeft(120);
    obj.edit10:setTop(195);
    obj.edit10:setWidth(70);
    obj.edit10:setHeight(20);
    obj.edit10:setField("precoMunicoes");
    obj.edit10:setName("edit10");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(480);
    obj.layout7:setTop(450);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(221);
    obj.layout7:setName("layout7");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout7);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout7);
    obj.label21:setLeft(5);
    obj.label21:setTop(1);
    obj.label21:setWidth(150);
    obj.label21:setHeight(20);
    obj.label21:setText("BOLSOS");
    obj.label21:setName("label21");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout7);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(190);
    obj.textEditor6:setHeight(165);
    obj.textEditor6:setField("bolsos");
    obj.textEditor6:setName("textEditor6");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout7);
    obj.label22:setLeft(5);
    obj.label22:setTop(195);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setText("Kg");
    obj.label22:setName("label22");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setLeft(25);
    obj.edit11:setTop(195);
    obj.edit11:setWidth(70);
    obj.edit11:setHeight(20);
    obj.edit11:setField("pesoBolsos");
    obj.edit11:setName("edit11");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout7);
    obj.label23:setLeft(105);
    obj.label23:setTop(195);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("$");
    obj.label23:setName("label23");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout7);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setLeft(120);
    obj.edit12:setTop(195);
    obj.edit12:setWidth(70);
    obj.edit12:setHeight(20);
    obj.edit12:setField("precoBolsos");
    obj.edit12:setName("edit12");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(685);
    obj.layout8:setTop(450);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(221);
    obj.layout8:setName("layout8");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout8);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout8);
    obj.label24:setLeft(5);
    obj.label24:setTop(1);
    obj.label24:setWidth(150);
    obj.label24:setHeight(20);
    obj.label24:setText("IMOVEIS");
    obj.label24:setName("label24");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout8);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(190);
    obj.textEditor7:setHeight(165);
    obj.textEditor7:setField("moveis");
    obj.textEditor7:setName("textEditor7");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout8);
    obj.label25:setLeft(5);
    obj.label25:setTop(195);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("Kg");
    obj.label25:setName("label25");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout8);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setLeft(25);
    obj.edit13:setTop(195);
    obj.edit13:setWidth(70);
    obj.edit13:setHeight(20);
    obj.edit13:setField("pesoImoveis");
    obj.edit13:setName("edit13");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout8);
    obj.label26:setLeft(105);
    obj.label26:setTop(195);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setText("$");
    obj.label26:setName("label26");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout8);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setLeft(120);
    obj.edit14:setTop(195);
    obj.edit14:setWidth(70);
    obj.edit14:setHeight(20);
    obj.edit14:setField("precoImoveis");
    obj.edit14:setName("edit14");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox1);
    obj.layout9:setLeft(890);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(315);
    obj.layout9:setHeight(480);
    obj.layout9:setName("layout9");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout9);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("#0000007F");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setHeight(20);
    obj.button2:setWidth(305);
    obj.button2:setText("Novo Item");
    obj.button2:setName("button2");

    obj.rclConsumiveis = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclConsumiveis:setParent(obj.layout9);
    obj.rclConsumiveis:setLeft(5);
    obj.rclConsumiveis:setTop(30);
    obj.rclConsumiveis:setWidth(305);
    obj.rclConsumiveis:setHeight(445);
    obj.rclConsumiveis:setName("rclConsumiveis");
    obj.rclConsumiveis:setField("itensConsumiveis");
    obj.rclConsumiveis:setTemplateForm("frmConsumiveis");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(890);
    obj.layout10:setTop(485);
    obj.layout10:setWidth(155);
    obj.layout10:setHeight(185);
    obj.layout10:setName("layout10");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout10);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout10);
    obj.label27:setLeft(5);
    obj.label27:setTop(1);
    obj.label27:setWidth(200);
    obj.label27:setHeight(20);
    obj.label27:setText("DINHEIRO");
    obj.label27:setName("label27");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout10);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(145);
    obj.textEditor8:setHeight(130);
    obj.textEditor8:setField("dinheiro");
    obj.textEditor8:setName("textEditor8");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout10);
    obj.label28:setLeft(10);
    obj.label28:setTop(160);
    obj.label28:setWidth(50);
    obj.label28:setHeight(20);
    obj.label28:setText("GASTOS");
    obj.label28:setName("label28");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout10);
    obj.rectangle13:setLeft(65);
    obj.rectangle13:setTop(160);
    obj.rectangle13:setWidth(85);
    obj.rectangle13:setHeight(20);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout10);
    obj.label29:setField("gastos");
    obj.label29:setText("0");
    obj.label29:setLeft(65);
    obj.label29:setTop(160);
    obj.label29:setWidth(85);
    obj.label29:setHeight(20);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'precoCabeca', 'precoOlhos', 'precoPescoco', 'precoOmbros', 'precoTorso', 'precoCorpo', 'precoPunhos', 'precoCintura', 'precoMaos', 'precoDedosI', 'precoDesdosII', 'precoPes', 'precoArmas', 'precoMochila', 'precoPermanencias', 'precoLivres', 'precoOutros', 'precoMunicoes', 'precoBolsos', 'precoImoveis', 'precoInventorioComp', 'campoDosCompanheiros'});
    obj.dataLink1:setName("dataLink1");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setLeft(1050);
    obj.layout11:setTop(485);
    obj.layout11:setWidth(155);
    obj.layout11:setHeight(185);
    obj.layout11:setName("layout11");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout11);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout11);
    obj.label30:setLeft(5);
    obj.label30:setTop(1);
    obj.label30:setWidth(150);
    obj.label30:setHeight(20);
    obj.label30:setText("CARGA");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout11);
    obj.label31:setLeft(20);
    obj.label31:setTop(25);
    obj.label31:setWidth(50);
    obj.label31:setHeight(20);
    obj.label31:setText("LEVE");
    obj.label31:setName("label31");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout11);
    obj.rectangle15:setLeft(80);
    obj.rectangle15:setTop(25);
    obj.rectangle15:setWidth(70);
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout11);
    obj.label32:setLeft(80);
    obj.label32:setTop(25);
    obj.label32:setWidth(70);
    obj.label32:setHeight(20);
    obj.label32:setField("cargaLeve");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout11);
    obj.label33:setLeft(20);
    obj.label33:setTop(47);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("MÉDIA");
    obj.label33:setName("label33");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout11);
    obj.rectangle16:setLeft(80);
    obj.rectangle16:setTop(47);
    obj.rectangle16:setWidth(70);
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout11);
    obj.label34:setLeft(80);
    obj.label34:setTop(47);
    obj.label34:setWidth(70);
    obj.label34:setHeight(20);
    obj.label34:setField("cargaMedia");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout11);
    obj.label35:setLeft(20);
    obj.label35:setTop(69);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setText("PESADA");
    obj.label35:setName("label35");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout11);
    obj.rectangle17:setLeft(80);
    obj.rectangle17:setTop(69);
    obj.rectangle17:setWidth(70);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout11);
    obj.label36:setLeft(80);
    obj.label36:setTop(69);
    obj.label36:setWidth(70);
    obj.label36:setHeight(20);
    obj.label36:setField("cargaPesada");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout11);
    obj.rectangle18:setWidth(70);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setLeft(80);
    obj.rectangle18:setTop(91);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout11);
    obj.label37:setLeft(20);
    obj.label37:setTop(91);
    obj.label37:setWidth(50);
    obj.label37:setHeight(20);
    obj.label37:setText("ERGUER");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout11);
    obj.label38:setField("cargaErguer");
    obj.label38:setText("valor");
    obj.label38:setWidth(70);
    obj.label38:setHeight(20);
    obj.label38:setLeft(80);
    obj.label38:setTop(91);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout11);
    obj.rectangle19:setWidth(70);
    obj.rectangle19:setHeight(20);
    obj.rectangle19:setLeft(80);
    obj.rectangle19:setTop(113);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout11);
    obj.label39:setLeft(10);
    obj.label39:setTop(113);
    obj.label39:setWidth(70);
    obj.label39:setHeight(20);
    obj.label39:setText("EMPURRAR");
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout11);
    obj.label40:setField("cargaLevantar");
    obj.label40:setText("valor");
    obj.label40:setWidth(70);
    obj.label40:setHeight(20);
    obj.label40:setLeft(80);
    obj.label40:setTop(113);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setWidth(70);
    obj.rectangle20:setHeight(20);
    obj.rectangle20:setLeft(80);
    obj.rectangle20:setTop(135);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout11);
    obj.label41:setLeft(10);
    obj.label41:setTop(135);
    obj.label41:setWidth(65);
    obj.label41:setHeight(20);
    obj.label41:setText("LEVANTAR");
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout11);
    obj.label42:setField("cargaEmpurrar");
    obj.label42:setText("valor");
    obj.label42:setWidth(70);
    obj.label42:setHeight(20);
    obj.label42:setLeft(80);
    obj.label42:setTop(135);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setWidth(70);
    obj.rectangle21:setHeight(20);
    obj.rectangle21:setLeft(80);
    obj.rectangle21:setTop(160);
    obj.rectangle21:setColor("#404040");
    obj.rectangle21:setName("rectangle21");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout11);
    obj.label43:setLeft(20);
    obj.label43:setTop(160);
    obj.label43:setWidth(65);
    obj.label43:setHeight(20);
    obj.label43:setText("ATUAL");
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout11);
    obj.label44:setField("cargaAtual");
    obj.label44:setWidth(70);
    obj.label44:setHeight(20);
    obj.label44:setLeft(80);
    obj.label44:setTop(160);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontColor("white");
    obj.label44:setName("label44");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setField("cargaPesada");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setFields({'pesoCabeca', 'pesoOlhos', 'pesoPescoco', 'pesoOmbros', 'pesoTorso', 'pesoCorpo', 'pesoPunhos', 'pesoCintura', 'pesoMaos', 'pesoDedosI', 'pesoDesdosII', 'pesoPes', 'pesoArmas', 'pesoMochila', 'pesoPermanencias', 'pesoLivres', 'pesoOutros', 'pesoMunicoes', 'pesoBolsos', 'pesoImoveis', 'pesoInventorioComp'});
    obj.dataLink3:setName("dataLink3");

    obj.popArma = gui.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.scrollBox1);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(300);
    obj.popArma:setHeight(400);
    obj.popArma:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popArma);
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

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart1);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("NOME");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setHint("Se a arma possui um nome de batismo ponha ele aqui.");
    obj.label45:setHitTest(true);
    obj.label45:setName("label45");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart1);
    obj.edit15:setAlign("client");
    obj.edit15:setField("batismo");
    obj.edit15:setFontSize(12);
    obj.edit15:setName("edit15");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart2);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("ARMA");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setHint("Qual a arma? Espada Longa? Machado de Batalha? Arco Longo?");
    obj.label46:setHitTest(true);
    obj.label46:setName("label46");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart2);
    obj.edit16:setAlign("client");
    obj.edit16:setField("arma");
    obj.edit16:setFontSize(12);
    obj.edit16:setName("edit16");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart3);
    obj.label47:setAlign("top");
    obj.label47:setFontSize(10);
    obj.label47:setText("TAMANHO");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWordWrap(true);
    obj.label47:setTextTrimming("none");
    obj.label47:setAutoSize(true);
    obj.label47:setHint("Essa arma foi feita para um personagem de que tamanho? Médio? Pequeno? Grande?");
    obj.label47:setHitTest(true);
    obj.label47:setName("label47");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart3);
    obj.edit17:setAlign("client");
    obj.edit17:setField("tamanho");
    obj.edit17:setFontSize(12);
    obj.edit17:setName("edit17");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(90);
    obj.flowPart4:setMaxWidth(100);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart4);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("MATERIAL");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setHint("Essa arma foi feita de um material especial? Adamante? Prata?");
    obj.label48:setHitTest(true);
    obj.label48:setName("label48");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart4);
    obj.edit18:setAlign("client");
    obj.edit18:setField("material");
    obj.edit18:setFontSize(12);
    obj.edit18:setName("edit18");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart5);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("QUALIDADE");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setHint("Essa arma é Obra-Prima? +1? +2?");
    obj.label49:setHitTest(true);
    obj.label49:setName("label49");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart5);
    obj.edit19:setAlign("client");
    obj.edit19:setField("qualidade");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setName("edit19");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(90);
    obj.flowPart6:setMaxWidth(100);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart6);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(10);
    obj.label50:setText("CATEGORIA");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWordWrap(true);
    obj.label50:setTextTrimming("none");
    obj.label50:setAutoSize(true);
    obj.label50:setHint("Essa arma é Simples? Comum? Exotica?");
    obj.label50:setHitTest(true);
    obj.label50:setName("label50");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart6);
    obj.edit20:setAlign("client");
    obj.edit20:setField("categoria");
    obj.edit20:setFontSize(12);
    obj.edit20:setName("edit20");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(90);
    obj.flowPart7:setMaxWidth(100);
    obj.flowPart7:setHeight(35);
    obj.flowPart7:setName("flowPart7");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart7);
    obj.label51:setAlign("top");
    obj.label51:setFontSize(10);
    obj.label51:setText("DANO");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWordWrap(true);
    obj.label51:setTextTrimming("none");
    obj.label51:setAutoSize(true);
    obj.label51:setHint("Qual o dado de dano dessa arma?");
    obj.label51:setHitTest(true);
    obj.label51:setName("label51");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart7);
    obj.edit21:setAlign("client");
    obj.edit21:setField("dano");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setName("edit21");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(90);
    obj.flowPart8:setMaxWidth(100);
    obj.flowPart8:setHeight(35);
    obj.flowPart8:setName("flowPart8");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart8);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(10);
    obj.label52:setText("DECISIVO");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setWordWrap(true);
    obj.label52:setTextTrimming("none");
    obj.label52:setAutoSize(true);
    obj.label52:setHint("Quando a margem de ameaça dessa arma?20? 19-20?");
    obj.label52:setHitTest(true);
    obj.label52:setName("label52");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart8);
    obj.edit22:setAlign("client");
    obj.edit22:setField("decisivo");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setName("edit22");

    obj.flowPart9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(90);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(35);
    obj.flowPart9:setName("flowPart9");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart9);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(10);
    obj.label53:setText("MULTIPLICADOR");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWordWrap(true);
    obj.label53:setTextTrimming("none");
    obj.label53:setAutoSize(true);
    obj.label53:setHint("Em um decisivo por quanto é multiplicado o dano dessa arma?");
    obj.label53:setHitTest(true);
    obj.label53:setName("label53");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart9);
    obj.edit23:setAlign("client");
    obj.edit23:setField("multiplicador");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setName("edit23");

    obj.flowPart10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(90);
    obj.flowPart10:setMaxWidth(100);
    obj.flowPart10:setHeight(35);
    obj.flowPart10:setName("flowPart10");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart10);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(10);
    obj.label54:setText("ALCANCE");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWordWrap(true);
    obj.label54:setTextTrimming("none");
    obj.label54:setAutoSize(true);
    obj.label54:setHint("Qual o alcance em metros da arma? Normalmente usado apenas em armas de ataque a distancia. ");
    obj.label54:setHitTest(true);
    obj.label54:setName("label54");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart10);
    obj.edit24:setAlign("client");
    obj.edit24:setField("alcance");
    obj.edit24:setFontSize(12);
    obj.edit24:setName("edit24");

    obj.flowPart11 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(90);
    obj.flowPart11:setMaxWidth(100);
    obj.flowPart11:setHeight(35);
    obj.flowPart11:setName("flowPart11");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart11);
    obj.label55:setAlign("top");
    obj.label55:setFontSize(10);
    obj.label55:setText("ESPECIAL");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWordWrap(true);
    obj.label55:setTextTrimming("none");
    obj.label55:setAutoSize(true);
    obj.label55:setHint("Essa arma tem efeitos especiais? Pode ser usada em derrubar? desarmar? Pode ser preparada contra investida?");
    obj.label55:setHitTest(true);
    obj.label55:setName("label55");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart11);
    obj.edit25:setAlign("client");
    obj.edit25:setField("especial");
    obj.edit25:setFontSize(12);
    obj.edit25:setName("edit25");

    obj.flowPart12 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(90);
    obj.flowPart12:setMaxWidth(100);
    obj.flowPart12:setHeight(35);
    obj.flowPart12:setName("flowPart12");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart12);
    obj.label56:setAlign("top");
    obj.label56:setFontSize(10);
    obj.label56:setText("TIPO");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setWordWrap(true);
    obj.label56:setTextTrimming("none");
    obj.label56:setAutoSize(true);
    obj.label56:setHint("Qual o tipo de dano que essa arma causa? Concusivo? Cortante?");
    obj.label56:setHitTest(true);
    obj.label56:setName("label56");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart12);
    obj.edit26:setAlign("client");
    obj.edit26:setField("tipo");
    obj.edit26:setFontSize(12);
    obj.edit26:setName("edit26");

    obj.flowPart13 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(290);
    obj.flowPart13:setMaxWidth(300);
    obj.flowPart13:setHeight(35);
    obj.flowPart13:setName("flowPart13");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart13);
    obj.label57:setAlign("top");
    obj.label57:setFontSize(10);
    obj.label57:setText("EFEITOS");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWordWrap(true);
    obj.label57:setTextTrimming("none");
    obj.label57:setAutoSize(true);
    obj.label57:setHint("Essa arma tem efeitos mágicos? Flamejante? Vorpal?");
    obj.label57:setHitTest(true);
    obj.label57:setName("label57");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart13);
    obj.edit27:setAlign("client");
    obj.edit27:setField("efeitos");
    obj.edit27:setFontSize(12);
    obj.edit27:setName("edit27");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout1);
    obj.flowPart14:setMinWidth(90);
    obj.flowPart14:setMaxWidth(100);
    obj.flowPart14:setHeight(35);
    obj.flowPart14:setName("flowPart14");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart14);
    obj.label58:setAlign("top");
    obj.label58:setFontSize(10);
    obj.label58:setText("CA");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setHint("Para escudos: qual o bonus que ele fornece na CA?");
    obj.label58:setHitTest(true);
    obj.label58:setName("label58");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart14);
    obj.edit28:setAlign("client");
    obj.edit28:setField("ca");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setName("edit28");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout1);
    obj.flowPart15:setMinWidth(90);
    obj.flowPart15:setMaxWidth(100);
    obj.flowPart15:setHeight(35);
    obj.flowPart15:setName("flowPart15");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart15);
    obj.label59:setAlign("top");
    obj.label59:setFontSize(10);
    obj.label59:setText("PEN");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWordWrap(true);
    obj.label59:setTextTrimming("none");
    obj.label59:setAutoSize(true);
    obj.label59:setHint("Para escudos: qual a penalidade do escudo?");
    obj.label59:setHitTest(true);
    obj.label59:setName("label59");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart15);
    obj.edit29:setAlign("client");
    obj.edit29:setField("penalidade");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setName("edit29");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout1);
    obj.flowPart16:setMinWidth(90);
    obj.flowPart16:setMaxWidth(100);
    obj.flowPart16:setHeight(35);
    obj.flowPart16:setName("flowPart16");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart16);
    obj.label60:setAlign("top");
    obj.label60:setFontSize(10);
    obj.label60:setText("FALHA");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setWordWrap(true);
    obj.label60:setTextTrimming("none");
    obj.label60:setAutoSize(true);
    obj.label60:setHint("Para escudos: qual a falha arcana?");
    obj.label60:setHitTest(true);
    obj.label60:setName("label60");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart16);
    obj.edit30:setAlign("client");
    obj.edit30:setField("falha");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setName("edit30");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.popArma);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("descricao");
    obj.textEditor9:setName("textEditor9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasArmas:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclConsumiveis:append();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Gastos em PO");
            						index = index + 1;
            					end;
            					local mod = 0;
            					mod = (getNumber(sheet.precoCabeca) or 0) +
            								(getNumber(sheet.precoOlhos) or 0) +
            								(getNumber(sheet.precoPescoco) or 0) +
            								(getNumber(sheet.precoOmbros) or 0) +
            								(getNumber(sheet.precoTorso) or 0) +
            								(getNumber(sheet.precoCorpo) or 0) +
            								(getNumber(sheet.precoPunhos) or 0) +
            								(getNumber(sheet.precoCintura) or 0) +
            								(getNumber(sheet.precoMaos) or 0) +
            								(getNumber(sheet.precoDedosI) or 0) +
            								(getNumber(sheet.precoDesdosII) or 0) +
            								(getNumber(sheet.precoPes) or 0) +
            								(getNumber(sheet.precoArmas) or 0) +
            								(getNumber(sheet.precoMochila) or 0) +
            								(getNumber(sheet.precoPermanencias) or 0) +
            								(getNumber(sheet.precoLivres) or 0) +
            								(getNumber(sheet.precoOutros) or 0) +
            								(getNumber(sheet.precoMunicoes) or 0) +
            								(getNumber(sheet.precoBolsos) or 0) +
            								(getNumber(sheet.precoImoveis) or 0);
            
            					local mod2 = 0;
            					local nodes = ndb.getChildNodes(sheet.campoDosCompanheiros);   
            					for i=1, #nodes, 1 do
            						mod2 = mod2 + (getNumber(nodes[i].precoInventorioComp) or 0);
            					end
            					mod = mod + mod2;
            					mod = string.gsub(mod, "%.", "_");
            					while true do  
            						mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					mod = string.gsub(mod, ",", ".");
            					mod = string.gsub(mod, "_", ",");
            					sheet.gastos = mod .. "PO";
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Carga");
            						index = index + 1;
            					end;
            
            					local mod1 = sheet.cargaPesada;
            					if mod1==nil then
            						mod1 = "0";
            					end
            					mod1 = string.gsub(mod1, "Kg", "");
            					mod1 = string.gsub(mod1, "K", "");
            					mod1 = string.gsub(mod1, "k", "");
            					mod1 = string.gsub(mod1, "G", "");
            					mod1 = string.gsub(mod1, "g", "");
            					mod1 = string.gsub(mod1, ",", ".");
            					local mod = (tonumber(mod1) or 0);
            					sheet.cargaErguer = mod .. "Kg";
            					sheet.cargaLevantar = (2*mod) .. "Kg";
            					sheet.cargaEmpurrar = (5*mod) .. "Kg";
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Carga");
            						index = index + 1;
            					end;
            					local mod = 0;
            					mod = (getNumber(sheet.pesoCabeca) or 0) +
            								(getNumber(sheet.pesoOlhos) or 0) +
            								(getNumber(sheet.pesoPescoco) or 0) +
            								(getNumber(sheet.pesoOmbros) or 0) +
            								(getNumber(sheet.pesoTorso) or 0) +
            								(getNumber(sheet.pesoCorpo) or 0) +
            								(getNumber(sheet.pesoPunhos) or 0) +
            								(getNumber(sheet.pesoCintura) or 0) +
            								(getNumber(sheet.pesoMaos) or 0) +
            								(getNumber(sheet.pesoDedosI) or 0) +
            								(getNumber(sheet.pesoDesdosII) or 0) +
            								(getNumber(sheet.pesoPes) or 0) +
            								(getNumber(sheet.pesoArmas) or 0) +
            								(getNumber(sheet.pesoMochila) or 0) +
            								(getNumber(sheet.pesoPermanencias) or 0) +
            								(getNumber(sheet.pesoLivres) or 0) +
            								(getNumber(sheet.pesoOutros) or 0) +
            								(getNumber(sheet.pesoMunicoes) or 0) +
            								(getNumber(sheet.pesoBolsos) or 0) +
            								(getNumber(sheet.pesoImoveis) or 0);
            					while true do  
            						mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					mod = string.gsub(mod, ",", ".");
            					sheet.cargaAtual = mod .. "Kg";
            				end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rclListaDasArmas ~= nil then self.rclListaDasArmas:destroy(); self.rclListaDasArmas = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rclConsumiveis ~= nil then self.rclConsumiveis:destroy(); self.rclConsumiveis = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister7_svg = {
    newEditor = newfrmFichaRPGmeister7_svg, 
    new = newfrmFichaRPGmeister7_svg, 
    name = "frmFichaRPGmeister7_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister7_svg = _frmFichaRPGmeister7_svg;
rrpg.registrarForm(_frmFichaRPGmeister7_svg);

return _frmFichaRPGmeister7_svg;
