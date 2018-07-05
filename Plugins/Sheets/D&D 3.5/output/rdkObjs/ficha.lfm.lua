require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newdnd()
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
    obj:setDataType("dnd35");
    obj:setFormType("sheetTemplate");
    obj:setTitle("dnd");
    obj:setName("dnd");
    obj:setTheme("light");

    obj.pgcPrincipal = gui.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setName("rectangle1");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setHeight(500);
    obj.flowLayout1:setMargins({left=10, right=10, top=10});
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setLineSpacing(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout1);
    obj.rectangle2:setWidth(300);
    obj.rectangle2:setHeight(190);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setSRC("/images/logo.png");
    obj.image1:setWidth(300);
    obj.image1:setHeight(190);
    obj.image1:setStyle("stretch");
    obj.image1:setName("image1");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowLayout1);
    obj.rectangle3:setWidth(300);
    obj.rectangle3:setHeight(190);
    obj.rectangle3:setLeft(305);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle3);
    obj.layout1:setWidth(300);
    obj.layout1:setHeight(60);
    obj.layout1:setAlign("top");
    obj.layout1:setName("layout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("1");
    obj.edit1:setFontColor("black");
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(30);
    obj.edit1:setName("edit1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Nome do Personagem");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWidth(300);
    obj.label1:setTop(35);
    obj.label1:setFontColor("black");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle3);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(60);
    obj.layout2:setTop(65);
    obj.layout2:setAlign("top");
    obj.layout2:setName("layout2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setField("2");
    obj.edit2:setFontColor("black");
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(30);
    obj.edit2:setName("edit2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Classe e Nível");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWidth(300);
    obj.label2:setTop(35);
    obj.label2:setFontColor("black");
    obj.label2:setName("label2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle3);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(60);
    obj.layout3:setTop(130);
    obj.layout3:setAlign("top");
    obj.layout3:setName("layout3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setField("3");
    obj.edit3:setFontColor("black");
    obj.edit3:setWidth(73);
    obj.edit3:setHeight(30);
    obj.edit3:setName("edit3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Tamanho");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWidth(73);
    obj.label3:setTop(35);
    obj.label3:setFontColor("black");
    obj.label3:setName("label3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setField("4");
    obj.edit4:setFontColor("black");
    obj.edit4:setWidth(73);
    obj.edit4:setHeight(30);
    obj.edit4:setLeft(75);
    obj.edit4:setName("edit4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setText("Idade");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWidth(73);
    obj.label4:setTop(35);
    obj.label4:setLeft(80);
    obj.label4:setFontColor("black");
    obj.label4:setName("label4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setField("5");
    obj.edit5:setFontColor("black");
    obj.edit5:setWidth(73);
    obj.edit5:setHeight(30);
    obj.edit5:setLeft(150);
    obj.edit5:setName("edit5");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setText("Sexo");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWidth(73);
    obj.label5:setTop(35);
    obj.label5:setLeft(155);
    obj.label5:setFontColor("black");
    obj.label5:setName("label5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setField("6");
    obj.edit6:setFontColor("black");
    obj.edit6:setWidth(73);
    obj.edit6:setHeight(30);
    obj.edit6:setLeft(225);
    obj.edit6:setName("edit6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setText("Altura");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWidth(73);
    obj.label6:setTop(35);
    obj.label6:setLeft(230);
    obj.label6:setFontColor("black");
    obj.label6:setName("label6");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowLayout1);
    obj.rectangle4:setWidth(300);
    obj.rectangle4:setHeight(190);
    obj.rectangle4:setLeft(610);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setName("rectangle4");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle4);
    obj.layout4:setWidth(300);
    obj.layout4:setHeight(60);
    obj.layout4:setAlign("top");
    obj.layout4:setLeft(5);
    obj.layout4:setName("layout4");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setField("7");
    obj.edit7:setFontColor("black");
    obj.edit7:setWidth(300);
    obj.edit7:setHeight(30);
    obj.edit7:setName("edit7");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout4);
    obj.label7:setText("Nome do Jogador");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWidth(300);
    obj.label7:setTop(35);
    obj.label7:setFontColor("black");
    obj.label7:setName("label7");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle4);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(60);
    obj.layout5:setTop(65);
    obj.layout5:setAlign("top");
    obj.layout5:setName("layout5");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setField("8");
    obj.edit8:setFontColor("black");
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(30);
    obj.edit8:setName("edit8");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setText("Raça");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWidth(95);
    obj.label8:setTop(35);
    obj.label8:setFontColor("black");
    obj.label8:setName("label8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setField("9");
    obj.edit9:setFontColor("black");
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(30);
    obj.edit9:setLeft(100);
    obj.edit9:setName("edit9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setText("Tendência");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWidth(95);
    obj.label9:setTop(35);
    obj.label9:setLeft(100);
    obj.label9:setFontColor("black");
    obj.label9:setName("label9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout5);
    obj.edit10:setField("10");
    obj.edit10:setFontColor("black");
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(30);
    obj.edit10:setLeft(200);
    obj.edit10:setName("edit10");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout5);
    obj.label10:setText("Divindade");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWidth(100);
    obj.label10:setTop(35);
    obj.label10:setLeft(200);
    obj.label10:setFontColor("black");
    obj.label10:setName("label10");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle4);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(60);
    obj.layout6:setTop(130);
    obj.layout6:setAlign("top");
    obj.layout6:setName("layout6");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout6);
    obj.edit11:setField("11");
    obj.edit11:setFontColor("black");
    obj.edit11:setWidth(73);
    obj.edit11:setHeight(30);
    obj.edit11:setName("edit11");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout6);
    obj.label11:setText("Peso");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWidth(73);
    obj.label11:setTop(35);
    obj.label11:setFontColor("black");
    obj.label11:setName("label11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout6);
    obj.edit12:setField("12");
    obj.edit12:setFontColor("black");
    obj.edit12:setWidth(73);
    obj.edit12:setHeight(30);
    obj.edit12:setLeft(75);
    obj.edit12:setName("edit12");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout6);
    obj.label12:setText("Olhos");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWidth(73);
    obj.label12:setTop(35);
    obj.label12:setLeft(80);
    obj.label12:setFontColor("black");
    obj.label12:setName("label12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout6);
    obj.edit13:setField("13");
    obj.edit13:setFontColor("black");
    obj.edit13:setWidth(73);
    obj.edit13:setHeight(30);
    obj.edit13:setLeft(150);
    obj.edit13:setName("edit13");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout6);
    obj.label13:setText("Cabelo");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWidth(73);
    obj.label13:setTop(35);
    obj.label13:setLeft(155);
    obj.label13:setFontColor("black");
    obj.label13:setName("label13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout6);
    obj.edit14:setField("14");
    obj.edit14:setFontColor("black");
    obj.edit14:setWidth(73);
    obj.edit14:setHeight(30);
    obj.edit14:setLeft(225);
    obj.edit14:setName("edit14");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout6);
    obj.label14:setText("Pele");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWidth(73);
    obj.label14:setTop(35);
    obj.label14:setLeft(230);
    obj.label14:setFontColor("black");
    obj.label14:setName("label14");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowLayout1);
    obj.rectangle5:setWidth(370);
    obj.rectangle5:setHeight(200);
    obj.rectangle5:setTop(195);
    obj.rectangle5:setColor("white");
    obj.rectangle5:setName("rectangle5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle5);
    obj.layout7:setWidth(70);
    obj.layout7:setHeight(200);
    obj.layout7:setName("layout7");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout7);
    obj.label15:setText("Habilidades");
    obj.label15:setHeight(50);
    obj.label15:setWidth(70);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setAutoSize(true);
    obj.label15:setAlign("top");
    obj.label15:setFontColor("black");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout7);
    obj.label16:setText("FOR");
    obj.label16:setHeight(20);
    obj.label16:setWidth(70);
    obj.label16:setTop(55);
    obj.label16:setAutoSize(true);
    obj.label16:setFontColor("black");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout7);
    obj.label17:setText("DES");
    obj.label17:setHeight(20);
    obj.label17:setWidth(70);
    obj.label17:setTop(80);
    obj.label17:setAutoSize(true);
    obj.label17:setFontColor("black");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout7);
    obj.label18:setText("CON");
    obj.label18:setHeight(20);
    obj.label18:setWidth(70);
    obj.label18:setTop(105);
    obj.label18:setAutoSize(true);
    obj.label18:setFontColor("black");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout7);
    obj.label19:setText("INT");
    obj.label19:setHeight(20);
    obj.label19:setWidth(70);
    obj.label19:setTop(130);
    obj.label19:setAutoSize(true);
    obj.label19:setFontColor("black");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout7);
    obj.label20:setText("SAB");
    obj.label20:setHeight(20);
    obj.label20:setWidth(70);
    obj.label20:setTop(155);
    obj.label20:setAutoSize(true);
    obj.label20:setFontColor("black");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout7);
    obj.label21:setText("CAR");
    obj.label21:setHeight(20);
    obj.label21:setWidth(70);
    obj.label21:setTop(180);
    obj.label21:setAutoSize(true);
    obj.label21:setFontColor("black");
    obj.label21:setName("label21");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle5);
    obj.layout8:setWidth(70);
    obj.layout8:setHeight(200);
    obj.layout8:setLeft(75);
    obj.layout8:setName("layout8");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout8);
    obj.label22:setText("valor");
    obj.label22:setHeight(50);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setAutoSize(true);
    obj.label22:setAlign("top");
    obj.label22:setFontColor("black");
    obj.label22:setName("label22");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout8);
    obj.edit15:setField("forca");
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(70);
    obj.edit15:setTop(55);
    obj.edit15:setFontColor("black");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setField("destreza");
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(70);
    obj.edit16:setTop(80);
    obj.edit16:setFontColor("black");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17:setField("constituicao");
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(70);
    obj.edit17:setTop(105);
    obj.edit17:setFontColor("black");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout8);
    obj.edit18:setField("inteligencia");
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(70);
    obj.edit18:setTop(130);
    obj.edit18:setFontColor("black");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout8);
    obj.edit19:setField("sabedoria");
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(70);
    obj.edit19:setTop(155);
    obj.edit19:setFontColor("black");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout8);
    obj.edit20:setField("carisma");
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(70);
    obj.edit20:setTop(180);
    obj.edit20:setFontColor("black");
    obj.edit20:setName("edit20");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle5);
    obj.layout9:setWidth(70);
    obj.layout9:setHeight(200);
    obj.layout9:setLeft(150);
    obj.layout9:setName("layout9");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout9);
    obj.label23:setText("Mod de Habilidade");
    obj.label23:setHeight(50);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setAutoSize(true);
    obj.label23:setAlign("top");
    obj.label23:setFontColor("black");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout9);
    obj.label24:setField("modforca");
    obj.label24:setHeight(20);
    obj.label24:setWidth(70);
    obj.label24:setTop(55);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontColor("black");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout9);
    obj.label25:setField("moddestreza");
    obj.label25:setHeight(20);
    obj.label25:setWidth(70);
    obj.label25:setTop(80);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontColor("black");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout9);
    obj.label26:setField("modconstituicao");
    obj.label26:setHeight(20);
    obj.label26:setWidth(70);
    obj.label26:setTop(105);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontColor("black");
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout9);
    obj.label27:setField("modinteligencia");
    obj.label27:setHeight(20);
    obj.label27:setWidth(70);
    obj.label27:setTop(130);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontColor("black");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout9);
    obj.label28:setField("modsabedoria");
    obj.label28:setHeight(20);
    obj.label28:setWidth(70);
    obj.label28:setTop(155);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontColor("black");
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout9);
    obj.label29:setField("modcarisma");
    obj.label29:setHeight(20);
    obj.label29:setWidth(70);
    obj.label29:setTop(180);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontColor("black");
    obj.label29:setName("label29");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle5);
    obj.layout10:setWidth(70);
    obj.layout10:setHeight(200);
    obj.layout10:setLeft(225);
    obj.layout10:setName("layout10");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout10);
    obj.label30:setText("Valor Temp");
    obj.label30:setHeight(50);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setAutoSize(true);
    obj.label30:setAlign("top");
    obj.label30:setFontColor("black");
    obj.label30:setName("label30");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout10);
    obj.edit21:setField("tforca");
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(70);
    obj.edit21:setTop(55);
    obj.edit21:setFontColor("black");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout10);
    obj.edit22:setField("tdestreza");
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(70);
    obj.edit22:setTop(80);
    obj.edit22:setFontColor("black");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout10);
    obj.edit23:setField("tconstituicao");
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(70);
    obj.edit23:setTop(105);
    obj.edit23:setFontColor("black");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout10);
    obj.edit24:setField("tinteligencia");
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(70);
    obj.edit24:setTop(130);
    obj.edit24:setFontColor("black");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout10);
    obj.edit25:setField("tsabedoria");
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(70);
    obj.edit25:setTop(155);
    obj.edit25:setFontColor("black");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout10);
    obj.edit26:setField("tcarisma");
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(70);
    obj.edit26:setTop(180);
    obj.edit26:setFontColor("black");
    obj.edit26:setName("edit26");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle5);
    obj.layout11:setWidth(70);
    obj.layout11:setHeight(200);
    obj.layout11:setLeft(300);
    obj.layout11:setName("layout11");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout11);
    obj.label31:setText("Mod Temp");
    obj.label31:setHeight(50);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setAutoSize(true);
    obj.label31:setAlign("top");
    obj.label31:setFontColor("black");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout11);
    obj.label32:setField("modtforca");
    obj.label32:setHeight(20);
    obj.label32:setWidth(70);
    obj.label32:setTop(55);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontColor("black");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout11);
    obj.label33:setField("modtdestreza");
    obj.label33:setHeight(20);
    obj.label33:setWidth(70);
    obj.label33:setTop(80);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontColor("black");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout11);
    obj.label34:setField("modtconstituicao");
    obj.label34:setHeight(20);
    obj.label34:setWidth(70);
    obj.label34:setTop(105);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontColor("black");
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout11);
    obj.label35:setField("modtinteligencia");
    obj.label35:setHeight(20);
    obj.label35:setWidth(70);
    obj.label35:setTop(130);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontColor("black");
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout11);
    obj.label36:setField("modtsabedoria");
    obj.label36:setHeight(20);
    obj.label36:setWidth(70);
    obj.label36:setTop(155);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontColor("black");
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout11);
    obj.label37:setField("modtcarisma");
    obj.label37:setHeight(20);
    obj.label37:setWidth(70);
    obj.label37:setTop(180);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontColor("black");
    obj.label37:setName("label37");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle5);
    obj.dataLink1:setFields({'forca', 'destreza', 'constituicao', 'inteligencia', 'sabedoria', 'carisma', 
			'tforca', 'tdestreza', 'tconstituicao', 'tinteligencia', 'tsabedoria', 'tcarisma'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowLayout1);
    obj.rectangle6:setWidth(530);
    obj.rectangle6:setHeight(130);
    obj.rectangle6:setLeft(380);
    obj.rectangle6:setTop(195);
    obj.rectangle6:setColor("white");
    obj.rectangle6:setName("rectangle6");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle6);
    obj.layout12:setHeight(30);
    obj.layout12:setWidth(530);
    obj.layout12:setName("layout12");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout12);
    obj.label38:setText("");
    obj.label38:setHeight(30);
    obj.label38:setWidth(50);
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout12);
    obj.label39:setText("Total");
    obj.label39:setHeight(30);
    obj.label39:setWidth(50);
    obj.label39:setLeft(35);
    obj.label39:setAutoSize(true);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontColor("black");
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout12);
    obj.label40:setText("DVs");
    obj.label40:setHeight(30);
    obj.label40:setWidth(80);
    obj.label40:setLeft(90);
    obj.label40:setAutoSize(true);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontColor("black");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout12);
    obj.label41:setText("Outros");
    obj.label41:setHeight(30);
    obj.label41:setWidth(80);
    obj.label41:setLeft(175);
    obj.label41:setAutoSize(true);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setFontColor("black");
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout12);
    obj.label42:setText("Deslocamento");
    obj.label42:setHeight(30);
    obj.label42:setWidth(100);
    obj.label42:setLeft(260);
    obj.label42:setAutoSize(true);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontColor("black");
    obj.label42:setName("label42");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout12);
    obj.label43:setText("Redução de Dano");
    obj.label43:setHeight(30);
    obj.label43:setWidth(160);
    obj.label43:setLeft(365);
    obj.label43:setAutoSize(true);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setFontColor("black");
    obj.label43:setName("label43");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle6);
    obj.layout13:setWidth(530);
    obj.layout13:setHeight(30);
    obj.layout13:setTop(35);
    obj.layout13:setName("layout13");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout13);
    obj.label44:setText("PVS");
    obj.label44:setHeight(30);
    obj.label44:setWidth(50);
    obj.label44:setFontColor("black");
    obj.label44:setName("label44");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout13);
    obj.edit27:setField("15");
    obj.edit27:setFontColor("black");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setHeight(30);
    obj.edit27:setWidth(50);
    obj.edit27:setLeft(35);
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout13);
    obj.edit28:setField("16");
    obj.edit28:setHeight(30);
    obj.edit28:setWidth(80);
    obj.edit28:setLeft(90);
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout13);
    obj.edit29:setField("outrospvs");
    obj.edit29:setHeight(30);
    obj.edit29:setWidth(80);
    obj.edit29:setLeft(175);
    obj.edit29:setFontColor("black");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout13);
    obj.edit30:setField("17");
    obj.edit30:setHeight(30);
    obj.edit30:setWidth(100);
    obj.edit30:setLeft(260);
    obj.edit30:setFontColor("black");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout13);
    obj.edit31:setField("18");
    obj.edit31:setHeight(30);
    obj.edit31:setWidth(160);
    obj.edit31:setLeft(365);
    obj.edit31:setFontColor("black");
    obj.edit31:setName("edit31");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle6);
    obj.layout14:setWidth(530);
    obj.layout14:setHeight(30);
    obj.layout14:setTop(70);
    obj.layout14:setName("layout14");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout14);
    obj.label45:setText("CA");
    obj.label45:setHeight(30);
    obj.label45:setWidth(45);
    obj.label45:setFontColor("black");
    obj.label45:setName("label45");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout14);
    obj.edit32:setField("totalca");
    obj.edit32:setHeight(30);
    obj.edit32:setWidth(45);
    obj.edit32:setLeft(50);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontColor("black");
    obj.edit32:setName("edit32");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout14);
    obj.label46:setText(" = 10");
    obj.label46:setHeight(30);
    obj.label46:setWidth(45);
    obj.label46:setLeft(100);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontColor("black");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout14);
    obj.label47:setText("+");
    obj.label47:setHeight(30);
    obj.label47:setWidth(5);
    obj.label47:setLeft(150);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontColor("black");
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout14);
    obj.label48:setField("ca1");
    obj.label48:setHeight(30);
    obj.label48:setWidth(45);
    obj.label48:setLeft(155);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontColor("black");
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout14);
    obj.label49:setText("+");
    obj.label49:setHeight(30);
    obj.label49:setWidth(5);
    obj.label49:setLeft(205);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setFontColor("black");
    obj.label49:setName("label49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout14);
    obj.label50:setField("ca2");
    obj.label50:setHeight(30);
    obj.label50:setWidth(45);
    obj.label50:setLeft(210);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontColor("black");
    obj.label50:setName("label50");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout14);
    obj.label51:setText("+");
    obj.label51:setHeight(30);
    obj.label51:setWidth(5);
    obj.label51:setLeft(260);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontColor("black");
    obj.label51:setName("label51");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout14);
    obj.label52:setField("ca3");
    obj.label52:setHeight(30);
    obj.label52:setWidth(45);
    obj.label52:setLeft(265);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontColor("black");
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout14);
    obj.label53:setText("+");
    obj.label53:setHeight(30);
    obj.label53:setWidth(5);
    obj.label53:setLeft(315);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setFontColor("black");
    obj.label53:setName("label53");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout14);
    obj.edit33:setTextPrompt("Tamanho");
    obj.edit33:setField("catamanho");
    obj.edit33:setHeight(30);
    obj.edit33:setWidth(45);
    obj.edit33:setLeft(320);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontColor("black");
    obj.edit33:setName("edit33");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout14);
    obj.label54:setText("+");
    obj.label54:setHeight(30);
    obj.label54:setWidth(5);
    obj.label54:setLeft(370);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setFontColor("black");
    obj.label54:setName("label54");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout14);
    obj.edit34:setTextPrompt("Natural");
    obj.edit34:setField("caarmaduranatural");
    obj.edit34:setHeight(30);
    obj.edit34:setWidth(45);
    obj.edit34:setLeft(375);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontColor("black");
    obj.edit34:setName("edit34");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout14);
    obj.label55:setText("+");
    obj.label55:setHeight(30);
    obj.label55:setWidth(5);
    obj.label55:setLeft(425);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setFontColor("black");
    obj.label55:setName("label55");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout14);
    obj.edit35:setTextPrompt("Deflexao");
    obj.edit35:setField("deflexao");
    obj.edit35:setHeight(30);
    obj.edit35:setWidth(45);
    obj.edit35:setLeft(430);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontColor("black");
    obj.edit35:setName("edit35");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout14);
    obj.label56:setText("+");
    obj.label56:setHeight(30);
    obj.label56:setWidth(5);
    obj.label56:setLeft(480);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setFontColor("black");
    obj.label56:setName("label56");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout14);
    obj.edit36:setTextPrompt("Outros");
    obj.edit36:setField("outrosca");
    obj.edit36:setHeight(30);
    obj.edit36:setWidth(45);
    obj.edit36:setLeft(485);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontColor("black");
    obj.edit36:setName("edit36");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle6);
    obj.dataLink2:setFields({'moddestreza', 'ca3', 'totalca', 'outrosca', 'deflexao', 'catamanho', 'caarmaduranatural', 'ca2', 'ca3', 'armadura', 'escudo'});
    obj.dataLink2:setName("dataLink2");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle6);
    obj.layout15:setWidth(530);
    obj.layout15:setHeight(30);
    obj.layout15:setTop(100);
    obj.layout15:setName("layout15");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout15);
    obj.label57:setText("");
    obj.label57:setHeight(30);
    obj.label57:setWidth(45);
    obj.label57:setFontColor("black");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout15);
    obj.label58:setText("");
    obj.label58:setHeight(30);
    obj.label58:setWidth(45);
    obj.label58:setLeft(50);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setFontColor("black");
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout15);
    obj.label59:setText("Total");
    obj.label59:setHeight(30);
    obj.label59:setWidth(45);
    obj.label59:setLeft(100);
    obj.label59:setAlign("bottom");
    obj.label59:setFontColor("black");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout15);
    obj.label60:setText("");
    obj.label60:setHeight(30);
    obj.label60:setWidth(5);
    obj.label60:setLeft(150);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontColor("black");
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout15);
    obj.label61:setText("Armadura");
    obj.label61:setFontSize(9);
    obj.label61:setHeight(30);
    obj.label61:setWidth(45);
    obj.label61:setLeft(155);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setFontColor("black");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout15);
    obj.label62:setText("");
    obj.label62:setHeight(30);
    obj.label62:setWidth(5);
    obj.label62:setLeft(205);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontColor("black");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout15);
    obj.label63:setText("Escudo");
    obj.label63:setFontSize(9);
    obj.label63:setHeight(30);
    obj.label63:setWidth(45);
    obj.label63:setLeft(210);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setFontColor("black");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout15);
    obj.label64:setText("");
    obj.label64:setHeight(30);
    obj.label64:setWidth(5);
    obj.label64:setLeft(260);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setFontColor("black");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout15);
    obj.label65:setText("");
    obj.label65:setFontSize(9);
    obj.label65:setHeight(30);
    obj.label65:setWidth(45);
    obj.label65:setLeft(265);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setFontColor("black");
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout15);
    obj.label66:setText("");
    obj.label66:setHeight(30);
    obj.label66:setWidth(5);
    obj.label66:setLeft(315);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setFontColor("black");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout15);
    obj.label67:setText("Tamanho");
    obj.label67:setFontSize(9);
    obj.label67:setHeight(30);
    obj.label67:setWidth(45);
    obj.label67:setLeft(320);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setFontColor("black");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout15);
    obj.label68:setText("");
    obj.label68:setHeight(30);
    obj.label68:setWidth(5);
    obj.label68:setLeft(370);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontColor("black");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout15);
    obj.label69:setText("Natural");
    obj.label69:setFontSize(9);
    obj.label69:setHeight(30);
    obj.label69:setWidth(45);
    obj.label69:setLeft(375);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setFontColor("black");
    obj.label69:setName("label69");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout15);
    obj.label70:setText("");
    obj.label70:setHeight(30);
    obj.label70:setWidth(5);
    obj.label70:setLeft(425);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setFontColor("black");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout15);
    obj.label71:setText("Deflexao");
    obj.label71:setFontSize(9);
    obj.label71:setHeight(30);
    obj.label71:setWidth(45);
    obj.label71:setLeft(430);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setFontColor("black");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout15);
    obj.label72:setText("");
    obj.label72:setHeight(30);
    obj.label72:setWidth(5);
    obj.label72:setLeft(480);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontColor("black");
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout15);
    obj.label73:setText("Outros");
    obj.label73:setFontSize(9);
    obj.label73:setHeight(30);
    obj.label73:setWidth(45);
    obj.label73:setLeft(485);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setFontColor("black");
    obj.label73:setName("label73");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowLayout1);
    obj.rectangle7:setWidth(255);
    obj.rectangle7:setHeight(65);
    obj.rectangle7:setLeft(380);
    obj.rectangle7:setTop(330);
    obj.rectangle7:setColor("white");
    obj.rectangle7:setName("rectangle7");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle7);
    obj.layout16:setWidth(255);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout16);
    obj.label74:setText("Toque");
    obj.label74:setWidth(60);
    obj.label74:setHeight(30);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setFontColor("black");
    obj.label74:setName("label74");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout16);
    obj.edit37:setField("toque");
    obj.edit37:setWidth(60);
    obj.edit37:setHeight(30);
    obj.edit37:setLeft(65);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontColor("black");
    obj.edit37:setName("edit37");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout16);
    obj.label75:setText("Surpresa");
    obj.label75:setWidth(60);
    obj.label75:setHeight(130);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setFontColor("black");
    obj.label75:setName("label75");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout16);
    obj.edit38:setField("surpresa");
    obj.edit38:setWidth(60);
    obj.edit38:setHeight(30);
    obj.edit38:setLeft(195);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontColor("black");
    obj.edit38:setName("edit38");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle7);
    obj.layout17:setWidth(255);
    obj.layout17:setHeight(30);
    obj.layout17:setTop(35);
    obj.layout17:setName("layout17");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout17);
    obj.label76:setText("Iniciativa");
    obj.label76:setWidth(80);
    obj.label76:setHeight(30);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setFontColor("black");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout17);
    obj.label77:setField("iniciativa");
    obj.label77:setWidth(50);
    obj.label77:setHeight(30);
    obj.label77:setLeft(85);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontColor("black");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout17);
    obj.label78:setText("=");
    obj.label78:setWidth(10);
    obj.label78:setHeight(10);
    obj.label78:setLeft(135);
    obj.label78:setTop(10);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setFontColor("black");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout17);
    obj.label79:setField("ini1");
    obj.label79:setWidth(50);
    obj.label79:setHeight(30);
    obj.label79:setLeft(145);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setFontColor("black");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout17);
    obj.label80:setText("+");
    obj.label80:setWidth(10);
    obj.label80:setHeight(5);
    obj.label80:setLeft(195);
    obj.label80:setTop(10);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setFontColor("black");
    obj.label80:setName("label80");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout17);
    obj.edit39:setField("ini2");
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(30);
    obj.edit39:setLeft(205);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontColor("black");
    obj.edit39:setName("edit39");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle7);
    obj.dataLink3:setFields({'iniciativa', 'ini1', 'ini2', 'moddestreza'});
    obj.dataLink3:setName("dataLink3");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout1);
    obj.rectangle8:setWidth(635);
    obj.rectangle8:setHeight(135);
    obj.rectangle8:setTop(400);
    obj.rectangle8:setColor("white");
    obj.rectangle8:setName("rectangle8");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle8);
    obj.layout18:setWidth(635);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout18);
    obj.label81:setText("Teste de Resistência");
    obj.label81:setWidth(210);
    obj.label81:setHeight(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setFontColor("black");
    obj.label81:setName("label81");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout18);
    obj.label82:setText("Total");
    obj.label82:setWidth(50);
    obj.label82:setHeight(30);
    obj.label82:setLeft(220);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setFontColor("black");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout18);
    obj.label83:setText("");
    obj.label83:setWidth(10);
    obj.label83:setHeight(30);
    obj.label83:setLeft(270);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontColor("black");
    obj.label83:setName("label83");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout18);
    obj.label84:setText("Base");
    obj.label84:setWidth(50);
    obj.label84:setHeight(30);
    obj.label84:setLeft(280);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontColor("black");
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout18);
    obj.label85:setText("");
    obj.label85:setWidth(10);
    obj.label85:setHeight(30);
    obj.label85:setLeft(330);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setFontColor("black");
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout18);
    obj.label86:setText("Mod Hab");
    obj.label86:setFontSize(9);
    obj.label86:setWidth(50);
    obj.label86:setHeight(30);
    obj.label86:setLeft(340);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setFontColor("black");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout18);
    obj.label87:setText("");
    obj.label87:setWidth(10);
    obj.label87:setHeight(30);
    obj.label87:setLeft(390);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontColor("black");
    obj.label87:setName("label87");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout18);
    obj.label88:setText("Mod Mágico");
    obj.label88:setFontSize(8);
    obj.label88:setWidth(50);
    obj.label88:setHeight(30);
    obj.label88:setLeft(400);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setFontColor("black");
    obj.label88:setName("label88");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout18);
    obj.label89:setText("");
    obj.label89:setWidth(10);
    obj.label89:setHeight(30);
    obj.label89:setLeft(450);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setFontColor("black");
    obj.label89:setName("label89");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout18);
    obj.label90:setText("Outros");
    obj.label90:setWidth(50);
    obj.label90:setHeight(30);
    obj.label90:setLeft(460);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setFontColor("black");
    obj.label90:setName("label90");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout18);
    obj.label91:setText("");
    obj.label91:setWidth(10);
    obj.label91:setHeight(30);
    obj.label91:setLeft(510);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontColor("black");
    obj.label91:setName("label91");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout18);
    obj.label92:setText("Mod Temp");
    obj.label92:setFontSize(8);
    obj.label92:setWidth(50);
    obj.label92:setHeight(30);
    obj.label92:setLeft(520);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setFontColor("black");
    obj.label92:setName("label92");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout18);
    obj.label93:setText("");
    obj.label93:setWidth(10);
    obj.label93:setHeight(30);
    obj.label93:setLeft(570);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setFontColor("black");
    obj.label93:setName("label93");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout18);
    obj.label94:setText("Condicional");
    obj.label94:setFontSize(8);
    obj.label94:setWidth(50);
    obj.label94:setHeight(30);
    obj.label94:setLeft(580);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setFontColor("black");
    obj.label94:setName("label94");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle8);
    obj.layout19:setWidth(635);
    obj.layout19:setHeight(30);
    obj.layout19:setTop(35);
    obj.layout19:setName("layout19");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout19);
    obj.label95:setText("Fortitude");
    obj.label95:setWidth(210);
    obj.label95:setHeight(30);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontColor("black");
    obj.label95:setName("label95");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout19);
    obj.label96:setField("fortitude");
    obj.label96:setWidth(50);
    obj.label96:setHeight(30);
    obj.label96:setLeft(220);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setFontColor("black");
    obj.label96:setName("label96");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout19);
    obj.label97:setText("=");
    obj.label97:setWidth(10);
    obj.label97:setHeight(30);
    obj.label97:setLeft(270);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setFontColor("black");
    obj.label97:setName("label97");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout19);
    obj.edit40:setField("basefort");
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(30);
    obj.edit40:setLeft(280);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontColor("black");
    obj.edit40:setName("edit40");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout19);
    obj.label98:setText("+");
    obj.label98:setWidth(10);
    obj.label98:setHeight(30);
    obj.label98:setLeft(330);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontColor("black");
    obj.label98:setName("label98");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout19);
    obj.label99:setField("modfort");
    obj.label99:setWidth(50);
    obj.label99:setHeight(30);
    obj.label99:setLeft(340);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setFontColor("black");
    obj.label99:setName("label99");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout19);
    obj.label100:setText("+");
    obj.label100:setWidth(10);
    obj.label100:setHeight(30);
    obj.label100:setLeft(390);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setFontColor("black");
    obj.label100:setName("label100");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout19);
    obj.edit41:setField("magicofort");
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(30);
    obj.edit41:setLeft(400);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontColor("black");
    obj.edit41:setName("edit41");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout19);
    obj.label101:setText("+");
    obj.label101:setWidth(10);
    obj.label101:setHeight(30);
    obj.label101:setLeft(450);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setFontColor("black");
    obj.label101:setName("label101");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout19);
    obj.edit42:setField("outrosfort");
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(30);
    obj.edit42:setLeft(460);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontColor("black");
    obj.edit42:setName("edit42");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout19);
    obj.label102:setText("+");
    obj.label102:setWidth(10);
    obj.label102:setHeight(30);
    obj.label102:setLeft(510);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setFontColor("black");
    obj.label102:setName("label102");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout19);
    obj.edit43:setField("tempfort");
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(30);
    obj.edit43:setLeft(520);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontColor("black");
    obj.edit43:setName("edit43");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout19);
    obj.label103:setText("+");
    obj.label103:setWidth(10);
    obj.label103:setHeight(30);
    obj.label103:setLeft(570);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setFontColor("black");
    obj.label103:setName("label103");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout19);
    obj.edit44:setField("condfort");
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(30);
    obj.edit44:setLeft(580);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontColor("black");
    obj.edit44:setName("edit44");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle8);
    obj.dataLink4:setFields({'modconstituicao', 'fortitude', 'basefort', 'modfort', 'magicofort', 'outrosfort', 'tempfort', 'condfort'});
    obj.dataLink4:setName("dataLink4");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle8);
    obj.layout20:setWidth(635);
    obj.layout20:setHeight(30);
    obj.layout20:setTop(70);
    obj.layout20:setName("layout20");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout20);
    obj.label104:setText("Reflexos");
    obj.label104:setWidth(210);
    obj.label104:setHeight(30);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setFontColor("black");
    obj.label104:setName("label104");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout20);
    obj.label105:setField("reflexos");
    obj.label105:setWidth(50);
    obj.label105:setHeight(30);
    obj.label105:setLeft(220);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setFontColor("black");
    obj.label105:setName("label105");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout20);
    obj.label106:setText("=");
    obj.label106:setWidth(10);
    obj.label106:setHeight(30);
    obj.label106:setLeft(270);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setFontColor("black");
    obj.label106:setName("label106");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout20);
    obj.edit45:setField("baseref");
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(30);
    obj.edit45:setLeft(280);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontColor("black");
    obj.edit45:setName("edit45");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout20);
    obj.label107:setText("+");
    obj.label107:setWidth(10);
    obj.label107:setHeight(30);
    obj.label107:setLeft(330);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setFontColor("black");
    obj.label107:setName("label107");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout20);
    obj.label108:setField("modref");
    obj.label108:setWidth(50);
    obj.label108:setHeight(30);
    obj.label108:setLeft(340);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setFontColor("black");
    obj.label108:setName("label108");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout20);
    obj.label109:setText("+");
    obj.label109:setWidth(10);
    obj.label109:setHeight(30);
    obj.label109:setLeft(390);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setFontColor("black");
    obj.label109:setName("label109");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout20);
    obj.edit46:setField("magicoref");
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(30);
    obj.edit46:setLeft(400);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontColor("black");
    obj.edit46:setName("edit46");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout20);
    obj.label110:setText("+");
    obj.label110:setWidth(10);
    obj.label110:setHeight(30);
    obj.label110:setLeft(450);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setFontColor("black");
    obj.label110:setName("label110");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout20);
    obj.edit47:setField("outrosref");
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(30);
    obj.edit47:setLeft(460);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontColor("black");
    obj.edit47:setName("edit47");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout20);
    obj.label111:setText("+");
    obj.label111:setWidth(10);
    obj.label111:setHeight(30);
    obj.label111:setLeft(510);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setFontColor("black");
    obj.label111:setName("label111");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout20);
    obj.edit48:setField("tempref");
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(30);
    obj.edit48:setLeft(520);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontColor("black");
    obj.edit48:setName("edit48");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout20);
    obj.label112:setText("+");
    obj.label112:setWidth(10);
    obj.label112:setHeight(30);
    obj.label112:setLeft(570);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setFontColor("black");
    obj.label112:setName("label112");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout20);
    obj.edit49:setField("condref");
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(30);
    obj.edit49:setLeft(580);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontColor("black");
    obj.edit49:setName("edit49");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle8);
    obj.dataLink5:setFields({'moddestreza', 'reflexos', 'baseref', 'modref', 'magicoref', 'outrosref', 'tempref', 'condref'});
    obj.dataLink5:setName("dataLink5");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle8);
    obj.layout21:setWidth(635);
    obj.layout21:setHeight(30);
    obj.layout21:setTop(105);
    obj.layout21:setName("layout21");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout21);
    obj.label113:setText("Vontade");
    obj.label113:setWidth(210);
    obj.label113:setHeight(30);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setFontColor("black");
    obj.label113:setName("label113");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout21);
    obj.label114:setField("vontade");
    obj.label114:setWidth(50);
    obj.label114:setHeight(30);
    obj.label114:setLeft(220);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setFontColor("black");
    obj.label114:setName("label114");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout21);
    obj.label115:setText("=");
    obj.label115:setWidth(10);
    obj.label115:setHeight(30);
    obj.label115:setLeft(270);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setFontColor("black");
    obj.label115:setName("label115");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout21);
    obj.edit50:setField("basevont");
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(30);
    obj.edit50:setLeft(280);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontColor("black");
    obj.edit50:setName("edit50");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout21);
    obj.label116:setText("+");
    obj.label116:setWidth(10);
    obj.label116:setHeight(30);
    obj.label116:setLeft(330);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setFontColor("black");
    obj.label116:setName("label116");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout21);
    obj.label117:setField("modvont");
    obj.label117:setWidth(50);
    obj.label117:setHeight(30);
    obj.label117:setLeft(340);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setFontColor("black");
    obj.label117:setName("label117");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout21);
    obj.label118:setText("+");
    obj.label118:setWidth(10);
    obj.label118:setHeight(30);
    obj.label118:setLeft(390);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setFontColor("black");
    obj.label118:setName("label118");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout21);
    obj.edit51:setField("magicovont");
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(30);
    obj.edit51:setLeft(400);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontColor("black");
    obj.edit51:setName("edit51");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout21);
    obj.label119:setText("+");
    obj.label119:setWidth(10);
    obj.label119:setHeight(30);
    obj.label119:setLeft(450);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setFontColor("black");
    obj.label119:setName("label119");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout21);
    obj.edit52:setField("outrosvont");
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(30);
    obj.edit52:setLeft(460);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontColor("black");
    obj.edit52:setName("edit52");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout21);
    obj.label120:setText("+");
    obj.label120:setWidth(10);
    obj.label120:setHeight(30);
    obj.label120:setLeft(510);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setFontColor("black");
    obj.label120:setName("label120");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout21);
    obj.edit53:setField("tempvont");
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(30);
    obj.edit53:setLeft(520);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontColor("black");
    obj.edit53:setName("edit53");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout21);
    obj.label121:setText("+");
    obj.label121:setWidth(10);
    obj.label121:setHeight(30);
    obj.label121:setLeft(570);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setFontColor("black");
    obj.label121:setName("label121");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout21);
    obj.edit54:setField("condvont");
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(30);
    obj.edit54:setLeft(580);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontColor("black");
    obj.edit54:setName("edit54");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle8);
    obj.dataLink6:setFields({'modsabedoria', 'vontade', 'basevont', 'modvont', 'magicovont', 'outrosvont', 'tempvont', 'condvont'});
    obj.dataLink6:setName("dataLink6");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowLayout1);
    obj.rectangle9:setWidth(635);
    obj.rectangle9:setHeight(105);
    obj.rectangle9:setTop(540);
    obj.rectangle9:setColor("white");
    obj.rectangle9:setName("rectangle9");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle9);
    obj.layout22:setWidth(635);
    obj.layout22:setHeight(30);
    obj.layout22:setName("layout22");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout22);
    obj.label122:setText("Bônus Base de Ataque (BBA)");
    obj.label122:setWidth(200);
    obj.label122:setHeight(30);
    obj.label122:setFontColor("black");
    obj.label122:setName("label122");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout22);
    obj.edit55:setField("bba");
    obj.edit55:setWidth(60);
    obj.edit55:setHeight(30);
    obj.edit55:setLeft(210);
    obj.edit55:setFontColor("black");
    obj.edit55:setName("edit55");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout22);
    obj.label123:setText("Resistência a Magia");
    obj.label123:setWidth(200);
    obj.label123:setHeight(30);
    obj.label123:setLeft(280);
    obj.label123:setFontColor("black");
    obj.label123:setName("label123");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout22);
    obj.edit56:setField("19");
    obj.edit56:setWidth(60);
    obj.edit56:setHeight(30);
    obj.edit56:setLeft(480);
    obj.edit56:setFontColor("black");
    obj.edit56:setName("edit56");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle9);
    obj.layout23:setWidth(635);
    obj.layout23:setHeight(30);
    obj.layout23:setTop(35);
    obj.layout23:setName("layout23");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout23);
    obj.label124:setText("Agarrar");
    obj.label124:setWidth(150);
    obj.label124:setHeight(30);
    obj.label124:setFontColor("black");
    obj.label124:setName("label124");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout23);
    obj.label125:setField("agarrar");
    obj.label125:setWidth(60);
    obj.label125:setHeight(30);
    obj.label125:setLeft(160);
    obj.label125:setFontColor("black");
    obj.label125:setName("label125");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout23);
    obj.label126:setText("=");
    obj.label126:setWidth(15);
    obj.label126:setHeight(30);
    obj.label126:setLeft(220);
    obj.label126:setFontColor("black");
    obj.label126:setName("label126");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout23);
    obj.label127:setField("bbaagarrar");
    obj.label127:setWidth(60);
    obj.label127:setHeight(30);
    obj.label127:setLeft(235);
    obj.label127:setFontColor("black");
    obj.label127:setName("label127");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout23);
    obj.label128:setText("+");
    obj.label128:setWidth(15);
    obj.label128:setHeight(30);
    obj.label128:setLeft(295);
    obj.label128:setFontColor("black");
    obj.label128:setName("label128");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout23);
    obj.label129:setField("foragarrar");
    obj.label129:setWidth(60);
    obj.label129:setHeight(30);
    obj.label129:setLeft(310);
    obj.label129:setFontColor("black");
    obj.label129:setName("label129");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout23);
    obj.label130:setText("+");
    obj.label130:setWidth(15);
    obj.label130:setHeight(30);
    obj.label130:setLeft(370);
    obj.label130:setFontColor("black");
    obj.label130:setName("label130");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout23);
    obj.edit57:setField("tamagarrar");
    obj.edit57:setWidth(60);
    obj.edit57:setHeight(30);
    obj.edit57:setLeft(385);
    obj.edit57:setFontColor("black");
    obj.edit57:setName("edit57");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout23);
    obj.label131:setText("+");
    obj.label131:setWidth(15);
    obj.label131:setHeight(30);
    obj.label131:setLeft(445);
    obj.label131:setFontColor("black");
    obj.label131:setName("label131");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout23);
    obj.edit58:setField("outrosagarrar");
    obj.edit58:setWidth(60);
    obj.edit58:setHeight(30);
    obj.edit58:setLeft(460);
    obj.edit58:setFontColor("black");
    obj.edit58:setName("edit58");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle9);
    obj.dataLink7:setFields({'modforca', 'agarrar', 'bbaagarrar', 'foragarrar', 'tamagarrar', 'outrosagarrar', 'bba'});
    obj.dataLink7:setName("dataLink7");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle9);
    obj.layout24:setWidth(635);
    obj.layout24:setHeight(30);
    obj.layout24:setTop(75);
    obj.layout24:setName("layout24");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout24);
    obj.label132:setText("");
    obj.label132:setWidth(150);
    obj.label132:setHeight(30);
    obj.label132:setFontColor("black");
    obj.label132:setName("label132");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout24);
    obj.label133:setField("Total");
    obj.label133:setWidth(60);
    obj.label133:setHeight(30);
    obj.label133:setLeft(160);
    obj.label133:setFontColor("black");
    obj.label133:setName("label133");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout24);
    obj.label134:setText("");
    obj.label134:setWidth(15);
    obj.label134:setHeight(30);
    obj.label134:setLeft(220);
    obj.label134:setFontColor("black");
    obj.label134:setName("label134");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout24);
    obj.label135:setText("BBA");
    obj.label135:setWidth(60);
    obj.label135:setHeight(30);
    obj.label135:setLeft(235);
    obj.label135:setFontColor("black");
    obj.label135:setName("label135");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout24);
    obj.label136:setText("");
    obj.label136:setWidth(15);
    obj.label136:setHeight(30);
    obj.label136:setLeft(295);
    obj.label136:setFontColor("black");
    obj.label136:setName("label136");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout24);
    obj.label137:setText("Mod Força");
    obj.label137:setFontSize(9);
    obj.label137:setWidth(60);
    obj.label137:setHeight(30);
    obj.label137:setLeft(310);
    obj.label137:setFontColor("black");
    obj.label137:setName("label137");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout24);
    obj.label138:setText("");
    obj.label138:setWidth(15);
    obj.label138:setHeight(30);
    obj.label138:setLeft(370);
    obj.label138:setFontColor("black");
    obj.label138:setName("label138");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout24);
    obj.label139:setText("Mod Tamanho");
    obj.label139:setFontSize(9);
    obj.label139:setWidth(60);
    obj.label139:setHeight(30);
    obj.label139:setLeft(385);
    obj.label139:setFontColor("black");
    obj.label139:setName("label139");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout24);
    obj.label140:setText("");
    obj.label140:setWidth(15);
    obj.label140:setHeight(30);
    obj.label140:setLeft(445);
    obj.label140:setFontColor("black");
    obj.label140:setName("label140");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout24);
    obj.label141:setText("Outros");
    obj.label141:setWidth(60);
    obj.label141:setHeight(30);
    obj.label141:setLeft(460);
    obj.label141:setFontColor("black");
    obj.label141:setName("label141");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowLayout1);
    obj.rectangle10:setWidth(800);
    obj.rectangle10:setHeight(400);
    obj.rectangle10:setTop(650);
    obj.rectangle10:setColor("white");
    obj.rectangle10:setName("rectangle10");

    obj.ataques = gui.fromHandle(_obj_newObject("form"));
    obj.ataques:setParent(obj.rectangle10);
    obj.ataques:setName("ataques");
    obj.ataques:setWidth(800);
    obj.ataques:setHeight(690);

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.ataques);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox2);
    obj.button1:setHeight(30);
    obj.button1:setText("Novo Ataque");
    obj.button1:setWidth(400);
    obj.button1:setName("button1");

    obj.rclataques = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclataques:setParent(obj.scrollBox2);
    obj.rclataques:setName("rclataques");
    obj.rclataques:setField("ataque");
    obj.rclataques:setTemplateForm("ataques");
    obj.rclataques:setTop(60);
    obj.rclataques:setWidth(800);
    obj.rclataques:setHeight(180);
    obj.rclataques:setAutoHeight(true);

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowLayout1);
    obj.rectangle11:setWidth(270);
    obj.rectangle11:setHeight(300);
    obj.rectangle11:setTop(330);
    obj.rectangle11:setLeft(650);
    obj.rectangle11:setColor("white");
    obj.rectangle11:setName("rectangle11");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle11);
    obj.label142:setText("Magia");
    obj.label142:setWidth(150);
    obj.label142:setHeight(30);
    obj.label142:setHorzTextAlign("center");
    obj.label142:setFontColor("black");
    obj.label142:setName("label142");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.rectangle11);
    obj.label143:setText("Nível");
    obj.label143:setWidth(70);
    obj.label143:setHeight(30);
    obj.label143:setLeft(160);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setFontColor("black");
    obj.label143:setName("label143");

    obj.frmFichaTeste = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaTeste:setParent(obj.rectangle11);
    obj.frmFichaTeste:setName("frmFichaTeste");
    obj.frmFichaTeste:setWidth(270);
    obj.frmFichaTeste:setHeight(300);
    obj.frmFichaTeste:setTop(35);

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.frmFichaTeste);
    obj.button2:setHeight(30);
    obj.button2:setText("Nova Magia");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.rclMagias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.frmFichaTeste);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("frmItemDeMagia");
    obj.rclMagias:setTop(60);
    obj.rclMagias:setWidth(270);
    obj.rclMagias:setAutoHeight(true);

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.lista = gui.fromHandle(_obj_newObject("form"));
    obj.lista:setParent(obj.tab2);
    obj.lista:setName("lista");
    obj.lista:setWidth(700);
    obj.lista:setHeight(1000);
    obj.lista:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.lista);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.pericias = gui.fromHandle(_obj_newObject("form"));
    obj.pericias:setParent(obj.scrollBox3);
    obj.pericias:setName("pericias");
    obj.pericias:setWidth(700);
    obj.pericias:setHeight(1000);
    obj.pericias:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.pericias);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox4);
    obj.button3:setLeft(20);
    obj.button3:setTop(20);
    obj.button3:setHeight(30);
    obj.button3:setText("Nova Perícia");
    obj.button3:setWidth(150);
    obj.button3:setName("button3");

    obj.rclpericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclpericias:setParent(obj.scrollBox4);
    obj.rclpericias:setName("rclpericias");
    obj.rclpericias:setField("pericia");
    obj.rclpericias:setTemplateForm("pericia");
    obj.rclpericias:setTop(65);
    obj.rclpericias:setWidth(700);
    obj.rclpericias:setHeight(100);
    obj.rclpericias:setAutoHeight(true);

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Verso");
    obj.tab3:setName("tab3");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.tab3);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setName("rectangle12");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle12);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox5);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setHeight(500);
    obj.flowLayout2:setMargins({left=10, right=10, top=10});
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setLineSpacing(2);
    obj.flowLayout2:setName("flowLayout2");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.flowLayout2);
    obj.rectangle13:setWidth(450);
    obj.rectangle13:setHeight(200);
    obj.rectangle13:setColor("white");
    obj.rectangle13:setName("rectangle13");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle13);
    obj.edit59:setField("20");
    obj.edit59:setWidth(450);
    obj.edit59:setHeight(30);
    obj.edit59:setFontColor("black");
    obj.edit59:setName("edit59");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.rectangle13);
    obj.label144:setText("Experiência");
    obj.label144:setWidth(450);
    obj.label144:setHeight(30);
    obj.label144:setTop(30);
    obj.label144:setHorzTextAlign("center");
    obj.label144:setFontColor("black");
    obj.label144:setName("label144");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle13);
    obj.edit60:setField("21");
    obj.edit60:setWidth(450);
    obj.edit60:setHeight(30);
    obj.edit60:setTop(70);
    obj.edit60:setFontColor("black");
    obj.edit60:setName("edit60");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.rectangle13);
    obj.label145:setText("Teste de Resistência a Magia");
    obj.label145:setWidth(450);
    obj.label145:setHeight(30);
    obj.label145:setTop(100);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setFontColor("black");
    obj.label145:setName("label145");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle13);
    obj.edit61:setField("22");
    obj.edit61:setWidth(450);
    obj.edit61:setHeight(30);
    obj.edit61:setTop(140);
    obj.edit61:setFontColor("black");
    obj.edit61:setName("edit61");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.rectangle13);
    obj.label146:setText("Chance de Falha Arcana (%)");
    obj.label146:setWidth(450);
    obj.label146:setHeight(30);
    obj.label146:setTop(170);
    obj.label146:setHorzTextAlign("center");
    obj.label146:setFontColor("black");
    obj.label146:setName("label146");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.flowLayout2);
    obj.rectangle14:setWidth(450);
    obj.rectangle14:setHeight(200);
    obj.rectangle14:setLeft(455);
    obj.rectangle14:setColor("white");
    obj.rectangle14:setName("rectangle14");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.rectangle14);
    obj.label147:setText("Talentos");
    obj.label147:setWidth(450);
    obj.label147:setHeight(30);
    obj.label147:setHorzTextAlign("center");
    obj.label147:setFontColor("black");
    obj.label147:setName("label147");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle14);
    obj.textEditor1:setField("talentos");
    obj.textEditor1:setWidth(450);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setTop(35);
    obj.textEditor1:setFontColor("black");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.flowLayout2);
    obj.rectangle15:setWidth(450);
    obj.rectangle15:setHeight(200);
    obj.rectangle15:setLeft(455);
    obj.rectangle15:setTop(205);
    obj.rectangle15:setColor("white");
    obj.rectangle15:setName("rectangle15");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.rectangle15);
    obj.label148:setText("Habilidades Especiais");
    obj.label148:setWidth(450);
    obj.label148:setHeight(30);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setFontColor("black");
    obj.label148:setName("label148");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle15);
    obj.textEditor2:setField(" habespeciais");
    obj.textEditor2:setWidth(450);
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setTop(35);
    obj.textEditor2:setFontColor("black");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.flowLayout2);
    obj.rectangle16:setWidth(450);
    obj.rectangle16:setHeight(200);
    obj.rectangle16:setLeft(455);
    obj.rectangle16:setTop(410);
    obj.rectangle16:setColor("white");
    obj.rectangle16:setName("rectangle16");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.rectangle16);
    obj.label149:setText("Idiomas");
    obj.label149:setWidth(450);
    obj.label149:setHeight(30);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setFontColor("black");
    obj.label149:setName("label149");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle16);
    obj.textEditor3:setField("idiomas");
    obj.textEditor3:setWidth(450);
    obj.textEditor3:setHeight(165);
    obj.textEditor3:setTop(35);
    obj.textEditor3:setFontColor("black");
    obj.textEditor3:setName("textEditor3");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.flowLayout2);
    obj.rectangle17:setWidth(450);
    obj.rectangle17:setHeight(260);
    obj.rectangle17:setTop(205);
    obj.rectangle17:setColor("white");
    obj.rectangle17:setName("rectangle17");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle17);
    obj.layout25:setWidth(450);
    obj.layout25:setHeight(130);
    obj.layout25:setName("layout25");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout25);
    obj.label150:setText("Armadura");
    obj.label150:setWidth(210);
    obj.label150:setHeight(30);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setFontColor("black");
    obj.label150:setName("label150");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout25);
    obj.label151:setText("Tipo");
    obj.label151:setWidth(80);
    obj.label151:setHeight(30);
    obj.label151:setLeft(210);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setFontColor("black");
    obj.label151:setName("label151");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout25);
    obj.label152:setText("Bônus CA");
    obj.label152:setWidth(80);
    obj.label152:setHeight(30);
    obj.label152:setLeft(290);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setFontColor("black");
    obj.label152:setName("label152");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout25);
    obj.label153:setText("Des Max.");
    obj.label153:setWidth(80);
    obj.label153:setHeight(30);
    obj.label153:setLeft(370);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setFontColor("black");
    obj.label153:setName("label153");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout25);
    obj.edit62:setField("23");
    obj.edit62:setWidth(210);
    obj.edit62:setHeight(30);
    obj.edit62:setTop(30);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontColor("black");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout25);
    obj.edit63:setField("24");
    obj.edit63:setWidth(80);
    obj.edit63:setHeight(30);
    obj.edit63:setLeft(210);
    obj.edit63:setTop(30);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontColor("black");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout25);
    obj.edit64:setField("armadura");
    obj.edit64:setWidth(80);
    obj.edit64:setHeight(30);
    obj.edit64:setLeft(290);
    obj.edit64:setTop(30);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontColor("black");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout25);
    obj.edit65:setField("25");
    obj.edit65:setWidth(80);
    obj.edit65:setHeight(30);
    obj.edit65:setLeft(370);
    obj.edit65:setTop(30);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontColor("black");
    obj.edit65:setName("edit65");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout25);
    obj.label154:setText("Penalidade");
    obj.label154:setWidth(100);
    obj.label154:setHeight(30);
    obj.label154:setTop(60);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setFontColor("black");
    obj.label154:setName("label154");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout25);
    obj.label155:setText("Chance Falha Mágica");
    obj.label155:setFontSize(8);
    obj.label155:setWidth(100);
    obj.label155:setHeight(30);
    obj.label155:setLeft(100);
    obj.label155:setTop(60);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setFontColor("black");
    obj.label155:setName("label155");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout25);
    obj.label156:setText("Deslocamento");
    obj.label156:setFontSize(9);
    obj.label156:setWidth(75);
    obj.label156:setHeight(30);
    obj.label156:setTop(60);
    obj.label156:setLeft(200);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setFontColor("black");
    obj.label156:setName("label156");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout25);
    obj.label157:setText("Peso");
    obj.label157:setWidth(75);
    obj.label157:setHeight(30);
    obj.label157:setTop(60);
    obj.label157:setLeft(275);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setFontColor("black");
    obj.label157:setName("label157");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout25);
    obj.label158:setText("Propriedades");
    obj.label158:setWidth(100);
    obj.label158:setHeight(30);
    obj.label158:setTop(60);
    obj.label158:setLeft(350);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setFontColor("black");
    obj.label158:setName("label158");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout25);
    obj.edit66:setField("26");
    obj.edit66:setWidth(100);
    obj.edit66:setHeight(30);
    obj.edit66:setTop(90);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontColor("black");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout25);
    obj.edit67:setField("27");
    obj.edit67:setWidth(100);
    obj.edit67:setHeight(30);
    obj.edit67:setLeft(100);
    obj.edit67:setTop(90);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontColor("black");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout25);
    obj.edit68:setField("28");
    obj.edit68:setWidth(75);
    obj.edit68:setHeight(30);
    obj.edit68:setTop(90);
    obj.edit68:setLeft(200);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontColor("black");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout25);
    obj.edit69:setField("29");
    obj.edit69:setWidth(75);
    obj.edit69:setHeight(30);
    obj.edit69:setTop(90);
    obj.edit69:setLeft(275);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontColor("black");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout25);
    obj.edit70:setField("30");
    obj.edit70:setWidth(100);
    obj.edit70:setHeight(30);
    obj.edit70:setTop(90);
    obj.edit70:setLeft(350);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontColor("black");
    obj.edit70:setName("edit70");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle17);
    obj.layout26:setWidth(450);
    obj.layout26:setHeight(130);
    obj.layout26:setTop(135);
    obj.layout26:setName("layout26");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout26);
    obj.label159:setText("Escudo");
    obj.label159:setWidth(210);
    obj.label159:setHeight(30);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setFontColor("black");
    obj.label159:setName("label159");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout26);
    obj.label160:setText("Bônus");
    obj.label160:setWidth(80);
    obj.label160:setHeight(30);
    obj.label160:setLeft(210);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setFontColor("black");
    obj.label160:setName("label160");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout26);
    obj.label161:setText("Peso");
    obj.label161:setWidth(80);
    obj.label161:setHeight(30);
    obj.label161:setLeft(290);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setFontColor("black");
    obj.label161:setName("label161");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout26);
    obj.label162:setText("Penalidade");
    obj.label162:setWidth(80);
    obj.label162:setHeight(30);
    obj.label162:setLeft(370);
    obj.label162:setHorzTextAlign("center");
    obj.label162:setFontColor("black");
    obj.label162:setName("label162");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout26);
    obj.edit71:setField("31");
    obj.edit71:setWidth(210);
    obj.edit71:setHeight(30);
    obj.edit71:setTop(30);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontColor("black");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout26);
    obj.edit72:setField("escudo");
    obj.edit72:setWidth(80);
    obj.edit72:setHeight(30);
    obj.edit72:setLeft(210);
    obj.edit72:setTop(30);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontColor("black");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout26);
    obj.edit73:setField("32");
    obj.edit73:setWidth(80);
    obj.edit73:setHeight(30);
    obj.edit73:setLeft(290);
    obj.edit73:setTop(30);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontColor("black");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout26);
    obj.edit74:setField("33");
    obj.edit74:setWidth(80);
    obj.edit74:setHeight(30);
    obj.edit74:setLeft(370);
    obj.edit74:setTop(30);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontColor("black");
    obj.edit74:setName("edit74");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout26);
    obj.label163:setText("Chance Falha Mágica");
    obj.label163:setWidth(150);
    obj.label163:setHeight(30);
    obj.label163:setTop(60);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setFontColor("black");
    obj.label163:setName("label163");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout26);
    obj.label164:setText("Propriedades");
    obj.label164:setWidth(300);
    obj.label164:setHeight(30);
    obj.label164:setTop(60);
    obj.label164:setLeft(150);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setFontColor("black");
    obj.label164:setName("label164");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout26);
    obj.edit75:setField("34");
    obj.edit75:setWidth(150);
    obj.edit75:setHeight(30);
    obj.edit75:setTop(90);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontColor("black");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout26);
    obj.edit76:setField("35");
    obj.edit76:setWidth(300);
    obj.edit76:setHeight(30);
    obj.edit76:setTop(90);
    obj.edit76:setLeft(150);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontColor("black");
    obj.edit76:setName("edit76");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.flowLayout2);
    obj.rectangle18:setWidth(450);
    obj.rectangle18:setHeight(150);
    obj.rectangle18:setTop(465);
    obj.rectangle18:setColor("white");
    obj.rectangle18:setName("rectangle18");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle18);
    obj.layout27:setWidth(300);
    obj.layout27:setHeight(150);
    obj.layout27:setName("layout27");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout27);
    obj.label165:setText("Outros Itens");
    obj.label165:setWidth(450);
    obj.label165:setHeight(30);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setFontColor("black");
    obj.label165:setName("label165");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout27);
    obj.textEditor4:setField("outrositens");
    obj.textEditor4:setWidth(450);
    obj.textEditor4:setHeight(130);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setFontColor("black");
    obj.textEditor4:setName("textEditor4");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle18);
    obj.layout28:setWidth(145);
    obj.layout28:setHeight(150);
    obj.layout28:setLeft(305);
    obj.layout28:setName("layout28");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout28);
    obj.label166:setText("Dinheiro");
    obj.label166:setWidth(145);
    obj.label166:setHeight(30);
    obj.label166:setHorzTextAlign("center");
    obj.label166:setFontColor("black");
    obj.label166:setName("label166");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout28);
    obj.label167:setText("PC");
    obj.label167:setWidth(45);
    obj.label167:setHeight(30);
    obj.label167:setTop(30);
    obj.label167:setFontColor("black");
    obj.label167:setName("label167");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout28);
    obj.edit77:setField("36");
    obj.edit77:setWidth(100);
    obj.edit77:setHeight(30);
    obj.edit77:setTop(30);
    obj.edit77:setLeft(50);
    obj.edit77:setFontColor("black");
    obj.edit77:setName("edit77");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout28);
    obj.label168:setText("PP");
    obj.label168:setWidth(45);
    obj.label168:setHeight(30);
    obj.label168:setTop(60);
    obj.label168:setFontColor("black");
    obj.label168:setName("label168");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout28);
    obj.edit78:setField("37");
    obj.edit78:setWidth(100);
    obj.edit78:setHeight(30);
    obj.edit78:setTop(60);
    obj.edit78:setLeft(50);
    obj.edit78:setFontColor("black");
    obj.edit78:setName("edit78");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout28);
    obj.label169:setText("PO");
    obj.label169:setWidth(45);
    obj.label169:setHeight(30);
    obj.label169:setTop(90);
    obj.label169:setFontColor("black");
    obj.label169:setName("label169");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout28);
    obj.edit79:setField("38");
    obj.edit79:setWidth(100);
    obj.edit79:setHeight(30);
    obj.edit79:setTop(90);
    obj.edit79:setLeft(50);
    obj.edit79:setFontColor("black");
    obj.edit79:setName("edit79");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout28);
    obj.label170:setText("PL");
    obj.label170:setWidth(45);
    obj.label170:setHeight(30);
    obj.label170:setTop(120);
    obj.label170:setFontColor("black");
    obj.label170:setName("label170");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout28);
    obj.edit80:setField("39");
    obj.edit80:setWidth(100);
    obj.edit80:setHeight(30);
    obj.edit80:setTop(120);
    obj.edit80:setLeft(50);
    obj.edit80:setFontColor("black");
    obj.edit80:setName("edit80");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("História");
    obj.tab4:setName("tab4");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.tab4);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("historia");
    obj.textEditor5:setFontColor("black");
    obj.textEditor5:setMargins({left=2, right=2, top=2, bottom=2});
    obj.textEditor5:setName("textEditor5");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.tab5);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("anotacoes");
    obj.textEditor6:setFontColor("black");
    obj.textEditor6:setMargins({left=2, right=2, top=2, bottom=2});
    obj.textEditor6:setName("textEditor6");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.forca or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modforca = mod;
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.destreza or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.moddestreza = mod;
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.constituicao or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modconstituicao = mod;
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.inteligencia or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modinteligencia = mod;
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.sabedoria or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modsabedoria = mod;
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.carisma or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modcarisma = mod;
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tforca or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtforca = mod;
        end, obj);

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tdestreza or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtdestreza = mod;
        end, obj);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tconstituicao or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtconstituicao = mod;
        end, obj);

    obj._e_event9 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tinteligencia or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtinteligencia = mod;
        end, obj);

    obj._e_event10 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tsabedoria or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtsabedoria = mod;
        end, obj);

    obj._e_event11 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = math.floor(((sheet.tcarisma or 10) / 2) - 5);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.modtcarisma = mod;
        end, obj);

    obj._e_event12 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.ca3 = sheet.moddestreza;
            									sheet.ca1 = sheet.armadura;
            									sheet.ca2 = sheet.escudo;
        end, obj);

    obj._e_event13 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.totalca = (math.floor((sheet.ca3)or 0)+math.floor((sheet.ca1)or 0)+math.floor((sheet.ca2)or 0)+math.floor((sheet.outrosca)or 0)+math.floor((sheet.deflexao)or 0)+math.floor((sheet.catamanho)or 0)+math.floor((sheet.caarmaduranatural)or 0))+10;
        end, obj);

    obj._e_event14 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.ini1 = sheet.moddestreza ;
        end, obj);

    obj._e_event15 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.iniciativa = (math.floor((sheet.ini1)or 0)+ math.floor((sheet.ini2)or 0));
        end, obj);

    obj._e_event16 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.modfort = sheet.modconstituicao ;
        end, obj);

    obj._e_event17 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.fortitude = (	math.floor((sheet.basefort)or 0)+ math.floor((sheet.modfort)or 0)+ 
            									math.floor((sheet.magicofort)or 0)+ math.floor((sheet.outrosfort)or 0)+ 
            									math.floor((sheet.tempfort)or 0)+ math.floor((sheet.condfort)or 0));
        end, obj);

    obj._e_event18 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.modref = sheet.moddestreza ;
        end, obj);

    obj._e_event19 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.reflexos = (	math.floor((sheet.baseref)or 0)+ math.floor((sheet.modref)or 0)+ 
            									math.floor((sheet.magicoref)or 0)+ math.floor((sheet.outrosref)or 0)+ 
            									math.floor((sheet.tempref)or 0)+ math.floor((sheet.condref)or 0));
        end, obj);

    obj._e_event20 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.modvont = sheet.modsabedoria ;
        end, obj);

    obj._e_event21 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.vontade = (	math.floor((sheet.basevont)or 0)+ math.floor((sheet.modvont)or 0)+ 
            									math.floor((sheet.magicovont)or 0)+ math.floor((sheet.outrosvont)or 0)+ 
            									math.floor((sheet.tempvont)or 0)+ math.floor((sheet.condvont)or 0));
        end, obj);

    obj._e_event22 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.foragarrar = sheet.modforca ;
            									sheet.bbaagarrar = sheet.bba;
        end, obj);

    obj._e_event23 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.agarrar = (	math.floor((sheet.bbaagarrar)or 0)+ math.floor((sheet.foragarrar)or 0)+ 
            									math.floor((sheet.tamagarrar)or 0)+ math.floor((sheet.outrosagarrar)or 0));
        end, obj);

    obj._e_event24 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclataques:append();
        end, obj);

    obj._e_event25 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclMagias:append();
        end, obj);

    obj._e_event26 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclpericias:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.lista ~= nil then self.lista:destroy(); self.lista = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.frmFichaTeste ~= nil then self.frmFichaTeste:destroy(); self.frmFichaTeste = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rclpericias ~= nil then self.rclpericias:destroy(); self.rclpericias = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rclataques ~= nil then self.rclataques:destroy(); self.rclataques = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.pericias ~= nil then self.pericias:destroy(); self.pericias = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.ataques ~= nil then self.ataques:destroy(); self.ataques = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _dnd = {
    newEditor = newdnd, 
    new = newdnd, 
    name = "dnd", 
    dataType = "dnd35", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "dnd", 
    description=""};

dnd = _dnd;
rrpg.registrarForm(_dnd);
rrpg.registrarDataType(_dnd);

return _dnd;
