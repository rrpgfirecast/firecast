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
    obj:setDataType("Ficha_MM3e");
    obj:setTitle("M&M3e");
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
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/Parede_1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(257);
    obj.layout1:setTop(28);
    obj.layout1:setWidth(180);
    obj.layout1:setHeight(242);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(12);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(180);
    obj.edit1:setHeight(243);
    obj.edit1:setField("untitled52");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(459);
    obj.layout2:setTop(470);
    obj.layout2:setWidth(391);
    obj.layout2:setHeight(937);
    obj.layout2:setName("layout2");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout2);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(391);
    obj.richEdit1:setHeight(687);
    obj.richEdit1:setField("PODERES");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "16.5");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
    obj.richEdit1:setName("richEdit1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'PODERES'});
    obj.dataLink1:setDefaultValues({'PODERES\n ✲ Nome do Poder ● custo final \n\n ✲ Nome do Poder ● custo final\n\n ✲ Nome do Poder ● custo final\n\n ✲ Nome do Poder ● custo final '});
    obj.dataLink1:setName("dataLink1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(43);
    obj.layout3:setTop(105);
    obj.layout3:setWidth(202);
    obj.layout3:setHeight(35);
    obj.layout3:setName("layout3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(18);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(202);
    obj.edit2:setHeight(36);
    obj.edit2:setField("JOGADOR");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(43);
    obj.layout4:setTop(186);
    obj.layout4:setWidth(202);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(18);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(202);
    obj.edit3:setHeight(36);
    obj.edit3:setField("IDENTIDADE");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(44);
    obj.layout5:setTop(285);
    obj.layout5:setWidth(257);
    obj.layout5:setHeight(40);
    obj.layout5:setName("layout5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(22);
    obj.edit4:setFontColor("#000000");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(257);
    obj.edit4:setHeight(40);
    obj.edit4:setField("CODINOME");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(381);
    obj.layout6:setTop(291);
    obj.layout6:setWidth(51);
    obj.layout6:setHeight(53);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(37.6);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(51);
    obj.edit5:setHeight(54);
    obj.edit5:setField("NP");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(315);
    obj.layout7:setTop(279);
    obj.layout7:setWidth(52);
    obj.layout7:setHeight(16);
    obj.layout7:setHint("Afeta em -1 em todas as suas habilidades");
    obj.layout7:setName("layout7");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout7);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setText("HeroHigh");
    obj.checkBox1:setFontSize(8);
    obj.checkBox1:setFontColor("white");
    obj.checkBox1:setField("HeroHigh");
    obj.checkBox1:setName("checkBox1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(377);
    obj.layout8:setTop(360);
    obj.layout8:setWidth(61);
    obj.layout8:setHeight(33);
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(22.6);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(61);
    obj.edit6:setHeight(34);
    obj.edit6:setField("PONTOSDEPODER");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(377);
    obj.layout9:setTop(405);
    obj.layout9:setWidth(61);
    obj.layout9:setHeight(33);
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(22.6);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(61);
    obj.edit7:setHeight(34);
    obj.edit7:setField("PONTOSHEROICOS");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(62);
    obj.layout10:setTop(486);
    obj.layout10:setWidth(80);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20.3);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(52);
    obj.edit8:setHeight(31);
    obj.edit8:setField("FOR");
    obj.edit8:setName("edit8");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setFields({'FOR'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout10);
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

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(12);
    obj.edit9:setFontColor("#85bbb1");
    obj.edit9:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(49);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(20);
    obj.edit9:setHeight(20);
    obj.edit9:setField("varFORvalor");
    obj.edit9:setName("edit9");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setFields({'varFORvalor'});
    obj.dataLink3:setDefaultValues({'0'});
    obj.dataLink3:setName("dataLink3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout10);
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

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setFields({'varFOR'});
    obj.dataLink4:setDefaultValues({'0'});
    obj.dataLink4:setName("dataLink4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout10);
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

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setFields({'varFOR', 'varFORvalor'});
    obj.dataLink5:setName("dataLink5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(39);
    obj.button1:setTop(450);
    obj.button1:setWidth(99);
    obj.button1:setHeight(36);
    obj.button1:setText("");
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button1);
    obj.image2:setAlign("top");
    obj.image2:setMargins({top=-1});
    obj.image2:setWidth(100);
    obj.image2:setHeight(40);
    obj.image2:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_FOR.png");
    obj.image2:setName("image2");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(162);
    obj.layout11:setTop(486);
    obj.layout11:setWidth(80);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(20.3);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(52);
    obj.edit10:setHeight(31);
    obj.edit10:setField("AGI");
    obj.edit10:setName("edit10");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout11);
    obj.dataLink6:setFields({'AGI'});
    obj.dataLink6:setDefaultValues({'0'});
    obj.dataLink6:setName("dataLink6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout11);
    obj.label4:setVisible(false);
    obj.label4:setFontSize(20.3);
    obj.label4:setFontColor("#000000");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(52);
    obj.label4:setHeight(31);
    obj.label4:setField("AGItotal");
    obj.label4:setName("label4");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(12);
    obj.edit11:setFontColor("#85bbb1");
    obj.edit11:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setLeft(49);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(20);
    obj.edit11:setHeight(20);
    obj.edit11:setField("varAGIvalor");
    obj.edit11:setName("edit11");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout11);
    obj.dataLink7:setFields({'varAGIvalor'});
    obj.dataLink7:setDefaultValues({'0'});
    obj.dataLink7:setName("dataLink7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout11);
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#264d43");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setLeft(49);
    obj.label5:setTop(6);
    obj.label5:setWidth(20);
    obj.label5:setHeight(20);
    obj.label5:setField("varAGI");
    obj.label5:setName("label5");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout11);
    obj.dataLink8:setFields({'varAGI'});
    obj.dataLink8:setDefaultValues({'0'});
    obj.dataLink8:setName("dataLink8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout11);
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

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle1);
    obj.dataLink9:setFields({'varAGI', 'varAGIvalor'});
    obj.dataLink9:setName("dataLink9");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(139);
    obj.button2:setTop(450);
    obj.button2:setWidth(99);
    obj.button2:setHeight(36);
    obj.button2:setText("");
    obj.button2:setName("button2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button2);
    obj.image3:setAlign("top");
    obj.image3:setMargins({top=-1});
    obj.image3:setWidth(100);
    obj.image3:setHeight(40);
    obj.image3:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_AGI.png");
    obj.image3:setName("image3");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(263);
    obj.layout12:setTop(486);
    obj.layout12:setWidth(80);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(20.3);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(52);
    obj.edit12:setHeight(31);
    obj.edit12:setField("LUT");
    obj.edit12:setName("edit12");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout12);
    obj.dataLink10:setFields({'LUT'});
    obj.dataLink10:setDefaultValues({'0'});
    obj.dataLink10:setName("dataLink10");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout12);
    obj.label7:setVisible(false);
    obj.label7:setFontSize(20.3);
    obj.label7:setFontColor("#000000");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(52);
    obj.label7:setHeight(31);
    obj.label7:setField("LUTtotal");
    obj.label7:setName("label7");
    obj.label7:setTextTrimming("none");
    obj.label7:setWordWrap(false);
    obj.label7:setAutoSize(true);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(12);
    obj.edit13:setFontColor("#85bbb1");
    obj.edit13:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setLeft(49);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(20);
    obj.edit13:setHeight(20);
    obj.edit13:setField("varLUTvalor");
    obj.edit13:setName("edit13");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout12);
    obj.dataLink11:setFields({'varLUTvalor'});
    obj.dataLink11:setDefaultValues({'0'});
    obj.dataLink11:setName("dataLink11");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout12);
    obj.label8:setFontSize(12);
    obj.label8:setFontColor("#264d43");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setLeft(49);
    obj.label8:setTop(6);
    obj.label8:setWidth(20);
    obj.label8:setHeight(20);
    obj.label8:setField("varLUT");
    obj.label8:setName("label8");
    obj.label8:setTextTrimming("none");
    obj.label8:setWordWrap(false);
    obj.label8:setAutoSize(true);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout12);
    obj.dataLink12:setFields({'varLUT'});
    obj.dataLink12:setDefaultValues({'0'});
    obj.dataLink12:setName("dataLink12");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout12);
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

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle1);
    obj.dataLink13:setFields({'varLUT', 'varLUTvalor'});
    obj.dataLink13:setName("dataLink13");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(239);
    obj.button3:setTop(450);
    obj.button3:setWidth(99);
    obj.button3:setHeight(36);
    obj.button3:setText("");
    obj.button3:setName("button3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button3);
    obj.image4:setAlign("top");
    obj.image4:setMargins({top=-1});
    obj.image4:setWidth(100);
    obj.image4:setHeight(40);
    obj.image4:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_LUT.png");
    obj.image4:setName("image4");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(364);
    obj.layout13:setTop(486);
    obj.layout13:setWidth(80);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(20.3);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(52);
    obj.edit14:setHeight(31);
    obj.edit14:setField("PRO");
    obj.edit14:setName("edit14");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout13);
    obj.dataLink14:setFields({'PRO'});
    obj.dataLink14:setDefaultValues({'0'});
    obj.dataLink14:setName("dataLink14");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout13);
    obj.label10:setVisible(false);
    obj.label10:setFontSize(20.3);
    obj.label10:setFontColor("#000000");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(52);
    obj.label10:setHeight(31);
    obj.label10:setField("PROtotal");
    obj.label10:setName("label10");
    obj.label10:setTextTrimming("none");
    obj.label10:setWordWrap(false);
    obj.label10:setAutoSize(true);

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout13);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(12);
    obj.edit15:setFontColor("#85bbb1");
    obj.edit15:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setLeft(49);
    obj.edit15:setTop(5);
    obj.edit15:setWidth(20);
    obj.edit15:setHeight(20);
    obj.edit15:setField("varPROvalor");
    obj.edit15:setName("edit15");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout13);
    obj.dataLink15:setFields({'varPROvalor'});
    obj.dataLink15:setDefaultValues({'0'});
    obj.dataLink15:setName("dataLink15");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout13);
    obj.label11:setFontSize(12);
    obj.label11:setFontColor("#264d43");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setLeft(49);
    obj.label11:setTop(6);
    obj.label11:setWidth(20);
    obj.label11:setHeight(20);
    obj.label11:setField("varPRO");
    obj.label11:setName("label11");
    obj.label11:setTextTrimming("none");
    obj.label11:setWordWrap(false);
    obj.label11:setAutoSize(true);

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout13);
    obj.dataLink16:setFields({'varPRO'});
    obj.dataLink16:setDefaultValues({'0'});
    obj.dataLink16:setName("dataLink16");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
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

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle1);
    obj.dataLink17:setFields({'varPRO', 'varPROvalor'});
    obj.dataLink17:setName("dataLink17");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(339);
    obj.button4:setTop(450);
    obj.button4:setWidth(99);
    obj.button4:setHeight(36);
    obj.button4:setText("");
    obj.button4:setName("button4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button4);
    obj.image5:setAlign("top");
    obj.image5:setMargins({top=-1});
    obj.image5:setWidth(100);
    obj.image5:setHeight(40);
    obj.image5:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_PRO.png");
    obj.image5:setName("image5");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(63);
    obj.layout14:setTop(557);
    obj.layout14:setWidth(80);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(20.3);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(52);
    obj.edit16:setHeight(31);
    obj.edit16:setField("VIG");
    obj.edit16:setName("edit16");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout14);
    obj.dataLink18:setFields({'VIG'});
    obj.dataLink18:setDefaultValues({'0'});
    obj.dataLink18:setName("dataLink18");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout14);
    obj.label13:setVisible(false);
    obj.label13:setFontSize(20.3);
    obj.label13:setFontColor("#000000");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setLeft(0);
    obj.label13:setTop(0);
    obj.label13:setWidth(52);
    obj.label13:setHeight(31);
    obj.label13:setField("VIGtotal");
    obj.label13:setName("label13");
    obj.label13:setTextTrimming("none");
    obj.label13:setWordWrap(false);
    obj.label13:setAutoSize(true);

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout14);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(12);
    obj.edit17:setFontColor("#85bbb1");
    obj.edit17:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setLeft(49);
    obj.edit17:setTop(5);
    obj.edit17:setWidth(20);
    obj.edit17:setHeight(20);
    obj.edit17:setField("varVIGvalor");
    obj.edit17:setName("edit17");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout14);
    obj.dataLink19:setFields({'varVIGvalor'});
    obj.dataLink19:setDefaultValues({'0'});
    obj.dataLink19:setName("dataLink19");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout14);
    obj.label14:setFontSize(12);
    obj.label14:setFontColor("#264d43");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setLeft(49);
    obj.label14:setTop(6);
    obj.label14:setWidth(20);
    obj.label14:setHeight(20);
    obj.label14:setField("varVIG");
    obj.label14:setName("label14");
    obj.label14:setTextTrimming("none");
    obj.label14:setWordWrap(false);
    obj.label14:setAutoSize(true);

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout14);
    obj.dataLink20:setFields({'varVIG'});
    obj.dataLink20:setDefaultValues({'0'});
    obj.dataLink20:setName("dataLink20");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout14);
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

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle1);
    obj.dataLink21:setFields({'varVIG', 'varVIGvalor'});
    obj.dataLink21:setName("dataLink21");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(39);
    obj.button5:setTop(521);
    obj.button5:setWidth(99);
    obj.button5:setHeight(36);
    obj.button5:setText("");
    obj.button5:setName("button5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button5);
    obj.image6:setAlign("top");
    obj.image6:setMargins({top=-1});
    obj.image6:setWidth(100);
    obj.image6:setHeight(40);
    obj.image6:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_VIG.png");
    obj.image6:setName("image6");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(162);
    obj.layout15:setTop(557);
    obj.layout15:setWidth(80);
    obj.layout15:setHeight(30);
    obj.layout15:setName("layout15");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(20.3);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(52);
    obj.edit18:setHeight(31);
    obj.edit18:setField("DES");
    obj.edit18:setName("edit18");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout15);
    obj.dataLink22:setFields({'DES'});
    obj.dataLink22:setDefaultValues({'0'});
    obj.dataLink22:setName("dataLink22");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout15);
    obj.label16:setVisible(false);
    obj.label16:setFontSize(20.3);
    obj.label16:setFontColor("#000000");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(52);
    obj.label16:setHeight(31);
    obj.label16:setField("DEStotal");
    obj.label16:setName("label16");
    obj.label16:setTextTrimming("none");
    obj.label16:setWordWrap(false);
    obj.label16:setAutoSize(true);

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(12);
    obj.edit19:setFontColor("#85bbb1");
    obj.edit19:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setLeft(49);
    obj.edit19:setTop(5);
    obj.edit19:setWidth(20);
    obj.edit19:setHeight(20);
    obj.edit19:setField("varDESvalor");
    obj.edit19:setName("edit19");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout15);
    obj.dataLink23:setFields({'varDESvalor'});
    obj.dataLink23:setDefaultValues({'0'});
    obj.dataLink23:setName("dataLink23");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setFontSize(12);
    obj.label17:setFontColor("#264d43");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setLeft(49);
    obj.label17:setTop(6);
    obj.label17:setWidth(20);
    obj.label17:setHeight(20);
    obj.label17:setField("varDES");
    obj.label17:setName("label17");
    obj.label17:setTextTrimming("none");
    obj.label17:setWordWrap(false);
    obj.label17:setAutoSize(true);

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout15);
    obj.dataLink24:setFields({'varDES'});
    obj.dataLink24:setDefaultValues({'0'});
    obj.dataLink24:setName("dataLink24");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
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

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.rectangle1);
    obj.dataLink25:setFields({'varDES', 'varDESvalor'});
    obj.dataLink25:setName("dataLink25");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(139);
    obj.button6:setTop(521);
    obj.button6:setWidth(99);
    obj.button6:setHeight(36);
    obj.button6:setText("");
    obj.button6:setName("button6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button6);
    obj.image7:setAlign("top");
    obj.image7:setMargins({top=-1});
    obj.image7:setWidth(100);
    obj.image7:setHeight(40);
    obj.image7:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_DES.png");
    obj.image7:setName("image7");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(262);
    obj.layout16:setTop(557);
    obj.layout16:setWidth(80);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(20.3);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(52);
    obj.edit20:setHeight(31);
    obj.edit20:setField("INT");
    obj.edit20:setName("edit20");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout16);
    obj.dataLink26:setFields({'INT'});
    obj.dataLink26:setDefaultValues({'0'});
    obj.dataLink26:setName("dataLink26");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setVisible(false);
    obj.label19:setFontSize(20.3);
    obj.label19:setFontColor("#000000");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setLeft(0);
    obj.label19:setTop(0);
    obj.label19:setWidth(52);
    obj.label19:setHeight(31);
    obj.label19:setField("INTtotal");
    obj.label19:setName("label19");
    obj.label19:setTextTrimming("none");
    obj.label19:setWordWrap(false);
    obj.label19:setAutoSize(true);

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(12);
    obj.edit21:setFontColor("#85bbb1");
    obj.edit21:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setLeft(49);
    obj.edit21:setTop(5);
    obj.edit21:setWidth(20);
    obj.edit21:setHeight(20);
    obj.edit21:setField("varINTvalor");
    obj.edit21:setName("edit21");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout16);
    obj.dataLink27:setFields({'varINTvalor'});
    obj.dataLink27:setDefaultValues({'0'});
    obj.dataLink27:setName("dataLink27");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setFontSize(12);
    obj.label20:setFontColor("#264d43");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setLeft(49);
    obj.label20:setTop(6);
    obj.label20:setWidth(20);
    obj.label20:setHeight(20);
    obj.label20:setField("varINT");
    obj.label20:setName("label20");
    obj.label20:setTextTrimming("none");
    obj.label20:setWordWrap(false);
    obj.label20:setAutoSize(true);

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout16);
    obj.dataLink28:setFields({'varINT'});
    obj.dataLink28:setDefaultValues({'0'});
    obj.dataLink28:setName("dataLink28");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout16);
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

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle1);
    obj.dataLink29:setFields({'varINT', 'varINTvalor'});
    obj.dataLink29:setName("dataLink29");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(239);
    obj.button7:setTop(521);
    obj.button7:setWidth(99);
    obj.button7:setHeight(36);
    obj.button7:setText("");
    obj.button7:setName("button7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.button7);
    obj.image8:setAlign("top");
    obj.image8:setMargins({top=-1});
    obj.image8:setWidth(100);
    obj.image8:setHeight(40);
    obj.image8:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_INT.png");
    obj.image8:setName("image8");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(364);
    obj.layout17:setTop(557);
    obj.layout17:setWidth(80);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(20.3);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(52);
    obj.edit22:setHeight(31);
    obj.edit22:setField("PRE");
    obj.edit22:setName("edit22");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout17);
    obj.dataLink30:setFields({'PRE'});
    obj.dataLink30:setDefaultValues({'0'});
    obj.dataLink30:setName("dataLink30");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout17);
    obj.label22:setVisible(false);
    obj.label22:setFontSize(20.3);
    obj.label22:setFontColor("#000000");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setLeft(0);
    obj.label22:setTop(0);
    obj.label22:setWidth(52);
    obj.label22:setHeight(31);
    obj.label22:setField("PREtotal");
    obj.label22:setName("label22");
    obj.label22:setTextTrimming("none");
    obj.label22:setWordWrap(false);
    obj.label22:setAutoSize(true);

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(12);
    obj.edit23:setFontColor("#85bbb1");
    obj.edit23:setHint("Insira aqui valores que não somarão Pontos de Poder");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setLeft(49);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(20);
    obj.edit23:setHeight(20);
    obj.edit23:setField("varPREvalor");
    obj.edit23:setName("edit23");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout17);
    obj.dataLink31:setFields({'varPREvalor'});
    obj.dataLink31:setDefaultValues({'0'});
    obj.dataLink31:setName("dataLink31");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout17);
    obj.label23:setFontSize(12);
    obj.label23:setFontColor("#264d43");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setLeft(49);
    obj.label23:setTop(6);
    obj.label23:setWidth(20);
    obj.label23:setHeight(20);
    obj.label23:setField("varPRE");
    obj.label23:setName("label23");
    obj.label23:setTextTrimming("none");
    obj.label23:setWordWrap(false);
    obj.label23:setAutoSize(true);

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout17);
    obj.dataLink32:setFields({'varPRE'});
    obj.dataLink32:setDefaultValues({'0'});
    obj.dataLink32:setName("dataLink32");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout17);
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

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle1);
    obj.dataLink33:setFields({'varPRE', 'varPREvalor'});
    obj.dataLink33:setName("dataLink33");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(339);
    obj.button8:setTop(521);
    obj.button8:setWidth(99);
    obj.button8:setHeight(36);
    obj.button8:setText("");
    obj.button8:setName("button8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.button8);
    obj.image9:setAlign("top");
    obj.image9:setMargins({top=-1});
    obj.image9:setWidth(100);
    obj.image9:setHeight(40);
    obj.image9:setSRC("/Ficha_MM3ed_RRPG_image/images/Hab_PRE.png");
    obj.image9:setName("image9");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle1);
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontColor("#bedbd5");
    obj.label25:setText("TOTAL");
    obj.label25:setLeft(395);
    obj.label25:setTop(596);
    obj.label25:setWidth(30);
    obj.label25:setHeight(29);
    obj.label25:setName("label25");
    obj.label25:setTextTrimming("none");
    obj.label25:setWordWrap(false);
    obj.label25:setAutoSize(true);

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setTransparent(true);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("#bedbd5");
    obj.edit24:setLeft(395);
    obj.edit24:setTop(607);
    obj.edit24:setWidth(35);
    obj.edit24:setHeight(20);
    obj.edit24:setField("TotalppVantagem");
    obj.edit24:setName("edit24");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle1);
    obj.dataLink34:setFields({'TotalppVantagem'});
    obj.dataLink34:setDefaultValues({'0'});
    obj.dataLink34:setName("dataLink34");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setLeft(287);
    obj.button9:setTop(598);
    obj.button9:setHeight(24);
    obj.button9:setText("Nova Vantagem");
    obj.button9:setFontSize(12);
    obj.button9:setWidth(100);
    obj.button9:setName("button9");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(40);
    obj.layout18:setTop(646);
    obj.layout18:setWidth(398);
    obj.layout18:setHeight(250);
    obj.layout18:setName("layout18");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout18);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(0);
    obj.scrollBox2:setWidth(398);
    obj.scrollBox2:setHeight(250);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.scrollBox2);
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("dVantagens");
    obj.rclVantagens:setTemplateForm("frmFichaMM3eVantagens_svg");
    obj.rclVantagens:setLeft(0);
    obj.rclVantagens:setTop(0);
    obj.rclVantagens:setWidth(400);
    obj.rclVantagens:setAutoHeight(true);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setLeft(720);
    obj.button10:setTop(214);
    obj.button10:setHeight(24);
    obj.button10:setText("Novo Ataque");
    obj.button10:setFontSize(12);
    obj.button10:setWidth(100);
    obj.button10:setName("button10");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setTop(280);
    obj.layout19:setLeft(456);
    obj.layout19:setWidth(402);
    obj.layout19:setHeight(150);
    obj.layout19:setName("layout19");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout19);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(0);
    obj.scrollBox3:setWidth(402);
    obj.scrollBox3:setHeight(150);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.scrollBox3);
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("dAtaques");
    obj.rclAtaques:setTemplateForm("frmFichaMM3eAtaques_svg");
    obj.rclAtaques:setLeft(0);
    obj.rclAtaques:setTop(0);
    obj.rclAtaques:setWidth(400);
    obj.rclAtaques:setAutoHeight(true);

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(688);
    obj.layout20:setTop(239);
    obj.layout20:setWidth(28);
    obj.layout20:setHeight(16);
    obj.layout20:setName("layout20");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout20);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(12);
    obj.edit25:setFontColor("#000000");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(28);
    obj.edit25:setHeight(19);
    obj.edit25:setField("Iniciativa");
    obj.edit25:setName("edit25");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(590);
    obj.button11:setTop(239);
    obj.button11:setWidth(89);
    obj.button11:setHeight(21);
    obj.button11:setText("INICIATIVA");
    obj.button11:setName("button11");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(43);
    obj.layout21:setTop(933);
    obj.layout21:setWidth(391);
    obj.layout21:setHeight(302);
    obj.layout21:setName("layout21");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout21);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(391);
    obj.textEditor1:setHeight(302);
    obj.textEditor1:setFontSize(16.5);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Equipamentos");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout21);
    obj.dataLink35:setFields({'Equipamentos'});
    obj.dataLink35:setDefaultValues({'Equipamentos\n ✲ Nome do Equipamento ● custo final \n\n ✲ Nome do Equipamento ● custo final\n\n ✲ Nome do Equipamento ● custo final\n\n ✲ Nome do Equipamento ● custo final '});
    obj.dataLink35:setName("dataLink35");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(541);
    obj.layout22:setTop(78);
    obj.layout22:setWidth(24);
    obj.layout22:setHeight(15);
    obj.layout22:setName("layout22");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout22);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(9);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(24);
    obj.edit26:setHeight(16);
    obj.edit26:setField("DEFesq1");
    obj.edit26:setName("edit26");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(568);
    obj.layout23:setTop(78);
    obj.layout23:setWidth(24);
    obj.layout23:setHeight(15);
    obj.layout23:setName("layout23");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout23);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(9);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(24);
    obj.edit27:setHeight(16);
    obj.edit27:setField("DEFesq2");
    obj.edit27:setName("edit27");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout23);
    obj.dataLink36:setFields({'DEFesq2'});
    obj.dataLink36:setDefaultValues({'0'});
    obj.dataLink36:setName("dataLink36");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(595);
    obj.layout24:setTop(78);
    obj.layout24:setWidth(24);
    obj.layout24:setHeight(15);
    obj.layout24:setName("layout24");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout24);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(9);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(24);
    obj.edit28:setHeight(16);
    obj.edit28:setField("DEFesq3");
    obj.edit28:setName("edit28");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout24);
    obj.dataLink37:setFields({'DEFesq3'});
    obj.dataLink37:setDefaultValues({'0'});
    obj.dataLink37:setName("dataLink37");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(621);
    obj.layout25:setTop(78);
    obj.layout25:setWidth(24);
    obj.layout25:setHeight(15);
    obj.layout25:setName("layout25");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout25);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(9);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(24);
    obj.edit29:setHeight(16);
    obj.edit29:setField("DEFesqTotal");
    obj.edit29:setName("edit29");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(541);
    obj.layout26:setTop(99);
    obj.layout26:setWidth(24);
    obj.layout26:setHeight(15);
    obj.layout26:setName("layout26");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout26);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(9);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(24);
    obj.edit30:setHeight(16);
    obj.edit30:setField("DEFapa1");
    obj.edit30:setName("edit30");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(568);
    obj.layout27:setTop(99);
    obj.layout27:setWidth(24);
    obj.layout27:setHeight(15);
    obj.layout27:setName("layout27");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout27);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(9);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(24);
    obj.edit31:setHeight(16);
    obj.edit31:setField("DEFapa2");
    obj.edit31:setName("edit31");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout27);
    obj.dataLink38:setFields({'DEFapa2'});
    obj.dataLink38:setDefaultValues({'0'});
    obj.dataLink38:setName("dataLink38");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(595);
    obj.layout28:setTop(99);
    obj.layout28:setWidth(24);
    obj.layout28:setHeight(15);
    obj.layout28:setName("layout28");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout28);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(9);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(24);
    obj.edit32:setHeight(16);
    obj.edit32:setField("DEFapa3");
    obj.edit32:setName("edit32");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout28);
    obj.dataLink39:setFields({'DEFapa3'});
    obj.dataLink39:setDefaultValues({'0'});
    obj.dataLink39:setName("dataLink39");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(621);
    obj.layout29:setTop(99);
    obj.layout29:setWidth(24);
    obj.layout29:setHeight(15);
    obj.layout29:setName("layout29");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout29);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(9);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(24);
    obj.edit33:setHeight(16);
    obj.edit33:setField("DEFapaTotal");
    obj.edit33:setName("edit33");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(541);
    obj.layout30:setTop(120);
    obj.layout30:setWidth(24);
    obj.layout30:setHeight(15);
    obj.layout30:setName("layout30");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout30);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(9);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(24);
    obj.edit34:setHeight(16);
    obj.edit34:setField("DEFvon1");
    obj.edit34:setName("edit34");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(568);
    obj.layout31:setTop(120);
    obj.layout31:setWidth(24);
    obj.layout31:setHeight(15);
    obj.layout31:setName("layout31");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout31);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(9);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(24);
    obj.edit35:setHeight(16);
    obj.edit35:setField("DEFvon2");
    obj.edit35:setName("edit35");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout31);
    obj.dataLink40:setFields({'DEFvon2'});
    obj.dataLink40:setDefaultValues({'0'});
    obj.dataLink40:setName("dataLink40");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(595);
    obj.layout32:setTop(120);
    obj.layout32:setWidth(24);
    obj.layout32:setHeight(15);
    obj.layout32:setName("layout32");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout32);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(9);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(24);
    obj.edit36:setHeight(16);
    obj.edit36:setField("DEFvon3");
    obj.edit36:setName("edit36");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout32);
    obj.dataLink41:setFields({'DEFvon3'});
    obj.dataLink41:setDefaultValues({'0'});
    obj.dataLink41:setName("dataLink41");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(621);
    obj.layout33:setTop(120);
    obj.layout33:setWidth(24);
    obj.layout33:setHeight(15);
    obj.layout33:setName("layout33");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout33);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(9);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(24);
    obj.edit37:setHeight(16);
    obj.edit37:setField("DEFvonTotal");
    obj.edit37:setName("edit37");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(750);
    obj.layout34:setTop(78);
    obj.layout34:setWidth(24);
    obj.layout34:setHeight(15);
    obj.layout34:setName("layout34");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout34);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(9);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(24);
    obj.edit38:setHeight(16);
    obj.edit38:setField("DEFforti1");
    obj.edit38:setName("edit38");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(777);
    obj.layout35:setTop(78);
    obj.layout35:setWidth(24);
    obj.layout35:setHeight(15);
    obj.layout35:setName("layout35");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout35);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(9);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(24);
    obj.edit39:setHeight(16);
    obj.edit39:setField("DEFforti2");
    obj.edit39:setName("edit39");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout35);
    obj.dataLink42:setFields({'DEFforti2'});
    obj.dataLink42:setDefaultValues({'0'});
    obj.dataLink42:setName("dataLink42");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(804);
    obj.layout36:setTop(78);
    obj.layout36:setWidth(24);
    obj.layout36:setHeight(15);
    obj.layout36:setName("layout36");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout36);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(9);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(24);
    obj.edit40:setHeight(16);
    obj.edit40:setField("DEFforti3");
    obj.edit40:setName("edit40");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout36);
    obj.dataLink43:setFields({'DEFforti3'});
    obj.dataLink43:setDefaultValues({'0'});
    obj.dataLink43:setName("dataLink43");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(831);
    obj.layout37:setTop(78);
    obj.layout37:setWidth(24);
    obj.layout37:setHeight(15);
    obj.layout37:setName("layout37");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout37);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(9);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(24);
    obj.edit41:setHeight(16);
    obj.edit41:setField("DEFfortiTotal");
    obj.edit41:setName("edit41");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(750);
    obj.layout38:setTop(99);
    obj.layout38:setWidth(24);
    obj.layout38:setHeight(15);
    obj.layout38:setName("layout38");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout38);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(9);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(24);
    obj.edit42:setHeight(16);
    obj.edit42:setField("DEFres1");
    obj.edit42:setName("edit42");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(777);
    obj.layout39:setTop(99);
    obj.layout39:setWidth(24);
    obj.layout39:setHeight(15);
    obj.layout39:setName("layout39");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout39);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(9);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(24);
    obj.edit43:setHeight(16);
    obj.edit43:setField("DEFres2");
    obj.edit43:setName("edit43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout39);
    obj.dataLink44:setFields({'DEFres2'});
    obj.dataLink44:setDefaultValues({'0'});
    obj.dataLink44:setName("dataLink44");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(804);
    obj.layout40:setTop(99);
    obj.layout40:setWidth(24);
    obj.layout40:setHeight(15);
    obj.layout40:setName("layout40");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout40);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(9);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(24);
    obj.edit44:setHeight(16);
    obj.edit44:setField("DEFres3");
    obj.edit44:setName("edit44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout40);
    obj.dataLink45:setFields({'DEFres3'});
    obj.dataLink45:setDefaultValues({'0'});
    obj.dataLink45:setName("dataLink45");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(831);
    obj.layout41:setTop(99);
    obj.layout41:setWidth(24);
    obj.layout41:setHeight(15);
    obj.layout41:setName("layout41");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout41);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(9);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(24);
    obj.edit45:setHeight(16);
    obj.edit45:setField("DEFresTotal");
    obj.edit45:setName("edit45");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(650);
    obj.layout42:setTop(117);
    obj.layout42:setWidth(98);
    obj.layout42:setHeight(24);
    obj.layout42:setName("layout42");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout42);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(14);
    obj.edit46:setFontColor("#000000");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(182);
    obj.edit46:setHeight(24);
    obj.edit46:setField("DEFextraName");
    obj.edit46:setName("edit46");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(750);
    obj.layout43:setTop(120);
    obj.layout43:setWidth(24);
    obj.layout43:setHeight(15);
    obj.layout43:setName("layout43");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout43);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(9);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(24);
    obj.edit47:setHeight(16);
    obj.edit47:setField("DEFextra1");
    obj.edit47:setName("edit47");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(777);
    obj.layout44:setTop(120);
    obj.layout44:setWidth(24);
    obj.layout44:setHeight(15);
    obj.layout44:setName("layout44");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout44);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(9);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(24);
    obj.edit48:setHeight(16);
    obj.edit48:setField("DEFextra2");
    obj.edit48:setName("edit48");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout44);
    obj.dataLink46:setFields({'DEFextra2'});
    obj.dataLink46:setDefaultValues({'0'});
    obj.dataLink46:setName("dataLink46");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(804);
    obj.layout45:setTop(120);
    obj.layout45:setWidth(24);
    obj.layout45:setHeight(15);
    obj.layout45:setName("layout45");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout45);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(9);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(24);
    obj.edit49:setHeight(16);
    obj.edit49:setField("DEFextra3");
    obj.edit49:setName("edit49");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout45);
    obj.dataLink47:setFields({'DEFextra3'});
    obj.dataLink47:setDefaultValues({'0'});
    obj.dataLink47:setName("dataLink47");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(831);
    obj.layout46:setTop(120);
    obj.layout46:setWidth(24);
    obj.layout46:setHeight(15);
    obj.layout46:setName("layout46");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout46);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(9);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(24);
    obj.edit50:setHeight(16);
    obj.edit50:setField("DEFextraTotal");
    obj.edit50:setName("edit50");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(456);
    obj.layout47:setTop(173);
    obj.layout47:setWidth(115);
    obj.layout47:setHeight(50);
    obj.layout47:setName("layout47");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout47);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(18);
    lfm_setPropAsString(obj.edit51, "fontStyle",  "bold");
    obj.edit51:setFontColor("#591f1d");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(115);
    obj.edit51:setHeight(30);
    obj.edit51:setType("number");
    obj.edit51:setField("PenaRes");
    obj.edit51:setName("edit51");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout47);
    obj.label26:setVisible(false);
    obj.label26:setField("PenalidadeRes");
    obj.label26:setName("label26");
    obj.label26:setFontColor("black");
    obj.label26:setTextTrimming("none");
    obj.label26:setWordWrap(false);
    obj.label26:setAutoSize(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.rectangle1);
    obj.dataLink48:setFields({'PenaRes'});
    obj.dataLink48:setName("dataLink48");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(578);
    obj.layout48:setTop(173);
    obj.layout48:setWidth(277);
    obj.layout48:setHeight(40);
    obj.layout48:setName("layout48");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout48);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(14);
    obj.textEditor2:setFontColor("#591f1d");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(277);
    obj.textEditor2:setHeight(34);
    obj.textEditor2:setField("Condicoes");
    obj.textEditor2:setName("textEditor2");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(540);
    obj.layout49:setTop(1196);
    obj.layout49:setWidth(19);
    obj.layout49:setHeight(18);
    obj.layout49:setName("layout49");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout49);
    obj.label27:setFontSize(10);
    obj.label27:setFontColor("#000000");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(24);
    obj.label27:setHeight(15);
    obj.label27:setField("PPhabilidades");
    obj.label27:setName("label27");
    obj.label27:setTextTrimming("none");
    obj.label27:setWordWrap(false);
    obj.label27:setAutoSize(true);

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(618);
    obj.layout50:setTop(1196);
    obj.layout50:setWidth(21);
    obj.layout50:setHeight(18);
    obj.layout50:setName("layout50");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout50);
    obj.label28:setFontSize(10);
    obj.label28:setFontColor("#000000");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setLeft(0);
    obj.label28:setTop(0);
    obj.label28:setWidth(24);
    obj.label28:setHeight(15);
    obj.label28:setField("PPpericias");
    obj.label28:setName("label28");
    obj.label28:setTextTrimming("none");
    obj.label28:setWordWrap(false);
    obj.label28:setAutoSize(true);

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(641);
    obj.layout51:setTop(1197);
    obj.layout51:setWidth(19);
    obj.layout51:setHeight(14);
    obj.layout51:setName("layout51");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout51);
    obj.label29:setFontSize(9);
    obj.label29:setFontColor("#000000");
    obj.label29:setVertTextAlign("center");
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(19);
    obj.label29:setHeight(15);
    obj.label29:setField("PPpericiasgrad");
    obj.label29:setName("label29");
    obj.label29:setTextTrimming("none");
    obj.label29:setWordWrap(false);
    obj.label29:setAutoSize(true);

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(811);
    obj.layout52:setTop(1194);
    obj.layout52:setWidth(21);
    obj.layout52:setHeight(18);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(10);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(24);
    obj.edit52:setHeight(18);
    obj.edit52:setField("PPvantagens");
    obj.edit52:setName("edit52");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout52);
    obj.dataLink49:setFields({'TotalppVantagem'});
    obj.dataLink49:setName("dataLink49");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(512);
    obj.layout53:setTop(1212);
    obj.layout53:setWidth(21);
    obj.layout53:setHeight(14);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(10);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(24);
    obj.edit53:setHeight(18);
    obj.edit53:setField("PPdefesas");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(593);
    obj.layout54:setTop(1212);
    obj.layout54:setWidth(24);
    obj.layout54:setHeight(18);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(10);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(24);
    obj.edit54:setHeight(18);
    obj.edit54:setField("PPpoderes");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(630);
    obj.layout55:setTop(1214);
    obj.layout55:setWidth(140);
    obj.layout55:setHeight(18);
    obj.layout55:setName("layout55");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout55);
    obj.label30:setFontSize(12);
    obj.label30:setFontColor("#000000");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setVertTextAlign("center");
    obj.label30:setLeft(0);
    obj.label30:setTop(0);
    obj.label30:setWidth(140);
    obj.label30:setHeight(18);
    obj.label30:setField("PPsomatotal");
    obj.label30:setName("label30");
    obj.label30:setTextTrimming("none");
    obj.label30:setWordWrap(false);
    obj.label30:setAutoSize(true);

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

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle1);
    obj.image10:setLeft(255);
    obj.image10:setTop(27);
    obj.image10:setWidth(182);
    obj.image10:setHeight(243);
    obj.image10:setField("avatar");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    lfm_setPropAsString(obj.image10, "animate",  "true");
    obj.image10:setName("image10");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(40);
    obj.layout56:setTop(373);
    obj.layout56:setWidth(78);
    obj.layout56:setHeight(30);
    obj.layout56:setName("layout56");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout56);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(20.3);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(78);
    obj.edit55:setHeight(31);
    obj.edit55:setField("IDADE");
    obj.edit55:setName("edit55");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(120);
    obj.layout57:setTop(373);
    obj.layout57:setWidth(78);
    obj.layout57:setHeight(30);
    obj.layout57:setName("layout57");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout57);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(20.3);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(78);
    obj.edit56:setHeight(31);
    obj.edit56:setField("ALTURA");
    obj.edit56:setName("edit56");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(202);
    obj.layout58:setTop(373);
    obj.layout58:setWidth(78);
    obj.layout58:setHeight(30);
    obj.layout58:setName("layout58");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout58);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(20.3);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(78);
    obj.edit57:setHeight(31);
    obj.edit57:setField("PESO");
    obj.edit57:setName("edit57");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(117);
    obj.layout59:setTop(216);
    obj.layout59:setWidth(202);
    obj.layout59:setHeight(35);
    obj.layout59:setName("layout59");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout59);
    obj.imageCheckBox1:setField("CheckIDENTIDADE");
    obj.imageCheckBox1:setImageChecked("/Ficha_MM3ed_RRPG_image/images/PUBLICA.png");
    obj.imageCheckBox1:setImageUnchecked("/Ficha_MM3ed_RRPG_image/images/SECRETA.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(43);
    obj.layout60:setTop(243);
    obj.layout60:setWidth(202);
    obj.layout60:setHeight(35);
    obj.layout60:setName("layout60");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout60);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(10);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(202);
    obj.edit58:setHeight(36);
    obj.edit58:setField("ALIAS");
    obj.edit58:setHint("Notas sobre a Identidade. ");
    obj.edit58:setName("edit58");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.rectangle1);
    obj.dataLink50:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE', 'varFORvalor', 'varVIGvalor', 'varAGIvalor', 'varDESvalor', 'varLUTvalor', 'varINTvalor', 'varPROvalor', 'varPREvalor'});
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.rectangle1);
    obj.dataLink51:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE', 'varFORvalor', 'varVIGvalor', 'varAGIvalor', 'varDESvalor', 'varLUTvalor', 'varINTvalor', 'varPROvalor', 'varPREvalor'});
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.rectangle1);
    obj.dataLink52:setFields({'DEFesq1', 'DEFesq2', 'DEFesq3'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.rectangle1);
    obj.dataLink53:setFields({'DEFapa1', 'DEFapa2', 'DEFapa3'});
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.rectangle1);
    obj.dataLink54:setFields({'DEFvon1', 'DEFvon2', 'DEFvon3'});
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.rectangle1);
    obj.dataLink55:setFields({'DEFforti1', 'DEFforti2', 'DEFforti3'});
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.rectangle1);
    obj.dataLink56:setFields({'DEFres1', 'DEFres2', 'DEFres3'});
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.rectangle1);
    obj.dataLink57:setFields({'DEFextra1', 'DEFextra2', 'DEFextra3'});
    obj.dataLink57:setName("dataLink57");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(454);
    obj.button12:setTop(74);
    obj.button12:setWidth(85);
    obj.button12:setHeight(22);
    obj.button12:setText("ESQUIVAR");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setLeft(454);
    obj.button13:setTop(96);
    obj.button13:setWidth(85);
    obj.button13:setHeight(22);
    obj.button13:setText("APARAR");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setLeft(454);
    obj.button14:setTop(118);
    obj.button14:setWidth(85);
    obj.button14:setHeight(22);
    obj.button14:setText("VONTADE");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setLeft(651);
    obj.button15:setTop(74);
    obj.button15:setWidth(98);
    obj.button15:setHeight(22);
    obj.button15:setText("FORTITUDE");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle1);
    obj.button16:setLeft(651);
    obj.button16:setTop(96);
    obj.button16:setWidth(98);
    obj.button16:setHeight(22);
    obj.button16:setText("RESISTENCIA");
    obj.button16:setName("button16");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.rectangle1);
    obj.dataLink58:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE'});
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.rectangle1);
    obj.dataLink59:setField("PPpericias");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.rectangle1);
    obj.dataLink60:setField("pontosPericia");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.rectangle1);
    obj.dataLink61:setFields({'DEFesq2', 'DEFapa2', 'DEFvon2', 'DEFforti2', 'DEFres2', 'DEFextra2'});
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.rectangle1);
    obj.dataLink62:setFields({'PPhabilidades', 'PPpericias', 'PPvantagens', 'PPdefesas', 'PPpoderes'});
    obj.dataLink62:setName("dataLink62");

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

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFicha_MM3ed_RRPG_image2_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox4);
    obj.rectangle3:setWidth(893);
    obj.rectangle3:setHeight(1263);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle3);
    obj.image11:setLeft(0);
    obj.image11:setTop(0);
    obj.image11:setWidth(893);
    obj.image11:setHeight(1263);
    obj.image11:setSRC("/Ficha_MM3ed_RRPG_image/images/Parede_2.png");
    obj.image11:setStyle("stretch");
    obj.image11:setOptimize(true);
    obj.image11:setName("image11");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle3);
    obj.layout61:setLeft(43);
    obj.layout61:setTop(64);
    obj.layout61:setWidth(674);
    obj.layout61:setHeight(590);
    obj.layout61:setName("layout61");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout61);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(674);
    obj.richEdit2:setHeight(590);
    obj.richEdit2:setField("Historia");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "14");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    lfm_setPropAsString(obj.richEdit2, "animateImages",  "true");
    obj.richEdit2:setName("richEdit2");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle3);
    obj.layout62:setLeft(452);
    obj.layout62:setTop(933);
    obj.layout62:setWidth(397);
    obj.layout62:setHeight(528);
    obj.layout62:setName("layout62");

    obj.richEnemy = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEnemy:setParent(obj.layout62);
    obj.richEnemy:setLeft(0);
    obj.richEnemy:setTop(0);
    obj.richEnemy:setWidth(397);
    obj.richEnemy:setHeight(305);
    obj.richEnemy:setField("Inimigos");
    obj.richEnemy:setName("richEnemy");
    lfm_setPropAsString(obj.richEnemy, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEnemy, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEnemy, "defaultFontSize",  "14");
    lfm_setPropAsString(obj.richEnemy, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEnemy, "animateImages",  "true");
    obj.richEnemy:setHint("Você pode usar atalhos de edição de texto aqui\nou colar texto editado em outro lugar");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle3);
    obj.layout63:setLeft(452);
    obj.layout63:setTop(710);
    obj.layout63:setWidth(397);
    obj.layout63:setHeight(167);
    obj.layout63:setName("layout63");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.layout63);
    obj.richEdit3:setLeft(0);
    obj.richEdit3:setTop(0);
    obj.richEdit3:setWidth(397);
    obj.richEdit3:setHeight(170);
    obj.richEdit3:setField("QGeneral");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit3, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEdit3, "defaultFontSize",  "16.5");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "animateImages",  "true");
    obj.richEdit3:setHint("Você pode usar atalhos de edição de texto aqui\npor exemplo Ctrl+B para negrito");
    obj.richEdit3:setName("richEdit3");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle3);
    obj.layout64:setLeft(43);
    obj.layout64:setTop(710);
    obj.layout64:setWidth(397);
    obj.layout64:setHeight(751);
    obj.layout64:setName("layout64");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.layout64);
    obj.richEdit4:setLeft(0);
    obj.richEdit4:setTop(0);
    obj.richEdit4:setWidth(397);
    obj.richEdit4:setHeight(528);
    obj.richEdit4:setField("Complicacoes");
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit4, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEdit4, "defaultFontSize",  "16.5");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit4, "animateImages",  "true");
    obj.richEdit4:setHint("Você pode usar atalhos de edição de texto aqui\npor exemplo Ctrl+T para itálico");
    obj.richEdit4:setName("richEdit4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setLeft(728);
    obj.rectangle4:setTop(23);
    obj.rectangle4:setWidth(123);
    obj.rectangle4:setHeight(633);
    obj.rectangle4:setColor("#6cb098");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle3);
    obj.image12:setLeft(730);
    obj.image12:setTop(24);
    obj.image12:setWidth(120);
    obj.image12:setHeight(631);
    obj.image12:setSRC("/Ficha_MM3ed_RRPG_image/images/barra.png");
    obj.image12:setStyle("autoFit");
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle3);
    obj.image13:setLeft(728);
    obj.image13:setTop(23);
    obj.image13:setWidth(122);
    obj.image13:setHeight(633);
    obj.image13:setField("sobmanto");
    obj.image13:setEditable(true);
    obj.image13:setStyle("autoFit");
    lfm_setPropAsString(obj.image13, "animate",  "true");
    obj.image13:setName("image13");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle3);
    obj.label31:setLeft(615);
    obj.label31:setTop(3);
    obj.label31:setWidth(33);
    obj.label31:setHeight(20);
    obj.label31:setFontSize(10);
    obj.label31:setFontColor("#3f8270");
    obj.label31:setText("GILGANTE E JANUS - VERSÃO DA FICHA: 2020-01-24");
    obj.label31:setName("label31");
    obj.label31:setTextTrimming("none");
    obj.label31:setWordWrap(false);
    obj.label31:setAutoSize(true);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Pericias");
    obj.tab3:setName("tab3");

    obj.frmFichaMM3ePericias_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaMM3ePericias_svg:setParent(obj.tab3);
    obj.frmFichaMM3ePericias_svg:setName("frmFichaMM3ePericias_svg");
    obj.frmFichaMM3ePericias_svg:setAlign("client");
    obj.frmFichaMM3ePericias_svg:setTheme("light");
    obj.frmFichaMM3ePericias_svg:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmFichaMM3ePericias_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

		
			require("ndb.lua");
			local mms = NDB.load("mmsskills.xml");

			local function updateAtributes(num)
				local atr = "" .. num;
				local mod = 0;
				
				if num == 1 then
					mod = tonumber(sheet.FORtotal) or 0;
				elseif num == 2 then
					mod = tonumber(sheet.VIGtotal) or 0;
				elseif num == 3 then
					mod = tonumber(sheet.AGItotal) or 0;
				elseif num == 4 then
					mod = tonumber(sheet.DEStotal) or 0;
				elseif num == 5 then
					mod = tonumber(sheet.LUTtotal) or 0;
				elseif num == 6 then
					mod = tonumber(sheet.INTtotal) or 0;
				elseif num == 7 then
					mod = tonumber(sheet.PROtotal) or 0;
				elseif num == 8 then
					mod = tonumber(sheet.PREtotal) or 0;
				end;

				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					if nodes[i].chavePericia == atr then
						nodes[i].atributoPericia = mod;
					end;
				end
			end;
			
			local function dndSkills()				
				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					NDB.deleteNode(nodes[i]);
				end;		

				for i=1, 17, 1 do
					local pericia = self.rclListaDasPericias:append();
					if pericia~=nil then
						pericia.nomePericia = mms[i].nome;
						pericia.chavePericia = mms[i].chave;
						pericia.exigeTreino = mms[i].treino;
						pericia.exigeFerramentas = mms[i].ferramenta;
					end;
				end;

				self.rclListaDasPericias:sort();
				
			end;
		


    obj.popPericia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox5);
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

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart1);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Penalidades");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart1);
    obj.edit59:setAlign("client");
    obj.edit59:setField("penalidesPericia");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart2);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Poder/Equipamentos");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart2);
    obj.edit60:setAlign("client");
    obj.edit60:setField("equipamentosPericia");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart3);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Condicional");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart3);
    obj.edit61:setAlign("client");
    obj.edit61:setField("condicionalPericia");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.popPericia);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setText("Exige Treino");
    obj.checkBox2:setField("exigeTreino");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.popPericia);
    obj.checkBox3:setAlign("right");
    obj.checkBox3:setText("Exige Ferramentas");
    obj.checkBox3:setField("exigeFerramentas");
    obj.checkBox3:setName("checkBox3");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox5);
    obj.layout65:setLeft(0);
    obj.layout65:setTop(45);
    obj.layout65:setWidth(893);
    obj.layout65:setHeight(685);
    obj.layout65:setName("layout65");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout65);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#50a48d");
    obj.rectangle5:setName("rectangle5");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle5);
    obj.image14:setLeft(0);
    obj.image14:setTop(0);
    obj.image14:setWidth(893);
    obj.image14:setHeight(1263);
    obj.image14:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo2.png");
    obj.image14:setStyle("stretch");
    obj.image14:setOptimize(true);
    obj.image14:setName("image14");

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

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle5);
    obj.label35:setText("NOME DA PERÍCIA");
    obj.label35:setLeft(20);
    obj.label35:setTop(1);
    obj.label35:setWidth(135);
    obj.label35:setHeight(20);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle5);
    obj.label36:setText("HABILIDADE");
    obj.label36:setLeft(190);
    obj.label36:setTop(1);
    obj.label36:setWidth(100);
    obj.label36:setHeight(20);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle5);
    obj.label37:setText("GRAD");
    obj.label37:setLeft(294);
    obj.label37:setTop(1);
    obj.label37:setWidth(40);
    obj.label37:setHeight(20);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle5);
    obj.label38:setText("VAR");
    obj.label38:setLeft(333);
    obj.label38:setTop(1);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle5);
    obj.label39:setText("TOTAL");
    obj.label39:setLeft(375);
    obj.label39:setTop(1);
    obj.label39:setWidth(40);
    obj.label39:setHeight(20);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

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

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle5);
    obj.label40:setText("NOME DA PERÍCIA");
    obj.label40:setLeft(475);
    obj.label40:setTop(1);
    obj.label40:setWidth(135);
    obj.label40:setHeight(20);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle5);
    obj.label41:setText("HABILIDADE");
    obj.label41:setLeft(635);
    obj.label41:setTop(1);
    obj.label41:setWidth(100);
    obj.label41:setHeight(20);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle5);
    obj.label42:setText("GRAD");
    obj.label42:setLeft(735);
    obj.label42:setTop(1);
    obj.label42:setWidth(40);
    obj.label42:setHeight(20);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle5);
    obj.label43:setText("VAR");
    obj.label43:setLeft(774);
    obj.label43:setTop(1);
    obj.label43:setWidth(40);
    obj.label43:setHeight(20);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle5);
    obj.label44:setText("TOTAL");
    obj.label44:setLeft(820);
    obj.label44:setTop(1);
    obj.label44:setWidth(40);
    obj.label44:setHeight(20);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.rclListaDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.rectangle5);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaMM3eP_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox5);
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

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle9);
    obj.label45:setText("PONTOS DE PODER");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setLeft(0);
    obj.label45:setTop(5);
    obj.label45:setWidth(135);
    obj.label45:setHeight(20);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setMargins({left=250});
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle9);
    obj.label46:setField("pontosPericia");
    obj.label46:setAlign("left");
    obj.label46:setWidth(135);
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setMargins({top=10});
    obj.label46:setName("label46");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle9);
    obj.button17:setText("Nova Perícia");
    obj.button17:setAlign("left");
    obj.button17:setWidth(125);
    obj.button17:setHeight(25);
    obj.button17:setName("button17");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.scrollBox5);
    obj.label47:setLeft(577);
    obj.label47:setTop(362);
    obj.label47:setWidth(650);
    obj.label47:setHeight(20);
    obj.label47:setFontColor("#3f8270");
    obj.label47:setRotationAngle(90);
    obj.label47:setHorzTextAlign("leading");
    obj.label47:setText("Os códigos desta aba foram adaptados de Ambesek/RPGMeister no GitHub. Obrigado por compartilhar! ^^");
    obj.label47:setName("label47");

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

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmFicha_MM3ed_RRPG_Power);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox6);
    obj.rectangle10:setWidth(893);
    obj.rectangle10:setHeight(1263);
    obj.rectangle10:setColor("#50a48d");
    obj.rectangle10:setName("rectangle10");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.rectangle10);
    obj.image15:setLeft(0);
    obj.image15:setTop(0);
    obj.image15:setWidth(893);
    obj.image15:setHeight(1263);
    obj.image15:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo.png");
    obj.image15:setStyle("stretch");
    obj.image15:setOptimize(true);
    obj.image15:setName("image15");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle10);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(30);
    obj.layout66:setMargins({bottom=4});
    obj.layout66:setName("layout66");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout66);
    obj.button18:setText("NOVO PODER");
    obj.button18:setWidth(150);
    obj.button18:setAlign("left");
    obj.button18:setName("button18");

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
    obj.boxDetalhesDoItem:setWidth(600);
    obj.boxDetalhesDoItem:setMargins({left=14, right=14});

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("#6cb098");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setHeight(560);
    obj.rectangle11:setPadding({top=7, left=7, right=7, bottom=7});
    obj.rectangle11:setName("rectangle11");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle11);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(30);
    obj.layout67:setMargins({bottom=4});
    obj.layout67:setName("layout67");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout67);
    obj.edit62:setTransparent(true);
    obj.edit62:setAlign("top");
    lfm_setPropAsString(obj.edit62, "fontStyle",  "bold");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(68);
    obj.edit62:setHeight(31);
    obj.edit62:setField("PoderNome");
    obj.edit62:setFontColor("white");
    obj.edit62:setName("edit62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout67);
    obj.dataLink63:setFields({'PoderNome'});
    obj.dataLink63:setDefaultValues({'NOME DO PODER'});
    obj.dataLink63:setName("dataLink63");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle11);
    obj.layout68:setLeft(10);
    obj.layout68:setTop(40);
    obj.layout68:setWidth(440);
    obj.layout68:setHeight(600);
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(440);
    obj.layout69:setName("layout69");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout69);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setWidth(4400);
    obj.rectangle12:setHeight(348);
    obj.rectangle12:setColor("#3f8270");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle12);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(14);
    obj.label48:setText("EFEITOS");
    obj.label48:setFontColor("white");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setMargins({top=1});
    obj.label48:setName("label48");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle12);
    obj.textEditor3:setAlign("top");
    obj.textEditor3:setField("PoderEfeito");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontColor("white");
    obj.textEditor3:setHeight(320);
    obj.textEditor3:setMargins({left=10, right=10});
    obj.textEditor3:setName("textEditor3");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.rectangle12);
    obj.dataLink64:setFields({'PoderEfeito'});
    obj.dataLink64:setDefaultValues({'Descreva os efeitos que estao associados a este Poder. Aproveite o espaco para anotar detalhes para nao precisar olhar o livro o tempo todo.'});
    obj.dataLink64:setName("dataLink64");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle11);
    obj.layout70:setLeft(10);
    obj.layout70:setTop(398);
    obj.layout70:setWidth(440);
    obj.layout70:setHeight(390);
    obj.layout70:setName("layout70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout70);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(440);
    obj.layout71:setName("layout71");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout71);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setWidth(390);
    obj.rectangle13:setHeight(93);
    obj.rectangle13:setColor("#3f8270");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle13);
    obj.label49:setLeft(5);
    obj.label49:setFontSize(16);
    obj.label49:setText("Notas");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setFontColor("white");
    obj.label49:setVertTextAlign("center");
    obj.label49:setMargins({left=2});
    obj.label49:setName("label49");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle13);
    obj.textEditor4:setAlign("top");
    obj.textEditor4:setField("PoderNotas");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontColor("white");
    obj.textEditor4:setMargins({left=50});
    obj.textEditor4:setHeight(82);
    obj.textEditor4:setName("textEditor4");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.rectangle13);
    obj.dataLink65:setFields({'PoderNotas'});
    obj.dataLink65:setDefaultValues({'Descreva como o poder funciona na pratica e seus descritores'});
    obj.dataLink65:setName("dataLink65");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle11);
    obj.layout72:setLeft(10);
    obj.layout72:setTop(501);
    obj.layout72:setWidth(580);
    obj.layout72:setHeight(300);
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(580);
    obj.layout73:setName("layout73");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout73);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setWidth(580);
    obj.rectangle14:setColor("#3f8270");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle14);
    obj.label50:setLeft(5);
    obj.label50:setFontSize(16);
    obj.label50:setText("Custo");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setFontColor("white");
    obj.label50:setVertTextAlign("center");
    obj.label50:setMargins({left=10});
    obj.label50:setName("label50");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle14);
    obj.textEditor5:setAlign("top");
    obj.textEditor5:setField("PoderCusto");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontColor("white");
    obj.textEditor5:setMargins({left=50});
    obj.textEditor5:setName("textEditor5");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.rectangle14);
    obj.dataLink66:setFields({'PoderCusto'});
    obj.dataLink66:setDefaultValues({'Total de Pontos de Poder investidos = (Grad + Extras - Falhas) x Custo + Extras Fixos - Falhas Fixas.'});
    obj.dataLink66:setName("dataLink66");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle11);
    obj.layout74:setLeft(340);
    obj.layout74:setTop(40);
    obj.layout74:setWidth(250);
    obj.layout74:setHeight(200);
    obj.layout74:setName("layout74");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout74);
    obj.rectangle15:setAlign("right");
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setColor("#3f8270");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle15);
    obj.label51:setAlign("bottom");
    obj.label51:setFontSize(12);
    obj.label51:setText("IMAGEM");
    obj.label51:setFontColor("white");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setMargins({bottom=1, left=1});
    obj.label51:setName("label51");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.rectangle15);
    obj.image16:setAlign("right");
    obj.image16:setEditable(true);
    obj.image16:setStyle("autoFit");
    obj.image16:setField("PoderImagem");
    obj.image16:setWidth(128);
    obj.image16:setMargins({top=1, left=2, right=1, bottom=1});
    lfm_setPropAsString(obj.image16, "animate",  "true");
    obj.image16:setName("image16");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle11);
    obj.layout75:setLeft(460);
    obj.layout75:setTop(252);
    obj.layout75:setWidth(130);
    obj.layout75:setHeight(38);
    obj.layout75:setName("layout75");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout75);
    obj.rectangle16:setAlign("right");
    obj.rectangle16:setWidth(130);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("#3f8270");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle16);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(12);
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setText("DEFESA");
    obj.label52:setFontColor("white");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle16);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setField("PoderDefesa");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'NENHUMA', 'ESQUIVA', 'APARAR', 'FORTITUDE', 'VONTADE', 'RESISTENCIA'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.rectangle16);
    obj.dataLink67:setFields({'PoderDefesa'});
    obj.dataLink67:setDefaultValues({'NENHUMA'});
    obj.dataLink67:setName("dataLink67");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle11);
    obj.layout76:setLeft(460);
    obj.layout76:setTop(300);
    obj.layout76:setWidth(130);
    obj.layout76:setHeight(38);
    obj.layout76:setName("layout76");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout76);
    obj.rectangle17:setAlign("right");
    obj.rectangle17:setWidth(130);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("#3f8270");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle17);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(12);
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setText("ACAO");
    obj.label53:setFontColor("white");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle17);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setField("PoderAcao");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'NENHUMA', 'LIVRE', 'REACAO', 'MOVIMENTO', 'PADRAO'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.rectangle17);
    obj.dataLink68:setFields({'PoderAcao'});
    obj.dataLink68:setDefaultValues({'NENHUMA'});
    obj.dataLink68:setName("dataLink68");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle11);
    obj.layout77:setLeft(340);
    obj.layout77:setTop(348);
    obj.layout77:setWidth(250);
    obj.layout77:setHeight(18);
    obj.layout77:setName("layout77");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout77);
    obj.rectangle18:setAlign("right");
    obj.rectangle18:setWidth(130);
    obj.rectangle18:setColor("#3f8270");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle18);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(12);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("ALCANCE");
    obj.label54:setFontColor("white");
    obj.label54:setName("label54");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle11);
    obj.layout78:setLeft(340);
    obj.layout78:setTop(364);
    obj.layout78:setWidth(250);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout78);
    obj.edit63:setAlign("right");
    obj.edit63:setWidth(130);
    obj.edit63:setField("PoderAlcance");
    obj.edit63:setName("edit63");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout78);
    obj.dataLink69:setFields({'PoderAlcance'});
    obj.dataLink69:setDefaultValues({'Pessoal, Perto, Percepcao, ou o valor da tabela de referencia'});
    obj.dataLink69:setName("dataLink69");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle11);
    obj.layout79:setLeft(340);
    obj.layout79:setTop(398);
    obj.layout79:setWidth(250);
    obj.layout79:setHeight(18);
    obj.layout79:setName("layout79");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout79);
    obj.rectangle19:setAlign("right");
    obj.rectangle19:setWidth(130);
    obj.rectangle19:setColor("#3f8270");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle19);
    obj.label55:setAlign("top");
    obj.label55:setFontSize(12);
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("DURACAO");
    obj.label55:setFontColor("white");
    obj.label55:setName("label55");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle11);
    obj.layout80:setLeft(340);
    obj.layout80:setTop(414);
    obj.layout80:setWidth(250);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout80);
    obj.edit64:setAlign("right");
    obj.edit64:setWidth(130);
    obj.edit64:setField("PoderDuracao");
    obj.edit64:setName("edit64");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout80);
    obj.dataLink70:setFields({'PoderDuracao'});
    obj.dataLink70:setDefaultValues({'Instantaneo, Sustentado, Continuo ou Permanente'});
    obj.dataLink70:setName("dataLink70");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle11);
    obj.layout81:setLeft(340);
    obj.layout81:setTop(449);
    obj.layout81:setWidth(250);
    obj.layout81:setHeight(18);
    obj.layout81:setName("layout81");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout81);
    obj.rectangle20:setAlign("right");
    obj.rectangle20:setWidth(130);
    obj.rectangle20:setColor("#3f8270");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle20);
    obj.label56:setAlign("top");
    obj.label56:setFontSize(12);
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("REFERENCIA");
    obj.label56:setFontColor("white");
    obj.label56:setName("label56");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle11);
    obj.layout82:setLeft(340);
    obj.layout82:setTop(466);
    obj.layout82:setWidth(250);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout82);
    obj.edit65:setAlign("right");
    obj.edit65:setWidth(130);
    obj.edit65:setField("PoderReferencia");
    obj.edit65:setName("edit65");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout82);
    obj.dataLink71:setFields({'PoderReferencia'});
    obj.dataLink71:setDefaultValues({'Pagina e Livro de Ref'});
    obj.dataLink71:setName("dataLink71");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Logs");
    obj.tab5:setName("tab5");

    obj.frm_FM = GUI.fromHandle(_obj_newObject("form"));
    obj.frm_FM:setParent(obj.tab5);
    obj.frm_FM:setName("frm_FM");
    obj.frm_FM:setFormType("sheetTemplate");
    obj.frm_FM:setDataType("Ficha_MM3e");
    obj.frm_FM:setTitle("Ficha Multiaba");
    obj.frm_FM:setAlign("client");
    obj.frm_FM:setTheme("dark");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frm_FM);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.scrollBox7);
    obj.label57:setLeft(150);
    obj.label57:setTop(0);
    obj.label57:setWidth(550);
    obj.label57:setHeight(50);
    obj.label57:setRotationAngle(0);
    obj.label57:setHorzTextAlign("leading");
    obj.label57:setText("Os códigos desta aba foram adaptados de Ambesek/RPGMeister no GitHub.\n Obrigado por compartilhar! ^^");
    obj.label57:setName("label57");

    obj.popCredit = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCredit:setParent(obj.scrollBox7);
    obj.popCredit:setName("popCredit");
    obj.popCredit:setWidth(210);
    obj.popCredit:setHeight(120);
    obj.popCredit:setBackOpacity(0.4);

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.popCredit);
    obj.layout83:setLeft(5);
    obj.layout83:setTop(5);
    obj.layout83:setWidth(200);
    obj.layout83:setHeight(120);
    obj.layout83:setName("layout83");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout83);
    obj.rectangle21:setLeft(0);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(200);
    obj.rectangle21:setHeight(110);
    obj.rectangle21:setColor("#3f8270");
    obj.rectangle21:setXradius(15);
    obj.rectangle21:setYradius(15);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setName("rectangle21");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout83);
    obj.label58:setLeft(0);
    obj.label58:setTop(1);
    obj.label58:setWidth(200);
    obj.label58:setHeight(50);
    obj.label58:setText("● Antes de criar, estabeleça um Padrão Global no botão ao lado.");
    obj.label58:setFontColor("white");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout83);
    obj.label59:setLeft(0);
    obj.label59:setTop(40);
    obj.label59:setWidth(200);
    obj.label59:setHeight(70);
    obj.label59:setText("● Acumular muitas abas pode gerar algum lag para carregar \n a ficha. ");
    obj.label59:setFontColor("white");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setMargins({top=2});
    obj.label59:setName("label59");

    obj.popupSettings = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupSettings:setParent(obj.scrollBox7);
    obj.popupSettings:setName("popupSettings");
    obj.popupSettings:setWidth(210);
    obj.popupSettings:setHeight(160);
    obj.popupSettings:setBackOpacity(0.4);

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.popupSettings);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(5);
    obj.layout84:setWidth(200);
    obj.layout84:setHeight(160);
    obj.layout84:setName("layout84");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout84);
    obj.rectangle22:setLeft(0);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(200);
    obj.rectangle22:setHeight(150);
    obj.rectangle22:setColor("#3f8270");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout84);
    obj.label60:setTop(0);
    obj.label60:setWidth(150);
    obj.label60:setHeight(25);
    obj.label60:setText("Cor padrão de Fundo");
    obj.label60:setFontColor("white");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.colorComboBox1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox1:setParent(obj.layout84);
    obj.colorComboBox1:setLeft(150);
    obj.colorComboBox1:setTop(0);
    obj.colorComboBox1:setWidth(50);
    obj.colorComboBox1:setHeight(25);
    obj.colorComboBox1:setField("backgroundColor");
    obj.colorComboBox1:setColor("black");
    obj.colorComboBox1:setUseAlpha(false);
    obj.colorComboBox1:setHint("Muda a cor padrão da cor de fundo do editor de texto. ");
    obj.colorComboBox1:setName("colorComboBox1");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout84);
    obj.label61:setTop(25);
    obj.label61:setWidth(150);
    obj.label61:setHeight(25);
    obj.label61:setText("Cor padrão de Fonte");
    obj.label61:setFontColor("white");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.colorComboBox2 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox2:setParent(obj.layout84);
    obj.colorComboBox2:setLeft(150);
    obj.colorComboBox2:setTop(25);
    obj.colorComboBox2:setWidth(50);
    obj.colorComboBox2:setHeight(25);
    obj.colorComboBox2:setField("fontColor");
    obj.colorComboBox2:setColor("black");
    obj.colorComboBox2:setUseAlpha(false);
    obj.colorComboBox2:setHint("Muda a cor padrão da fonte do editor de texto.");
    obj.colorComboBox2:setName("colorComboBox2");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout84);
    obj.dataLink72:setField("fontColor");
    obj.dataLink72:setDefaultValue("#FFFFFF");
    obj.dataLink72:setName("dataLink72");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout84);
    obj.label62:setTop(50);
    obj.label62:setWidth(150);
    obj.label62:setHeight(25);
    obj.label62:setText("Tamanho padrão de Fonte");
    obj.label62:setFontColor("white");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setFontSize(11);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout84);
    obj.edit66:setLeft(150);
    obj.edit66:setTop(50);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setType("number");
    obj.edit66:setField("fontSize");
    obj.edit66:setMin(8);
    obj.edit66:setMax(72);
    obj.edit66:setName("edit66");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout84);
    obj.dataLink73:setField("fontSize");
    obj.dataLink73:setDefaultValue("15");
    obj.dataLink73:setName("dataLink73");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout84);
    obj.checkBox4:setTop(75);
    obj.checkBox4:setWidth(200);
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setText("Ocultar barra de edição");
    obj.checkBox4:setFontColor("white");
    obj.checkBox4:setVertTextAlign("center");
    obj.checkBox4:setField("showToolbar");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout84);
    obj.checkBox5:setTop(100);
    obj.checkBox5:setWidth(200);
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setText("Padrão Global.");
    obj.checkBox5:setFontColor("white");
    obj.checkBox5:setVertTextAlign("center");
    obj.checkBox5:setField("global");
    obj.checkBox5:setHint("Vai usar essas configurações em todas as abas.");
    obj.checkBox5:setName("checkBox5");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout84);
    obj.button19:setTop(125);
    obj.button19:setWidth(200);
    obj.button19:setHeight(25);
    obj.button19:setText("Padrão Global.");
    obj.button19:setHint("Vai usar as últimas configurações usadas em outras abas nessa.");
    obj.button19:setName("button19");


			local default = NDB.load("defaults.xml");
			
			--colocar algo para quando sheet terminar de carregar puxar os valores de default. 

			local function dump(o)
			   if type(o) == 'table' then
				  local s = '{ '
				  for k,v in pairs(o) do
					 if type(k) ~= 'number' then k = '"'..k..'"' end
					 s = s .. '['..k..'] = ' .. dump(v) .. ','
				  end
				  return s .. '} '
			   else
				  return tostring(o)
			   end
			end
			
			local function loadDefault()
				if sheet==nil then return end;

				if default.global then
					sheet.showToolbar = default.showToolbar;
					sheet.fontSize = default.fontSize;
					sheet.fontColor = default.fontColor;
					sheet.backgroundColor = default.backgroundColor;
					sheet.global = true;
				end;

				self.txt.showToolbar = not sheet.showToolbar;
				self.txt.defaultFontSize = sheet.fontSize;
				self.txt.defaultFontColor = sheet.fontColor;
				self.txt.backgroundColor = sheet.backgroundColor;

			end;
			


    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox7);
    obj.layout85:setAlign("top");
    obj.layout85:setName("layout85");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout85);
    obj.layout86:setAlign("left");
    obj.layout86:setWidth(150);
    obj.layout86:setName("layout86");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout86);
    obj.button20:setLeft(0);
    obj.button20:setTop(0);
    obj.button20:setWidth(45);
    obj.button20:setHeight(45);
    obj.button20:setText("");
    obj.button20:setHint("Adiciona nova aba. ");
    obj.button20:setName("button20");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.button20);
    obj.image17:setLeft(5);
    obj.image17:setTop(5);
    obj.image17:setWidth(35);
    obj.image17:setHeight(35);
    obj.image17:setSRC("/Ficha_MM3ed_RRPG_image/images/addIcon.png");
    obj.image17:setName("image17");

    obj.settingsBT = GUI.fromHandle(_obj_newObject("button"));
    obj.settingsBT:setParent(obj.layout86);
    obj.settingsBT:setLeft(50);
    obj.settingsBT:setTop(0);
    obj.settingsBT:setWidth(45);
    obj.settingsBT:setHeight(45);
    obj.settingsBT:setText("");
    obj.settingsBT:setName("settingsBT");
    obj.settingsBT:setHint("Opções da ficha.");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.settingsBT);
    obj.image18:setLeft(5);
    obj.image18:setTop(5);
    obj.image18:setWidth(35);
    obj.image18:setHeight(35);
    obj.image18:setSRC("/Ficha_MM3ed_RRPG_image/images/config.png");
    obj.image18:setName("image18");

    obj.creditBt = GUI.fromHandle(_obj_newObject("button"));
    obj.creditBt:setParent(obj.layout86);
    obj.creditBt:setLeft(100);
    obj.creditBt:setTop(0);
    obj.creditBt:setWidth(45);
    obj.creditBt:setHeight(45);
    obj.creditBt:setText("");
    obj.creditBt:setName("creditBt");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.creditBt);
    obj.image19:setLeft(5);
    obj.image19:setTop(5);
    obj.image19:setWidth(35);
    obj.image19:setHeight(35);
    obj.image19:setSRC("/Ficha_MM3ed_RRPG_image/images/helpIcon.png");
    obj.image19:setName("image19");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout85);
    obj.layout87:setAlign("client");
    obj.layout87:setName("layout87");

    obj.rclAbas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAbas:setParent(obj.layout87);
    obj.rclAbas:setName("rclAbas");
    obj.rclAbas:setField("abas");
    obj.rclAbas:setTemplateForm("frm_FM_Aba");
    obj.rclAbas:setAlign("top");
    obj.rclAbas:setHeight(46);
    obj.rclAbas:setSelectable(true);
    obj.rclAbas:setLayout("horizontal");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox7);
    obj.layout88:setAlign("client");
    obj.layout88:setName("layout88");

    obj.boxTexto = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxTexto:setParent(obj.layout88);
    obj.boxTexto:setName("boxTexto");
    obj.boxTexto:setAlign("client");
    obj.boxTexto:setVisible(false);

    obj.txt = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.txt:setParent(obj.boxTexto);
    obj.txt:setName("txt");
    obj.txt:setAlign("client");
    lfm_setPropAsString(obj.txt, "backgroundColor",  "black");
    lfm_setPropAsString(obj.txt, "defaultFontColor",  "white");
    obj.txt:setField("txt");
    lfm_setPropAsString(obj.txt, "hideSelection",  "false");
    lfm_setPropAsString(obj.txt, "animateImages",  "true");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Consultas");
    obj.tab6:setName("tab6");

    obj.frmFicha_MM3ed_RRPG_Consultas = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3ed_RRPG_Consultas:setParent(obj.tab6);
    obj.frmFicha_MM3ed_RRPG_Consultas:setName("frmFicha_MM3ed_RRPG_Consultas");
    obj.frmFicha_MM3ed_RRPG_Consultas:setAlign("client");
    obj.frmFicha_MM3ed_RRPG_Consultas:setTheme("dark");
    obj.frmFicha_MM3ed_RRPG_Consultas:setMargins({top=1});

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmFicha_MM3ed_RRPG_Consultas);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox8);
    obj.rectangle23:setWidth(893);
    obj.rectangle23:setHeight(1263);
    obj.rectangle23:setColor("#6cb098");
    obj.rectangle23:setName("rectangle23");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.rectangle23);
    obj.image20:setLeft(0);
    obj.image20:setTop(0);
    obj.image20:setWidth(893);
    obj.image20:setHeight(1263);
    obj.image20:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo2.png");
    obj.image20:setStyle("stretch");
    obj.image20:setOptimize(true);
    obj.image20:setName("image20");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox8);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(700);
    obj.layout89:setHeight(1263);
    obj.layout89:setMargins({top=2, left=2, right=2});
    obj.layout89:setName("layout89");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout89);
    obj.rectangle24:setAlign("top");
    obj.rectangle24:setColor("#264d43");
    obj.rectangle24:setWidth(331);
    obj.rectangle24:setHeight(32);
    obj.rectangle24:setMargins({top=4});
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);
    obj.rectangle24:setName("rectangle24");

    obj.popTabelaMed = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTabelaMed:setParent(obj.rectangle24);
    obj.popTabelaMed:setName("popTabelaMed");
    obj.popTabelaMed:setWidth(280);
    obj.popTabelaMed:setHeight(586);
    obj.popTabelaMed:setBackOpacity(0.5);

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.popTabelaMed);
    obj.image21:setAlign("client");
    obj.image21:setStyle("proportional");
    obj.image21:setSRC("/Ficha_MM3ed_RRPG_image/images/TabelaMed.png");
    obj.image21:setName("image21");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle24);
    obj.button21:setText("TABELA DE MEDIDAS");
    obj.button21:setWidth(160);
    obj.button21:setHeight(25);
    obj.button21:setLeft(5);
    obj.button21:setTop(4);
    obj.button21:setName("button21");

    obj.popTabelaTam = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTabelaTam:setParent(obj.rectangle24);
    obj.popTabelaTam:setName("popTabelaTam");
    obj.popTabelaTam:setWidth(436);
    obj.popTabelaTam:setHeight(290);
    obj.popTabelaTam:setBackOpacity(0.5);

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.popTabelaTam);
    obj.image22:setAlign("client");
    obj.image22:setStyle("proportional");
    obj.image22:setSRC("/Ficha_MM3ed_RRPG_image/images/TabelaTam.png");
    obj.image22:setName("image22");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle24);
    obj.button22:setText("TABELA DE TAMANHO");
    obj.button22:setWidth(160);
    obj.button22:setHeight(25);
    obj.button22:setLeft(170);
    obj.button22:setTop(4);
    obj.button22:setName("button22");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle24);
    obj.label63:setLeft(337);
    obj.label63:setText("GRADUAÇÃO EM VELOCIDADE");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setTop(6);
    obj.label63:setWidth(190);
    obj.label63:setHeight(20);
    obj.label63:setName("label63");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.rectangle24);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setLeft(528);
    obj.edit67:setTop(3);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setType("float");
    obj.edit67:setField("Velocidade1");
    obj.edit67:setName("edit67");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle24);
    obj.label64:setLeft(562);
    obj.label64:setText("≅");
    obj.label64:setTop(5);
    obj.label64:setWidth(8);
    obj.label64:setHeight(20);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle24);
    obj.rectangle25:setLeft(575);
    obj.rectangle25:setTop(3);
    obj.rectangle25:setWidth(33);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("#202020");
    obj.rectangle25:setStrokeColor("black");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle25);
    obj.label65:setText("0");
    obj.label65:setLeft(0);
    obj.label65:setTop(2);
    obj.label65:setWidth(33);
    obj.label65:setHeight(20);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setField("VelocidadeTotal");
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle24);
    obj.label66:setLeft(610);
    obj.label66:setText("km/h");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setTop(5);
    obj.label66:setWidth(38);
    obj.label66:setHeight(20);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.rectangle24);
    obj.dataLink74:setFields({'Velocidade1'});
    obj.dataLink74:setDefaultValues({'0'});
    obj.dataLink74:setName("dataLink74");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout89);
    obj.rectangle26:setAlign("top");
    obj.rectangle26:setColor("#264d43");
    obj.rectangle26:setWidth(631);
    obj.rectangle26:setHeight(60);
    obj.rectangle26:setMargins({top=4});
    obj.rectangle26:setStrokeColor("#264d43");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);
    obj.rectangle26:setName("rectangle26");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle26);
    obj.label67:setAlign("top");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setText("VANTAGENS");
    obj.label67:setFontColor("white");
    obj.label67:setFontSize(16);
    obj.label67:setMargins({left=10});
    obj.label67:setName("label67");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle26);
    obj.layout90:setAlign("left");
    obj.layout90:setWidth(695);
    obj.layout90:setHeight(32);
    obj.layout90:setMargins({top=2, left=2, right=2});
    obj.layout90:setName("layout90");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout90);
    obj.comboBox3:setVertTextAlign("center");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setFontSize(12);
    obj.comboBox3:setLeft(0);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(165);
    obj.comboBox3:setHeight(27);
    obj.comboBox3:setField("chaveVantagem");
    obj.comboBox3:setItems({'Ação em Movimento', 'Agarrar Aprimorado', 'Agarrar Preciso', 'Agarrar Rápido', 'Ambiente Favorito',
																																					'Arma Improvisada', 'Armação', 'Artífice', 'Assustar', 'Ataque à Distância', 'Ataque Acurado',
																																					'Ataque Corpo-a-Corpo', 'Ataque Defensivo', 'Ataque Dominó', 'Ataque Imprudente', 'Ataque Poderoso',
																																					'Ataque Preciso', 'Atraente', 'Avaliação', 'Bem Informado', 'Bem Relacionado', 'Benefício', 'Capanga',
																																					'Contatos', 'Crítico Aprimorado ', 'De Pé', 'Defesa Aprimorada', 'Derrubar Aprimorado', 'Desarmar Aprimorado',
																																					'Destemido', 'Duro de Matar', 'Empatia com Animais', 'Equipamento', 'Esconder-se à Plena Vista',
																																					'Esforço Extraordinário', 'Esforço Supremo', 'Esquiva Fabulosa', 'Estrangular', 'Evasão', 'Fascinar',
																																					'Faz Tudo', 'Ferramentas Aprimoradas', 'Finta Ágil', 'Idiomas', 'Imobilizar Aprimorado', 'Iniciativa Aprimorada',
																																					'Inimigo Favorito', 'Inspirar', 'Interpor-se', 'Inventor', 'Liderança', 'Luta no Chão', 'Maestria em Arremesso',
																																					'Maestria em Perícia', 'Memória Eidética', 'Mira Aprimorada ', 'Parceiro', 'Prender Arma', 'Quebrar Aprimorado',
																																					'Quebrar Arma', 'Rastrear', 'Redirecionar', 'Ritualista', 'Rolamento Defensivo', 'Saque Rápido', 'Segunda Chance',
																																					'Sorte', 'Sorte de Principiante', 'Tolerância Maior', 'Tomar a Iniciativa', 'Tontear', 'Trabalho em Equipe', 'Transe', 'Zombar', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35',
					'36', '37', '38', '39', '40', '41', '42', '43', '44', '45','46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout90);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setColor("#6cb098");
    obj.rectangle27:setWidth(530);
    obj.rectangle27:setHeight(30);
    obj.rectangle27:setMargins({top=2, left=165, right=2});
    obj.rectangle27:setStrokeColor("#202020");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setXradius(2);
    obj.rectangle27:setYradius(2);
    obj.rectangle27:setName("rectangle27");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle27);
    obj.textEditor6:setLeft(2);
    obj.textEditor6:setTop(-2);
    obj.textEditor6:setWidth(530);
    obj.textEditor6:setHeight(30);
    obj.textEditor6:setFontSize(12);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("ConsultaVantagem");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setMargins({top=2, left=2});
    obj.textEditor6:setName("textEditor6");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout89);
    obj.rectangle28:setAlign("top");
    obj.rectangle28:setColor("#264d43");
    obj.rectangle28:setWidth(631);
    obj.rectangle28:setHeight(123);
    obj.rectangle28:setMargins({top=4});
    obj.rectangle28:setStrokeColor("#264d43");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setXradius(10);
    obj.rectangle28:setYradius(10);
    obj.rectangle28:setName("rectangle28");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle28);
    obj.label68:setAlign("top");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setText("CONDIÇÕES BÁSICAS");
    obj.label68:setFontColor("white");
    obj.label68:setFontSize(16);
    obj.label68:setMargins({left=10});
    obj.label68:setName("label68");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle28);
    obj.layout91:setAlign("left");
    obj.layout91:setWidth(695);
    obj.layout91:setHeight(99);
    obj.layout91:setMargins({top=2, left=2, right=2});
    obj.layout91:setName("layout91");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout91);
    obj.comboBox4:setVertTextAlign("center");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setFontSize(12);
    obj.comboBox4:setLeft(0);
    obj.comboBox4:setTop(0);
    obj.comboBox4:setWidth(165);
    obj.comboBox4:setHeight(27);
    obj.comboBox4:setField("chaveCondicao1");
    obj.comboBox4:setItems({'Atordoado', 'Compelido', 'Controlado', 'Debilitado', 'Desabilitado', 'Desatento', 'Enfraquecido', 'Fatigado',
																																					'Imóvel', 'Impedido', 'Indefeso', 'Normal', 'Prejudicado', 'Tonto', 'Transformado', 'Vulnerável', '-'});
    obj.comboBox4:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17'});
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setName("comboBox4");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout91);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setColor("#6cb098");
    obj.rectangle29:setWidth(530);
    obj.rectangle29:setHeight(99);
    obj.rectangle29:setMargins({top=2, left=165, right=2});
    obj.rectangle29:setStrokeColor("#202020");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setXradius(2);
    obj.rectangle29:setYradius(2);
    obj.rectangle29:setName("rectangle29");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle29);
    obj.textEditor7:setLeft(2);
    obj.textEditor7:setTop(-2);
    obj.textEditor7:setWidth(530);
    obj.textEditor7:setHeight(97);
    obj.textEditor7:setFontSize(12);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("ConsultaCondicao1");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setMargins({top=2, left=2});
    obj.textEditor7:setName("textEditor7");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout89);
    obj.rectangle30:setAlign("top");
    obj.rectangle30:setColor("#264d43");
    obj.rectangle30:setWidth(631);
    obj.rectangle30:setHeight(123);
    obj.rectangle30:setMargins({top=4});
    obj.rectangle30:setStrokeColor("#264d43");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setXradius(10);
    obj.rectangle30:setYradius(10);
    obj.rectangle30:setName("rectangle30");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle30);
    obj.label69:setAlign("top");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setText("CONDIÇÕES COMBINADAS");
    obj.label69:setFontColor("white");
    obj.label69:setFontSize(16);
    obj.label69:setMargins({left=10});
    obj.label69:setName("label69");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle30);
    obj.layout92:setAlign("left");
    obj.layout92:setWidth(695);
    obj.layout92:setHeight(99);
    obj.layout92:setMargins({top=2, left=2, right=2});
    obj.layout92:setName("layout92");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout92);
    obj.comboBox5:setVertTextAlign("center");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setFontSize(12);
    obj.comboBox5:setLeft(0);
    obj.comboBox5:setTop(0);
    obj.comboBox5:setWidth(165);
    obj.comboBox5:setHeight(27);
    obj.comboBox5:setField("chaveCondicao2");
    obj.comboBox5:setItems({'Abatido', 'Adormecido', 'Caído', 'Cego', 'Exausto', 'Incapacitado', 'Moribundo',
																																					'Paralisado', 'Restrito', 'Surdo', 'Surpreso', 'Transe', '-'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setName("comboBox5");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout92);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setColor("#6cb098");
    obj.rectangle31:setWidth(530);
    obj.rectangle31:setHeight(99);
    obj.rectangle31:setMargins({top=2, left=165, right=2});
    obj.rectangle31:setStrokeColor("#202020");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setXradius(2);
    obj.rectangle31:setYradius(2);
    obj.rectangle31:setName("rectangle31");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle31);
    obj.textEditor8:setLeft(2);
    obj.textEditor8:setTop(-2);
    obj.textEditor8:setWidth(530);
    obj.textEditor8:setHeight(97);
    obj.textEditor8:setFontSize(12);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("ConsultaCondicao2");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setMargins({top=2, left=2});
    obj.textEditor8:setName("textEditor8");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout89);
    obj.rectangle32:setAlign("top");
    obj.rectangle32:setColor("#264d43");
    obj.rectangle32:setWidth(631);
    obj.rectangle32:setHeight(123);
    obj.rectangle32:setMargins({top=4});
    obj.rectangle32:setStrokeColor("#264d43");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setXradius(10);
    obj.rectangle32:setYradius(10);
    obj.rectangle32:setName("rectangle32");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle32);
    obj.label70:setAlign("top");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setText("INVENTANDO COM MAGIA OU TECNOLOGIA");
    obj.label70:setFontColor("white");
    obj.label70:setFontSize(16);
    obj.label70:setMargins({left=10});
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle32);
    obj.label71:setAlign("top");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setText("");
    obj.label71:setFontColor("white");
    obj.label71:setFontSize(16);
    obj.label71:setMargins({left=10});
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle32);
    obj.label72:setAlign("top");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setText("PROJETO                                                               CONSTRUÇÃO");
    obj.label72:setFontColor("white");
    obj.label72:setFontSize(16);
    obj.label72:setMargins({left=10});
    obj.label72:setName("label72");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle32);
    obj.layout93:setAlign("left");
    obj.layout93:setWidth(695);
    obj.layout93:setHeight(99);
    obj.layout93:setMargins({top=2, left=2, right=2});
    obj.layout93:setName("layout93");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout93);
    obj.label73:setLeft(3);
    obj.label73:setTop(6);
    obj.label73:setText("Custo de Poder:");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setWidth(190);
    obj.label73:setHeight(20);
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout93);
    obj.label74:setLeft(3);
    obj.label74:setTop(30);
    obj.label74:setText("Acelerar Projeto:");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setWidth(190);
    obj.label74:setHeight(20);
    obj.label74:setName("label74");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout93);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setLeft(108);
    obj.edit68:setTop(3);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setType("float");
    obj.edit68:setField("custoInvento");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout93);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setLeft(108);
    obj.edit69:setTop(30);
    obj.edit69:setWidth(30);
    obj.edit69:setHeight(25);
    obj.edit69:setType("float");
    obj.edit69:setField("tempoProjetoRapido");
    obj.edit69:setName("edit69");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout93);
    obj.dataLink75:setFields({'tempoProjetoRapido'});
    obj.dataLink75:setDefaultValues({'0'});
    obj.dataLink75:setName("dataLink75");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout93);
    obj.label75:setLeft(155);
    obj.label75:setTop(6);
    obj.label75:setText("CD de Projeto:");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setWidth(190);
    obj.label75:setHeight(20);
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout93);
    obj.label76:setLeft(155);
    obj.label76:setTop(30);
    obj.label76:setText("Tempo de Projeto:");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setWidth(190);
    obj.label76:setHeight(20);
    obj.label76:setName("label76");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout93);
    obj.rectangle33:setLeft(270);
    obj.rectangle33:setTop(3);
    obj.rectangle33:setWidth(33);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("#202020");
    obj.rectangle33:setStrokeColor("black");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle33);
    obj.label77:setText("0");
    obj.label77:setLeft(0);
    obj.label77:setTop(2);
    obj.label77:setWidth(33);
    obj.label77:setHeight(20);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setField("cdProjeto");
    obj.label77:setName("label77");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout93);
    obj.rectangle34:setLeft(270);
    obj.rectangle34:setTop(30);
    obj.rectangle34:setWidth(130);
    obj.rectangle34:setHeight(23);
    obj.rectangle34:setColor("#264d43");
    obj.rectangle34:setName("rectangle34");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle34);
    obj.label78:setVisible(false);
    obj.label78:setText("0");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setField("tempoProjeto");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle34);
    obj.label79:setText("0");
    obj.label79:setLeft(0);
    obj.label79:setTop(0);
    obj.label79:setWidth(130);
    obj.label79:setHeight(20);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setField("tempoShowProjeto");
    obj.label79:setName("label79");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout93);
    obj.dataLink76:setFields({'custoInvento', 'tempoProjetoRapido', 'tempoProjeto'});
    obj.dataLink76:setDefaultValues({'0'});
    obj.dataLink76:setName("dataLink76");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout93);
    obj.rectangle35:setLeft(345);
    obj.rectangle35:setTop(3);
    obj.rectangle35:setWidth(5);
    obj.rectangle35:setHeight(56);
    obj.rectangle35:setColor("#8bad9f");
    obj.rectangle35:setStrokeColor("black");
    obj.rectangle35:setXradius(2);
    obj.rectangle35:setYradius(2);
    obj.rectangle35:setName("rectangle35");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout93);
    obj.label80:setLeft(357);
    obj.label80:setTop(6);
    obj.label80:setText("Custo de Poder:");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setWidth(190);
    obj.label80:setHeight(20);
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout93);
    obj.label81:setLeft(357);
    obj.label81:setTop(30);
    obj.label81:setText("Acelerar Constr.:");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setWidth(190);
    obj.label81:setHeight(20);
    obj.label81:setName("label81");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout93);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setLeft(460);
    obj.edit70:setTop(3);
    obj.edit70:setWidth(30);
    obj.edit70:setHeight(25);
    obj.edit70:setType("float");
    obj.edit70:setField("custoInvento");
    obj.edit70:setName("edit70");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout93);
    obj.dataLink77:setFields({'custoInvento'});
    obj.dataLink77:setDefaultValues({'0'});
    obj.dataLink77:setName("dataLink77");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout93);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setLeft(460);
    obj.edit71:setTop(30);
    obj.edit71:setWidth(30);
    obj.edit71:setHeight(25);
    obj.edit71:setType("float");
    obj.edit71:setField("tempoContruirRapido");
    obj.edit71:setName("edit71");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout93);
    obj.dataLink78:setFields({'tempoContruirRapido'});
    obj.dataLink78:setDefaultValues({'0'});
    obj.dataLink78:setName("dataLink78");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout93);
    obj.label82:setLeft(505);
    obj.label82:setTop(6);
    obj.label82:setText("CD de Construção:");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setWidth(190);
    obj.label82:setHeight(20);
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout93);
    obj.label83:setLeft(505);
    obj.label83:setTop(30);
    obj.label83:setText("Tempo de Constr.:");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setWidth(190);
    obj.label83:setHeight(20);
    obj.label83:setName("label83");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout93);
    obj.rectangle36:setLeft(620);
    obj.rectangle36:setTop(3);
    obj.rectangle36:setWidth(33);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("#202020");
    obj.rectangle36:setStrokeColor("black");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle36);
    obj.label84:setText("0");
    obj.label84:setLeft(0);
    obj.label84:setTop(2);
    obj.label84:setWidth(33);
    obj.label84:setHeight(20);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("cdInventoC");
    obj.label84:setName("label84");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout93);
    obj.rectangle37:setLeft(620);
    obj.rectangle37:setTop(30);
    obj.rectangle37:setWidth(130);
    obj.rectangle37:setHeight(23);
    obj.rectangle37:setColor("#264d43");
    obj.rectangle37:setName("rectangle37");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle37);
    obj.label85:setVisible(false);
    obj.label85:setText("0");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setField("tempoConstruir");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle37);
    obj.label86:setText("0");
    obj.label86:setLeft(0);
    obj.label86:setTop(0);
    obj.label86:setWidth(130);
    obj.label86:setHeight(20);
    obj.label86:setHorzTextAlign("leading");
    obj.label86:setField("tempoShowConstruir");
    obj.label86:setName("label86");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout93);
    obj.dataLink79:setFields({'custoInvento', 'tempoContruirRapido', 'tempoConstruir'});
    obj.dataLink79:setDefaultValues({'0'});
    obj.dataLink79:setName("dataLink79");

    obj._e_event0 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varFORvalor or 0);								
            					sheet.varFOR = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varFOR = "+" .. bonus;
            					else	
            						sheet.varFOR = bonus;
            					end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.FORtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Força de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event2 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varAGIvalor or 0);								
            					sheet.varAGI = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varAGI = "+" .. bonus;
            					else	
            						sheet.varAGI = bonus;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.AGItotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Agilidade de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event4 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varLUTvalor or 0);								
            					sheet.varLUT = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varLUT = "+" .. bonus;
            					else	
            						sheet.varLUT = bonus;
            					end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.LUTtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Luta de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event6 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varPROvalor or 0);								
            					sheet.varPRO = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varPRO = "+" .. bonus;
            					else	
            						sheet.varPRO = bonus;
            					end;
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.PROtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Prontidão de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event8 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varVIGvalor or 0);								
            					sheet.varVIG = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varVIG = "+" .. bonus;
            					else	
            						sheet.varVIG = bonus;
            					end;
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.VIGtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Vigor de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event10 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varDESvalor or 0);								
            					sheet.varDES = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varDES = "+" .. bonus;
            					else	
            						sheet.varDES = bonus;
            					end;
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.DEStotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Destreza de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event12 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varINTvalor or 0);								
            					sheet.varINT = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varINT = "+" .. bonus;
            					else	
            						sheet.varINT = bonus;
            					end;
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.INTtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Intelecto de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event14 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bonus = tonumber(sheet.varPREvalor or 0);								
            					sheet.varPRE = bonus;	
            				
            					if bonus >= 0 then
            						sheet.varPRE = "+" .. bonus;
            					else	
            						sheet.varPRE = bonus;
            					end;
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.PREtotal); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Presença de " .. (sheet.CODINOME or "Herói"));
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclVantagens:append();
        end, obj);

    obj._e_event17 = obj.rclVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomeVantagem, nodeB.nomeVantagem);
        end, obj);

    obj._e_event18 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclAtaques:append();
        end, obj);

    obj._e_event19 = obj.rclAtaques:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.ATK, nodeB.ATK);
        end, obj);

    obj._e_event20 = obj.button11:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
            					if (personagem ~= nil) then
            						local mesa = personagem.mesa;
            
            						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
            							local rolagem = Firecast.interpretarRolagem(sheet.Iniciativa); 
            
            							if not rolagem.possuiAlgumDado then
            								   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            							if mesaDoPersonagem ~= nil then
            								   mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.CODINOME or "Herói") );
            							end;
            						end;
            			end;
        end, obj);

    obj._e_event21 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.PenaRes ~= nil then
            						if sheet.PenaRes >= 0 then
            							sheet.PenaRes = 0 - (tonumber(sheet.PenaRes));
            						end;						
            					end;
        end, obj);

    obj._e_event22 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPvantagens = (tonumber(sheet.TotalppVantagem) or 0);
        end, obj);

    obj._e_event23 = obj.image10:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event24 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFesq1 = (tonumber(sheet.AGI) or 0) + (tonumber(sheet.varAGIvalor) or 0);
                           sheet.DEFapa1 = (tonumber(sheet.LUT) or 0) + (tonumber(sheet.varLUTvalor) or 0);
                           sheet.DEFvon1 = (tonumber(sheet.PRO) or 0) + (tonumber(sheet.varPROvalor) or 0);
                           sheet.DEFforti1 = (tonumber(sheet.VIG) or 0) + (tonumber(sheet.varVIGvalor) or 0);
                           sheet.DEFres1 = (tonumber(sheet.VIG) or 0) + (tonumber(sheet.varVIGvalor) or 0);
        end, obj);

    obj._e_event25 = obj.dataLink51:addEventListener("onChange",
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

    obj._e_event26 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFesqTotal = (tonumber(sheet.DEFesq1) or 0) + (tonumber(sheet.DEFesq2) or 0) + (tonumber(sheet.DEFesq3) or 0);
        end, obj);

    obj._e_event27 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFapaTotal = (tonumber(sheet.DEFapa1) or 0) + (tonumber(sheet.DEFapa2) or 0) + (tonumber(sheet.DEFapa3) or 0);
        end, obj);

    obj._e_event28 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFvonTotal = (tonumber(sheet.DEFvon1) or 0) + (tonumber(sheet.DEFvon2) or 0) + (tonumber(sheet.DEFvon3) or 0);
        end, obj);

    obj._e_event29 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFfortiTotal = (tonumber(sheet.DEFforti1) or 0) + (tonumber(sheet.DEFforti2) or 0) + (tonumber(sheet.DEFforti3) or 0);
        end, obj);

    obj._e_event30 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFresTotal = (tonumber(sheet.DEFres1) or 0) + (tonumber(sheet.DEFres2) or 0) + (tonumber(sheet.DEFres3) or 0);
        end, obj);

    obj._e_event31 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.DEFextraTotal = (tonumber(sheet.DEFextra1) or 0) + (tonumber(sheet.DEFextra2) or 0) + (tonumber(sheet.DEFextra3) or 0);
        end, obj);

    obj._e_event32 = obj.button12:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = Firecast.interpretarRolagem(sheet.DEFesqTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.activeChat:rolarDados(rolagem, "Esquivar de " .. (sheet.CODINOME or "Herói"));
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event33 = obj.button13:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = Firecast.interpretarRolagem(sheet.DEFapaTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.activeChat:rolarDados(rolagem, "Aparar de " .. (sheet.CODINOME or "Herói"));
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event34 = obj.button14:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = Firecast.interpretarRolagem(sheet.DEFvonTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.activeChat:rolarDados(rolagem, "Vontade de " .. (sheet.CODINOME or "Herói"));
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event35 = obj.button15:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = Firecast.interpretarRolagem(sheet.DEFfortiTOTAL); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
                                    end; 
            
                                    local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.activeChat:rolarDados(rolagem, "Fortitude de " .. (sheet.CODINOME or "Herói"));
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event36 = obj.button16:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            
                            if (personagem ~= nil) then
                                local mesa = personagem.mesa;
            
                                if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            
                                    local rolagem = Firecast.interpretarRolagem(sheet.DEFresTOTAL); 
            						local penalidade = Firecast.interpretarRolagem(sheet.PenaRes); 
            
                                    if not rolagem.possuiAlgumDado then
                                           rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem):concatenar(penalidade);
                                    end; 
            
                                    local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                    if mesaDoPersonagem ~= nil then
            								if sheet.PenaRes ~= nil then
            									mesaDoPersonagem.activeChat:rolarDados(rolagem, "Resistência de " .. (sheet.CODINOME or "Herói") .. " com penalidade de " .. (sheet.PenaRes));
            								else
            									mesaDoPersonagem.activeChat:rolarDados(rolagem, "Resistência de " .. (sheet.CODINOME or "Herói"));
            								end;
                                    end;
                                end;
            		end;
        end, obj);

    obj._e_event37 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.HeroHigh then
            						sheet.PPhabilidades = ((tonumber(sheet.FOR) or 0) + 1 +
            											  (tonumber(sheet.VIG) or 0) + 1 +
            											  (tonumber(sheet.AGI) or 0) + 1 +
            											  (tonumber(sheet.DES) or 0) + 1 +
            											  (tonumber(sheet.LUT) or 0) + 1 +
            											  (tonumber(sheet.INT) or 0) + 1 +
            											  (tonumber(sheet.PRO) or 0) + 1 +
            											  (tonumber(sheet.PRE) or 0) + 1) * 2;  
            					else
            						sheet.PPhabilidades = ((tonumber(sheet.FOR) or 0) +
            											  (tonumber(sheet.ppFOR) or 0) +
            											  (tonumber(sheet.VIG) or 0) +
            											  (tonumber(sheet.ppVIG) or 0) +
            											  (tonumber(sheet.AGI) or 0) +
            											  (tonumber(sheet.ppAGI) or 0) +
            											  (tonumber(sheet.DES) or 0) +
            											  (tonumber(sheet.ppDES) or 0) +
            											  (tonumber(sheet.LUT) or 0) +
            											  (tonumber(sheet.ppLUT) or 0) +
            											  (tonumber(sheet.INT) or 0) +
            											  (tonumber(sheet.ppINT) or 0) +
            											  (tonumber(sheet.PRO) or 0) +
            											  (tonumber(sheet.ppPRO) or 0) +
            											  (tonumber(sheet.PRE) or 0) +
            											  (tonumber(sheet.ppPRE) or 0)) * 2;                  
            					end;
            					
            					if tonumber(sheet.FOR) ~= nil then
            						sheet.ppFOR = 0;
            					else
            						sheet.ppFOR = -5;
            					end;
            					if tonumber(sheet.AGI) ~= nil then
            						sheet.ppAGI = 0;
            					else
            						sheet.ppAGI = -5;
            					end;
            					if tonumber(sheet.LUT) ~= nil then
            						sheet.ppLUT = 0;
            					else
            						sheet.ppLUT = -5;
            					end;
            					if tonumber(sheet.PRO) ~= nil then
            						sheet.ppPRO = 0;
            					else
            						sheet.ppPRO = -5;
            					end;
            					if tonumber(sheet.VIG) ~= nil then
            						sheet.ppVIG = 0;
            					else
            						sheet.ppVIG = -5;
            					end;
            					if tonumber(sheet.DES) ~= nil then
            						sheet.ppDES = 0;
            					else
            						sheet.ppDES = -5;
            					end;
            					if tonumber(sheet.INT) ~= nil then
            						sheet.ppINT = 0;
            					else
            						sheet.ppINT = -5;
            					end;
            					if tonumber(sheet.PRE) ~= nil then
            						sheet.ppPRE = 0;
            					else
            						sheet.ppPRE = -5;
            					end;
        end, obj);

    obj._e_event38 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPpericiasgrad = math.floor(sheet.PPpericias or 0) * 2;
        end, obj);

    obj._e_event39 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPpericias = math.floor(sheet.pontosPericia or 0) ;
        end, obj);

    obj._e_event40 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PPdefesas = (tonumber(sheet.DEFesq2) or 0) +
            								 (tonumber(sheet.DEFapa2) or 0) +
            								 (tonumber(sheet.DEFvon2) or 0) +
            								 (tonumber(sheet.DEFforti2) or 0) +
            								 (tonumber(sheet.DEFres2) or 0) +
            								 (tonumber(sheet.DEFextra2) or 0);
        end, obj);

    obj._e_event41 = obj.dataLink62:addEventListener("onChange",
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

    obj._e_event42 = obj.image13:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.sobmanto);
        end, obj);

    obj._e_event43 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event44 = obj.rclListaDasPericias:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					local nodes = NDB.getChildNodes(sheet.campoDasPericias);               
            					if #nodes == 0 then
            						dndSkills();
            					end;
        end, obj);

    obj._e_event45 = obj.rclListaDasPericias:addEventListener("onBeginEnumeration",
        function (_)
            if sheet==nil then return end;
            					local nodes = NDB.getChildNodes(sheet.campoDasPericias);               
            					if #nodes == 0 then
            						dndSkills();
            					end;
        end, obj);

    obj._e_event46 = obj.button17:addEventListener("onClick",
        function (_)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event47 = obj.button18:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event48 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode; 
                                         self.boxDetalhesDoItem.node = node;                       
            
                                          self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event49 = obj.colorComboBox1:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.backgroundColor = sheet.backgroundColor;
            							default.backgroundColor = sheet.backgroundColor;
            						end;
        end, obj);

    obj._e_event50 = obj.colorComboBox2:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.defaultFontColor = sheet.fontColor;
            							default.fontColor = sheet.fontColor;
            						end;
        end, obj);

    obj._e_event51 = obj.edit66:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.defaultFontSize = sheet.fontSize;
            							default.fontSize = sheet.fontSize;
            						end;
        end, obj);

    obj._e_event52 = obj.checkBox4:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.showToolbar = not sheet.showToolbar;
            							default.showToolbar = sheet.showToolbar;
            						end;
        end, obj);

    obj._e_event53 = obj.checkBox5:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            						default.global = sheet.global;
            					end;
        end, obj);

    obj._e_event54 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            							local default = NDB.load("defaults.xml");
            							
            							sheet.showToolbar = default.showToolbar;
            							self.txt.showToolbar = not sheet.showToolbar;
            
            							sheet.fontSize = default.fontSize;
            							self.txt.defaultFontSize = sheet.fontSize;
            
            							sheet.fontColor = default.fontColor;
            							self.txt.defaultFontColor = sheet.fontColor;
            							
            							sheet.backgroundColor = default.backgroundColor;
            							self.txt.backgroundColor = sheet.backgroundColor;
            						end;
        end, obj);

    obj._e_event55 = obj.button20:addEventListener("onClick",
        function (_)
            self.rclAbas:append();
        end, obj);

    obj._e_event56 = obj.settingsBT:addEventListener("onClick",
        function (_)
            loadDefault();
            						local pop = self:findControlByName("popupSettings");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("bottom", self.settingsBT);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de opções para exibir");
            						end;
        end, obj);

    obj._e_event57 = obj.creditBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCredit");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("bottom", self.creditBt);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de creditos para exibir");
            						end;
        end, obj);

    obj._e_event58 = obj.rclAbas:addEventListener("onSelect",
        function (_)
            local node = self.rclAbas.selectedNode;
            						self.boxTexto.node = node;
            						self.boxTexto.visible = (node ~= nil);
        end, obj);

    obj._e_event59 = obj.rclAbas:addEventListener("onEndEnumeration",
        function (_)
            if self.rclAbas.selectedNode == nil and sheet ~= nil then
            							local nodes = NDB.getChildNodes(sheet.abas);			   
            
            							if #nodes > 0 then
            								self.rclAbas.selectedNode = nodes[1];
            							end;
            						end;
        end, obj);

    obj._e_event60 = obj.txt:addEventListener("onMouseMove",
        function (_, event)
            loadDefault();
        end, obj);

    obj._e_event61 = obj.button21:addEventListener("onClick",
        function (_)
            self.popTabelaMed:show();
        end, obj);

    obj._e_event62 = obj.button22:addEventListener("onClick",
        function (_)
            self.popTabelaTam:show();
        end, obj);

    obj._e_event63 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.VelocidadeTotal = 2^((tonumber(sheet.Velocidade1) or 0) + 2);
        end, obj);

    obj._e_event64 = obj.comboBox3:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveVantagem == "1" then	mod = "Mova-se tanto antes quanto depois de sua ação padrão.";
            						elseif sheet.chaveVantagem == "2" then	mod = "Faça ataques de agarrar com apenas uma mão.";
            						elseif sheet.chaveVantagem == "3" then	mod = "Substitui Des por For em ataques para agarrar.";
            						elseif sheet.chaveVantagem == "4" then	mod = "Quando acerta um ataque desarmado, pode fazer um teste de agarrar como ação livre.";
            						elseif sheet.chaveVantagem == "5" then	mod = "Bônus de circunstância no ataque ou na defesa em determinado ambiente.";
            						elseif sheet.chaveVantagem == "6" then	mod = "Use a perícia Combate Desarmado com armas improvisadas, com bônus de dano de +1.";
            						elseif sheet.chaveVantagem == "7" then	mod = "Transfira o benefício de uma perícia de interação para um aliado.";
            						elseif sheet.chaveVantagem == "8" then	mod = "Use Especialidade: Magia para criar dispositivos mágicos temporários.";
            						elseif sheet.chaveVantagem == "9" then	mod = "Use Intimidação para fintar em combate.";
            						elseif sheet.chaveVantagem == "10" then	mod = "Bônus de +1 em testes de ataque à distância por graduação.";
            						elseif sheet.chaveVantagem == "11" then	mod = "Troque a CD do efeito por um bônus de ataque.";
            						elseif sheet.chaveVantagem == "12" then	mod = "Bônus de +1 em testes de ataque corpo-a-corpo por graduação.";
            						elseif sheet.chaveVantagem == "13" then	mod = "Troque um bônus de ataque por um bônus de defesa ativa.";
            						elseif sheet.chaveVantagem == "14" then	mod = "Ganhe um ataque extra quando incapacitar um capanga.";
            						elseif sheet.chaveVantagem == "15" then	mod = "Troque defesa ativa por um bônus de ataque.";
            						elseif sheet.chaveVantagem == "16" then	mod = "Troque bônus de ataque por bônus de efeito.";
            						elseif sheet.chaveVantagem == "17" then	mod = "Ignore penalidades em testes de ataque devido a cobertura ou camuflagem.";
            						elseif sheet.chaveVantagem == "18" then	mod = "Bônus de circunstância em perícias de interação baseado em sua aparência.";
            						elseif sheet.chaveVantagem == "19" then	mod = "Use Intuição para descobrir as habilidades de combate do oponente.";
            						elseif sheet.chaveVantagem == "20" then	mod = "Teste imediato de Investigação ou Percepção para saber alguma coisa.";
            						elseif sheet.chaveVantagem == "21" then	mod = "Chame ajuda ou consiga favores com um teste de Persuasão.";
            						elseif sheet.chaveVantagem == "22" then mod = "Ganhe uma gratificação ou benefício adicional.";
            						elseif sheet.chaveVantagem == "23" then	mod = "Ganhe um seguidor ou capanga com (15 x graduação) pontos de poder.";
            						elseif sheet.chaveVantagem == "24" then	mod = "Faça um teste inicial de Investigação em um minuto.";
            						elseif sheet.chaveVantagem == "25" then	mod = "+1 na ameaça de crítico com um ataque específico por graduação.";
            						elseif sheet.chaveVantagem == "26" then	mod = "Passe de caído para em pé como uma ação livre.";
            						elseif sheet.chaveVantagem == "27" then	mod = "Bônus de +2 em uma defesa ativa quando você usa a ação defender-se.";
            						elseif sheet.chaveVantagem == "28" then	mod = "Sem penalidade para usar a ação derrubar.";
            						elseif sheet.chaveVantagem == "29" then	mod = "Sem penalidade para usar a ação desarmar.";
            						elseif sheet.chaveVantagem == "30" then	mod = "Imune a efeitos de medo.";
            						elseif sheet.chaveVantagem == "31" then	mod = "Estabilize automaticamente quando moribundo.";
            						elseif sheet.chaveVantagem == "32" then	mod = "Use perícias de interação com animais.";
            						elseif sheet.chaveVantagem == "33" then	mod = "5 pontos de equipamento por graduação.";
            						elseif sheet.chaveVantagem == "34" then	mod = "Esconda-se quando observado sem precisar de uma distração.";
            						elseif sheet.chaveVantagem == "35" then	mod = "Ganhe dois benefícios quando usando esforço extra.";
            						elseif sheet.chaveVantagem == "36" then	mod = "Gaste um ponto heróico para ganhar um 20 efetivo em um teste específico.";
            						elseif sheet.chaveVantagem == "37" then	mod = "Você não fica vulnerável quando surpreso ou desatento.";
            						elseif sheet.chaveVantagem == "38" then	mod = "Sufoca um oponente que você tenha agarrado.";
            						elseif sheet.chaveVantagem == "39" then	mod = "Bônus de circunstância para evitar ataques de área.";
            						elseif sheet.chaveVantagem == "40" then	mod = "Use uma perícia de interação para prender a atenção dos outros.";
            						elseif sheet.chaveVantagem == "41" then	mod = "Use qualquer perícia sem treinamento.";
            						elseif sheet.chaveVantagem == "42" then	mod = "Sem penalidade por usar perícias sem as ferramentas apropriadas.";
            						elseif sheet.chaveVantagem == "43" then	mod = "Finte usando a perícia Acrobacia ou sua velocidade.";
            						elseif sheet.chaveVantagem == "44" then	mod = "Fale e compreenda idiomas adicionais.";
            						elseif sheet.chaveVantagem == "45" then	mod = "Penalidade de circunstância de –5 para escapar de você.";
            						elseif sheet.chaveVantagem == "46" then	mod = "Bônus de +4 por graduação em testes de iniciativa.";
            						elseif sheet.chaveVantagem == "47" then	mod = "Bônus de circunstância em testes contra um tipo de oponente.";
            						elseif sheet.chaveVantagem == "48" then	mod = "Gaste um ponto heróico para conceder a seus aliados um bônus de circunstância de +1 por graduação.";
            						elseif sheet.chaveVantagem == "49" then	mod = "Sofra um ataque mirado contra um aliado.";
            						elseif sheet.chaveVantagem == "50" then	mod = "Use Tecnologia para criar dispositivos temporários.";
            						elseif sheet.chaveVantagem == "51" then	mod = "Gaste um ponto heróico para remover uma condição de um aliado.";
            						elseif sheet.chaveVantagem == "52" then	mod = "Sem penalidade por lutar caído.";
            						elseif sheet.chaveVantagem == "53" then	mod = "Bônus de dano de +1 com armas arremessadas por graduação.";
            						elseif sheet.chaveVantagem == "54" then mod = "Realize testes de rotina com uma perícia sob quaisquer circunstâncias.";
            						elseif sheet.chaveVantagem == "55" then	mod = "Você se lembra de tudo, bônus de circunstância de +5 para se lembrar das coisas.";
            						elseif sheet.chaveVantagem == "56" then	mod = "Dobra os bônus de circunstância por mirar.";
            						elseif sheet.chaveVantagem == "57" then	mod = "Ganhe um parceiro com (5 x graduação) pontos de poder.";
            						elseif sheet.chaveVantagem == "58" then	mod = "Tentativa livre de desarme quando você se defende.";
            						elseif sheet.chaveVantagem == "59" then	mod = "Sem penalidade para usar a ação quebrar.";
            						elseif sheet.chaveVantagem == "60" then	mod = "Tentativa livre de quebrar quando você se defende.";
            						elseif sheet.chaveVantagem == "61" then	mod = "Use Percepção para seguir rastros.";
            						elseif sheet.chaveVantagem == "62" then	mod = "Use Enganação para redirecionar um ataque que falhe para outro alvo.";
            						elseif sheet.chaveVantagem == "63" then	mod = "Use Especialidade: Magia para criar e realizar rituais.";
            						elseif sheet.chaveVantagem == "64" then	mod = "Bônus de defesa ativa de +1 em Resistência por graduação.";
            						elseif sheet.chaveVantagem == "65" then	mod = "Saque uma arma como uma ação livre.";
            						elseif sheet.chaveVantagem == "66" then	mod = "Rerole um teste falho contra uma ameaça uma vez.";
            						elseif sheet.chaveVantagem == "67" then	mod = "Rerole uma rolagem uma vez por graduação.";
            						elseif sheet.chaveVantagem == "68" then	mod = "Gaste um ponto heróico para ganhar 5 graduações temporárias em uma perícia.";
            						elseif sheet.chaveVantagem == "69" then	mod = "+5 em testes envolvendo tolerância.";
            						elseif sheet.chaveVantagem == "70" then	mod = "Gaste um ponto heróico para agir primeiro na ordem de iniciativa.";
            						elseif sheet.chaveVantagem == "71" then	mod = "Use Enganação ou Intimidação para deixar um oponente tonto.";
            						elseif sheet.chaveVantagem == "72" then	mod = "+5 de bônus para ajudar em testes de equipe.";
            						elseif sheet.chaveVantagem == "73" then	mod = "Entre em um transe parecido com a morte que diminui as funções vitais.";
            						elseif sheet.chaveVantagem == "74" then	mod = "Use Enganação para desmoralizar em combate.";
            						elseif sheet.chaveVantagem == "75" then
            							mod =  " ";
            					end;
            					
            						sheet.ConsultaVantagem = mod;
            					
            				end;
        end, obj);

    obj._e_event65 = obj.comboBox4:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveCondicao1 == "1" then mod = "Atordoado: não pode executar ações, nem mesmo ações livres.";
            						elseif sheet.chaveCondicao1 == "2" then mod = "Compelled: o personagem fica limitado a ações livres e a uma única ação padrão por turno, com todas as ações sendo escolhidas pelo personagem que o controla. Controlado se sobrepõe a compelido.";
            						elseif sheet.chaveCondicao1 == "3" then mod = "Controlled: Outro personagem dita suas ações.";
            						elseif sheet.chaveCondicao1 == "4" then mod = "Debilitated: o personagem tem uma ou mais das habilidades reduzida para abaixo de –5.";
            						elseif sheet.chaveCondicao1 == "5" then mod = "Desabled: penalidade de –5 em todos os testes. Caso se aplique à(s) mesma(s) característica(s), debilitado se sobrepõe a desabilitado.";
            						elseif sheet.chaveCondicao1 == "6" then mod = "Unaware: o personagem está completamente inconsciente dos arredores, incapaz de interagir ou de fazer testes de Percepção ou executar qualquer ação baseada neles. Alvos têm cobertura total contra todos os sentidos do personagem desatento.";
            						elseif sheet.chaveCondicao1 == "7" then mod = "Weakened: o personagem perdeu pontos de poder em uma característica temporariamente. Debilitado se sobrepõe a enfraquecido.";
            						elseif sheet.chaveCondicao1 == "8" then mod = "Fatigued: fica Impedido. Um personagem se recupera da condição fatigada com uma hora de descanso.";
            						elseif sheet.chaveCondicao1 == "9" then mod = "Immobile: não tem velocidade de movimento e não pode se mover do lugar em que se encontram, embora ainda sejam capazes de executar ações.";
            						elseif sheet.chaveCondicao1 == "10" then mod = "Hindered: se move a metade de seu movimento normal (–1 graduação de velocidade). Imóvel se sobrepõe a impedido.";
            						elseif sheet.chaveCondicao1 == "11" then mod = "Defenseless: o bônus das defesas ativas de um personagem indefeso é 0. Atacantes podem atacar oponentes indefesos com testes de rotina. Se o atacante preferir fazer um teste de ataque normal, todos os acertos serão tratados como acertos críticos.";
            						elseif sheet.chaveCondicao1 == "12" then mod = "Normal: o personagem não está sob o efeito de nenhuma condição.";
            						elseif sheet.chaveCondicao1 == "13" then mod = "Impaired: sofre uma penalidade de circunstância de –2 em todos os testes. Caso se aplique à(s) mesma(s) característica(s), desabilitado se sobrepõe a prejudicado.";
            						elseif sheet.chaveCondicao1 == "14" then mod = "Dazed: fica limitado a ações livres e a uma única ação padrão por turno. Atordoado se sobrepõe a tonto.";
            						elseif sheet.chaveCondicao1 == "15" then mod = "Transformed: algumas ou todas as características do personagem são alteradas.";
            						elseif sheet.chaveCondicao1 == "16" then mod = "Vulnerable: divide suas defesas ativas pela metade (arredonde o resultado para cima). Indefeso se sobrepõe a vulnerável.";
            						elseif sheet.chaveCondicao1 == "17" then	mod =  " ";
            					end;
            						sheet.ConsultaCondicao1 = mod;
            					
            				end;
        end, obj);

    obj._e_event66 = obj.comboBox5:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveCondicao2 == "1" then mod = "Staggered: Tonto e impedido.";
            						elseif sheet.chaveCondicao2 == "2" then mod = "Asleep: Indefeso, imóvel e prejudicado.";
            						elseif sheet.chaveCondicao2 == "3" then mod = "Prone: um personagem caído jaz no chão, sofrendo uma penalidade de –5 em testes de combate corpo-a-corpo. Os oponentes ganham um bônus de +5 em testes de combate corpo-a-corpo, mas sofrem uma penalidade de –5 em testes de ataque à distância (na prática, o personagem caído tem cobertura total contra ataques à distância). Personagens caídos estão impedidos. Ficar de pé é uma ação de movimento.";
            						elseif sheet.chaveCondicao2 == "4" then mod = "Blind: Impedido, visualmente desatento e vulnerável, e pode estar prejudicado ou desabilidade para atividades visuais.";
            						elseif sheet.chaveCondicao2 == "5" then mod = "Exhausted: Prejudicado e impedido, recupere após 1 hora de descanso.";
            						elseif sheet.chaveCondicao2 == "6" then mod = "Incapacitated: Indefeso, atordoado e desatento. Normalmente ficam caídos.";
            						elseif sheet.chaveCondicao2 == "7" then mod = "Dying: Incapacitado e próximo da morte.";
            						elseif sheet.chaveCondicao2 == "8" then mod = "Paralyzed: Indefeso, imóvel e fisicamente atordoado; pode ser capaz de realizar ações mentais.";
            						elseif sheet.chaveCondicao2 == "9" then mod = "Restrained: Impedido e vunerável. Se o que quer que o restrinja estiver preso a um objeto imóvel, o personagem está imóvel ao invés de impedido.";
            						elseif sheet.chaveCondicao2 == "10" then mod = "Deaf: Não pode ouvir, o que concede a tudo e todos camuflagem auditiva total contra ele.";
            						elseif sheet.chaveCondicao2 == "11" then mod = "Surprised: Atordoado e vulnerável.";
            						elseif sheet.chaveCondicao2 == "12" then mod = "Entranced: Atordoado, mas só pode prestar atenção no efeito que o mantém em transe. Um aliado pode libertar o personagem desta condição com um teste de qualquer perícia de interação (CD 10+grad).";
            						elseif sheet.chaveCondicao2 == "13" then mod =  " ";
            					end;
            						sheet.ConsultaCondicao2 = mod;
            					
            				end;
        end, obj);

    obj._e_event67 = obj.dataLink76:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber (sheet.tempoProjetoRapido) ~= nil then
            					sheet.tempoProjeto = (tonumber(sheet.custoInvento) or 0) / (2 ^ (tonumber(sheet.tempoProjetoRapido) or 0));
            					sheet.cdProjeto = (tonumber(sheet.custoInvento) or 0) + 10 + (5 * (tonumber(sheet.tempoProjetoRapido) or 0));
            				else
            					sheet.tempoProjeto = (tonumber(sheet.custoInvento) or 0) ;
            					sheet.cdProjeto = (tonumber(sheet.custoInvento) or 0) + 10 ;
            				end;
            				
            				if tonumber (sheet.tempoProjeto) ~= nil then
            					if tonumber(sheet.tempoProjeto) >= 1 then
            						sheet.tempoShowProjeto = sheet.tempoProjeto .. " ≅ horas";
            					elseif tonumber(sheet.tempoProjeto) >= 0 then
            						if tonumber (sheet.tempoProjetoRapido) ~= nil then
            							if tonumber(sheet.tempoProjetoRapido) >= 6 then
            								sheet.tempoShowProjeto = tonumber(sheet.tempoProjeto * 60 * 60) .. " ≅ seg.";
            							else
            								sheet.tempoShowProjeto = tonumber(sheet.tempoProjeto * 60) .. " ≅ min.";
            							end;
            						end;
            					else
            						sheet.tempoShowProjeto = tonumber(60 / tonumber(sheet.tempoProjeto)) .. " ≅ seg.";
            					end;
            				end;
        end, obj);

    obj._e_event68 = obj.dataLink79:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber (sheet.tempoContruirRapido) ~= nil then
            					sheet.tempoConstruir = ((tonumber(sheet.custoInvento) or 0) * 4) / (2 ^ (tonumber(sheet.tempoContruirRapido) or 0));
            					sheet.cdInventoC = (tonumber(sheet.custoInvento) or 0) + 10 + (5 * (tonumber(sheet.tempoContruirRapido) or 0));
            				else
            					sheet.tempoConstruir = (tonumber(sheet.custoInvento) or 0) * 4 ;
            					sheet.cdInventoC = (tonumber(sheet.custoInvento) or 0) + 10 ;
            				end;
            				if tonumber (sheet.tempoConstruir) ~= nil then
            					if tonumber(sheet.tempoConstruir) >= 1 then
            						sheet.tempoShowConstruir = sheet.tempoConstruir .. " ≅ horas";
            					elseif tonumber(sheet.tempoConstruir) >= 0 then
            						if tonumber (sheet.tempoContruirRapido) ~= nil then
            							if tonumber(sheet.tempoContruirRapido) >= 6 then
            								sheet.tempoShowConstruir = tonumber(sheet.tempoConstruir * 60 * 60) .. " ≅ seg.";
            							else
            								sheet.tempoShowConstruir = tonumber(sheet.tempoConstruir * 60) .. " ≅ min.";
            							end;
            						end;
            					else
            						sheet.tempoShowConstruir = tonumber(60 / tonumber(sheet.tempoConstruir)) .. " ≅ seg.";
            					end;
            				end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
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
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.colorComboBox1 ~= nil then self.colorComboBox1:destroy(); self.colorComboBox1 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.richEnemy ~= nil then self.richEnemy:destroy(); self.richEnemy = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.settingsBT ~= nil then self.settingsBT:destroy(); self.settingsBT = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.frmFichaMM3ePericias_svg ~= nil then self.frmFichaMM3ePericias_svg:destroy(); self.frmFichaMM3ePericias_svg = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.txt ~= nil then self.txt:destroy(); self.txt = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.popCredit ~= nil then self.popCredit:destroy(); self.popCredit = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.colorComboBox2 ~= nil then self.colorComboBox2:destroy(); self.colorComboBox2 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.creditBt ~= nil then self.creditBt:destroy(); self.creditBt = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.popTabelaMed ~= nil then self.popTabelaMed:destroy(); self.popTabelaMed = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.frmFicha_MM3ed_RRPG_image2_svg ~= nil then self.frmFicha_MM3ed_RRPG_image2_svg:destroy(); self.frmFicha_MM3ed_RRPG_image2_svg = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.boxTexto ~= nil then self.boxTexto:destroy(); self.boxTexto = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.frm_FM ~= nil then self.frm_FM:destroy(); self.frm_FM = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.rclAbas ~= nil then self.rclAbas:destroy(); self.rclAbas = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.frmFicha_MM3ed_RRPG_Power ~= nil then self.frmFicha_MM3ed_RRPG_Power:destroy(); self.frmFicha_MM3ed_RRPG_Power = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.frmFicha_MM3ed_RRPG_Consultas ~= nil then self.frmFicha_MM3ed_RRPG_Consultas:destroy(); self.frmFicha_MM3ed_RRPG_Consultas = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.popTabelaTam ~= nil then self.popTabelaTam:destroy(); self.popTabelaTam = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.popupSettings ~= nil then self.popupSettings:destroy(); self.popupSettings = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.frmFicha_MM3e_RRPG1_svg ~= nil then self.frmFicha_MM3e_RRPG1_svg:destroy(); self.frmFicha_MM3e_RRPG1_svg = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
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
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
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
    dataType = "Ficha_MM3e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "M&M3e", 
    description=""};

frmFicha_MM3ed_RRPG_image = _frmFicha_MM3ed_RRPG_image;
Firecast.registrarForm(_frmFicha_MM3ed_RRPG_image);
Firecast.registrarDataType(_frmFicha_MM3ed_RRPG_image);

return _frmFicha_MM3ed_RRPG_image;
