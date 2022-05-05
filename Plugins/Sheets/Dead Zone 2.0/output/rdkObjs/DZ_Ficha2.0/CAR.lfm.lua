require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmCAR()
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
    obj:setName("frmCAR");
    obj:setHeight(650);
    obj:setWidth(1010);
    obj:setTheme("light");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(1010);
    obj.rectangle1:setHeight(650);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setXradius(8);
    obj.rectangle1:setYradius(8);
    obj.rectangle1:setName("rectangle1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(500);
    obj.layout1:setHeight(650);
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setWidth(500);
    obj.image1:setHeight(400);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setStyle("proportional");
    obj.image1:setCenter(true);
    obj.image1:setSRC("/DZ_Ficha2.0/images/FichaCAR.png");
    obj.image1:setName("image1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("VEICULO");
    obj.label1:setFontSize(30);
    obj.label1:setWidth(200);
    obj.label1:setHeight(30);
    obj.label1:setTop(45);
    obj.label1:setLeft(70);
    obj.label1:setName("label1");
    obj.label1:setFontColor("#C0504D");
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setVertTextAlign("center");
    obj.label1:setFontFamily("DK Umbilical Noose");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("Conducao_Nick");
    obj.edit1:setWidth(250);
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setFontSize(30);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setHeight(40);
    obj.edit1:setTop(50);
    obj.edit1:setLeft(190);
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#C0504D");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setFontFamily("kalam");
    obj.edit1:setTransparent(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("Manobra");
    obj.label2:setFontSize(20);
    obj.label2:setWidth(60);
    obj.label2:setHeight(30);
    obj.label2:setTop(110);
    obj.label2:setLeft(70);
    obj.label2:setName("label2");
    obj.label2:setFontColor("#C0504D");
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setVertTextAlign("center");
    obj.label2:setFontFamily("DK Umbilical Noose");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("Conducao_Manobra");
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(30);
    obj.edit2:setTop(110);
    obj.edit2:setLeft(170);
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(20);
    obj.edit2:setFontColor("#C0504D");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontFamily("kalam");
    obj.edit2:setTransparent(true);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("Blindagem");
    obj.label3:setFontSize(20);
    obj.label3:setFontColor("black");
    obj.label3:setWidth(60);
    obj.label3:setHeight(30);
    obj.label3:setTop(145);
    obj.label3:setLeft(55);
    obj.label3:setName("label3");
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setVertTextAlign("center");
    obj.label3:setFontFamily("DK Umbilical Noose");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setField("Conducao_Blindagem");
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(30);
    obj.edit3:setTop(145);
    obj.edit3:setLeft(170);
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(20);
    obj.edit3:setFontColor("#C0504D");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setFontFamily("kalam");
    obj.edit3:setTransparent(true);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("Capacidade");
    obj.label4:setFontSize(20);
    obj.label4:setWidth(60);
    obj.label4:setHeight(30);
    obj.label4:setTop(178);
    obj.label4:setLeft(51);
    obj.label4:setName("label4");
    obj.label4:setFontColor("#C0504D");
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontFamily("DK Umbilical Noose");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setField("Conducao_Capacidade");
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(30);
    obj.edit4:setTop(175);
    obj.edit4:setLeft(170);
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(20);
    obj.edit4:setFontColor("#C0504D");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setFontFamily("kalam");
    obj.edit4:setTransparent(true);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setText("CD");
    obj.label5:setFontSize(20);
    obj.label5:setFontColor("black");
    obj.label5:setWidth(60);
    obj.label5:setHeight(30);
    obj.label5:setTop(207);
    obj.label5:setLeft(100);
    obj.label5:setName("label5");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setVertTextAlign("center");
    obj.label5:setFontFamily("DK Umbilical Noose");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setField("Conducao_CD");
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(30);
    obj.edit5:setTop(207);
    obj.edit5:setLeft(170);
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(20);
    obj.edit5:setFontColor("#C0504D");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setFontFamily("kalam");
    obj.edit5:setTransparent(true);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("Integridade");
    obj.label6:setFontSize(20);
    obj.label6:setWidth(80);
    obj.label6:setHeight(30);
    obj.label6:setTop(100);
    obj.label6:setLeft(230);
    obj.label6:setName("label6");
    obj.label6:setFontColor("#C0504D");
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setVertTextAlign("center");
    obj.label6:setFontFamily("DK Umbilical Noose");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setField("Conducao_Integridade1");
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(30);
    obj.edit6:setTop(142);
    obj.edit6:setLeft(240);
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(20);
    obj.edit6:setFontColor("#C0504D");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setFontFamily("kalam");
    obj.edit6:setTransparent(true);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setField("Conducao_Integridade2");
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(30);
    obj.edit7:setTop(142);
    obj.edit7:setLeft(275);
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(20);
    obj.edit7:setFontColor("#C0504D");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setFontFamily("kalam");
    obj.edit7:setTransparent(true);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setField("Conducao_Integridade3");
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(30);
    obj.edit8:setTop(142);
    obj.edit8:setLeft(310);
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(20);
    obj.edit8:setFontColor("#C0504D");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setFontFamily("kalam");
    obj.edit8:setTransparent(true);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("Gasolina");
    obj.label7:setFontSize(20);
    obj.label7:setFontColor("black");
    obj.label7:setWidth(80);
    obj.label7:setHeight(30);
    obj.label7:setTop(100);
    obj.label7:setLeft(370);
    obj.label7:setName("label7");
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setVertTextAlign("center");
    obj.label7:setFontFamily("DK Umbilical Noose");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setField("Conducao_Gasolina1");
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(30);
    obj.edit9:setTop(142);
    obj.edit9:setLeft(370);
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(20);
    obj.edit9:setFontColor("#C0504D");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setFontFamily("kalam");
    obj.edit9:setTransparent(true);

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setText("Perm");
    obj.label8:setFontSize(10);
    obj.label8:setFontColor("#C0C0C0");
    obj.label8:setWidth(30);
    obj.label8:setHeight(45);
    obj.label8:setTop(130);
    obj.label8:setLeft(375);
    obj.label8:setName("label8");
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setVertTextAlign("center");
    obj.label8:setFontFamily("DK Umbilical Noose");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout1);
    obj.edit10:setField("Conducao_Gasolina2");
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(30);
    obj.edit10:setTop(142);
    obj.edit10:setLeft(425);
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(20);
    obj.edit10:setFontColor("#C0504D");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setFontFamily("kalam");
    obj.edit10:setTransparent(true);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setText("Temp");
    obj.label9:setFontSize(10);
    obj.label9:setFontColor("#C0C0C0");
    obj.label9:setWidth(30);
    obj.label9:setHeight(45);
    obj.label9:setTop(130);
    obj.label9:setLeft(430);
    obj.label9:setName("label9");
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setVertTextAlign("center");
    obj.label9:setFontFamily("DK Umbilical Noose");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setText("Equipamentos:");
    obj.label10:setFontSize(20);
    obj.label10:setWidth(80);
    obj.label10:setHeight(30);
    obj.label10:setTop(178);
    obj.label10:setLeft(230);
    obj.label10:setName("label10");
    obj.label10:setFontColor("#C0504D");
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setVertTextAlign("center");
    obj.label10:setFontFamily("DK Umbilical Noose");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(230);
    obj.layout2:setTop(208);
    obj.layout2:setWidth(230);
    obj.layout2:setHeight(160);
    obj.layout2:setName("layout2");

    obj.Conducao_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Equipamentos:setParent(obj.layout2);
    obj.Conducao_Equipamentos:setName("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setFontFamily("kalam");
    obj.Conducao_Equipamentos:setWidth(230);
    obj.Conducao_Equipamentos:setHeight(160);
    obj.Conducao_Equipamentos:setFontSize(15);
    obj.Conducao_Equipamentos:setFontColor("#548DD4");
    obj.Conducao_Equipamentos:setField("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setTransparent(true);

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setText("Circunstancia:");
    obj.label11:setFontSize(20);
    obj.label11:setWidth(80);
    obj.label11:setHeight(30);
    obj.label11:setTop(260);
    obj.label11:setLeft(40);
    obj.label11:setName("label11");
    obj.label11:setFontColor("#C0504D");
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setVertTextAlign("center");
    obj.label11:setFontFamily("DK Umbilical Noose");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(25);
    obj.layout3:setTop(290);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(78);
    obj.layout3:setName("layout3");

    obj.Conducao_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Circunstancia:setParent(obj.layout3);
    obj.Conducao_Circunstancia:setName("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setFontFamily("kalam");
    obj.Conducao_Circunstancia:setWidth(200);
    obj.Conducao_Circunstancia:setHeight(80);
    obj.Conducao_Circunstancia:setFontSize(15);
    obj.Conducao_Circunstancia:setFontColor("#548DD4");
    obj.Conducao_Circunstancia:setField("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setTransparent(true);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setWidth(500);
    obj.image2:setHeight(250);
    obj.image2:setLeft(0);
    obj.image2:setTop(385);
    obj.image2:setStyle("proportional");
    obj.image2:setCenter(true);
    obj.image2:setEditable(true);
    obj.image2:setSRC("/DZ_Ficha2.0/images/ImgSize_250x500.png");
    obj.image2:setField("CarII");
    obj.image2:setName("image2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(500);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(500);
    obj.layout4:setHeight(650);
    obj.layout4:setName("layout4");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout4);
    obj.image3:setWidth(500);
    obj.image3:setHeight(400);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setStyle("proportional");
    obj.image3:setCenter(true);
    obj.image3:setSRC("/DZ_Ficha2.0/images/FichaCAR.png");
    obj.image3:setName("image3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setText("VEICULO");
    obj.label12:setFontSize(30);
    obj.label12:setWidth(200);
    obj.label12:setHeight(30);
    obj.label12:setTop(45);
    obj.label12:setLeft(70);
    obj.label12:setName("label12");
    obj.label12:setFontColor("#C0504D");
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setVertTextAlign("center");
    obj.label12:setFontFamily("DK Umbilical Noose");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setField("Conducao2_Nick");
    obj.edit11:setWidth(250);
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setFontSize(30);
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setHeight(40);
    obj.edit11:setTop(50);
    obj.edit11:setLeft(190);
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#C0504D");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setFontFamily("kalam");
    obj.edit11:setTransparent(true);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setText("Manobra");
    obj.label13:setFontSize(20);
    obj.label13:setWidth(60);
    obj.label13:setHeight(30);
    obj.label13:setTop(110);
    obj.label13:setLeft(70);
    obj.label13:setName("label13");
    obj.label13:setFontColor("#C0504D");
    obj.label13:setHorzTextAlign("leading");
    obj.label13:setVertTextAlign("center");
    obj.label13:setFontFamily("DK Umbilical Noose");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setField("Conducao2_Manobra");
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(30);
    obj.edit12:setTop(110);
    obj.edit12:setLeft(170);
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(20);
    obj.edit12:setFontColor("#C0504D");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setFontFamily("kalam");
    obj.edit12:setTransparent(true);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setText("Blindagem");
    obj.label14:setFontSize(20);
    obj.label14:setFontColor("black");
    obj.label14:setWidth(60);
    obj.label14:setHeight(30);
    obj.label14:setTop(145);
    obj.label14:setLeft(55);
    obj.label14:setName("label14");
    obj.label14:setHorzTextAlign("leading");
    obj.label14:setVertTextAlign("center");
    obj.label14:setFontFamily("DK Umbilical Noose");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setField("Conducao2_Blindagem");
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(30);
    obj.edit13:setTop(145);
    obj.edit13:setLeft(170);
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(20);
    obj.edit13:setFontColor("#C0504D");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setFontFamily("kalam");
    obj.edit13:setTransparent(true);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setText("Capacidade");
    obj.label15:setFontSize(20);
    obj.label15:setWidth(60);
    obj.label15:setHeight(30);
    obj.label15:setTop(178);
    obj.label15:setLeft(51);
    obj.label15:setName("label15");
    obj.label15:setFontColor("#C0504D");
    obj.label15:setHorzTextAlign("leading");
    obj.label15:setVertTextAlign("center");
    obj.label15:setFontFamily("DK Umbilical Noose");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setField("Conducao2_Capacidade");
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(30);
    obj.edit14:setTop(175);
    obj.edit14:setLeft(170);
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(20);
    obj.edit14:setFontColor("#C0504D");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setFontFamily("kalam");
    obj.edit14:setTransparent(true);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout4);
    obj.label16:setText("CD");
    obj.label16:setFontSize(20);
    obj.label16:setFontColor("black");
    obj.label16:setWidth(60);
    obj.label16:setHeight(30);
    obj.label16:setTop(207);
    obj.label16:setLeft(100);
    obj.label16:setName("label16");
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setVertTextAlign("center");
    obj.label16:setFontFamily("DK Umbilical Noose");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setField("Conducao2_CD");
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(30);
    obj.edit15:setTop(207);
    obj.edit15:setLeft(170);
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(20);
    obj.edit15:setFontColor("#C0504D");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setFontFamily("kalam");
    obj.edit15:setTransparent(true);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout4);
    obj.label17:setText("Integridade");
    obj.label17:setFontSize(20);
    obj.label17:setWidth(80);
    obj.label17:setHeight(30);
    obj.label17:setTop(100);
    obj.label17:setLeft(230);
    obj.label17:setName("label17");
    obj.label17:setFontColor("#C0504D");
    obj.label17:setHorzTextAlign("leading");
    obj.label17:setVertTextAlign("center");
    obj.label17:setFontFamily("DK Umbilical Noose");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setField("Conducao2_Integridade1");
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(30);
    obj.edit16:setTop(142);
    obj.edit16:setLeft(240);
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(20);
    obj.edit16:setFontColor("#C0504D");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setFontFamily("kalam");
    obj.edit16:setTransparent(true);

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setField("Conducao2_Integridade2");
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(30);
    obj.edit17:setTop(142);
    obj.edit17:setLeft(275);
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(20);
    obj.edit17:setFontColor("#C0504D");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setFontFamily("kalam");
    obj.edit17:setTransparent(true);

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setField("Conducao2_Integridade3");
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(30);
    obj.edit18:setTop(142);
    obj.edit18:setLeft(310);
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(20);
    obj.edit18:setFontColor("#C0504D");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setFontFamily("kalam");
    obj.edit18:setTransparent(true);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setText("Gasolina");
    obj.label18:setFontSize(20);
    obj.label18:setFontColor("black");
    obj.label18:setWidth(80);
    obj.label18:setHeight(30);
    obj.label18:setTop(100);
    obj.label18:setLeft(370);
    obj.label18:setName("label18");
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setVertTextAlign("center");
    obj.label18:setFontFamily("DK Umbilical Noose");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setField("Conducao2_Gasolina1");
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(30);
    obj.edit19:setTop(142);
    obj.edit19:setLeft(370);
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(20);
    obj.edit19:setFontColor("#C0504D");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setFontFamily("kalam");
    obj.edit19:setTransparent(true);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout4);
    obj.label19:setText("Perm");
    obj.label19:setFontSize(10);
    obj.label19:setFontColor("#C0C0C0");
    obj.label19:setWidth(30);
    obj.label19:setHeight(45);
    obj.label19:setTop(130);
    obj.label19:setLeft(375);
    obj.label19:setName("label19");
    obj.label19:setHorzTextAlign("leading");
    obj.label19:setVertTextAlign("center");
    obj.label19:setFontFamily("DK Umbilical Noose");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setField("Conducao2_Gasolina2");
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(30);
    obj.edit20:setTop(142);
    obj.edit20:setLeft(425);
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(20);
    obj.edit20:setFontColor("#C0504D");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setFontFamily("kalam");
    obj.edit20:setTransparent(true);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout4);
    obj.label20:setText("Temp");
    obj.label20:setFontSize(10);
    obj.label20:setFontColor("#C0C0C0");
    obj.label20:setWidth(30);
    obj.label20:setHeight(45);
    obj.label20:setTop(130);
    obj.label20:setLeft(430);
    obj.label20:setName("label20");
    obj.label20:setHorzTextAlign("leading");
    obj.label20:setVertTextAlign("center");
    obj.label20:setFontFamily("DK Umbilical Noose");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setText("Equipamentos:");
    obj.label21:setFontSize(20);
    obj.label21:setWidth(80);
    obj.label21:setHeight(30);
    obj.label21:setTop(178);
    obj.label21:setLeft(230);
    obj.label21:setName("label21");
    obj.label21:setFontColor("#C0504D");
    obj.label21:setHorzTextAlign("leading");
    obj.label21:setVertTextAlign("center");
    obj.label21:setFontFamily("DK Umbilical Noose");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(230);
    obj.layout5:setTop(208);
    obj.layout5:setWidth(230);
    obj.layout5:setHeight(160);
    obj.layout5:setName("layout5");

    obj.Conducao2_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Equipamentos:setParent(obj.layout5);
    obj.Conducao2_Equipamentos:setName("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setFontFamily("kalam");
    obj.Conducao2_Equipamentos:setWidth(230);
    obj.Conducao2_Equipamentos:setHeight(160);
    obj.Conducao2_Equipamentos:setFontSize(15);
    obj.Conducao2_Equipamentos:setFontColor("#548DD4");
    obj.Conducao2_Equipamentos:setField("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setTransparent(true);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setText("Circunstancia:");
    obj.label22:setFontSize(20);
    obj.label22:setWidth(80);
    obj.label22:setHeight(30);
    obj.label22:setTop(260);
    obj.label22:setLeft(40);
    obj.label22:setName("label22");
    obj.label22:setFontColor("#C0504D");
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setVertTextAlign("center");
    obj.label22:setFontFamily("DK Umbilical Noose");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setLeft(25);
    obj.layout6:setTop(290);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(78);
    obj.layout6:setName("layout6");

    obj.Conducao2_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Circunstancia:setParent(obj.layout6);
    obj.Conducao2_Circunstancia:setName("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setFontFamily("kalam");
    obj.Conducao2_Circunstancia:setWidth(200);
    obj.Conducao2_Circunstancia:setHeight(80);
    obj.Conducao2_Circunstancia:setFontSize(15);
    obj.Conducao2_Circunstancia:setFontColor("#548DD4");
    obj.Conducao2_Circunstancia:setField("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setTransparent(true);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout4);
    obj.image4:setWidth(500);
    obj.image4:setHeight(250);
    obj.image4:setLeft(0);
    obj.image4:setTop(385);
    obj.image4:setStyle("proportional");
    obj.image4:setCenter(true);
    obj.image4:setEditable(true);
    obj.image4:setField("Car2II");
    obj.image4:setSRC("/DZ_Ficha2.0/images/ImgSize_250x500.png");
    obj.image4:setName("image4");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.Conducao2_Circunstancia ~= nil then self.Conducao2_Circunstancia:destroy(); self.Conducao2_Circunstancia = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.Conducao_Equipamentos ~= nil then self.Conducao_Equipamentos:destroy(); self.Conducao_Equipamentos = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.Conducao_Circunstancia ~= nil then self.Conducao_Circunstancia:destroy(); self.Conducao_Circunstancia = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.Conducao2_Equipamentos ~= nil then self.Conducao2_Equipamentos:destroy(); self.Conducao2_Equipamentos = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmCAR()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmCAR();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmCAR = {
    newEditor = newfrmCAR, 
    new = newfrmCAR, 
    name = "frmCAR", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmCAR = _frmCAR;
Firecast.registrarForm(_frmCAR);

return _frmCAR;
