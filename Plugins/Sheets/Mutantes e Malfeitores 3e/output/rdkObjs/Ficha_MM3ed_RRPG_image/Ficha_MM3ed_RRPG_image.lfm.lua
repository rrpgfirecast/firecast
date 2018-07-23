require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha_MM3ed_RRPG_image()
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
    obj:setName("frmFicha_MM3ed_RRPG_image");
    obj:setFormType("sheetTemplate");
    obj:setDataType("MM3e_RRPG_2_7");
    obj:setTitle("MM3e_2_7");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.frmFicha_MM3e_RRPG1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3e_RRPG1_svg:setParent(obj.tab1);
    obj.frmFicha_MM3e_RRPG1_svg:setName("frmFicha_MM3e_RRPG1_svg");
    obj.frmFicha_MM3e_RRPG1_svg:setAlign("client");
    obj.frmFicha_MM3e_RRPG1_svg:setTheme("light");
    obj.frmFicha_MM3e_RRPG1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmFicha_MM3e_RRPG1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(43);
    obj.layout1:setTop(105);
    obj.layout1:setWidth(202);
    obj.layout1:setHeight(35);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(18);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(202);
    obj.edit1:setHeight(36);
    obj.edit1:setField("JOGADOR");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(44);
    obj.layout2:setTop(285);
    obj.layout2:setWidth(257);
    obj.layout2:setHeight(40);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(22);
    obj.edit2:setFontColor("#000000");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(257);
    obj.edit2:setHeight(40);
    obj.edit2:setField("CODINOME");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(381);
    obj.layout3:setTop(291);
    obj.layout3:setWidth(51);
    obj.layout3:setHeight(53);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(37.6);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(51);
    obj.edit3:setHeight(54);
    obj.edit3:setField("NP");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(43);
    obj.layout4:setTop(186);
    obj.layout4:setWidth(202);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(18);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(202);
    obj.edit4:setHeight(36);
    obj.edit4:setField("IDENTIDADE");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(62);
    obj.layout5:setTop(486);
    obj.layout5:setWidth(80);
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(20.3);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(52);
    obj.edit5:setHeight(31);
    obj.edit5:setField("FOR");
    obj.edit5:setName("edit5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout5);
    obj.dataLink1:setFields({'FOR'});
    obj.dataLink1:setDefaultValues({'0'});
    obj.dataLink1:setName("dataLink1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout5);
    obj.label1:setVisible(false);
    obj.label1:setFontSize(20.3);
    obj.label1:setFontColor("#000000");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(52);
    obj.label1:setHeight(31);
    obj.label1:setField("FORtotal");
    obj.label1:setName("label1");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout5);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(12);
    obj.edit6:setFontColor("#85bbb1");
    obj.edit6:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(49);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(20);
    obj.edit6:setHeight(20);
    obj.edit6:setField("varFORvalor");
    obj.edit6:setName("edit6");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout5);
    obj.dataLink2:setFields({'varFORvalor'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#264d43");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setLeft(49);
    obj.label2:setTop(6);
    obj.label2:setWidth(20);
    obj.label2:setHeight(20);
    obj.label2:setField("varFOR");
    obj.label2:setName("label2");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setFields({'varFOR'});
    obj.dataLink3:setDefaultValues({'0'});
    obj.dataLink3:setName("dataLink3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setFontSize(8);
    obj.label3:setFontColor("#264d43");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setText("BÔNUS");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setLeft(46);
    obj.label3:setTop(0);
    obj.label3:setWidth(22);
    obj.label3:setHeight(20);
    obj.label3:setName("label3");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(63);
    obj.layout6:setTop(557);
    obj.layout6:setWidth(80);
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout6);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(20.3);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(52);
    obj.edit7:setHeight(31);
    obj.edit7:setField("VIG");
    obj.edit7:setName("edit7");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout6);
    obj.dataLink4:setFields({'VIG'});
    obj.dataLink4:setDefaultValues({'0'});
    obj.dataLink4:setName("dataLink4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout6);
    obj.label4:setVisible(false);
    obj.label4:setFontSize(20.3);
    obj.label4:setFontColor("#000000");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(52);
    obj.label4:setHeight(31);
    obj.label4:setField("VIGtotal");
    obj.label4:setName("label4");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout6);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(12);
    obj.edit8:setFontColor("#85bbb1");
    obj.edit8:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(49);
    obj.edit8:setTop(5);
    obj.edit8:setWidth(20);
    obj.edit8:setHeight(20);
    obj.edit8:setField("varVIGvalor");
    obj.edit8:setName("edit8");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout6);
    obj.dataLink5:setFields({'varVIGvalor'});
    obj.dataLink5:setDefaultValues({'0'});
    obj.dataLink5:setName("dataLink5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#264d43");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setLeft(49);
    obj.label5:setTop(6);
    obj.label5:setWidth(20);
    obj.label5:setHeight(20);
    obj.label5:setField("varVIG");
    obj.label5:setName("label5");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout6);
    obj.dataLink6:setFields({'varVIG'});
    obj.dataLink6:setDefaultValues({'0'});
    obj.dataLink6:setName("dataLink6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setFontSize(8);
    obj.label6:setFontColor("#264d43");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setText("BÔNUS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setLeft(46);
    obj.label6:setTop(0);
    obj.label6:setWidth(22);
    obj.label6:setHeight(20);
    obj.label6:setName("label6");
    obj.label6:setTextTrimming("none");
    obj.label6:setWordWrap(false);
    obj.label6:setAutoSize(true);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(162);
    obj.layout7:setTop(557);
    obj.layout7:setWidth(80);
    obj.layout7:setHeight(30);
    obj.layout7:setName("layout7");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout7);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(20.3);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(52);
    obj.edit9:setHeight(31);
    obj.edit9:setField("DES");
    obj.edit9:setName("edit9");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout7);
    obj.dataLink7:setFields({'DES'});
    obj.dataLink7:setDefaultValues({'0'});
    obj.dataLink7:setName("dataLink7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setVisible(false);
    obj.label7:setFontSize(20.3);
    obj.label7:setFontColor("#000000");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(52);
    obj.label7:setHeight(31);
    obj.label7:setField("DEStotal");
    obj.label7:setName("label7");
    obj.label7:setTextTrimming("none");
    obj.label7:setWordWrap(false);
    obj.label7:setAutoSize(true);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout7);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(12);
    obj.edit10:setFontColor("#85bbb1");
    obj.edit10:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setLeft(49);
    obj.edit10:setTop(5);
    obj.edit10:setWidth(20);
    obj.edit10:setHeight(20);
    obj.edit10:setField("varDESvalor");
    obj.edit10:setName("edit10");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout7);
    obj.dataLink8:setFields({'varDESvalor'});
    obj.dataLink8:setDefaultValues({'0'});
    obj.dataLink8:setName("dataLink8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setFontSize(12);
    obj.label8:setFontColor("#264d43");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setLeft(49);
    obj.label8:setTop(6);
    obj.label8:setWidth(20);
    obj.label8:setHeight(20);
    obj.label8:setField("varDES");
    obj.label8:setName("label8");
    obj.label8:setTextTrimming("none");
    obj.label8:setWordWrap(false);
    obj.label8:setAutoSize(true);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout7);
    obj.dataLink9:setFields({'varDES'});
    obj.dataLink9:setDefaultValues({'0'});
    obj.dataLink9:setName("dataLink9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setFontSize(8);
    obj.label9:setFontColor("#264d43");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setText("BÔNUS");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setLeft(46);
    obj.label9:setTop(0);
    obj.label9:setWidth(22);
    obj.label9:setHeight(20);
    obj.label9:setName("label9");
    obj.label9:setTextTrimming("none");
    obj.label9:setWordWrap(false);
    obj.label9:setAutoSize(true);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(262);
    obj.layout8:setTop(557);
    obj.layout8:setWidth(80);
    obj.layout8:setHeight(30);
    obj.layout8:setName("layout8");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout8);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(20.3);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(52);
    obj.edit11:setHeight(31);
    obj.edit11:setField("INT");
    obj.edit11:setName("edit11");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout8);
    obj.dataLink10:setFields({'INT'});
    obj.dataLink10:setDefaultValues({'0'});
    obj.dataLink10:setName("dataLink10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setVisible(false);
    obj.label10:setFontSize(20.3);
    obj.label10:setFontColor("#000000");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(52);
    obj.label10:setHeight(31);
    obj.label10:setField("INTtotal");
    obj.label10:setName("label10");
    obj.label10:setTextTrimming("none");
    obj.label10:setWordWrap(false);
    obj.label10:setAutoSize(true);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout8);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(12);
    obj.edit12:setFontColor("#85bbb1");
    obj.edit12:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setLeft(49);
    obj.edit12:setTop(5);
    obj.edit12:setWidth(20);
    obj.edit12:setHeight(20);
    obj.edit12:setField("varINTvalor");
    obj.edit12:setName("edit12");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout8);
    obj.dataLink11:setFields({'varINTvalor'});
    obj.dataLink11:setDefaultValues({'0'});
    obj.dataLink11:setName("dataLink11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setFontSize(12);
    obj.label11:setFontColor("#264d43");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setLeft(49);
    obj.label11:setTop(6);
    obj.label11:setWidth(20);
    obj.label11:setHeight(20);
    obj.label11:setField("varINT");
    obj.label11:setName("label11");
    obj.label11:setTextTrimming("none");
    obj.label11:setWordWrap(false);
    obj.label11:setAutoSize(true);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout8);
    obj.dataLink12:setFields({'varINT'});
    obj.dataLink12:setDefaultValues({'0'});
    obj.dataLink12:setName("dataLink12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setFontSize(8);
    obj.label12:setFontColor("#264d43");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setText("BÔNUS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setLeft(46);
    obj.label12:setTop(0);
    obj.label12:setWidth(22);
    obj.label12:setHeight(20);
    obj.label12:setName("label12");
    obj.label12:setTextTrimming("none");
    obj.label12:setWordWrap(false);
    obj.label12:setAutoSize(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(364);
    obj.layout9:setTop(557);
    obj.layout9:setWidth(80);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(20.3);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(52);
    obj.edit13:setHeight(31);
    obj.edit13:setField("PRE");
    obj.edit13:setName("edit13");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout9);
    obj.dataLink13:setFields({'PRE'});
    obj.dataLink13:setDefaultValues({'0'});
    obj.dataLink13:setName("dataLink13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout9);
    obj.label13:setVisible(false);
    obj.label13:setFontSize(20.3);
    obj.label13:setFontColor("#000000");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setLeft(0);
    obj.label13:setTop(0);
    obj.label13:setWidth(52);
    obj.label13:setHeight(31);
    obj.label13:setField("PREtotal");
    obj.label13:setName("label13");
    obj.label13:setTextTrimming("none");
    obj.label13:setWordWrap(false);
    obj.label13:setAutoSize(true);

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout9);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(12);
    obj.edit14:setFontColor("#85bbb1");
    obj.edit14:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setLeft(49);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(20);
    obj.edit14:setHeight(20);
    obj.edit14:setField("varPREvalor");
    obj.edit14:setName("edit14");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout9);
    obj.dataLink14:setFields({'varPREvalor'});
    obj.dataLink14:setDefaultValues({'0'});
    obj.dataLink14:setName("dataLink14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout9);
    obj.label14:setFontSize(12);
    obj.label14:setFontColor("#264d43");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setLeft(49);
    obj.label14:setTop(6);
    obj.label14:setWidth(20);
    obj.label14:setHeight(20);
    obj.label14:setField("varPRE");
    obj.label14:setName("label14");
    obj.label14:setTextTrimming("none");
    obj.label14:setWordWrap(false);
    obj.label14:setAutoSize(true);

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout9);
    obj.dataLink15:setFields({'varPRE'});
    obj.dataLink15:setDefaultValues({'0'});
    obj.dataLink15:setName("dataLink15");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setFontSize(8);
    obj.label15:setFontColor("#264d43");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setText("BÔNUS");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setLeft(46);
    obj.label15:setTop(0);
    obj.label15:setWidth(22);
    obj.label15:setHeight(20);
    obj.label15:setName("label15");
    obj.label15:setTextTrimming("none");
    obj.label15:setWordWrap(false);
    obj.label15:setAutoSize(true);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(364);
    obj.layout10:setTop(486);
    obj.layout10:setWidth(80);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout10);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(20.3);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(52);
    obj.edit15:setHeight(31);
    obj.edit15:setField("PRO");
    obj.edit15:setName("edit15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout10);
    obj.dataLink16:setFields({'PRO'});
    obj.dataLink16:setDefaultValues({'0'});
    obj.dataLink16:setName("dataLink16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setVisible(false);
    obj.label16:setFontSize(20.3);
    obj.label16:setFontColor("#000000");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(52);
    obj.label16:setHeight(31);
    obj.label16:setField("PROtotal");
    obj.label16:setName("label16");
    obj.label16:setTextTrimming("none");
    obj.label16:setWordWrap(false);
    obj.label16:setAutoSize(true);

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout10);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(12);
    obj.edit16:setFontColor("#85bbb1");
    obj.edit16:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setLeft(49);
    obj.edit16:setTop(5);
    obj.edit16:setWidth(20);
    obj.edit16:setHeight(20);
    obj.edit16:setField("varPROvalor");
    obj.edit16:setName("edit16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout10);
    obj.dataLink17:setFields({'varPROvalor'});
    obj.dataLink17:setDefaultValues({'0'});
    obj.dataLink17:setName("dataLink17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17:setFontSize(12);
    obj.label17:setFontColor("#264d43");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setLeft(49);
    obj.label17:setTop(6);
    obj.label17:setWidth(20);
    obj.label17:setHeight(20);
    obj.label17:setField("varPRO");
    obj.label17:setName("label17");
    obj.label17:setTextTrimming("none");
    obj.label17:setWordWrap(false);
    obj.label17:setAutoSize(true);

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout10);
    obj.dataLink18:setFields({'varPRO'});
    obj.dataLink18:setDefaultValues({'0'});
    obj.dataLink18:setName("dataLink18");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18:setFontSize(8);
    obj.label18:setFontColor("#264d43");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setText("BÔNUS");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setLeft(46);
    obj.label18:setTop(0);
    obj.label18:setWidth(22);
    obj.label18:setHeight(20);
    obj.label18:setName("label18");
    obj.label18:setTextTrimming("none");
    obj.label18:setWordWrap(false);
    obj.label18:setAutoSize(true);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(263);
    obj.layout11:setTop(486);
    obj.layout11:setWidth(80);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout11);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(20.3);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(52);
    obj.edit17:setHeight(31);
    obj.edit17:setField("LUT");
    obj.edit17:setName("edit17");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout11);
    obj.dataLink19:setFields({'LUT'});
    obj.dataLink19:setDefaultValues({'0'});
    obj.dataLink19:setName("dataLink19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout11);
    obj.label19:setVisible(false);
    obj.label19:setFontSize(20.3);
    obj.label19:setFontColor("#000000");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setLeft(0);
    obj.label19:setTop(0);
    obj.label19:setWidth(52);
    obj.label19:setHeight(31);
    obj.label19:setField("LUTtotal");
    obj.label19:setName("label19");
    obj.label19:setTextTrimming("none");
    obj.label19:setWordWrap(false);
    obj.label19:setAutoSize(true);

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout11);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(12);
    obj.edit18:setFontColor("#85bbb1");
    obj.edit18:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setLeft(49);
    obj.edit18:setTop(5);
    obj.edit18:setWidth(20);
    obj.edit18:setHeight(20);
    obj.edit18:setField("varLUTvalor");
    obj.edit18:setName("edit18");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout11);
    obj.dataLink20:setFields({'varLUTvalor'});
    obj.dataLink20:setDefaultValues({'0'});
    obj.dataLink20:setName("dataLink20");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20:setFontSize(12);
    obj.label20:setFontColor("#264d43");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setLeft(49);
    obj.label20:setTop(6);
    obj.label20:setWidth(20);
    obj.label20:setHeight(20);
    obj.label20:setField("varLUT");
    obj.label20:setName("label20");
    obj.label20:setTextTrimming("none");
    obj.label20:setWordWrap(false);
    obj.label20:setAutoSize(true);

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout11);
    obj.dataLink21:setFields({'varLUT'});
    obj.dataLink21:setDefaultValues({'0'});
    obj.dataLink21:setName("dataLink21");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout11);
    obj.label21:setFontSize(8);
    obj.label21:setFontColor("#264d43");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setText("BÔNUS");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setLeft(46);
    obj.label21:setTop(0);
    obj.label21:setWidth(22);
    obj.label21:setHeight(20);
    obj.label21:setName("label21");
    obj.label21:setTextTrimming("none");
    obj.label21:setWordWrap(false);
    obj.label21:setAutoSize(true);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(162);
    obj.layout12:setTop(486);
    obj.layout12:setWidth(80);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout12);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(20.3);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(52);
    obj.edit19:setHeight(31);
    obj.edit19:setField("AGI");
    obj.edit19:setName("edit19");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout12);
    obj.dataLink22:setFields({'AGI'});
    obj.dataLink22:setDefaultValues({'0'});
    obj.dataLink22:setName("dataLink22");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout12);
    obj.label22:setVisible(false);
    obj.label22:setFontSize(20.3);
    obj.label22:setFontColor("#000000");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setLeft(0);
    obj.label22:setTop(0);
    obj.label22:setWidth(52);
    obj.label22:setHeight(31);
    obj.label22:setField("AGItotal");
    obj.label22:setName("label22");
    obj.label22:setTextTrimming("none");
    obj.label22:setWordWrap(false);
    obj.label22:setAutoSize(true);

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout12);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(12);
    obj.edit20:setFontColor("#85bbb1");
    obj.edit20:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setLeft(49);
    obj.edit20:setTop(5);
    obj.edit20:setWidth(20);
    obj.edit20:setHeight(20);
    obj.edit20:setField("varAGIvalor");
    obj.edit20:setName("edit20");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout12);
    obj.dataLink23:setFields({'varAGIvalor'});
    obj.dataLink23:setDefaultValues({'0'});
    obj.dataLink23:setName("dataLink23");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout12);
    obj.label23:setFontSize(12);
    obj.label23:setFontColor("#264d43");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setLeft(49);
    obj.label23:setTop(6);
    obj.label23:setWidth(20);
    obj.label23:setHeight(20);
    obj.label23:setField("varAGI");
    obj.label23:setName("label23");
    obj.label23:setTextTrimming("none");
    obj.label23:setWordWrap(false);
    obj.label23:setAutoSize(true);

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout12);
    obj.dataLink24:setFields({'varAGI'});
    obj.dataLink24:setDefaultValues({'0'});
    obj.dataLink24:setName("dataLink24");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout12);
    obj.label24:setFontSize(8);
    obj.label24:setFontColor("#264d43");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setText("BÔNUS");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setLeft(46);
    obj.label24:setTop(0);
    obj.label24:setWidth(22);
    obj.label24:setHeight(20);
    obj.label24:setName("label24");
    obj.label24:setTextTrimming("none");
    obj.label24:setWordWrap(false);
    obj.label24:setAutoSize(true);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(377);
    obj.layout13:setTop(360);
    obj.layout13:setWidth(61);
    obj.layout13:setHeight(33);
    obj.layout13:setName("layout13");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout13);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(22.6);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(61);
    obj.edit21:setHeight(34);
    obj.edit21:setField("PONTOSDEPODER");
    obj.edit21:setName("edit21");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(377);
    obj.layout14:setTop(405);
    obj.layout14:setWidth(61);
    obj.layout14:setHeight(33);
    obj.layout14:setName("layout14");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout14);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(22.6);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(61);
    obj.edit22:setHeight(34);
    obj.edit22:setField("PONTOSHEROICOS");
    obj.edit22:setName("edit22");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(43);
    obj.layout15:setTop(630);
    obj.layout15:setWidth(391);
    obj.layout15:setHeight(262);
    obj.layout15:setName("layout15");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout15);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(391);
    obj.textEditor1:setHeight(262);
    obj.textEditor1:setFontSize(16.5);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Vantagens");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(43);
    obj.layout16:setTop(933);
    obj.layout16:setWidth(391);
    obj.layout16:setHeight(302);
    obj.layout16:setName("layout16");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout16);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(391);
    obj.textEditor2:setHeight(302);
    obj.textEditor2:setFontSize(16.5);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Equipamentos");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(459);
    obj.layout17:setTop(470);
    obj.layout17:setWidth(391);
    obj.layout17:setHeight(714);
    obj.layout17:setName("layout17");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout17);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(391);
    obj.textEditor3:setHeight(687);
    obj.textEditor3:setFontSize(16.5);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("PODERES");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(688);
    obj.layout18:setTop(171);
    obj.layout18:setWidth(28);
    obj.layout18:setHeight(16);
    obj.layout18:setName("layout18");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout18);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(12);
    obj.edit23:setFontColor("#000000");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(28);
    obj.edit23:setHeight(19);
    obj.edit23:setField("Iniciativa");
    obj.edit23:setName("edit23");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(568);
    obj.layout19:setTop(78);
    obj.layout19:setWidth(24);
    obj.layout19:setHeight(15);
    obj.layout19:setName("layout19");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout19);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(9);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(24);
    obj.edit24:setHeight(16);
    obj.edit24:setField("DEFesq2");
    obj.edit24:setName("edit24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout19);
    obj.dataLink25:setFields({'DEFesq2'});
    obj.dataLink25:setDefaultValues({'0'});
    obj.dataLink25:setName("dataLink25");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(541);
    obj.layout20:setTop(78);
    obj.layout20:setWidth(24);
    obj.layout20:setHeight(15);
    obj.layout20:setName("layout20");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout20);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(9);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(24);
    obj.edit25:setHeight(16);
    obj.edit25:setField("DEFesq1");
    obj.edit25:setName("edit25");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(541);
    obj.layout21:setTop(99);
    obj.layout21:setWidth(24);
    obj.layout21:setHeight(15);
    obj.layout21:setName("layout21");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout21);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(9);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(24);
    obj.edit26:setHeight(16);
    obj.edit26:setField("DEFapa1");
    obj.edit26:setName("edit26");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(568);
    obj.layout22:setTop(99);
    obj.layout22:setWidth(24);
    obj.layout22:setHeight(15);
    obj.layout22:setName("layout22");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout22);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(9);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(24);
    obj.edit27:setHeight(16);
    obj.edit27:setField("DEFapa2");
    obj.edit27:setName("edit27");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout22);
    obj.dataLink26:setFields({'DEFapa2'});
    obj.dataLink26:setDefaultValues({'0'});
    obj.dataLink26:setName("dataLink26");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(568);
    obj.layout23:setTop(120);
    obj.layout23:setWidth(24);
    obj.layout23:setHeight(15);
    obj.layout23:setName("layout23");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout23);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(9);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(24);
    obj.edit28:setHeight(16);
    obj.edit28:setField("DEFvon2");
    obj.edit28:setName("edit28");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout23);
    obj.dataLink27:setFields({'DEFvon2'});
    obj.dataLink27:setDefaultValues({'0'});
    obj.dataLink27:setName("dataLink27");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(541);
    obj.layout24:setTop(120);
    obj.layout24:setWidth(24);
    obj.layout24:setHeight(15);
    obj.layout24:setName("layout24");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout24);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(9);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(24);
    obj.edit29:setHeight(16);
    obj.edit29:setField("DEFvon1");
    obj.edit29:setName("edit29");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(750);
    obj.layout25:setTop(99);
    obj.layout25:setWidth(24);
    obj.layout25:setHeight(15);
    obj.layout25:setName("layout25");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout25);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(9);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(24);
    obj.edit30:setHeight(16);
    obj.edit30:setField("DEFres1");
    obj.edit30:setName("edit30");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(750);
    obj.layout26:setTop(78);
    obj.layout26:setWidth(24);
    obj.layout26:setHeight(15);
    obj.layout26:setName("layout26");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout26);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(9);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(24);
    obj.edit31:setHeight(16);
    obj.edit31:setField("DEFforti1");
    obj.edit31:setName("edit31");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(777);
    obj.layout27:setTop(78);
    obj.layout27:setWidth(24);
    obj.layout27:setHeight(15);
    obj.layout27:setName("layout27");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout27);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(9);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(24);
    obj.edit32:setHeight(16);
    obj.edit32:setField("DEFforti2");
    obj.edit32:setName("edit32");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout27);
    obj.dataLink28:setFields({'DEFforti2'});
    obj.dataLink28:setDefaultValues({'0'});
    obj.dataLink28:setName("dataLink28");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(804);
    obj.layout28:setTop(78);
    obj.layout28:setWidth(24);
    obj.layout28:setHeight(15);
    obj.layout28:setName("layout28");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout28);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(9);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(24);
    obj.edit33:setHeight(16);
    obj.edit33:setField("DEFforti3");
    obj.edit33:setName("edit33");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout28);
    obj.dataLink29:setFields({'DEFforti3'});
    obj.dataLink29:setDefaultValues({'0'});
    obj.dataLink29:setName("dataLink29");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(831);
    obj.layout29:setTop(78);
    obj.layout29:setWidth(24);
    obj.layout29:setHeight(15);
    obj.layout29:setName("layout29");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout29);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(9);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(24);
    obj.edit34:setHeight(16);
    obj.edit34:setField("DEFfortiTotal");
    obj.edit34:setName("edit34");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(650);
    obj.layout30:setTop(117);
    obj.layout30:setWidth(98);
    obj.layout30:setHeight(24);
    obj.layout30:setName("layout30");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout30);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(14);
    obj.edit35:setFontColor("#000000");
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(182);
    obj.edit35:setHeight(24);
    obj.edit35:setField("DEFextraName");
    obj.edit35:setName("edit35");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(540);
    obj.layout31:setTop(1196);
    obj.layout31:setWidth(19);
    obj.layout31:setHeight(18);
    obj.layout31:setName("layout31");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout31);
    obj.label25:setFontSize(10);
    obj.label25:setFontColor("#000000");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setLeft(0);
    obj.label25:setTop(0);
    obj.label25:setWidth(24);
    obj.label25:setHeight(15);
    obj.label25:setField("PPhabilidades");
    obj.label25:setName("label25");
    obj.label25:setTextTrimming("none");
    obj.label25:setWordWrap(false);
    obj.label25:setAutoSize(true);

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(618);
    obj.layout32:setTop(1196);
    obj.layout32:setWidth(21);
    obj.layout32:setHeight(18);
    obj.layout32:setName("layout32");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout32);
    obj.label26:setFontSize(10);
    obj.label26:setFontColor("#000000");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setLeft(0);
    obj.label26:setTop(0);
    obj.label26:setWidth(24);
    obj.label26:setHeight(15);
    obj.label26:setField("PPpericias");
    obj.label26:setName("label26");
    obj.label26:setTextTrimming("none");
    obj.label26:setWordWrap(false);
    obj.label26:setAutoSize(true);

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(641);
    obj.layout33:setTop(1197);
    obj.layout33:setWidth(19);
    obj.layout33:setHeight(14);
    obj.layout33:setName("layout33");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout33);
    obj.label27:setFontSize(9);
    obj.label27:setFontColor("#000000");
    obj.label27:setVertTextAlign("center");
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(19);
    obj.label27:setHeight(15);
    obj.label27:setField("PPpericiasgrad");
    obj.label27:setName("label27");
    obj.label27:setTextTrimming("none");
    obj.label27:setWordWrap(false);
    obj.label27:setAutoSize(true);

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(811);
    obj.layout34:setTop(1194);
    obj.layout34:setWidth(21);
    obj.layout34:setHeight(18);
    obj.layout34:setName("layout34");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout34);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(10);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(24);
    obj.edit36:setHeight(18);
    obj.edit36:setField("PPvantagens");
    obj.edit36:setName("edit36");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(512);
    obj.layout35:setTop(1212);
    obj.layout35:setWidth(21);
    obj.layout35:setHeight(14);
    obj.layout35:setName("layout35");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout35);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(10);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(24);
    obj.edit37:setHeight(18);
    obj.edit37:setField("PPdefesas");
    obj.edit37:setName("edit37");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(593);
    obj.layout36:setTop(1212);
    obj.layout36:setWidth(24);
    obj.layout36:setHeight(18);
    obj.layout36:setName("layout36");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout36);
    obj.label28:setFontSize(10);
    obj.label28:setFontColor("#000000");
    obj.label28:setVertTextAlign("center");
    obj.label28:setLeft(0);
    obj.label28:setTop(0);
    obj.label28:setWidth(24);
    obj.label28:setHeight(18);
    obj.label28:setField("PPpoderes");
    obj.label28:setName("label28");
    obj.label28:setTextTrimming("none");
    obj.label28:setWordWrap(false);
    obj.label28:setAutoSize(true);

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(630);
    obj.layout37:setTop(1214);
    obj.layout37:setWidth(140);
    obj.layout37:setHeight(18);
    obj.layout37:setName("layout37");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout37);
    obj.label29:setFontSize(12);
    obj.label29:setFontColor("#000000");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setVertTextAlign("center");
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(140);
    obj.label29:setHeight(18);
    obj.label29:setField("PPsomatotal");
    obj.label29:setName("label29");
    obj.label29:setTextTrimming("none");
    obj.label29:setWordWrap(false);
    obj.label29:setAutoSize(true);

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setTop(215);
    obj.layout38:setLeft(458);
    obj.layout38:setWidth(188);
    obj.layout38:setHeight(18);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(12);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(188);
    obj.edit38:setHeight(19);
    obj.edit38:setField("ATK1");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setTop(215);
    obj.layout39:setLeft(651);
    obj.layout39:setWidth(25);
    obj.layout39:setHeight(18);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(12);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(27);
    obj.edit39:setHeight(19);
    obj.edit39:setField("ATK1mod");
    obj.edit39:setName("edit39");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout39);
    obj.dataLink30:setFields({'ATK1mod'});
    obj.dataLink30:setDefaultValues({'0'});
    obj.dataLink30:setName("dataLink30");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setTop(215);
    obj.layout40:setLeft(681);
    obj.layout40:setWidth(25);
    obj.layout40:setHeight(18);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(12);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(27);
    obj.edit40:setHeight(19);
    obj.edit40:setField("ATK1dano");
    obj.edit40:setName("edit40");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout40);
    obj.dataLink31:setFields({'ATK1dano'});
    obj.dataLink31:setDefaultValues({'0'});
    obj.dataLink31:setName("dataLink31");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setTop(215);
    obj.layout41:setLeft(710);
    obj.layout41:setWidth(95);
    obj.layout41:setHeight(18);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(12);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(95);
    obj.edit41:setHeight(19);
    obj.edit41:setField("ATK1tipo");
    obj.edit41:setName("edit41");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout41);
    obj.dataLink32:setFields({'ATK1tipo'});
    obj.dataLink32:setDefaultValues({'-'});
    obj.dataLink32:setName("dataLink32");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setTop(214);
    obj.layout42:setLeft(807);
    obj.layout42:setName("layout42");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout42);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setField("ATK1TesteCD");
    obj.comboBox1:setWidth(18);
    obj.comboBox1:setHeight(19);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'-', 'D', 'E'});
    obj.comboBox1:setValues({'0', '+15', '+10'});
    obj.comboBox1:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout42);
    obj.dataLink33:setFields({'ATK1TesteCD'});
    obj.dataLink33:setDefaultValues({'+15'});
    obj.dataLink33:setName("dataLink33");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setTop(238);
    obj.layout43:setLeft(651);
    obj.layout43:setWidth(25);
    obj.layout43:setHeight(18);
    obj.layout43:setName("layout43");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout43);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(12);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(27);
    obj.edit42:setHeight(19);
    obj.edit42:setField("ATK2mod");
    obj.edit42:setName("edit42");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout43);
    obj.dataLink34:setFields({'ATK2mod'});
    obj.dataLink34:setDefaultValues({'0'});
    obj.dataLink34:setName("dataLink34");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setTop(238);
    obj.layout44:setLeft(681);
    obj.layout44:setWidth(25);
    obj.layout44:setHeight(18);
    obj.layout44:setName("layout44");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout44);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(12);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(27);
    obj.edit43:setHeight(19);
    obj.edit43:setField("ATK2dano");
    obj.edit43:setName("edit43");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout44);
    obj.dataLink35:setFields({'ATK2dano'});
    obj.dataLink35:setDefaultValues({'0'});
    obj.dataLink35:setName("dataLink35");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setTop(238);
    obj.layout45:setLeft(710);
    obj.layout45:setWidth(102);
    obj.layout45:setHeight(18);
    obj.layout45:setName("layout45");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout45);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(12);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(102);
    obj.edit44:setHeight(19);
    obj.edit44:setField("ATK2tipo");
    obj.edit44:setName("edit44");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout45);
    obj.dataLink36:setFields({'ATK2tipo'});
    obj.dataLink36:setDefaultValues({'-'});
    obj.dataLink36:setName("dataLink36");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setTop(236);
    obj.layout46:setLeft(807);
    obj.layout46:setName("layout46");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout46);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setField("ATK2TesteCD");
    obj.comboBox2:setWidth(18);
    obj.comboBox2:setHeight(19);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'-', 'D', 'E'});
    obj.comboBox2:setValues({'0', '+15', '+10'});
    obj.comboBox2:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox2:setName("comboBox2");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout46);
    obj.dataLink37:setFields({'ATK2TesteCD'});
    obj.dataLink37:setDefaultValues({'+15'});
    obj.dataLink37:setName("dataLink37");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setTop(259);
    obj.layout47:setLeft(651);
    obj.layout47:setWidth(25);
    obj.layout47:setHeight(18);
    obj.layout47:setName("layout47");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout47);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(12);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(27);
    obj.edit45:setHeight(19);
    obj.edit45:setField("ATK3mod");
    obj.edit45:setName("edit45");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout47);
    obj.dataLink38:setFields({'ATK3mod'});
    obj.dataLink38:setDefaultValues({'0'});
    obj.dataLink38:setName("dataLink38");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setTop(259);
    obj.layout48:setLeft(681);
    obj.layout48:setWidth(25);
    obj.layout48:setHeight(18);
    obj.layout48:setName("layout48");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout48);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(12);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(27);
    obj.edit46:setHeight(19);
    obj.edit46:setField("ATK3dano");
    obj.edit46:setName("edit46");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout48);
    obj.dataLink39:setFields({'ATK3dano'});
    obj.dataLink39:setDefaultValues({'0'});
    obj.dataLink39:setName("dataLink39");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setTop(259);
    obj.layout49:setLeft(710);
    obj.layout49:setWidth(102);
    obj.layout49:setHeight(18);
    obj.layout49:setName("layout49");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout49);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(12);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(102);
    obj.edit47:setHeight(19);
    obj.edit47:setField("ATK3tipo");
    obj.edit47:setName("edit47");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout49);
    obj.dataLink40:setFields({'ATK3tipo'});
    obj.dataLink40:setDefaultValues({'-'});
    obj.dataLink40:setName("dataLink40");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setTop(258);
    obj.layout50:setLeft(807);
    obj.layout50:setName("layout50");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout50);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setField("ATK3TesteCD");
    obj.comboBox3:setWidth(18);
    obj.comboBox3:setHeight(19);
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'-', 'D', 'E'});
    obj.comboBox3:setValues({'0', '+15', '+10'});
    obj.comboBox3:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox3:setName("comboBox3");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout50);
    obj.dataLink41:setFields({'ATK3TesteCD'});
    obj.dataLink41:setDefaultValues({'+15'});
    obj.dataLink41:setName("dataLink41");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setTop(280);
    obj.layout51:setLeft(651);
    obj.layout51:setWidth(25);
    obj.layout51:setHeight(18);
    obj.layout51:setName("layout51");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout51);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(12);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(27);
    obj.edit48:setHeight(19);
    obj.edit48:setField("ATK4mod");
    obj.edit48:setName("edit48");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout51);
    obj.dataLink42:setFields({'ATK4mod'});
    obj.dataLink42:setDefaultValues({'0'});
    obj.dataLink42:setName("dataLink42");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setTop(280);
    obj.layout52:setLeft(681);
    obj.layout52:setWidth(25);
    obj.layout52:setHeight(18);
    obj.layout52:setName("layout52");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout52);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(12);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(27);
    obj.edit49:setHeight(19);
    obj.edit49:setField("ATK4dano");
    obj.edit49:setName("edit49");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout52);
    obj.dataLink43:setFields({'ATK4dano'});
    obj.dataLink43:setDefaultValues({'0'});
    obj.dataLink43:setName("dataLink43");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setTop(280);
    obj.layout53:setLeft(710);
    obj.layout53:setWidth(102);
    obj.layout53:setHeight(18);
    obj.layout53:setName("layout53");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout53);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(12);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(102);
    obj.edit50:setHeight(19);
    obj.edit50:setField("ATK4tipo");
    obj.edit50:setName("edit50");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout53);
    obj.dataLink44:setFields({'ATK4tipo'});
    obj.dataLink44:setDefaultValues({'-'});
    obj.dataLink44:setName("dataLink44");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setTop(279);
    obj.layout54:setLeft(807);
    obj.layout54:setName("layout54");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout54);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setField("ATK4TesteCD");
    obj.comboBox4:setWidth(19);
    obj.comboBox4:setHeight(18);
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'-', 'D', 'E'});
    obj.comboBox4:setValues({'0', '+15', '+10'});
    obj.comboBox4:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout54);
    obj.dataLink45:setFields({'ATK4TesteCD'});
    obj.dataLink45:setDefaultValues({'+15'});
    obj.dataLink45:setName("dataLink45");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setTop(302);
    obj.layout55:setLeft(651);
    obj.layout55:setWidth(25);
    obj.layout55:setHeight(18);
    obj.layout55:setName("layout55");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout55);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(12);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(27);
    obj.edit51:setHeight(19);
    obj.edit51:setField("ATK5mod");
    obj.edit51:setName("edit51");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout55);
    obj.dataLink46:setFields({'ATK5mod'});
    obj.dataLink46:setDefaultValues({'0'});
    obj.dataLink46:setName("dataLink46");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setTop(302);
    obj.layout56:setLeft(681);
    obj.layout56:setWidth(25);
    obj.layout56:setHeight(18);
    obj.layout56:setName("layout56");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout56);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(12);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(27);
    obj.edit52:setHeight(19);
    obj.edit52:setField("ATK5dano");
    obj.edit52:setName("edit52");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout56);
    obj.dataLink47:setFields({'ATK5dano'});
    obj.dataLink47:setDefaultValues({'0'});
    obj.dataLink47:setName("dataLink47");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setTop(302);
    obj.layout57:setLeft(710);
    obj.layout57:setWidth(102);
    obj.layout57:setHeight(18);
    obj.layout57:setName("layout57");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout57);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(12);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(102);
    obj.edit53:setHeight(19);
    obj.edit53:setField("ATK5tipo");
    obj.edit53:setName("edit53");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout57);
    obj.dataLink48:setFields({'ATK5tipo'});
    obj.dataLink48:setDefaultValues({'-'});
    obj.dataLink48:setName("dataLink48");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setTop(301);
    obj.layout58:setLeft(807);
    obj.layout58:setName("layout58");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout58);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setField("ATK5TesteCD");
    obj.comboBox5:setWidth(18);
    obj.comboBox5:setHeight(19);
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'-', 'D', 'E'});
    obj.comboBox5:setValues({'0', '+15', '+10'});
    obj.comboBox5:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox5:setName("comboBox5");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout58);
    obj.dataLink49:setFields({'ATK5TesteCD'});
    obj.dataLink49:setDefaultValues({'+15'});
    obj.dataLink49:setName("dataLink49");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setTop(323);
    obj.layout59:setLeft(651);
    obj.layout59:setWidth(25);
    obj.layout59:setHeight(18);
    obj.layout59:setName("layout59");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout59);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(12);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(27);
    obj.edit54:setHeight(19);
    obj.edit54:setField("ATK6mod");
    obj.edit54:setName("edit54");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout59);
    obj.dataLink50:setFields({'ATK6mod'});
    obj.dataLink50:setDefaultValues({'0'});
    obj.dataLink50:setName("dataLink50");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setTop(323);
    obj.layout60:setLeft(681);
    obj.layout60:setWidth(25);
    obj.layout60:setHeight(18);
    obj.layout60:setName("layout60");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout60);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(12);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(27);
    obj.edit55:setHeight(19);
    obj.edit55:setField("ATK6dano");
    obj.edit55:setName("edit55");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout60);
    obj.dataLink51:setFields({'ATK6dano'});
    obj.dataLink51:setDefaultValues({'0'});
    obj.dataLink51:setName("dataLink51");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setTop(323);
    obj.layout61:setLeft(710);
    obj.layout61:setWidth(102);
    obj.layout61:setHeight(18);
    obj.layout61:setName("layout61");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout61);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(12);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(102);
    obj.edit56:setHeight(19);
    obj.edit56:setField("ATK6tipo");
    obj.edit56:setName("edit56");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout61);
    obj.dataLink52:setFields({'ATK6tipo'});
    obj.dataLink52:setDefaultValues({'-'});
    obj.dataLink52:setName("dataLink52");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setTop(322);
    obj.layout62:setLeft(807);
    obj.layout62:setName("layout62");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout62);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setField("ATK6TesteCD");
    obj.comboBox6:setWidth(18);
    obj.comboBox6:setHeight(19);
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'-', 'D', 'E'});
    obj.comboBox6:setValues({'0', '+15', '+10'});
    obj.comboBox6:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox6:setName("comboBox6");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout62);
    obj.dataLink53:setFields({'ATK6TesteCD'});
    obj.dataLink53:setDefaultValues({'+15'});
    obj.dataLink53:setName("dataLink53");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setTop(345);
    obj.layout63:setLeft(651);
    obj.layout63:setWidth(25);
    obj.layout63:setHeight(18);
    obj.layout63:setName("layout63");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout63);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(12);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(27);
    obj.edit57:setHeight(19);
    obj.edit57:setField("ATK7mod");
    obj.edit57:setName("edit57");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout63);
    obj.dataLink54:setFields({'ATK7mod'});
    obj.dataLink54:setDefaultValues({'0'});
    obj.dataLink54:setName("dataLink54");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setTop(345);
    obj.layout64:setLeft(681);
    obj.layout64:setWidth(25);
    obj.layout64:setHeight(18);
    obj.layout64:setName("layout64");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout64);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(12);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(27);
    obj.edit58:setHeight(19);
    obj.edit58:setField("ATK7dano");
    obj.edit58:setName("edit58");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout64);
    obj.dataLink55:setFields({'ATK7dano'});
    obj.dataLink55:setDefaultValues({'0'});
    obj.dataLink55:setName("dataLink55");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setTop(345);
    obj.layout65:setLeft(710);
    obj.layout65:setWidth(102);
    obj.layout65:setHeight(18);
    obj.layout65:setName("layout65");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout65);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(12);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(102);
    obj.edit59:setHeight(19);
    obj.edit59:setField("ATK7tipo");
    obj.edit59:setName("edit59");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout65);
    obj.dataLink56:setFields({'ATK7tipo'});
    obj.dataLink56:setDefaultValues({'-'});
    obj.dataLink56:setName("dataLink56");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setTop(344);
    obj.layout66:setLeft(807);
    obj.layout66:setName("layout66");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout66);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setField("ATK7TesteCD");
    obj.comboBox7:setWidth(18);
    obj.comboBox7:setHeight(19);
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'-', 'D', 'E'});
    obj.comboBox7:setValues({'0', '+15', '+10'});
    obj.comboBox7:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox7:setName("comboBox7");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout66);
    obj.dataLink57:setFields({'ATK7TesteCD'});
    obj.dataLink57:setDefaultValues({'+15'});
    obj.dataLink57:setName("dataLink57");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setTop(366);
    obj.layout67:setLeft(651);
    obj.layout67:setWidth(25);
    obj.layout67:setHeight(18);
    obj.layout67:setName("layout67");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout67);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(12);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(27);
    obj.edit60:setHeight(19);
    obj.edit60:setField("ATK8mod");
    obj.edit60:setName("edit60");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout67);
    obj.dataLink58:setFields({'ATK8mod'});
    obj.dataLink58:setDefaultValues({'0'});
    obj.dataLink58:setName("dataLink58");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setTop(366);
    obj.layout68:setLeft(681);
    obj.layout68:setWidth(25);
    obj.layout68:setHeight(18);
    obj.layout68:setName("layout68");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout68);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(12);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(27);
    obj.edit61:setHeight(19);
    obj.edit61:setField("ATK8dano");
    obj.edit61:setName("edit61");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout68);
    obj.dataLink59:setFields({'ATK8dano'});
    obj.dataLink59:setDefaultValues({'0'});
    obj.dataLink59:setName("dataLink59");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setTop(366);
    obj.layout69:setLeft(710);
    obj.layout69:setWidth(102);
    obj.layout69:setHeight(18);
    obj.layout69:setName("layout69");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout69);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(12);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(102);
    obj.edit62:setHeight(19);
    obj.edit62:setField("ATK8tipo");
    obj.edit62:setName("edit62");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout69);
    obj.dataLink60:setFields({'ATK8tipo'});
    obj.dataLink60:setDefaultValues({'-'});
    obj.dataLink60:setName("dataLink60");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setTop(365);
    obj.layout70:setLeft(807);
    obj.layout70:setName("layout70");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout70);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setField("ATK8TesteCD");
    obj.comboBox8:setWidth(18);
    obj.comboBox8:setHeight(19);
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'-', 'D', 'E'});
    obj.comboBox8:setValues({'0', '+15', '+10'});
    obj.comboBox8:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox8:setName("comboBox8");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout70);
    obj.dataLink61:setFields({'ATK8TesteCD'});
    obj.dataLink61:setDefaultValues({'+15'});
    obj.dataLink61:setName("dataLink61");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setTop(388);
    obj.layout71:setLeft(651);
    obj.layout71:setWidth(25);
    obj.layout71:setHeight(18);
    obj.layout71:setName("layout71");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout71);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(12);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(27);
    obj.edit63:setHeight(19);
    obj.edit63:setField("ATK9mod");
    obj.edit63:setName("edit63");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout71);
    obj.dataLink62:setFields({'ATK9mod'});
    obj.dataLink62:setDefaultValues({'0'});
    obj.dataLink62:setName("dataLink62");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setTop(388);
    obj.layout72:setLeft(681);
    obj.layout72:setWidth(25);
    obj.layout72:setHeight(18);
    obj.layout72:setName("layout72");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout72);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(12);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(27);
    obj.edit64:setHeight(19);
    obj.edit64:setField("ATK9dano");
    obj.edit64:setName("edit64");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout72);
    obj.dataLink63:setFields({'ATK9dano'});
    obj.dataLink63:setDefaultValues({'0'});
    obj.dataLink63:setName("dataLink63");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setTop(388);
    obj.layout73:setLeft(710);
    obj.layout73:setWidth(102);
    obj.layout73:setHeight(18);
    obj.layout73:setName("layout73");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout73);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(12);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(102);
    obj.edit65:setHeight(19);
    obj.edit65:setField("ATK9tipo");
    obj.edit65:setName("edit65");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout73);
    obj.dataLink64:setFields({'ATK9tipo'});
    obj.dataLink64:setDefaultValues({'-'});
    obj.dataLink64:setName("dataLink64");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setTop(387);
    obj.layout74:setLeft(807);
    obj.layout74:setName("layout74");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout74);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setField("ATK9TesteCD");
    obj.comboBox9:setWidth(18);
    obj.comboBox9:setHeight(19);
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'-', 'D', 'E'});
    obj.comboBox9:setValues({'0', '+15', '+10'});
    obj.comboBox9:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox9:setName("comboBox9");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout74);
    obj.dataLink65:setFields({'ATK9TesteCD'});
    obj.dataLink65:setDefaultValues({'+15'});
    obj.dataLink65:setName("dataLink65");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setTop(409);
    obj.layout75:setLeft(651);
    obj.layout75:setWidth(25);
    obj.layout75:setHeight(18);
    obj.layout75:setName("layout75");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout75);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(12);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(27);
    obj.edit66:setHeight(19);
    obj.edit66:setField("ATK10mod");
    obj.edit66:setName("edit66");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout75);
    obj.dataLink66:setFields({'ATK10mod'});
    obj.dataLink66:setDefaultValues({'0'});
    obj.dataLink66:setName("dataLink66");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setTop(409);
    obj.layout76:setLeft(681);
    obj.layout76:setWidth(25);
    obj.layout76:setHeight(18);
    obj.layout76:setName("layout76");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout76);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(12);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(27);
    obj.edit67:setHeight(19);
    obj.edit67:setField("ATK10dano");
    obj.edit67:setName("edit67");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout76);
    obj.dataLink67:setFields({'ATK10dano'});
    obj.dataLink67:setDefaultValues({'0'});
    obj.dataLink67:setName("dataLink67");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setTop(409);
    obj.layout77:setLeft(710);
    obj.layout77:setWidth(102);
    obj.layout77:setHeight(18);
    obj.layout77:setName("layout77");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout77);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(12);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(102);
    obj.edit68:setHeight(19);
    obj.edit68:setField("ATK10tipo");
    obj.edit68:setName("edit68");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout77);
    obj.dataLink68:setFields({'ATK10tipo'});
    obj.dataLink68:setDefaultValues({'-'});
    obj.dataLink68:setName("dataLink68");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setTop(408);
    obj.layout78:setLeft(807);
    obj.layout78:setName("layout78");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout78);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setField("ATK10TesteCD");
    obj.comboBox10:setWidth(18);
    obj.comboBox10:setHeight(19);
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'-', 'D', 'E'});
    obj.comboBox10:setValues({'0', '+15', '+10'});
    obj.comboBox10:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox10:setName("comboBox10");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout78);
    obj.dataLink69:setFields({'ATK10TesteCD'});
    obj.dataLink69:setDefaultValues({'+15'});
    obj.dataLink69:setName("dataLink69");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(52);
    obj.layout79:setTop(373);
    obj.layout79:setWidth(52);
    obj.layout79:setHeight(30);
    obj.layout79:setName("layout79");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout79);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(20.3);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(52);
    obj.edit69:setHeight(31);
    obj.edit69:setField("IDADE");
    obj.edit69:setName("edit69");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setTop(238);
    obj.layout80:setLeft(458);
    obj.layout80:setWidth(188);
    obj.layout80:setHeight(18);
    obj.layout80:setName("layout80");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout80);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(12);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(188);
    obj.edit70:setHeight(19);
    obj.edit70:setField("ATK2");
    obj.edit70:setName("edit70");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(125);
    obj.layout81:setTop(373);
    obj.layout81:setWidth(68);
    obj.layout81:setHeight(30);
    obj.layout81:setName("layout81");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout81);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(20.3);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(68);
    obj.edit71:setHeight(31);
    obj.edit71:setField("ALTURA");
    obj.edit71:setName("edit71");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setTop(259);
    obj.layout82:setLeft(458);
    obj.layout82:setWidth(188);
    obj.layout82:setHeight(18);
    obj.layout82:setName("layout82");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout82);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(12);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(188);
    obj.edit72:setHeight(19);
    obj.edit72:setField("ATK3");
    obj.edit72:setName("edit72");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(207);
    obj.layout83:setTop(373);
    obj.layout83:setWidth(68);
    obj.layout83:setHeight(30);
    obj.layout83:setName("layout83");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout83);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(20.3);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(68);
    obj.edit73:setHeight(31);
    obj.edit73:setField("PESO");
    obj.edit73:setName("edit73");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setTop(280);
    obj.layout84:setLeft(458);
    obj.layout84:setWidth(188);
    obj.layout84:setHeight(18);
    obj.layout84:setName("layout84");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout84);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(12);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(188);
    obj.edit74:setHeight(19);
    obj.edit74:setField("ATK4");
    obj.edit74:setName("edit74");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(117);
    obj.layout85:setTop(216);
    obj.layout85:setWidth(202);
    obj.layout85:setHeight(35);
    obj.layout85:setName("layout85");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout85);
    obj.imageCheckBox1:setField("CheckIDENTIDADE");
    obj.imageCheckBox1:setImageChecked("/Ficha_MM3ed_RRPG_image/images/PUBLICA.png");
    obj.imageCheckBox1:setImageUnchecked("/Ficha_MM3ed_RRPG_image/images/SECRETA.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(43);
    obj.layout86:setTop(243);
    obj.layout86:setWidth(202);
    obj.layout86:setHeight(35);
    obj.layout86:setName("layout86");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout86);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(10);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(202);
    obj.edit75:setHeight(36);
    obj.edit75:setField("ALIAS");
    obj.edit75:setHint("Notas sobre a Identidade. ");
    obj.edit75:setName("edit75");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setTop(302);
    obj.layout87:setLeft(458);
    obj.layout87:setWidth(188);
    obj.layout87:setHeight(18);
    obj.layout87:setName("layout87");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout87);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(12);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(188);
    obj.edit76:setHeight(19);
    obj.edit76:setField("ATK5");
    obj.edit76:setName("edit76");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setTop(323);
    obj.layout88:setLeft(458);
    obj.layout88:setWidth(188);
    obj.layout88:setHeight(18);
    obj.layout88:setName("layout88");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout88);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(12);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(188);
    obj.edit77:setHeight(19);
    obj.edit77:setField("ATK6");
    obj.edit77:setName("edit77");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setTop(345);
    obj.layout89:setLeft(458);
    obj.layout89:setWidth(188);
    obj.layout89:setHeight(18);
    obj.layout89:setName("layout89");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout89);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(12);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(188);
    obj.edit78:setHeight(19);
    obj.edit78:setField("ATK7");
    obj.edit78:setName("edit78");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setTop(366);
    obj.layout90:setLeft(458);
    obj.layout90:setWidth(188);
    obj.layout90:setHeight(18);
    obj.layout90:setName("layout90");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout90);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(12);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(188);
    obj.edit79:setHeight(19);
    obj.edit79:setField("ATK8");
    obj.edit79:setName("edit79");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setTop(388);
    obj.layout91:setLeft(458);
    obj.layout91:setWidth(188);
    obj.layout91:setHeight(18);
    obj.layout91:setName("layout91");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout91);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(12);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(188);
    obj.edit80:setHeight(19);
    obj.edit80:setField("ATK9");
    obj.edit80:setName("edit80");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setTop(409);
    obj.layout92:setLeft(458);
    obj.layout92:setWidth(188);
    obj.layout92:setHeight(18);
    obj.layout92:setName("layout92");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout92);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(12);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(188);
    obj.edit81:setHeight(19);
    obj.edit81:setField("ATK10");
    obj.edit81:setName("edit81");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(257);
    obj.layout93:setTop(28);
    obj.layout93:setWidth(180);
    obj.layout93:setHeight(242);
    obj.layout93:setName("layout93");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout93);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(12);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(180);
    obj.edit82:setHeight(243);
    obj.edit82:setField("untitled52");
    obj.edit82:setName("edit82");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.rectangle1);
    obj.dataLink70:setFields({'varFOR', 'varFORvalor'});
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.rectangle1);
    obj.dataLink71:setFields({'varAGI', 'varAGIvalor'});
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.rectangle1);
    obj.dataLink72:setFields({'varLUT', 'varLUTvalor'});
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.rectangle1);
    obj.dataLink73:setFields({'varPRO', 'varPROvalor'});
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.rectangle1);
    obj.dataLink74:setFields({'varVIG', 'varVIGvalor'});
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.rectangle1);
    obj.dataLink75:setFields({'varDES', 'varDESvalor'});
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.rectangle1);
    obj.dataLink76:setFields({'varINT', 'varINTvalor'});
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.rectangle1);
    obj.dataLink77:setFields({'varPRE', 'varPREvalor'});
    obj.dataLink77:setName("dataLink77");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setTop(214);
    obj.button1:setLeft(834);
    obj.button1:setWidth(22);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button1);
    obj.image2:setLeft(1);
    obj.image2:setWidth(20);
    obj.image2:setHeight(21);
    obj.image2:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image2:setName("image2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setTop(236);
    obj.button2:setLeft(834);
    obj.button2:setWidth(22);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button2);
    obj.image3:setLeft(1);
    obj.image3:setWidth(20);
    obj.image3:setHeight(21);
    obj.image3:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image3:setName("image3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setTop(258);
    obj.button3:setLeft(834);
    obj.button3:setWidth(22);
    obj.button3:setHeight(20);
    obj.button3:setName("button3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button3);
    obj.image4:setLeft(1);
    obj.image4:setWidth(20);
    obj.image4:setHeight(21);
    obj.image4:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image4:setName("image4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setTop(279);
    obj.button4:setLeft(834);
    obj.button4:setWidth(22);
    obj.button4:setHeight(20);
    obj.button4:setName("button4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button4);
    obj.image5:setLeft(1);
    obj.image5:setWidth(20);
    obj.image5:setHeight(21);
    obj.image5:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image5:setName("image5");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setTop(301);
    obj.button5:setLeft(834);
    obj.button5:setWidth(22);
    obj.button5:setHeight(20);
    obj.button5:setName("button5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button5);
    obj.image6:setLeft(1);
    obj.image6:setWidth(20);
    obj.image6:setHeight(21);
    obj.image6:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image6:setName("image6");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setTop(322);
    obj.button6:setLeft(834);
    obj.button6:setWidth(22);
    obj.button6:setHeight(20);
    obj.button6:setName("button6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button6);
    obj.image7:setLeft(1);
    obj.image7:setWidth(20);
    obj.image7:setHeight(21);
    obj.image7:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image7:setName("image7");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setTop(344);
    obj.button7:setLeft(834);
    obj.button7:setWidth(22);
    obj.button7:setHeight(20);
    obj.button7:setName("button7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.button7);
    obj.image8:setLeft(1);
    obj.image8:setWidth(20);
    obj.image8:setHeight(21);
    obj.image8:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image8:setName("image8");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setTop(365);
    obj.button8:setLeft(834);
    obj.button8:setWidth(22);
    obj.button8:setHeight(20);
    obj.button8:setName("button8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.button8);
    obj.image9:setLeft(1);
    obj.image9:setWidth(20);
    obj.image9:setHeight(21);
    obj.image9:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image9:setName("image9");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setTop(387);
    obj.button9:setLeft(834);
    obj.button9:setWidth(22);
    obj.button9:setHeight(20);
    obj.button9:setName("button9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.button9);
    obj.image10:setLeft(1);
    obj.image10:setWidth(20);
    obj.image10:setHeight(21);
    obj.image10:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image10:setName("image10");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setTop(408);
    obj.button10:setLeft(834);
    obj.button10:setWidth(22);
    obj.button10:setHeight(20);
    obj.button10:setName("button10");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.button10);
    obj.image11:setLeft(1);
    obj.image11:setWidth(20);
    obj.image11:setHeight(21);
    obj.image11:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image11:setName("image11");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(595);
    obj.layout94:setTop(78);
    obj.layout94:setWidth(24);
    obj.layout94:setHeight(15);
    obj.layout94:setName("layout94");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout94);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(9);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(24);
    obj.edit83:setHeight(16);
    obj.edit83:setField("DEFesq3");
    obj.edit83:setName("edit83");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout94);
    obj.dataLink78:setFields({'DEFesq3'});
    obj.dataLink78:setDefaultValues({'0'});
    obj.dataLink78:setName("dataLink78");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(621);
    obj.layout95:setTop(78);
    obj.layout95:setWidth(24);
    obj.layout95:setHeight(15);
    obj.layout95:setName("layout95");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout95);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(9);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(24);
    obj.edit84:setHeight(16);
    obj.edit84:setField("DEFesqTotal");
    obj.edit84:setName("edit84");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(595);
    obj.layout96:setTop(99);
    obj.layout96:setWidth(24);
    obj.layout96:setHeight(15);
    obj.layout96:setName("layout96");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout96);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(9);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(24);
    obj.edit85:setHeight(16);
    obj.edit85:setField("DEFapa3");
    obj.edit85:setName("edit85");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout96);
    obj.dataLink79:setFields({'DEFapa3'});
    obj.dataLink79:setDefaultValues({'0'});
    obj.dataLink79:setName("dataLink79");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(621);
    obj.layout97:setTop(99);
    obj.layout97:setWidth(24);
    obj.layout97:setHeight(15);
    obj.layout97:setName("layout97");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout97);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(9);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(24);
    obj.edit86:setHeight(16);
    obj.edit86:setField("DEFapaTotal");
    obj.edit86:setName("edit86");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(595);
    obj.layout98:setTop(120);
    obj.layout98:setWidth(24);
    obj.layout98:setHeight(15);
    obj.layout98:setName("layout98");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout98);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(9);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(24);
    obj.edit87:setHeight(16);
    obj.edit87:setField("DEFvon3");
    obj.edit87:setName("edit87");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout98);
    obj.dataLink80:setFields({'DEFvon3'});
    obj.dataLink80:setDefaultValues({'0'});
    obj.dataLink80:setName("dataLink80");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(621);
    obj.layout99:setTop(120);
    obj.layout99:setWidth(24);
    obj.layout99:setHeight(15);
    obj.layout99:setName("layout99");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout99);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(9);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(24);
    obj.edit88:setHeight(16);
    obj.edit88:setField("DEFvonTotal");
    obj.edit88:setName("edit88");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(777);
    obj.layout100:setTop(99);
    obj.layout100:setWidth(24);
    obj.layout100:setHeight(15);
    obj.layout100:setName("layout100");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout100);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(9);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(24);
    obj.edit89:setHeight(16);
    obj.edit89:setField("DEFres2");
    obj.edit89:setName("edit89");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout100);
    obj.dataLink81:setFields({'DEFres2'});
    obj.dataLink81:setDefaultValues({'0'});
    obj.dataLink81:setName("dataLink81");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(804);
    obj.layout101:setTop(99);
    obj.layout101:setWidth(24);
    obj.layout101:setHeight(15);
    obj.layout101:setName("layout101");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout101);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(9);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(24);
    obj.edit90:setHeight(16);
    obj.edit90:setField("DEFres3");
    obj.edit90:setName("edit90");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout101);
    obj.dataLink82:setFields({'DEFres3'});
    obj.dataLink82:setDefaultValues({'0'});
    obj.dataLink82:setName("dataLink82");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(831);
    obj.layout102:setTop(99);
    obj.layout102:setWidth(24);
    obj.layout102:setHeight(15);
    obj.layout102:setName("layout102");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout102);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(9);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(24);
    obj.edit91:setHeight(16);
    obj.edit91:setField("DEFresTotal");
    obj.edit91:setName("edit91");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(750);
    obj.layout103:setTop(120);
    obj.layout103:setWidth(24);
    obj.layout103:setHeight(15);
    obj.layout103:setName("layout103");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout103);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(9);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(24);
    obj.edit92:setHeight(16);
    obj.edit92:setField("DEFextra1");
    obj.edit92:setName("edit92");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(777);
    obj.layout104:setTop(120);
    obj.layout104:setWidth(24);
    obj.layout104:setHeight(15);
    obj.layout104:setName("layout104");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout104);
    obj.edit93:setTransparent(true);
    obj.edit93:setFontSize(9);
    obj.edit93:setFontColor("#000000");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setLeft(0);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(24);
    obj.edit93:setHeight(16);
    obj.edit93:setField("DEFextra2");
    obj.edit93:setName("edit93");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout104);
    obj.dataLink83:setFields({'DEFextra2'});
    obj.dataLink83:setDefaultValues({'0'});
    obj.dataLink83:setName("dataLink83");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(804);
    obj.layout105:setTop(120);
    obj.layout105:setWidth(24);
    obj.layout105:setHeight(15);
    obj.layout105:setName("layout105");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout105);
    obj.edit94:setTransparent(true);
    obj.edit94:setFontSize(9);
    obj.edit94:setFontColor("#000000");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(24);
    obj.edit94:setHeight(16);
    obj.edit94:setField("DEFextra3");
    obj.edit94:setName("edit94");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout105);
    obj.dataLink84:setFields({'DEFextra3'});
    obj.dataLink84:setDefaultValues({'0'});
    obj.dataLink84:setName("dataLink84");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(831);
    obj.layout106:setTop(120);
    obj.layout106:setWidth(24);
    obj.layout106:setHeight(15);
    obj.layout106:setName("layout106");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout106);
    obj.edit95:setTransparent(true);
    obj.edit95:setFontSize(9);
    obj.edit95:setFontColor("#000000");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(24);
    obj.edit95:setHeight(16);
    obj.edit95:setField("DEFextraTotal");
    obj.edit95:setName("edit95");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(254);
    obj.rectangle2:setTop(26);
    obj.rectangle2:setWidth(184);
    obj.rectangle2:setHeight(245);
    obj.rectangle2:setColor("#6cb098");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle1);
    obj.image12:setLeft(255);
    obj.image12:setTop(27);
    obj.image12:setWidth(182);
    obj.image12:setHeight(243);
    obj.image12:setField("avatar");
    obj.image12:setEditable(true);
    obj.image12:setStyle("autoFit");
    obj.image12:setName("image12");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.rectangle1);
    obj.dataLink85:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE', 'varFORvalor', 'varVIGvalor', 'varAGIvalor', 'varDESvalor', 'varLUTvalor', 'varINTvalor', 'varPROvalor', 'varPREvalor'});
    obj.dataLink85:setName("dataLink85");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.rectangle1);
    obj.dataLink86:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE', 'varFORvalor', 'varVIGvalor', 'varAGIvalor', 'varDESvalor', 'varLUTvalor', 'varINTvalor', 'varPROvalor', 'varPREvalor'});
    obj.dataLink86:setName("dataLink86");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.rectangle1);
    obj.dataLink87:setFields({'DEFesq1', 'DEFesq2', 'DEFesq3'});
    obj.dataLink87:setName("dataLink87");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.rectangle1);
    obj.dataLink88:setFields({'DEFapa1', 'DEFapa2', 'DEFapa3'});
    obj.dataLink88:setName("dataLink88");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.rectangle1);
    obj.dataLink89:setFields({'DEFvon1', 'DEFvon2', 'DEFvon3'});
    obj.dataLink89:setName("dataLink89");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.rectangle1);
    obj.dataLink90:setFields({'DEFforti1', 'DEFforti2', 'DEFforti3'});
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.rectangle1);
    obj.dataLink91:setFields({'DEFres1', 'DEFres2', 'DEFres3'});
    obj.dataLink91:setName("dataLink91");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.rectangle1);
    obj.dataLink92:setFields({'DEFextra1', 'DEFextra2', 'DEFextra3'});
    obj.dataLink92:setName("dataLink92");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(454);
    obj.button11:setTop(74);
    obj.button11:setWidth(85);
    obj.button11:setHeight(22);
    obj.button11:setText("ESQUIVAR");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(454);
    obj.button12:setTop(96);
    obj.button12:setWidth(85);
    obj.button12:setHeight(22);
    obj.button12:setText("APARAR");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setLeft(454);
    obj.button13:setTop(118);
    obj.button13:setWidth(85);
    obj.button13:setHeight(22);
    obj.button13:setText("VONTADE");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setLeft(651);
    obj.button14:setTop(74);
    obj.button14:setWidth(98);
    obj.button14:setHeight(22);
    obj.button14:setText("FORTITUDE");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setLeft(651);
    obj.button15:setTop(96);
    obj.button15:setWidth(98);
    obj.button15:setHeight(22);
    obj.button15:setText("RESISTENCIA");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle1);
    obj.button16:setLeft(590);
    obj.button16:setTop(171);
    obj.button16:setWidth(89);
    obj.button16:setHeight(21);
    obj.button16:setText("INICIATIVA");
    obj.button16:setName("button16");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.rectangle1);
    obj.dataLink93:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE'});
    obj.dataLink93:setName("dataLink93");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.rectangle1);
    obj.dataLink94:setField("PPpericias");
    obj.dataLink94:setName("dataLink94");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.rectangle1);
    obj.dataLink95:setField("pontosPericia");
    obj.dataLink95:setName("dataLink95");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.rectangle1);
    obj.dataLink96:setFields({'DEFesq2', 'DEFapa2', 'DEFvon2', 'DEFforti2', 'DEFres2', 'DEFextra2'});
    obj.dataLink96:setName("dataLink96");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.rectangle1);
    obj.dataLink97:setFields({'PPhabilidades', 'PPpericias', 'PPvantagens', 'PPdefesas', 'PPpoderes'});
    obj.dataLink97:setName("dataLink97");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Verso");
    obj.tab2:setName("tab2");

    obj.frmFicha_MM3ed_RRPG_image2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3ed_RRPG_image2_svg:setParent(obj.tab2);
    obj.frmFicha_MM3ed_RRPG_image2_svg:setName("frmFicha_MM3ed_RRPG_image2_svg");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setAlign("client");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setTheme("light");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmFicha_MM3ed_RRPG_image2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox2);
    obj.rectangle3:setWidth(893);
    obj.rectangle3:setHeight(1263);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle3);
    obj.image13:setLeft(0);
    obj.image13:setTop(0);
    obj.image13:setWidth(893);
    obj.image13:setHeight(1263);
    obj.image13:setSRC("/Ficha_MM3ed_RRPG_image/images/2.png");
    obj.image13:setStyle("stretch");
    obj.image13:setOptimize(true);
    obj.image13:setName("image13");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle3);
    obj.layout107:setLeft(43);
    obj.layout107:setTop(64);
    obj.layout107:setWidth(397);
    obj.layout107:setHeight(590);
    obj.layout107:setName("layout107");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout107);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(397);
    obj.textEditor4:setHeight(590);
    obj.textEditor4:setFontSize(16.5);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Historia");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle3);
    obj.layout108:setLeft(452);
    obj.layout108:setTop(933);
    obj.layout108:setWidth(397);
    obj.layout108:setHeight(305);
    obj.layout108:setName("layout108");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout108);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(397);
    obj.textEditor5:setHeight(305);
    obj.textEditor5:setFontSize(16.5);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Inimigos");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle3);
    obj.layout109:setLeft(43);
    obj.layout109:setTop(710);
    obj.layout109:setWidth(397);
    obj.layout109:setHeight(528);
    obj.layout109:setName("layout109");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout109);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(397);
    obj.textEditor6:setHeight(528);
    obj.textEditor6:setFontSize(16.5);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("Anotacoes");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle3);
    obj.layout110:setLeft(452);
    obj.layout110:setTop(620);
    obj.layout110:setWidth(397);
    obj.layout110:setHeight(256);
    obj.layout110:setName("layout110");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout110);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(398);
    obj.textEditor7:setHeight(256);
    obj.textEditor7:setFontSize(16.5);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("QGeneral");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle3);
    obj.layout111:setLeft(452);
    obj.layout111:setTop(287);
    obj.layout111:setWidth(397);
    obj.layout111:setHeight(276);
    obj.layout111:setName("layout111");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout111);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(398);
    obj.textEditor8:setHeight(276);
    obj.textEditor8:setFontSize(16.5);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("Complicacoes");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setLeft(450);
    obj.rectangle4:setTop(22);
    obj.rectangle4:setWidth(402);
    obj.rectangle4:setHeight(214);
    obj.rectangle4:setColor("#6cb098");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle3);
    obj.image14:setLeft(452);
    obj.image14:setTop(23);
    obj.image14:setWidth(399);
    obj.image14:setHeight(211);
    obj.image14:setField("sobmanto");
    obj.image14:setEditable(true);
    obj.image14:setStyle("proportional");
    obj.image14:setName("image14");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle3);
    obj.label30:setLeft(600);
    obj.label30:setTop(1240);
    obj.label30:setWidth(33);
    obj.label30:setHeight(20);
    obj.label30:setText("GILGANTE E JANUS - VERSAO DA FICHA: 2.8");
    obj.label30:setName("label30");
    obj.label30:setFontColor("black");
    obj.label30:setTextTrimming("none");
    obj.label30:setWordWrap(false);
    obj.label30:setAutoSize(true);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Pericias");
    obj.tab3:setName("tab3");

    obj.frmFichaRPGmeister3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister3_svg:setParent(obj.tab3);
    obj.frmFichaRPGmeister3_svg:setName("frmFichaRPGmeister3_svg");
    obj.frmFichaRPGmeister3_svg:setAlign("client");
    obj.frmFichaRPGmeister3_svg:setTheme("light");
    obj.frmFichaRPGmeister3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaRPGmeister3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");


			require("ndb.lua");
			local mms = ndb.load("mmsskills.xml");

			local function updateAtributes(num)
				if debug then
					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Atributos nas Pericias. ");
					index = index + 1;
				end;
				local atr = "" .. num;
				local mod = 0;
				
				if num == 1 then
					mod = SHEET.FOR();
				elseif num == 2 then
					mod = SHEET.VIG();
				elseif num == 3 then
					mod = SHEET.AGI();
				elseif num == 4 then
					mod = SHEET.DES();
				elseif num == 5 then
					mod = SHEET.LUT();
				elseif num == 6 then
					mod = SHEET.INT();
				elseif num == 7 then
					mod = SHEET.PRO();
				elseif num == 8 then
					mod = SHEET.PRE();
				end;

				local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					if nodes[i].chavePericia == atr then
						nodes[i].atributoPericia = SHEET;
					end;
				end
			end;

			local function updatePenalty()
				if debug then
					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Penalidade nas pericias.");
					index = index + 1;
				end;
				if sheet~=nil then
					local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
					for i=1, #nodes, 1 do
						if nodes[i].penalidadeArmadura or nodes[i].penalidadeArmadura2 then
							local pen = (tonumber(sheet.penalidade) or 0)

							local mod = 0;
							mod =   (tonumber(nodes[i].atributoPericia) or 0) +
									(tonumber(nodes[i].graduacaoPericia) or 0) +
									(tonumber(sheet.graduacaoVariavel) or 0) +
									(tonumber(nodes[i].penalidesPericia) or 0) +
									(tonumber(nodes[i].equipamentosPericia) or 0) +
									(tonumber(nodes[i].condicionalPericia) or 0);

							nodes[i].totalPericia = mod;
						end;
					end;
				end;
			end;
						
			local function dndSkills()				
				local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					ndb.deleteNode(nodes[i]);
				end;		

				for i=1, 17, 1 do
					local pericia = self.rclListaDasPericias:append();
					pericia.nomePericia = mms[i].nome;
					pericia.chavePericia = mms[i].chave;
					pericia.exigeTreino = mms[i].treino;
					pericia.exigeFerramentas = mms[i].ferramenta;
				end;

				self.rclListaDasPericias:sort();
				
			end;
		


    obj.popPericia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox3);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(85);
    obj.popPericia:setBackOpacity(0.4);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popPericia);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart1);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Penalidades");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart1);
    obj.edit96:setAlign("client");
    obj.edit96:setField("penalidesPericia");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(12);
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart2);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Poder/Equipamentos");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart2);
    obj.edit97:setAlign("client");
    obj.edit97:setField("equipamentosPericia");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(12);
    obj.edit97:setType("number");
    obj.edit97:setName("edit97");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart3);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Condicional");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart3);
    obj.edit98:setAlign("client");
    obj.edit98:setField("condicionalPericia");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(12);
    obj.edit98:setType("number");
    obj.edit98:setName("edit98");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.popPericia);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setText("Exige Treino");
    obj.checkBox1:setField("exigeTreino");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.popPericia);
    obj.checkBox2:setAlign("right");
    obj.checkBox2:setText("Exige Ferramentas");
    obj.checkBox2:setField("exigeFerramentas");
    obj.checkBox2:setName("checkBox2");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.scrollBox3);
    obj.layout112:setLeft(0);
    obj.layout112:setTop(45);
    obj.layout112:setWidth(893);
    obj.layout112:setHeight(685);
    obj.layout112:setName("layout112");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout112);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#50a48d");
    obj.rectangle5:setName("rectangle5");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.rectangle5);
    obj.image15:setLeft(0);
    obj.image15:setTop(0);
    obj.image15:setWidth(893);
    obj.image15:setHeight(1263);
    obj.image15:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo2.png");
    obj.image15:setStyle("stretch");
    obj.image15:setOptimize(true);
    obj.image15:setName("image15");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setColor("#264d43");
    obj.rectangle6:setLeft(20);
    obj.rectangle6:setTop(1);
    obj.rectangle6:setWidth(415);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setName("rectangle6");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setText("NOME DA PERÍCIA");
    obj.label34:setLeft(20);
    obj.label34:setTop(1);
    obj.label34:setWidth(135);
    obj.label34:setHeight(20);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle5);
    obj.label35:setText("HABILIDADE");
    obj.label35:setLeft(190);
    obj.label35:setTop(1);
    obj.label35:setWidth(100);
    obj.label35:setHeight(20);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle5);
    obj.label36:setText("GRAD");
    obj.label36:setLeft(294);
    obj.label36:setTop(1);
    obj.label36:setWidth(40);
    obj.label36:setHeight(20);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle5);
    obj.label37:setText("VAR");
    obj.label37:setLeft(333);
    obj.label37:setTop(1);
    obj.label37:setWidth(40);
    obj.label37:setHeight(20);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle5);
    obj.label38:setText("TOTAL");
    obj.label38:setLeft(375);
    obj.label38:setTop(1);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setColor("#264d43");
    obj.rectangle7:setLeft(465);
    obj.rectangle7:setTop(1);
    obj.rectangle7:setWidth(415);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setName("rectangle7");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle5);
    obj.label39:setText("NOME DA PERÍCIA");
    obj.label39:setLeft(475);
    obj.label39:setTop(1);
    obj.label39:setWidth(135);
    obj.label39:setHeight(20);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle5);
    obj.label40:setText("HABILIDADE");
    obj.label40:setLeft(635);
    obj.label40:setTop(1);
    obj.label40:setWidth(100);
    obj.label40:setHeight(20);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle5);
    obj.label41:setText("GRAD");
    obj.label41:setLeft(735);
    obj.label41:setTop(1);
    obj.label41:setWidth(40);
    obj.label41:setHeight(20);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle5);
    obj.label42:setText("VAR");
    obj.label42:setLeft(774);
    obj.label42:setTop(1);
    obj.label42:setWidth(40);
    obj.label42:setHeight(20);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle5);
    obj.label43:setText("TOTAL");
    obj.label43:setLeft(820);
    obj.label43:setTop(1);
    obj.label43:setWidth(40);
    obj.label43:setHeight(20);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rclListaDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.rectangle5);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaRPGmeister3p_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox3);
    obj.flowLayout2:setMinWidth(500);
    obj.flowLayout2:setMaxWidth(900);
    obj.flowLayout2:setHeight(45);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setName("flowLayout2");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout2);
    obj.rectangle8:setAlign("right");
    obj.rectangle8:setColor("#50a48d");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle8);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(135);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle9);
    obj.label44:setText("PONTOS DE PODER");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setLeft(0);
    obj.label44:setTop(0);
    obj.label44:setWidth(135);
    obj.label44:setHeight(20);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setMargins({left=250});
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle9);
    obj.label45:setField("pontosPericia");
    obj.label45:setAlign("left");
    obj.label45:setWidth(135);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setMargins({top=5});
    obj.label45:setName("label45");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle9);
    obj.button17:setText("Nova Perícia");
    obj.button17:setAlign("left");
    obj.button17:setWidth(125);
    obj.button17:setHeight(25);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle9);
    obj.button18:setText("Zerar e Listar Perícias");
    obj.button18:setAlign("left");
    obj.button18:setWidth(145);
    obj.button18:setHeight(25);
    obj.button18:setHint("Vai apagar todas perícias atuais. ");
    obj.button18:setName("button18");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Poderes");
    obj.tab4:setName("tab4");

    obj.frmFicha_MM3ed_RRPG_Power = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3ed_RRPG_Power:setParent(obj.tab4);
    obj.frmFicha_MM3ed_RRPG_Power:setName("frmFicha_MM3ed_RRPG_Power");
    obj.frmFicha_MM3ed_RRPG_Power:setAlign("client");
    obj.frmFicha_MM3ed_RRPG_Power:setTheme("light");
    obj.frmFicha_MM3ed_RRPG_Power:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFicha_MM3ed_RRPG_Power);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox4);
    obj.rectangle10:setWidth(700);
    obj.rectangle10:setHeight(1263);
    obj.rectangle10:setColor("#50a48d");
    obj.rectangle10:setName("rectangle10");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.rectangle10);
    obj.image16:setLeft(0);
    obj.image16:setTop(0);
    obj.image16:setWidth(893);
    obj.image16:setHeight(1263);
    obj.image16:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo.png");
    obj.image16:setStyle("stretch");
    obj.image16:setOptimize(true);
    obj.image16:setName("image16");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle10);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(30);
    obj.layout113:setMargins({bottom=4});
    obj.layout113:setName("layout113");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout113);
    obj.button19:setText("NOVO PODER");
    obj.button19:setWidth(150);
    obj.button19:setAlign("left");
    obj.button19:setName("button19");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.rectangle10);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmListaPoderes");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setHeight(30);
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.rectangle10);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setMargins({left=14, right=14});

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("#6cb098");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setHeight(500);
    obj.rectangle11:setPadding({top=7, left=7, right=7, bottom=7});
    obj.rectangle11:setName("rectangle11");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle11);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(30);
    obj.layout114:setMargins({bottom=4});
    obj.layout114:setName("layout114");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout114);
    obj.edit99:setTransparent(true);
    obj.edit99:setAlign("top");
    lfm_setPropAsString(obj.edit99, "fontStyle",  "bold");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setLeft(0);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(68);
    obj.edit99:setHeight(31);
    obj.edit99:setField("PoderNome");
    obj.edit99:setFontColor("white");
    obj.edit99:setName("edit99");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout114);
    obj.dataLink98:setFields({'PoderNome'});
    obj.dataLink98:setDefaultValues({'NOME DO PODER'});
    obj.dataLink98:setName("dataLink98");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle11);
    obj.layout115:setLeft(10);
    obj.layout115:setTop(40);
    obj.layout115:setWidth(350);
    obj.layout115:setHeight(600);
    obj.layout115:setName("layout115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout115);
    obj.layout116:setAlign("left");
    obj.layout116:setWidth(240);
    obj.layout116:setName("layout116");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout116);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setWidth(240);
    obj.rectangle12:setHeight(298);
    obj.rectangle12:setColor("#3f8270");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle12);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(14);
    obj.label46:setText("EFEITOS");
    obj.label46:setFontColor("white");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setMargins({top=1});
    obj.label46:setName("label46");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle12);
    obj.textEditor9:setAlign("top");
    obj.textEditor9:setField("PoderEfeito");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setFontColor("white");
    obj.textEditor9:setHeight(280);
    obj.textEditor9:setMargins({left=10, right=10});
    obj.textEditor9:setName("textEditor9");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.rectangle12);
    obj.dataLink99:setFields({'PoderEfeito'});
    obj.dataLink99:setDefaultValues({'Descreva os efeitos que estao associados a este Poder. Aproveite o espaco para anotar detalhes para nao precisar olhar o livro o tempo todo.'});
    obj.dataLink99:setName("dataLink99");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle11);
    obj.layout117:setLeft(10);
    obj.layout117:setTop(348);
    obj.layout117:setWidth(350);
    obj.layout117:setHeight(400);
    obj.layout117:setName("layout117");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout117);
    obj.layout118:setAlign("left");
    obj.layout118:setWidth(240);
    obj.layout118:setName("layout118");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout118);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setWidth(240);
    obj.rectangle13:setHeight(82);
    obj.rectangle13:setColor("#3f8270");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle13);
    obj.label47:setLeft(5);
    obj.label47:setFontSize(16);
    obj.label47:setText("Notas");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setFontColor("white");
    obj.label47:setVertTextAlign("center");
    obj.label47:setMargins({left=2});
    obj.label47:setName("label47");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle13);
    obj.textEditor10:setAlign("top");
    obj.textEditor10:setField("PoderNotas");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setFontColor("white");
    obj.textEditor10:setMargins({left=50});
    obj.textEditor10:setHeight(82);
    obj.textEditor10:setName("textEditor10");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.rectangle13);
    obj.dataLink100:setFields({'PoderNotas'});
    obj.dataLink100:setDefaultValues({'Descreva como o poder funciona na pratica e seus descritores'});
    obj.dataLink100:setName("dataLink100");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle11);
    obj.layout119:setLeft(10);
    obj.layout119:setTop(441);
    obj.layout119:setWidth(350);
    obj.layout119:setHeight(300);
    obj.layout119:setName("layout119");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout119);
    obj.layout120:setAlign("left");
    obj.layout120:setWidth(240);
    obj.layout120:setName("layout120");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout120);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setWidth(240);
    obj.rectangle14:setColor("#3f8270");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle14);
    obj.label48:setLeft(5);
    obj.label48:setFontSize(16);
    obj.label48:setText("Custo");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setFontColor("white");
    obj.label48:setVertTextAlign("center");
    obj.label48:setMargins({left=10});
    obj.label48:setName("label48");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle14);
    obj.textEditor11:setAlign("top");
    obj.textEditor11:setField("PoderCusto");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setFontColor("white");
    obj.textEditor11:setMargins({left=50});
    obj.textEditor11:setName("textEditor11");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.rectangle14);
    obj.dataLink101:setFields({'PoderCusto'});
    obj.dataLink101:setDefaultValues({'Total de Pontos de Poder investidos = (Grad + Extras - Falhas) x Custo + Extras Fixos - Falhas Fixas.'});
    obj.dataLink101:setName("dataLink101");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle11);
    obj.layout121:setLeft(140);
    obj.layout121:setTop(40);
    obj.layout121:setWidth(250);
    obj.layout121:setHeight(200);
    obj.layout121:setName("layout121");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout121);
    obj.rectangle15:setAlign("right");
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setColor("#3f8270");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle15);
    obj.label49:setAlign("bottom");
    obj.label49:setFontSize(12);
    obj.label49:setText("IMAGEM");
    obj.label49:setFontColor("white");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setMargins({bottom=1});
    obj.label49:setName("label49");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.rectangle15);
    obj.image17:setAlign("right");
    obj.image17:setEditable(true);
    obj.image17:setField("PoderImagem");
    obj.image17:setWidth(130);
    obj.image17:setMargins({top=1});
    obj.image17:setName("image17");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle11);
    obj.layout122:setLeft(260);
    obj.layout122:setTop(252);
    obj.layout122:setWidth(130);
    obj.layout122:setHeight(38);
    obj.layout122:setName("layout122");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout122);
    obj.rectangle16:setAlign("right");
    obj.rectangle16:setWidth(130);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("#3f8270");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle16);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(12);
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setText("DEFESA");
    obj.label50:setFontColor("white");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.rectangle16);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setField("PoderDefesa");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'NENHUMA', 'ESQUIVA', 'APARAR', 'FORTITUDE', 'VONTADE', 'RESISTENCIA'});
    obj.comboBox11:setName("comboBox11");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.rectangle16);
    obj.dataLink102:setFields({'PoderDefesa'});
    obj.dataLink102:setDefaultValues({'NENHUMA'});
    obj.dataLink102:setName("dataLink102");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle11);
    obj.layout123:setLeft(260);
    obj.layout123:setTop(300);
    obj.layout123:setWidth(130);
    obj.layout123:setHeight(38);
    obj.layout123:setName("layout123");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout123);
    obj.rectangle17:setAlign("right");
    obj.rectangle17:setWidth(130);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("#3f8270");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle17);
    obj.label51:setAlign("top");
    obj.label51:setFontSize(12);
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setText("ACAO");
    obj.label51:setFontColor("white");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.rectangle17);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setField("PoderAcao");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'NENHUMA', 'LIVRE', 'REACAO', 'MOVIMENTO', 'PADRAO'});
    obj.comboBox12:setName("comboBox12");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.rectangle17);
    obj.dataLink103:setFields({'PoderAcao'});
    obj.dataLink103:setDefaultValues({'NENHUMA'});
    obj.dataLink103:setName("dataLink103");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle11);
    obj.layout124:setLeft(140);
    obj.layout124:setTop(348);
    obj.layout124:setWidth(250);
    obj.layout124:setHeight(18);
    obj.layout124:setName("layout124");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout124);
    obj.rectangle18:setAlign("right");
    obj.rectangle18:setWidth(130);
    obj.rectangle18:setColor("#3f8270");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle18);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(12);
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("ALCANCE");
    obj.label52:setFontColor("white");
    obj.label52:setName("label52");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle11);
    obj.layout125:setLeft(140);
    obj.layout125:setTop(364);
    obj.layout125:setWidth(250);
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout125);
    obj.edit100:setAlign("right");
    obj.edit100:setWidth(130);
    obj.edit100:setField("PoderAlcance");
    obj.edit100:setName("edit100");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout125);
    obj.dataLink104:setFields({'PoderAlcance'});
    obj.dataLink104:setDefaultValues({'Pessoal, Perto, Percepcao, ou o valor da tabela de referencia'});
    obj.dataLink104:setName("dataLink104");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle11);
    obj.layout126:setLeft(140);
    obj.layout126:setTop(398);
    obj.layout126:setWidth(250);
    obj.layout126:setHeight(18);
    obj.layout126:setName("layout126");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout126);
    obj.rectangle19:setAlign("right");
    obj.rectangle19:setWidth(130);
    obj.rectangle19:setColor("#3f8270");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle19);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(12);
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("DURACAO");
    obj.label53:setFontColor("white");
    obj.label53:setName("label53");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle11);
    obj.layout127:setLeft(140);
    obj.layout127:setTop(414);
    obj.layout127:setWidth(250);
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout127);
    obj.edit101:setAlign("right");
    obj.edit101:setWidth(130);
    obj.edit101:setField("PoderDuracao");
    obj.edit101:setName("edit101");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout127);
    obj.dataLink105:setFields({'PoderDuracao'});
    obj.dataLink105:setDefaultValues({'Instantaneo, Sustentado, Continuo ou Permanente'});
    obj.dataLink105:setName("dataLink105");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle11);
    obj.layout128:setLeft(140);
    obj.layout128:setTop(449);
    obj.layout128:setWidth(250);
    obj.layout128:setHeight(18);
    obj.layout128:setName("layout128");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout128);
    obj.rectangle20:setAlign("right");
    obj.rectangle20:setWidth(130);
    obj.rectangle20:setColor("#3f8270");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle20);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(12);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("REFERENCIA");
    obj.label54:setFontColor("white");
    obj.label54:setName("label54");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle11);
    obj.layout129:setLeft(140);
    obj.layout129:setTop(466);
    obj.layout129:setWidth(250);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout129);
    obj.edit102:setAlign("right");
    obj.edit102:setWidth(130);
    obj.edit102:setField("PoderReferencia");
    obj.edit102:setName("edit102");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout129);
    obj.dataLink106:setFields({'PoderReferencia'});
    obj.dataLink106:setDefaultValues({'Pagina e Livro de Ref'});
    obj.dataLink106:setName("dataLink106");

    obj._e_event0 = obj.dataLink70:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varFORvalor or 0);								
            					sheet.varFOR = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varFOR = "+" .. bonus;
            					else	
            						sheet.varFOR = bonus;
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink71:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varAGIvalor or 0);								
            					sheet.varAGI = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varAGI = "+" .. bonus;
            					else	
            						sheet.varAGI = bonus;
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink72:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varLUTvalor or 0);								
            					sheet.varLUT = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varLUT = "+" .. bonus;
            					else	
            						sheet.varLUT = bonus;
            					end;
        end, obj);

    obj._e_event3 = obj.dataLink73:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varPROvalor or 0);								
            					sheet.varPRO = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varPRO = "+" .. bonus;
            					else	
            						sheet.varPRO = bonus;
            					end;
        end, obj);

    obj._e_event4 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varVIGvalor or 0);								
            					sheet.varVIG = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varVIG = "+" .. bonus;
            					else	
            						sheet.varVIG = bonus;
            					end;
        end, obj);

    obj._e_event5 = obj.dataLink75:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varDESvalor or 0);								
            					sheet.varDES = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varDES = "+" .. bonus;
            					else	
            						sheet.varDES = bonus;
            					end;
        end, obj);

    obj._e_event6 = obj.dataLink76:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varINTvalor or 0);								
            					sheet.varINT = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varINT = "+" .. bonus;
            					else	
            						sheet.varINT = bonus;
            					end;
        end, obj);

    obj._e_event7 = obj.dataLink77:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varPREvalor or 0);								
            					sheet.varPRE = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varPRE = "+" .. bonus;
            					else	
            						sheet.varPRE = bonus;
            					end;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK1tipo == nil then
            										sheet.ATK1tipo = "-";
            									end;
            									
            									if sheet.ATK1dano == nil then
            										sheet.ATK1dano = "0";
            									end;
            								
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK1mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK1dano or 0) + tonumber(sheet.ATK1TesteCD or 0))
            
            								local tipo = sheet.ATK1tipo
            								local descricao = "Ataque 1 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK1dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK1 ~= nil then
            									   descricao = sheet.ATK1 ..  " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK1dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK2tipo == nil then
            										sheet.ATK2tipo = "-";
            									end;
            									
            									if sheet.ATK2dano == nil then
            										sheet.ATK2dano = "0";
            									end;
            								
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK2mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK2dano or 0) + tonumber(sheet.ATK2TesteCD or 0))
            								local tipo = sheet.ATK2tipo
            								local descricao = "Ataque 2 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK2dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK2 ~= nil then
            									   descricao = sheet.ATK2 ..  " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK2dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK3tipo == nil then
            										sheet.ATK3tipo = "-";
            									end;
            									
            									if sheet.ATK3dano == nil then
            										sheet.ATK3dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK3mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK3dano or 0) + tonumber(sheet.ATK3TesteCD or 0))
            								local tipo = sheet.ATK3tipo
            								local descricao = "Ataque 3 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK3dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK3 ~= nil then
            									   descricao = sheet.ATK3 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK3dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK4tipo == nil then
            										sheet.ATK4tipo = "-";
            									end;
            									
            									if sheet.ATK4dano == nil then
            										sheet.ATK4dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK4mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK4dano or 0) + tonumber(sheet.ATK4TesteCD or 0))
            								local tipo = sheet.ATK4tipo
            								local descricao = "Ataque 4 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK4dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK4 ~= nil then
            									   descricao = sheet.ATK4 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK4dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK5tipo == nil then
            										sheet.ATK5tipo = "-";
            									end;
            									
            									if sheet.ATK5dano == nil then
            										sheet.ATK5dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK5mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK5dano or 0) + tonumber(sheet.ATK5TesteCD or 0))
            								local tipo = sheet.ATK5tipo
            								local descricao = "Ataque 5 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK5dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK5 ~= nil then
            									   descricao = sheet.ATK5 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK5dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK6tipo == nil then
            										sheet.ATK6tipo = "-";
            									end;
            									
            									if sheet.ATK6dano == nil then
            										sheet.ATK6dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK6mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK6dano or 0) + tonumber(sheet.ATK6TesteCD or 0))
            								local tipo = sheet.ATK6tipo
            								local descricao = "Ataque 6 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK6dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK6 ~= nil then
            									   descricao = sheet.ATK6 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK6dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event14 = obj.button7:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK7tipo == nil then
            										sheet.ATK7tipo = "-";
            									end;
            									
            									if sheet.ATK7dano == nil then
            										sheet.ATK7dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK7mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK7dano or 0) + tonumber(sheet.ATK7TesteCD or 0))
            								local tipo = sheet.ATK7tipo
            								local descricao = "Ataque 7 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK7dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK7 ~= nil then
            									   descricao = sheet.ATK7 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK7dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK8tipo == nil then
            										sheet.ATK8tipo = "-";
            									end;
            									
            									if sheet.ATK8dano == nil then
            										sheet.ATK8dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK8mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK8dano or 0) + tonumber(sheet.ATK8TesteCD or 0))
            								local tipo = sheet.ATK8tipo
            								local descricao = "Ataque 8 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK8dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK8 ~= nil then
            									   descricao = sheet.ATK8 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK8dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK9tipo == nil then
            										sheet.ATK9tipo = "-";
            									end;
            									
            									if sheet.ATK9dano == nil then
            										sheet.ATK9dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK9mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK9dano or 0) + tonumber(sheet.ATK9TesteCD or 0))
            								local tipo = sheet.ATK9tipo
            								local descricao = "Ataque 9 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK9dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK9 ~= nil then
            									   descricao = sheet.ATK9 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK9dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								
            									if sheet.ATK10tipo == nil then
            										sheet.ATK10tipo = "-";
            									end;
            									
            									if sheet.ATK10dano == nil then
            										sheet.ATK10dano = "0";
            									end;
            								
            
            								local rolagem = rrpg.interpretarRolagem(sheet.ATK10mod); 
            								local dificuldade = math.floor(tonumber(sheet.ATK10dano or 0) + tonumber(sheet.ATK10TesteCD or 0))
            								local tipo = sheet.ATK10tipo
            								local descricao = "Ataque 10 - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK10dano .. " - CD: " .. dificuldade .. "";
            
            								if sheet.ATK10 ~= nil then
            									   descricao = sheet.ATK10 .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATK10dano .. " - CD: " .. dificuldade .. "";
            								end;
            
            								if not rolagem.possuiAlgumDado then
            									   rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
            
            								end; 
            
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            								if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, descricao)
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event18 = obj.image12:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event19 = obj.dataLink85:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFesq1 = (tonumber(sheet.AGI) or 0) + (tonumber(sheet.varAGIvalor) or 0);
                           sheet.DEFapa1 = (tonumber(sheet.LUT) or 0) + (tonumber(sheet.varLUTvalor) or 0);
                           sheet.DEFvon1 = (tonumber(sheet.PRO) or 0) + (tonumber(sheet.varPROvalor) or 0);
                           sheet.DEFforti1 = (tonumber(sheet.VIG) or 0) + (tonumber(sheet.varVIGvalor) or 0);
                           sheet.DEFres1 = (tonumber(sheet.VIG) or 0) + (tonumber(sheet.varVIGvalor) or 0);
        end, obj);

    obj._e_event20 = obj.dataLink86:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.FORtotal = (tonumber(sheet.FOR) or 0) + (tonumber(sheet.varFORvalor) or 0);
                           sheet.VIGtotal = (tonumber(sheet.VIG) or 0) + (tonumber(sheet.varVIGvalor) or 0);
            			   sheet.AGItotal = (tonumber(sheet.AGI) or 0) + (tonumber(sheet.varAGIvalor) or 0);
            			   sheet.DEStotal = (tonumber(sheet.DES) or 0) + (tonumber(sheet.varDESvalor) or 0);
                           sheet.LUTtotal = (tonumber(sheet.LUT) or 0) + (tonumber(sheet.varLUTvalor) or 0);
                           sheet.INTtotal = (tonumber(sheet.INT) or 0) + (tonumber(sheet.varINTvalor) or 0);
                           sheet.PROtotal = (tonumber(sheet.PRO) or 0) + (tonumber(sheet.varPROvalor) or 0);
                           sheet.PREtotal = (tonumber(sheet.PRE) or 0) + (tonumber(sheet.varPREvalor) or 0);
        end, obj);

    obj._e_event21 = obj.dataLink87:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFesqTotal = (tonumber(sheet.DEFesq1) or 0) + (tonumber(sheet.DEFesq2) or 0) + (tonumber(sheet.DEFesq3) or 0);
        end, obj);

    obj._e_event22 = obj.dataLink88:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFapaTotal = (tonumber(sheet.DEFapa1) or 0) + (tonumber(sheet.DEFapa2) or 0) + (tonumber(sheet.DEFapa3) or 0);
        end, obj);

    obj._e_event23 = obj.dataLink89:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFvonTotal = (tonumber(sheet.DEFvon1) or 0) + (tonumber(sheet.DEFvon2) or 0) + (tonumber(sheet.DEFvon3) or 0);
        end, obj);

    obj._e_event24 = obj.dataLink90:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFfortiTotal = (tonumber(sheet.DEFforti1) or 0) + (tonumber(sheet.DEFforti2) or 0) + (tonumber(sheet.DEFforti3) or 0);
        end, obj);

    obj._e_event25 = obj.dataLink91:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFresTotal = (tonumber(sheet.DEFres1) or 0) + (tonumber(sheet.DEFres2) or 0) + (tonumber(sheet.DEFres3) or 0);
        end, obj);

    obj._e_event26 = obj.dataLink92:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFextraTotal = (tonumber(sheet.DEFextra1) or 0) + (tonumber(sheet.DEFextra2) or 0) + (tonumber(sheet.DEFextra3) or 0);
        end, obj);

    obj._e_event27 = obj.button11:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.DEFesqTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Esquivar");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event28 = obj.button12:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.DEFapaTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Aparar");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event29 = obj.button13:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.DEFvonTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Vontade");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event30 = obj.button14:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.DEFfortiTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Fortitude");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event31 = obj.button15:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.DEFresTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Resistencia");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event32 = obj.button16:addEventListener("onClick",
        function (_)
            local personagem = rrpg.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = rrpg.interpretarRolagem(sheet.Iniciativa); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, "Iniciativa");
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event33 = obj.dataLink93:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPhabilidades = ((tonumber(sheet.FOR) or 0) +
                                                      (tonumber(sheet.VIG) or 0) +
                                                      (tonumber(sheet.AGI) or 0) +
                                                      (tonumber(sheet.DES) or 0) +
                                                      (tonumber(sheet.LUT) or 0) +
                                                      (tonumber(sheet.INT) or 0) +
                                                      (tonumber(sheet.PRO) or 0) +
                                                      (tonumber(sheet.PRE) or 0)) * 2;
        end, obj);

    obj._e_event34 = obj.dataLink94:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPpericiasgrad = math.floor(sheet.PPpericias or 0) * 2;
        end, obj);

    obj._e_event35 = obj.dataLink95:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPpericias = math.floor(sheet.pontosPericia or 0) ;
        end, obj);

    obj._e_event36 = obj.dataLink96:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPdefesas = (tonumber(sheet.DEFesq2) or 0) +
            								 (tonumber(sheet.DEFapa2) or 0) +
            								 (tonumber(sheet.DEFvon2) or 0) +
            								 (tonumber(sheet.DEFforti2) or 0) +
            								 (tonumber(sheet.DEFres2) or 0) +
            								 (tonumber(sheet.DEFextra2) or 0);
        end, obj);

    obj._e_event37 = obj.dataLink97:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPsomatotal = (tonumber(sheet.PPhabilidades) or 0) +
                                                    (tonumber(sheet.PPpericias) or 0) +
                                                    (tonumber(sheet.PPvantagens) or 0) +
                                                    (tonumber(sheet.PPdefesas) or 0) +
                                                    (tonumber(sheet.PPpoderes) or 0);                  
            
                                if sheet.PPsomatotal >= 0 then
                                    sheet.PPsomatotal = sheet.PPsomatotal .. " PONTOS DE PODER";
                                end;
        end, obj);

    obj._e_event38 = obj.image14:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.sobmanto);
        end, obj);

    obj._e_event39 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event40 = obj.button17:addEventListener("onClick",
        function (_)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event41 = obj.button18:addEventListener("onClick",
        function (_)
            dndSkills();
        end, obj);

    obj._e_event42 = obj.button19:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event43 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode; 
                                         self.boxDetalhesDoItem.node = node;                       
            
                                          self.boxDetalhesDoItem.visible = (node ~= nil);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.frmFichaRPGmeister3_svg ~= nil then self.frmFichaRPGmeister3_svg:destroy(); self.frmFichaRPGmeister3_svg = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.frmFicha_MM3ed_RRPG_image2_svg ~= nil then self.frmFicha_MM3ed_RRPG_image2_svg:destroy(); self.frmFicha_MM3ed_RRPG_image2_svg = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.frmFicha_MM3ed_RRPG_Power ~= nil then self.frmFicha_MM3ed_RRPG_Power:destroy(); self.frmFicha_MM3ed_RRPG_Power = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.frmFicha_MM3e_RRPG1_svg ~= nil then self.frmFicha_MM3e_RRPG1_svg:destroy(); self.frmFicha_MM3e_RRPG1_svg = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha_MM3ed_RRPG_image()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha_MM3ed_RRPG_image();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha_MM3ed_RRPG_image = {
    newEditor = newfrmFicha_MM3ed_RRPG_image, 
    new = newfrmFicha_MM3ed_RRPG_image, 
    name = "frmFicha_MM3ed_RRPG_image", 
    dataType = "MM3e_RRPG_2_7", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "MM3e_2_7", 
    description=""};

frmFicha_MM3ed_RRPG_image = _frmFicha_MM3ed_RRPG_image;
Firecast.registrarForm(_frmFicha_MM3ed_RRPG_image);
Firecast.registrarDataType(_frmFicha_MM3ed_RRPG_image);

return _frmFicha_MM3ed_RRPG_image;
