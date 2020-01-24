require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha_MM3e_RRPG1_svg()
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
    obj:setName("frmFicha_MM3e_RRPG1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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

    function obj:_releaseEvents()
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
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha_MM3e_RRPG1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha_MM3e_RRPG1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha_MM3e_RRPG1_svg = {
    newEditor = newfrmFicha_MM3e_RRPG1_svg, 
    new = newfrmFicha_MM3e_RRPG1_svg, 
    name = "frmFicha_MM3e_RRPG1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_MM3e_RRPG1_svg = _frmFicha_MM3e_RRPG1_svg;
Firecast.registrarForm(_frmFicha_MM3e_RRPG1_svg);

return _frmFicha_MM3e_RRPG1_svg;
