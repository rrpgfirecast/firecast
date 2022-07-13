require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDZ_Ficha1_svg()
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
    obj:setName("frmDZ_Ficha1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1340);
    obj.rectangle1:setHeight(1188);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(918);
    obj.image1:setHeight(1188);
    obj.image1:setSRC("/DZ_Ficha2.0/images/Pg1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(165);
    obj.layout1:setTop(750);
    obj.layout1:setWidth(110);
    obj.layout1:setHeight(120);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("client");
    obj.label1:setField("Saude_Total");
    obj.label1:setFontSize(30);
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");
    obj.label1:setFontColor("black");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);
    obj.label1:setFontFamily("kalam");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(121);
    obj.layout2:setTop(227);
    obj.layout2:setWidth(34);
    obj.layout2:setHeight(17);
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#E52237");
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setVertTextAlign("center");
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(34);
    obj.label2:setHeight(18);
    obj.label2:setField("Satts");
    obj.label2:setName("label2");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);
    obj.label2:setFontFamily("kalam");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(414);
    obj.layout3:setTop(225);
    obj.layout3:setWidth(38);
    obj.layout3:setHeight(17);
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#E52237");
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setVertTextAlign("center");
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(38);
    obj.label3:setHeight(18);
    obj.label3:setField("Sper");
    obj.label3:setName("label3");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);
    obj.label3:setFontFamily("kalam");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(652);
    obj.layout4:setTop(225);
    obj.layout4:setWidth(38);
    obj.layout4:setHeight(17);
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setFontSize(12);
    obj.label4:setFontColor("#E52237");
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setVertTextAlign("center");
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(38);
    obj.label4:setHeight(18);
    obj.label4:setField("Scir");
    obj.label4:setName("label4");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);
    obj.label4:setFontFamily("kalam");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(740);
    obj.layout5:setTop(977);
    obj.layout5:setWidth(23);
    obj.layout5:setHeight(19);
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#E52237");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setVertTextAlign("center");
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(23);
    obj.label5:setHeight(20);
    obj.label5:setField("Svan");
    obj.label5:setName("label5");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);
    obj.label5:setFontFamily("kalam");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(716);
    obj.layout6:setTop(978);
    obj.layout6:setWidth(23);
    obj.layout6:setHeight(18);
    obj.layout6:setName("layout6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setFontSize(12);
    obj.label6:setFontColor("#000000");
    obj.label6:setVertTextAlign("center");
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setWidth(23);
    obj.label6:setHeight(19);
    obj.label6:setText("Exp:");
    obj.label6:setName("label6");
    obj.label6:setTextTrimming("none");
    obj.label6:setWordWrap(false);
    obj.label6:setAutoSize(true);
    obj.label6:setFontFamily("kalam");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(649);
    obj.layout7:setTop(52);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(50);
    obj.layout7:setName("layout7");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout7);
    obj.edit1:setTransparent(true);
    obj.edit1:setWidth(250);
    obj.edit1:setHeight(30);
    obj.edit1:setField("Disposicao");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#C0504D");
    obj.edit1:setFontSize(20);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setFontFamily("kalam");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(55);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(50);
    obj.layout8:setName("layout8");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout8);
    obj.edit2:setTransparent(true);
    obj.edit2:setWidth(205);
    obj.edit2:setHeight(30);
    obj.edit2:setField("Nick_Personagem");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("#C0504D");
    obj.edit2:setFontSize(20);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontFamily("kalam");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(210);
    obj.layout9:setTop(55);
    obj.layout9:setWidth(78);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout9);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(15);
    obj.edit3:setWidth(78);
    obj.edit3:setHeight(30);
    obj.edit3:setField("Nick_Pessoa");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#C0504D");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setFontFamily("kalam");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(649);
    obj.layout10:setTop(110);
    obj.layout10:setWidth(254);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout10);
    obj.edit4:setTransparent(true);
    obj.edit4:setWidth(254);
    obj.edit4:setHeight(30);
    obj.edit4:setField("Nick_Cap");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#C0504D");
    obj.edit4:setFontSize(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setFontFamily("kalam");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(30);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(210);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout11);
    obj.edit5:setTransparent(true);
    obj.edit5:setWidth(210);
    obj.edit5:setHeight(30);
    obj.edit5:setField("Nick_Refugio");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#C0504D");
    obj.edit5:setFontSize(20);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setFontFamily("kalam");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(194);
    obj.layout12:setTop(270);
    obj.layout12:setWidth(71);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout12);
    obj.edit6:setWidth(71);
    obj.edit6:setHeight(30);
    obj.edit6:setField("FOR");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#C0504D");
    obj.edit6:setFontSize(18);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setFontFamily("kalam");
    obj.edit6:setType("number");
    obj.edit6:setTransparent(true);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(273);
    obj.button1:setTop(273);
    obj.button1:setWidth(14);
    obj.button1:setHeight(14);
    obj.button1:setText("R");
    obj.button1:setHint("Desc...");
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setWidth(17);
    obj.image2:setHeight(17);
    obj.image2:setLeft(272);
    obj.image2:setTop(273);
    obj.image2:setStyle("proportional");
    obj.image2:setCenter(true);
    obj.image2:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image2:setName("image2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(194);
    obj.layout13:setTop(306);
    obj.layout13:setWidth(71);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout13);
    obj.edit7:setWidth(71);
    obj.edit7:setHeight(30);
    obj.edit7:setField("DES");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#C0504D");
    obj.edit7:setFontSize(18);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setFontFamily("kalam");
    obj.edit7:setType("number");
    obj.edit7:setTransparent(true);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(273);
    obj.button2:setTop(309);
    obj.button2:setWidth(14);
    obj.button2:setHeight(14);
    obj.button2:setText("R");
    obj.button2:setHint("Desc...");
    obj.button2:setName("button2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setWidth(17);
    obj.image3:setHeight(17);
    obj.image3:setLeft(272);
    obj.image3:setTop(309);
    obj.image3:setStyle("proportional");
    obj.image3:setCenter(true);
    obj.image3:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image3:setName("image3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(194);
    obj.layout14:setTop(342);
    obj.layout14:setWidth(71);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout14);
    obj.edit8:setWidth(71);
    obj.edit8:setHeight(30);
    obj.edit8:setField("PRE");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("#C0504D");
    obj.edit8:setFontSize(18);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setFontFamily("kalam");
    obj.edit8:setType("number");
    obj.edit8:setTransparent(true);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(273);
    obj.button3:setTop(345);
    obj.button3:setWidth(14);
    obj.button3:setHeight(14);
    obj.button3:setText("R");
    obj.button3:setHint("Desc...");
    obj.button3:setName("button3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle1);
    obj.image4:setWidth(17);
    obj.image4:setHeight(17);
    obj.image4:setLeft(272);
    obj.image4:setTop(345);
    obj.image4:setStyle("proportional");
    obj.image4:setCenter(true);
    obj.image4:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image4:setName("image4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(194);
    obj.layout15:setTop(378);
    obj.layout15:setWidth(71);
    obj.layout15:setHeight(30);
    obj.layout15:setName("layout15");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout15);
    obj.edit9:setWidth(71);
    obj.edit9:setHeight(30);
    obj.edit9:setField("TAT");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("#C0504D");
    obj.edit9:setFontSize(18);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setFontFamily("kalam");
    obj.edit9:setType("number");
    obj.edit9:setTransparent(true);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(273);
    obj.button4:setTop(381);
    obj.button4:setWidth(14);
    obj.button4:setHeight(14);
    obj.button4:setText("R");
    obj.button4:setHint("Desc...");
    obj.button4:setName("button4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle1);
    obj.image5:setWidth(17);
    obj.image5:setHeight(17);
    obj.image5:setLeft(272);
    obj.image5:setTop(381);
    obj.image5:setStyle("proportional");
    obj.image5:setCenter(true);
    obj.image5:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image5:setName("image5");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(194);
    obj.layout16:setTop(413);
    obj.layout16:setWidth(71);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout16);
    obj.edit10:setWidth(71);
    obj.edit10:setHeight(30);
    obj.edit10:setField("PER");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("#C0504D");
    obj.edit10:setFontSize(18);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setFontFamily("kalam");
    obj.edit10:setType("number");
    obj.edit10:setTransparent(true);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(273);
    obj.button5:setTop(416);
    obj.button5:setWidth(14);
    obj.button5:setHeight(14);
    obj.button5:setText("R");
    obj.button5:setHint("Desc...");
    obj.button5:setName("button5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle1);
    obj.image6:setWidth(17);
    obj.image6:setHeight(17);
    obj.image6:setLeft(272);
    obj.image6:setTop(416);
    obj.image6:setStyle("proportional");
    obj.image6:setCenter(true);
    obj.image6:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image6:setName("image6");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(194);
    obj.layout17:setTop(449);
    obj.layout17:setWidth(71);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout17);
    obj.edit11:setWidth(71);
    obj.edit11:setHeight(30);
    obj.edit11:setField("INT");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#C0504D");
    obj.edit11:setFontSize(18);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setFontFamily("kalam");
    obj.edit11:setType("number");
    obj.edit11:setTransparent(true);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(273);
    obj.button6:setTop(452);
    obj.button6:setWidth(14);
    obj.button6:setHeight(14);
    obj.button6:setText("R");
    obj.button6:setHint("Desc...");
    obj.button6:setName("button6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle1);
    obj.image7:setWidth(17);
    obj.image7:setHeight(17);
    obj.image7:setLeft(272);
    obj.image7:setTop(452);
    obj.image7:setStyle("proportional");
    obj.image7:setCenter(true);
    obj.image7:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image7:setName("image7");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(178);
    obj.layout18:setTop(500);
    obj.layout18:setWidth(80);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout18);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(30);
    obj.edit12:setField("DET");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("#C0504D");
    obj.edit12:setFontSize(18);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setFontFamily("kalam");
    obj.edit12:setType("number");
    obj.edit12:setTransparent(true);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(274);
    obj.button7:setTop(505);
    obj.button7:setWidth(16);
    obj.button7:setHeight(16);
    obj.button7:setText("R");
    obj.button7:setHint("Desc...");
    obj.button7:setName("button7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.rectangle1);
    obj.image8:setWidth(19);
    obj.image8:setHeight(19);
    obj.image8:setLeft(272);
    obj.image8:setTop(505);
    obj.image8:setStyle("proportional");
    obj.image8:setCenter(true);
    obj.image8:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image8:setName("image8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(178);
    obj.layout19:setTop(536);
    obj.layout19:setWidth(80);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(30);
    obj.edit13:setField("SOR");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#C0504D");
    obj.edit13:setFontSize(18);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setFontFamily("kalam");
    obj.edit13:setType("number");
    obj.edit13:setTransparent(true);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(274);
    obj.button8:setTop(541);
    obj.button8:setWidth(16);
    obj.button8:setHeight(16);
    obj.button8:setText("R");
    obj.button8:setHint("Desc...");
    obj.button8:setName("button8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.rectangle1);
    obj.image9:setWidth(19);
    obj.image9:setHeight(19);
    obj.image9:setLeft(272);
    obj.image9:setTop(541);
    obj.image9:setStyle("proportional");
    obj.image9:setCenter(true);
    obj.image9:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image9:setName("image9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(240);
    obj.layout20:setTop(499);
    obj.layout20:setWidth(80);
    obj.layout20:setHeight(30);
    obj.layout20:setName("layout20");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout20);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(18);
    obj.edit14:setFontColor("#C0504D");
    obj.edit14:setFontFamily("kalam");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(45);
    obj.edit14:setHeight(30);
    obj.edit14:setField("DETtemp");
    obj.edit14:setName("edit14");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(240);
    obj.layout21:setTop(536);
    obj.layout21:setWidth(80);
    obj.layout21:setHeight(30);
    obj.layout21:setName("layout21");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout21);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(18);
    obj.edit15:setFontColor("#C0504D");
    obj.edit15:setFontFamily("kalam");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(45);
    obj.edit15:setHeight(30);
    obj.edit15:setField("SORtemp");
    obj.edit15:setName("edit15");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(182);
    obj.layout22:setTop(590);
    obj.layout22:setWidth(100);
    obj.layout22:setHeight(27);
    obj.layout22:setName("layout22");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout22);
    obj.label7:setAlign("client");
    obj.label7:setField("Iniciativa");
    obj.label7:setFontColor("#00000");
    obj.label7:setName("label7");
    obj.label7:setFontSize(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("center");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontFamily("kalam");
    obj.label7:setTextTrimming("none");
    obj.label7:setWordWrap(false);
    obj.label7:setAutoSize(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'DES', 'PER'});
    obj.dataLink1:setName("dataLink1");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setLeft(284);
    obj.button9:setTop(591);
    obj.button9:setWidth(14);
    obj.button9:setHeight(14);
    obj.button9:setText("R");
    obj.button9:setHint("Desc... ");
    obj.button9:setName("button9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle1);
    obj.image10:setWidth(17);
    obj.image10:setHeight(17);
    obj.image10:setLeft(283);
    obj.image10:setTop(591);
    obj.image10:setStyle("proportional");
    obj.image10:setCenter(true);
    obj.image10:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image10:setName("image10");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(182);
    obj.comboBox1:setTop(655);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("StatusMoralidade");
    obj.comboBox1:setItems({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', 'Santo'});
    obj.comboBox1:setValues({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', Santo});
    obj.comboBox1:setFontSize(18);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("#C0504D");
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setFontFamily("kalam");
    obj.comboBox1:setTransparent(true);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(180);
    obj.layout23:setTop(695);
    obj.layout23:setWidth(100);
    obj.layout23:setHeight(30);
    obj.layout23:setName("layout23");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout23);
    obj.edit16:setFontColor("#00000");
    obj.edit16:setWidth(100);
    obj.edit16:setHeight(30);
    obj.edit16:setField("Moralidade");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(18);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setFontFamily("kalam");
    obj.edit16:setType("number");
    obj.edit16:setTransparent(true);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setLeft(285);
    obj.button10:setTop(701);
    obj.button10:setWidth(14);
    obj.button10:setHeight(14);
    obj.button10:setText("R");
    obj.button10:setHint("Desc... ");
    obj.button10:setName("button10");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle1);
    obj.image11:setWidth(17);
    obj.image11:setHeight(17);
    obj.image11:setLeft(284);
    obj.image11:setTop(701);
    obj.image11:setStyle("proportional");
    obj.image11:setCenter(true);
    obj.image11:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image11:setName("image11");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(68);
    obj.layout24:setTop(770);
    obj.layout24:setWidth(60);
    obj.layout24:setHeight(23);
    obj.layout24:setName("layout24");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout24);
    obj.label8:setAlign("client");
    obj.label8:setField("Saude_Base");
    obj.label8:setFontSize(20);
    obj.label8:setFontColor("#00000");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setName("label8");
    obj.label8:setTextTrimming("none");
    obj.label8:setWordWrap(false);
    obj.label8:setAutoSize(true);
    obj.label8:setFontFamily("kalam");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setFields({'FOR', 'SOR'});
    obj.dataLink2:setName("dataLink2");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(65);
    obj.layout25:setTop(815);
    obj.layout25:setWidth(60);
    obj.layout25:setHeight(30);
    obj.layout25:setName("layout25");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout25);
    obj.edit17:setFontSize(18);
    obj.edit17:setFontColor("#E10000");
    obj.edit17:setWidth(60);
    obj.edit17:setHeight(30);
    obj.edit17:setField("Saude_Extra");
    obj.edit17:setName("edit17");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setFontFamily("kalam");
    obj.edit17:setType("number");
    obj.edit17:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setFields({'Saude_Extra', 'Saude_Base'});
    obj.dataLink3:setName("dataLink3");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(80);
    obj.layout26:setTop(973);
    obj.layout26:setWidth(80);
    obj.layout26:setHeight(40);
    obj.layout26:setName("layout26");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout26);
    obj.edit18:setFontColor("#000000");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setWidth(80);
    obj.edit18:setHeight(40);
    obj.edit18:setFontFamily("kalam");
    obj.edit18:setField("Lesionado");
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setTransparent(true);
    obj.edit18:setType("float");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(183);
    obj.layout27:setTop(973);
    obj.layout27:setWidth(80);
    obj.layout27:setHeight(40);
    obj.layout27:setName("layout27");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout27);
    obj.edit19:setFontColor("#C0504D");
    obj.edit19:setWidth(80);
    obj.edit19:setHeight(40);
    obj.edit19:setFontFamily("kalam");
    obj.edit19:setField("Lesionado_A");
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setTransparent(true);
    obj.edit19:setType("float");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(80);
    obj.layout28:setTop(900);
    obj.layout28:setWidth(80);
    obj.layout28:setHeight(40);
    obj.layout28:setName("layout28");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout28);
    obj.edit20:setFontColor("#000000");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setWidth(80);
    obj.edit20:setHeight(40);
    obj.edit20:setFontFamily("kalam");
    obj.edit20:setField("Machucado");
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setTransparent(true);
    obj.edit20:setType("float");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(183);
    obj.layout29:setTop(900);
    obj.layout29:setWidth(80);
    obj.layout29:setHeight(40);
    obj.layout29:setName("layout29");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout29);
    obj.edit21:setFontColor("#C0504D");
    obj.edit21:setWidth(80);
    obj.edit21:setHeight(40);
    obj.edit21:setFontFamily("kalam");
    obj.edit21:setField("Machucado_A");
    obj.edit21:setName("edit21");
    obj.edit21:setFontSize(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setTransparent(true);
    obj.edit21:setType("float");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(80);
    obj.layout30:setTop(1046);
    obj.layout30:setWidth(80);
    obj.layout30:setHeight(40);
    obj.layout30:setName("layout30");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout30);
    obj.edit22:setFontColor("#000000");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setWidth(80);
    obj.edit22:setHeight(40);
    obj.edit22:setFontFamily("kalam");
    obj.edit22:setField("Ferido");
    obj.edit22:setName("edit22");
    obj.edit22:setFontSize(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setTransparent(true);
    obj.edit22:setType("float");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(183);
    obj.layout31:setTop(1046);
    obj.layout31:setWidth(80);
    obj.layout31:setHeight(40);
    obj.layout31:setName("layout31");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout31);
    obj.edit23:setFontColor("#C0504D");
    obj.edit23:setWidth(80);
    obj.edit23:setHeight(40);
    obj.edit23:setField("Ferido_A");
    obj.edit23:setName("edit23");
    obj.edit23:setFontSize(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setFontFamily("kalam");
    obj.edit23:setTransparent(true);
    obj.edit23:setType("float");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setFields({'Saude_Total'});
    obj.dataLink4:setName("dataLink4");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(80);
    obj.layout32:setTop(1126);
    obj.layout32:setWidth(50);
    obj.layout32:setHeight(30);
    obj.layout32:setName("layout32");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout32);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(30);
    obj.edit24:setFontSize(16);
    obj.edit24:setField("Resistencia");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("#C0504D");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setFontFamily("kalam");
    obj.edit24:setType("number");
    obj.edit24:setTransparent(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setFields({'FOR'});
    obj.dataLink5:setName("dataLink5");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(377);
    obj.layout33:setTop(357);
    obj.layout33:setWidth(85);
    obj.layout33:setHeight(30);
    obj.layout33:setName("layout33");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout33);
    obj.edit25:setWidth(88);
    obj.edit25:setHeight(29);
    obj.edit25:setField("Construcao");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("#C0504D");
    obj.edit25:setFontSize(15);
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setFontFamily("kalam");
    obj.edit25:setTransparent(true);

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(396);
    obj.layout34:setTop(608);
    obj.layout34:setWidth(65);
    obj.layout34:setHeight(27);
    obj.layout34:setName("layout34");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout34);
    obj.edit26:setText("Geral");
    obj.edit26:setWidth(65);
    obj.edit26:setHeight(28);
    obj.edit26:setField("Conhecimento");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("#C0504D");
    obj.edit26:setFontSize(15);
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setFontFamily("kalam");
    obj.edit26:setTransparent(true);

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(356);
    obj.layout35:setTop(637);
    obj.layout35:setWidth(100);
    obj.layout35:setHeight(27);
    obj.layout35:setName("layout35");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout35);
    obj.edit27:setWidth(88);
    obj.edit27:setHeight(29);
    obj.edit27:setField("Idiomas");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#C0504D");
    obj.edit27:setFontSize(15);
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setFontFamily("kalam");
    obj.edit27:setTransparent(true);

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(386);
    obj.layout36:setTop(794);
    obj.layout36:setWidth(72);
    obj.layout36:setHeight(30);
    obj.layout36:setName("layout36");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout36);
    obj.edit28:setWidth(88);
    obj.edit28:setHeight(29);
    obj.edit28:setField("Performance");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("#C0504D");
    obj.edit28:setFontSize(15);
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setFontFamily("kalam");
    obj.edit28:setTransparent(true);

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(372);
    obj.layout37:setTop(827);
    obj.layout37:setWidth(88);
    obj.layout37:setHeight(28);
    obj.layout37:setName("layout37");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout37);
    obj.edit29:setWidth(88);
    obj.edit29:setHeight(29);
    obj.edit29:setField("Pilotagem");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#C0504D");
    obj.edit29:setFontSize(15);
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setFontFamily("kalam");
    obj.edit29:setTransparent(true);

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(368);
    obj.layout38:setTop(856);
    obj.layout38:setWidth(90);
    obj.layout38:setHeight(28);
    obj.layout38:setName("layout38");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout38);
    obj.edit30:setWidth(90);
    obj.edit30:setHeight(29);
    obj.edit30:setField("Conducao");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("#C0504D");
    obj.edit30:setFontSize(15);
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setFontFamily("kalam");
    obj.edit30:setTransparent(true);

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(310);
    obj.layout39:setTop(1077);
    obj.layout39:setWidth(148);
    obj.layout39:setHeight(28);
    obj.layout39:setName("layout39");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout39);
    obj.edit31:setWidth(148);
    obj.edit31:setHeight(29);
    obj.edit31:setField("Coringa1");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("#C0504D");
    obj.edit31:setFontSize(15);
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setFontFamily("kalam");
    obj.edit31:setTransparent(true);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(309);
    obj.layout40:setTop(1109);
    obj.layout40:setWidth(148);
    obj.layout40:setHeight(28);
    obj.layout40:setName("layout40");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout40);
    obj.edit32:setWidth(148);
    obj.edit32:setHeight(29);
    obj.edit32:setField("Coringa2");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("#C0504D");
    obj.edit32:setFontSize(15);
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setFontFamily("kalam");
    obj.edit32:setTransparent(true);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(310);
    obj.layout41:setTop(1141);
    obj.layout41:setWidth(148);
    obj.layout41:setHeight(28);
    obj.layout41:setName("layout41");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout41);
    obj.edit33:setWidth(148);
    obj.edit33:setHeight(29);
    obj.edit33:setField("Coringa3");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("#C0504D");
    obj.edit33:setFontSize(15);
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setFontFamily("kalam");
    obj.edit33:setTransparent(true);

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(553);
    obj.button11:setTop(268);
    obj.button11:setWidth(14);
    obj.button11:setHeight(14);
    obj.button11:setText("R");
    obj.button11:setHint("Desc... ");
    obj.button11:setName("button11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle1);
    obj.image12:setWidth(17);
    obj.image12:setHeight(17);
    obj.image12:setLeft(552);
    obj.image12:setTop(268);
    obj.image12:setStyle("proportional");
    obj.image12:setCenter(true);
    obj.image12:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image12:setName("image12");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(553);
    obj.button12:setTop(300);
    obj.button12:setWidth(14);
    obj.button12:setHeight(14);
    obj.button12:setText("R");
    obj.button12:setHint("Desc... ");
    obj.button12:setName("button12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle1);
    obj.image13:setWidth(17);
    obj.image13:setHeight(17);
    obj.image13:setLeft(552);
    obj.image13:setTop(300);
    obj.image13:setStyle("proportional");
    obj.image13:setCenter(true);
    obj.image13:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image13:setName("image13");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setLeft(553);
    obj.button13:setTop(332);
    obj.button13:setWidth(14);
    obj.button13:setHeight(14);
    obj.button13:setText("R");
    obj.button13:setHint("Desc... ");
    obj.button13:setName("button13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle1);
    obj.image14:setWidth(17);
    obj.image14:setHeight(17);
    obj.image14:setLeft(553);
    obj.image14:setTop(332);
    obj.image14:setStyle("proportional");
    obj.image14:setCenter(true);
    obj.image14:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image14:setName("image14");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setLeft(553);
    obj.button14:setTop(364);
    obj.button14:setWidth(14);
    obj.button14:setHeight(14);
    obj.button14:setText("R");
    obj.button14:setHint("Desc... ");
    obj.button14:setName("button14");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.rectangle1);
    obj.image15:setWidth(17);
    obj.image15:setHeight(17);
    obj.image15:setLeft(552);
    obj.image15:setTop(364);
    obj.image15:setStyle("proportional");
    obj.image15:setCenter(true);
    obj.image15:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image15:setName("image15");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setLeft(553);
    obj.button15:setTop(394);
    obj.button15:setWidth(14);
    obj.button15:setHeight(14);
    obj.button15:setText("R");
    obj.button15:setHint("Desc... ");
    obj.button15:setName("button15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.rectangle1);
    obj.image16:setWidth(17);
    obj.image16:setHeight(17);
    obj.image16:setLeft(552);
    obj.image16:setTop(394);
    obj.image16:setStyle("proportional");
    obj.image16:setCenter(true);
    obj.image16:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image16:setName("image16");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle1);
    obj.button16:setLeft(553);
    obj.button16:setTop(425);
    obj.button16:setWidth(14);
    obj.button16:setHeight(14);
    obj.button16:setText("R");
    obj.button16:setHint("Desc... ");
    obj.button16:setName("button16");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.rectangle1);
    obj.image17:setWidth(17);
    obj.image17:setHeight(17);
    obj.image17:setLeft(552);
    obj.image17:setTop(425);
    obj.image17:setStyle("proportional");
    obj.image17:setCenter(true);
    obj.image17:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image17:setName("image17");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle1);
    obj.button17:setLeft(553);
    obj.button17:setTop(456);
    obj.button17:setWidth(14);
    obj.button17:setHeight(14);
    obj.button17:setText("R");
    obj.button17:setHint("Desc... ");
    obj.button17:setName("button17");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.rectangle1);
    obj.image18:setWidth(17);
    obj.image18:setHeight(17);
    obj.image18:setLeft(552);
    obj.image18:setTop(456);
    obj.image18:setStyle("proportional");
    obj.image18:setCenter(true);
    obj.image18:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image18:setName("image18");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle1);
    obj.button18:setLeft(553);
    obj.button18:setTop(487);
    obj.button18:setWidth(14);
    obj.button18:setHeight(14);
    obj.button18:setText("R");
    obj.button18:setHint("Desc... ");
    obj.button18:setName("button18");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.rectangle1);
    obj.image19:setWidth(17);
    obj.image19:setHeight(17);
    obj.image19:setLeft(552);
    obj.image19:setTop(487);
    obj.image19:setStyle("proportional");
    obj.image19:setCenter(true);
    obj.image19:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image19:setName("image19");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle1);
    obj.button19:setLeft(553);
    obj.button19:setTop(518);
    obj.button19:setWidth(14);
    obj.button19:setHeight(14);
    obj.button19:setText("R");
    obj.button19:setHint("Desc... ");
    obj.button19:setName("button19");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.rectangle1);
    obj.image20:setWidth(17);
    obj.image20:setHeight(17);
    obj.image20:setLeft(552);
    obj.image20:setTop(518);
    obj.image20:setStyle("proportional");
    obj.image20:setCenter(true);
    obj.image20:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image20:setName("image20");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle1);
    obj.button20:setLeft(553);
    obj.button20:setTop(550);
    obj.button20:setWidth(14);
    obj.button20:setHeight(14);
    obj.button20:setText("R");
    obj.button20:setHint("Desc... ");
    obj.button20:setName("button20");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.rectangle1);
    obj.image21:setWidth(17);
    obj.image21:setHeight(17);
    obj.image21:setLeft(552);
    obj.image21:setTop(550);
    obj.image21:setStyle("proportional");
    obj.image21:setCenter(true);
    obj.image21:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image21:setName("image21");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle1);
    obj.button21:setLeft(553);
    obj.button21:setTop(581);
    obj.button21:setWidth(14);
    obj.button21:setHeight(14);
    obj.button21:setText("R");
    obj.button21:setHint("Desc... ");
    obj.button21:setName("button21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.rectangle1);
    obj.image22:setWidth(17);
    obj.image22:setHeight(17);
    obj.image22:setLeft(552);
    obj.image22:setTop(581);
    obj.image22:setStyle("proportional");
    obj.image22:setCenter(true);
    obj.image22:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image22:setName("image22");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle1);
    obj.button22:setLeft(553);
    obj.button22:setTop(611);
    obj.button22:setWidth(14);
    obj.button22:setHeight(14);
    obj.button22:setText("R");
    obj.button22:setHint("Desc... ");
    obj.button22:setName("button22");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.rectangle1);
    obj.image23:setWidth(17);
    obj.image23:setHeight(17);
    obj.image23:setLeft(552);
    obj.image23:setTop(611);
    obj.image23:setStyle("proportional");
    obj.image23:setCenter(true);
    obj.image23:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image23:setName("image23");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle1);
    obj.button23:setLeft(553);
    obj.button23:setTop(644);
    obj.button23:setWidth(14);
    obj.button23:setHeight(14);
    obj.button23:setText("R");
    obj.button23:setHint("Desc... ");
    obj.button23:setName("button23");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.rectangle1);
    obj.image24:setWidth(17);
    obj.image24:setHeight(17);
    obj.image24:setLeft(552);
    obj.image24:setTop(644);
    obj.image24:setStyle("proportional");
    obj.image24:setCenter(true);
    obj.image24:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image24:setName("image24");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle1);
    obj.button24:setLeft(553);
    obj.button24:setTop(675);
    obj.button24:setWidth(14);
    obj.button24:setHeight(14);
    obj.button24:setText("R");
    obj.button24:setHint("Desc... ");
    obj.button24:setName("button24");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.rectangle1);
    obj.image25:setWidth(17);
    obj.image25:setHeight(17);
    obj.image25:setLeft(552);
    obj.image25:setTop(675);
    obj.image25:setStyle("proportional");
    obj.image25:setCenter(true);
    obj.image25:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image25:setName("image25");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle1);
    obj.button25:setLeft(553);
    obj.button25:setTop(706);
    obj.button25:setWidth(14);
    obj.button25:setHeight(14);
    obj.button25:setText("R");
    obj.button25:setHint("Desc... ");
    obj.button25:setName("button25");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.rectangle1);
    obj.image26:setWidth(17);
    obj.image26:setHeight(17);
    obj.image26:setLeft(552);
    obj.image26:setTop(706);
    obj.image26:setStyle("proportional");
    obj.image26:setCenter(true);
    obj.image26:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image26:setName("image26");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle1);
    obj.button26:setLeft(553);
    obj.button26:setTop(737);
    obj.button26:setWidth(14);
    obj.button26:setHeight(14);
    obj.button26:setText("R");
    obj.button26:setHint("Desc... ");
    obj.button26:setName("button26");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.rectangle1);
    obj.image27:setWidth(17);
    obj.image27:setHeight(17);
    obj.image27:setLeft(552);
    obj.image27:setTop(737);
    obj.image27:setStyle("proportional");
    obj.image27:setCenter(true);
    obj.image27:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image27:setName("image27");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle1);
    obj.button27:setLeft(553);
    obj.button27:setTop(769);
    obj.button27:setWidth(14);
    obj.button27:setHeight(14);
    obj.button27:setText("R");
    obj.button27:setHint("Desc... ");
    obj.button27:setName("button27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.rectangle1);
    obj.image28:setWidth(17);
    obj.image28:setHeight(17);
    obj.image28:setLeft(552);
    obj.image28:setTop(769);
    obj.image28:setStyle("proportional");
    obj.image28:setCenter(true);
    obj.image28:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image28:setName("image28");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.rectangle1);
    obj.button28:setLeft(553);
    obj.button28:setTop(801);
    obj.button28:setWidth(14);
    obj.button28:setHeight(14);
    obj.button28:setText("R");
    obj.button28:setHint("Desc... ");
    obj.button28:setName("button28");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.rectangle1);
    obj.image29:setWidth(17);
    obj.image29:setHeight(17);
    obj.image29:setLeft(552);
    obj.image29:setTop(801);
    obj.image29:setStyle("proportional");
    obj.image29:setCenter(true);
    obj.image29:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image29:setName("image29");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.rectangle1);
    obj.button29:setLeft(553);
    obj.button29:setTop(832);
    obj.button29:setWidth(14);
    obj.button29:setHeight(14);
    obj.button29:setText("R");
    obj.button29:setHint("Desc... ");
    obj.button29:setName("button29");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.rectangle1);
    obj.image30:setWidth(17);
    obj.image30:setHeight(17);
    obj.image30:setLeft(552);
    obj.image30:setTop(832);
    obj.image30:setStyle("proportional");
    obj.image30:setCenter(true);
    obj.image30:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image30:setName("image30");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.rectangle1);
    obj.button30:setLeft(553);
    obj.button30:setTop(863);
    obj.button30:setWidth(14);
    obj.button30:setHeight(14);
    obj.button30:setText("R");
    obj.button30:setHint("Desc... ");
    obj.button30:setName("button30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.rectangle1);
    obj.image31:setWidth(17);
    obj.image31:setHeight(17);
    obj.image31:setLeft(552);
    obj.image31:setTop(863);
    obj.image31:setStyle("proportional");
    obj.image31:setCenter(true);
    obj.image31:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image31:setName("image31");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.rectangle1);
    obj.button31:setLeft(553);
    obj.button31:setTop(894);
    obj.button31:setWidth(14);
    obj.button31:setHeight(14);
    obj.button31:setText("R");
    obj.button31:setHint("Desc... ");
    obj.button31:setName("button31");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.rectangle1);
    obj.image32:setWidth(17);
    obj.image32:setHeight(17);
    obj.image32:setLeft(552);
    obj.image32:setTop(894);
    obj.image32:setStyle("proportional");
    obj.image32:setCenter(true);
    obj.image32:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image32:setName("image32");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.rectangle1);
    obj.button32:setLeft(553);
    obj.button32:setTop(926);
    obj.button32:setWidth(14);
    obj.button32:setHeight(14);
    obj.button32:setText("R");
    obj.button32:setHint("Desc... ");
    obj.button32:setName("button32");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.rectangle1);
    obj.image33:setWidth(17);
    obj.image33:setHeight(17);
    obj.image33:setLeft(552);
    obj.image33:setTop(926);
    obj.image33:setStyle("proportional");
    obj.image33:setCenter(true);
    obj.image33:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image33:setName("image33");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.rectangle1);
    obj.button33:setLeft(553);
    obj.button33:setTop(956);
    obj.button33:setWidth(14);
    obj.button33:setHeight(14);
    obj.button33:setText("R");
    obj.button33:setHint("Desc... ");
    obj.button33:setName("button33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.rectangle1);
    obj.image34:setWidth(17);
    obj.image34:setHeight(17);
    obj.image34:setLeft(552);
    obj.image34:setTop(956);
    obj.image34:setStyle("proportional");
    obj.image34:setCenter(true);
    obj.image34:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image34:setName("image34");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.rectangle1);
    obj.button34:setLeft(553);
    obj.button34:setTop(989);
    obj.button34:setWidth(14);
    obj.button34:setHeight(14);
    obj.button34:setText("R");
    obj.button34:setHint("Desc... ");
    obj.button34:setName("button34");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.rectangle1);
    obj.image35:setWidth(17);
    obj.image35:setHeight(17);
    obj.image35:setLeft(552);
    obj.image35:setTop(989);
    obj.image35:setStyle("proportional");
    obj.image35:setCenter(true);
    obj.image35:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image35:setName("image35");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.rectangle1);
    obj.button35:setLeft(555);
    obj.button35:setTop(1020);
    obj.button35:setWidth(14);
    obj.button35:setHeight(14);
    obj.button35:setText("R");
    obj.button35:setHint("Desc... ");
    obj.button35:setName("button35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.rectangle1);
    obj.image36:setWidth(17);
    obj.image36:setHeight(17);
    obj.image36:setLeft(552);
    obj.image36:setTop(1020);
    obj.image36:setStyle("proportional");
    obj.image36:setCenter(true);
    obj.image36:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image36:setName("image36");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.rectangle1);
    obj.button36:setLeft(555);
    obj.button36:setTop(1052);
    obj.button36:setWidth(14);
    obj.button36:setHeight(14);
    obj.button36:setText("R");
    obj.button36:setHint("Desc... ");
    obj.button36:setName("button36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.rectangle1);
    obj.image37:setWidth(17);
    obj.image37:setHeight(17);
    obj.image37:setLeft(552);
    obj.image37:setTop(1052);
    obj.image37:setStyle("proportional");
    obj.image37:setCenter(true);
    obj.image37:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image37:setName("image37");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.rectangle1);
    obj.button37:setLeft(556);
    obj.button37:setTop(1084);
    obj.button37:setWidth(14);
    obj.button37:setHeight(14);
    obj.button37:setText("R");
    obj.button37:setHint("Desc... ");
    obj.button37:setName("button37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.rectangle1);
    obj.image38:setWidth(17);
    obj.image38:setHeight(17);
    obj.image38:setLeft(555);
    obj.image38:setTop(1084);
    obj.image38:setStyle("proportional");
    obj.image38:setCenter(true);
    obj.image38:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image38:setName("image38");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.rectangle1);
    obj.button38:setLeft(556);
    obj.button38:setTop(1114);
    obj.button38:setWidth(14);
    obj.button38:setHeight(14);
    obj.button38:setText("R");
    obj.button38:setHint("Desc... ");
    obj.button38:setName("button38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.rectangle1);
    obj.image39:setWidth(17);
    obj.image39:setHeight(17);
    obj.image39:setLeft(555);
    obj.image39:setTop(1114);
    obj.image39:setStyle("proportional");
    obj.image39:setCenter(true);
    obj.image39:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image39:setName("image39");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.rectangle1);
    obj.button39:setLeft(557);
    obj.button39:setTop(1148);
    obj.button39:setWidth(14);
    obj.button39:setHeight(14);
    obj.button39:setText("R");
    obj.button39:setHint("Desc... ");
    obj.button39:setName("button39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.rectangle1);
    obj.image40:setWidth(17);
    obj.image40:setHeight(17);
    obj.image40:setLeft(556);
    obj.image40:setTop(1148);
    obj.image40:setStyle("proportional");
    obj.image40:setCenter(true);
    obj.image40:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image40:setName("image40");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(472);
    obj.layout42:setTop(261);
    obj.layout42:setWidth(74);
    obj.layout42:setHeight(26);
    obj.layout42:setName("layout42");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout42);
    obj.edit34:setField("Peri01");
    obj.edit34:setWidth(74);
    obj.edit34:setHeight(27);
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("#C0504D");
    obj.edit34:setFontSize(18);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setFontFamily("kalam");
    obj.edit34:setType("number");
    obj.edit34:setTransparent(true);

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(473);
    obj.layout43:setTop(293);
    obj.layout43:setWidth(71);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout43);
    obj.edit35:setField("Peri02");
    obj.edit35:setWidth(71);
    obj.edit35:setHeight(26);
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("#C0504D");
    obj.edit35:setFontSize(18);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setFontFamily("kalam");
    obj.edit35:setType("number");
    obj.edit35:setTransparent(true);

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(474);
    obj.layout44:setTop(325);
    obj.layout44:setWidth(72);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout44);
    obj.edit36:setField("Peri03");
    obj.edit36:setWidth(72);
    obj.edit36:setHeight(26);
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("#C0504D");
    obj.edit36:setFontSize(18);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setFontFamily("kalam");
    obj.edit36:setType("number");
    obj.edit36:setTransparent(true);

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(474);
    obj.layout45:setTop(357);
    obj.layout45:setWidth(70);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout45);
    obj.edit37:setField("Peri04");
    obj.edit37:setWidth(70);
    obj.edit37:setHeight(26);
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("#C0504D");
    obj.edit37:setFontSize(18);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setFontFamily("kalam");
    obj.edit37:setType("number");
    obj.edit37:setTransparent(true);

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(473);
    obj.layout46:setTop(387);
    obj.layout46:setWidth(72);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout46);
    obj.edit38:setField("Peri05");
    obj.edit38:setWidth(72);
    obj.edit38:setHeight(26);
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("#C0504D");
    obj.edit38:setFontSize(18);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setFontFamily("kalam");
    obj.edit38:setType("number");
    obj.edit38:setTransparent(true);

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(474);
    obj.layout47:setTop(418);
    obj.layout47:setWidth(71);
    obj.layout47:setHeight(26);
    obj.layout47:setName("layout47");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout47);
    obj.edit39:setField("Peri06");
    obj.edit39:setWidth(71);
    obj.edit39:setHeight(27);
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("#C0504D");
    obj.edit39:setFontSize(18);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setFontFamily("kalam");
    obj.edit39:setType("number");
    obj.edit39:setTransparent(true);

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(473);
    obj.layout48:setTop(449);
    obj.layout48:setWidth(74);
    obj.layout48:setHeight(26);
    obj.layout48:setName("layout48");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout48);
    obj.edit40:setField("Peri07");
    obj.edit40:setWidth(74);
    obj.edit40:setHeight(27);
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("#C0504D");
    obj.edit40:setFontSize(18);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setFontFamily("kalam");
    obj.edit40:setType("number");
    obj.edit40:setTransparent(true);

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(474);
    obj.layout49:setTop(480);
    obj.layout49:setWidth(74);
    obj.layout49:setHeight(26);
    obj.layout49:setName("layout49");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout49);
    obj.edit41:setField("Peri08");
    obj.edit41:setWidth(74);
    obj.edit41:setHeight(27);
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("#C0504D");
    obj.edit41:setFontSize(18);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit41, "fontStyle",  "bold");
    obj.edit41:setFontFamily("kalam");
    obj.edit41:setType("number");
    obj.edit41:setTransparent(true);

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(472);
    obj.layout50:setTop(511);
    obj.layout50:setWidth(74);
    obj.layout50:setHeight(26);
    obj.layout50:setName("layout50");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout50);
    obj.edit42:setField("Peri09");
    obj.edit42:setWidth(74);
    obj.edit42:setHeight(27);
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("#C0504D");
    obj.edit42:setFontSize(18);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit42, "fontStyle",  "bold");
    obj.edit42:setFontFamily("kalam");
    obj.edit42:setType("number");
    obj.edit42:setTransparent(true);

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(471);
    obj.layout51:setTop(543);
    obj.layout51:setWidth(77);
    obj.layout51:setHeight(26);
    obj.layout51:setName("layout51");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout51);
    obj.edit43:setField("Peri10");
    obj.edit43:setWidth(77);
    obj.edit43:setHeight(27);
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("#C0504D");
    obj.edit43:setFontSize(18);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");
    obj.edit43:setFontFamily("kalam");
    obj.edit43:setType("number");
    obj.edit43:setTransparent(true);

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(471);
    obj.layout52:setTop(574);
    obj.layout52:setWidth(76);
    obj.layout52:setHeight(26);
    obj.layout52:setName("layout52");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout52);
    obj.edit44:setField("Peri11");
    obj.edit44:setWidth(76);
    obj.edit44:setHeight(27);
    obj.edit44:setName("edit44");
    obj.edit44:setFontColor("#C0504D");
    obj.edit44:setFontSize(18);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit44, "fontStyle",  "bold");
    obj.edit44:setFontFamily("kalam");
    obj.edit44:setType("number");
    obj.edit44:setTransparent(true);

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(472);
    obj.layout53:setTop(604);
    obj.layout53:setWidth(76);
    obj.layout53:setHeight(26);
    obj.layout53:setName("layout53");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout53);
    obj.edit45:setField("Peri12");
    obj.edit45:setWidth(76);
    obj.edit45:setHeight(27);
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("#C0504D");
    obj.edit45:setFontSize(18);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit45, "fontStyle",  "bold");
    obj.edit45:setFontFamily("kalam");
    obj.edit45:setType("number");
    obj.edit45:setTransparent(true);

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(471);
    obj.layout54:setTop(637);
    obj.layout54:setWidth(75);
    obj.layout54:setHeight(26);
    obj.layout54:setName("layout54");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout54);
    obj.edit46:setField("Peri13");
    obj.edit46:setWidth(75);
    obj.edit46:setHeight(27);
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("#C0504D");
    obj.edit46:setFontSize(18);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setFontFamily("kalam");
    obj.edit46:setType("number");
    obj.edit46:setTransparent(true);

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(469);
    obj.layout55:setTop(668);
    obj.layout55:setWidth(76);
    obj.layout55:setHeight(26);
    obj.layout55:setName("layout55");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout55);
    obj.edit47:setField("Peri14");
    obj.edit47:setWidth(76);
    obj.edit47:setHeight(27);
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("#C0504D");
    obj.edit47:setFontSize(18);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit47, "fontStyle",  "bold");
    obj.edit47:setFontFamily("kalam");
    obj.edit47:setType("number");
    obj.edit47:setTransparent(true);

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(470);
    obj.layout56:setTop(699);
    obj.layout56:setWidth(74);
    obj.layout56:setHeight(26);
    obj.layout56:setName("layout56");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout56);
    obj.edit48:setField("Peri15");
    obj.edit48:setWidth(74);
    obj.edit48:setHeight(27);
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("#C0504D");
    obj.edit48:setFontSize(18);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit48, "fontStyle",  "bold");
    obj.edit48:setFontFamily("kalam");
    obj.edit48:setType("number");
    obj.edit48:setTransparent(true);

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(471);
    obj.layout57:setTop(730);
    obj.layout57:setWidth(74);
    obj.layout57:setHeight(27);
    obj.layout57:setName("layout57");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout57);
    obj.edit49:setField("Peri16");
    obj.edit49:setWidth(74);
    obj.edit49:setHeight(28);
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("#C0504D");
    obj.edit49:setFontSize(18);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setFontFamily("kalam");
    obj.edit49:setType("number");
    obj.edit49:setTransparent(true);

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(473);
    obj.layout58:setTop(762);
    obj.layout58:setWidth(73);
    obj.layout58:setHeight(26);
    obj.layout58:setName("layout58");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout58);
    obj.edit50:setField("Peri17");
    obj.edit50:setWidth(73);
    obj.edit50:setHeight(27);
    obj.edit50:setName("edit50");
    obj.edit50:setFontColor("#C0504D");
    obj.edit50:setFontSize(18);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit50, "fontStyle",  "bold");
    obj.edit50:setFontFamily("kalam");
    obj.edit50:setType("number");
    obj.edit50:setTransparent(true);

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(472);
    obj.layout59:setTop(794);
    obj.layout59:setWidth(74);
    obj.layout59:setHeight(26);
    obj.layout59:setName("layout59");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout59);
    obj.edit51:setField("Peri18");
    obj.edit51:setWidth(74);
    obj.edit51:setHeight(27);
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("#C0504D");
    obj.edit51:setFontSize(18);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit51, "fontStyle",  "bold");
    obj.edit51:setFontFamily("kalam");
    obj.edit51:setType("number");
    obj.edit51:setTransparent(true);

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(472);
    obj.layout60:setTop(825);
    obj.layout60:setWidth(74);
    obj.layout60:setHeight(26);
    obj.layout60:setName("layout60");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout60);
    obj.edit52:setField("Peri19");
    obj.edit52:setWidth(74);
    obj.edit52:setHeight(27);
    obj.edit52:setName("edit52");
    obj.edit52:setFontColor("#C0504D");
    obj.edit52:setFontSize(18);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit52, "fontStyle",  "bold");
    obj.edit52:setFontFamily("kalam");
    obj.edit52:setType("number");
    obj.edit52:setTransparent(true);

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(474);
    obj.layout61:setTop(856);
    obj.layout61:setWidth(70);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout61);
    obj.edit53:setField("Peri20");
    obj.edit53:setWidth(70);
    obj.edit53:setHeight(26);
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("#C0504D");
    obj.edit53:setFontSize(18);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit53, "fontStyle",  "bold");
    obj.edit53:setFontFamily("kalam");
    obj.edit53:setType("number");
    obj.edit53:setTransparent(true);

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(471);
    obj.layout62:setTop(887);
    obj.layout62:setWidth(75);
    obj.layout62:setHeight(26);
    obj.layout62:setName("layout62");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout62);
    obj.edit54:setField("Peri21");
    obj.edit54:setWidth(75);
    obj.edit54:setHeight(27);
    obj.edit54:setName("edit54");
    obj.edit54:setFontColor("#C0504D");
    obj.edit54:setFontSize(18);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit54, "fontStyle",  "bold");
    obj.edit54:setFontFamily("kalam");
    obj.edit54:setType("number");
    obj.edit54:setTransparent(true);

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(472);
    obj.layout63:setTop(919);
    obj.layout63:setWidth(74);
    obj.layout63:setHeight(26);
    obj.layout63:setName("layout63");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout63);
    obj.edit55:setField("Peri22");
    obj.edit55:setWidth(74);
    obj.edit55:setHeight(27);
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("#C0504D");
    obj.edit55:setFontSize(18);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit55, "fontStyle",  "bold");
    obj.edit55:setFontFamily("kalam");
    obj.edit55:setType("number");
    obj.edit55:setTransparent(true);

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(471);
    obj.layout64:setTop(949);
    obj.layout64:setWidth(73);
    obj.layout64:setHeight(26);
    obj.layout64:setName("layout64");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout64);
    obj.edit56:setField("Peri23");
    obj.edit56:setWidth(73);
    obj.edit56:setHeight(27);
    obj.edit56:setName("edit56");
    obj.edit56:setFontColor("#C0504D");
    obj.edit56:setFontSize(18);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit56, "fontStyle",  "bold");
    obj.edit56:setFontFamily("kalam");
    obj.edit56:setType("number");
    obj.edit56:setTransparent(true);

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(472);
    obj.layout65:setTop(982);
    obj.layout65:setWidth(74);
    obj.layout65:setHeight(27);
    obj.layout65:setName("layout65");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout65);
    obj.edit57:setField("Peri24");
    obj.edit57:setWidth(74);
    obj.edit57:setHeight(28);
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("#C0504D");
    obj.edit57:setFontSize(18);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit57, "fontStyle",  "bold");
    obj.edit57:setFontFamily("kalam");
    obj.edit57:setType("number");
    obj.edit57:setTransparent(true);

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(473);
    obj.layout66:setTop(1013);
    obj.layout66:setWidth(73);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout66);
    obj.edit58:setField("Peri25");
    obj.edit58:setWidth(73);
    obj.edit58:setHeight(26);
    obj.edit58:setName("edit58");
    obj.edit58:setFontColor("#C0504D");
    obj.edit58:setFontSize(18);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit58, "fontStyle",  "bold");
    obj.edit58:setFontFamily("kalam");
    obj.edit58:setType("number");
    obj.edit58:setTransparent(true);

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(473);
    obj.layout67:setTop(1045);
    obj.layout67:setWidth(73);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout67);
    obj.edit59:setField("Peri26");
    obj.edit59:setWidth(73);
    obj.edit59:setHeight(26);
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("#C0504D");
    obj.edit59:setFontSize(18);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit59, "fontStyle",  "bold");
    obj.edit59:setFontFamily("kalam");
    obj.edit59:setType("number");
    obj.edit59:setTransparent(true);

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(473);
    obj.layout68:setTop(1077);
    obj.layout68:setWidth(73);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout68);
    obj.edit60:setField("Peri27");
    obj.edit60:setWidth(73);
    obj.edit60:setHeight(26);
    obj.edit60:setName("edit60");
    obj.edit60:setFontColor("#C0504D");
    obj.edit60:setFontSize(18);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit60, "fontStyle",  "bold");
    obj.edit60:setFontFamily("kalam");
    obj.edit60:setType("number");
    obj.edit60:setTransparent(true);

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(474);
    obj.layout69:setTop(1107);
    obj.layout69:setWidth(73);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout69);
    obj.edit61:setField("Peri28");
    obj.edit61:setWidth(73);
    obj.edit61:setHeight(26);
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("#C0504D");
    obj.edit61:setFontSize(18);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit61, "fontStyle",  "bold");
    obj.edit61:setFontFamily("kalam");
    obj.edit61:setType("number");
    obj.edit61:setTransparent(true);

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(474);
    obj.layout70:setTop(1141);
    obj.layout70:setWidth(73);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout70);
    obj.edit62:setField("Peri29");
    obj.edit62:setWidth(73);
    obj.edit62:setHeight(26);
    obj.edit62:setName("edit62");
    obj.edit62:setFontColor("#C0504D");
    obj.edit62:setFontSize(18);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit62, "fontStyle",  "bold");
    obj.edit62:setFontFamily("kalam");
    obj.edit62:setType("number");
    obj.edit62:setTransparent(true);

    obj.DescCircunstancia1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia1:setParent(obj.rectangle1);
    obj.DescCircunstancia1:setName("DescCircunstancia1");
    obj.DescCircunstancia1:setWidth(300);
    obj.DescCircunstancia1:setHeight(300);
    obj.DescCircunstancia1:setBackOpacity(0.5);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.DescCircunstancia1);
    obj.textEditor1:setField("DCir1");
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setFontColor("#C0504D");
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setHorzTextAlign("leading");
    obj.textEditor1:setFontFamily("kalam");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setAlign("client");

    obj.DescCircunstancia2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia2:setParent(obj.rectangle1);
    obj.DescCircunstancia2:setName("DescCircunstancia2");
    obj.DescCircunstancia2:setWidth(300);
    obj.DescCircunstancia2:setHeight(300);
    obj.DescCircunstancia2:setBackOpacity(0.5);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.DescCircunstancia2);
    obj.textEditor2:setField("DCir2");
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setFontColor("#C0504D");
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setHorzTextAlign("leading");
    obj.textEditor2:setFontFamily("kalam");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setAlign("client");

    obj.DescCircunstancia3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia3:setParent(obj.rectangle1);
    obj.DescCircunstancia3:setName("DescCircunstancia3");
    obj.DescCircunstancia3:setWidth(300);
    obj.DescCircunstancia3:setHeight(300);
    obj.DescCircunstancia3:setBackOpacity(0.5);

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.DescCircunstancia3);
    obj.textEditor3:setField("DCir3");
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setFontColor("#C0504D");
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setHorzTextAlign("leading");
    obj.textEditor3:setFontFamily("kalam");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setAlign("client");

    obj.DescCircunstancia4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia4:setParent(obj.rectangle1);
    obj.DescCircunstancia4:setName("DescCircunstancia4");
    obj.DescCircunstancia4:setWidth(300);
    obj.DescCircunstancia4:setHeight(300);
    obj.DescCircunstancia4:setBackOpacity(0.5);

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.DescCircunstancia4);
    obj.textEditor4:setField("DCir4");
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setFontColor("#C0504D");
    obj.textEditor4:setFontSize(15);
    obj.textEditor4:setHorzTextAlign("leading");
    obj.textEditor4:setFontFamily("kalam");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setAlign("client");

    obj.DescCircunstancia5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia5:setParent(obj.rectangle1);
    obj.DescCircunstancia5:setName("DescCircunstancia5");
    obj.DescCircunstancia5:setWidth(300);
    obj.DescCircunstancia5:setHeight(300);
    obj.DescCircunstancia5:setBackOpacity(0.5);

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.DescCircunstancia5);
    obj.textEditor5:setField("DCir5");
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setFontColor("#C0504D");
    obj.textEditor5:setFontSize(15);
    obj.textEditor5:setHorzTextAlign("leading");
    obj.textEditor5:setFontFamily("kalam");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setAlign("client");

    obj.DescCircunstancia6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia6:setParent(obj.rectangle1);
    obj.DescCircunstancia6:setName("DescCircunstancia6");
    obj.DescCircunstancia6:setWidth(300);
    obj.DescCircunstancia6:setHeight(300);
    obj.DescCircunstancia6:setBackOpacity(0.5);

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.DescCircunstancia6);
    obj.textEditor6:setField("DCir6");
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setFontColor("#C0504D");
    obj.textEditor6:setFontSize(15);
    obj.textEditor6:setHorzTextAlign("leading");
    obj.textEditor6:setFontFamily("kalam");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setAlign("client");

    obj.DescCircunstancia7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia7:setParent(obj.rectangle1);
    obj.DescCircunstancia7:setName("DescCircunstancia7");
    obj.DescCircunstancia7:setWidth(300);
    obj.DescCircunstancia7:setHeight(300);
    obj.DescCircunstancia7:setBackOpacity(0.5);

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.DescCircunstancia7);
    obj.textEditor7:setField("DCir7");
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setFontColor("#C0504D");
    obj.textEditor7:setFontSize(15);
    obj.textEditor7:setHorzTextAlign("leading");
    obj.textEditor7:setFontFamily("kalam");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setAlign("client");

    obj.DescCircunstancia8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia8:setParent(obj.rectangle1);
    obj.DescCircunstancia8:setName("DescCircunstancia8");
    obj.DescCircunstancia8:setWidth(300);
    obj.DescCircunstancia8:setHeight(300);
    obj.DescCircunstancia8:setBackOpacity(0.5);

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.DescCircunstancia8);
    obj.textEditor8:setField("DCir8");
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setFontColor("#C0504D");
    obj.textEditor8:setFontSize(15);
    obj.textEditor8:setHorzTextAlign("leading");
    obj.textEditor8:setFontFamily("kalam");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setAlign("client");

    obj.DescCircunstancia9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia9:setParent(obj.rectangle1);
    obj.DescCircunstancia9:setName("DescCircunstancia9");
    obj.DescCircunstancia9:setWidth(300);
    obj.DescCircunstancia9:setHeight(300);
    obj.DescCircunstancia9:setBackOpacity(0.5);

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.DescCircunstancia9);
    obj.textEditor9:setField("DCir9");
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setFontColor("#C0504D");
    obj.textEditor9:setFontSize(15);
    obj.textEditor9:setHorzTextAlign("leading");
    obj.textEditor9:setFontFamily("kalam");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setAlign("client");

    obj.DescCircunstancia10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia10:setParent(obj.rectangle1);
    obj.DescCircunstancia10:setName("DescCircunstancia10");
    obj.DescCircunstancia10:setWidth(300);
    obj.DescCircunstancia10:setHeight(300);
    obj.DescCircunstancia10:setBackOpacity(0.5);

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.DescCircunstancia10);
    obj.textEditor10:setField("10");
    obj.textEditor10:setName("textEditor10");
    obj.textEditor10:setFontColor("#C0504D");
    obj.textEditor10:setFontSize(15);
    obj.textEditor10:setHorzTextAlign("leading");
    obj.textEditor10:setFontFamily("kalam");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setAlign("client");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(578);
    obj.layout71:setTop(264);
    obj.layout71:setWidth(191);
    obj.layout71:setHeight(35);
    obj.layout71:setName("layout71");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout71);
    obj.edit63:setWidth(191);
    obj.edit63:setHeight(30);
    obj.edit63:setField("CircField_1");
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("#C0504D");
    obj.edit63:setFontSize(15);
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setFontFamily("kalam");
    obj.edit63:setTransparent(true);

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(788);
    obj.layout72:setTop(270);
    obj.layout72:setWidth(67);
    obj.layout72:setHeight(29);
    obj.layout72:setName("layout72");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout72);
    obj.edit64:setTransparent(true);
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(67);
    obj.edit64:setHeight(30);
    obj.edit64:setField("CircXP_1");
    obj.edit64:setName("edit64");
    obj.edit64:setFontColor("#C0504D");
    obj.edit64:setFontSize(18);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit64, "fontStyle",  "bold");
    obj.edit64:setFontFamily("kalam");
    obj.edit64:setType("number");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.rectangle1);
    obj.button40:setText("i");
    obj.button40:setWidth(20);
    obj.button40:setLeft(867);
    obj.button40:setTop(273);
    obj.button40:setHeight(20);
    obj.button40:setName("button40");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.rectangle1);
    obj.button41:setLeft(887);
    obj.button41:setTop(273);
    obj.button41:setWidth(14);
    obj.button41:setHeight(14);
    obj.button41:setText("R");
    obj.button41:setHint("Desc... ");
    obj.button41:setName("button41");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.rectangle1);
    obj.image41:setWidth(17);
    obj.image41:setHeight(17);
    obj.image41:setLeft(886);
    obj.image41:setTop(273);
    obj.image41:setStyle("proportional");
    obj.image41:setCenter(true);
    obj.image41:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image41:setName("image41");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(578);
    obj.layout73:setTop(300);
    obj.layout73:setWidth(191);
    obj.layout73:setHeight(30);
    obj.layout73:setName("layout73");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout73);
    obj.edit65:setWidth(191);
    obj.edit65:setHeight(30);
    obj.edit65:setField("CircField_2");
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("#C0504D");
    obj.edit65:setFontSize(15);
    obj.edit65:setHorzTextAlign("leading");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setFontFamily("kalam");
    obj.edit65:setTransparent(true);

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(788);
    obj.layout74:setTop(303);
    obj.layout74:setWidth(67);
    obj.layout74:setHeight(30);
    obj.layout74:setName("layout74");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout74);
    obj.edit66:setTransparent(true);
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(67);
    obj.edit66:setHeight(31);
    obj.edit66:setField("CircXP_2");
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("#C0504D");
    obj.edit66:setFontSize(18);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit66, "fontStyle",  "bold");
    obj.edit66:setFontFamily("kalam");
    obj.edit66:setType("number");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.rectangle1);
    obj.button42:setText("i");
    obj.button42:setWidth(20);
    obj.button42:setLeft(867);
    obj.button42:setTop(306);
    obj.button42:setHeight(20);
    obj.button42:setName("button42");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.rectangle1);
    obj.button43:setLeft(887);
    obj.button43:setTop(306);
    obj.button43:setWidth(14);
    obj.button43:setHeight(14);
    obj.button43:setText("R");
    obj.button43:setHint("Desc... ");
    obj.button43:setName("button43");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.rectangle1);
    obj.image42:setWidth(17);
    obj.image42:setHeight(17);
    obj.image42:setLeft(886);
    obj.image42:setTop(306);
    obj.image42:setStyle("proportional");
    obj.image42:setCenter(true);
    obj.image42:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image42:setName("image42");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(578);
    obj.layout75:setTop(335);
    obj.layout75:setWidth(191);
    obj.layout75:setHeight(30);
    obj.layout75:setName("layout75");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout75);
    obj.edit67:setWidth(191);
    obj.edit67:setHeight(30);
    obj.edit67:setField("CircField_3");
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("#C0504D");
    obj.edit67:setFontSize(15);
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setFontFamily("kalam");
    obj.edit67:setTransparent(true);

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(788);
    obj.layout76:setTop(338);
    obj.layout76:setWidth(67);
    obj.layout76:setHeight(29);
    obj.layout76:setName("layout76");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout76);
    obj.edit68:setTransparent(true);
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(67);
    obj.edit68:setHeight(30);
    obj.edit68:setField("CircXP_3");
    obj.edit68:setName("edit68");
    obj.edit68:setFontColor("#C0504D");
    obj.edit68:setFontSize(18);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit68, "fontStyle",  "bold");
    obj.edit68:setFontFamily("kalam");
    obj.edit68:setType("number");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle1);
    obj.button44:setText("i");
    obj.button44:setWidth(20);
    obj.button44:setLeft(867);
    obj.button44:setTop(341);
    obj.button44:setHeight(20);
    obj.button44:setName("button44");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.rectangle1);
    obj.button45:setLeft(887);
    obj.button45:setTop(341);
    obj.button45:setWidth(14);
    obj.button45:setHeight(14);
    obj.button45:setText("R");
    obj.button45:setHint("Desc... ");
    obj.button45:setName("button45");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.rectangle1);
    obj.image43:setWidth(17);
    obj.image43:setHeight(17);
    obj.image43:setLeft(886);
    obj.image43:setTop(341);
    obj.image43:setStyle("proportional");
    obj.image43:setCenter(true);
    obj.image43:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image43:setName("image43");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(578);
    obj.layout77:setTop(370);
    obj.layout77:setWidth(191);
    obj.layout77:setHeight(30);
    obj.layout77:setName("layout77");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout77);
    obj.edit69:setWidth(191);
    obj.edit69:setHeight(30);
    obj.edit69:setField("CircField_4");
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("#C0504D");
    obj.edit69:setFontSize(15);
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setFontFamily("kalam");
    obj.edit69:setTransparent(true);

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(788);
    obj.layout78:setTop(372);
    obj.layout78:setWidth(67);
    obj.layout78:setHeight(29);
    obj.layout78:setName("layout78");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout78);
    obj.edit70:setTransparent(true);
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(67);
    obj.edit70:setHeight(30);
    obj.edit70:setField("CircXP_4");
    obj.edit70:setName("edit70");
    obj.edit70:setFontColor("#C0504D");
    obj.edit70:setFontSize(18);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit70, "fontStyle",  "bold");
    obj.edit70:setFontFamily("kalam");
    obj.edit70:setType("number");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.rectangle1);
    obj.button46:setText("i");
    obj.button46:setWidth(20);
    obj.button46:setLeft(867);
    obj.button46:setTop(375);
    obj.button46:setHeight(20);
    obj.button46:setName("button46");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.rectangle1);
    obj.button47:setLeft(887);
    obj.button47:setTop(376);
    obj.button47:setWidth(14);
    obj.button47:setHeight(14);
    obj.button47:setText("R");
    obj.button47:setHint("Desc... ");
    obj.button47:setName("button47");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.rectangle1);
    obj.image44:setWidth(17);
    obj.image44:setHeight(17);
    obj.image44:setLeft(886);
    obj.image44:setTop(376);
    obj.image44:setStyle("proportional");
    obj.image44:setCenter(true);
    obj.image44:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image44:setName("image44");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(578);
    obj.layout79:setTop(403);
    obj.layout79:setWidth(191);
    obj.layout79:setHeight(30);
    obj.layout79:setName("layout79");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout79);
    obj.edit71:setWidth(191);
    obj.edit71:setHeight(30);
    obj.edit71:setField("CircField_5");
    obj.edit71:setName("edit71");
    obj.edit71:setFontColor("#C0504D");
    obj.edit71:setFontSize(15);
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setFontFamily("kalam");
    obj.edit71:setTransparent(true);

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(788);
    obj.layout80:setTop(406);
    obj.layout80:setWidth(67);
    obj.layout80:setHeight(29);
    obj.layout80:setName("layout80");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout80);
    obj.edit72:setTransparent(true);
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(67);
    obj.edit72:setHeight(30);
    obj.edit72:setField("CircXP_5");
    obj.edit72:setName("edit72");
    obj.edit72:setFontColor("#C0504D");
    obj.edit72:setFontSize(18);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit72, "fontStyle",  "bold");
    obj.edit72:setFontFamily("kalam");
    obj.edit72:setType("number");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.rectangle1);
    obj.button48:setText("i");
    obj.button48:setWidth(20);
    obj.button48:setLeft(867);
    obj.button48:setTop(409);
    obj.button48:setHeight(20);
    obj.button48:setName("button48");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.rectangle1);
    obj.button49:setLeft(887);
    obj.button49:setTop(409);
    obj.button49:setWidth(14);
    obj.button49:setHeight(14);
    obj.button49:setText("R");
    obj.button49:setHint("Desc... ");
    obj.button49:setName("button49");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.rectangle1);
    obj.image45:setWidth(17);
    obj.image45:setHeight(17);
    obj.image45:setLeft(886);
    obj.image45:setTop(409);
    obj.image45:setStyle("proportional");
    obj.image45:setCenter(true);
    obj.image45:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image45:setName("image45");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(578);
    obj.layout81:setTop(437);
    obj.layout81:setWidth(191);
    obj.layout81:setHeight(30);
    obj.layout81:setName("layout81");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout81);
    obj.edit73:setWidth(191);
    obj.edit73:setHeight(30);
    obj.edit73:setField("CircField_6");
    obj.edit73:setName("edit73");
    obj.edit73:setFontColor("#C0504D");
    obj.edit73:setFontSize(15);
    obj.edit73:setHorzTextAlign("leading");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setFontFamily("kalam");
    obj.edit73:setTransparent(true);

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(788);
    obj.layout82:setTop(440);
    obj.layout82:setWidth(67);
    obj.layout82:setHeight(29);
    obj.layout82:setName("layout82");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout82);
    obj.edit74:setTransparent(true);
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(67);
    obj.edit74:setHeight(30);
    obj.edit74:setField("CircXP_6");
    obj.edit74:setName("edit74");
    obj.edit74:setFontColor("#C0504D");
    obj.edit74:setFontSize(18);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit74, "fontStyle",  "bold");
    obj.edit74:setFontFamily("kalam");
    obj.edit74:setType("number");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.rectangle1);
    obj.button50:setText("i");
    obj.button50:setWidth(20);
    obj.button50:setLeft(867);
    obj.button50:setTop(443);
    obj.button50:setHeight(20);
    obj.button50:setName("button50");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.rectangle1);
    obj.button51:setLeft(887);
    obj.button51:setTop(443);
    obj.button51:setWidth(14);
    obj.button51:setHeight(14);
    obj.button51:setText("R");
    obj.button51:setHint("Desc... ");
    obj.button51:setName("button51");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.rectangle1);
    obj.image46:setWidth(17);
    obj.image46:setHeight(17);
    obj.image46:setLeft(886);
    obj.image46:setTop(443);
    obj.image46:setStyle("proportional");
    obj.image46:setCenter(true);
    obj.image46:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image46:setName("image46");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(578);
    obj.layout83:setTop(470);
    obj.layout83:setWidth(191);
    obj.layout83:setHeight(30);
    obj.layout83:setName("layout83");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout83);
    obj.edit75:setWidth(191);
    obj.edit75:setHeight(30);
    obj.edit75:setField("CircField_7");
    obj.edit75:setName("edit75");
    obj.edit75:setFontColor("#C0504D");
    obj.edit75:setFontSize(15);
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setFontFamily("kalam");
    obj.edit75:setTransparent(true);

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(788);
    obj.layout84:setTop(474);
    obj.layout84:setWidth(67);
    obj.layout84:setHeight(29);
    obj.layout84:setName("layout84");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout84);
    obj.edit76:setTransparent(true);
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(67);
    obj.edit76:setHeight(30);
    obj.edit76:setField("CircXP_7");
    obj.edit76:setName("edit76");
    obj.edit76:setFontColor("#C0504D");
    obj.edit76:setFontSize(18);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit76, "fontStyle",  "bold");
    obj.edit76:setFontFamily("kalam");
    obj.edit76:setType("number");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.rectangle1);
    obj.button52:setText("i");
    obj.button52:setWidth(20);
    obj.button52:setLeft(867);
    obj.button52:setTop(477);
    obj.button52:setHeight(20);
    obj.button52:setName("button52");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.rectangle1);
    obj.button53:setLeft(887);
    obj.button53:setTop(476);
    obj.button53:setWidth(14);
    obj.button53:setHeight(14);
    obj.button53:setText("R");
    obj.button53:setHint("Desc... ");
    obj.button53:setName("button53");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.rectangle1);
    obj.image47:setWidth(17);
    obj.image47:setHeight(17);
    obj.image47:setLeft(886);
    obj.image47:setTop(476);
    obj.image47:setStyle("proportional");
    obj.image47:setCenter(true);
    obj.image47:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image47:setName("image47");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(578);
    obj.layout85:setTop(504);
    obj.layout85:setWidth(191);
    obj.layout85:setHeight(30);
    obj.layout85:setName("layout85");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout85);
    obj.edit77:setWidth(191);
    obj.edit77:setHeight(30);
    obj.edit77:setField("CircField_8");
    obj.edit77:setName("edit77");
    obj.edit77:setFontColor("#C0504D");
    obj.edit77:setFontSize(15);
    obj.edit77:setHorzTextAlign("leading");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setFontFamily("kalam");
    obj.edit77:setTransparent(true);

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(788);
    obj.layout86:setTop(508);
    obj.layout86:setWidth(67);
    obj.layout86:setHeight(29);
    obj.layout86:setName("layout86");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout86);
    obj.edit78:setTransparent(true);
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(67);
    obj.edit78:setHeight(30);
    obj.edit78:setField("CircXP_8");
    obj.edit78:setName("edit78");
    obj.edit78:setFontColor("#C0504D");
    obj.edit78:setFontSize(18);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit78, "fontStyle",  "bold");
    obj.edit78:setFontFamily("kalam");
    obj.edit78:setType("number");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.rectangle1);
    obj.button54:setText("i");
    obj.button54:setWidth(20);
    obj.button54:setLeft(867);
    obj.button54:setTop(511);
    obj.button54:setHeight(20);
    obj.button54:setName("button54");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.rectangle1);
    obj.button55:setLeft(887);
    obj.button55:setTop(510);
    obj.button55:setWidth(14);
    obj.button55:setHeight(14);
    obj.button55:setText("R");
    obj.button55:setHint("Desc... ");
    obj.button55:setName("button55");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.rectangle1);
    obj.image48:setWidth(17);
    obj.image48:setHeight(17);
    obj.image48:setLeft(886);
    obj.image48:setTop(510);
    obj.image48:setStyle("proportional");
    obj.image48:setCenter(true);
    obj.image48:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image48:setName("image48");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(577);
    obj.layout87:setTop(538);
    obj.layout87:setWidth(191);
    obj.layout87:setHeight(30);
    obj.layout87:setName("layout87");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout87);
    obj.edit79:setWidth(191);
    obj.edit79:setHeight(30);
    obj.edit79:setField("CircField_9");
    obj.edit79:setName("edit79");
    obj.edit79:setFontColor("#C0504D");
    obj.edit79:setFontSize(15);
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setFontFamily("kalam");
    obj.edit79:setTransparent(true);

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(788);
    obj.layout88:setTop(542);
    obj.layout88:setWidth(67);
    obj.layout88:setHeight(29);
    obj.layout88:setName("layout88");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout88);
    obj.edit80:setTransparent(true);
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(67);
    obj.edit80:setHeight(30);
    obj.edit80:setField("CircXP_9");
    obj.edit80:setName("edit80");
    obj.edit80:setFontColor("#C0504D");
    obj.edit80:setFontSize(18);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit80, "fontStyle",  "bold");
    obj.edit80:setFontFamily("kalam");
    obj.edit80:setType("number");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.rectangle1);
    obj.button56:setText("i");
    obj.button56:setWidth(20);
    obj.button56:setLeft(867);
    obj.button56:setTop(545);
    obj.button56:setHeight(20);
    obj.button56:setName("button56");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.rectangle1);
    obj.button57:setLeft(887);
    obj.button57:setTop(544);
    obj.button57:setWidth(14);
    obj.button57:setHeight(14);
    obj.button57:setText("R");
    obj.button57:setHint("Desc... ");
    obj.button57:setName("button57");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.rectangle1);
    obj.image49:setWidth(17);
    obj.image49:setHeight(17);
    obj.image49:setLeft(886);
    obj.image49:setTop(544);
    obj.image49:setStyle("proportional");
    obj.image49:setCenter(true);
    obj.image49:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image49:setName("image49");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(577);
    obj.layout89:setTop(572);
    obj.layout89:setWidth(191);
    obj.layout89:setHeight(30);
    obj.layout89:setName("layout89");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout89);
    obj.edit81:setTransparent(true);
    obj.edit81:setWidth(191);
    obj.edit81:setHeight(30);
    obj.edit81:setField("CircField_1o");
    obj.edit81:setName("edit81");
    obj.edit81:setFontColor("#C0504D");
    obj.edit81:setFontSize(15);
    obj.edit81:setHorzTextAlign("leading");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setFontFamily("kalam");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(788);
    obj.layout90:setTop(576);
    obj.layout90:setWidth(67);
    obj.layout90:setHeight(29);
    obj.layout90:setName("layout90");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout90);
    obj.edit82:setTransparent(true);
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(67);
    obj.edit82:setHeight(30);
    obj.edit82:setField("CircXP_10");
    obj.edit82:setName("edit82");
    obj.edit82:setFontColor("#C0504D");
    obj.edit82:setFontSize(18);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit82, "fontStyle",  "bold");
    obj.edit82:setFontFamily("kalam");
    obj.edit82:setType("number");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.rectangle1);
    obj.button58:setText("i");
    obj.button58:setWidth(20);
    obj.button58:setLeft(867);
    obj.button58:setTop(579);
    obj.button58:setHeight(20);
    obj.button58:setName("button58");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.rectangle1);
    obj.button59:setLeft(887);
    obj.button59:setTop(578);
    obj.button59:setWidth(14);
    obj.button59:setHeight(14);
    obj.button59:setText("R");
    obj.button59:setHint("Desc... ");
    obj.button59:setName("button59");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.rectangle1);
    obj.image50:setWidth(17);
    obj.image50:setHeight(17);
    obj.image50:setLeft(886);
    obj.image50:setTop(578);
    obj.image50:setStyle("proportional");
    obj.image50:setCenter(true);
    obj.image50:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image50:setName("image50");

    obj.DescVanDes1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes1:setParent(obj.rectangle1);
    obj.DescVanDes1:setName("DescVanDes1");
    obj.DescVanDes1:setWidth(300);
    obj.DescVanDes1:setHeight(300);
    obj.DescVanDes1:setBackOpacity(0.5);

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.DescVanDes1);
    obj.textEditor11:setField("DVanDes1");
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setFontColor("#C0504D");
    obj.textEditor11:setFontSize(15);
    obj.textEditor11:setHorzTextAlign("leading");
    obj.textEditor11:setFontFamily("kalam");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setAlign("client");

    obj.DescVanDes2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes2:setParent(obj.rectangle1);
    obj.DescVanDes2:setName("DescVanDes2");
    obj.DescVanDes2:setWidth(300);
    obj.DescVanDes2:setHeight(300);
    obj.DescVanDes2:setBackOpacity(0.5);

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.DescVanDes2);
    obj.textEditor12:setField("DVanDes2");
    obj.textEditor12:setName("textEditor12");
    obj.textEditor12:setFontColor("#C0504D");
    obj.textEditor12:setFontSize(15);
    obj.textEditor12:setHorzTextAlign("leading");
    obj.textEditor12:setFontFamily("kalam");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setAlign("client");

    obj.DescVanDes3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes3:setParent(obj.rectangle1);
    obj.DescVanDes3:setName("DescVanDes3");
    obj.DescVanDes3:setWidth(300);
    obj.DescVanDes3:setHeight(300);
    obj.DescVanDes3:setBackOpacity(0.5);

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.DescVanDes3);
    obj.textEditor13:setField("DVanDes3");
    obj.textEditor13:setName("textEditor13");
    obj.textEditor13:setFontColor("#C0504D");
    obj.textEditor13:setFontSize(15);
    obj.textEditor13:setHorzTextAlign("leading");
    obj.textEditor13:setFontFamily("kalam");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setAlign("client");

    obj.DescVanDes4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes4:setParent(obj.rectangle1);
    obj.DescVanDes4:setName("DescVanDes4");
    obj.DescVanDes4:setWidth(300);
    obj.DescVanDes4:setHeight(300);
    obj.DescVanDes4:setBackOpacity(0.5);

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.DescVanDes4);
    obj.textEditor14:setField("DVanDes4");
    obj.textEditor14:setName("textEditor14");
    obj.textEditor14:setFontColor("#C0504D");
    obj.textEditor14:setFontSize(15);
    obj.textEditor14:setHorzTextAlign("leading");
    obj.textEditor14:setFontFamily("kalam");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setAlign("client");

    obj.DescVanDes5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes5:setParent(obj.rectangle1);
    obj.DescVanDes5:setName("DescVanDes5");
    obj.DescVanDes5:setWidth(300);
    obj.DescVanDes5:setHeight(300);
    obj.DescVanDes5:setBackOpacity(0.5);

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.DescVanDes5);
    obj.textEditor15:setField("DVanDes5");
    obj.textEditor15:setName("textEditor15");
    obj.textEditor15:setFontColor("#C0504D");
    obj.textEditor15:setFontSize(15);
    obj.textEditor15:setHorzTextAlign("leading");
    obj.textEditor15:setFontFamily("kalam");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setAlign("client");

    obj.DescVanDes6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes6:setParent(obj.rectangle1);
    obj.DescVanDes6:setName("DescVanDes6");
    obj.DescVanDes6:setWidth(300);
    obj.DescVanDes6:setHeight(300);
    obj.DescVanDes6:setBackOpacity(0.5);

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.DescVanDes6);
    obj.textEditor16:setField("DVanDes6");
    obj.textEditor16:setName("textEditor16");
    obj.textEditor16:setFontColor("#C0504D");
    obj.textEditor16:setFontSize(15);
    obj.textEditor16:setHorzTextAlign("leading");
    obj.textEditor16:setFontFamily("kalam");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setAlign("client");

    obj.DescVanDes7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes7:setParent(obj.rectangle1);
    obj.DescVanDes7:setName("DescVanDes7");
    obj.DescVanDes7:setWidth(300);
    obj.DescVanDes7:setHeight(300);
    obj.DescVanDes7:setBackOpacity(0.5);

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.DescVanDes7);
    obj.textEditor17:setField("DVanDes7");
    obj.textEditor17:setName("textEditor17");
    obj.textEditor17:setFontColor("#C0504D");
    obj.textEditor17:setFontSize(15);
    obj.textEditor17:setHorzTextAlign("leading");
    obj.textEditor17:setFontFamily("kalam");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setAlign("client");

    obj.DescVanDes8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes8:setParent(obj.rectangle1);
    obj.DescVanDes8:setName("DescVanDes8");
    obj.DescVanDes8:setWidth(300);
    obj.DescVanDes8:setHeight(300);
    obj.DescVanDes8:setBackOpacity(0.5);

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.DescVanDes8);
    obj.textEditor18:setField("DVanDes8");
    obj.textEditor18:setName("textEditor18");
    obj.textEditor18:setFontColor("#C0504D");
    obj.textEditor18:setFontSize(15);
    obj.textEditor18:setHorzTextAlign("leading");
    obj.textEditor18:setFontFamily("kalam");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setAlign("client");

    obj.DescVanDes9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes9:setParent(obj.rectangle1);
    obj.DescVanDes9:setName("DescVanDes9");
    obj.DescVanDes9:setWidth(300);
    obj.DescVanDes9:setHeight(300);
    obj.DescVanDes9:setBackOpacity(0.5);

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.DescVanDes9);
    obj.textEditor19:setField("DVanDes9");
    obj.textEditor19:setName("textEditor19");
    obj.textEditor19:setFontColor("#C0504D");
    obj.textEditor19:setFontSize(15);
    obj.textEditor19:setHorzTextAlign("leading");
    obj.textEditor19:setFontFamily("kalam");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setAlign("client");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(576);
    obj.layout91:setTop(672);
    obj.layout91:setWidth(193);
    obj.layout91:setHeight(30);
    obj.layout91:setName("layout91");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout91);
    obj.edit83:setWidth(193);
    obj.edit83:setHeight(31);
    obj.edit83:setField("VeD_Txt_1");
    obj.edit83:setName("edit83");
    obj.edit83:setFontColor("#C0504D");
    obj.edit83:setFontSize(15);
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setFontFamily("kalam");
    obj.edit83:setTransparent(true);

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(783);
    obj.layout92:setTop(679);
    obj.layout92:setWidth(72);
    obj.layout92:setHeight(30);
    obj.layout92:setName("layout92");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout92);
    obj.edit84:setTransparent(true);
    obj.edit84:setWidth(72);
    obj.edit84:setHeight(30);
    obj.edit84:setField("VeD_01");
    obj.edit84:setName("edit84");
    obj.edit84:setFontColor("#C0504D");
    obj.edit84:setFontSize(18);
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit84, "fontStyle",  "bold");
    obj.edit84:setFontFamily("kalam");
    obj.edit84:setType("number");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.rectangle1);
    obj.button60:setText("i");
    obj.button60:setWidth(20);
    obj.button60:setLeft(864);
    obj.button60:setTop(682);
    obj.button60:setHeight(20);
    obj.button60:setName("button60");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(576);
    obj.layout93:setTop(707);
    obj.layout93:setWidth(193);
    obj.layout93:setHeight(30);
    obj.layout93:setName("layout93");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout93);
    obj.edit85:setWidth(193);
    obj.edit85:setHeight(31);
    obj.edit85:setField("VeD_Txt_2");
    obj.edit85:setName("edit85");
    obj.edit85:setFontColor("#C0504D");
    obj.edit85:setFontSize(15);
    obj.edit85:setHorzTextAlign("leading");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setFontFamily("kalam");
    obj.edit85:setTransparent(true);

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(783);
    obj.layout94:setTop(713);
    obj.layout94:setWidth(72);
    obj.layout94:setHeight(30);
    obj.layout94:setName("layout94");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout94);
    obj.edit86:setTransparent(true);
    obj.edit86:setWidth(72);
    obj.edit86:setHeight(30);
    obj.edit86:setField("VeD_02");
    obj.edit86:setName("edit86");
    obj.edit86:setFontColor("#C0504D");
    obj.edit86:setFontSize(18);
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit86, "fontStyle",  "bold");
    obj.edit86:setFontFamily("kalam");
    obj.edit86:setType("number");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.rectangle1);
    obj.button61:setText("i");
    obj.button61:setWidth(20);
    obj.button61:setLeft(864);
    obj.button61:setTop(716);
    obj.button61:setHeight(20);
    obj.button61:setName("button61");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(576);
    obj.layout95:setTop(742);
    obj.layout95:setWidth(193);
    obj.layout95:setHeight(30);
    obj.layout95:setName("layout95");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout95);
    obj.edit87:setWidth(193);
    obj.edit87:setHeight(31);
    obj.edit87:setField("VeD_Txt_3");
    obj.edit87:setName("edit87");
    obj.edit87:setFontColor("#C0504D");
    obj.edit87:setFontSize(15);
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setFontFamily("kalam");
    obj.edit87:setTransparent(true);

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(784);
    obj.layout96:setTop(748);
    obj.layout96:setWidth(72);
    obj.layout96:setHeight(30);
    obj.layout96:setName("layout96");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout96);
    obj.edit88:setTransparent(true);
    obj.edit88:setWidth(72);
    obj.edit88:setHeight(30);
    obj.edit88:setField("VeD_03");
    obj.edit88:setName("edit88");
    obj.edit88:setFontColor("#C0504D");
    obj.edit88:setFontSize(18);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit88, "fontStyle",  "bold");
    obj.edit88:setFontFamily("kalam");
    obj.edit88:setType("number");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.rectangle1);
    obj.button62:setText("i");
    obj.button62:setWidth(20);
    obj.button62:setLeft(864);
    obj.button62:setTop(751);
    obj.button62:setHeight(20);
    obj.button62:setName("button62");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(576);
    obj.layout97:setTop(776);
    obj.layout97:setWidth(193);
    obj.layout97:setHeight(30);
    obj.layout97:setName("layout97");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout97);
    obj.edit89:setWidth(193);
    obj.edit89:setHeight(31);
    obj.edit89:setField("VeD_Txt_4");
    obj.edit89:setName("edit89");
    obj.edit89:setFontColor("#C0504D");
    obj.edit89:setFontSize(15);
    obj.edit89:setHorzTextAlign("leading");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setFontFamily("kalam");
    obj.edit89:setTransparent(true);

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(783);
    obj.layout98:setTop(782);
    obj.layout98:setWidth(72);
    obj.layout98:setHeight(30);
    obj.layout98:setName("layout98");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout98);
    obj.edit90:setTransparent(true);
    obj.edit90:setWidth(72);
    obj.edit90:setHeight(30);
    obj.edit90:setField("VeD_04");
    obj.edit90:setName("edit90");
    obj.edit90:setFontColor("#C0504D");
    obj.edit90:setFontSize(18);
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit90, "fontStyle",  "bold");
    obj.edit90:setFontFamily("kalam");
    obj.edit90:setType("number");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.rectangle1);
    obj.button63:setText("i");
    obj.button63:setWidth(20);
    obj.button63:setLeft(864);
    obj.button63:setTop(785);
    obj.button63:setHeight(20);
    obj.button63:setName("button63");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(576);
    obj.layout99:setTop(810);
    obj.layout99:setWidth(193);
    obj.layout99:setHeight(30);
    obj.layout99:setName("layout99");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout99);
    obj.edit91:setWidth(193);
    obj.edit91:setHeight(31);
    obj.edit91:setField("VeD_Txt_5");
    obj.edit91:setName("edit91");
    obj.edit91:setFontColor("#C0504D");
    obj.edit91:setFontSize(15);
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setFontFamily("kalam");
    obj.edit91:setTransparent(true);

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(783);
    obj.layout100:setTop(815);
    obj.layout100:setWidth(72);
    obj.layout100:setHeight(30);
    obj.layout100:setName("layout100");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout100);
    obj.edit92:setTransparent(true);
    obj.edit92:setWidth(72);
    obj.edit92:setHeight(30);
    obj.edit92:setField("VeD_05");
    obj.edit92:setName("edit92");
    obj.edit92:setFontColor("#C0504D");
    obj.edit92:setFontSize(18);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit92, "fontStyle",  "bold");
    obj.edit92:setFontFamily("kalam");
    obj.edit92:setType("number");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.rectangle1);
    obj.button64:setText("i");
    obj.button64:setWidth(20);
    obj.button64:setLeft(864);
    obj.button64:setTop(818);
    obj.button64:setHeight(20);
    obj.button64:setName("button64");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(576);
    obj.layout101:setTop(844);
    obj.layout101:setWidth(193);
    obj.layout101:setHeight(30);
    obj.layout101:setName("layout101");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout101);
    obj.edit93:setWidth(193);
    obj.edit93:setHeight(31);
    obj.edit93:setField("VeD_Txt_6");
    obj.edit93:setName("edit93");
    obj.edit93:setFontColor("#C0504D");
    obj.edit93:setFontSize(15);
    obj.edit93:setHorzTextAlign("leading");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setFontFamily("kalam");
    obj.edit93:setTransparent(true);

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(785);
    obj.layout102:setTop(849);
    obj.layout102:setWidth(72);
    obj.layout102:setHeight(30);
    obj.layout102:setName("layout102");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout102);
    obj.edit94:setTransparent(true);
    obj.edit94:setWidth(72);
    obj.edit94:setHeight(30);
    obj.edit94:setField("VeD_06");
    obj.edit94:setName("edit94");
    obj.edit94:setFontColor("#C0504D");
    obj.edit94:setFontSize(18);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit94, "fontStyle",  "bold");
    obj.edit94:setFontFamily("kalam");
    obj.edit94:setType("number");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.rectangle1);
    obj.button65:setText("i");
    obj.button65:setWidth(20);
    obj.button65:setLeft(864);
    obj.button65:setTop(852);
    obj.button65:setHeight(20);
    obj.button65:setName("button65");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(576);
    obj.layout103:setTop(879);
    obj.layout103:setWidth(193);
    obj.layout103:setHeight(30);
    obj.layout103:setName("layout103");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout103);
    obj.edit95:setWidth(193);
    obj.edit95:setHeight(31);
    obj.edit95:setField("VeD_Txt_7");
    obj.edit95:setName("edit95");
    obj.edit95:setFontColor("#C0504D");
    obj.edit95:setFontSize(15);
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setFontFamily("kalam");
    obj.edit95:setTransparent(true);

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(784);
    obj.layout104:setTop(884);
    obj.layout104:setWidth(72);
    obj.layout104:setHeight(30);
    obj.layout104:setName("layout104");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout104);
    obj.edit96:setTransparent(true);
    obj.edit96:setWidth(72);
    obj.edit96:setHeight(30);
    obj.edit96:setField("VeD_07");
    obj.edit96:setName("edit96");
    obj.edit96:setFontColor("#C0504D");
    obj.edit96:setFontSize(18);
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit96, "fontStyle",  "bold");
    obj.edit96:setFontFamily("kalam");
    obj.edit96:setType("number");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.rectangle1);
    obj.button66:setText("i");
    obj.button66:setWidth(20);
    obj.button66:setLeft(864);
    obj.button66:setTop(887);
    obj.button66:setHeight(20);
    obj.button66:setName("button66");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(578);
    obj.layout105:setTop(913);
    obj.layout105:setWidth(191);
    obj.layout105:setHeight(30);
    obj.layout105:setName("layout105");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout105);
    obj.edit97:setWidth(191);
    obj.edit97:setHeight(31);
    obj.edit97:setField("VeD_Txt_8");
    obj.edit97:setName("edit97");
    obj.edit97:setFontColor("#C0504D");
    obj.edit97:setFontSize(15);
    obj.edit97:setHorzTextAlign("leading");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setFontFamily("kalam");
    obj.edit97:setTransparent(true);

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(784);
    obj.layout106:setTop(917);
    obj.layout106:setWidth(72);
    obj.layout106:setHeight(30);
    obj.layout106:setName("layout106");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout106);
    obj.edit98:setTransparent(true);
    obj.edit98:setWidth(72);
    obj.edit98:setHeight(30);
    obj.edit98:setField("VeD_08");
    obj.edit98:setName("edit98");
    obj.edit98:setFontColor("#C0504D");
    obj.edit98:setFontSize(18);
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit98, "fontStyle",  "bold");
    obj.edit98:setFontFamily("kalam");
    obj.edit98:setType("number");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.rectangle1);
    obj.button67:setText("i");
    obj.button67:setWidth(20);
    obj.button67:setLeft(864);
    obj.button67:setTop(920);
    obj.button67:setHeight(20);
    obj.button67:setName("button67");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(575);
    obj.layout107:setTop(949);
    obj.layout107:setWidth(194);
    obj.layout107:setHeight(30);
    obj.layout107:setName("layout107");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout107);
    obj.edit99:setWidth(194);
    obj.edit99:setHeight(31);
    obj.edit99:setField("VeD_Txt_9");
    obj.edit99:setName("edit99");
    obj.edit99:setFontColor("#C0504D");
    obj.edit99:setFontSize(15);
    obj.edit99:setHorzTextAlign("leading");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setFontFamily("kalam");
    obj.edit99:setTransparent(true);

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(785);
    obj.layout108:setTop(951);
    obj.layout108:setWidth(72);
    obj.layout108:setHeight(30);
    obj.layout108:setName("layout108");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout108);
    obj.edit100:setTransparent(true);
    obj.edit100:setWidth(72);
    obj.edit100:setHeight(30);
    obj.edit100:setField("VeD_09");
    obj.edit100:setName("edit100");
    obj.edit100:setFontColor("#C0504D");
    obj.edit100:setFontSize(18);
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit100, "fontStyle",  "bold");
    obj.edit100:setFontFamily("kalam");
    obj.edit100:setType("number");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.rectangle1);
    obj.button68:setText("i");
    obj.button68:setWidth(20);
    obj.button68:setLeft(864);
    obj.button68:setTop(954);
    obj.button68:setHeight(20);
    obj.button68:setName("button68");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(739);
    obj.layout109:setTop(1082);
    obj.layout109:setWidth(112);
    obj.layout109:setHeight(50);
    obj.layout109:setName("layout109");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout109);
    obj.label9:setFontSize(30);
    obj.label9:setFontColor("#000000");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setVertTextAlign("center");
    obj.label9:setLeft(30);
    obj.label9:setTop(15);
    obj.label9:setWidth(112);
    obj.label9:setHeight(50);
    obj.label9:setField("XP_t");
    obj.label9:setName("label9");
    obj.label9:setTextTrimming("none");
    obj.label9:setWordWrap(false);
    obj.label9:setAutoSize(true);
    obj.label9:setFontFamily("kalam");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(592);
    obj.layout110:setTop(1084);
    obj.layout110:setWidth(114);
    obj.layout110:setHeight(61);
    obj.layout110:setName("layout110");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout110);
    obj.label10:setFontSize(30);
    obj.label10:setFontColor("#000000");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("center");
    obj.label10:setLeft(30);
    obj.label10:setTop(15);
    obj.label10:setWidth(114);
    obj.label10:setHeight(62);
    obj.label10:setField("Exp_nUtil");
    obj.label10:setName("label10");
    obj.label10:setTextTrimming("none");
    obj.label10:setWordWrap(false);
    obj.label10:setAutoSize(true);
    obj.label10:setFontFamily("kalam");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle1);
    obj.dataLink6:setFields({'XP_t', 'XP_t_gasta'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle1);
    obj.dataLink7:setFields({'Satts', 'Sper', 'Scir', 'Svan', 'Saude_Extra', 'XP_Gasto_Adicional', 'ExpMoralidadeG' });
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle1);
    obj.dataLink8:setFields({'Saude_Extra'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle1);
    obj.dataLink9:setFields({'XPInicial', 'XPS1', 'XPS2', 'XPS3', 'XPS4', 'XPS5', 'XPS6', 'XPS7', 'XPS8', 'XPS9', 'XPS10', 'ExpExtraGanha'});
    obj.dataLink9:setName("dataLink9");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.rectangle1);
    obj.button69:setText("i");
    obj.button69:setWidth(20);
    obj.button69:setLeft(762);
    obj.button69:setTop(1035);
    obj.button69:setHeight(20);
    obj.button69:setName("button69");

    obj.PopExp = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopExp:setParent(obj.rectangle1);
    obj.PopExp:setName("PopExp");
    obj.PopExp:setWidth(360);
    obj.PopExp:setHeight(600);
    obj.PopExp:setBackOpacity(0.5);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.PopExp);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.scrollBox2);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(20);
    obj.layout111:setName("layout111");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout111);
    obj.label11:setText("Exp Atributo:");
    obj.label11:setAlign("left");
    obj.label11:setWidth(50);
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setName("label11");
    obj.label11:setFontColor("black");
    obj.label11:setTextTrimming("none");
    obj.label11:setWordWrap(false);
    obj.label11:setAutoSize(true);
    obj.label11:setFontFamily("kalam");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout111);
    obj.label12:setField("Satts");
    obj.label12:setAlign("right");
    obj.label12:setHorzTextAlign("trailing");
    obj.label12:setWidth(50);
    obj.label12:setFontColor("#000000");
    obj.label12:setName("label12");
    obj.label12:setTextTrimming("none");
    obj.label12:setWordWrap(false);
    obj.label12:setAutoSize(true);
    obj.label12:setFontFamily("kalam");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.scrollBox2);
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(20);
    obj.layout112:setName("layout112");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout112);
    obj.label13:setText("Exp Pericia:");
    obj.label13:setAlign("left");
    obj.label13:setWidth(50);
    obj.label13:setHorzTextAlign("trailing");
    obj.label13:setFontColor("#696969");
    obj.label13:setName("label13");
    obj.label13:setTextTrimming("none");
    obj.label13:setWordWrap(false);
    obj.label13:setAutoSize(true);
    obj.label13:setFontFamily("kalam");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout112);
    obj.label14:setField("Sper");
    obj.label14:setAlign("right");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setWidth(50);
    obj.label14:setFontColor("#696969");
    obj.label14:setName("label14");
    obj.label14:setTextTrimming("none");
    obj.label14:setWordWrap(false);
    obj.label14:setAutoSize(true);
    obj.label14:setFontFamily("kalam");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.scrollBox2);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(20);
    obj.layout113:setName("layout113");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout113);
    obj.label15:setText("Exp Circunstancia:");
    obj.label15:setAlign("left");
    obj.label15:setWidth(50);
    obj.label15:setHorzTextAlign("trailing");
    obj.label15:setName("label15");
    obj.label15:setFontColor("black");
    obj.label15:setTextTrimming("none");
    obj.label15:setWordWrap(false);
    obj.label15:setAutoSize(true);
    obj.label15:setFontFamily("kalam");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout113);
    obj.label16:setField("Scir");
    obj.label16:setAlign("right");
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setWidth(50);
    obj.label16:setFontColor("#000000");
    obj.label16:setName("label16");
    obj.label16:setTextTrimming("none");
    obj.label16:setWordWrap(false);
    obj.label16:setAutoSize(true);
    obj.label16:setFontFamily("kalam");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.scrollBox2);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(20);
    obj.layout114:setName("layout114");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout114);
    obj.label17:setText("Exp Van e Des:");
    obj.label17:setAlign("left");
    obj.label17:setWidth(50);
    obj.label17:setHorzTextAlign("trailing");
    obj.label17:setFontColor("#696969");
    obj.label17:setName("label17");
    obj.label17:setTextTrimming("none");
    obj.label17:setWordWrap(false);
    obj.label17:setAutoSize(true);
    obj.label17:setFontFamily("kalam");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout114);
    obj.label18:setField("Svan");
    obj.label18:setAlign("right");
    obj.label18:setHorzTextAlign("trailing");
    obj.label18:setWidth(50);
    obj.label18:setFontColor("#696969");
    obj.label18:setName("label18");
    obj.label18:setTextTrimming("none");
    obj.label18:setWordWrap(false);
    obj.label18:setAutoSize(true);
    obj.label18:setFontFamily("kalam");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox2);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(20);
    obj.layout115:setName("layout115");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout115);
    obj.label19:setText("Exp Saúde Extra:");
    obj.label19:setAlign("left");
    obj.label19:setWidth(50);
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setName("label19");
    obj.label19:setFontColor("black");
    obj.label19:setTextTrimming("none");
    obj.label19:setWordWrap(false);
    obj.label19:setAutoSize(true);
    obj.label19:setFontFamily("kalam");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout115);
    obj.label20:setField("ExpSaudeExtra");
    obj.label20:setAlign("right");
    obj.label20:setHorzTextAlign("trailing");
    obj.label20:setWidth(50);
    obj.label20:setFontColor("#000000");
    obj.label20:setName("label20");
    obj.label20:setTextTrimming("none");
    obj.label20:setWordWrap(false);
    obj.label20:setAutoSize(true);
    obj.label20:setFontFamily("kalam");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox2);
    obj.layout116:setAlign("top");
    obj.layout116:setHeight(20);
    obj.layout116:setName("layout116");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout116);
    obj.label21:setText("Exp Moralidade:");
    obj.label21:setAlign("left");
    obj.label21:setWidth(50);
    obj.label21:setHorzTextAlign("trailing");
    obj.label21:setFontColor("#696969");
    obj.label21:setName("label21");
    obj.label21:setTextTrimming("none");
    obj.label21:setWordWrap(false);
    obj.label21:setAutoSize(true);
    obj.label21:setFontFamily("kalam");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout116);
    obj.edit101:setField("ExpMoralidadeG");
    obj.edit101:setAlign("right");
    obj.edit101:setHorzTextAlign("trailing");
    obj.edit101:setWidth(300);
    obj.edit101:setTransparent(true);
    obj.edit101:setFontColor("#696969");
    obj.edit101:setName("edit101");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox2);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(20);
    obj.layout117:setName("layout117");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout117);
    obj.label22:setText("Exp Extra:");
    obj.label22:setAlign("left");
    obj.label22:setWidth(50);
    obj.label22:setHorzTextAlign("trailing");
    obj.label22:setFontColor("#696969");
    obj.label22:setName("label22");
    obj.label22:setTextTrimming("none");
    obj.label22:setWordWrap(false);
    obj.label22:setAutoSize(true);
    obj.label22:setFontFamily("kalam");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout117);
    obj.edit102:setField("ExpExtraGanha");
    obj.edit102:setAlign("right");
    obj.edit102:setHorzTextAlign("trailing");
    obj.edit102:setWidth(300);
    obj.edit102:setTransparent(true);
    obj.edit102:setFontColor("#696969");
    obj.edit102:setName("edit102");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox2);
    obj.layout118:setAlign("top");
    obj.layout118:setHeight(20);
    obj.layout118:setName("layout118");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout118);
    obj.label23:setText("...Exp Gasta");
    obj.label23:setAlign("right");
    obj.label23:setWidth(50);
    obj.label23:setHorzTextAlign("trailing");
    obj.label23:setFontColor("#C0504D");
    obj.label23:setName("label23");
    obj.label23:setTextTrimming("none");
    obj.label23:setWordWrap(false);
    obj.label23:setAutoSize(true);
    obj.label23:setFontFamily("kalam");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout118);
    obj.edit103:setField("XP_t_gasta");
    obj.edit103:setAlign("right");
    obj.edit103:setHorzTextAlign("trailing");
    obj.edit103:setWidth(50);
    obj.edit103:setTransparent(true);
    obj.edit103:setFontColor("#C0504D");
    obj.edit103:setName("edit103");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox2);
    obj.layout119:setAlign("top");
    obj.layout119:setHeight(20);
    obj.layout119:setName("layout119");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout119);
    obj.label24:setText("Exp Inicial:");
    obj.label24:setAlign("left");
    obj.label24:setWidth(50);
    obj.label24:setHorzTextAlign("trailing");
    obj.label24:setFontColor("#000000");
    obj.label24:setName("label24");
    obj.label24:setTextTrimming("none");
    obj.label24:setWordWrap(false);
    obj.label24:setAutoSize(true);
    obj.label24:setFontFamily("kalam");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout119);
    obj.edit104:setField("XPInicial");
    obj.edit104:setAlign("right");
    obj.edit104:setHorzTextAlign("trailing");
    obj.edit104:setWidth(300);
    obj.edit104:setTransparent(true);
    obj.edit104:setFontColor("#000000");
    obj.edit104:setName("edit104");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox2);
    obj.layout120:setAlign("top");
    obj.layout120:setHeight(20);
    obj.layout120:setName("layout120");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout120);
    obj.label25:setText("Exp 1° Sessão:");
    obj.label25:setAlign("left");
    obj.label25:setWidth(50);
    obj.label25:setHorzTextAlign("trailing");
    obj.label25:setFontColor("#696969");
    obj.label25:setName("label25");
    obj.label25:setTextTrimming("none");
    obj.label25:setWordWrap(false);
    obj.label25:setAutoSize(true);
    obj.label25:setFontFamily("kalam");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout120);
    obj.edit105:setField("XPS1");
    obj.edit105:setAlign("right");
    obj.edit105:setHorzTextAlign("trailing");
    obj.edit105:setWidth(300);
    obj.edit105:setTransparent(true);
    obj.edit105:setFontColor("#696969");
    obj.edit105:setName("edit105");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox2);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(20);
    obj.layout121:setName("layout121");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout121);
    obj.label26:setText("Exp 2° Sessão:");
    obj.label26:setAlign("left");
    obj.label26:setWidth(50);
    obj.label26:setHorzTextAlign("trailing");
    obj.label26:setFontColor("#000000");
    obj.label26:setName("label26");
    obj.label26:setTextTrimming("none");
    obj.label26:setWordWrap(false);
    obj.label26:setAutoSize(true);
    obj.label26:setFontFamily("kalam");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout121);
    obj.edit106:setField("XPS2");
    obj.edit106:setAlign("right");
    obj.edit106:setHorzTextAlign("trailing");
    obj.edit106:setWidth(300);
    obj.edit106:setTransparent(true);
    obj.edit106:setFontColor("#000000");
    obj.edit106:setName("edit106");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox2);
    obj.layout122:setAlign("top");
    obj.layout122:setHeight(20);
    obj.layout122:setName("layout122");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout122);
    obj.label27:setText("Exp 3° Sessão:");
    obj.label27:setAlign("left");
    obj.label27:setWidth(50);
    obj.label27:setHorzTextAlign("trailing");
    obj.label27:setFontColor("#696969");
    obj.label27:setName("label27");
    obj.label27:setTextTrimming("none");
    obj.label27:setWordWrap(false);
    obj.label27:setAutoSize(true);
    obj.label27:setFontFamily("kalam");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout122);
    obj.edit107:setField("XPS3");
    obj.edit107:setAlign("right");
    obj.edit107:setHorzTextAlign("trailing");
    obj.edit107:setWidth(300);
    obj.edit107:setTransparent(true);
    obj.edit107:setFontColor("#696969");
    obj.edit107:setName("edit107");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox2);
    obj.layout123:setAlign("top");
    obj.layout123:setHeight(20);
    obj.layout123:setName("layout123");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout123);
    obj.label28:setText("Exp 4° Sessão:");
    obj.label28:setAlign("left");
    obj.label28:setWidth(50);
    obj.label28:setHorzTextAlign("trailing");
    obj.label28:setFontColor("#000000");
    obj.label28:setName("label28");
    obj.label28:setTextTrimming("none");
    obj.label28:setWordWrap(false);
    obj.label28:setAutoSize(true);
    obj.label28:setFontFamily("kalam");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout123);
    obj.edit108:setField("XPS4");
    obj.edit108:setAlign("right");
    obj.edit108:setHorzTextAlign("trailing");
    obj.edit108:setWidth(300);
    obj.edit108:setTransparent(true);
    obj.edit108:setFontColor("#000000");
    obj.edit108:setName("edit108");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox2);
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(20);
    obj.layout124:setName("layout124");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout124);
    obj.label29:setText("Exp 5° Sessão:");
    obj.label29:setAlign("left");
    obj.label29:setWidth(50);
    obj.label29:setHorzTextAlign("trailing");
    obj.label29:setFontColor("#696969");
    obj.label29:setName("label29");
    obj.label29:setTextTrimming("none");
    obj.label29:setWordWrap(false);
    obj.label29:setAutoSize(true);
    obj.label29:setFontFamily("kalam");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout124);
    obj.edit109:setField("XPS5");
    obj.edit109:setAlign("right");
    obj.edit109:setHorzTextAlign("trailing");
    obj.edit109:setWidth(300);
    obj.edit109:setTransparent(true);
    obj.edit109:setFontColor("#696969");
    obj.edit109:setName("edit109");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox2);
    obj.layout125:setAlign("top");
    obj.layout125:setHeight(20);
    obj.layout125:setName("layout125");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout125);
    obj.label30:setText("Exp 6° Sessão:");
    obj.label30:setAlign("left");
    obj.label30:setWidth(50);
    obj.label30:setHorzTextAlign("trailing");
    obj.label30:setFontColor("#000000");
    obj.label30:setName("label30");
    obj.label30:setTextTrimming("none");
    obj.label30:setWordWrap(false);
    obj.label30:setAutoSize(true);
    obj.label30:setFontFamily("kalam");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout125);
    obj.edit110:setField("XPS6");
    obj.edit110:setAlign("right");
    obj.edit110:setHorzTextAlign("trailing");
    obj.edit110:setWidth(300);
    obj.edit110:setTransparent(true);
    obj.edit110:setFontColor("#000000");
    obj.edit110:setName("edit110");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox2);
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(20);
    obj.layout126:setName("layout126");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout126);
    obj.label31:setText("Exp 7° Sessão:");
    obj.label31:setAlign("left");
    obj.label31:setWidth(50);
    obj.label31:setHorzTextAlign("trailing");
    obj.label31:setFontColor("#696969");
    obj.label31:setName("label31");
    obj.label31:setTextTrimming("none");
    obj.label31:setWordWrap(false);
    obj.label31:setAutoSize(true);
    obj.label31:setFontFamily("kalam");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout126);
    obj.edit111:setField("XPS7");
    obj.edit111:setAlign("right");
    obj.edit111:setHorzTextAlign("trailing");
    obj.edit111:setWidth(300);
    obj.edit111:setTransparent(true);
    obj.edit111:setFontColor("#696969");
    obj.edit111:setName("edit111");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox2);
    obj.layout127:setAlign("top");
    obj.layout127:setHeight(20);
    obj.layout127:setName("layout127");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout127);
    obj.label32:setText("Exp 8° Sessão:");
    obj.label32:setAlign("left");
    obj.label32:setWidth(50);
    obj.label32:setHorzTextAlign("trailing");
    obj.label32:setFontColor("#000000");
    obj.label32:setName("label32");
    obj.label32:setTextTrimming("none");
    obj.label32:setWordWrap(false);
    obj.label32:setAutoSize(true);
    obj.label32:setFontFamily("kalam");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout127);
    obj.edit112:setField("XPS8");
    obj.edit112:setAlign("right");
    obj.edit112:setHorzTextAlign("trailing");
    obj.edit112:setWidth(300);
    obj.edit112:setTransparent(true);
    obj.edit112:setFontColor("#000000");
    obj.edit112:setName("edit112");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox2);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(20);
    obj.layout128:setName("layout128");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout128);
    obj.label33:setText("Exp 9° Sessão:");
    obj.label33:setAlign("left");
    obj.label33:setWidth(50);
    obj.label33:setHorzTextAlign("trailing");
    obj.label33:setFontColor("#696969");
    obj.label33:setName("label33");
    obj.label33:setTextTrimming("none");
    obj.label33:setWordWrap(false);
    obj.label33:setAutoSize(true);
    obj.label33:setFontFamily("kalam");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout128);
    obj.edit113:setField("XPS9");
    obj.edit113:setAlign("right");
    obj.edit113:setHorzTextAlign("trailing");
    obj.edit113:setWidth(300);
    obj.edit113:setTransparent(true);
    obj.edit113:setFontColor("#696969");
    obj.edit113:setName("edit113");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.scrollBox2);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(20);
    obj.layout129:setName("layout129");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout129);
    obj.label34:setText("Exp 10° Sessão:");
    obj.label34:setAlign("left");
    obj.label34:setWidth(50);
    obj.label34:setHorzTextAlign("trailing");
    obj.label34:setFontColor("#000000");
    obj.label34:setName("label34");
    obj.label34:setTextTrimming("none");
    obj.label34:setWordWrap(false);
    obj.label34:setAutoSize(true);
    obj.label34:setFontFamily("kalam");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout129);
    obj.edit114:setField("XPS10");
    obj.edit114:setAlign("right");
    obj.edit114:setHorzTextAlign("trailing");
    obj.edit114:setWidth(300);
    obj.edit114:setTransparent(true);
    obj.edit114:setFontColor("#000000");
    obj.edit114:setName("edit114");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.scrollBox2);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(20);
    obj.layout130:setName("layout130");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout130);
    obj.label35:setText("...Exp Adquirida");
    obj.label35:setAlign("right");
    obj.label35:setWidth(50);
    obj.label35:setHorzTextAlign("trailing");
    obj.label35:setFontColor("#C0504D");
    obj.label35:setName("label35");
    obj.label35:setTextTrimming("none");
    obj.label35:setWordWrap(false);
    obj.label35:setAutoSize(true);
    obj.label35:setFontFamily("kalam");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout130);
    obj.edit115:setField("XP_t");
    obj.edit115:setAlign("right");
    obj.edit115:setHorzTextAlign("trailing");
    obj.edit115:setWidth(50);
    obj.edit115:setTransparent(true);
    obj.edit115:setFontColor("#C0504D");
    obj.edit115:setName("edit115");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle1);
    obj.dataLink10:setFields({'Peri01', 'Peri02', 'Peri03', 'Peri04', 'Peri05', 'Peri06', 'Peri07', 'Peri08', 'Peri09', 'Peri10', 'Peri11', 'Peri12', 'Peri13', 'Peri14', 'Peri15', 'Peri16', 'Peri17', 'Peri18', 'Peri19', 'Peri20', 'Peri21', 'Peri22', 'Peri23', 'Peri24', 'Peri25', 'Peri26', 'Peri27', 'Peri28', 'Peri29'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle1);
    obj.dataLink11:setFields({'CircXP_1', 'CircXP_2', 'CircXP_3', 'CircXP_4', 'CircXP_5', 'CircXP_6', 'CircXP_7 ', 'CircXP_8', 'CircXP_9', 'CircXP_10'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle1);
    obj.dataLink12:setFields({'VeD_01', 'VeD_02', 'VeD_03', 'VeD_04', 'VeD_05', 'VeD_06', 'VeD_07', 'VeD_08', 'VeD_09'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle1);
    obj.dataLink13:setFields({'FOR', 'DES', 'PRE', 'TAT', 'PER', 'INT', 'DET', 'SOR'});
    obj.dataLink13:setName("dataLink13");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setTop(200);
    obj.layout131:setLeft(920);
    obj.layout131:setWidth(250);
    obj.layout131:setHeight(700);
    obj.layout131:setName("layout131");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout131);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.scrollBox3);
    obj.button70:setHeight(25);
    obj.button70:setFontFamily("kalam");
    obj.button70:setText("+");
    obj.button70:setTop(5);
    obj.button70:setWidth(25);
    obj.button70:setLeft(35);
    obj.button70:setHint("Adiciona um novo ataque.");
    obj.button70:setName("button70");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.scrollBox3);
    obj.label36:setFontSize(25);
    obj.label36:setFontColor("#000000");
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setVertTextAlign("trailing");
    obj.label36:setLeft(60);
    obj.label36:setTop(0);
    obj.label36:setWidth(170);
    obj.label36:setHeight(30);
    obj.label36:setText("ATAQUES");
    obj.label36:setFontFamily("DK Umbilical Noose");
    obj.label36:setName("label36");
    obj.label36:setTextTrimming("none");
    obj.label36:setWordWrap(false);
    obj.label36:setAutoSize(true);

    obj.rclAtaque = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaque:setParent(obj.scrollBox3);
    obj.rclAtaque:setName("rclAtaque");
    obj.rclAtaque:setField("Ataque");
    obj.rclAtaque:setTemplateForm("Ataque");
    obj.rclAtaque:setTop(50);
    obj.rclAtaque:setWidth(230);
    obj.rclAtaque:setHeight(600);
    obj.rclAtaque:setAutoHeight(true);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(300);
    obj.rectangle2:setTop(950);
    obj.rectangle2:setLeft(950);
    obj.rectangle2:setColor("#00000000");
    obj.rectangle2:setName("rectangle2");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle2);
    obj.label37:setFontSize(25);
    obj.label37:setFontColor("#000000");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("center");
    obj.label37:setWidth(200);
    obj.label37:setHeight(30);
    obj.label37:setLeft(30);
    obj.label37:setText("ARMADURA");
    obj.label37:setFontFamily("DK Umbilical Noose");
    obj.label37:setName("label37");
    obj.label37:setTextTrimming("none");
    obj.label37:setWordWrap(false);
    obj.label37:setAutoSize(true);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setTop(32);
    obj.rectangle3:setLeft(1);
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setHeight(30);
    lfm_setPropAsString(obj.rectangle3, "sides",  "bottom");
    obj.rectangle3:setColor("#00000000");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.rectangle2);
    obj.edit116:setWidth(200);
    obj.edit116:setField("ARMADURA_nick");
    obj.edit116:setHeight(40);
    obj.edit116:setTop(32);
    obj.edit116:setLeft(1);
    obj.edit116:setName("edit116");
    obj.edit116:setFontColor("#C0504D");
    obj.edit116:setFontSize(20);
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit116, "fontStyle",  "bold");
    obj.edit116:setFontFamily("kalam");
    obj.edit116:setTransparent(true);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle2);
    obj.label38:setText("Torso");
    obj.label38:setWidth(50);
    obj.label38:setHeight(30);
    obj.label38:setTop(80);
    obj.label38:setLeft(1);
    obj.label38:setName("label38");
    obj.label38:setFontColor("#000000");
    obj.label38:setFontSize(15);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setVertTextAlign("center");
    obj.label38:setFontFamily("kalam");
    obj.label38:setTextTrimming("none");
    obj.label38:setWordWrap(false);
    obj.label38:setAutoSize(true);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle2);
    obj.rectangle4:setTop(80);
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setLeft(60);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setColor("#00000000");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setXradius(8);
    obj.rectangle4:setYradius(8);

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.rectangle4);
    obj.edit117:setField("ARMADURA_TorsoA");
    obj.edit117:setWidth(45);
    obj.edit117:setHeight(30);
    obj.edit117:setName("edit117");
    obj.edit117:setFontColor("#C0504D");
    obj.edit117:setFontSize(18);
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit117, "fontStyle",  "bold");
    obj.edit117:setFontFamily("kalam");
    obj.edit117:setTransparent(true);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle4);
    obj.label39:setText("/");
    obj.label39:setWidth(10);
    obj.label39:setHeight(30);
    obj.label39:setTop(3);
    obj.label39:setLeft(46);
    obj.label39:setName("label39");
    obj.label39:setFontColor("#000000");
    obj.label39:setFontSize(15);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("center");
    obj.label39:setFontFamily("kalam");
    obj.label39:setTextTrimming("none");
    obj.label39:setWordWrap(false);
    obj.label39:setAutoSize(true);

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle4);
    obj.edit118:setField("ARMADURA_TorsoB");
    obj.edit118:setWidth(45);
    obj.edit118:setHeight(30);
    obj.edit118:setLeft(46);
    obj.edit118:setName("edit118");
    obj.edit118:setFontColor("#C0504D");
    obj.edit118:setFontSize(18);
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit118, "fontStyle",  "bold");
    obj.edit118:setFontFamily("kalam");
    obj.edit118:setTransparent(true);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle2);
    obj.label40:setText("CD");
    obj.label40:setWidth(50);
    obj.label40:setHeight(30);
    obj.label40:setTop(65);
    obj.label40:setLeft(165);
    obj.label40:setFontSize(10);
    obj.label40:setName("label40");
    obj.label40:setFontColor("#000000");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("center");
    obj.label40:setFontFamily("kalam");
    obj.label40:setTextTrimming("none");
    obj.label40:setWordWrap(false);
    obj.label40:setAutoSize(true);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle2);
    obj.rectangle5:setTop(80);
    obj.rectangle5:setLeft(150);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setColor("#00000000");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setXradius(8);
    obj.rectangle5:setYradius(8);

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle5);
    obj.edit119:setField("ARMADURA_TorsoCD");
    obj.edit119:setWidth(40);
    obj.edit119:setHeight(30);
    obj.edit119:setName("edit119");
    obj.edit119:setFontColor("#C0504D");
    obj.edit119:setFontSize(18);
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit119, "fontStyle",  "bold");
    obj.edit119:setFontFamily("kalam");
    obj.edit119:setType("number");
    obj.edit119:setTransparent(true);

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.rectangle2);
    obj.button71:setLeft(190);
    obj.button71:setTop(85);
    obj.button71:setWidth(14);
    obj.button71:setHeight(14);
    obj.button71:setText("R");
    obj.button71:setHint("Desc... ");
    obj.button71:setName("button71");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.rectangle2);
    obj.image51:setWidth(17);
    obj.image51:setHeight(17);
    obj.image51:setLeft(189);
    obj.image51:setTop(85);
    obj.image51:setStyle("proportional");
    obj.image51:setCenter(true);
    obj.image51:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image51:setName("image51");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle2);
    obj.label41:setText("Cabeça");
    obj.label41:setWidth(50);
    obj.label41:setHeight(30);
    obj.label41:setTop(120);
    obj.label41:setLeft(1);
    obj.label41:setName("label41");
    obj.label41:setFontColor("#000000");
    obj.label41:setFontSize(15);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");
    obj.label41:setFontFamily("kalam");
    obj.label41:setTextTrimming("none");
    obj.label41:setWordWrap(false);
    obj.label41:setAutoSize(true);

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle2);
    obj.rectangle6:setTop(120);
    obj.rectangle6:setLeft(60);
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setColor("#00000000");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setXradius(8);
    obj.rectangle6:setYradius(8);

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle6);
    obj.edit120:setField("ARMADURA_CabecaA");
    obj.edit120:setWidth(45);
    obj.edit120:setHeight(30);
    obj.edit120:setName("edit120");
    obj.edit120:setFontColor("#C0504D");
    obj.edit120:setFontSize(18);
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit120, "fontStyle",  "bold");
    obj.edit120:setFontFamily("kalam");
    obj.edit120:setTransparent(true);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle6);
    obj.label42:setText("/");
    obj.label42:setWidth(10);
    obj.label42:setHeight(30);
    obj.label42:setTop(3);
    obj.label42:setLeft(46);
    obj.label42:setName("label42");
    obj.label42:setFontColor("#000000");
    obj.label42:setFontSize(15);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");
    obj.label42:setFontFamily("kalam");
    obj.label42:setTextTrimming("none");
    obj.label42:setWordWrap(false);
    obj.label42:setAutoSize(true);

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle6);
    obj.edit121:setField("ARMADURA_CabecaB");
    obj.edit121:setWidth(45);
    obj.edit121:setLeft(46);
    obj.edit121:setHeight(30);
    obj.edit121:setName("edit121");
    obj.edit121:setFontColor("#C0504D");
    obj.edit121:setFontSize(18);
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit121, "fontStyle",  "bold");
    obj.edit121:setFontFamily("kalam");
    obj.edit121:setTransparent(true);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle2);
    obj.label43:setText("CD");
    obj.label43:setWidth(50);
    obj.label43:setHeight(30);
    obj.label43:setTop(108);
    obj.label43:setFontSize(10);
    obj.label43:setLeft(165);
    obj.label43:setName("label43");
    obj.label43:setFontColor("#000000");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setVertTextAlign("center");
    obj.label43:setFontFamily("kalam");
    obj.label43:setTextTrimming("none");
    obj.label43:setWordWrap(false);
    obj.label43:setAutoSize(true);

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle2);
    obj.rectangle7:setTop(120);
    obj.rectangle7:setLeft(150);
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setColor("#00000000");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setXradius(8);
    obj.rectangle7:setYradius(8);

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle7);
    obj.edit122:setField("ARMADURA_CabecaCD");
    obj.edit122:setWidth(40);
    obj.edit122:setHeight(30);
    obj.edit122:setName("edit122");
    obj.edit122:setFontColor("#C0504D");
    obj.edit122:setFontSize(18);
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit122, "fontStyle",  "bold");
    obj.edit122:setFontFamily("kalam");
    obj.edit122:setType("number");
    obj.edit122:setTransparent(true);

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.rectangle2);
    obj.button72:setLeft(190);
    obj.button72:setTop(125);
    obj.button72:setWidth(14);
    obj.button72:setHeight(14);
    obj.button72:setText("R");
    obj.button72:setHint("Desc... ");
    obj.button72:setName("button72");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.rectangle2);
    obj.image52:setWidth(17);
    obj.image52:setHeight(17);
    obj.image52:setLeft(189);
    obj.image52:setTop(125);
    obj.image52:setStyle("proportional");
    obj.image52:setCenter(true);
    obj.image52:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image52:setName("image52");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle2);
    obj.edit123:setText("Outro");
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(30);
    obj.edit123:setTop(160);
    obj.edit123:setLeft(1);
    obj.edit123:setTransparent(true);
    obj.edit123:setName("edit123");
    obj.edit123:setFontColor("#000000");
    obj.edit123:setFontSize(15);
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setFontFamily("kalam");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle2);
    obj.rectangle8:setTop(160);
    obj.rectangle8:setLeft(60);
    obj.rectangle8:setWidth(100);
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setColor("#00000000");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setXradius(8);
    obj.rectangle8:setYradius(8);

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle8);
    obj.edit124:setField("ARMADURA_OutroA");
    obj.edit124:setWidth(45);
    obj.edit124:setHeight(30);
    obj.edit124:setName("edit124");
    obj.edit124:setFontColor("#C0504D");
    obj.edit124:setFontSize(18);
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit124, "fontStyle",  "bold");
    obj.edit124:setFontFamily("kalam");
    obj.edit124:setTransparent(true);

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle8);
    obj.label44:setText("/");
    obj.label44:setWidth(10);
    obj.label44:setHeight(30);
    obj.label44:setTop(3);
    obj.label44:setLeft(46);
    obj.label44:setName("label44");
    obj.label44:setFontColor("#000000");
    obj.label44:setFontSize(15);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("center");
    obj.label44:setFontFamily("kalam");
    obj.label44:setTextTrimming("none");
    obj.label44:setWordWrap(false);
    obj.label44:setAutoSize(true);

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle8);
    obj.edit125:setField("ARMADURA_OutroB");
    obj.edit125:setWidth(45);
    obj.edit125:setLeft(46);
    obj.edit125:setHeight(30);
    obj.edit125:setName("edit125");
    obj.edit125:setFontColor("#C0504D");
    obj.edit125:setFontSize(18);
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit125, "fontStyle",  "bold");
    obj.edit125:setFontFamily("kalam");
    obj.edit125:setTransparent(true);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle2);
    obj.label45:setText("CD");
    obj.label45:setWidth(50);
    obj.label45:setHeight(30);
    obj.label45:setTop(148);
    obj.label45:setLeft(165);
    obj.label45:setFontSize(10);
    obj.label45:setName("label45");
    obj.label45:setFontColor("#000000");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");
    obj.label45:setFontFamily("kalam");
    obj.label45:setTextTrimming("none");
    obj.label45:setWordWrap(false);
    obj.label45:setAutoSize(true);

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle2);
    obj.rectangle9:setTop(160);
    obj.rectangle9:setLeft(150);
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setColor("#00000000");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setXradius(8);
    obj.rectangle9:setYradius(8);

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle9);
    obj.edit126:setField("ARMADURA_OutroCD");
    obj.edit126:setWidth(40);
    obj.edit126:setHeight(30);
    obj.edit126:setName("edit126");
    obj.edit126:setFontColor("#C0504D");
    obj.edit126:setFontSize(18);
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit126, "fontStyle",  "bold");
    obj.edit126:setFontFamily("kalam");
    obj.edit126:setType("number");
    obj.edit126:setTransparent(true);

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.rectangle2);
    obj.button73:setLeft(190);
    obj.button73:setTop(165);
    obj.button73:setWidth(14);
    obj.button73:setHeight(14);
    obj.button73:setText("R");
    obj.button73:setHint("Desc... ");
    obj.button73:setName("button73");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.rectangle2);
    obj.image53:setWidth(17);
    obj.image53:setHeight(17);
    obj.image53:setLeft(189);
    obj.image53:setTop(165);
    obj.image53:setStyle("proportional");
    obj.image53:setCenter(true);
    obj.image53:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image53:setName("image53");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle2);
    obj.label46:setText("Movimento");
    obj.label46:setWidth(50);
    obj.label46:setHeight(30);
    obj.label46:setTop(200);
    obj.label46:setLeft(5);
    obj.label46:setFontSize(15);
    obj.label46:setName("label46");
    obj.label46:setFontColor("#000000");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");
    obj.label46:setFontFamily("kalam");
    obj.label46:setTextTrimming("none");
    obj.label46:setWordWrap(false);
    obj.label46:setAutoSize(true);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle2);
    obj.rectangle10:setTop(200);
    obj.rectangle10:setLeft(80);
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setColor("#00000000");
    obj.rectangle10:setStrokeColor("red");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setXradius(8);
    obj.rectangle10:setYradius(8);

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle10);
    obj.edit127:setField("PenalidadeMovimento");
    obj.edit127:setWidth(40);
    obj.edit127:setHeight(30);
    obj.edit127:setName("edit127");
    obj.edit127:setFontColor("#C0504D");
    obj.edit127:setFontSize(18);
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit127, "fontStyle",  "bold");
    obj.edit127:setFontFamily("kalam");
    obj.edit127:setType("number");
    obj.edit127:setTransparent(true);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle2);
    obj.label47:setText("Percepção");
    obj.label47:setWidth(50);
    obj.label47:setHeight(30);
    obj.label47:setTop(200);
    obj.label47:setLeft(130);
    obj.label47:setFontSize(15);
    obj.label47:setName("label47");
    obj.label47:setFontColor("#000000");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setFontFamily("kalam");
    obj.label47:setTextTrimming("none");
    obj.label47:setWordWrap(false);
    obj.label47:setAutoSize(true);

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle2);
    obj.rectangle11:setTop(200);
    obj.rectangle11:setLeft(200);
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setColor("#00000000");
    obj.rectangle11:setStrokeColor("red");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setXradius(8);
    obj.rectangle11:setYradius(8);

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.rectangle11);
    obj.edit128:setField("PenalidadedePercepcao");
    obj.edit128:setWidth(40);
    obj.edit128:setHeight(30);
    obj.edit128:setName("edit128");
    obj.edit128:setFontColor("#C0504D");
    obj.edit128:setFontSize(18);
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit128, "fontStyle",  "bold");
    obj.edit128:setFontFamily("kalam");
    obj.edit128:setType("number");
    obj.edit128:setTransparent(true);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle1);
    obj.label48:setText("Mochila");
    obj.label48:setWidth(50);
    obj.label48:setHeight(30);
    obj.label48:setTop(180);
    obj.label48:setLeft(1225);
    obj.label48:setFontSize(15);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#000000");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setVertTextAlign("center");
    obj.label48:setFontFamily("kalam");
    obj.label48:setTextTrimming("none");
    obj.label48:setWordWrap(false);
    obj.label48:setAutoSize(true);

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.rectangle1);
    obj.button74:setWidth(100);
    obj.button74:setHeight(100);
    obj.button74:setLeft(1200);
    obj.button74:setTop(200);
    obj.button74:setName("button74");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.rectangle1);
    obj.image54:setWidth(100);
    obj.image54:setHeight(100);
    obj.image54:setLeft(1200);
    obj.image54:setTop(200);
    obj.image54:setStyle("proportional");
    obj.image54:setCenter(true);
    obj.image54:setSRC("/DZ_Ficha2.0/images/Mochila.png");
    obj.image54:setName("image54");

    obj.PopInventario = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopInventario:setParent(obj.rectangle1);
    obj.PopInventario:setName("PopInventario");
    obj.PopInventario:setWidth(450);
    obj.PopInventario:setHeight(600);
    obj.PopInventario:setBackOpacity(0.5);

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.PopInventario);
    obj.textEditor20:setField("InventarioE");
    obj.textEditor20:setName("textEditor20");
    obj.textEditor20:setFontColor("#C0504D");
    obj.textEditor20:setFontSize(15);
    obj.textEditor20:setHorzTextAlign("leading");
    obj.textEditor20:setFontFamily("kalam");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setAlign("client");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.PopInventario);
    obj.rectangle12:setWidth(450);
    obj.rectangle12:setHeight(600);
    obj.rectangle12:setColor("white");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle12);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.scrollBox4);
    obj.label49:setFontSize(25);
    obj.label49:setFontColor("#000000");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setVertTextAlign("center");
    obj.label49:setWidth(200);
    obj.label49:setLeft(125);
    obj.label49:setHeight(30);
    obj.label49:setText("EQUIPAMENTOS");
    obj.label49:setFontFamily("DK Umbilical Noose");
    obj.label49:setName("label49");
    obj.label49:setTextTrimming("none");
    obj.label49:setWordWrap(false);
    obj.label49:setAutoSize(true);

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.scrollBox4);
    obj.button75:setLeft(10);
    obj.button75:setTop(50);
    obj.button75:setHeight(25);
    obj.button75:setText("Novo Item");
    obj.button75:setWidth(80);
    obj.button75:setName("button75");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.scrollBox4);
    obj.image55:setWidth(50);
    obj.image55:setHeight(50);
    obj.image55:setLeft(180);
    obj.image55:setTop(40);
    obj.image55:setStyle("proportional");
    obj.image55:setCenter(true);
    obj.image55:setSRC("/DZ_Ficha2.0/images/Mochila.png");
    obj.image55:setName("image55");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox4);
    obj.rectangle13:setTop(60);
    obj.rectangle13:setLeft(300);
    obj.rectangle13:setWidth(100);
    lfm_setPropAsString(obj.rectangle13, "sides",  "bottom");
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setColor("#00000000");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setXradius(8);
    obj.rectangle13:setYradius(8);

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.rectangle13);
    obj.edit129:setField("PesoA");
    obj.edit129:setWidth(45);
    obj.edit129:setHeight(30);
    obj.edit129:setFontColor("black");
    obj.edit129:setName("edit129");
    obj.edit129:setFontSize(18);
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit129, "fontStyle",  "bold");
    obj.edit129:setFontFamily("kalam");
    obj.edit129:setTransparent(true);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle13);
    obj.label50:setText("/");
    obj.label50:setWidth(10);
    obj.label50:setHeight(30);
    obj.label50:setTop(3);
    obj.label50:setLeft(46);
    obj.label50:setName("label50");
    obj.label50:setFontColor("#000000");
    obj.label50:setFontSize(15);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setFontFamily("kalam");
    obj.label50:setTextTrimming("none");
    obj.label50:setWordWrap(false);
    obj.label50:setAutoSize(true);

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.rectangle13);
    obj.edit130:setField("PesoB");
    obj.edit130:setWidth(45);
    obj.edit130:setLeft(48);
    obj.edit130:setHeight(30);
    obj.edit130:setFontColor("black");
    obj.edit130:setName("edit130");
    obj.edit130:setFontSize(18);
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit130, "fontStyle",  "bold");
    obj.edit130:setFontFamily("kalam");
    obj.edit130:setTransparent(true);

    obj.rclEquip = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquip:setParent(obj.scrollBox4);
    obj.rclEquip:setName("rclEquip");
    obj.rclEquip:setField("Itens");
    obj.rclEquip:setTemplateForm("frmEquip");
    obj.rclEquip:setLeft(1);
    obj.rclEquip:setTop(100);
    obj.rclEquip:setWidth(400);
    obj.rclEquip:setAutoHeight(true);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle1);
    obj.label51:setText("Transporte");
    obj.label51:setWidth(50);
    obj.label51:setHeight(30);
    obj.label51:setTop(570);
    obj.label51:setLeft(1220);
    obj.label51:setFontSize(15);
    obj.label51:setName("label51");
    obj.label51:setFontColor("#000000");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setVertTextAlign("center");
    obj.label51:setFontFamily("kalam");
    obj.label51:setTextTrimming("none");
    obj.label51:setWordWrap(false);
    obj.label51:setAutoSize(true);

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.rectangle1);
    obj.button76:setWidth(100);
    obj.button76:setHeight(100);
    obj.button76:setLeft(1200);
    obj.button76:setTop(590);
    obj.button76:setName("button76");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.rectangle1);
    obj.image56:setWidth(100);
    obj.image56:setHeight(100);
    obj.image56:setLeft(1200);
    obj.image56:setTop(590);
    obj.image56:setStyle("proportional");
    obj.image56:setCenter(true);
    obj.image56:setSRC("/DZ_Ficha2.0/images/Carro.png");
    obj.image56:setName("image56");

    obj.PopCar = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopCar:setParent(obj.rectangle1);
    obj.PopCar:setName("PopCar");
    obj.PopCar:setWidth(1010);
    obj.PopCar:setHeight(650);
    obj.PopCar:setBackOpacity(0.5);

    obj.frmCAR = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCAR:setParent(obj.PopCar);
    obj.frmCAR:setName("frmCAR");
    obj.frmCAR:setHeight(650);
    obj.frmCAR:setWidth(1010);
    obj.frmCAR:setTheme("light");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.frmCAR);
    obj.rectangle14:setWidth(1010);
    obj.rectangle14:setHeight(650);
    obj.rectangle14:setColor("white");
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setXradius(8);
    obj.rectangle14:setYradius(8);
    obj.rectangle14:setName("rectangle14");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle14);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox5);
    obj.layout132:setLeft(0);
    obj.layout132:setTop(0);
    obj.layout132:setWidth(500);
    obj.layout132:setHeight(650);
    obj.layout132:setName("layout132");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.layout132);
    obj.image57:setWidth(500);
    obj.image57:setHeight(400);
    obj.image57:setLeft(0);
    obj.image57:setTop(0);
    obj.image57:setStyle("proportional");
    obj.image57:setCenter(true);
    obj.image57:setSRC("/DZ_Ficha2.0/images/FichaCAR.png");
    obj.image57:setName("image57");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout132);
    obj.label52:setText("VEICULO");
    obj.label52:setFontSize(30);
    obj.label52:setWidth(200);
    obj.label52:setHeight(30);
    obj.label52:setTop(45);
    obj.label52:setLeft(70);
    obj.label52:setName("label52");
    obj.label52:setFontColor("#C0504D");
    obj.label52:setHorzTextAlign("leading");
    obj.label52:setVertTextAlign("center");
    obj.label52:setFontFamily("DK Umbilical Noose");
    obj.label52:setTextTrimming("none");
    obj.label52:setWordWrap(false);
    obj.label52:setAutoSize(true);

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout132);
    obj.edit131:setField("Conducao_Nick");
    obj.edit131:setWidth(250);
    obj.edit131:setHorzTextAlign("leading");
    obj.edit131:setFontSize(30);
    lfm_setPropAsString(obj.edit131, "fontStyle",  "bold");
    obj.edit131:setHeight(40);
    obj.edit131:setTop(50);
    obj.edit131:setLeft(190);
    obj.edit131:setName("edit131");
    obj.edit131:setFontColor("#C0504D");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setFontFamily("kalam");
    obj.edit131:setTransparent(true);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout132);
    obj.label53:setText("Manobra");
    obj.label53:setFontSize(20);
    obj.label53:setWidth(60);
    obj.label53:setHeight(30);
    obj.label53:setTop(110);
    obj.label53:setLeft(70);
    obj.label53:setName("label53");
    obj.label53:setFontColor("#C0504D");
    obj.label53:setHorzTextAlign("leading");
    obj.label53:setVertTextAlign("center");
    obj.label53:setFontFamily("DK Umbilical Noose");
    obj.label53:setTextTrimming("none");
    obj.label53:setWordWrap(false);
    obj.label53:setAutoSize(true);

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout132);
    obj.edit132:setField("Conducao_Manobra");
    obj.edit132:setWidth(30);
    obj.edit132:setHeight(30);
    obj.edit132:setTop(110);
    obj.edit132:setLeft(170);
    obj.edit132:setName("edit132");
    obj.edit132:setFontSize(20);
    obj.edit132:setFontColor("#C0504D");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setFontFamily("kalam");
    obj.edit132:setTransparent(true);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout132);
    obj.label54:setText("Blindagem");
    obj.label54:setFontSize(20);
    obj.label54:setFontColor("black");
    obj.label54:setWidth(60);
    obj.label54:setHeight(30);
    obj.label54:setTop(145);
    obj.label54:setLeft(55);
    obj.label54:setName("label54");
    obj.label54:setHorzTextAlign("leading");
    obj.label54:setVertTextAlign("center");
    obj.label54:setFontFamily("DK Umbilical Noose");
    obj.label54:setTextTrimming("none");
    obj.label54:setWordWrap(false);
    obj.label54:setAutoSize(true);

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout132);
    obj.edit133:setField("Conducao_Blindagem");
    obj.edit133:setWidth(30);
    obj.edit133:setHeight(30);
    obj.edit133:setTop(145);
    obj.edit133:setLeft(170);
    obj.edit133:setName("edit133");
    obj.edit133:setFontSize(20);
    obj.edit133:setFontColor("#C0504D");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setFontFamily("kalam");
    obj.edit133:setTransparent(true);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout132);
    obj.label55:setText("Capacidade");
    obj.label55:setFontSize(20);
    obj.label55:setWidth(60);
    obj.label55:setHeight(30);
    obj.label55:setTop(178);
    obj.label55:setLeft(51);
    obj.label55:setName("label55");
    obj.label55:setFontColor("#C0504D");
    obj.label55:setHorzTextAlign("leading");
    obj.label55:setVertTextAlign("center");
    obj.label55:setFontFamily("DK Umbilical Noose");
    obj.label55:setTextTrimming("none");
    obj.label55:setWordWrap(false);
    obj.label55:setAutoSize(true);

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout132);
    obj.edit134:setField("Conducao_Capacidade");
    obj.edit134:setWidth(30);
    obj.edit134:setHeight(30);
    obj.edit134:setTop(175);
    obj.edit134:setLeft(170);
    obj.edit134:setName("edit134");
    obj.edit134:setFontSize(20);
    obj.edit134:setFontColor("#C0504D");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setFontFamily("kalam");
    obj.edit134:setTransparent(true);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout132);
    obj.label56:setText("CD");
    obj.label56:setFontSize(20);
    obj.label56:setFontColor("black");
    obj.label56:setWidth(60);
    obj.label56:setHeight(30);
    obj.label56:setTop(207);
    obj.label56:setLeft(100);
    obj.label56:setName("label56");
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setVertTextAlign("center");
    obj.label56:setFontFamily("DK Umbilical Noose");
    obj.label56:setTextTrimming("none");
    obj.label56:setWordWrap(false);
    obj.label56:setAutoSize(true);

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout132);
    obj.edit135:setField("Conducao_CD");
    obj.edit135:setWidth(30);
    obj.edit135:setHeight(30);
    obj.edit135:setTop(207);
    obj.edit135:setLeft(170);
    obj.edit135:setName("edit135");
    obj.edit135:setFontSize(20);
    obj.edit135:setFontColor("#C0504D");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setFontFamily("kalam");
    obj.edit135:setTransparent(true);

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout132);
    obj.label57:setText("Integridade");
    obj.label57:setFontSize(20);
    obj.label57:setWidth(80);
    obj.label57:setHeight(30);
    obj.label57:setTop(100);
    obj.label57:setLeft(230);
    obj.label57:setName("label57");
    obj.label57:setFontColor("#C0504D");
    obj.label57:setHorzTextAlign("leading");
    obj.label57:setVertTextAlign("center");
    obj.label57:setFontFamily("DK Umbilical Noose");
    obj.label57:setTextTrimming("none");
    obj.label57:setWordWrap(false);
    obj.label57:setAutoSize(true);

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout132);
    obj.edit136:setField("Conducao_Integridade1");
    obj.edit136:setWidth(30);
    obj.edit136:setHeight(30);
    obj.edit136:setTop(142);
    obj.edit136:setLeft(240);
    obj.edit136:setName("edit136");
    obj.edit136:setFontSize(20);
    obj.edit136:setFontColor("#C0504D");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setFontFamily("kalam");
    obj.edit136:setTransparent(true);

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout132);
    obj.edit137:setField("Conducao_Integridade2");
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(30);
    obj.edit137:setTop(142);
    obj.edit137:setLeft(275);
    obj.edit137:setName("edit137");
    obj.edit137:setFontSize(20);
    obj.edit137:setFontColor("#C0504D");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setFontFamily("kalam");
    obj.edit137:setTransparent(true);

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout132);
    obj.edit138:setField("Conducao_Integridade3");
    obj.edit138:setWidth(30);
    obj.edit138:setHeight(30);
    obj.edit138:setTop(142);
    obj.edit138:setLeft(310);
    obj.edit138:setName("edit138");
    obj.edit138:setFontSize(20);
    obj.edit138:setFontColor("#C0504D");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setFontFamily("kalam");
    obj.edit138:setTransparent(true);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout132);
    obj.label58:setText("Gasolina");
    obj.label58:setFontSize(20);
    obj.label58:setFontColor("black");
    obj.label58:setWidth(80);
    obj.label58:setHeight(30);
    obj.label58:setTop(100);
    obj.label58:setLeft(370);
    obj.label58:setName("label58");
    obj.label58:setHorzTextAlign("leading");
    obj.label58:setVertTextAlign("center");
    obj.label58:setFontFamily("DK Umbilical Noose");
    obj.label58:setTextTrimming("none");
    obj.label58:setWordWrap(false);
    obj.label58:setAutoSize(true);

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout132);
    obj.edit139:setField("Conducao_Gasolina1");
    obj.edit139:setWidth(30);
    obj.edit139:setHeight(30);
    obj.edit139:setTop(142);
    obj.edit139:setLeft(370);
    obj.edit139:setName("edit139");
    obj.edit139:setFontSize(20);
    obj.edit139:setFontColor("#C0504D");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setFontFamily("kalam");
    obj.edit139:setTransparent(true);

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout132);
    obj.label59:setText("Perm");
    obj.label59:setFontSize(10);
    obj.label59:setFontColor("#C0C0C0");
    obj.label59:setWidth(30);
    obj.label59:setHeight(45);
    obj.label59:setTop(130);
    obj.label59:setLeft(375);
    obj.label59:setName("label59");
    obj.label59:setHorzTextAlign("leading");
    obj.label59:setVertTextAlign("center");
    obj.label59:setFontFamily("DK Umbilical Noose");
    obj.label59:setTextTrimming("none");
    obj.label59:setWordWrap(false);
    obj.label59:setAutoSize(true);

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout132);
    obj.edit140:setField("Conducao_Gasolina2");
    obj.edit140:setWidth(30);
    obj.edit140:setHeight(30);
    obj.edit140:setTop(142);
    obj.edit140:setLeft(425);
    obj.edit140:setName("edit140");
    obj.edit140:setFontSize(20);
    obj.edit140:setFontColor("#C0504D");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setFontFamily("kalam");
    obj.edit140:setTransparent(true);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout132);
    obj.label60:setText("Temp");
    obj.label60:setFontSize(10);
    obj.label60:setFontColor("#C0C0C0");
    obj.label60:setWidth(30);
    obj.label60:setHeight(45);
    obj.label60:setTop(130);
    obj.label60:setLeft(430);
    obj.label60:setName("label60");
    obj.label60:setHorzTextAlign("leading");
    obj.label60:setVertTextAlign("center");
    obj.label60:setFontFamily("DK Umbilical Noose");
    obj.label60:setTextTrimming("none");
    obj.label60:setWordWrap(false);
    obj.label60:setAutoSize(true);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout132);
    obj.label61:setText("Equipamentos:");
    obj.label61:setFontSize(20);
    obj.label61:setWidth(80);
    obj.label61:setHeight(30);
    obj.label61:setTop(178);
    obj.label61:setLeft(230);
    obj.label61:setName("label61");
    obj.label61:setFontColor("#C0504D");
    obj.label61:setHorzTextAlign("leading");
    obj.label61:setVertTextAlign("center");
    obj.label61:setFontFamily("DK Umbilical Noose");
    obj.label61:setTextTrimming("none");
    obj.label61:setWordWrap(false);
    obj.label61:setAutoSize(true);

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout132);
    obj.layout133:setLeft(230);
    obj.layout133:setTop(208);
    obj.layout133:setWidth(230);
    obj.layout133:setHeight(160);
    obj.layout133:setName("layout133");

    obj.Conducao_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Equipamentos:setParent(obj.layout133);
    obj.Conducao_Equipamentos:setName("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setFontFamily("kalam");
    obj.Conducao_Equipamentos:setWidth(230);
    obj.Conducao_Equipamentos:setHeight(160);
    obj.Conducao_Equipamentos:setFontSize(15);
    obj.Conducao_Equipamentos:setFontColor("#548DD4");
    obj.Conducao_Equipamentos:setField("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setTransparent(true);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout132);
    obj.label62:setText("Circunstancia:");
    obj.label62:setFontSize(20);
    obj.label62:setWidth(80);
    obj.label62:setHeight(30);
    obj.label62:setTop(260);
    obj.label62:setLeft(40);
    obj.label62:setName("label62");
    obj.label62:setFontColor("#C0504D");
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setVertTextAlign("center");
    obj.label62:setFontFamily("DK Umbilical Noose");
    obj.label62:setTextTrimming("none");
    obj.label62:setWordWrap(false);
    obj.label62:setAutoSize(true);

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout132);
    obj.layout134:setLeft(25);
    obj.layout134:setTop(290);
    obj.layout134:setWidth(200);
    obj.layout134:setHeight(78);
    obj.layout134:setName("layout134");

    obj.Conducao_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Circunstancia:setParent(obj.layout134);
    obj.Conducao_Circunstancia:setName("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setFontFamily("kalam");
    obj.Conducao_Circunstancia:setWidth(200);
    obj.Conducao_Circunstancia:setHeight(80);
    obj.Conducao_Circunstancia:setFontSize(15);
    obj.Conducao_Circunstancia:setFontColor("#548DD4");
    obj.Conducao_Circunstancia:setField("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setTransparent(true);

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.layout132);
    obj.image58:setWidth(500);
    obj.image58:setHeight(250);
    obj.image58:setLeft(0);
    obj.image58:setTop(385);
    obj.image58:setStyle("proportional");
    obj.image58:setCenter(true);
    obj.image58:setEditable(true);
    obj.image58:setSRC("/DZ_Ficha2.0/images/ImgSize_250x500.png");
    obj.image58:setField("CarII");
    obj.image58:setName("image58");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox5);
    obj.layout135:setLeft(500);
    obj.layout135:setTop(0);
    obj.layout135:setWidth(500);
    obj.layout135:setHeight(650);
    obj.layout135:setName("layout135");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.layout135);
    obj.image59:setWidth(500);
    obj.image59:setHeight(400);
    obj.image59:setLeft(0);
    obj.image59:setTop(0);
    obj.image59:setStyle("proportional");
    obj.image59:setCenter(true);
    obj.image59:setSRC("/DZ_Ficha2.0/images/FichaCAR.png");
    obj.image59:setName("image59");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout135);
    obj.label63:setText("VEICULO");
    obj.label63:setFontSize(30);
    obj.label63:setWidth(200);
    obj.label63:setHeight(30);
    obj.label63:setTop(45);
    obj.label63:setLeft(70);
    obj.label63:setName("label63");
    obj.label63:setFontColor("#C0504D");
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setVertTextAlign("center");
    obj.label63:setFontFamily("DK Umbilical Noose");
    obj.label63:setTextTrimming("none");
    obj.label63:setWordWrap(false);
    obj.label63:setAutoSize(true);

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout135);
    obj.edit141:setField("Conducao2_Nick");
    obj.edit141:setWidth(250);
    lfm_setPropAsString(obj.edit141, "fontStyle",  "bold");
    obj.edit141:setFontSize(30);
    obj.edit141:setHorzTextAlign("leading");
    obj.edit141:setHeight(40);
    obj.edit141:setTop(50);
    obj.edit141:setLeft(190);
    obj.edit141:setName("edit141");
    obj.edit141:setFontColor("#C0504D");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setFontFamily("kalam");
    obj.edit141:setTransparent(true);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout135);
    obj.label64:setText("Manobra");
    obj.label64:setFontSize(20);
    obj.label64:setWidth(60);
    obj.label64:setHeight(30);
    obj.label64:setTop(110);
    obj.label64:setLeft(70);
    obj.label64:setName("label64");
    obj.label64:setFontColor("#C0504D");
    obj.label64:setHorzTextAlign("leading");
    obj.label64:setVertTextAlign("center");
    obj.label64:setFontFamily("DK Umbilical Noose");
    obj.label64:setTextTrimming("none");
    obj.label64:setWordWrap(false);
    obj.label64:setAutoSize(true);

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout135);
    obj.edit142:setField("Conducao2_Manobra");
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(30);
    obj.edit142:setTop(110);
    obj.edit142:setLeft(170);
    obj.edit142:setName("edit142");
    obj.edit142:setFontSize(20);
    obj.edit142:setFontColor("#C0504D");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setFontFamily("kalam");
    obj.edit142:setTransparent(true);

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout135);
    obj.label65:setText("Blindagem");
    obj.label65:setFontSize(20);
    obj.label65:setFontColor("black");
    obj.label65:setWidth(60);
    obj.label65:setHeight(30);
    obj.label65:setTop(145);
    obj.label65:setLeft(55);
    obj.label65:setName("label65");
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setVertTextAlign("center");
    obj.label65:setFontFamily("DK Umbilical Noose");
    obj.label65:setTextTrimming("none");
    obj.label65:setWordWrap(false);
    obj.label65:setAutoSize(true);

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout135);
    obj.edit143:setField("Conducao2_Blindagem");
    obj.edit143:setWidth(30);
    obj.edit143:setHeight(30);
    obj.edit143:setTop(145);
    obj.edit143:setLeft(170);
    obj.edit143:setName("edit143");
    obj.edit143:setFontSize(20);
    obj.edit143:setFontColor("#C0504D");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setFontFamily("kalam");
    obj.edit143:setTransparent(true);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout135);
    obj.label66:setText("Capacidade");
    obj.label66:setFontSize(20);
    obj.label66:setWidth(60);
    obj.label66:setHeight(30);
    obj.label66:setTop(178);
    obj.label66:setLeft(51);
    obj.label66:setName("label66");
    obj.label66:setFontColor("#C0504D");
    obj.label66:setHorzTextAlign("leading");
    obj.label66:setVertTextAlign("center");
    obj.label66:setFontFamily("DK Umbilical Noose");
    obj.label66:setTextTrimming("none");
    obj.label66:setWordWrap(false);
    obj.label66:setAutoSize(true);

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout135);
    obj.edit144:setField("Conducao2_Capacidade");
    obj.edit144:setWidth(30);
    obj.edit144:setHeight(30);
    obj.edit144:setTop(175);
    obj.edit144:setLeft(170);
    obj.edit144:setName("edit144");
    obj.edit144:setFontSize(20);
    obj.edit144:setFontColor("#C0504D");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setFontFamily("kalam");
    obj.edit144:setTransparent(true);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout135);
    obj.label67:setText("CD");
    obj.label67:setFontSize(20);
    obj.label67:setFontColor("black");
    obj.label67:setWidth(60);
    obj.label67:setHeight(30);
    obj.label67:setTop(207);
    obj.label67:setLeft(100);
    obj.label67:setName("label67");
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setVertTextAlign("center");
    obj.label67:setFontFamily("DK Umbilical Noose");
    obj.label67:setTextTrimming("none");
    obj.label67:setWordWrap(false);
    obj.label67:setAutoSize(true);

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout135);
    obj.edit145:setField("Conducao2_CD");
    obj.edit145:setWidth(30);
    obj.edit145:setHeight(30);
    obj.edit145:setTop(207);
    obj.edit145:setLeft(170);
    obj.edit145:setName("edit145");
    obj.edit145:setFontSize(20);
    obj.edit145:setFontColor("#C0504D");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setFontFamily("kalam");
    obj.edit145:setTransparent(true);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout135);
    obj.label68:setText("Integridade");
    obj.label68:setFontSize(20);
    obj.label68:setWidth(80);
    obj.label68:setHeight(30);
    obj.label68:setTop(100);
    obj.label68:setLeft(230);
    obj.label68:setName("label68");
    obj.label68:setFontColor("#C0504D");
    obj.label68:setHorzTextAlign("leading");
    obj.label68:setVertTextAlign("center");
    obj.label68:setFontFamily("DK Umbilical Noose");
    obj.label68:setTextTrimming("none");
    obj.label68:setWordWrap(false);
    obj.label68:setAutoSize(true);

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout135);
    obj.edit146:setField("Conducao2_Integridade1");
    obj.edit146:setWidth(30);
    obj.edit146:setHeight(30);
    obj.edit146:setTop(142);
    obj.edit146:setLeft(240);
    obj.edit146:setName("edit146");
    obj.edit146:setFontSize(20);
    obj.edit146:setFontColor("#C0504D");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setFontFamily("kalam");
    obj.edit146:setTransparent(true);

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout135);
    obj.edit147:setField("Conducao2_Integridade2");
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(30);
    obj.edit147:setTop(142);
    obj.edit147:setLeft(275);
    obj.edit147:setName("edit147");
    obj.edit147:setFontSize(20);
    obj.edit147:setFontColor("#C0504D");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setFontFamily("kalam");
    obj.edit147:setTransparent(true);

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout135);
    obj.edit148:setField("Conducao2_Integridade3");
    obj.edit148:setWidth(30);
    obj.edit148:setHeight(30);
    obj.edit148:setTop(142);
    obj.edit148:setLeft(310);
    obj.edit148:setName("edit148");
    obj.edit148:setFontSize(20);
    obj.edit148:setFontColor("#C0504D");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setFontFamily("kalam");
    obj.edit148:setTransparent(true);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout135);
    obj.label69:setText("Gasolina");
    obj.label69:setFontSize(20);
    obj.label69:setFontColor("black");
    obj.label69:setWidth(80);
    obj.label69:setHeight(30);
    obj.label69:setTop(100);
    obj.label69:setLeft(370);
    obj.label69:setName("label69");
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setVertTextAlign("center");
    obj.label69:setFontFamily("DK Umbilical Noose");
    obj.label69:setTextTrimming("none");
    obj.label69:setWordWrap(false);
    obj.label69:setAutoSize(true);

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout135);
    obj.edit149:setField("Conducao2_Gasolina1");
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(30);
    obj.edit149:setTop(142);
    obj.edit149:setLeft(370);
    obj.edit149:setName("edit149");
    obj.edit149:setFontSize(20);
    obj.edit149:setFontColor("#C0504D");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setFontFamily("kalam");
    obj.edit149:setTransparent(true);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout135);
    obj.label70:setText("Perm");
    obj.label70:setFontSize(10);
    obj.label70:setFontColor("#C0C0C0");
    obj.label70:setWidth(30);
    obj.label70:setHeight(45);
    obj.label70:setTop(130);
    obj.label70:setLeft(375);
    obj.label70:setName("label70");
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setVertTextAlign("center");
    obj.label70:setFontFamily("DK Umbilical Noose");
    obj.label70:setTextTrimming("none");
    obj.label70:setWordWrap(false);
    obj.label70:setAutoSize(true);

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout135);
    obj.edit150:setField("Conducao2_Gasolina2");
    obj.edit150:setWidth(30);
    obj.edit150:setHeight(30);
    obj.edit150:setTop(142);
    obj.edit150:setLeft(425);
    obj.edit150:setName("edit150");
    obj.edit150:setFontSize(20);
    obj.edit150:setFontColor("#C0504D");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setFontFamily("kalam");
    obj.edit150:setTransparent(true);

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout135);
    obj.label71:setText("Temp");
    obj.label71:setFontSize(10);
    obj.label71:setFontColor("#C0C0C0");
    obj.label71:setWidth(30);
    obj.label71:setHeight(45);
    obj.label71:setTop(130);
    obj.label71:setLeft(430);
    obj.label71:setName("label71");
    obj.label71:setHorzTextAlign("leading");
    obj.label71:setVertTextAlign("center");
    obj.label71:setFontFamily("DK Umbilical Noose");
    obj.label71:setTextTrimming("none");
    obj.label71:setWordWrap(false);
    obj.label71:setAutoSize(true);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout135);
    obj.label72:setText("Equipamentos:");
    obj.label72:setFontSize(20);
    obj.label72:setWidth(80);
    obj.label72:setHeight(30);
    obj.label72:setTop(178);
    obj.label72:setLeft(230);
    obj.label72:setName("label72");
    obj.label72:setFontColor("#C0504D");
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setVertTextAlign("center");
    obj.label72:setFontFamily("DK Umbilical Noose");
    obj.label72:setTextTrimming("none");
    obj.label72:setWordWrap(false);
    obj.label72:setAutoSize(true);

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout135);
    obj.layout136:setLeft(230);
    obj.layout136:setTop(208);
    obj.layout136:setWidth(230);
    obj.layout136:setHeight(160);
    obj.layout136:setName("layout136");

    obj.Conducao2_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Equipamentos:setParent(obj.layout136);
    obj.Conducao2_Equipamentos:setName("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setFontFamily("kalam");
    obj.Conducao2_Equipamentos:setWidth(230);
    obj.Conducao2_Equipamentos:setHeight(160);
    obj.Conducao2_Equipamentos:setFontSize(15);
    obj.Conducao2_Equipamentos:setFontColor("#548DD4");
    obj.Conducao2_Equipamentos:setField("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setTransparent(true);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout135);
    obj.label73:setText("Circunstancia:");
    obj.label73:setFontSize(20);
    obj.label73:setWidth(80);
    obj.label73:setHeight(30);
    obj.label73:setTop(260);
    obj.label73:setLeft(40);
    obj.label73:setName("label73");
    obj.label73:setFontColor("#C0504D");
    obj.label73:setHorzTextAlign("leading");
    obj.label73:setVertTextAlign("center");
    obj.label73:setFontFamily("DK Umbilical Noose");
    obj.label73:setTextTrimming("none");
    obj.label73:setWordWrap(false);
    obj.label73:setAutoSize(true);

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout135);
    obj.layout137:setLeft(25);
    obj.layout137:setTop(290);
    obj.layout137:setWidth(200);
    obj.layout137:setHeight(78);
    obj.layout137:setName("layout137");

    obj.Conducao2_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Circunstancia:setParent(obj.layout137);
    obj.Conducao2_Circunstancia:setName("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setFontFamily("kalam");
    obj.Conducao2_Circunstancia:setWidth(200);
    obj.Conducao2_Circunstancia:setHeight(80);
    obj.Conducao2_Circunstancia:setFontSize(15);
    obj.Conducao2_Circunstancia:setFontColor("#548DD4");
    obj.Conducao2_Circunstancia:setField("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setTransparent(true);

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.layout135);
    obj.image60:setWidth(500);
    obj.image60:setHeight(250);
    obj.image60:setLeft(0);
    obj.image60:setTop(385);
    obj.image60:setStyle("proportional");
    obj.image60:setCenter(true);
    obj.image60:setEditable(true);
    obj.image60:setField("Car2II");
    obj.image60:setSRC("/DZ_Ficha2.0/images/ImgSize_250x500.png");
    obj.image60:setName("image60");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle1);
    obj.label74:setText("Animal");
    obj.label74:setWidth(50);
    obj.label74:setHeight(30);
    obj.label74:setTop(440);
    obj.label74:setLeft(1225);
    obj.label74:setFontSize(15);
    obj.label74:setName("label74");
    obj.label74:setFontColor("#000000");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setVertTextAlign("center");
    obj.label74:setFontFamily("kalam");
    obj.label74:setTextTrimming("none");
    obj.label74:setWordWrap(false);
    obj.label74:setAutoSize(true);

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.rectangle1);
    obj.button77:setWidth(100);
    obj.button77:setHeight(100);
    obj.button77:setLeft(1200);
    obj.button77:setTop(460);
    obj.button77:setName("button77");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.rectangle1);
    obj.image61:setWidth(100);
    obj.image61:setHeight(100);
    obj.image61:setLeft(1200);
    obj.image61:setTop(460);
    obj.image61:setStyle("proportional");
    obj.image61:setCenter(true);
    obj.image61:setSRC("/DZ_Ficha2.0/images/Horse.png");
    obj.image61:setName("image61");

    obj.PopAnimal = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopAnimal:setParent(obj.rectangle1);
    obj.PopAnimal:setName("PopAnimal");
    obj.PopAnimal:setWidth(1200);
    obj.PopAnimal:setHeight(800);
    obj.PopAnimal:setBackOpacity(0.5);

    obj.frmAnimal = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAnimal:setParent(obj.PopAnimal);
    obj.frmAnimal:setName("frmAnimal");
    obj.frmAnimal:setHeight(800);
    obj.frmAnimal:setWidth(1200);
    obj.frmAnimal:setTheme("light");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.frmAnimal);
    obj.rectangle15:setWidth(1200);
    obj.rectangle15:setHeight(800);
    obj.rectangle15:setColor("white");
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setXradius(8);
    obj.rectangle15:setYradius(8);
    obj.rectangle15:setName("rectangle15");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle15);
    obj.layout138:setLeft(0);
    obj.layout138:setTop(0);
    obj.layout138:setWidth(600);
    obj.layout138:setHeight(800);
    obj.layout138:setName("layout138");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.layout138);
    obj.image62:setWidth(600);
    obj.image62:setHeight(400);
    obj.image62:setLeft(10);
    obj.image62:setTop(140);
    obj.image62:setStyle("proportional");
    obj.image62:setCenter(true);
    obj.image62:setSRC("/DZ_Ficha2.0/images/FichaPET.png");
    obj.image62:setName("image62");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout138);
    obj.edit151:setField("Pet_Nick");
    obj.edit151:setWidth(500);
    obj.edit151:setHeight(60);
    obj.edit151:setTop(150);
    obj.edit151:setLeft(100);
    obj.edit151:setFontSize(30);
    obj.edit151:setHorzTextAlign("leading");
    obj.edit151:setName("edit151");
    obj.edit151:setFontColor("#C0504D");
    obj.edit151:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit151, "fontStyle",  "bold");
    obj.edit151:setFontFamily("kalam");
    obj.edit151:setTransparent(true);

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout138);
    obj.edit152:setField("Pet_Fisico");
    obj.edit152:setWidth(40);
    obj.edit152:setHeight(30);
    obj.edit152:setTop(208);
    obj.edit152:setLeft(180);
    obj.edit152:setName("edit152");
    obj.edit152:setFontColor("#C0504D");
    obj.edit152:setFontSize(15);
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit152, "fontStyle",  "bold");
    obj.edit152:setFontFamily("kalam");
    obj.edit152:setTransparent(true);

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout138);
    obj.edit153:setField("Pet_Social");
    obj.edit153:setWidth(40);
    obj.edit153:setHeight(30);
    obj.edit153:setTop(240);
    obj.edit153:setLeft(180);
    obj.edit153:setName("edit153");
    obj.edit153:setFontColor("#C0504D");
    obj.edit153:setFontSize(15);
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit153, "fontStyle",  "bold");
    obj.edit153:setFontFamily("kalam");
    obj.edit153:setTransparent(true);

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout138);
    obj.edit154:setField("Pet_Inteligencia");
    obj.edit154:setWidth(40);
    obj.edit154:setHeight(30);
    obj.edit154:setTop(270);
    obj.edit154:setLeft(180);
    obj.edit154:setName("edit154");
    obj.edit154:setFontColor("#C0504D");
    obj.edit154:setFontSize(15);
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit154, "fontStyle",  "bold");
    obj.edit154:setFontFamily("kalam");
    obj.edit154:setTransparent(true);

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout138);
    obj.edit155:setField("Pet_Percep");
    obj.edit155:setWidth(40);
    obj.edit155:setHeight(30);
    obj.edit155:setTop(310);
    obj.edit155:setLeft(180);
    obj.edit155:setName("edit155");
    obj.edit155:setFontColor("#C0504D");
    obj.edit155:setFontSize(15);
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit155, "fontStyle",  "bold");
    obj.edit155:setFontFamily("kalam");
    obj.edit155:setTransparent(true);

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout138);
    obj.edit156:setField("Pet_Espiritual");
    obj.edit156:setWidth(40);
    obj.edit156:setHeight(30);
    obj.edit156:setTop(340);
    obj.edit156:setLeft(180);
    obj.edit156:setName("edit156");
    obj.edit156:setFontColor("#C0504D");
    obj.edit156:setFontSize(15);
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit156, "fontStyle",  "bold");
    obj.edit156:setFontFamily("kalam");
    obj.edit156:setTransparent(true);

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout138);
    obj.edit157:setField("Pet_Per1");
    obj.edit157:setWidth(40);
    obj.edit157:setHeight(30);
    obj.edit157:setTop(208);
    obj.edit157:setLeft(325);
    obj.edit157:setName("edit157");
    obj.edit157:setFontColor("#C0504D");
    obj.edit157:setFontSize(15);
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit157, "fontStyle",  "bold");
    obj.edit157:setFontFamily("kalam");
    obj.edit157:setTransparent(true);

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout138);
    obj.edit158:setField("Pet_Per2");
    obj.edit158:setWidth(40);
    obj.edit158:setHeight(30);
    obj.edit158:setTop(240);
    obj.edit158:setLeft(325);
    obj.edit158:setName("edit158");
    obj.edit158:setFontColor("#C0504D");
    obj.edit158:setFontSize(15);
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit158, "fontStyle",  "bold");
    obj.edit158:setFontFamily("kalam");
    obj.edit158:setTransparent(true);

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout138);
    obj.edit159:setField("Pet_Per3");
    obj.edit159:setWidth(40);
    obj.edit159:setHeight(30);
    obj.edit159:setTop(270);
    obj.edit159:setLeft(325);
    obj.edit159:setName("edit159");
    obj.edit159:setFontColor("#C0504D");
    obj.edit159:setFontSize(15);
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit159, "fontStyle",  "bold");
    obj.edit159:setFontFamily("kalam");
    obj.edit159:setTransparent(true);

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout138);
    obj.edit160:setField("Pet_Per4");
    obj.edit160:setWidth(40);
    obj.edit160:setHeight(30);
    obj.edit160:setTop(300);
    obj.edit160:setLeft(325);
    obj.edit160:setName("edit160");
    obj.edit160:setFontColor("#C0504D");
    obj.edit160:setFontSize(15);
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit160, "fontStyle",  "bold");
    obj.edit160:setFontFamily("kalam");
    obj.edit160:setTransparent(true);

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout138);
    obj.edit161:setField("Pet_Per5");
    obj.edit161:setWidth(40);
    obj.edit161:setHeight(30);
    obj.edit161:setTop(330);
    obj.edit161:setLeft(325);
    obj.edit161:setName("edit161");
    obj.edit161:setFontColor("#C0504D");
    obj.edit161:setFontSize(15);
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit161, "fontStyle",  "bold");
    obj.edit161:setFontFamily("kalam");
    obj.edit161:setTransparent(true);

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout138);
    obj.edit162:setField("Pet_Per6");
    obj.edit162:setWidth(40);
    obj.edit162:setHeight(30);
    obj.edit162:setTop(360);
    obj.edit162:setLeft(325);
    obj.edit162:setName("edit162");
    obj.edit162:setFontColor("#C0504D");
    obj.edit162:setFontSize(15);
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit162, "fontStyle",  "bold");
    obj.edit162:setFontFamily("kalam");
    obj.edit162:setTransparent(true);

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout138);
    obj.edit163:setField("Pet_Per7");
    obj.edit163:setWidth(40);
    obj.edit163:setHeight(30);
    obj.edit163:setTop(400);
    obj.edit163:setLeft(325);
    obj.edit163:setName("edit163");
    obj.edit163:setFontColor("#C0504D");
    obj.edit163:setFontSize(15);
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit163, "fontStyle",  "bold");
    obj.edit163:setFontFamily("kalam");
    obj.edit163:setTransparent(true);

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout138);
    obj.edit164:setField("Pet_Saude1");
    obj.edit164:setWidth(40);
    obj.edit164:setHeight(30);
    obj.edit164:setTop(256);
    obj.edit164:setLeft(385);
    obj.edit164:setName("edit164");
    obj.edit164:setFontColor("#C0504D");
    obj.edit164:setFontSize(15);
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit164, "fontStyle",  "bold");
    obj.edit164:setFontFamily("kalam");
    obj.edit164:setTransparent(true);

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout138);
    obj.edit165:setField("Pet_Saude2");
    obj.edit165:setWidth(40);
    obj.edit165:setHeight(30);
    obj.edit165:setTop(256);
    obj.edit165:setLeft(422);
    obj.edit165:setName("edit165");
    obj.edit165:setFontColor("#C0504D");
    obj.edit165:setFontSize(15);
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit165, "fontStyle",  "bold");
    obj.edit165:setFontFamily("kalam");
    obj.edit165:setTransparent(true);

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout138);
    obj.edit166:setField("Pet_Saude3");
    obj.edit166:setWidth(40);
    obj.edit166:setHeight(30);
    obj.edit166:setTop(256);
    obj.edit166:setLeft(452);
    obj.edit166:setName("edit166");
    obj.edit166:setFontColor("#C0504D");
    obj.edit166:setFontSize(15);
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit166, "fontStyle",  "bold");
    obj.edit166:setFontFamily("kalam");
    obj.edit166:setTransparent(true);

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout138);
    obj.edit167:setField("Pet_Iniciativa");
    obj.edit167:setWidth(40);
    obj.edit167:setHeight(30);
    obj.edit167:setTop(325);
    obj.edit167:setLeft(470);
    obj.edit167:setName("edit167");
    obj.edit167:setFontColor("#C0504D");
    obj.edit167:setFontSize(15);
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit167, "fontStyle",  "bold");
    obj.edit167:setFontFamily("kalam");
    obj.edit167:setTransparent(true);

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout138);
    obj.edit168:setField("Pet_AtkNick");
    obj.edit168:setWidth(200);
    obj.edit168:setHeight(30);
    obj.edit168:setTop(430);
    obj.edit168:setLeft(100);
    obj.edit168:setFontSize(20);
    obj.edit168:setName("edit168");
    obj.edit168:setFontColor("black");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit168, "fontStyle",  "bold");
    obj.edit168:setFontFamily("kalam");
    obj.edit168:setTransparent(true);

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout138);
    obj.edit169:setField("Pet_AtkGolpe");
    obj.edit169:setWidth(200);
    obj.edit169:setHeight(30);
    obj.edit169:setTop(458);
    obj.edit169:setLeft(200);
    obj.edit169:setFontColor("gray");
    obj.edit169:setHorzTextAlign("leading");
    obj.edit169:setName("edit169");
    obj.edit169:setFontSize(15);
    obj.edit169:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit169, "fontStyle",  "bold");
    obj.edit169:setFontFamily("kalam");
    obj.edit169:setTransparent(true);

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout138);
    obj.edit170:setField("Pet_AtkDano");
    obj.edit170:setWidth(40);
    obj.edit170:setHeight(30);
    obj.edit170:setTop(478);
    obj.edit170:setLeft(195);
    obj.edit170:setFontColor("gray");
    obj.edit170:setName("edit170");
    obj.edit170:setFontSize(15);
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit170, "fontStyle",  "bold");
    obj.edit170:setFontFamily("kalam");
    obj.edit170:setTransparent(true);

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout138);
    obj.edit171:setField("Pet_AtkCD");
    obj.edit171:setWidth(40);
    obj.edit171:setHeight(30);
    obj.edit171:setTop(478);
    obj.edit171:setLeft(270);
    obj.edit171:setName("edit171");
    obj.edit171:setFontColor("#C0504D");
    obj.edit171:setFontSize(15);
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit171, "fontStyle",  "bold");
    obj.edit171:setFontFamily("kalam");
    obj.edit171:setTransparent(true);

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout138);
    obj.edit172:setField("Pet_Des");
    obj.edit172:setWidth(140);
    obj.edit172:setHeight(30);
    obj.edit172:setTop(400);
    obj.edit172:setLeft(385);
    obj.edit172:setHorzTextAlign("leading");
    obj.edit172:setName("edit172");
    obj.edit172:setFontColor("black");
    obj.edit172:setFontSize(15);
    obj.edit172:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit172, "fontStyle",  "bold");
    obj.edit172:setFontFamily("kalam");
    obj.edit172:setTransparent(true);

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout138);
    obj.edit173:setField("Pet_Des2");
    obj.edit173:setWidth(140);
    obj.edit173:setHeight(30);
    obj.edit173:setTop(420);
    obj.edit173:setLeft(385);
    obj.edit173:setHorzTextAlign("leading");
    obj.edit173:setName("edit173");
    obj.edit173:setFontColor("black");
    obj.edit173:setFontSize(15);
    obj.edit173:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit173, "fontStyle",  "bold");
    obj.edit173:setFontFamily("kalam");
    obj.edit173:setTransparent(true);

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.layout138);
    obj.image63:setWidth(400);
    obj.image63:setHeight(300);
    obj.image63:setLeft(100);
    obj.image63:setTop(505);
    obj.image63:setSRC("/DZ_Ficha2.0/images/ImgSize_400x300.png");
    obj.image63:setStyle("proportional");
    obj.image63:setEditable(true);
    obj.image63:setShowProgress(true);
    obj.image63:setOptimize(true);
    obj.image63:setField("PetII");
    obj.image63:setName("image63");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle15);
    obj.layout139:setLeft(600);
    obj.layout139:setTop(0);
    obj.layout139:setWidth(600);
    obj.layout139:setHeight(800);
    obj.layout139:setName("layout139");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.layout139);
    obj.image64:setWidth(600);
    obj.image64:setHeight(400);
    obj.image64:setLeft(10);
    obj.image64:setTop(140);
    obj.image64:setStyle("proportional");
    obj.image64:setCenter(true);
    obj.image64:setSRC("/DZ_Ficha2.0/images/FichaPET.png");
    obj.image64:setName("image64");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout139);
    obj.edit174:setField("Pet2_Nick");
    obj.edit174:setWidth(500);
    obj.edit174:setHeight(60);
    obj.edit174:setTop(150);
    obj.edit174:setLeft(100);
    obj.edit174:setFontSize(30);
    obj.edit174:setHorzTextAlign("leading");
    obj.edit174:setName("edit174");
    obj.edit174:setFontColor("#C0504D");
    obj.edit174:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit174, "fontStyle",  "bold");
    obj.edit174:setFontFamily("kalam");
    obj.edit174:setTransparent(true);

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout139);
    obj.edit175:setField("Pet2_Fisico");
    obj.edit175:setWidth(40);
    obj.edit175:setHeight(30);
    obj.edit175:setTop(208);
    obj.edit175:setLeft(180);
    obj.edit175:setName("edit175");
    obj.edit175:setFontColor("#C0504D");
    obj.edit175:setFontSize(15);
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit175, "fontStyle",  "bold");
    obj.edit175:setFontFamily("kalam");
    obj.edit175:setTransparent(true);

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout139);
    obj.edit176:setField("Pet2_Social");
    obj.edit176:setWidth(40);
    obj.edit176:setHeight(30);
    obj.edit176:setTop(240);
    obj.edit176:setLeft(180);
    obj.edit176:setName("edit176");
    obj.edit176:setFontColor("#C0504D");
    obj.edit176:setFontSize(15);
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit176, "fontStyle",  "bold");
    obj.edit176:setFontFamily("kalam");
    obj.edit176:setTransparent(true);

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout139);
    obj.edit177:setField("Pet2_Inteligencia");
    obj.edit177:setWidth(40);
    obj.edit177:setHeight(30);
    obj.edit177:setTop(270);
    obj.edit177:setLeft(180);
    obj.edit177:setName("edit177");
    obj.edit177:setFontColor("#C0504D");
    obj.edit177:setFontSize(15);
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit177, "fontStyle",  "bold");
    obj.edit177:setFontFamily("kalam");
    obj.edit177:setTransparent(true);

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout139);
    obj.edit178:setField("Pet2_Percep");
    obj.edit178:setWidth(40);
    obj.edit178:setHeight(30);
    obj.edit178:setTop(310);
    obj.edit178:setLeft(180);
    obj.edit178:setName("edit178");
    obj.edit178:setFontColor("#C0504D");
    obj.edit178:setFontSize(15);
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit178, "fontStyle",  "bold");
    obj.edit178:setFontFamily("kalam");
    obj.edit178:setTransparent(true);

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout139);
    obj.edit179:setField("Pet2_Espiritual");
    obj.edit179:setWidth(40);
    obj.edit179:setHeight(30);
    obj.edit179:setTop(340);
    obj.edit179:setLeft(180);
    obj.edit179:setName("edit179");
    obj.edit179:setFontColor("#C0504D");
    obj.edit179:setFontSize(15);
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit179, "fontStyle",  "bold");
    obj.edit179:setFontFamily("kalam");
    obj.edit179:setTransparent(true);

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout139);
    obj.edit180:setField("Pet2_Per1");
    obj.edit180:setWidth(40);
    obj.edit180:setHeight(30);
    obj.edit180:setTop(208);
    obj.edit180:setLeft(325);
    obj.edit180:setName("edit180");
    obj.edit180:setFontColor("#C0504D");
    obj.edit180:setFontSize(15);
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit180, "fontStyle",  "bold");
    obj.edit180:setFontFamily("kalam");
    obj.edit180:setTransparent(true);

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout139);
    obj.edit181:setField("Pet2_Per2");
    obj.edit181:setWidth(40);
    obj.edit181:setHeight(30);
    obj.edit181:setTop(240);
    obj.edit181:setLeft(325);
    obj.edit181:setName("edit181");
    obj.edit181:setFontColor("#C0504D");
    obj.edit181:setFontSize(15);
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit181, "fontStyle",  "bold");
    obj.edit181:setFontFamily("kalam");
    obj.edit181:setTransparent(true);

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout139);
    obj.edit182:setField("Pet2_Per3");
    obj.edit182:setWidth(40);
    obj.edit182:setHeight(30);
    obj.edit182:setTop(270);
    obj.edit182:setLeft(325);
    obj.edit182:setName("edit182");
    obj.edit182:setFontColor("#C0504D");
    obj.edit182:setFontSize(15);
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit182, "fontStyle",  "bold");
    obj.edit182:setFontFamily("kalam");
    obj.edit182:setTransparent(true);

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout139);
    obj.edit183:setField("Pet2_Per4");
    obj.edit183:setWidth(40);
    obj.edit183:setHeight(30);
    obj.edit183:setTop(300);
    obj.edit183:setLeft(325);
    obj.edit183:setName("edit183");
    obj.edit183:setFontColor("#C0504D");
    obj.edit183:setFontSize(15);
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit183, "fontStyle",  "bold");
    obj.edit183:setFontFamily("kalam");
    obj.edit183:setTransparent(true);

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout139);
    obj.edit184:setField("Pet2_Per5");
    obj.edit184:setWidth(40);
    obj.edit184:setHeight(30);
    obj.edit184:setTop(330);
    obj.edit184:setLeft(325);
    obj.edit184:setName("edit184");
    obj.edit184:setFontColor("#C0504D");
    obj.edit184:setFontSize(15);
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit184, "fontStyle",  "bold");
    obj.edit184:setFontFamily("kalam");
    obj.edit184:setTransparent(true);

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout139);
    obj.edit185:setField("Pet2_Per6");
    obj.edit185:setWidth(40);
    obj.edit185:setHeight(30);
    obj.edit185:setTop(360);
    obj.edit185:setLeft(325);
    obj.edit185:setName("edit185");
    obj.edit185:setFontColor("#C0504D");
    obj.edit185:setFontSize(15);
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit185, "fontStyle",  "bold");
    obj.edit185:setFontFamily("kalam");
    obj.edit185:setTransparent(true);

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout139);
    obj.edit186:setField("Pet2_Per7");
    obj.edit186:setWidth(40);
    obj.edit186:setHeight(30);
    obj.edit186:setTop(400);
    obj.edit186:setLeft(325);
    obj.edit186:setName("edit186");
    obj.edit186:setFontColor("#C0504D");
    obj.edit186:setFontSize(15);
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit186, "fontStyle",  "bold");
    obj.edit186:setFontFamily("kalam");
    obj.edit186:setTransparent(true);

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout139);
    obj.edit187:setField("Pet2_Saude1");
    obj.edit187:setWidth(40);
    obj.edit187:setHeight(30);
    obj.edit187:setTop(256);
    obj.edit187:setLeft(385);
    obj.edit187:setName("edit187");
    obj.edit187:setFontColor("#C0504D");
    obj.edit187:setFontSize(15);
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit187, "fontStyle",  "bold");
    obj.edit187:setFontFamily("kalam");
    obj.edit187:setTransparent(true);

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout139);
    obj.edit188:setField("Pet2_Saude2");
    obj.edit188:setWidth(40);
    obj.edit188:setHeight(30);
    obj.edit188:setTop(256);
    obj.edit188:setLeft(422);
    obj.edit188:setName("edit188");
    obj.edit188:setFontColor("#C0504D");
    obj.edit188:setFontSize(15);
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit188, "fontStyle",  "bold");
    obj.edit188:setFontFamily("kalam");
    obj.edit188:setTransparent(true);

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout139);
    obj.edit189:setField("Pet2_Saude3");
    obj.edit189:setWidth(40);
    obj.edit189:setHeight(30);
    obj.edit189:setTop(256);
    obj.edit189:setLeft(452);
    obj.edit189:setName("edit189");
    obj.edit189:setFontColor("#C0504D");
    obj.edit189:setFontSize(15);
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit189, "fontStyle",  "bold");
    obj.edit189:setFontFamily("kalam");
    obj.edit189:setTransparent(true);

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout139);
    obj.edit190:setField("Pet2_Iniciativa");
    obj.edit190:setWidth(40);
    obj.edit190:setHeight(30);
    obj.edit190:setTop(325);
    obj.edit190:setLeft(470);
    obj.edit190:setName("edit190");
    obj.edit190:setFontColor("#C0504D");
    obj.edit190:setFontSize(15);
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit190, "fontStyle",  "bold");
    obj.edit190:setFontFamily("kalam");
    obj.edit190:setTransparent(true);

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout139);
    obj.edit191:setField("Pet2_AtkNick");
    obj.edit191:setWidth(200);
    obj.edit191:setHeight(30);
    obj.edit191:setTop(430);
    obj.edit191:setLeft(100);
    obj.edit191:setFontSize(20);
    obj.edit191:setName("edit191");
    obj.edit191:setFontColor("black");
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit191, "fontStyle",  "bold");
    obj.edit191:setFontFamily("kalam");
    obj.edit191:setTransparent(true);

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout139);
    obj.edit192:setField("Pet2_AtkGolpe");
    obj.edit192:setWidth(200);
    obj.edit192:setHeight(30);
    obj.edit192:setTop(458);
    obj.edit192:setLeft(200);
    obj.edit192:setFontColor("gray");
    obj.edit192:setHorzTextAlign("leading");
    obj.edit192:setName("edit192");
    obj.edit192:setFontSize(15);
    obj.edit192:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit192, "fontStyle",  "bold");
    obj.edit192:setFontFamily("kalam");
    obj.edit192:setTransparent(true);

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout139);
    obj.edit193:setField("Pet2_AtkDano");
    obj.edit193:setWidth(40);
    obj.edit193:setHeight(30);
    obj.edit193:setTop(478);
    obj.edit193:setLeft(195);
    obj.edit193:setFontColor("gray");
    obj.edit193:setName("edit193");
    obj.edit193:setFontSize(15);
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit193, "fontStyle",  "bold");
    obj.edit193:setFontFamily("kalam");
    obj.edit193:setTransparent(true);

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout139);
    obj.edit194:setField("Pet2_AtkCD");
    obj.edit194:setWidth(40);
    obj.edit194:setHeight(30);
    obj.edit194:setTop(478);
    obj.edit194:setLeft(270);
    obj.edit194:setName("edit194");
    obj.edit194:setFontColor("#C0504D");
    obj.edit194:setFontSize(15);
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit194, "fontStyle",  "bold");
    obj.edit194:setFontFamily("kalam");
    obj.edit194:setTransparent(true);

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout139);
    obj.edit195:setField("Pet2_Des");
    obj.edit195:setWidth(140);
    obj.edit195:setHeight(30);
    obj.edit195:setTop(400);
    obj.edit195:setLeft(385);
    obj.edit195:setHorzTextAlign("leading");
    obj.edit195:setName("edit195");
    obj.edit195:setFontColor("black");
    obj.edit195:setFontSize(15);
    obj.edit195:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit195, "fontStyle",  "bold");
    obj.edit195:setFontFamily("kalam");
    obj.edit195:setTransparent(true);

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout139);
    obj.edit196:setField("Pet2_Des2");
    obj.edit196:setWidth(140);
    obj.edit196:setHeight(30);
    obj.edit196:setTop(420);
    obj.edit196:setLeft(385);
    obj.edit196:setHorzTextAlign("leading");
    obj.edit196:setName("edit196");
    obj.edit196:setFontColor("black");
    obj.edit196:setFontSize(15);
    obj.edit196:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit196, "fontStyle",  "bold");
    obj.edit196:setFontFamily("kalam");
    obj.edit196:setTransparent(true);

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.layout139);
    obj.image65:setWidth(400);
    obj.image65:setHeight(300);
    obj.image65:setLeft(100);
    obj.image65:setTop(505);
    obj.image65:setSRC("/DZ_Ficha2.0/images/ImgSize_400x300.png");
    obj.image65:setStyle("proportional");
    obj.image65:setEditable(true);
    obj.image65:setShowProgress(true);
    obj.image65:setOptimize(true);
    obj.image65:setField("Pet2II");
    obj.image65:setName("image65");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle1);
    obj.label75:setText("NPC's");
    obj.label75:setWidth(50);
    obj.label75:setHeight(30);
    obj.label75:setTop(310);
    obj.label75:setLeft(1236);
    obj.label75:setFontSize(15);
    obj.label75:setName("label75");
    obj.label75:setFontColor("#000000");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setVertTextAlign("center");
    obj.label75:setFontFamily("kalam");
    obj.label75:setTextTrimming("none");
    obj.label75:setWordWrap(false);
    obj.label75:setAutoSize(true);

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.rectangle1);
    obj.button78:setWidth(100);
    obj.button78:setHeight(100);
    obj.button78:setLeft(1200);
    obj.button78:setTop(330);
    obj.button78:setName("button78");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.rectangle1);
    obj.image66:setWidth(100);
    obj.image66:setHeight(100);
    obj.image66:setLeft(1200);
    obj.image66:setTop(330);
    obj.image66:setStyle("proportional");
    obj.image66:setCenter(true);
    obj.image66:setSRC("/DZ_Ficha2.0/images/NPC.png");
    obj.image66:setName("image66");

    obj.PopNPCfrente = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopNPCfrente:setParent(obj.rectangle1);
    obj.PopNPCfrente:setName("PopNPCfrente");
    obj.PopNPCfrente:setWidth(1340);
    obj.PopNPCfrente:setHeight(620);
    obj.PopNPCfrente:setBackOpacity(0.5);

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.PopNPCfrente);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.frmDZ_NPC_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDZ_NPC_svg:setParent(obj.scrollBox6);
    obj.frmDZ_NPC_svg:setName("frmDZ_NPC_svg");
    obj.frmDZ_NPC_svg:setPadding({left=4, top=4, right=4, bottom=4});
    obj.frmDZ_NPC_svg:setHeight(600);
    obj.frmDZ_NPC_svg:setWidth(1200);
    obj.frmDZ_NPC_svg:setTheme("light");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.frmDZ_NPC_svg);
    obj.layout140:setAlign("top");
    obj.layout140:setHeight(30);
    obj.layout140:setMargins({bottom=4});
    obj.layout140:setName("layout140");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout140);
    obj.button79:setText("Adicionar");
    obj.button79:setWidth(120);
    obj.button79:setAlign("left");
    obj.button79:setName("button79");
    obj.button79:setFontColor("#000000");
    obj.button79:setFontSize(20);
    obj.button79:setHorzTextAlign("center");
    obj.button79:setVertTextAlign("center");
    lfm_setPropAsString(obj.button79, "fontStyle",  "bold");
    obj.button79:setFontFamily("kalam");

    obj.rclListaNPC = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaNPC:setParent(obj.frmDZ_NPC_svg);
    obj.rclListaNPC:setName("rclListaNPC");
    obj.rclListaNPC:setField("ListagemNPC");
    obj.rclListaNPC:setTemplateForm("frmListaNPC");
    obj.rclListaNPC:setAlign("client");
    obj.rclListaNPC:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.frmDZ_NPC_svg);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(900);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.boxDetalhesDoItem);
    obj.rectangle16:setWidth(900);
    obj.rectangle16:setHeight(600);
    obj.rectangle16:setColor("Transparent");
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setName("rectangle16");

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.rectangle16);
    obj.image67:setLeft(0);
    obj.image67:setTop(0);
    obj.image67:setWidth(600);
    obj.image67:setHeight(600);
    obj.image67:setSRC("/DZ_Ficha2.0/images/FichaNPC.png");
    obj.image67:setStyle("proportional");
    obj.image67:setOptimize(true);
    obj.image67:setAlign("left");
    obj.image67:setName("image67");

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.rectangle16);
    obj.image68:setWidth(300);
    obj.image68:setHeight(600);
    obj.image68:setSRC("/DZ_Ficha2.0/images/silhu.png");
    obj.image68:setStyle("proportional");
    obj.image68:setEditable(true);
    obj.image68:setShowProgress(true);
    obj.image68:setOptimize(true);
    obj.image68:setHint("O ideal é: 300x600 em png");
    obj.image68:setAlign("right");
    obj.image68:setField("NpcII");
    obj.image68:setName("image68");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.rectangle16);
    obj.edit197:setTransparent(true);
    obj.edit197:setFontSize(28);
    obj.edit197:setLeft(125);
    obj.edit197:setTop(20);
    obj.edit197:setWidth(300);
    obj.edit197:setHeight(50);
    obj.edit197:setField("NPC_nick");
    obj.edit197:setHorzTextAlign("leading");
    obj.edit197:setVertTextAlign("leading");
    obj.edit197:setName("edit197");
    obj.edit197:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit197, "fontStyle",  "bold");
    obj.edit197:setFontFamily("kalam");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.rectangle16);
    obj.edit198:setTransparent(true);
    obj.edit198:setFontSize(30);
    obj.edit198:setLeft(500);
    obj.edit198:setTop(20);
    obj.edit198:setWidth(50);
    obj.edit198:setHeight(50);
    obj.edit198:setField("NPC_idade");
    obj.edit198:setHorzTextAlign("leading");
    obj.edit198:setVertTextAlign("leading");
    obj.edit198:setName("edit198");
    obj.edit198:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit198, "fontStyle",  "bold");
    obj.edit198:setFontFamily("kalam");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.rectangle16);
    obj.edit199:setTransparent(true);
    obj.edit199:setLeft(146);
    obj.edit199:setTop(80);
    obj.edit199:setWidth(25);
    obj.edit199:setHeight(30);
    obj.edit199:setField("NPC_fisico");
    obj.edit199:setVertTextAlign("leading");
    obj.edit199:setName("edit199");
    obj.edit199:setFontColor("#C0504D");
    obj.edit199:setFontSize(15);
    obj.edit199:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit199, "fontStyle",  "bold");
    obj.edit199:setFontFamily("kalam");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.rectangle16);
    obj.edit200:setTransparent(true);
    obj.edit200:setLeft(146);
    obj.edit200:setTop(105);
    obj.edit200:setWidth(25);
    obj.edit200:setHeight(30);
    obj.edit200:setField("NPC_social");
    obj.edit200:setVertTextAlign("leading");
    obj.edit200:setName("edit200");
    obj.edit200:setFontColor("#C0504D");
    obj.edit200:setFontSize(15);
    obj.edit200:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit200, "fontStyle",  "bold");
    obj.edit200:setFontFamily("kalam");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.rectangle16);
    obj.edit201:setTransparent(true);
    obj.edit201:setLeft(146);
    obj.edit201:setTop(130);
    obj.edit201:setWidth(25);
    obj.edit201:setHeight(30);
    obj.edit201:setField("NPC_mental");
    obj.edit201:setVertTextAlign("leading");
    obj.edit201:setName("edit201");
    obj.edit201:setFontColor("#C0504D");
    obj.edit201:setFontSize(15);
    obj.edit201:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit201, "fontStyle",  "bold");
    obj.edit201:setFontFamily("kalam");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.rectangle16);
    obj.edit202:setTransparent(true);
    obj.edit202:setLeft(146);
    obj.edit202:setTop(155);
    obj.edit202:setWidth(25);
    obj.edit202:setHeight(30);
    obj.edit202:setField("NPC_espiritual");
    obj.edit202:setVertTextAlign("leading");
    obj.edit202:setName("edit202");
    obj.edit202:setFontColor("#C0504D");
    obj.edit202:setFontSize(15);
    obj.edit202:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit202, "fontStyle",  "bold");
    obj.edit202:setFontFamily("kalam");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.rectangle16);
    obj.edit203:setTransparent(true);
    obj.edit203:setLeft(275);
    obj.edit203:setTop(75);
    obj.edit203:setWidth(25);
    obj.edit203:setHeight(30);
    obj.edit203:setField("NPC_P1");
    obj.edit203:setVertTextAlign("leading");
    obj.edit203:setName("edit203");
    obj.edit203:setFontColor("#C0504D");
    obj.edit203:setFontSize(15);
    obj.edit203:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit203, "fontStyle",  "bold");
    obj.edit203:setFontFamily("kalam");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.rectangle16);
    obj.edit204:setTransparent(true);
    obj.edit204:setLeft(275);
    obj.edit204:setTop(96);
    obj.edit204:setWidth(25);
    obj.edit204:setHeight(30);
    obj.edit204:setField("NPC_P2");
    obj.edit204:setVertTextAlign("leading");
    obj.edit204:setName("edit204");
    obj.edit204:setFontColor("#C0504D");
    obj.edit204:setFontSize(15);
    obj.edit204:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit204, "fontStyle",  "bold");
    obj.edit204:setFontFamily("kalam");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.rectangle16);
    obj.edit205:setTransparent(true);
    obj.edit205:setLeft(275);
    obj.edit205:setTop(117);
    obj.edit205:setWidth(25);
    obj.edit205:setHeight(30);
    obj.edit205:setField("NPC_P3");
    obj.edit205:setVertTextAlign("leading");
    obj.edit205:setName("edit205");
    obj.edit205:setFontColor("#C0504D");
    obj.edit205:setFontSize(15);
    obj.edit205:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit205, "fontStyle",  "bold");
    obj.edit205:setFontFamily("kalam");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.rectangle16);
    obj.edit206:setTransparent(true);
    obj.edit206:setLeft(275);
    obj.edit206:setTop(138);
    obj.edit206:setWidth(25);
    obj.edit206:setHeight(30);
    obj.edit206:setField("NPC_P4");
    obj.edit206:setVertTextAlign("leading");
    obj.edit206:setName("edit206");
    obj.edit206:setFontColor("#C0504D");
    obj.edit206:setFontSize(15);
    obj.edit206:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit206, "fontStyle",  "bold");
    obj.edit206:setFontFamily("kalam");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.rectangle16);
    obj.edit207:setTransparent(true);
    obj.edit207:setLeft(275);
    obj.edit207:setTop(159);
    obj.edit207:setWidth(25);
    obj.edit207:setHeight(30);
    obj.edit207:setField("NPC_P5");
    obj.edit207:setVertTextAlign("leading");
    obj.edit207:setName("edit207");
    obj.edit207:setFontColor("#C0504D");
    obj.edit207:setFontSize(15);
    obj.edit207:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit207, "fontStyle",  "bold");
    obj.edit207:setFontFamily("kalam");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.rectangle16);
    obj.edit208:setTransparent(true);
    obj.edit208:setLeft(275);
    obj.edit208:setTop(182);
    obj.edit208:setWidth(25);
    obj.edit208:setHeight(30);
    obj.edit208:setField("NPC_P6");
    obj.edit208:setVertTextAlign("leading");
    obj.edit208:setName("edit208");
    obj.edit208:setFontColor("#C0504D");
    obj.edit208:setFontSize(15);
    obj.edit208:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit208, "fontStyle",  "bold");
    obj.edit208:setFontFamily("kalam");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.rectangle16);
    obj.edit209:setTransparent(true);
    obj.edit209:setLeft(275);
    obj.edit209:setTop(205);
    obj.edit209:setWidth(25);
    obj.edit209:setHeight(30);
    obj.edit209:setField("NPC_P7");
    obj.edit209:setVertTextAlign("leading");
    obj.edit209:setName("edit209");
    obj.edit209:setFontColor("#C0504D");
    obj.edit209:setFontSize(15);
    obj.edit209:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit209, "fontStyle",  "bold");
    obj.edit209:setFontFamily("kalam");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.rectangle16);
    obj.edit210:setTransparent(true);
    obj.edit210:setLeft(275);
    obj.edit210:setTop(225);
    obj.edit210:setWidth(25);
    obj.edit210:setHeight(30);
    obj.edit210:setField("NPC_P8");
    obj.edit210:setVertTextAlign("leading");
    obj.edit210:setName("edit210");
    obj.edit210:setFontColor("#C0504D");
    obj.edit210:setFontSize(15);
    obj.edit210:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit210, "fontStyle",  "bold");
    obj.edit210:setFontFamily("kalam");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.rectangle16);
    obj.edit211:setTransparent(true);
    obj.edit211:setLeft(275);
    obj.edit211:setTop(250);
    obj.edit211:setWidth(25);
    obj.edit211:setHeight(30);
    obj.edit211:setField("NPC_P9");
    obj.edit211:setVertTextAlign("leading");
    obj.edit211:setName("edit211");
    obj.edit211:setFontColor("#C0504D");
    obj.edit211:setFontSize(15);
    obj.edit211:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit211, "fontStyle",  "bold");
    obj.edit211:setFontFamily("kalam");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.rectangle16);
    obj.edit212:setTransparent(true);
    obj.edit212:setLeft(275);
    obj.edit212:setTop(275);
    obj.edit212:setWidth(25);
    obj.edit212:setHeight(30);
    obj.edit212:setField("NPC_P10");
    obj.edit212:setVertTextAlign("leading");
    obj.edit212:setName("edit212");
    obj.edit212:setFontColor("#C0504D");
    obj.edit212:setFontSize(15);
    obj.edit212:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit212, "fontStyle",  "bold");
    obj.edit212:setFontFamily("kalam");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.rectangle16);
    obj.edit213:setTransparent(true);
    obj.edit213:setLeft(315);
    obj.edit213:setTop(100);
    obj.edit213:setWidth(25);
    obj.edit213:setHeight(30);
    obj.edit213:setField("NPC_Saude1");
    obj.edit213:setVertTextAlign("leading");
    obj.edit213:setName("edit213");
    obj.edit213:setFontColor("#C0504D");
    obj.edit213:setFontSize(15);
    obj.edit213:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit213, "fontStyle",  "bold");
    obj.edit213:setFontFamily("kalam");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.rectangle16);
    obj.edit214:setTransparent(true);
    obj.edit214:setLeft(340);
    obj.edit214:setTop(100);
    obj.edit214:setWidth(25);
    obj.edit214:setHeight(30);
    obj.edit214:setField("NPC_Saude2");
    obj.edit214:setVertTextAlign("leading");
    obj.edit214:setName("edit214");
    obj.edit214:setFontColor("#C0504D");
    obj.edit214:setFontSize(15);
    obj.edit214:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit214, "fontStyle",  "bold");
    obj.edit214:setFontFamily("kalam");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.rectangle16);
    obj.edit215:setTransparent(true);
    obj.edit215:setLeft(365);
    obj.edit215:setTop(100);
    obj.edit215:setWidth(25);
    obj.edit215:setHeight(30);
    obj.edit215:setField("NPC_Saude3");
    obj.edit215:setVertTextAlign("leading");
    obj.edit215:setName("edit215");
    obj.edit215:setFontColor("#C0504D");
    obj.edit215:setFontSize(15);
    obj.edit215:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit215, "fontStyle",  "bold");
    obj.edit215:setFontFamily("kalam");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.rectangle16);
    obj.edit216:setTransparent(true);
    obj.edit216:setLeft(508);
    obj.edit216:setTop(74);
    obj.edit216:setWidth(25);
    obj.edit216:setHeight(30);
    obj.edit216:setField("NPC_Moralidade");
    obj.edit216:setVertTextAlign("leading");
    obj.edit216:setName("edit216");
    obj.edit216:setFontColor("#C0504D");
    obj.edit216:setFontSize(15);
    obj.edit216:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit216, "fontStyle",  "bold");
    obj.edit216:setFontFamily("kalam");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle16);
    obj.comboBox2:setLeft(420);
    obj.comboBox2:setTop(100);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("NPC_MoralidadeS");
    obj.comboBox2:setItems({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', 'Santo'});
    obj.comboBox2:setValues({'Se', 'Eg', 'Mo', 'Ho', 'Sa'});
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontColor("#C0504D");
    obj.comboBox2:setFontSize(15);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setVertTextAlign("center");
    lfm_setPropAsString(obj.comboBox2, "fontStyle",  "bold");
    obj.comboBox2:setFontFamily("kalam");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.rectangle16);
    obj.edit217:setTransparent(true);
    obj.edit217:setLeft(128);
    obj.edit217:setTop(218);
    obj.edit217:setWidth(25);
    obj.edit217:setHeight(30);
    obj.edit217:setField("NPC_Iniciativa");
    obj.edit217:setVertTextAlign("leading");
    obj.edit217:setName("edit217");
    obj.edit217:setFontColor("#C0504D");
    obj.edit217:setFontSize(15);
    obj.edit217:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit217, "fontStyle",  "bold");
    obj.edit217:setFontFamily("kalam");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.rectangle16);
    obj.edit218:setTransparent(true);
    obj.edit218:setLeft(128);
    obj.edit218:setTop(251);
    obj.edit218:setWidth(25);
    obj.edit218:setHeight(30);
    obj.edit218:setField("NPC_Imunidade");
    obj.edit218:setVertTextAlign("leading");
    obj.edit218:setName("edit218");
    obj.edit218:setFontColor("#C0504D");
    obj.edit218:setFontSize(15);
    obj.edit218:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit218, "fontStyle",  "bold");
    obj.edit218:setFontFamily("kalam");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.rectangle16);
    obj.edit219:setTransparent(true);
    obj.edit219:setLeft(100);
    obj.edit219:setTop(290);
    obj.edit219:setWidth(25);
    obj.edit219:setHeight(30);
    obj.edit219:setField("NPC_ATK");
    obj.edit219:setVertTextAlign("leading");
    obj.edit219:setName("edit219");
    obj.edit219:setFontColor("#C0504D");
    obj.edit219:setFontSize(15);
    obj.edit219:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit219, "fontStyle",  "bold");
    obj.edit219:setFontFamily("kalam");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.rectangle16);
    obj.edit220:setTransparent(true);
    obj.edit220:setLeft(55);
    obj.edit220:setTop(315);
    obj.edit220:setWidth(25);
    obj.edit220:setHeight(30);
    obj.edit220:setField("NPC_ATK1");
    obj.edit220:setVertTextAlign("leading");
    obj.edit220:setName("edit220");
    obj.edit220:setFontColor("#C0504D");
    obj.edit220:setFontSize(15);
    obj.edit220:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit220, "fontStyle",  "bold");
    obj.edit220:setFontFamily("kalam");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.rectangle16);
    obj.edit221:setTransparent(true);
    obj.edit221:setLeft(125);
    obj.edit221:setTop(315);
    obj.edit221:setWidth(25);
    obj.edit221:setHeight(30);
    obj.edit221:setField("NPC_ATK2");
    obj.edit221:setVertTextAlign("leading");
    obj.edit221:setName("edit221");
    obj.edit221:setFontColor("#C0504D");
    obj.edit221:setFontSize(15);
    obj.edit221:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit221, "fontStyle",  "bold");
    obj.edit221:setFontFamily("kalam");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.rectangle16);
    obj.edit222:setTransparent(true);
    obj.edit222:setLeft(190);
    obj.edit222:setTop(315);
    obj.edit222:setWidth(25);
    obj.edit222:setHeight(30);
    obj.edit222:setField("NPC_ATK3");
    obj.edit222:setVertTextAlign("leading");
    obj.edit222:setName("edit222");
    obj.edit222:setFontColor("#C0504D");
    obj.edit222:setFontSize(15);
    obj.edit222:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit222, "fontStyle",  "bold");
    obj.edit222:setFontFamily("kalam");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.rectangle16);
    obj.edit223:setTransparent(true);
    obj.edit223:setLeft(185);
    obj.edit223:setTop(420);
    obj.edit223:setWidth(25);
    obj.edit223:setHeight(30);
    obj.edit223:setField("NPC_DEF");
    obj.edit223:setVertTextAlign("leading");
    obj.edit223:setName("edit223");
    obj.edit223:setFontColor("#C0504D");
    obj.edit223:setFontSize(15);
    obj.edit223:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit223, "fontStyle",  "bold");
    obj.edit223:setFontFamily("kalam");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.rectangle16);
    obj.edit224:setTransparent(true);
    obj.edit224:setLeft(55);
    obj.edit224:setTop(445);
    obj.edit224:setWidth(25);
    obj.edit224:setHeight(30);
    obj.edit224:setField("NPC_DEF1");
    obj.edit224:setVertTextAlign("leading");
    obj.edit224:setName("edit224");
    obj.edit224:setFontColor("#C0504D");
    obj.edit224:setFontSize(15);
    obj.edit224:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit224, "fontStyle",  "bold");
    obj.edit224:setFontFamily("kalam");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.rectangle16);
    obj.edit225:setTransparent(true);
    obj.edit225:setLeft(125);
    obj.edit225:setTop(445);
    obj.edit225:setWidth(25);
    obj.edit225:setHeight(30);
    obj.edit225:setField("NPC_DEF2");
    obj.edit225:setVertTextAlign("leading");
    obj.edit225:setName("edit225");
    obj.edit225:setFontColor("#C0504D");
    obj.edit225:setFontSize(15);
    obj.edit225:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit225, "fontStyle",  "bold");
    obj.edit225:setFontFamily("kalam");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.rectangle16);
    obj.edit226:setTransparent(true);
    obj.edit226:setLeft(190);
    obj.edit226:setTop(445);
    obj.edit226:setWidth(25);
    obj.edit226:setHeight(30);
    obj.edit226:setField("NPC_DEF3");
    obj.edit226:setVertTextAlign("leading");
    obj.edit226:setName("edit226");
    obj.edit226:setFontColor("#C0504D");
    obj.edit226:setFontSize(15);
    obj.edit226:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit226, "fontStyle",  "bold");
    obj.edit226:setFontFamily("kalam");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle16);
    obj.layout141:setLeft(40);
    obj.layout141:setTop(350);
    obj.layout141:setWidth(200);
    obj.layout141:setHeight(75);
    obj.layout141:setName("layout141");

    obj.NPC_DescATK = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescATK:setParent(obj.layout141);
    obj.NPC_DescATK:setName("NPC_DescATK");
    obj.NPC_DescATK:setFontFamily("kalam");
    obj.NPC_DescATK:setWidth(200);
    obj.NPC_DescATK:setHeight(75);
    obj.NPC_DescATK:setFontSize(13);
    obj.NPC_DescATK:setFontColor("#548DD4");
    obj.NPC_DescATK:setField("NPC_DescATK");
    obj.NPC_DescATK:setTransparent(true);

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle16);
    obj.layout142:setLeft(40);
    obj.layout142:setTop(480);
    obj.layout142:setWidth(220);
    obj.layout142:setHeight(60);
    obj.layout142:setName("layout142");

    obj.NPC_DescDEF = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescDEF:setParent(obj.layout142);
    obj.NPC_DescDEF:setName("NPC_DescDEF");
    obj.NPC_DescDEF:setFontFamily("kalam");
    obj.NPC_DescDEF:setWidth(220);
    obj.NPC_DescDEF:setHeight(60);
    obj.NPC_DescDEF:setFontSize(13);
    obj.NPC_DescDEF:setFontColor("#548DD4");
    obj.NPC_DescDEF:setField("NPC_DescDEF");
    obj.NPC_DescDEF:setTransparent(true);

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle16);
    obj.layout143:setLeft(315);
    obj.layout143:setTop(159);
    obj.layout143:setWidth(230);
    obj.layout143:setHeight(150);
    obj.layout143:setName("layout143");

    obj.NPC_Equip = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Equip:setParent(obj.layout143);
    obj.NPC_Equip:setName("NPC_Equip");
    obj.NPC_Equip:setFontFamily("kalam");
    obj.NPC_Equip:setWidth(230);
    obj.NPC_Equip:setHeight(150);
    obj.NPC_Equip:setFontSize(13);
    obj.NPC_Equip:setFontColor("#548DD4");
    obj.NPC_Equip:setField("NPC_Equip");
    obj.NPC_Equip:setTransparent(true);

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle16);
    obj.layout144:setLeft(275);
    obj.layout144:setTop(355);
    obj.layout144:setWidth(250);
    obj.layout144:setHeight(1800);
    obj.layout144:setName("layout144");

    obj.NPC_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Circunstancia:setParent(obj.layout144);
    obj.NPC_Circunstancia:setName("NPC_Circunstancia");
    obj.NPC_Circunstancia:setFontFamily("kalam");
    obj.NPC_Circunstancia:setWidth(250);
    obj.NPC_Circunstancia:setHeight(180);
    obj.NPC_Circunstancia:setFontSize(13);
    obj.NPC_Circunstancia:setFontColor("#548DD4");
    obj.NPC_Circunstancia:setField("NPC_Circunstancia");
    obj.NPC_Circunstancia:setTransparent(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.FOR); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.DES); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Destreza de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.PRE); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Presença de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.TAT); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Tato de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.PER); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Percepção de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.INT); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Inteligencia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.DET); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Determinação de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.SOR); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Iniciativa = (tonumber(sheet.DES) or 0) + (tonumber(sheet.PER) or 0);
        end, obj);

    obj._e_event9 = obj.button9:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Iniciativa); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K14]Iniciativa de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event10 = obj.button10:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Moralidade); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K14][ Moralidade ] [§T][§T][§B][§K6]"..sheet.StatusMoralidade.. "[§B][§K14] " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Saude_Base = (tonumber(sheet.FOR) or 0) + (tonumber(sheet.SOR) or 0);
        end, obj);

    obj._e_event12 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Saude_Total = (tonumber(sheet.Saude_Base) or 0) + (tonumber(sheet.Saude_Extra) or 0);
        end, obj);

    obj._e_event13 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Lesionado = (tonumber(sheet.Saude_Total) or 0) / 3;
            						sheet.Machucado = (tonumber(sheet.Saude_Total) or 0) / 3;
            						sheet.Ferido = (tonumber(sheet.Saude_Total) or 0) / 3;
        end, obj);

    obj._e_event14 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Resistencia = ((tonumber(sheet.FOR) or 0)*(-1));
        end, obj);

    obj._e_event15 = obj.button11:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri01); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Manusear Animais de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event16 = obj.button12:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri02); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Atletismo de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event17 = obj.button13:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri03); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Liderança de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event18 = obj.button14:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri04); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Construção "..sheet.Construcao.." "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event19 = obj.button15:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri05); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Enganar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event20 = obj.button16:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri06); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Dedução de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event21 = obj.button17:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri07); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Diplomacia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event22 = obj.button18:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);			
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri08); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Esquiva de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event23 = obj.button19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri09); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Doméstico de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event24 = obj.button20:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri10); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Briga de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event25 = obj.button21:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri11); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Intimidação de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event26 = obj.button22:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri12); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Conhecimento Geral de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event27 = obj.button23:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);			
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri13); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Idioma "..sheet.Idiomas.." de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event28 = obj.button24:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri14); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Arma branca de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event29 = obj.button25:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri15); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Arma de fogo de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event30 = obj.button26:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri16); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Estratégia militar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event31 = obj.button27:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri17); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Observar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event32 = obj.button28:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri18); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Performance de "..sheet.Performance.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event33 = obj.button29:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri19); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Pilotagem de "..sheet.Pilotagem.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event34 = obj.button30:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri20); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Condução de "..sheet.Conducao.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event35 = obj.button31:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri21); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Manha de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event36 = obj.button32:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri22); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Furtar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event37 = obj.button33:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri23); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Furtividade de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event38 = obj.button34:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri24); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Sobrevivencia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event39 = obj.button35:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri25); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Medicina de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event40 = obj.button36:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri26); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Cavalgar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event41 = obj.button37:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri27); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa1); end;
        end, obj);

    obj._e_event42 = obj.button38:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri28); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa2); end;
        end, obj);

    obj._e_event43 = obj.button39:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri29); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa3); end;
        end, obj);

    obj._e_event44 = obj.button40:addEventListener("onClick",
        function (_)
            self.DescCircunstancia1:show('bottom', self.labNome);
        end, obj);

    obj._e_event45 = obj.button41:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_1); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event46 = obj.button42:addEventListener("onClick",
        function (_)
            self.DescCircunstancia2:show('bottom', self.labNome);
        end, obj);

    obj._e_event47 = obj.button43:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_2); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event48 = obj.button44:addEventListener("onClick",
        function (_)
            self.DescCircunstancia3:show('bottom', self.labNome);
        end, obj);

    obj._e_event49 = obj.button45:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_3); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event50 = obj.button46:addEventListener("onClick",
        function (_)
            self.DescCircunstancia4:show('bottom', self.labNome);
        end, obj);

    obj._e_event51 = obj.button47:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_4); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de"..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event52 = obj.button48:addEventListener("onClick",
        function (_)
            self.DescCircunstancia5:show('bottom', self.labNome);
        end, obj);

    obj._e_event53 = obj.button49:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_5); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event54 = obj.button50:addEventListener("onClick",
        function (_)
            self.DescCircunstancia6:show('bottom', self.labNome);
        end, obj);

    obj._e_event55 = obj.button51:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_6); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event56 = obj.button52:addEventListener("onClick",
        function (_)
            self.DescCircunstancia7:show('bottom', self.labNome);
        end, obj);

    obj._e_event57 = obj.button53:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_7); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event58 = obj.button54:addEventListener("onClick",
        function (_)
            self.DescCircunstancia8:show('bottom', self.labNome);
        end, obj);

    obj._e_event59 = obj.button55:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_8); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event60 = obj.button56:addEventListener("onClick",
        function (_)
            self.DescCircunstancia9:show('bottom', self.labNome);
        end, obj);

    obj._e_event61 = obj.button57:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_9); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event62 = obj.button58:addEventListener("onClick",
        function (_)
            self.DescCircunstancia10:show('bottom', self.labNome);
        end, obj);

    obj._e_event63 = obj.button59:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_10); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event64 = obj.button60:addEventListener("onClick",
        function (_)
            self.DescVanDes1:show('bottom', self.labNome);
        end, obj);

    obj._e_event65 = obj.button61:addEventListener("onClick",
        function (_)
            self.DescVanDes2:show('bottom', self.labNome);
        end, obj);

    obj._e_event66 = obj.button62:addEventListener("onClick",
        function (_)
            self.DescVanDes3:show('bottom', self.labNome);
        end, obj);

    obj._e_event67 = obj.button63:addEventListener("onClick",
        function (_)
            self.DescVanDes4:show('bottom', self.labNome);
        end, obj);

    obj._e_event68 = obj.button64:addEventListener("onClick",
        function (_)
            self.DescVanDes5:show('bottom', self.labNome);
        end, obj);

    obj._e_event69 = obj.button65:addEventListener("onClick",
        function (_)
            self.DescVanDes6:show('bottom', self.labNome);
        end, obj);

    obj._e_event70 = obj.button66:addEventListener("onClick",
        function (_)
            self.DescVanDes7:show('bottom', self.labNome);
        end, obj);

    obj._e_event71 = obj.button67:addEventListener("onClick",
        function (_)
            self.DescVanDes8:show('bottom', self.labNome);
        end, obj);

    obj._e_event72 = obj.button68:addEventListener("onClick",
        function (_)
            self.DescVanDes9:show('bottom', self.labNome);
        end, obj);

    obj._e_event73 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Exp_nUtil = (tonumber(sheet.XP_t) or 0) - (tonumber(sheet.XP_t_gasta) or 0);
        end, obj);

    obj._e_event74 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.XP_t_gasta = (tonumber(sheet.Satts) or 0) + (tonumber(sheet.Sper) or 0) + (tonumber(sheet.Scir) or 0) + (tonumber(sheet.XP_Gasto_Adicional) or 0) + (tonumber(sheet.Svan) or 0) + (tonumber(sheet.ExpMoralidadeG) or 0) + ((tonumber(sheet.Saude_Extra) or 0)*2);
        end, obj);

    obj._e_event75 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ExpSaudeExtra = ((tonumber(sheet.Saude_Extra) or 0)*2);
        end, obj);

    obj._e_event76 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.XP_t = (tonumber(sheet.XPInicial) or 0) + (tonumber(sheet.XPS1) or 0) + (tonumber(sheet.XPS2) or 0) + (tonumber(sheet.XPS3) or 0) + (tonumber(sheet.XPS4) or 0) + (tonumber(sheet.XPS5) or 0) + (tonumber(sheet.XPS6) or 0) + (tonumber(sheet.XPS7) or 0) + (tonumber(sheet.XPS8) or 0) + (tonumber(sheet.XPS9) or 0) + (tonumber(sheet.XPS10) or 0) + (tonumber(sheet.ExpExtraGanha) or 0);
        end, obj);

    obj._e_event77 = obj.button69:addEventListener("onClick",
        function (_)
            self.PopExp:show('bottom', self.labNome);
        end, obj);

    obj._e_event78 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Sper = (tonumber(sheet.Peri01) or 0) + (tonumber(sheet.Peri02) or 0) + (tonumber(sheet.Peri03) or 0) + (tonumber(sheet.Peri04) or 0) + (tonumber(sheet.Peri05) or 0) + (tonumber(sheet.Peri06) or 0) + (tonumber(sheet.Peri07) or 0) + (tonumber(sheet.Peri08) or 0) + (tonumber(sheet.Peri09) or 0) + (tonumber(sheet.Peri10) or 0) + (tonumber(sheet.Peri11) or 0) + (tonumber(sheet.Peri12) or 0) + (tonumber(sheet.Peri13) or 0) + (tonumber(sheet.Peri14) or 0) + (tonumber(sheet.Peri15) or 0) + (tonumber(sheet.Peri16) or 0) + (tonumber(sheet.Peri17) or 0) + (tonumber(sheet.Peri18) or 0) + (tonumber(sheet.Peri19) or 0) + (tonumber(sheet.Peri20) or 0) + (tonumber(sheet.Peri21) or 0) + (tonumber(sheet.Peri22) or 0) + (tonumber(sheet.Peri23) or 0) + (tonumber(sheet.Peri24) or 0) + (tonumber(sheet.Peri25) or 0) + (tonumber(sheet.Peri26) or 0) + (tonumber(sheet.Peri27) or 0) + (tonumber(sheet.Peri28) or 0) + (tonumber(sheet.Peri29) or 0);
        end, obj);

    obj._e_event79 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Scir = ((tonumber(sheet.CircXP_1) or 0) + (tonumber(sheet.CircXP_2) or 0) + (tonumber(sheet.CircXP_3) or 0) + (tonumber(sheet.CircXP_4) or 0) + (tonumber(sheet.CircXP_5) or 0) + (tonumber(sheet.CircXP_6) or 0) + (tonumber(sheet.CircXP_7) or 0) + (tonumber(sheet.CircXP_8) or 0) + (tonumber(sheet.CircXP_9) or 0) + (tonumber(sheet.CircXP_10) or 0))*2;
        end, obj);

    obj._e_event80 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Svan = (tonumber(sheet.VeD_01) or 0) + (tonumber(sheet.VeD_02) or 0) +(tonumber(sheet.VeD_03) or 0) +(tonumber(sheet.VeD_04) or 0) +(tonumber(sheet.VeD_05) or 0) +(tonumber(sheet.VeD_06) or 0) +(tonumber(sheet.VeD_07) or 0) +(tonumber(sheet.VeD_08) or 0) +(tonumber(sheet.VeD_09) or 0);
        end, obj);

    obj._e_event81 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Satts = ((tonumber(sheet.FOR) or 0) + (tonumber(sheet.DES) or 0) + (tonumber(sheet.PRE) or 0) + (tonumber(sheet.TAT) or 0) + (tonumber(sheet.PER) or 0) + (tonumber(sheet.INT) or 0) + (tonumber(sheet.DET) or 0) + (tonumber(sheet.SOR) or 0)) * 4 ;
        end, obj);

    obj._e_event82 = obj.button70:addEventListener("onClick",
        function (_)
            self.rclAtaque:append(); 
        end, obj);

    obj._e_event83 = obj.button71:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_TorsoA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_TorsoB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event84 = obj.button72:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_CabecaA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_CabecaB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event85 = obj.button73:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_OutroA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_OutroB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event86 = obj.button74:addEventListener("onClick",
        function (_)
            self.PopInventario:show('bottom', self.labNome);
        end, obj);

    obj._e_event87 = obj.button75:addEventListener("onClick",
        function (_)
            self.rclEquip:append();
        end, obj);

    obj._e_event88 = obj.button76:addEventListener("onClick",
        function (_)
            self.PopCar:show('bottom', self.labNome);
        end, obj);

    obj._e_event89 = obj.button77:addEventListener("onClick",
        function (_)
            self.PopAnimal:show('bottom', self.labNome);
        end, obj);

    obj._e_event90 = obj.button78:addEventListener("onClick",
        function (_)
            self.PopNPCfrente:show('bottom', self.labNome);
        end, obj);

    obj._e_event91 = obj.button79:addEventListener("onClick",
        function (_)
            self.rclListaNPC:append();
        end, obj);

    obj._e_event92 = obj.rclListaNPC:addEventListener("onSelect",
        function (_)
            local node = self.rclListaNPC.selectedNode; 
                                     self.boxDetalhesDoItem.node = node;                       
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.DescCircunstancia4 ~= nil then self.DescCircunstancia4:destroy(); self.DescCircunstancia4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.NPC_Circunstancia ~= nil then self.NPC_Circunstancia:destroy(); self.NPC_Circunstancia = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.frmAnimal ~= nil then self.frmAnimal:destroy(); self.frmAnimal = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.NPC_DescDEF ~= nil then self.NPC_DescDEF:destroy(); self.NPC_DescDEF = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.DescVanDes4 ~= nil then self.DescVanDes4:destroy(); self.DescVanDes4 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.DescCircunstancia8 ~= nil then self.DescCircunstancia8:destroy(); self.DescCircunstancia8 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.DescVanDes3 ~= nil then self.DescVanDes3:destroy(); self.DescVanDes3 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.DescVanDes2 ~= nil then self.DescVanDes2:destroy(); self.DescVanDes2 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.PopNPCfrente ~= nil then self.PopNPCfrente:destroy(); self.PopNPCfrente = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.DescCircunstancia7 ~= nil then self.DescCircunstancia7:destroy(); self.DescCircunstancia7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.DescCircunstancia3 ~= nil then self.DescCircunstancia3:destroy(); self.DescCircunstancia3 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.Conducao2_Circunstancia ~= nil then self.Conducao2_Circunstancia:destroy(); self.Conducao2_Circunstancia = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.DescVanDes5 ~= nil then self.DescVanDes5:destroy(); self.DescVanDes5 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.rclListaNPC ~= nil then self.rclListaNPC:destroy(); self.rclListaNPC = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.DescVanDes1 ~= nil then self.DescVanDes1:destroy(); self.DescVanDes1 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.DescVanDes6 ~= nil then self.DescVanDes6:destroy(); self.DescVanDes6 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.rclEquip ~= nil then self.rclEquip:destroy(); self.rclEquip = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.DescCircunstancia10 ~= nil then self.DescCircunstancia10:destroy(); self.DescCircunstancia10 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.DescCircunstancia9 ~= nil then self.DescCircunstancia9:destroy(); self.DescCircunstancia9 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.DescCircunstancia6 ~= nil then self.DescCircunstancia6:destroy(); self.DescCircunstancia6 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.frmCAR ~= nil then self.frmCAR:destroy(); self.frmCAR = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.Conducao_Circunstancia ~= nil then self.Conducao_Circunstancia:destroy(); self.Conducao_Circunstancia = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.DescVanDes9 ~= nil then self.DescVanDes9:destroy(); self.DescVanDes9 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rclAtaque ~= nil then self.rclAtaque:destroy(); self.rclAtaque = nil; end;
        if self.DescCircunstancia2 ~= nil then self.DescCircunstancia2:destroy(); self.DescCircunstancia2 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.NPC_Equip ~= nil then self.NPC_Equip:destroy(); self.NPC_Equip = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.PopCar ~= nil then self.PopCar:destroy(); self.PopCar = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.DescVanDes7 ~= nil then self.DescVanDes7:destroy(); self.DescVanDes7 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.DescCircunstancia5 ~= nil then self.DescCircunstancia5:destroy(); self.DescCircunstancia5 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.PopAnimal ~= nil then self.PopAnimal:destroy(); self.PopAnimal = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.DescCircunstancia1 ~= nil then self.DescCircunstancia1:destroy(); self.DescCircunstancia1 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.PopExp ~= nil then self.PopExp:destroy(); self.PopExp = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.NPC_DescATK ~= nil then self.NPC_DescATK:destroy(); self.NPC_DescATK = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
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
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.Conducao_Equipamentos ~= nil then self.Conducao_Equipamentos:destroy(); self.Conducao_Equipamentos = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.DescVanDes8 ~= nil then self.DescVanDes8:destroy(); self.DescVanDes8 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.PopInventario ~= nil then self.PopInventario:destroy(); self.PopInventario = nil; end;
        if self.frmDZ_NPC_svg ~= nil then self.frmDZ_NPC_svg:destroy(); self.frmDZ_NPC_svg = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.Conducao2_Equipamentos ~= nil then self.Conducao2_Equipamentos:destroy(); self.Conducao2_Equipamentos = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDZ_Ficha1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDZ_Ficha1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDZ_Ficha1_svg = {
    newEditor = newfrmDZ_Ficha1_svg, 
    new = newfrmDZ_Ficha1_svg, 
    name = "frmDZ_Ficha1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDZ_Ficha1_svg = _frmDZ_Ficha1_svg;
Firecast.registrarForm(_frmDZ_Ficha1_svg);

return _frmDZ_Ficha1_svg;
