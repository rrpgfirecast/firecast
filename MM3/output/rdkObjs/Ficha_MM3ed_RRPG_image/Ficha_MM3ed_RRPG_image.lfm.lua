require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFicha_MM3ed_RRPG_image()
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
    obj:setName("frmFicha_MM3ed_RRPG_image");
    obj:setFormType("sheetTemplate");
    obj:setDataType("MM3e_RRPG_2_7");
    obj:setTitle("MM3e_2_7");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.frmFicha_MM3e_RRPG1_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3e_RRPG1_svg:setParent(obj.tab1);
    obj.frmFicha_MM3e_RRPG1_svg:setName("frmFicha_MM3e_RRPG1_svg");
    obj.frmFicha_MM3e_RRPG1_svg:setAlign("client");
    obj.frmFicha_MM3e_RRPG1_svg:setTheme("light");
    obj.frmFicha_MM3e_RRPG1_svg:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmFicha_MM3e_RRPG1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(43);
    obj.layout1:setTop(105);
    obj.layout1:setWidth(202);
    obj.layout1:setHeight(35);
    obj.layout1:setName("layout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
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

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(44);
    obj.layout2:setTop(285);
    obj.layout2:setWidth(257);
    obj.layout2:setHeight(40);
    obj.layout2:setName("layout2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
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

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(381);
    obj.layout3:setTop(291);
    obj.layout3:setWidth(51);
    obj.layout3:setHeight(53);
    obj.layout3:setName("layout3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
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

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(43);
    obj.layout4:setTop(186);
    obj.layout4:setWidth(202);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
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

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(62);
    obj.layout5:setTop(486);
    obj.layout5:setWidth(52);
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
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

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout5);
    obj.dataLink1:setFields({'FOR'});
    obj.dataLink1:setDefaultValues({'0'});
    obj.dataLink1:setName("dataLink1");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(63);
    obj.layout6:setTop(557);
    obj.layout6:setWidth(52);
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(20.3);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(52);
    obj.edit6:setHeight(31);
    obj.edit6:setField("VIG");
    obj.edit6:setName("edit6");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout6);
    obj.dataLink2:setFields({'VIG'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(162);
    obj.layout7:setTop(557);
    obj.layout7:setWidth(52);
    obj.layout7:setHeight(30);
    obj.layout7:setName("layout7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(20.3);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(52);
    obj.edit7:setHeight(31);
    obj.edit7:setField("DES");
    obj.edit7:setName("edit7");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout7);
    obj.dataLink3:setFields({'DES'});
    obj.dataLink3:setDefaultValues({'0'});
    obj.dataLink3:setName("dataLink3");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(262);
    obj.layout8:setTop(557);
    obj.layout8:setWidth(52);
    obj.layout8:setHeight(30);
    obj.layout8:setName("layout8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20.3);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(52);
    obj.edit8:setHeight(31);
    obj.edit8:setField("INT");
    obj.edit8:setName("edit8");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout8);
    obj.dataLink4:setFields({'INT'});
    obj.dataLink4:setDefaultValues({'0'});
    obj.dataLink4:setName("dataLink4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(364);
    obj.layout9:setTop(557);
    obj.layout9:setWidth(52);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(20.3);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(52);
    obj.edit9:setHeight(31);
    obj.edit9:setField("PRE");
    obj.edit9:setName("edit9");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout9);
    obj.dataLink5:setFields({'PRE'});
    obj.dataLink5:setDefaultValues({'0'});
    obj.dataLink5:setName("dataLink5");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(364);
    obj.layout10:setTop(486);
    obj.layout10:setWidth(52);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(20.3);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(52);
    obj.edit10:setHeight(31);
    obj.edit10:setField("PRO");
    obj.edit10:setName("edit10");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setFields({'PRO'});
    obj.dataLink6:setDefaultValues({'0'});
    obj.dataLink6:setName("dataLink6");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(263);
    obj.layout11:setTop(486);
    obj.layout11:setWidth(52);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(20.3);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(52);
    obj.edit11:setHeight(31);
    obj.edit11:setField("LUT");
    obj.edit11:setName("edit11");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout11);
    obj.dataLink7:setFields({'LUT'});
    obj.dataLink7:setDefaultValues({'0'});
    obj.dataLink7:setName("dataLink7");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(162);
    obj.layout12:setTop(486);
    obj.layout12:setWidth(52);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(20.3);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(52);
    obj.edit12:setHeight(31);
    obj.edit12:setField("AGI");
    obj.edit12:setName("edit12");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout12);
    obj.dataLink8:setFields({'AGI'});
    obj.dataLink8:setDefaultValues({'0'});
    obj.dataLink8:setName("dataLink8");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(377);
    obj.layout13:setTop(360);
    obj.layout13:setWidth(61);
    obj.layout13:setHeight(33);
    obj.layout13:setName("layout13");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(22.6);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(61);
    obj.edit13:setHeight(34);
    obj.edit13:setField("PONTOSDEPODER");
    obj.edit13:setName("edit13");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(377);
    obj.layout14:setTop(405);
    obj.layout14:setWidth(61);
    obj.layout14:setHeight(33);
    obj.layout14:setName("layout14");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(22.6);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(61);
    obj.edit14:setHeight(34);
    obj.edit14:setField("PONTOSHEROICOS");
    obj.edit14:setName("edit14");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(43);
    obj.layout15:setTop(630);
    obj.layout15:setWidth(391);
    obj.layout15:setHeight(262);
    obj.layout15:setName("layout15");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
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

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(43);
    obj.layout16:setTop(933);
    obj.layout16:setWidth(391);
    obj.layout16:setHeight(302);
    obj.layout16:setName("layout16");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
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

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(459);
    obj.layout17:setTop(360);
    obj.layout17:setWidth(391);
    obj.layout17:setHeight(824);
    obj.layout17:setName("layout17");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout17);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(391);
    obj.textEditor3:setHeight(797);
    obj.textEditor3:setFontSize(16.5);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("PODERES");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(688);
    obj.layout18:setTop(171);
    obj.layout18:setWidth(28);
    obj.layout18:setHeight(16);
    obj.layout18:setName("layout18");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout18);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(12);
    obj.edit15:setFontColor("#000000");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(28);
    obj.edit15:setHeight(19);
    obj.edit15:setField("Iniciativa");
    obj.edit15:setName("edit15");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(568);
    obj.layout19:setTop(78);
    obj.layout19:setWidth(24);
    obj.layout19:setHeight(15);
    obj.layout19:setName("layout19");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout19);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(9);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(24);
    obj.edit16:setHeight(16);
    obj.edit16:setField("DEFesq2");
    obj.edit16:setName("edit16");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(541);
    obj.layout20:setTop(78);
    obj.layout20:setWidth(24);
    obj.layout20:setHeight(15);
    obj.layout20:setName("layout20");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout20);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(9);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(24);
    obj.edit17:setHeight(16);
    obj.edit17:setField("DEFesq1");
    obj.edit17:setName("edit17");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(541);
    obj.layout21:setTop(99);
    obj.layout21:setWidth(24);
    obj.layout21:setHeight(15);
    obj.layout21:setName("layout21");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout21);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(9);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(24);
    obj.edit18:setHeight(16);
    obj.edit18:setField("DEFapa1");
    obj.edit18:setName("edit18");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(568);
    obj.layout22:setTop(99);
    obj.layout22:setWidth(24);
    obj.layout22:setHeight(15);
    obj.layout22:setName("layout22");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout22);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(9);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(24);
    obj.edit19:setHeight(16);
    obj.edit19:setField("DEFapa2");
    obj.edit19:setName("edit19");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(568);
    obj.layout23:setTop(120);
    obj.layout23:setWidth(24);
    obj.layout23:setHeight(15);
    obj.layout23:setName("layout23");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout23);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(9);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(24);
    obj.edit20:setHeight(16);
    obj.edit20:setField("DEFvon2");
    obj.edit20:setName("edit20");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(541);
    obj.layout24:setTop(120);
    obj.layout24:setWidth(24);
    obj.layout24:setHeight(15);
    obj.layout24:setName("layout24");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout24);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(9);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(24);
    obj.edit21:setHeight(16);
    obj.edit21:setField("DEFvon1");
    obj.edit21:setName("edit21");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(750);
    obj.layout25:setTop(99);
    obj.layout25:setWidth(24);
    obj.layout25:setHeight(15);
    obj.layout25:setName("layout25");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout25);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(9);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(24);
    obj.edit22:setHeight(16);
    obj.edit22:setField("DEFres1");
    obj.edit22:setName("edit22");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(750);
    obj.layout26:setTop(78);
    obj.layout26:setWidth(24);
    obj.layout26:setHeight(15);
    obj.layout26:setName("layout26");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout26);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(9);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(24);
    obj.edit23:setHeight(16);
    obj.edit23:setField("DEFforti1");
    obj.edit23:setName("edit23");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(777);
    obj.layout27:setTop(78);
    obj.layout27:setWidth(24);
    obj.layout27:setHeight(15);
    obj.layout27:setName("layout27");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout27);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(9);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(24);
    obj.edit24:setHeight(16);
    obj.edit24:setField("DEFforti2");
    obj.edit24:setName("edit24");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(804);
    obj.layout28:setTop(78);
    obj.layout28:setWidth(24);
    obj.layout28:setHeight(15);
    obj.layout28:setName("layout28");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout28);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(9);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(24);
    obj.edit25:setHeight(16);
    obj.edit25:setField("DEFforti3");
    obj.edit25:setName("edit25");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(831);
    obj.layout29:setTop(78);
    obj.layout29:setWidth(24);
    obj.layout29:setHeight(15);
    obj.layout29:setName("layout29");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout29);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(9);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(24);
    obj.edit26:setHeight(16);
    obj.edit26:setField("DEFfortiTotal");
    obj.edit26:setName("edit26");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(650);
    obj.layout30:setTop(117);
    obj.layout30:setWidth(98);
    obj.layout30:setHeight(24);
    obj.layout30:setName("layout30");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout30);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(14);
    obj.edit27:setFontColor("#000000");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(182);
    obj.edit27:setHeight(24);
    obj.edit27:setField("DEFextraName");
    obj.edit27:setName("edit27");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(540);
    obj.layout31:setTop(1196);
    obj.layout31:setWidth(19);
    obj.layout31:setHeight(18);
    obj.layout31:setName("layout31");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout31);
    obj.label1:setFontSize(10);
    obj.label1:setFontColor("#000000");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(24);
    obj.label1:setHeight(15);
    obj.label1:setField("PPhabilidades");
    obj.label1:setName("label1");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(618);
    obj.layout32:setTop(1196);
    obj.layout32:setWidth(21);
    obj.layout32:setHeight(18);
    obj.layout32:setName("layout32");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout32);
    obj.label2:setFontSize(10);
    obj.label2:setFontColor("#000000");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(24);
    obj.label2:setHeight(15);
    obj.label2:setField("PPpericias");
    obj.label2:setName("label2");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(641);
    obj.layout33:setTop(1197);
    obj.layout33:setWidth(19);
    obj.layout33:setHeight(14);
    obj.layout33:setName("layout33");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout33);
    obj.label3:setFontSize(9);
    obj.label3:setFontColor("#000000");
    obj.label3:setVertTextAlign("center");
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(19);
    obj.label3:setHeight(15);
    obj.label3:setField("PPpericiasgrad");
    obj.label3:setName("label3");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(811);
    obj.layout34:setTop(1194);
    obj.layout34:setWidth(21);
    obj.layout34:setHeight(18);
    obj.layout34:setName("layout34");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout34);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(10);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(24);
    obj.edit28:setHeight(18);
    obj.edit28:setField("PPvantagens");
    obj.edit28:setName("edit28");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(512);
    obj.layout35:setTop(1212);
    obj.layout35:setWidth(21);
    obj.layout35:setHeight(14);
    obj.layout35:setName("layout35");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout35);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(10);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(24);
    obj.edit29:setHeight(18);
    obj.edit29:setField("PPdefesas");
    obj.edit29:setName("edit29");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(593);
    obj.layout36:setTop(1212);
    obj.layout36:setWidth(24);
    obj.layout36:setHeight(18);
    obj.layout36:setName("layout36");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout36);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(10);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(24);
    obj.edit30:setHeight(18);
    obj.edit30:setField("PPpoderes");
    obj.edit30:setName("edit30");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(630);
    obj.layout37:setTop(1214);
    obj.layout37:setWidth(140);
    obj.layout37:setHeight(18);
    obj.layout37:setName("layout37");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout37);
    obj.label4:setFontSize(12);
    obj.label4:setFontColor("#000000");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setVertTextAlign("center");
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(140);
    obj.label4:setHeight(18);
    obj.label4:setField("PPsomatotal");
    obj.label4:setName("label4");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setTop(215);
    obj.layout38:setLeft(458);
    obj.layout38:setWidth(188);
    obj.layout38:setHeight(18);
    obj.layout38:setName("layout38");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout38);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(12);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(188);
    obj.edit31:setHeight(19);
    obj.edit31:setField("ATK1");
    obj.edit31:setName("edit31");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setTop(215);
    obj.layout39:setLeft(651);
    obj.layout39:setWidth(25);
    obj.layout39:setHeight(18);
    obj.layout39:setName("layout39");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout39);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(12);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(27);
    obj.edit32:setHeight(19);
    obj.edit32:setField("ATK1mod");
    obj.edit32:setName("edit32");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout39);
    obj.dataLink9:setFields({'ATK1mod'});
    obj.dataLink9:setDefaultValues({'0'});
    obj.dataLink9:setName("dataLink9");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setTop(215);
    obj.layout40:setLeft(681);
    obj.layout40:setWidth(25);
    obj.layout40:setHeight(18);
    obj.layout40:setName("layout40");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout40);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(12);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(27);
    obj.edit33:setHeight(19);
    obj.edit33:setField("ATK1dano");
    obj.edit33:setName("edit33");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout40);
    obj.dataLink10:setFields({'ATK1dano'});
    obj.dataLink10:setDefaultValues({'0'});
    obj.dataLink10:setName("dataLink10");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setTop(215);
    obj.layout41:setLeft(710);
    obj.layout41:setWidth(95);
    obj.layout41:setHeight(18);
    obj.layout41:setName("layout41");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout41);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(12);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(95);
    obj.edit34:setHeight(19);
    obj.edit34:setField("ATK1tipo");
    obj.edit34:setName("edit34");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout41);
    obj.dataLink11:setFields({'ATK1tipo'});
    obj.dataLink11:setDefaultValues({'-'});
    obj.dataLink11:setName("dataLink11");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setTop(214);
    obj.layout42:setLeft(807);
    obj.layout42:setName("layout42");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout42);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setField("ATK1TesteCD");
    obj.comboBox1:setWidth(18);
    obj.comboBox1:setHeight(19);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'-', 'D', 'E'});
    obj.comboBox1:setValues({'0', '+10', '+15'});
    obj.comboBox1:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout42);
    obj.dataLink12:setFields({'ATK1TesteCD'});
    obj.dataLink12:setDefaultValues({'+15'});
    obj.dataLink12:setName("dataLink12");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setTop(238);
    obj.layout43:setLeft(651);
    obj.layout43:setWidth(25);
    obj.layout43:setHeight(18);
    obj.layout43:setName("layout43");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout43);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(12);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(27);
    obj.edit35:setHeight(19);
    obj.edit35:setField("ATK2mod");
    obj.edit35:setName("edit35");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout43);
    obj.dataLink13:setFields({'ATK2mod'});
    obj.dataLink13:setDefaultValues({'0'});
    obj.dataLink13:setName("dataLink13");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setTop(238);
    obj.layout44:setLeft(681);
    obj.layout44:setWidth(25);
    obj.layout44:setHeight(18);
    obj.layout44:setName("layout44");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout44);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(12);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(27);
    obj.edit36:setHeight(19);
    obj.edit36:setField("ATK2dano");
    obj.edit36:setName("edit36");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout44);
    obj.dataLink14:setFields({'ATK2dano'});
    obj.dataLink14:setDefaultValues({'0'});
    obj.dataLink14:setName("dataLink14");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setTop(238);
    obj.layout45:setLeft(710);
    obj.layout45:setWidth(102);
    obj.layout45:setHeight(18);
    obj.layout45:setName("layout45");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout45);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(12);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(102);
    obj.edit37:setHeight(19);
    obj.edit37:setField("ATK2tipo");
    obj.edit37:setName("edit37");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout45);
    obj.dataLink15:setFields({'ATK2tipo'});
    obj.dataLink15:setDefaultValues({'-'});
    obj.dataLink15:setName("dataLink15");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setTop(236);
    obj.layout46:setLeft(807);
    obj.layout46:setName("layout46");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout46);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setField("ATK2TesteCD");
    obj.comboBox2:setWidth(18);
    obj.comboBox2:setHeight(19);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'-', 'D', 'E'});
    obj.comboBox2:setValues({'0', '+10', '+15'});
    obj.comboBox2:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox2:setName("comboBox2");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout46);
    obj.dataLink16:setFields({'ATK2TesteCD'});
    obj.dataLink16:setDefaultValues({'+15'});
    obj.dataLink16:setName("dataLink16");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setTop(259);
    obj.layout47:setLeft(651);
    obj.layout47:setWidth(25);
    obj.layout47:setHeight(18);
    obj.layout47:setName("layout47");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout47);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(12);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(27);
    obj.edit38:setHeight(19);
    obj.edit38:setField("ATK3mod");
    obj.edit38:setName("edit38");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout47);
    obj.dataLink17:setFields({'ATK3mod'});
    obj.dataLink17:setDefaultValues({'0'});
    obj.dataLink17:setName("dataLink17");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setTop(259);
    obj.layout48:setLeft(681);
    obj.layout48:setWidth(25);
    obj.layout48:setHeight(18);
    obj.layout48:setName("layout48");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout48);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(12);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(27);
    obj.edit39:setHeight(19);
    obj.edit39:setField("ATK3dano");
    obj.edit39:setName("edit39");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout48);
    obj.dataLink18:setFields({'ATK3dano'});
    obj.dataLink18:setDefaultValues({'0'});
    obj.dataLink18:setName("dataLink18");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setTop(259);
    obj.layout49:setLeft(710);
    obj.layout49:setWidth(102);
    obj.layout49:setHeight(18);
    obj.layout49:setName("layout49");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout49);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(12);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(102);
    obj.edit40:setHeight(19);
    obj.edit40:setField("ATK3tipo");
    obj.edit40:setName("edit40");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout49);
    obj.dataLink19:setFields({'ATK3tipo'});
    obj.dataLink19:setDefaultValues({'-'});
    obj.dataLink19:setName("dataLink19");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setTop(258);
    obj.layout50:setLeft(807);
    obj.layout50:setName("layout50");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout50);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setField("ATK3TesteCD");
    obj.comboBox3:setWidth(18);
    obj.comboBox3:setHeight(19);
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'-', 'D', 'E'});
    obj.comboBox3:setValues({'0', '+10', '+15'});
    obj.comboBox3:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox3:setName("comboBox3");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout50);
    obj.dataLink20:setFields({'ATK3TesteCD'});
    obj.dataLink20:setDefaultValues({'+15'});
    obj.dataLink20:setName("dataLink20");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setTop(280);
    obj.layout51:setLeft(651);
    obj.layout51:setWidth(25);
    obj.layout51:setHeight(18);
    obj.layout51:setName("layout51");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout51);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(12);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(27);
    obj.edit41:setHeight(19);
    obj.edit41:setField("ATK4mod");
    obj.edit41:setName("edit41");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout51);
    obj.dataLink21:setFields({'ATK4mod'});
    obj.dataLink21:setDefaultValues({'0'});
    obj.dataLink21:setName("dataLink21");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setTop(280);
    obj.layout52:setLeft(681);
    obj.layout52:setWidth(25);
    obj.layout52:setHeight(18);
    obj.layout52:setName("layout52");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout52);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(12);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(27);
    obj.edit42:setHeight(19);
    obj.edit42:setField("ATK4dano");
    obj.edit42:setName("edit42");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout52);
    obj.dataLink22:setFields({'ATK4dano'});
    obj.dataLink22:setDefaultValues({'0'});
    obj.dataLink22:setName("dataLink22");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setTop(280);
    obj.layout53:setLeft(710);
    obj.layout53:setWidth(102);
    obj.layout53:setHeight(18);
    obj.layout53:setName("layout53");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout53);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(12);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(102);
    obj.edit43:setHeight(19);
    obj.edit43:setField("ATK4tipo");
    obj.edit43:setName("edit43");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout53);
    obj.dataLink23:setFields({'ATK4tipo'});
    obj.dataLink23:setDefaultValues({'-'});
    obj.dataLink23:setName("dataLink23");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setTop(279);
    obj.layout54:setLeft(807);
    obj.layout54:setName("layout54");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout54);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setField("ATK4TesteCD");
    obj.comboBox4:setWidth(19);
    obj.comboBox4:setHeight(18);
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'-', 'D', 'E'});
    obj.comboBox4:setValues({'0', '+10', '+15'});
    obj.comboBox4:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout54);
    obj.dataLink24:setFields({'ATK4TesteCD'});
    obj.dataLink24:setDefaultValues({'+15'});
    obj.dataLink24:setName("dataLink24");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setTop(302);
    obj.layout55:setLeft(651);
    obj.layout55:setWidth(25);
    obj.layout55:setHeight(18);
    obj.layout55:setName("layout55");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout55);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(12);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(27);
    obj.edit44:setHeight(19);
    obj.edit44:setField("ATK5mod");
    obj.edit44:setName("edit44");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout55);
    obj.dataLink25:setFields({'ATK5mod'});
    obj.dataLink25:setDefaultValues({'0'});
    obj.dataLink25:setName("dataLink25");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setTop(302);
    obj.layout56:setLeft(681);
    obj.layout56:setWidth(25);
    obj.layout56:setHeight(18);
    obj.layout56:setName("layout56");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout56);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(12);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(27);
    obj.edit45:setHeight(19);
    obj.edit45:setField("ATK5dano");
    obj.edit45:setName("edit45");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout56);
    obj.dataLink26:setFields({'ATK5dano'});
    obj.dataLink26:setDefaultValues({'0'});
    obj.dataLink26:setName("dataLink26");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setTop(302);
    obj.layout57:setLeft(710);
    obj.layout57:setWidth(102);
    obj.layout57:setHeight(18);
    obj.layout57:setName("layout57");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout57);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(12);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(102);
    obj.edit46:setHeight(19);
    obj.edit46:setField("ATK5tipo");
    obj.edit46:setName("edit46");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout57);
    obj.dataLink27:setFields({'ATK5tipo'});
    obj.dataLink27:setDefaultValues({'-'});
    obj.dataLink27:setName("dataLink27");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setTop(301);
    obj.layout58:setLeft(807);
    obj.layout58:setName("layout58");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout58);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setField("ATK5TesteCD");
    obj.comboBox5:setWidth(18);
    obj.comboBox5:setHeight(19);
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'-', 'D', 'E'});
    obj.comboBox5:setValues({'0', '+10', '+15'});
    obj.comboBox5:setHint("Escolha entre Nulo 'D'ano ou 'E'feitos como Aflição ou similares");
    obj.comboBox5:setName("comboBox5");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout58);
    obj.dataLink28:setFields({'ATK5TesteCD'});
    obj.dataLink28:setDefaultValues({'+15'});
    obj.dataLink28:setName("dataLink28");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(52);
    obj.layout59:setTop(373);
    obj.layout59:setWidth(52);
    obj.layout59:setHeight(30);
    obj.layout59:setName("layout59");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout59);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(20.3);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(52);
    obj.edit47:setHeight(31);
    obj.edit47:setField("IDADE");
    obj.edit47:setName("edit47");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setTop(238);
    obj.layout60:setLeft(458);
    obj.layout60:setWidth(188);
    obj.layout60:setHeight(18);
    obj.layout60:setName("layout60");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout60);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(12);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(188);
    obj.edit48:setHeight(19);
    obj.edit48:setField("ATK2");
    obj.edit48:setName("edit48");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(125);
    obj.layout61:setTop(373);
    obj.layout61:setWidth(68);
    obj.layout61:setHeight(30);
    obj.layout61:setName("layout61");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout61);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(20.3);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(68);
    obj.edit49:setHeight(31);
    obj.edit49:setField("ALTURA");
    obj.edit49:setName("edit49");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setTop(259);
    obj.layout62:setLeft(458);
    obj.layout62:setWidth(188);
    obj.layout62:setHeight(18);
    obj.layout62:setName("layout62");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout62);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(12);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(188);
    obj.edit50:setHeight(19);
    obj.edit50:setField("ATK3");
    obj.edit50:setName("edit50");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(207);
    obj.layout63:setTop(373);
    obj.layout63:setWidth(68);
    obj.layout63:setHeight(30);
    obj.layout63:setName("layout63");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout63);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(20.3);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(68);
    obj.edit51:setHeight(31);
    obj.edit51:setField("PESO");
    obj.edit51:setName("edit51");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setTop(280);
    obj.layout64:setLeft(458);
    obj.layout64:setWidth(188);
    obj.layout64:setHeight(18);
    obj.layout64:setName("layout64");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout64);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(12);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(188);
    obj.edit52:setHeight(19);
    obj.edit52:setField("ATK4");
    obj.edit52:setName("edit52");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(117);
    obj.layout65:setTop(216);
    obj.layout65:setWidth(202);
    obj.layout65:setHeight(35);
    obj.layout65:setName("layout65");

    obj.imageCheckBox1 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout65);
    obj.imageCheckBox1:setField("CheckIDENTIDADE");
    obj.imageCheckBox1:setImageChecked("/Ficha_MM3ed_RRPG_image/images/PUBLICA.png");
    obj.imageCheckBox1:setImageUnchecked("/Ficha_MM3ed_RRPG_image/images/SECRETA.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(43);
    obj.layout66:setTop(243);
    obj.layout66:setWidth(202);
    obj.layout66:setHeight(35);
    obj.layout66:setName("layout66");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout66);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(10);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(202);
    obj.edit53:setHeight(36);
    obj.edit53:setField("ALIAS");
    obj.edit53:setHint("Notas sobre a Identidade. ");
    obj.edit53:setName("edit53");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setTop(302);
    obj.layout67:setLeft(458);
    obj.layout67:setWidth(188);
    obj.layout67:setHeight(18);
    obj.layout67:setName("layout67");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout67);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(12);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(188);
    obj.edit54:setHeight(19);
    obj.edit54:setField("ATK5");
    obj.edit54:setName("edit54");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(257);
    obj.layout68:setTop(28);
    obj.layout68:setWidth(180);
    obj.layout68:setHeight(242);
    obj.layout68:setName("layout68");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout68);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(12);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(180);
    obj.edit55:setHeight(243);
    obj.edit55:setField("untitled52");
    obj.edit55:setName("edit55");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(595);
    obj.layout69:setTop(78);
    obj.layout69:setWidth(24);
    obj.layout69:setHeight(15);
    obj.layout69:setName("layout69");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout69);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(9);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(24);
    obj.edit56:setHeight(16);
    obj.edit56:setField("DEFesq3");
    obj.edit56:setName("edit56");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(621);
    obj.layout70:setTop(78);
    obj.layout70:setWidth(24);
    obj.layout70:setHeight(15);
    obj.layout70:setName("layout70");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout70);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(9);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(24);
    obj.edit57:setHeight(16);
    obj.edit57:setField("DEFesqTotal");
    obj.edit57:setName("edit57");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(595);
    obj.layout71:setTop(99);
    obj.layout71:setWidth(24);
    obj.layout71:setHeight(15);
    obj.layout71:setName("layout71");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout71);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(9);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(24);
    obj.edit58:setHeight(16);
    obj.edit58:setField("DEFapa3");
    obj.edit58:setName("edit58");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(621);
    obj.layout72:setTop(99);
    obj.layout72:setWidth(24);
    obj.layout72:setHeight(15);
    obj.layout72:setName("layout72");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout72);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(9);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(24);
    obj.edit59:setHeight(16);
    obj.edit59:setField("DEFapaTotal");
    obj.edit59:setName("edit59");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(595);
    obj.layout73:setTop(120);
    obj.layout73:setWidth(24);
    obj.layout73:setHeight(15);
    obj.layout73:setName("layout73");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout73);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(9);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(24);
    obj.edit60:setHeight(16);
    obj.edit60:setField("DEFvon3");
    obj.edit60:setName("edit60");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(621);
    obj.layout74:setTop(120);
    obj.layout74:setWidth(24);
    obj.layout74:setHeight(15);
    obj.layout74:setName("layout74");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout74);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(9);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(24);
    obj.edit61:setHeight(16);
    obj.edit61:setField("DEFvonTotal");
    obj.edit61:setName("edit61");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(777);
    obj.layout75:setTop(99);
    obj.layout75:setWidth(24);
    obj.layout75:setHeight(15);
    obj.layout75:setName("layout75");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout75);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(9);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(24);
    obj.edit62:setHeight(16);
    obj.edit62:setField("DEFres2");
    obj.edit62:setName("edit62");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(804);
    obj.layout76:setTop(99);
    obj.layout76:setWidth(24);
    obj.layout76:setHeight(15);
    obj.layout76:setName("layout76");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout76);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(9);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(24);
    obj.edit63:setHeight(16);
    obj.edit63:setField("DEFres3");
    obj.edit63:setName("edit63");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(831);
    obj.layout77:setTop(99);
    obj.layout77:setWidth(24);
    obj.layout77:setHeight(15);
    obj.layout77:setName("layout77");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout77);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(9);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(24);
    obj.edit64:setHeight(16);
    obj.edit64:setField("DEFresTotal");
    obj.edit64:setName("edit64");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(750);
    obj.layout78:setTop(120);
    obj.layout78:setWidth(24);
    obj.layout78:setHeight(15);
    obj.layout78:setName("layout78");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout78);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(9);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(24);
    obj.edit65:setHeight(16);
    obj.edit65:setField("DEFextra1");
    obj.edit65:setName("edit65");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(777);
    obj.layout79:setTop(120);
    obj.layout79:setWidth(24);
    obj.layout79:setHeight(15);
    obj.layout79:setName("layout79");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout79);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(9);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(24);
    obj.edit66:setHeight(16);
    obj.edit66:setField("DEFextra2");
    obj.edit66:setName("edit66");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(804);
    obj.layout80:setTop(120);
    obj.layout80:setWidth(24);
    obj.layout80:setHeight(15);
    obj.layout80:setName("layout80");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout80);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(9);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(24);
    obj.edit67:setHeight(16);
    obj.edit67:setField("DEFextra3");
    obj.edit67:setName("edit67");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(831);
    obj.layout81:setTop(120);
    obj.layout81:setWidth(24);
    obj.layout81:setHeight(15);
    obj.layout81:setName("layout81");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout81);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(9);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(24);
    obj.edit68:setHeight(16);
    obj.edit68:setField("DEFextraTotal");
    obj.edit68:setName("edit68");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(254);
    obj.rectangle2:setTop(26);
    obj.rectangle2:setWidth(184);
    obj.rectangle2:setHeight(245);
    obj.rectangle2:setColor("#6cb098");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(255);
    obj.image2:setTop(27);
    obj.image2:setWidth(182);
    obj.image2:setHeight(243);
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle1);
    obj.dataLink29:setFields({'AGI', 'LUT', 'PRO', 'VIG'});
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle1);
    obj.dataLink30:setFields({'DEFesq1', 'DEFesq2', 'DEFesq3'});
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle1);
    obj.dataLink31:setFields({'DEFapa1', 'DEFapa2', 'DEFapa3'});
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle1);
    obj.dataLink32:setFields({'DEFvon1', 'DEFvon2', 'DEFvon3'});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle1);
    obj.dataLink33:setFields({'DEFforti1', 'DEFforti2', 'DEFforti3'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle1);
    obj.dataLink34:setFields({'DEFres1', 'DEFres2', 'DEFres3'});
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle1);
    obj.dataLink35:setFields({'DEFextra1', 'DEFextra2', 'DEFextra3'});
    obj.dataLink35:setName("dataLink35");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(454);
    obj.button1:setTop(74);
    obj.button1:setWidth(85);
    obj.button1:setHeight(22);
    obj.button1:setText("ESQUIVAR");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(454);
    obj.button2:setTop(96);
    obj.button2:setWidth(85);
    obj.button2:setHeight(22);
    obj.button2:setText("APARAR");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(454);
    obj.button3:setTop(118);
    obj.button3:setWidth(85);
    obj.button3:setHeight(22);
    obj.button3:setText("VONTADE");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(651);
    obj.button4:setTop(74);
    obj.button4:setWidth(98);
    obj.button4:setHeight(22);
    obj.button4:setText("FORTITUDE");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(651);
    obj.button5:setTop(96);
    obj.button5:setWidth(98);
    obj.button5:setHeight(22);
    obj.button5:setText("RESISTENCIA");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(590);
    obj.button6:setTop(171);
    obj.button6:setWidth(89);
    obj.button6:setHeight(21);
    obj.button6:setText("INICIATIVA");
    obj.button6:setName("button6");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle1);
    obj.dataLink36:setFields({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE'});
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle1);
    obj.dataLink37:setField("PPpericias");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle1);
    obj.dataLink38:setField("pontosPericia");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle1);
    obj.dataLink39:setFields({'PPhabilidades', 'PPpericias', 'PPvantagens', 'PPdefesas', 'PPpoderes'});
    obj.dataLink39:setName("dataLink39");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setTop(214);
    obj.button7:setLeft(834);
    obj.button7:setWidth(22);
    obj.button7:setHeight(20);
    obj.button7:setName("button7");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button7);
    obj.image3:setLeft(1);
    obj.image3:setWidth(20);
    obj.image3:setHeight(21);
    obj.image3:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image3:setName("image3");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setTop(236);
    obj.button8:setLeft(834);
    obj.button8:setWidth(22);
    obj.button8:setHeight(20);
    obj.button8:setName("button8");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button8);
    obj.image4:setLeft(1);
    obj.image4:setWidth(20);
    obj.image4:setHeight(21);
    obj.image4:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image4:setName("image4");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setTop(258);
    obj.button9:setLeft(834);
    obj.button9:setWidth(22);
    obj.button9:setHeight(20);
    obj.button9:setName("button9");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button9);
    obj.image5:setLeft(1);
    obj.image5:setWidth(20);
    obj.image5:setHeight(21);
    obj.image5:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image5:setName("image5");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setTop(279);
    obj.button10:setLeft(834);
    obj.button10:setWidth(22);
    obj.button10:setHeight(20);
    obj.button10:setName("button10");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button10);
    obj.image6:setLeft(1);
    obj.image6:setWidth(20);
    obj.image6:setHeight(21);
    obj.image6:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image6:setName("image6");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setTop(301);
    obj.button11:setLeft(834);
    obj.button11:setWidth(22);
    obj.button11:setHeight(20);
    obj.button11:setName("button11");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button11);
    obj.image7:setLeft(1);
    obj.image7:setWidth(20);
    obj.image7:setHeight(21);
    obj.image7:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image7:setName("image7");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Verso");
    obj.tab2:setName("tab2");

    obj.frmFicha_MM3ed_RRPG_image2_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3ed_RRPG_image2_svg:setParent(obj.tab2);
    obj.frmFicha_MM3ed_RRPG_image2_svg:setName("frmFicha_MM3ed_RRPG_image2_svg");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setAlign("client");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setTheme("light");
    obj.frmFicha_MM3ed_RRPG_image2_svg:setMargins({top=1});

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmFicha_MM3ed_RRPG_image2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox2);
    obj.rectangle3:setWidth(893);
    obj.rectangle3:setHeight(1263);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.rectangle3);
    obj.image8:setLeft(0);
    obj.image8:setTop(0);
    obj.image8:setWidth(893);
    obj.image8:setHeight(1263);
    obj.image8:setSRC("/Ficha_MM3ed_RRPG_image/images/2.png");
    obj.image8:setStyle("stretch");
    obj.image8:setOptimize(true);
    obj.image8:setName("image8");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle3);
    obj.layout82:setLeft(43);
    obj.layout82:setTop(64);
    obj.layout82:setWidth(397);
    obj.layout82:setHeight(590);
    obj.layout82:setName("layout82");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout82);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(397);
    obj.textEditor4:setHeight(590);
    obj.textEditor4:setFontSize(16.5);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Historia");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle3);
    obj.layout83:setLeft(452);
    obj.layout83:setTop(933);
    obj.layout83:setWidth(397);
    obj.layout83:setHeight(305);
    obj.layout83:setName("layout83");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout83);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(397);
    obj.textEditor5:setHeight(305);
    obj.textEditor5:setFontSize(16.5);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Inimigos");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle3);
    obj.layout84:setLeft(43);
    obj.layout84:setTop(710);
    obj.layout84:setWidth(397);
    obj.layout84:setHeight(528);
    obj.layout84:setName("layout84");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout84);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(397);
    obj.textEditor6:setHeight(528);
    obj.textEditor6:setFontSize(16.5);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("Anotacoes");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle3);
    obj.layout85:setLeft(452);
    obj.layout85:setTop(620);
    obj.layout85:setWidth(397);
    obj.layout85:setHeight(256);
    obj.layout85:setName("layout85");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout85);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(398);
    obj.textEditor7:setHeight(256);
    obj.textEditor7:setFontSize(16.5);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("QGeneral");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle3);
    obj.layout86:setLeft(452);
    obj.layout86:setTop(287);
    obj.layout86:setWidth(397);
    obj.layout86:setHeight(276);
    obj.layout86:setName("layout86");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout86);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(398);
    obj.textEditor8:setHeight(276);
    obj.textEditor8:setFontSize(16.5);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("Complicacoes");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setLeft(450);
    obj.rectangle4:setTop(22);
    obj.rectangle4:setWidth(402);
    obj.rectangle4:setHeight(214);
    obj.rectangle4:setColor("#6cb098");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.rectangle3);
    obj.image9:setLeft(452);
    obj.image9:setTop(23);
    obj.image9:setWidth(399);
    obj.image9:setHeight(211);
    obj.image9:setField("sobmanto");
    obj.image9:setEditable(true);
    obj.image9:setStyle("proportional");
    obj.image9:setName("image9");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setLeft(600);
    obj.label5:setTop(1240);
    obj.label5:setWidth(33);
    obj.label5:setHeight(20);
    obj.label5:setText("GILGANTE E JANUS - VERSAO DA FICHA: 2.7");
    obj.label5:setName("label5");
    obj.label5:setFontColor("black");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Pericias");
    obj.tab3:setName("tab3");

    obj.frmFichaRPGmeister3_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister3_svg:setParent(obj.tab3);
    obj.frmFichaRPGmeister3_svg:setName("frmFichaRPGmeister3_svg");
    obj.frmFichaRPGmeister3_svg:setAlign("client");
    obj.frmFichaRPGmeister3_svg:setTheme("light");
    obj.frmFichaRPGmeister3_svg:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
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
		


    obj.popPericia = gui.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox3);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(85);
    obj.popPericia:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popPericia);
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

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart1);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Penalidades");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart1);
    obj.edit69:setAlign("client");
    obj.edit69:setField("penalidesPericia");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart2);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Poder/Equipamentos");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart2);
    obj.edit70:setAlign("client");
    obj.edit70:setField("equipamentosPericia");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart3);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Condicional");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart3);
    obj.edit71:setAlign("client");
    obj.edit71:setField("condicionalPericia");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.popPericia);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setText("Exige Treino");
    obj.checkBox1:setField("exigeTreino");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.popPericia);
    obj.checkBox2:setAlign("right");
    obj.checkBox2:setText("Exige Ferramentas");
    obj.checkBox2:setField("exigeFerramentas");
    obj.checkBox2:setName("checkBox2");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.scrollBox3);
    obj.layout87:setLeft(0);
    obj.layout87:setTop(45);
    obj.layout87:setWidth(893);
    obj.layout87:setHeight(685);
    obj.layout87:setName("layout87");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout87);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#50a48d");
    obj.rectangle5:setName("rectangle5");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle5);
    obj.image10:setLeft(0);
    obj.image10:setTop(0);
    obj.image10:setWidth(893);
    obj.image10:setHeight(1263);
    obj.image10:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo2.png");
    obj.image10:setStyle("stretch");
    obj.image10:setOptimize(true);
    obj.image10:setName("image10");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setColor("#264d43");
    obj.rectangle6:setLeft(20);
    obj.rectangle6:setTop(1);
    obj.rectangle6:setWidth(415);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setName("rectangle6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle5);
    obj.label9:setText("NOME DA PERÍCIA");
    obj.label9:setLeft(20);
    obj.label9:setTop(1);
    obj.label9:setWidth(135);
    obj.label9:setHeight(20);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle5);
    obj.label10:setText("HABILIDADE");
    obj.label10:setLeft(190);
    obj.label10:setTop(1);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setText("GRAD");
    obj.label11:setLeft(294);
    obj.label11:setTop(1);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle5);
    obj.label12:setText("VAR");
    obj.label12:setLeft(333);
    obj.label12:setTop(1);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle5);
    obj.label13:setText("TOTAL");
    obj.label13:setLeft(375);
    obj.label13:setTop(1);
    obj.label13:setWidth(40);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setColor("#264d43");
    obj.rectangle7:setLeft(465);
    obj.rectangle7:setTop(1);
    obj.rectangle7:setWidth(415);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setName("rectangle7");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle5);
    obj.label14:setText("NOME DA PERÍCIA");
    obj.label14:setLeft(475);
    obj.label14:setTop(1);
    obj.label14:setWidth(135);
    obj.label14:setHeight(20);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle5);
    obj.label15:setText("HABILIDADE");
    obj.label15:setLeft(635);
    obj.label15:setTop(1);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle5);
    obj.label16:setText("GRAD");
    obj.label16:setLeft(735);
    obj.label16:setTop(1);
    obj.label16:setWidth(40);
    obj.label16:setHeight(20);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setText("VAR");
    obj.label17:setLeft(774);
    obj.label17:setTop(1);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle5);
    obj.label18:setText("TOTAL");
    obj.label18:setLeft(820);
    obj.label18:setTop(1);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rclListaDasPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.rectangle5);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaRPGmeister3p_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox3);
    obj.flowLayout2:setMinWidth(500);
    obj.flowLayout2:setMaxWidth(900);
    obj.flowLayout2:setHeight(45);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setName("flowLayout2");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout2);
    obj.rectangle8:setAlign("right");
    obj.rectangle8:setColor("#50a48d");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle8);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(135);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle9);
    obj.label19:setText("PONTOS DE PODER");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setLeft(0);
    obj.label19:setTop(0);
    obj.label19:setWidth(135);
    obj.label19:setHeight(20);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setMargins({left=250});
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle9);
    obj.label20:setField("pontosPericia");
    obj.label20:setAlign("left");
    obj.label20:setWidth(135);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setMargins({top=5});
    obj.label20:setName("label20");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle9);
    obj.button12:setText("Nova Perícia");
    obj.button12:setAlign("left");
    obj.button12:setWidth(125);
    obj.button12:setHeight(25);
    obj.button12:setName("button12");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle9);
    obj.button13:setText("Zerar e Listar Perícias");
    obj.button13:setAlign("left");
    obj.button13:setWidth(145);
    obj.button13:setHeight(25);
    obj.button13:setHint("Vai apagar todas perícias atuais. ");
    obj.button13:setName("button13");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Poderes");
    obj.tab4:setName("tab4");

    obj.frmFicha_MM3ed_RRPG_Power = gui.fromHandle(_obj_newObject("form"));
    obj.frmFicha_MM3ed_RRPG_Power:setParent(obj.tab4);
    obj.frmFicha_MM3ed_RRPG_Power:setName("frmFicha_MM3ed_RRPG_Power");
    obj.frmFicha_MM3ed_RRPG_Power:setAlign("client");
    obj.frmFicha_MM3ed_RRPG_Power:setTheme("light");
    obj.frmFicha_MM3ed_RRPG_Power:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFicha_MM3ed_RRPG_Power);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox4);
    obj.rectangle10:setWidth(700);
    obj.rectangle10:setHeight(1263);
    obj.rectangle10:setColor("#50a48d");
    obj.rectangle10:setName("rectangle10");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle10);
    obj.image11:setLeft(0);
    obj.image11:setTop(0);
    obj.image11:setWidth(893);
    obj.image11:setHeight(1263);
    obj.image11:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo.png");
    obj.image11:setStyle("stretch");
    obj.image11:setOptimize(true);
    obj.image11:setName("image11");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle10);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(30);
    obj.layout88:setMargins({bottom=4});
    obj.layout88:setName("layout88");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout88);
    obj.button14:setText("NOVO PODER");
    obj.button14:setWidth(150);
    obj.button14:setAlign("left");
    obj.button14:setName("button14");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.rectangle10);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmListaPoderes");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setHeight(30);
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.rectangle10);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setMargins({left=14, right=14});

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("#6cb098");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setHeight(500);
    obj.rectangle11:setPadding({top=7, left=7, right=7, bottom=7});
    obj.rectangle11:setName("rectangle11");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle11);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(30);
    obj.layout89:setMargins({bottom=4});
    obj.layout89:setName("layout89");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout89);
    obj.edit72:setTransparent(true);
    obj.edit72:setAlign("top");
    lfm_setPropAsString(obj.edit72, "fontStyle",  "bold");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(68);
    obj.edit72:setHeight(31);
    obj.edit72:setField("PoderNome");
    obj.edit72:setFontColor("white");
    obj.edit72:setName("edit72");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout89);
    obj.dataLink40:setFields({'PoderNome'});
    obj.dataLink40:setDefaultValues({'NOME DO PODER'});
    obj.dataLink40:setName("dataLink40");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle11);
    obj.layout90:setLeft(10);
    obj.layout90:setTop(40);
    obj.layout90:setWidth(350);
    obj.layout90:setHeight(600);
    obj.layout90:setName("layout90");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout90);
    obj.layout91:setAlign("left");
    obj.layout91:setWidth(240);
    obj.layout91:setName("layout91");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout91);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setWidth(240);
    obj.rectangle12:setHeight(298);
    obj.rectangle12:setColor("#3f8270");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle12);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(14);
    obj.label21:setText("EFEITOS");
    obj.label21:setFontColor("white");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setMargins({top=1});
    obj.label21:setName("label21");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle12);
    obj.textEditor9:setAlign("top");
    obj.textEditor9:setField("PoderEfeito");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setFontColor("white");
    obj.textEditor9:setHeight(280);
    obj.textEditor9:setMargins({left=10, right=10});
    obj.textEditor9:setName("textEditor9");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle12);
    obj.dataLink41:setFields({'PoderEfeito'});
    obj.dataLink41:setDefaultValues({'Descreva os efeitos que estao associados a este Poder. Aproveite o espaco para anotar detalhes para nao precisar olhar o livro o tempo todo.'});
    obj.dataLink41:setName("dataLink41");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle11);
    obj.layout92:setLeft(10);
    obj.layout92:setTop(348);
    obj.layout92:setWidth(350);
    obj.layout92:setHeight(400);
    obj.layout92:setName("layout92");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setAlign("left");
    obj.layout93:setWidth(240);
    obj.layout93:setName("layout93");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout93);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setWidth(240);
    obj.rectangle13:setHeight(82);
    obj.rectangle13:setColor("#3f8270");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle13);
    obj.label22:setLeft(5);
    obj.label22:setFontSize(16);
    obj.label22:setText("Notas");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setFontColor("white");
    obj.label22:setVertTextAlign("center");
    obj.label22:setMargins({left=2});
    obj.label22:setName("label22");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle13);
    obj.textEditor10:setAlign("top");
    obj.textEditor10:setField("PoderNotas");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setFontColor("white");
    obj.textEditor10:setMargins({left=50});
    obj.textEditor10:setHeight(82);
    obj.textEditor10:setName("textEditor10");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle13);
    obj.dataLink42:setFields({'PoderNotas'});
    obj.dataLink42:setDefaultValues({'Descreva como o poder funciona na pratica e seus descritores'});
    obj.dataLink42:setName("dataLink42");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle11);
    obj.layout94:setLeft(10);
    obj.layout94:setTop(441);
    obj.layout94:setWidth(350);
    obj.layout94:setHeight(300);
    obj.layout94:setName("layout94");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setAlign("left");
    obj.layout95:setWidth(240);
    obj.layout95:setName("layout95");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout95);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setWidth(240);
    obj.rectangle14:setColor("#3f8270");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle14);
    obj.label23:setLeft(5);
    obj.label23:setFontSize(16);
    obj.label23:setText("Custo");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setFontColor("white");
    obj.label23:setVertTextAlign("center");
    obj.label23:setMargins({left=10});
    obj.label23:setName("label23");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle14);
    obj.textEditor11:setAlign("top");
    obj.textEditor11:setField("PoderCusto");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setFontColor("white");
    obj.textEditor11:setMargins({left=50});
    obj.textEditor11:setName("textEditor11");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle14);
    obj.dataLink43:setFields({'PoderCusto'});
    obj.dataLink43:setDefaultValues({'Total de Pontos de Poder investidos = (Grad + Extras - Falhas) x Custo + Extras Fixos - Falhas Fixas.'});
    obj.dataLink43:setName("dataLink43");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle11);
    obj.layout96:setLeft(140);
    obj.layout96:setTop(40);
    obj.layout96:setWidth(250);
    obj.layout96:setHeight(200);
    obj.layout96:setName("layout96");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout96);
    obj.rectangle15:setAlign("right");
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setColor("#3f8270");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle15);
    obj.label24:setAlign("bottom");
    obj.label24:setFontSize(12);
    obj.label24:setText("IMAGEM");
    obj.label24:setFontColor("white");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setMargins({bottom=1});
    obj.label24:setName("label24");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle15);
    obj.image12:setAlign("right");
    obj.image12:setEditable(true);
    obj.image12:setField("PoderImagem");
    obj.image12:setWidth(130);
    obj.image12:setMargins({top=1});
    obj.image12:setName("image12");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle11);
    obj.layout97:setLeft(260);
    obj.layout97:setTop(252);
    obj.layout97:setWidth(130);
    obj.layout97:setHeight(38);
    obj.layout97:setName("layout97");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout97);
    obj.rectangle16:setAlign("right");
    obj.rectangle16:setWidth(130);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("#3f8270");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle16);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(12);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setText("DEFESA");
    obj.label25:setFontColor("white");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.rectangle16);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setField("PoderDefesa");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'NENHUMA', 'ESQUIVA', 'APARAR', 'FORTITUDE', 'VONTADE', 'RESISTENCIA'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle16);
    obj.dataLink44:setFields({'PoderDefesa'});
    obj.dataLink44:setDefaultValues({'NENHUMA'});
    obj.dataLink44:setName("dataLink44");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle11);
    obj.layout98:setLeft(260);
    obj.layout98:setTop(300);
    obj.layout98:setWidth(130);
    obj.layout98:setHeight(38);
    obj.layout98:setName("layout98");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout98);
    obj.rectangle17:setAlign("right");
    obj.rectangle17:setWidth(130);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("#3f8270");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle17);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(12);
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setText("ACAO");
    obj.label26:setFontColor("white");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle17);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setField("PoderAcao");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'NENHUMA', 'LIVRE', 'REACAO', 'MOVIMENTO', 'PADRAO'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle17);
    obj.dataLink45:setFields({'PoderAcao'});
    obj.dataLink45:setDefaultValues({'NENHUMA'});
    obj.dataLink45:setName("dataLink45");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle11);
    obj.layout99:setLeft(140);
    obj.layout99:setTop(348);
    obj.layout99:setWidth(250);
    obj.layout99:setHeight(18);
    obj.layout99:setName("layout99");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout99);
    obj.rectangle18:setAlign("right");
    obj.rectangle18:setWidth(130);
    obj.rectangle18:setColor("#3f8270");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle18);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(12);
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setText("ALCANCE");
    obj.label27:setFontColor("white");
    obj.label27:setName("label27");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle11);
    obj.layout100:setLeft(140);
    obj.layout100:setTop(364);
    obj.layout100:setWidth(250);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout100);
    obj.edit73:setAlign("right");
    obj.edit73:setWidth(130);
    obj.edit73:setField("PoderAlcance");
    obj.edit73:setName("edit73");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout100);
    obj.dataLink46:setFields({'PoderAlcance'});
    obj.dataLink46:setDefaultValues({'Pessoal, Perto, Percepcao, ou o valor da tabela de referencia'});
    obj.dataLink46:setName("dataLink46");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle11);
    obj.layout101:setLeft(140);
    obj.layout101:setTop(398);
    obj.layout101:setWidth(250);
    obj.layout101:setHeight(18);
    obj.layout101:setName("layout101");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout101);
    obj.rectangle19:setAlign("right");
    obj.rectangle19:setWidth(130);
    obj.rectangle19:setColor("#3f8270");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle19);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(12);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("DURACAO");
    obj.label28:setFontColor("white");
    obj.label28:setName("label28");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle11);
    obj.layout102:setLeft(140);
    obj.layout102:setTop(414);
    obj.layout102:setWidth(250);
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout102);
    obj.edit74:setAlign("right");
    obj.edit74:setWidth(130);
    obj.edit74:setField("PoderDuracao");
    obj.edit74:setName("edit74");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout102);
    obj.dataLink47:setFields({'PoderDuracao'});
    obj.dataLink47:setDefaultValues({'Instantaneo, Sustentado, Continuo ou Permanente'});
    obj.dataLink47:setName("dataLink47");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle11);
    obj.layout103:setLeft(140);
    obj.layout103:setTop(449);
    obj.layout103:setWidth(250);
    obj.layout103:setHeight(18);
    obj.layout103:setName("layout103");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout103);
    obj.rectangle20:setAlign("right");
    obj.rectangle20:setWidth(130);
    obj.rectangle20:setColor("#3f8270");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle20);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(12);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("REFERENCIA");
    obj.label29:setFontColor("white");
    obj.label29:setName("label29");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle11);
    obj.layout104:setLeft(140);
    obj.layout104:setTop(466);
    obj.layout104:setWidth(250);
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout104);
    obj.edit75:setAlign("right");
    obj.edit75:setWidth(130);
    obj.edit75:setField("PoderReferencia");
    obj.edit75:setName("edit75");

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout104);
    obj.dataLink48:setFields({'PoderReferencia'});
    obj.dataLink48:setDefaultValues({'Pagina e Livro de Ref'});
    obj.dataLink48:setName("dataLink48");

    obj._e_event0 = obj.image2:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event1 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFesq1 = (tonumber(sheet.AGI) or 0);
                           sheet.DEFapa1 = (tonumber(sheet.LUT) or 0);
                           sheet.DEFvon1 = (tonumber(sheet.PRO) or 0);
                           sheet.DEFforti1 = (tonumber(sheet.VIG) or 0);
                           sheet.DEFres1 = (tonumber(sheet.VIG) or 0);
        end, obj);

    obj._e_event2 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFesqTotal = (tonumber(sheet.DEFesq1) or 0) + (tonumber(sheet.DEFesq2) or 0) + (tonumber(sheet.DEFesq3) or 0);
        end, obj);

    obj._e_event3 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFapaTotal = (tonumber(sheet.DEFapa1) or 0) + (tonumber(sheet.DEFapa2) or 0) + (tonumber(sheet.DEFapa3) or 0);
        end, obj);

    obj._e_event4 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFvonTotal = (tonumber(sheet.DEFvon1) or 0) + (tonumber(sheet.DEFvon2) or 0) + (tonumber(sheet.DEFvon3) or 0);
        end, obj);

    obj._e_event5 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFfortiTotal = (tonumber(sheet.DEFforti1) or 0) + (tonumber(sheet.DEFforti2) or 0) + (tonumber(sheet.DEFforti3) or 0);
        end, obj);

    obj._e_event6 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFresTotal = (tonumber(sheet.DEFres1) or 0) + (tonumber(sheet.DEFres2) or 0) + (tonumber(sheet.DEFres3) or 0);
        end, obj);

    obj._e_event7 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.DEFextraTotal = (tonumber(sheet.DEFextra1) or 0) + (tonumber(sheet.DEFextra2) or 0) + (tonumber(sheet.DEFextra3) or 0);
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (self)
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

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (self)
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

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (self)
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

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (self)
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

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (self)
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

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (self)
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

    obj._e_event14 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.PPhabilidades = ((tonumber(sheet.FOR) or 0) +
                                                      (tonumber(sheet.VIG) or 0) +
                                                      (tonumber(sheet.AGI) or 0) +
                                                      (tonumber(sheet.DES) or 0) +
                                                      (tonumber(sheet.LUT) or 0) +
                                                      (tonumber(sheet.INT) or 0) +
                                                      (tonumber(sheet.PRO) or 0) +
                                                      (tonumber(sheet.PRE) or 0)) * 2;
        end, obj);

    obj._e_event15 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.PPpericiasgrad = math.floor(sheet.PPpericias or 0) * 2;
        end, obj);

    obj._e_event16 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.PPpericias = math.floor(sheet.pontosPericia or 0) ;
        end, obj);

    obj._e_event17 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.PPsomatotal = (tonumber(sheet.PPhabilidades) or 0) +
                                                    (tonumber(sheet.PPpericias) or 0) +
                                                    (tonumber(sheet.PPvantagens) or 0) +
                                                    (tonumber(sheet.PPdefesas) or 0) +
                                                    (tonumber(sheet.PPpoderes) or 0);                  
            
                                if sheet.PPsomatotal >= 0 then
                                    sheet.PPsomatotal = sheet.PPsomatotal .. " PONTOS DE PODER";
                                end;
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (self)
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

    obj._e_event19 = obj.button8:addEventListener("onClick",
        function (self)
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

    obj._e_event20 = obj.button9:addEventListener("onClick",
        function (self)
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

    obj._e_event21 = obj.button10:addEventListener("onClick",
        function (self)
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

    obj._e_event22 = obj.button11:addEventListener("onClick",
        function (self)
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

    obj._e_event23 = obj.image9:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.sobmanto);
        end, obj);

    obj._e_event24 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event25 = obj.button12:addEventListener("onClick",
        function (self)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event26 = obj.button13:addEventListener("onClick",
        function (self)
            dndSkills();
        end, obj);

    obj._e_event27 = obj.button14:addEventListener("onClick",
        function (self)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event28 = obj.rclListaDosItens:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosItens.selectedNode; 
                                         self.boxDetalhesDoItem.node = node;                       
            
                                          self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.frmFicha_MM3ed_RRPG_image2_svg ~= nil then self.frmFicha_MM3ed_RRPG_image2_svg:destroy(); self.frmFicha_MM3ed_RRPG_image2_svg = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.frmFichaRPGmeister3_svg ~= nil then self.frmFichaRPGmeister3_svg:destroy(); self.frmFichaRPGmeister3_svg = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.frmFicha_MM3ed_RRPG_Power ~= nil then self.frmFicha_MM3ed_RRPG_Power:destroy(); self.frmFicha_MM3ed_RRPG_Power = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.frmFicha_MM3e_RRPG1_svg ~= nil then self.frmFicha_MM3e_RRPG1_svg:destroy(); self.frmFicha_MM3e_RRPG1_svg = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmFicha_MM3ed_RRPG_image);
rrpg.registrarDataType(_frmFicha_MM3ed_RRPG_image);

return _frmFicha_MM3ed_RRPG_image;
