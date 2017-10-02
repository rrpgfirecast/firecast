require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmLH2()
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
    obj:setName("frmLH2");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(205);
    obj.layout1:setName("layout1");

    obj.boxDetalhesDoJutsu = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoJutsu:setParent(obj.layout1);
    obj.boxDetalhesDoJutsu:setName("boxDetalhesDoJutsu");
    obj.boxDetalhesDoJutsu:setVisible(true);
    obj.boxDetalhesDoJutsu:setAlign("left");
    obj.boxDetalhesDoJutsu:setWidth(600);

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoJutsu);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(205);
    obj.rectangle1:setWidth(590);
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(200);
    obj.layout2:setMargins({bottom=4, top=4, left=4, right=4});
    obj.layout2:setName("layout2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({left=2});
    obj.layout3:setName("layout3");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("top");
    obj.label1:setText("Descrição");
    obj.label1:setHeight(30);
    obj.label1:setAutoSize(true);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.DescJutsu = gui.fromHandle(_obj_newObject("textEditor"));
    obj.DescJutsu:setParent(obj.layout3);
    obj.DescJutsu:setAlign("top");
    obj.DescJutsu:setName("DescJutsu");
    obj.DescJutsu:setField("campoTextoGrande2");
    obj.DescJutsu:setHeight(150);

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setAlign("top");
    obj.button1:setText("Copiar informações (Ctrl+C)");
    obj.button1:setHeight(30);
    obj.button1:setName("button1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(380);
    obj.layout4:setName("layout4");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({bottom=4, top=4 ,right=4});
    obj.layout5:setName("layout5");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome");
    obj.label2:setWidth(100);
    obj.label2:setAutoSize(true);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoJutsu");
    obj.edit1:setName("edit1");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4, right=4});
    obj.layout6:setName("layout6");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setAlign("left");
    obj.label3:setText("Gasto");
    obj.label3:setWidth(100);
    obj.label3:setAutoSize(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setAlign("client");
    obj.edit2:setField("campoGasto");
    obj.edit2:setName("edit2");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setMargins({bottom=4, right=4});
    obj.layout7:setName("layout7");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("left");
    obj.label4:setText("Quantidade");
    obj.label4:setWidth(100);
    obj.label4:setAutoSize(true);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout7);
    obj.edit3:setAlign("client");
    obj.edit3:setField("campoQuantidade");
    obj.edit3:setName("edit3");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(30);
    obj.layout8:setMargins({bottom=4, right=4});
    obj.layout8:setName("layout8");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setAlign("left");
    obj.label5:setText("Alcance");
    obj.label5:setWidth(100);
    obj.label5:setAutoSize(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setAlign("client");
    obj.edit4:setField("campoAlcance");
    obj.edit4:setName("edit4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(30);
    obj.layout9:setMargins({bottom=4, right=4});
    obj.layout9:setName("layout9");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout9);
    obj.label6:setAlign("left");
    obj.label6:setText("Tempo");
    obj.label6:setWidth(100);
    obj.label6:setAutoSize(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout9);
    obj.edit5:setAlign("client");
    obj.edit5:setField("campoTempo");
    obj.edit5:setName("edit5");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout4);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(30);
    obj.layout10:setMargins({bottom=4, right=4});
    obj.layout10:setName("layout10");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout10);
    obj.label7:setAlign("left");
    obj.label7:setText("Dano");
    obj.label7:setWidth(100);
    obj.label7:setAutoSize(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setAlign("client");
    obj.edit6:setField("campoDano");
    obj.edit6:setName("edit6");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(200);
    obj.layout11:setName("layout11");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(200);
    obj.layout12:setName("layout12");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout12);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setColor("grey");
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout13);
    obj.button2:setText("Adicionar Ninjutsu");
    obj.button2:setWidth(200);
    obj.button2:setAlign("client");
    obj.button2:setMargins({left=2, right=2});
    obj.button2:setName("button2");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(170);
    obj.layout14:setFrameStyle("/Ficha LH/frames/ninjutsu.xml");
    obj.layout14:setName("layout14");

    obj.rclListaDosNinjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosNinjutsus:setParent(obj.layout14);
    obj.rclListaDosNinjutsus:setName("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setField("campoDosNinjutsus");
    obj.rclListaDosNinjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosNinjutsus:setAlign("client");
    obj.rclListaDosNinjutsus:setHeight(200);
    obj.rclListaDosNinjutsus:setSelectable(true);

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(200);
    obj.layout15:setName("layout15");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout15);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle3);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout16);
    obj.button3:setText("Adicionar Genjutsu");
    obj.button3:setWidth(200);
    obj.button3:setAlign("client");
    obj.button3:setMargins({left=2, right=2});
    obj.button3:setName("button3");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle3);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(170);
    obj.layout17:setFrameStyle("/Ficha LH/frames/genjutsu.xml");
    obj.layout17:setName("layout17");

    obj.rclListaDosGenjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosGenjutsus:setParent(obj.layout17);
    obj.rclListaDosGenjutsus:setName("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setField("campoDosGenjutsus");
    obj.rclListaDosGenjutsus:setTemplateForm("frmLH2_2");
    obj.rclListaDosGenjutsus:setAlign("client");
    obj.rclListaDosGenjutsus:setHeight(200);
    obj.rclListaDosGenjutsus:setSelectable(true);

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout11);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(200);
    obj.layout18:setName("layout18");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout18);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setColor("grey");
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle4);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout19);
    obj.button4:setText("Adicionar Taijutsu");
    obj.button4:setWidth(200);
    obj.button4:setAlign("client");
    obj.button4:setMargins({left=2, right=2});
    obj.button4:setName("button4");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle4);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(170);
    obj.layout20:setFrameStyle("/Ficha LH/frames/taijutsu.xml");
    obj.layout20:setName("layout20");

    obj.rclListaDosTaijutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTaijutsus:setParent(obj.layout20);
    obj.rclListaDosTaijutsus:setName("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setField("campoDosTaijutsus");
    obj.rclListaDosTaijutsus:setTemplateForm("frmLH2_3");
    obj.rclListaDosTaijutsus:setAlign("client");
    obj.rclListaDosTaijutsus:setHeight(300);
    obj.rclListaDosTaijutsus:setSelectable(true);

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(200);
    obj.layout21:setName("layout21");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(200);
    obj.layout22:setName("layout22");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout22);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setColor("grey");
    obj.rectangle5:setWidth(200);
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle5);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(30);
    obj.layout23:setName("layout23");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout23);
    obj.button5:setText("Adicionar Básicos");
    obj.button5:setWidth(200);
    obj.button5:setAlign("client");
    obj.button5:setMargins({left=2, right=2});
    obj.button5:setName("button5");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle5);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(170);
    obj.layout24:setFrameStyle("/Ficha LH/frames/basicos.xml");
    obj.layout24:setName("layout24");

    obj.rclListaDosBasicos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosBasicos:setParent(obj.layout24);
    obj.rclListaDosBasicos:setName("rclListaDosBasicos");
    obj.rclListaDosBasicos:setField("campoDosBasicos");
    obj.rclListaDosBasicos:setTemplateForm("frmLH3_1");
    obj.rclListaDosBasicos:setAlign("client");
    obj.rclListaDosBasicos:setHeight(200);
    obj.rclListaDosBasicos:setSelectable(true);

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(200);
    obj.layout25:setName("layout25");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout25);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setColor("grey");
    obj.rectangle6:setWidth(200);
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle6);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(30);
    obj.layout26:setName("layout26");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout26);
    obj.button6:setText("Adicionar Jutsu do Clan");
    obj.button6:setWidth(200);
    obj.button6:setAlign("client");
    obj.button6:setMargins({left=2, right=2});
    obj.button6:setName("button6");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle6);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(170);
    obj.layout27:setFrameStyle("/Ficha LH/frames/jutsuclan.xml");
    obj.layout27:setName("layout27");

    obj.rclListaDosClans = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosClans:setParent(obj.layout27);
    obj.rclListaDosClans:setName("rclListaDosClans");
    obj.rclListaDosClans:setField("campoDosClans");
    obj.rclListaDosClans:setTemplateForm("frmLH3_2");
    obj.rclListaDosClans:setAlign("client");
    obj.rclListaDosClans:setHeight(200);
    obj.rclListaDosClans:setSelectable(true);

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(200);
    obj.layout28:setName("layout28");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout28);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setColor("grey");
    obj.rectangle7:setWidth(200);
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle7);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(30);
    obj.layout29:setName("layout29");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout29);
    obj.button7:setText("Adicionar Kekkei Genkai");
    obj.button7:setWidth(200);
    obj.button7:setAlign("client");
    obj.button7:setMargins({left=2, right=2});
    obj.button7:setName("button7");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle7);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(170);
    obj.layout30:setFrameStyle("/Ficha LH/frames/kekkei.xml");
    obj.layout30:setName("layout30");

    obj.rclListaDosKekkeis = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKekkeis:setParent(obj.layout30);
    obj.rclListaDosKekkeis:setName("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setField("campoDosKekkeis");
    obj.rclListaDosKekkeis:setTemplateForm("frmLH3_3");
    obj.rclListaDosKekkeis:setAlign("client");
    obj.rclListaDosKekkeis:setHeight(300);
    obj.rclListaDosKekkeis:setSelectable(true);

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox1);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(200);
    obj.layout31:setName("layout31");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(200);
    obj.layout32:setName("layout32");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout32);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setColor("grey");
    obj.rectangle8:setWidth(200);
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle8);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(30);
    obj.layout33:setName("layout33");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout33);
    obj.button8:setText("Adicionar Kenjutu");
    obj.button8:setWidth(200);
    obj.button8:setAlign("client");
    obj.button8:setMargins({left=2, right=2});
    obj.button8:setName("button8");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle8);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(170);
    obj.layout34:setFrameStyle("/Ficha LH/frames/kenjutsu.xml");
    obj.layout34:setName("layout34");

    obj.rclListaDosKenjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKenjutsus:setParent(obj.layout34);
    obj.rclListaDosKenjutsus:setName("rclListaDosKenjutsus");
    obj.rclListaDosKenjutsus:setField("campoDosKenjutsus");
    obj.rclListaDosKenjutsus:setTemplateForm("frmLH4_1");
    obj.rclListaDosKenjutsus:setAlign("client");
    obj.rclListaDosKenjutsus:setHeight(200);
    obj.rclListaDosKenjutsus:setSelectable(true);

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout31);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(200);
    obj.layout35:setName("layout35");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout35);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setColor("grey");
    obj.rectangle9:setWidth(200);
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle9);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(30);
    obj.layout36:setName("layout36");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout36);
    obj.button9:setText("Adicionar Kuchyose");
    obj.button9:setWidth(200);
    obj.button9:setAlign("client");
    obj.button9:setMargins({left=2, right=2});
    obj.button9:setName("button9");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle9);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(170);
    obj.layout37:setFrameStyle("/Ficha LH/frames/kuchyose.xml");
    obj.layout37:setName("layout37");

    obj.rclListaDosKuchyoses = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.layout37);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("campoDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH4_2");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(200);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout31);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(200);
    obj.layout38:setName("layout38");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout38);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setColor("grey");
    obj.rectangle10:setWidth(200);
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle10);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);
    obj.layout39:setName("layout39");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout39);
    obj.button10:setText("Adicionar Estilo de Luta");
    obj.button10:setWidth(200);
    obj.button10:setAlign("client");
    obj.button10:setMargins({left=2, right=2});
    obj.button10:setName("button10");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle10);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(170);
    obj.layout40:setFrameStyle("/Ficha LH/frames/estilo.xml");
    obj.layout40:setName("layout40");

    obj.rclListaDosEstLutas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.layout40);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("campoDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH4_3");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(300);
    obj.rclListaDosEstLutas:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            require("system.lua");
                                                jutsu = (self.boxDetalhesDoJutsu.node.campoJutsu or "--//--");
                                                desc = (self.boxDetalhesDoJutsu.node.campoTextoGrande2 or "--//--");
                                                gasto = (self.boxDetalhesDoJutsu.node.campoGasto or "--//--");
                                                quant = (self.boxDetalhesDoJutsu.node.campoQuantidade or "--//--");
                                                alcan = (self.boxDetalhesDoJutsu.node.CampoAlcance or "--//--");
                                                tempo = (self.boxDetalhesDoJutsu.node.CampoTempo or "--//--");
                                                dano = (self.boxDetalhesDoJutsu.node.CampoDano or "--//--");
                                                System.setClipboardText("Nome: " .. jutsu .. "\n"
                                                                     .. "Descrição: " .. desc .. "\n"
                                                                     .. "Gasto: " .. gasto .. "\n"
                                                                     .. "Quantidade: " .. quant .. "\n"
                                                                     .. "Alcance: " .. alcan .. "\n"
                                                                     .. "Tempo: " .. tempo .. "\n"
                                                                     .. "Dano: " .. dano);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclListaDosNinjutsus:append();
        end, obj);

    obj._e_event2 = obj.rclListaDosNinjutsus:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosNinjutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosBasicos.selectedNode = nil;   
                                            self.rclListaDosClans.selectedNode = nil;   
                                            self.rclListaDosKekkeis.selectedNode = nil;     
                                            self.rclListaDosKenjutsus.selectedNode = nil;   
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclListaDosGenjutsus:append();
        end, obj);

    obj._e_event4 = obj.rclListaDosGenjutsus:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosGenjutsus.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosBasicos.selectedNode = nil;   
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosKenjutsus.selectedNode = nil;   
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclListaDosTaijutsus:append();
        end, obj);

    obj._e_event6 = obj.rclListaDosTaijutsus:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosTaijutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;   
                                            self.rclListaDosBasicos.selectedNode = nil; 
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKekkeis.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;     
                                            self.rclListaDosKuchyoses.selectedNode = nil;     
                                            self.rclListaDosEstLutas.selectedNode = nil;                  
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclListaDosBasicos:append();
        end, obj);

    obj._e_event8 = obj.rclListaDosBasicos:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosBasicos.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;  
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclListaDosClans:append();
        end, obj);

    obj._e_event10 = obj.rclListaDosClans:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosClans.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosGenjutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event11 = obj.button7:addEventListener("onClick",
        function (self)
            self.rclListaDosKekkeis:append();
        end, obj);

    obj._e_event12 = obj.rclListaDosKekkeis:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosKekkeis.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event13 = obj.button8:addEventListener("onClick",
        function (self)
            self.rclListaDosKenjutsus:append();
        end, obj);

    obj._e_event14 = obj.rclListaDosKenjutsus:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosKenjutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;  
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosBasicos.selectedNode = nil;  
                                            self.rclListaDosKuchyoses.selectedNode = nil; 
                                            self.rclListaDosEstLutas.selectedNode = nil; 
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event15 = obj.button9:addEventListener("onClick",
        function (self)
            self.rclListaDosKuchyoses:append();
        end, obj);

    obj._e_event16 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosKuchyoses.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosGenjutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (self)
            self.rclListaDosEstLutas:append();
        end, obj);

    obj._e_event18 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosEstLutas.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rclListaDosClans ~= nil then self.rclListaDosClans:destroy(); self.rclListaDosClans = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.rclListaDosKekkeis ~= nil then self.rclListaDosKekkeis:destroy(); self.rclListaDosKekkeis = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.rclListaDosBasicos ~= nil then self.rclListaDosBasicos:destroy(); self.rclListaDosBasicos = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rclListaDosKenjutsus ~= nil then self.rclListaDosKenjutsus:destroy(); self.rclListaDosKenjutsus = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rclListaDosGenjutsus ~= nil then self.rclListaDosGenjutsus:destroy(); self.rclListaDosGenjutsus = nil; end;
        if self.DescJutsu ~= nil then self.DescJutsu:destroy(); self.DescJutsu = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.boxDetalhesDoJutsu ~= nil then self.boxDetalhesDoJutsu:destroy(); self.boxDetalhesDoJutsu = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rclListaDosNinjutsus ~= nil then self.rclListaDosNinjutsus:destroy(); self.rclListaDosNinjutsus = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rclListaDosTaijutsus ~= nil then self.rclListaDosTaijutsus:destroy(); self.rclListaDosTaijutsus = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmLH2 = {
    newEditor = newfrmLH2, 
    new = newfrmLH2, 
    name = "frmLH2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH2 = _frmLH2;
rrpg.registrarForm(_frmLH2);

return _frmLH2;
