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

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgGeneral");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("bgGeneral");
    obj.dataLink1:setDefaultValue("http://blob.firecast.com.br/blobs/WRKNFRIT_1601940/Aba_01.jpg");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1200);
    obj.layout1:setHeight(570);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(150);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("Nome");
    obj.label1:setWidth(150);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setAlign("client");
    obj.image2:setField("classeIcon");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("Classe");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTop(20);
    obj.edit2:setField("classe");
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("Especialização");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(20);
    obj.edit3:setField("especializacao");
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(30);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("Nível");
    obj.label4:setWidth(30);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTop(20);
    obj.edit4:setField("level");
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(100);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("Experiência");
    obj.label5:setWidth(100);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTop(20);
    obj.edit5:setField("exp");
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(30);
    obj.layout7:setMargins({right=5});
    obj.layout7:setName("layout7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setText("Job");
    obj.label6:setWidth(30);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setTop(20);
    obj.edit6:setField("job");
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(150);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setText("Personalidade");
    obj.label7:setWidth(150);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setTop(20);
    obj.edit7:setField("personalidade");
    obj.edit7:setWidth(150);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(100);
    obj.layout9:setMargins({right=5});
    obj.layout9:setName("layout9");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setText("Aparência");
    obj.label8:setWidth(100);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(13);
    obj.label8:setName("label8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setTop(20);
    obj.edit8:setField("aparencia");
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setName("edit8");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(305);
    obj.rectangle3:setMargins({bottom=5});
    obj.rectangle3:setName("rectangle3");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle3);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(220);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({top=5});
    obj.layout11:setName("layout11");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout11);
    obj.button1:setText("Força");
    obj.button1:setAlign("left");
    obj.button1:setWidth(100);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setField("atr_FORBase");
    obj.edit9:setLeft(105);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout11);
    obj.label9:setText("+");
    obj.label9:setLeft(135);
    obj.label9:setWidth(10);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setField("atr_FORExtra");
    obj.edit10:setLeft(145);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setText("=");
    obj.label10:setLeft(175);
    obj.label10:setWidth(10);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout11);
    obj.rectangle4:setLeft(185);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setField("atr_FORTotal");
    obj.label11:setLeft(185);
    obj.label11:setWidth(30);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setFields({'atr_FORBase','atr_FORExtra'});
    obj.dataLink2:setName("dataLink2");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({top=5});
    obj.layout12:setName("layout12");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout12);
    obj.button2:setText("Habilidade");
    obj.button2:setAlign("left");
    obj.button2:setWidth(100);
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setField("atr_HABBase");
    obj.edit11:setLeft(105);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setText("+");
    obj.label12:setLeft(135);
    obj.label12:setWidth(10);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setField("atr_HABExtra");
    obj.edit12:setLeft(145);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout12);
    obj.label13:setText("=");
    obj.label13:setLeft(175);
    obj.label13:setWidth(10);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout12);
    obj.rectangle5:setLeft(185);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout12);
    obj.label14:setField("atr_HABTotal");
    obj.label14:setLeft(185);
    obj.label14:setWidth(30);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setFields({'atr_HABBase','atr_HABExtra'});
    obj.dataLink3:setName("dataLink3");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setMargins({top=5});
    obj.layout13:setName("layout13");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout13);
    obj.button3:setText("Agilidade");
    obj.button3:setAlign("left");
    obj.button3:setWidth(100);
    obj.button3:setHorzTextAlign("center");
    obj.button3:setName("button3");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setField("atr_AGIBase");
    obj.edit13:setLeft(105);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("+");
    obj.label15:setLeft(135);
    obj.label15:setWidth(10);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setField("atr_AGIExtra");
    obj.edit14:setLeft(145);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setText("=");
    obj.label16:setLeft(175);
    obj.label16:setWidth(10);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout13);
    obj.rectangle6:setLeft(185);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setField("atr_AGITotal");
    obj.label17:setLeft(185);
    obj.label17:setWidth(30);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setFields({'atr_AGIBase','atr_AGIExtra'});
    obj.dataLink4:setName("dataLink4");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout10);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setMargins({top=5});
    obj.layout14:setName("layout14");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout14);
    obj.button4:setText("Vitalidade");
    obj.button4:setAlign("left");
    obj.button4:setWidth(100);
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setField("atr_VITBase");
    obj.edit15:setLeft(105);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout14);
    obj.label18:setText("+");
    obj.label18:setLeft(135);
    obj.label18:setWidth(10);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setField("atr_VITExtra");
    obj.edit16:setLeft(145);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setText("=");
    obj.label19:setLeft(175);
    obj.label19:setWidth(10);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout14);
    obj.rectangle7:setLeft(185);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setField("atr_VITTotal");
    obj.label20:setLeft(185);
    obj.label20:setWidth(30);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout10);
    obj.dataLink5:setFields({'atr_VITBase','atr_VITExtra'});
    obj.dataLink5:setName("dataLink5");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setMargins({top=5});
    obj.layout15:setName("layout15");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout15);
    obj.button5:setText("Inteligência");
    obj.button5:setAlign("left");
    obj.button5:setWidth(100);
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setField("atr_INTBase");
    obj.edit17:setLeft(105);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout15);
    obj.label21:setText("+");
    obj.label21:setLeft(135);
    obj.label21:setWidth(10);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setField("atr_INTExtra");
    obj.edit18:setLeft(145);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22:setText("=");
    obj.label22:setLeft(175);
    obj.label22:setWidth(10);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout15);
    obj.rectangle8:setLeft(185);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout15);
    obj.label23:setField("atr_INTTotal");
    obj.label23:setLeft(185);
    obj.label23:setWidth(30);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setFields({'atr_INTBase','atr_INTExtra'});
    obj.dataLink6:setName("dataLink6");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout10);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setMargins({top=5});
    obj.layout16:setName("layout16");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout16);
    obj.button6:setText("Destreza");
    obj.button6:setAlign("left");
    obj.button6:setWidth(100);
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout16);
    obj.edit19:setField("atr_DESBase");
    obj.edit19:setLeft(105);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24:setText("+");
    obj.label24:setLeft(135);
    obj.label24:setWidth(10);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setField("atr_DESExtra");
    obj.edit20:setLeft(145);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout16);
    obj.label25:setText("=");
    obj.label25:setLeft(175);
    obj.label25:setWidth(10);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout16);
    obj.rectangle9:setLeft(185);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout16);
    obj.label26:setField("atr_DESTotal");
    obj.label26:setLeft(185);
    obj.label26:setWidth(30);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout10);
    obj.dataLink7:setFields({'atr_DESBase','atr_DESExtra'});
    obj.dataLink7:setName("dataLink7");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout10);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setMargins({top=5});
    obj.layout17:setName("layout17");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout17);
    obj.button7:setText("Sorte");
    obj.button7:setAlign("left");
    obj.button7:setWidth(100);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout17);
    obj.edit21:setField("atr_SORBase");
    obj.edit21:setLeft(105);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setText("+");
    obj.label27:setLeft(135);
    obj.label27:setWidth(10);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setField("atr_SORExtra");
    obj.edit22:setLeft(145);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout17);
    obj.label28:setText("=");
    obj.label28:setLeft(175);
    obj.label28:setWidth(10);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout17);
    obj.rectangle10:setLeft(185);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout17);
    obj.label29:setField("atr_SORTotal");
    obj.label29:setLeft(185);
    obj.label29:setWidth(30);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout10);
    obj.dataLink8:setFields({'atr_SORBase','atr_SORExtra'});
    obj.dataLink8:setName("dataLink8");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout10);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setMargins({top=5});
    obj.layout18:setName("layout18");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout18);
    obj.button8:setText("Magia");
    obj.button8:setAlign("left");
    obj.button8:setWidth(100);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout18);
    obj.edit23:setField("atr_MAGBase");
    obj.edit23:setLeft(105);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout18);
    obj.label30:setText("+");
    obj.label30:setLeft(135);
    obj.label30:setWidth(10);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setField("atr_MAGExtra");
    obj.edit24:setLeft(145);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31:setText("=");
    obj.label31:setLeft(175);
    obj.label31:setWidth(10);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout18);
    obj.rectangle11:setLeft(185);
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setField("atr_MAGTotal");
    obj.label32:setLeft(185);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout10);
    obj.dataLink9:setFields({'atr_MAGBase','atr_MAGExtra'});
    obj.dataLink9:setName("dataLink9");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout10);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({top=5});
    obj.layout19:setName("layout19");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout19);
    obj.button9:setText("Defesa");
    obj.button9:setAlign("left");
    obj.button9:setWidth(100);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout19);
    obj.edit25:setField("atr_DEFBase");
    obj.edit25:setLeft(105);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout19);
    obj.label33:setText("+");
    obj.label33:setLeft(135);
    obj.label33:setWidth(10);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26:setField("atr_DEFExtra");
    obj.edit26:setLeft(145);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout19);
    obj.label34:setText("=");
    obj.label34:setLeft(175);
    obj.label34:setWidth(10);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout19);
    obj.rectangle12:setLeft(185);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout19);
    obj.label35:setField("atr_DEFTotal");
    obj.label35:setLeft(185);
    obj.label35:setWidth(30);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout10);
    obj.dataLink10:setFields({'atr_DEFBase','atr_DEFExtra'});
    obj.dataLink10:setName("dataLink10");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout10);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setMargins({top=5});
    obj.layout20:setName("layout20");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout20);
    obj.button10:setText("Defesa Mágica");
    obj.button10:setAlign("left");
    obj.button10:setWidth(100);
    obj.button10:setHorzTextAlign("center");
    obj.button10:setName("button10");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout20);
    obj.edit27:setField("atr_M.DEFBase");
    obj.edit27:setLeft(105);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setText("+");
    obj.label36:setLeft(135);
    obj.label36:setWidth(10);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout20);
    obj.edit28:setField("atr_M.DEFExtra");
    obj.edit28:setLeft(145);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout20);
    obj.label37:setText("=");
    obj.label37:setLeft(175);
    obj.label37:setWidth(10);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout20);
    obj.rectangle13:setLeft(185);
    obj.rectangle13:setWidth(30);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout20);
    obj.label38:setField("atr_M.DEFTotal");
    obj.label38:setLeft(185);
    obj.label38:setWidth(30);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout10);
    obj.dataLink11:setFields({'atr_M.DEFBase','atr_M.DEFExtra'});
    obj.dataLink11:setName("dataLink11");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle3);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(220);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({top=5});
    obj.layout22:setName("layout22");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout22);
    obj.button11:setText("Pulo");
    obj.button11:setAlign("left");
    obj.button11:setWidth(100);
    obj.button11:setHorzTextAlign("center");
    obj.button11:setName("button11");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout22);
    obj.edit29:setField("atr_PULBase");
    obj.edit29:setLeft(105);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout22);
    obj.label39:setText("+");
    obj.label39:setLeft(135);
    obj.label39:setWidth(10);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout22);
    obj.edit30:setField("atr_PULExtra");
    obj.edit30:setLeft(145);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setText("=");
    obj.label40:setLeft(175);
    obj.label40:setWidth(10);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout22);
    obj.rectangle14:setLeft(185);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setField("atr_PULTotal");
    obj.label41:setLeft(185);
    obj.label41:setWidth(30);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout21);
    obj.dataLink12:setFields({'atr_PULBase','atr_PULExtra'});
    obj.dataLink12:setName("dataLink12");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({top=5});
    obj.layout23:setName("layout23");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout23);
    obj.button12:setText("Escalada");
    obj.button12:setAlign("left");
    obj.button12:setWidth(100);
    obj.button12:setHorzTextAlign("center");
    obj.button12:setName("button12");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout23);
    obj.edit31:setField("atr_ESCBase");
    obj.edit31:setLeft(105);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setText("+");
    obj.label42:setLeft(135);
    obj.label42:setWidth(10);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setField("atr_ESCExtra");
    obj.edit32:setLeft(145);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout23);
    obj.label43:setText("=");
    obj.label43:setLeft(175);
    obj.label43:setWidth(10);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout23);
    obj.rectangle15:setLeft(185);
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout23);
    obj.label44:setField("atr_ESCTotal");
    obj.label44:setLeft(185);
    obj.label44:setWidth(30);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout21);
    obj.dataLink13:setFields({'atr_ESCBase','atr_ESCExtra'});
    obj.dataLink13:setName("dataLink13");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setMargins({top=5});
    obj.layout24:setName("layout24");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout24);
    obj.button13:setText("Mira");
    obj.button13:setAlign("left");
    obj.button13:setWidth(100);
    obj.button13:setHorzTextAlign("center");
    obj.button13:setName("button13");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout24);
    obj.edit33:setField("atr_MIRBase");
    obj.edit33:setLeft(105);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setText("+");
    obj.label45:setLeft(135);
    obj.label45:setWidth(10);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout24);
    obj.edit34:setField("atr_MIRExtra");
    obj.edit34:setLeft(145);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout24);
    obj.label46:setText("=");
    obj.label46:setLeft(175);
    obj.label46:setWidth(10);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout24);
    obj.rectangle16:setLeft(185);
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setField("atr_MIRTotal");
    obj.label47:setLeft(185);
    obj.label47:setWidth(30);
    obj.label47:setHeight(25);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout21);
    obj.dataLink14:setFields({'atr_MIRBase','atr_MIRExtra'});
    obj.dataLink14:setName("dataLink14");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setMargins({top=5});
    obj.layout25:setName("layout25");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout25);
    obj.button14:setText("Carisma");
    obj.button14:setAlign("left");
    obj.button14:setWidth(100);
    obj.button14:setHorzTextAlign("center");
    obj.button14:setName("button14");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout25);
    obj.edit35:setField("atr_CARBase");
    obj.edit35:setLeft(105);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setText("+");
    obj.label48:setLeft(135);
    obj.label48:setWidth(10);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout25);
    obj.edit36:setField("atr_CARExtra");
    obj.edit36:setLeft(145);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout25);
    obj.label49:setText("=");
    obj.label49:setLeft(175);
    obj.label49:setWidth(10);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout25);
    obj.rectangle17:setLeft(185);
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout25);
    obj.label50:setField("atr_CARTotal");
    obj.label50:setLeft(185);
    obj.label50:setWidth(30);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout21);
    obj.dataLink15:setFields({'atr_CARBase','atr_CARExtra'});
    obj.dataLink15:setName("dataLink15");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({top=5});
    obj.layout26:setName("layout26");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout26);
    obj.button15:setText("Labia");
    obj.button15:setAlign("left");
    obj.button15:setWidth(100);
    obj.button15:setHorzTextAlign("center");
    obj.button15:setName("button15");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout26);
    obj.edit37:setField("atr_LABBase");
    obj.edit37:setLeft(105);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout26);
    obj.label51:setText("+");
    obj.label51:setLeft(135);
    obj.label51:setWidth(10);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout26);
    obj.edit38:setField("atr_LABExtra");
    obj.edit38:setLeft(145);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout26);
    obj.label52:setText("=");
    obj.label52:setLeft(175);
    obj.label52:setWidth(10);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout26);
    obj.rectangle18:setLeft(185);
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout26);
    obj.label53:setField("atr_LABTotal");
    obj.label53:setLeft(185);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout21);
    obj.dataLink16:setFields({'atr_LABBase','atr_LABExtra'});
    obj.dataLink16:setName("dataLink16");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout21);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setMargins({top=5});
    obj.layout27:setName("layout27");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout27);
    obj.button16:setText("Decifrar");
    obj.button16:setAlign("left");
    obj.button16:setWidth(100);
    obj.button16:setHorzTextAlign("center");
    obj.button16:setName("button16");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout27);
    obj.edit39:setField("atr_DECBase");
    obj.edit39:setLeft(105);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout27);
    obj.label54:setText("+");
    obj.label54:setLeft(135);
    obj.label54:setWidth(10);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout27);
    obj.edit40:setField("atr_DECExtra");
    obj.edit40:setLeft(145);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout27);
    obj.label55:setText("=");
    obj.label55:setLeft(175);
    obj.label55:setWidth(10);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout27);
    obj.rectangle19:setLeft(185);
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout27);
    obj.label56:setField("atr_DECTotal");
    obj.label56:setLeft(185);
    obj.label56:setWidth(30);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout21);
    obj.dataLink17:setFields({'atr_DECBase','atr_DECExtra'});
    obj.dataLink17:setName("dataLink17");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({top=5});
    obj.layout28:setName("layout28");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout28);
    obj.button17:setText("Furtividade");
    obj.button17:setAlign("left");
    obj.button17:setWidth(100);
    obj.button17:setHorzTextAlign("center");
    obj.button17:setName("button17");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout28);
    obj.edit41:setField("atr_FURBase");
    obj.edit41:setLeft(105);
    obj.edit41:setWidth(30);
    obj.edit41:setHeight(25);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout28);
    obj.label57:setText("+");
    obj.label57:setLeft(135);
    obj.label57:setWidth(10);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout28);
    obj.edit42:setField("atr_FURExtra");
    obj.edit42:setLeft(145);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout28);
    obj.label58:setText("=");
    obj.label58:setLeft(175);
    obj.label58:setWidth(10);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout28);
    obj.rectangle20:setLeft(185);
    obj.rectangle20:setWidth(30);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout28);
    obj.label59:setField("atr_FURTotal");
    obj.label59:setLeft(185);
    obj.label59:setWidth(30);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout21);
    obj.dataLink18:setFields({'atr_FURBase','atr_FURExtra'});
    obj.dataLink18:setName("dataLink18");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout21);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setMargins({top=5});
    obj.layout29:setName("layout29");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout29);
    obj.button18:setText("Percepção");
    obj.button18:setAlign("left");
    obj.button18:setWidth(100);
    obj.button18:setHorzTextAlign("center");
    obj.button18:setName("button18");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout29);
    obj.edit43:setField("atr_PERBase");
    obj.edit43:setLeft(105);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setText("+");
    obj.label60:setLeft(135);
    obj.label60:setWidth(10);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout29);
    obj.edit44:setField("atr_PERExtra");
    obj.edit44:setLeft(145);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout29);
    obj.label61:setText("=");
    obj.label61:setLeft(175);
    obj.label61:setWidth(10);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout29);
    obj.rectangle21:setLeft(185);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout29);
    obj.label62:setField("atr_PERTotal");
    obj.label62:setLeft(185);
    obj.label62:setWidth(30);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout21);
    obj.dataLink19:setFields({'atr_PERBase','atr_PERExtra'});
    obj.dataLink19:setName("dataLink19");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout21);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({top=5});
    obj.layout30:setName("layout30");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout30);
    obj.button19:setText("Conhecimento");
    obj.button19:setAlign("left");
    obj.button19:setWidth(100);
    obj.button19:setHorzTextAlign("center");
    obj.button19:setName("button19");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout30);
    obj.edit45:setField("atr_CNHBase");
    obj.edit45:setLeft(105);
    obj.edit45:setWidth(30);
    obj.edit45:setHeight(25);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout30);
    obj.label63:setText("+");
    obj.label63:setLeft(135);
    obj.label63:setWidth(10);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout30);
    obj.edit46:setField("atr_CNHExtra");
    obj.edit46:setLeft(145);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout30);
    obj.label64:setText("=");
    obj.label64:setLeft(175);
    obj.label64:setWidth(10);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout30);
    obj.rectangle22:setLeft(185);
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout30);
    obj.label65:setField("atr_CNHTotal");
    obj.label65:setLeft(185);
    obj.label65:setWidth(30);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout21);
    obj.dataLink20:setFields({'atr_CNHBase','atr_CNHExtra'});
    obj.dataLink20:setName("dataLink20");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout21);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setMargins({top=5});
    obj.layout31:setName("layout31");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout31);
    obj.button20:setText("Ambidestria");
    obj.button20:setAlign("left");
    obj.button20:setWidth(100);
    obj.button20:setHorzTextAlign("center");
    obj.button20:setName("button20");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout31);
    obj.edit47:setField("atr_AMBBase");
    obj.edit47:setLeft(105);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout31);
    obj.label66:setText("+");
    obj.label66:setLeft(135);
    obj.label66:setWidth(10);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout31);
    obj.edit48:setField("atr_AMBExtra");
    obj.edit48:setLeft(145);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout31);
    obj.label67:setText("=");
    obj.label67:setLeft(175);
    obj.label67:setWidth(10);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout31);
    obj.rectangle23:setLeft(185);
    obj.rectangle23:setWidth(30);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout31);
    obj.label68:setField("atr_AMBTotal");
    obj.label68:setLeft(185);
    obj.label68:setWidth(30);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout21);
    obj.dataLink21:setFields({'atr_AMBBase','atr_AMBExtra'});
    obj.dataLink21:setName("dataLink21");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle3);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(270);
    obj.layout32:setMargins({right=5});
    obj.layout32:setName("layout32");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setMargins({bottom=5, top=5});
    obj.layout33:setName("layout33");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(75);
    obj.layout34:setMargins({right=5});
    obj.layout34:setName("layout34");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout34);
    obj.label69:setText("HP");
    obj.label69:setWidth(20);
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setName("label69");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout34);
    obj.edit49:setLeft(25);
    obj.edit49:setField("hp");
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(25);
    obj.edit49:setName("edit49");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(75);
    obj.layout35:setMargins({right=5});
    obj.layout35:setName("layout35");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout35);
    obj.label70:setText("SP");
    obj.label70:setWidth(20);
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setName("label70");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout35);
    obj.edit50:setLeft(25);
    obj.edit50:setField("sp");
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setName("edit50");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout32);
    obj.label71:setText("BÔNUS");
    obj.label71:setAlign("top");
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout32);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(50);
    obj.layout36:setMargins({bottom=5});
    obj.layout36:setName("layout36");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(50);
    obj.layout37:setMargins({right=5});
    obj.layout37:setName("layout37");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout37);
    obj.button21:setText("Esquiva");
    obj.button21:setWidth(50);
    obj.button21:setHorzTextAlign("center");
    obj.button21:setHeight(20);
    obj.button21:setFontSize(12);
    obj.button21:setName("button21");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout37);
    obj.edit51:setTop(20);
    obj.edit51:setField("bonus_esquiva");
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setName("edit51");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout36);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(45);
    obj.layout38:setMargins({right=5});
    obj.layout38:setName("layout38");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout38);
    obj.label72:setText("Força");
    obj.label72:setWidth(45);
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setFontSize(12);
    obj.label72:setName("label72");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout38);
    obj.edit52:setTop(20);
    obj.edit52:setField("bonus_forca");
    obj.edit52:setWidth(45);
    obj.edit52:setHeight(25);
    obj.edit52:setName("edit52");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout36);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(50);
    obj.layout39:setMargins({right=5});
    obj.layout39:setName("layout39");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout39);
    obj.label73:setText("Destreza");
    obj.label73:setWidth(50);
    obj.label73:setHorzTextAlign("leading");
    obj.label73:setFontSize(11);
    obj.label73:setName("label73");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout39);
    obj.edit53:setTop(20);
    obj.edit53:setField("bonus_destreza");
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setName("edit53");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout36);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(45);
    obj.layout40:setMargins({right=5});
    obj.layout40:setName("layout40");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout40);
    obj.label74:setText("Dano");
    obj.label74:setWidth(45);
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setFontSize(12);
    obj.label74:setName("label74");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout40);
    obj.edit54:setTop(20);
    obj.edit54:setField("bonus_dano");
    obj.edit54:setWidth(45);
    obj.edit54:setHeight(25);
    obj.edit54:setName("edit54");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout36);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(60);
    obj.layout41:setMargins({right=5});
    obj.layout41:setName("layout41");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout41);
    obj.label75:setText("Intensidade");
    obj.label75:setWidth(60);
    obj.label75:setHorzTextAlign("leading");
    obj.label75:setFontSize(11);
    obj.label75:setName("label75");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout41);
    obj.edit55:setTop(20);
    obj.edit55:setField("bonus_intensidade");
    obj.edit55:setWidth(60);
    obj.edit55:setHeight(25);
    obj.edit55:setName("edit55");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout32);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(175);
    obj.layout42:setMargins({bottom=5, top=5});
    obj.layout42:setName("layout42");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setMargins({bottom=5});
    obj.layout43:setName("layout43");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(220);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout44);
    obj.label76:setText("Constituição");
    obj.label76:setWidth(100);
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setFontSize(13);
    obj.label76:setName("label76");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout44);
    obj.edit56:setLeft(105);
    obj.edit56:setField("def_corporal");
    obj.edit56:setWidth(100);
    obj.edit56:setHeight(25);
    obj.edit56:setName("edit56");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout42);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setMargins({bottom=5});
    obj.layout45:setName("layout45");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(220);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout46);
    obj.label77:setText("Def. Equipamento");
    obj.label77:setWidth(100);
    obj.label77:setHorzTextAlign("leading");
    obj.label77:setFontSize(11);
    obj.label77:setName("label77");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout46);
    obj.edit57:setLeft(105);
    obj.edit57:setField("def_equipamento");
    obj.edit57:setWidth(100);
    obj.edit57:setHeight(25);
    obj.edit57:setName("edit57");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout42);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setMargins({bottom=5});
    obj.layout47:setName("layout47");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(220);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout48);
    obj.label78:setText("Resistência");
    obj.label78:setWidth(100);
    obj.label78:setHorzTextAlign("leading");
    obj.label78:setFontSize(13);
    obj.label78:setName("label78");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout48);
    obj.edit58:setLeft(105);
    obj.edit58:setField("R_intensidade");
    obj.edit58:setWidth(100);
    obj.edit58:setHeight(25);
    obj.edit58:setName("edit58");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout42);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setMargins({bottom=0});
    obj.layout49:setName("layout49");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(220);
    obj.layout50:setMargins({right=5});
    obj.layout50:setName("layout50");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout50);
    obj.label79:setText("Proteção Física");
    obj.label79:setWidth(100);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setFontSize(13);
    obj.label79:setName("label79");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout50);
    obj.edit59:setLeft(105);
    obj.edit59:setField("def_total");
    obj.edit59:setWidth(100);
    obj.edit59:setHeight(25);
    obj.edit59:setName("edit59");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout42);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setMargins({top=0});
    obj.layout51:setName("layout51");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout51);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(190);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setField("doubleRoll");
    obj.checkBox1:setText("Usar dois atributos na rolagem.");
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setHint("Clique no primeiro e depois no segundo. ");
    obj.checkBox1:setName("checkBox1");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle3);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(220);
    obj.layout52:setMargins({right=5, top=5});
    obj.layout52:setName("layout52");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(50);
    obj.layout53:setMargins({bottom=5});
    obj.layout53:setName("layout53");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout52);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(50);
    obj.layout54:setMargins({bottom=5});
    obj.layout54:setName("layout54");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout52);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(150);
    obj.layout55:setMargins({bottom=5, top=5});
    obj.layout55:setName("layout55");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setMargins({bottom=5});
    obj.layout56:setName("layout56");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(220);
    obj.layout57:setMargins({right=5});
    obj.layout57:setName("layout57");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout57);
    obj.label80:setText("Critico");
    obj.label80:setWidth(100);
    obj.label80:setHorzTextAlign("leading");
    obj.label80:setFontSize(13);
    obj.label80:setName("label80");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout57);
    obj.edit60:setLeft(105);
    obj.edit60:setField("critico");
    obj.edit60:setWidth(100);
    obj.edit60:setHeight(25);
    obj.edit60:setName("edit60");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setMargins({bottom=5});
    obj.layout58:setName("layout58");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout58);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(220);
    obj.layout59:setMargins({right=5});
    obj.layout59:setName("layout59");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout59);
    obj.label81:setText("Esquiva Perfeita");
    obj.label81:setWidth(100);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setFontSize(13);
    obj.label81:setName("label81");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout59);
    obj.edit61:setLeft(105);
    obj.edit61:setField("esquiva_perfeita");
    obj.edit61:setWidth(100);
    obj.edit61:setHeight(25);
    obj.edit61:setName("edit61");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout55);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setMargins({bottom=5});
    obj.layout60:setName("layout60");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(220);
    obj.layout61:setMargins({right=5});
    obj.layout61:setName("layout61");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout61);
    obj.label82:setText("Turnos de Magia");
    obj.label82:setWidth(100);
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout61);
    obj.edit62:setLeft(105);
    obj.edit62:setField("tunos_magia");
    obj.edit62:setWidth(100);
    obj.edit62:setHeight(25);
    obj.edit62:setName("edit62");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout55);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(25);
    obj.layout62:setMargins({bottom=5});
    obj.layout62:setName("layout62");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(220);
    obj.layout63:setMargins({right=5});
    obj.layout63:setName("layout63");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout63);
    obj.label83:setText("Resiliência");
    obj.label83:setWidth(100);
    obj.label83:setHorzTextAlign("leading");
    obj.label83:setFontSize(13);
    obj.label83:setName("label83");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setLeft(105);
    obj.edit63:setField("dma");
    obj.edit63:setWidth(100);
    obj.edit63:setHeight(25);
    obj.edit63:setName("edit63");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout55);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setMargins({bottom=5});
    obj.layout64:setName("layout64");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(220);
    obj.layout65:setMargins({right=5});
    obj.layout65:setName("layout65");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout65);
    obj.label84:setText("Pontos de Ação (AP)");
    obj.label84:setWidth(100);
    obj.label84:setHorzTextAlign("leading");
    obj.label84:setFontSize(11);
    obj.label84:setName("label84");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout65);
    obj.edit64:setLeft(105);
    obj.edit64:setField("ap");
    obj.edit64:setWidth(100);
    obj.edit64:setHeight(25);
    obj.edit64:setName("edit64");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle3);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(220);
    obj.layout66:setMargins({right=5});
    obj.layout66:setName("layout66");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout66);
    obj.rectangle24:setLeft(0);
    obj.rectangle24:setTop(50);
    obj.rectangle24:setWidth(200);
    obj.rectangle24:setHeight(200);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle24);
    obj.label85:setLeft(0);
    obj.label85:setTop(40);
    obj.label85:setWidth(200);
    obj.label85:setHeight(20);
    obj.label85:setText("Avatar");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle24);
    obj.image3:setAlign("client");
    obj.image3:setField("avatar");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image3:setName("image3");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout1);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setAlign("top");
    obj.rectangle25:setHeight(200);
    obj.rectangle25:setMargins({bottom=5});
    obj.rectangle25:setName("rectangle25");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle25);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(500);
    obj.layout67:setMargins({right=5});
    obj.layout67:setName("layout67");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout67);
    obj.label86:setText("VANTAGENS");
    obj.label86:setAlign("top");
    obj.label86:setHeight(25);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout67);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("vantagens");
    obj.textEditor1:setName("textEditor1");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle25);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(500);
    obj.layout68:setMargins({right=5});
    obj.layout68:setName("layout68");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout68);
    obj.label87:setText("DESVANTAGENS");
    obj.label87:setAlign("top");
    obj.label87:setHeight(25);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout68);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setField("desvantagens");
    obj.textEditor2:setName("textEditor2");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle25);
    obj.image4:setLeft(1010);
    obj.image4:setTop(25);
    obj.image4:setWidth(190);
    obj.image4:setHeight(116);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/Ficha Ragnarock/images/ragnarok_b.jpg");
    obj.image4:setName("image4");

    obj._e_event0 = obj.image2:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.classeIcon);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_FORTotal) or 0;
            						sheet.firstValueName = "Força";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_FORTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Força" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Força + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_FORTotal = 	(tonumber(sheet.atr_FORBase) or 0) + 
            											(tonumber(sheet.atr_FORExtra) or 0);
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_HABTotal) or 0;
            						sheet.firstValueName = "Habilidade";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_HABTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Habilidade" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Habilidade + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_HABTotal = 	(tonumber(sheet.atr_HABBase) or 0) + 
            											(tonumber(sheet.atr_HABExtra) or 0);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_AGITotal) or 0;
            						sheet.firstValueName = "Agilidade";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_AGITotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Agilidade" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Agilidade + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_AGITotal = 	(tonumber(sheet.atr_AGIBase) or 0) + 
            											(tonumber(sheet.atr_AGIExtra) or 0);
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_VITTotal) or 0;
            						sheet.firstValueName = "Vitalidade";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_VITTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Vitalidade" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Vitalidade + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_VITTotal = 	(tonumber(sheet.atr_VITBase) or 0) + 
            											(tonumber(sheet.atr_VITExtra) or 0);
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_INTTotal) or 0;
            						sheet.firstValueName = "Inteligência";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_INTTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Inteligência" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Inteligência + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event10 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_INTTotal = 	(tonumber(sheet.atr_INTBase) or 0) + 
            											(tonumber(sheet.atr_INTExtra) or 0);
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_DESTotal) or 0;
            						sheet.firstValueName = "Destreza";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_DESTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Destreza" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Destreza + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event12 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DESTotal = 	(tonumber(sheet.atr_DESBase) or 0) + 
            											(tonumber(sheet.atr_DESExtra) or 0);
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_SORTotal) or 0;
            						sheet.firstValueName = "Sorte";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_SORTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Sorte" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Sorte + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event14 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_SORTotal = 	(tonumber(sheet.atr_SORBase) or 0) + 
            											(tonumber(sheet.atr_SORExtra) or 0);
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_MAGTotal) or 0;
            						sheet.firstValueName = "Magia";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_MAGTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Magia" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Magia + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event16 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_MAGTotal = 	(tonumber(sheet.atr_MAGBase) or 0) + 
            											(tonumber(sheet.atr_MAGExtra) or 0);
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_DEFTotal) or 0;
            						sheet.firstValueName = "Defesa";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_DEFTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Defesa" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Defesa + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event18 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DEFTotal = 	(tonumber(sheet.atr_DEFBase) or 0) + 
            											(tonumber(sheet.atr_DEFExtra) or 0);
        end, obj);

    obj._e_event19 = obj.button10:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_M.DEFTotal) or 0;
            						sheet.firstValueName = "Defesa Mágica";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_M.DEFTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Defesa Mágica" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Defesa Mágica + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event20 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_M.DEFTotal = 	(tonumber(sheet.atr_M.DEFBase) or 0) + 
            											(tonumber(sheet.atr_M.DEFExtra) or 0);
        end, obj);

    obj._e_event21 = obj.button11:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_PULTotal) or 0;
            						sheet.firstValueName = "Pulo";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_PULTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Pulo" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Pulo + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event22 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PULTotal = 	(tonumber(sheet.atr_PULBase) or 0) + 
            											(tonumber(sheet.atr_PULExtra) or 0);
        end, obj);

    obj._e_event23 = obj.button12:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_ESCTotal) or 0;
            						sheet.firstValueName = "Escalada";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_ESCTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Escalada" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Escalada + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event24 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_ESCTotal = 	(tonumber(sheet.atr_ESCBase) or 0) + 
            											(tonumber(sheet.atr_ESCExtra) or 0);
        end, obj);

    obj._e_event25 = obj.button13:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_MIRTotal) or 0;
            						sheet.firstValueName = "Mira";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_MIRTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Mira" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Mira + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event26 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_MIRTotal = 	(tonumber(sheet.atr_MIRBase) or 0) + 
            											(tonumber(sheet.atr_MIRExtra) or 0);
        end, obj);

    obj._e_event27 = obj.button14:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_CARTotal) or 0;
            						sheet.firstValueName = "Carisma";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_CARTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Carisma" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Carisma + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event28 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_CARTotal = 	(tonumber(sheet.atr_CARBase) or 0) + 
            											(tonumber(sheet.atr_CARExtra) or 0);
        end, obj);

    obj._e_event29 = obj.button15:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_LABTotal) or 0;
            						sheet.firstValueName = "Labia";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_LABTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Labia" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Labia + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event30 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_LABTotal = 	(tonumber(sheet.atr_LABBase) or 0) + 
            											(tonumber(sheet.atr_LABExtra) or 0);
        end, obj);

    obj._e_event31 = obj.button16:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_DECTotal) or 0;
            						sheet.firstValueName = "Decifrar";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_DECTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Decifrar" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Decifrar + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event32 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DECTotal = 	(tonumber(sheet.atr_DECBase) or 0) + 
            											(tonumber(sheet.atr_DECExtra) or 0);
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_FURTotal) or 0;
            						sheet.firstValueName = "Furtividade";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_FURTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Furtividade" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Furtividade + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event34 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_FURTotal = 	(tonumber(sheet.atr_FURBase) or 0) + 
            											(tonumber(sheet.atr_FURExtra) or 0);
        end, obj);

    obj._e_event35 = obj.button18:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_PERTotal) or 0;
            						sheet.firstValueName = "Percepção";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_PERTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Percepção" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Percepção + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event36 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PERTotal = 	(tonumber(sheet.atr_PERBase) or 0) + 
            											(tonumber(sheet.atr_PERExtra) or 0);
        end, obj);

    obj._e_event37 = obj.button19:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_CNHTotal) or 0;
            						sheet.firstValueName = "Conhecimento";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_CNHTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Conhecimento" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Conhecimento + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event38 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_CNHTotal = 	(tonumber(sheet.atr_CNHBase) or 0) + 
            											(tonumber(sheet.atr_CNHExtra) or 0);
        end, obj);

    obj._e_event39 = obj.button20:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            					if (sheet.doubleRoll and firstValue < 0) then
            						sheet.firstValue = tonumber(sheet.atr_AMBTotal) or 0;
            						sheet.firstValueName = "Ambidestria";
            						return;
            					end;
            					local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98, 100, 100, 102, 102, 104, 104, 106, 106, 110, 110, 112, 112, 114, 114, 116, 118, 122, 122, 124, 124, 126, 126, 128, 128, 130, 130, 134, 134, 136, 136, 138, 138, 140, 140, 142, 142, 146, 146, 148, 148, 150, 150, 152, 152, 154, 154, 158, 158, 160, 160, 162, 162, 164, 164, 166, 166, 170, 170, 172, 172, 174, 174, 176, 176, 178, 178, 182, 182, 184, 184, 186, 186, 188, 188, 190, 190, 194, 194, 196, 196, 198, 198, 200, 200, 202, 202, 206, 206, 208, 208, 210, 210, 212, 212, 214, 214, 218, 218, 220, 220, 222, 222, 224, 224, 226, 226, 230, 230, 232, 232, 234, 234, 236, 236, 238, 238, 242, 242, 244, 244, 246, 246, 248, 248, 250, 250, 254, 254, 255};
            
            					local atr = tonumber(sheet.atr_AMBTotal) or 0;
            					if (sheet.doubleRoll) then
            						 atr = atr + firstValue;
            						 sheet.firstValue = -1;
            					end;
            
            					atr = math.min(209, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = rrpg.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            				        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            				        				function (valorPreenchido)
            				        					local extra = (tonumber(valorPreenchido) or 0);
            				        					local msg = "Teste de Ambidestria" .. ", margem de critico " .. margem;
            				        					if (firstValue > -1) then
            				        						msg = "Teste de Ambidestria + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            				        					end;
            				        					if extra > 0 then
            				        						msg = msg .. ", +" .. extra .. " penalidade.";
            				        					elseif extra < 0 then
            				        						msg = msg .. ", " .. extra .. " bônus.";
            				        					end;
            				                        	mesa.activeChat:rolarDados(rolagem, msg,
            				                                function (rolado)
            				                                	local op = rolado.ops[2];
            		 
            													for j=1, #op.resultados, 1 do
            													    local result = op.resultados[j] + extra;
            
            													    if result <= atr then
            													        sucessos = sucessos +1;
            													    else
            													        falhas = falhas +1;
            													    end;
            													    if result <= margem then
            													        decisivo = decisivo +1;
            													    end;
            													    if result == faces then
            													        falhaCritica = falhaCritica +1;
            													    end;
            													end;
            
            													local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            		 
            													if decisivo > 0 then
            													    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            													end;
            													if falhaCritica > 0 then
            													    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            													end;
            
            													mesa.activeChat:enviarMensagem(txt);
            				                                end);
            			                    end);
                                        end);
            				        end);
        end, obj);

    obj._e_event40 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_AMBTotal = 	(tonumber(sheet.atr_AMBBase) or 0) + 
            											(tonumber(sheet.atr_AMBExtra) or 0);
        end, obj);

    obj._e_event41 = obj.button21:addEventListener("onClick",
        function (self)
            local firstValue = tonumber(sheet.firstValue) or -1;
            									if (sheet.doubleRoll and firstValue < 0) then
            										sheet.firstValue = tonumber(sheet.bonus_esquiva) or 0;
            										sheet.firstValueName = "Esquiva";
            										return;
            									end;
            									local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            									local atr = tonumber(sheet.bonus_esquiva) or 0;
            									if (sheet.doubleRoll) then
            										 atr = atr + firstValue;
            										 sheet.firstValue = -1;
            									end;
            
            									atr = math.min(80, atr);
            									atr = math.max(1, atr);
            
            									local faces = faceTable[atr];
            
            									local mesa = rrpg.getMesaDe(sheet);
            
            									local sucessos = 0;
            									local falhas = 0;
            									local decisivo = 0;
            									local falhaCritica = 0;
            
            									dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            								        function (valorPreenchido)
            								        	local dados = tonumber(valorPreenchido) or 1;
            								        	local rolagem = rrpg.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            											
            											dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            								        		function (valorPreenchido)
            								        			local margem = tonumber(valorPreenchido) or 1;
            								        			dialogs.inputQuery("Bônus ou Redutores", "Há alguma bônus ou redutor na rolagem?. ", "0",
            								        				function (valorPreenchido)
            								        					local extra = (tonumber(valorPreenchido) or 0);
            								        					local msg = "Teste de Esquiva" .. ", margem de critico " .. margem;
            								        					if (firstValue > -1) then
            								        						msg = "Teste de Esquiva + " .. (sheet.firstValueName or "") .. ", margem de critico " .. margem;
            								        					end;
            								        					if extra > 0 then
            								        						msg = msg .. ", +" .. extra .. " penalidade.";
            								        					elseif extra < 0 then
            								        						msg = msg .. ", " .. extra .. " bônus.";
            								        					end;
            								                        	mesa.activeChat:rolarDados(rolagem, msg,
            								                                function (rolado)
            								                                	local op = rolado.ops[2];
            						 
            																	for j=1, #op.resultados, 1 do
            																	    local result = op.resultados[j] + extra;
            
            																	    if result <= atr then
            																	        sucessos = sucessos +1;
            																	    else
            																	        falhas = falhas +1;
            																	    end;
            																	    if result <= margem then
            																	        decisivo = decisivo +1;
            																	    end;
            																	    if result == faces then
            																	        falhaCritica = falhaCritica +1;
            																	    end;
            																	end;
            
            																	local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
            						 
            																	if decisivo > 0 then
            																	    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            																	end;
            																	if falhaCritica > 0 then
            																	    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            																	end;
            
            																	mesa.activeChat:enviarMensagem(txt);
            								                                end);
            							                    end);
            				                            end);
            								        end);
        end, obj);

    obj._e_event42 = obj.checkBox1:addEventListener("onChange",
        function (self)
            if sheet==nil then return end;
            									sheet.firstValue = -1;
            									sheet.firstValueName = nil;
        end, obj);

    obj._e_event43 = obj.image3:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    function obj:_releaseEvents()
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
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
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
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
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
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
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
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
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
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
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
