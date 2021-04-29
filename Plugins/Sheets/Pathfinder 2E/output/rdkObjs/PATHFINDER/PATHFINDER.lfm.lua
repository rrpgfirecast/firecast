require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPATHFINDER()
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
    obj:setName("frmPATHFINDER");
    obj:setFormType("sheetTemplate");
    obj:setDataType("PathFinder_Oficial");
    obj:setTitle("PathFinder 2E (Oficial)");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Página 1");
    obj.tab1:setName("tab1");

    obj.frmPATHFINDER1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER1_svg:setParent(obj.tab1);
    obj.frmPATHFINDER1_svg:setName("frmPATHFINDER1_svg");
    obj.frmPATHFINDER1_svg:setAlign("client");
    obj.frmPATHFINDER1_svg:setTheme("light");
    obj.frmPATHFINDER1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmPATHFINDER1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(905);
    obj.rectangle1:setHeight(1175);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(905);
    obj.image1:setHeight(1175);
    obj.image1:setSRC("/PATHFINDER/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(210);
    obj.edit1:setTop(50);
    obj.edit1:setWidth(295);
    obj.edit1:setHeight(35);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontColor("black");
    obj.edit1:setTransparent(true);
    obj.edit1:setField("NomePersonagem");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(255);
    obj.edit2:setTop(94);
    obj.edit2:setWidth(250);
    obj.edit2:setHeight(28);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("black");
    obj.edit2:setTransparent(true);
    obj.edit2:setField("NomeJogador");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(295);
    obj.edit3:setTop(128);
    obj.edit3:setWidth(210);
    obj.edit3:setHeight(22);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("black");
    obj.edit3:setTransparent(true);
    obj.edit3:setField("PontosExperiencia");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(515);
    obj.edit4:setTop(35);
    obj.edit4:setWidth(275);
    obj.edit4:setHeight(18);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("black");
    obj.edit4:setTransparent(true);
    obj.edit4:setField("AcestralidadeHeranca");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(515);
    obj.edit5:setTop(63);
    obj.edit5:setWidth(275);
    obj.edit5:setHeight(18);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("black");
    obj.edit5:setTransparent(true);
    obj.edit5:setField("Biografia");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(515);
    obj.edit6:setTop(91);
    obj.edit6:setWidth(275);
    obj.edit6:setHeight(18);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("black");
    obj.edit6:setTransparent(true);
    obj.edit6:setField("Classe");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(515);
    obj.edit7:setTop(115);
    obj.edit7:setWidth(42);
    obj.edit7:setHeight(17);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(10);
    obj.edit7:setTransparent(true);
    obj.edit7:setField("Tamanho");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(565);
    obj.edit8:setTop(115);
    obj.edit8:setWidth(65);
    obj.edit8:setHeight(17);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(10);
    obj.edit8:setTransparent(true);
    obj.edit8:setField("Tendencia");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(680);
    obj.edit9:setTop(114);
    obj.edit9:setWidth(110);
    obj.edit9:setHeight(18);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(10);
    obj.edit9:setTransparent(true);
    obj.edit9:setField("Tracos");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(570);
    obj.edit10:setTop(133);
    obj.edit10:setWidth(220);
    obj.edit10:setHeight(18);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("black");
    obj.edit10:setTransparent(true);
    obj.edit10:setField("Divindade");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(800);
    obj.edit11:setTop(50);
    obj.edit11:setWidth(75);
    obj.edit11:setHeight(35);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(20);
    obj.edit11:setTransparent(true);
    obj.edit11:setField("Nivel");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(812);
    obj.edit12:setTop(112);
    obj.edit12:setWidth(55);
    obj.edit12:setHeight(35);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("black");
    obj.edit12:setTransparent(true);
    obj.edit12:setField("PontosHeroismo");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setLeft(35);
    obj.edit13:setTop(183);
    obj.edit13:setWidth(43);
    obj.edit13:setHeight(32);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(14);
    obj.edit13:setTransparent(false);
    obj.edit13:setField("MODForca");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setLeft(35);
    obj.edit14:setTop(224);
    obj.edit14:setWidth(43);
    obj.edit14:setHeight(32);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(14);
    obj.edit14:setTransparent(false);
    obj.edit14:setField("MODDestreza");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setLeft(35);
    obj.edit15:setTop(265);
    obj.edit15:setWidth(43);
    obj.edit15:setHeight(32);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(14);
    obj.edit15:setTransparent(false);
    obj.edit15:setField("MODConstituicao");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setLeft(35);
    obj.edit16:setTop(307);
    obj.edit16:setWidth(43);
    obj.edit16:setHeight(32);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(14);
    obj.edit16:setTransparent(false);
    obj.edit16:setField("MODInteligencia");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setLeft(35);
    obj.edit17:setTop(348);
    obj.edit17:setWidth(43);
    obj.edit17:setHeight(32);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(14);
    obj.edit17:setTransparent(false);
    obj.edit17:setField("MODSabedoria");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setLeft(35);
    obj.edit18:setTop(389);
    obj.edit18:setWidth(43);
    obj.edit18:setHeight(32);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(14);
    obj.edit18:setTransparent(false);
    obj.edit18:setField("MODCarisma");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setLeft(248);
    obj.edit19:setTop(183);
    obj.edit19:setWidth(43);
    obj.edit19:setHeight(32);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(14);
    obj.edit19:setTransparent(false);
    obj.edit19:setField("ValorForca");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle1);
    obj.edit20:setLeft(248);
    obj.edit20:setTop(224);
    obj.edit20:setWidth(43);
    obj.edit20:setHeight(32);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(14);
    obj.edit20:setTransparent(false);
    obj.edit20:setField("ValorDestreza");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle1);
    obj.edit21:setLeft(248);
    obj.edit21:setTop(265);
    obj.edit21:setWidth(43);
    obj.edit21:setHeight(32);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(14);
    obj.edit21:setTransparent(false);
    obj.edit21:setField("ValorConstituicao");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle1);
    obj.edit22:setLeft(248);
    obj.edit22:setTop(307);
    obj.edit22:setWidth(43);
    obj.edit22:setHeight(32);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(14);
    obj.edit22:setTransparent(false);
    obj.edit22:setField("ValorInteligencia");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle1);
    obj.edit23:setLeft(248);
    obj.edit23:setTop(348);
    obj.edit23:setWidth(43);
    obj.edit23:setHeight(32);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(14);
    obj.edit23:setTransparent(false);
    obj.edit23:setField("ValorSabedoria");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setLeft(248);
    obj.edit24:setTop(389);
    obj.edit24:setWidth(43);
    obj.edit24:setHeight(32);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("black");
    obj.edit24:setFontSize(14);
    obj.edit24:setTransparent(false);
    obj.edit24:setField("ValorCarisma");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle1);
    obj.edit25:setLeft(35);
    obj.edit25:setTop(450);
    obj.edit25:setWidth(43);
    obj.edit25:setHeight(32);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(14);
    obj.edit25:setTransparent(false);
    obj.edit25:setField("CDBase");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle1);
    obj.edit26:setLeft(129);
    obj.edit26:setTop(459);
    obj.edit26:setWidth(34);
    obj.edit26:setHeight(22);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontColor("black");
    obj.edit26:setFontSize(14);
    obj.edit26:setTransparent(false);
    obj.edit26:setField("AtbChave");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle1);
    obj.edit27:setLeft(168);
    obj.edit27:setTop(459);
    obj.edit27:setWidth(34);
    obj.edit27:setHeight(22);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(14);
    obj.edit27:setTransparent(false);
    obj.edit27:setField("PROF");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle1);
    obj.edit28:setLeft(256);
    obj.edit28:setTop(459);
    obj.edit28:setWidth(34);
    obj.edit28:setHeight(22);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontColor("black");
    obj.edit28:setFontSize(14);
    obj.edit28:setTransparent(false);
    obj.edit28:setField("CDClasseItem");
    obj.edit28:setName("edit28");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle1);
    obj.checkBox1:setLeft(205);
    obj.checkBox1:setTop(460);
    obj.checkBox1:setWidth(12);
    obj.checkBox1:setField("CDClasseTEML1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle1);
    obj.checkBox2:setLeft(217);
    obj.checkBox2:setTop(460);
    obj.checkBox2:setWidth(12);
    obj.checkBox2:setField("CDClasseTEML2");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle1);
    obj.checkBox3:setLeft(229);
    obj.checkBox3:setTop(460);
    obj.checkBox3:setWidth(12);
    obj.checkBox3:setField("CDClasseTEML3");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle1);
    obj.checkBox4:setLeft(241);
    obj.checkBox4:setTop(460);
    obj.checkBox4:setWidth(12);
    obj.checkBox4:setField("CDClasseTEML4");
    obj.checkBox4:setName("checkBox4");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle1);
    obj.edit29:setLeft(115);
    obj.edit29:setTop(489);
    obj.edit29:setWidth(63);
    obj.edit29:setHeight(31);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontColor("black");
    obj.edit29:setFontSize(14);
    obj.edit29:setTransparent(false);
    obj.edit29:setField("CDClasseVelocidade");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle1);
    obj.edit30:setLeft(233);
    obj.edit30:setTop(499);
    obj.edit30:setWidth(230);
    obj.edit30:setHeight(22);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontColor("black");
    obj.edit30:setFontSize(14);
    obj.edit30:setTransparent(false);
    obj.edit30:setField("CDClasseTipoMovimento");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle1);
    obj.edit31:setLeft(352);
    obj.edit31:setTop(200);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(31);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontColor("black");
    obj.edit31:setFontSize(14);
    obj.edit31:setTransparent(false);
    obj.edit31:setField("CA");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle1);
    obj.edit32:setLeft(457);
    obj.edit32:setTop(193);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(24);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontColor("black");
    obj.edit32:setFontSize(14);
    obj.edit32:setTransparent(false);
    obj.edit32:setField("CADes");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle1);
    obj.edit33:setLeft(500);
    obj.edit33:setTop(193);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(24);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontColor("black");
    obj.edit33:setFontSize(14);
    obj.edit33:setTransparent(false);
    obj.edit33:setField("CALimite");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle1);
    obj.edit34:setLeft(536);
    obj.edit34:setTop(193);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(24);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontColor("black");
    obj.edit34:setFontSize(14);
    obj.edit34:setTransparent(false);
    obj.edit34:setField("CAProf");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle1);
    obj.edit35:setLeft(626);
    obj.edit35:setTop(193);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(24);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontColor("black");
    obj.edit35:setFontSize(14);
    obj.edit35:setTransparent(false);
    obj.edit35:setField("CAItem");
    obj.edit35:setName("edit35");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle1);
    obj.checkBox5:setLeft(571);
    obj.checkBox5:setTop(196);
    obj.checkBox5:setWidth(12);
    obj.checkBox5:setField("CATEML1");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectangle1);
    obj.checkBox6:setLeft(583);
    obj.checkBox6:setTop(196);
    obj.checkBox6:setWidth(12);
    obj.checkBox6:setField("CATEML2");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.rectangle1);
    obj.checkBox7:setLeft(595);
    obj.checkBox7:setTop(196);
    obj.checkBox7:setWidth(12);
    obj.checkBox7:setField("CATEML3");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.rectangle1);
    obj.checkBox8:setLeft(607);
    obj.checkBox8:setTop(196);
    obj.checkBox8:setWidth(12);
    obj.checkBox8:setField("CATEML4");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.rectangle1);
    obj.checkBox9:setLeft(433);
    obj.checkBox9:setTop(236);
    obj.checkBox9:setWidth(12);
    obj.checkBox9:setField("SemArmaduraTEML1");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.rectangle1);
    obj.checkBox10:setLeft(445);
    obj.checkBox10:setTop(236);
    obj.checkBox10:setWidth(12);
    obj.checkBox10:setField("SemArmaduraTEML2");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.rectangle1);
    obj.checkBox11:setLeft(457);
    obj.checkBox11:setTop(236);
    obj.checkBox11:setWidth(12);
    obj.checkBox11:setField("SemArmaduraTEML3");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.rectangle1);
    obj.checkBox12:setLeft(469);
    obj.checkBox12:setTop(236);
    obj.checkBox12:setWidth(12);
    obj.checkBox12:setField("SemArmaduraTEML4");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.rectangle1);
    obj.checkBox13:setLeft(488);
    obj.checkBox13:setTop(236);
    obj.checkBox13:setWidth(12);
    obj.checkBox13:setField("LeveTEML1");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.rectangle1);
    obj.checkBox14:setLeft(500);
    obj.checkBox14:setTop(236);
    obj.checkBox14:setWidth(12);
    obj.checkBox14:setField("LeveTEML1");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.rectangle1);
    obj.checkBox15:setLeft(512);
    obj.checkBox15:setTop(236);
    obj.checkBox15:setWidth(12);
    obj.checkBox15:setField("LeveTEML1");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.rectangle1);
    obj.checkBox16:setLeft(524);
    obj.checkBox16:setTop(236);
    obj.checkBox16:setWidth(12);
    obj.checkBox16:setField("LeveTEML1");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.rectangle1);
    obj.checkBox17:setLeft(545);
    obj.checkBox17:setTop(236);
    obj.checkBox17:setWidth(12);
    obj.checkBox17:setField("CAMediaTEML1");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.rectangle1);
    obj.checkBox18:setLeft(557);
    obj.checkBox18:setTop(236);
    obj.checkBox18:setWidth(12);
    obj.checkBox18:setField("CAMediaTEML2");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.rectangle1);
    obj.checkBox19:setLeft(569);
    obj.checkBox19:setTop(236);
    obj.checkBox19:setWidth(12);
    obj.checkBox19:setField("CAMediaTEML3");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.rectangle1);
    obj.checkBox20:setLeft(581);
    obj.checkBox20:setTop(236);
    obj.checkBox20:setWidth(12);
    obj.checkBox20:setField("CAMediaTEML4");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.rectangle1);
    obj.checkBox21:setLeft(600);
    obj.checkBox21:setTop(236);
    obj.checkBox21:setWidth(12);
    obj.checkBox21:setField("CAPesadaTEML1");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.rectangle1);
    obj.checkBox22:setLeft(612);
    obj.checkBox22:setTop(236);
    obj.checkBox22:setWidth(12);
    obj.checkBox22:setField("CAPesadaTEML2");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.rectangle1);
    obj.checkBox23:setLeft(624);
    obj.checkBox23:setTop(236);
    obj.checkBox23:setWidth(12);
    obj.checkBox23:setField("CAPesadaTEML3");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.rectangle1);
    obj.checkBox24:setLeft(636);
    obj.checkBox24:setTop(236);
    obj.checkBox24:setWidth(12);
    obj.checkBox24:setField("CAPesadaTEML4");
    obj.checkBox24:setName("checkBox24");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle1);
    obj.edit36:setLeft(467);
    obj.edit36:setTop(265);
    obj.edit36:setWidth(25);
    obj.edit36:setHeight(22);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontColor("black");
    obj.edit36:setFontSize(14);
    obj.edit36:setTransparent(false);
    obj.edit36:setField("CAEscudo");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle1);
    obj.edit37:setLeft(502);
    obj.edit37:setTop(270);
    obj.edit37:setWidth(45);
    obj.edit37:setHeight(22);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontColor("black");
    obj.edit37:setFontSize(12);
    obj.edit37:setTransparent(false);
    obj.edit37:setField("CADureza");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle1);
    obj.edit38:setLeft(559);
    obj.edit38:setTop(270);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(22);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontColor("black");
    obj.edit38:setFontSize(12);
    obj.edit38:setTransparent(false);
    obj.edit38:setField("CAPVMax");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle1);
    obj.edit39:setLeft(594);
    obj.edit39:setTop(270);
    obj.edit39:setWidth(15);
    obj.edit39:setHeight(22);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontColor("black");
    obj.edit39:setFontSize(14);
    obj.edit39:setTransparent(false);
    obj.edit39:setField("CALQ");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle1);
    obj.edit40:setLeft(622);
    obj.edit40:setTop(270);
    obj.edit40:setWidth(47);
    obj.edit40:setHeight(22);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontColor("black");
    obj.edit40:setFontSize(14);
    obj.edit40:setTransparent(false);
    obj.edit40:setField("CAPVAtuais");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle1);
    obj.edit41:setLeft(355);
    obj.edit41:setTop(343);
    obj.edit41:setWidth(45);
    obj.edit41:setHeight(22);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontColor("black");
    obj.edit41:setFontSize(14);
    obj.edit41:setTransparent(false);
    obj.edit41:setField("Fortitude");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle1);
    obj.edit42:setLeft(335);
    obj.edit42:setTop(383);
    obj.edit42:setWidth(32);
    obj.edit42:setHeight(22);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontColor("black");
    obj.edit42:setFontSize(14);
    obj.edit42:setTransparent(false);
    obj.edit42:setField("FortitudeCon");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle1);
    obj.edit43:setLeft(382);
    obj.edit43:setTop(383);
    obj.edit43:setWidth(32);
    obj.edit43:setHeight(22);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontColor("black");
    obj.edit43:setFontSize(14);
    obj.edit43:setTransparent(false);
    obj.edit43:setField("FortitudeProf");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle1);
    obj.edit44:setLeft(335);
    obj.edit44:setTop(420);
    obj.edit44:setWidth(32);
    obj.edit44:setHeight(22);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontColor("black");
    obj.edit44:setFontSize(14);
    obj.edit44:setTransparent(false);
    obj.edit44:setField("FortitudeItem");
    obj.edit44:setName("edit44");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.rectangle1);
    obj.checkBox25:setLeft(375);
    obj.checkBox25:setTop(423);
    obj.checkBox25:setWidth(12);
    obj.checkBox25:setField("FortitudeTEML1");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.rectangle1);
    obj.checkBox26:setLeft(387);
    obj.checkBox26:setTop(423);
    obj.checkBox26:setWidth(12);
    obj.checkBox26:setField("FortitudeTEML2");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.rectangle1);
    obj.checkBox27:setLeft(399);
    obj.checkBox27:setTop(423);
    obj.checkBox27:setWidth(12);
    obj.checkBox27:setField("FortitudeTEML3");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.rectangle1);
    obj.checkBox28:setLeft(411);
    obj.checkBox28:setTop(423);
    obj.checkBox28:setWidth(12);
    obj.checkBox28:setField("FortitudeTEML4");
    obj.checkBox28:setName("checkBox28");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle1);
    obj.edit45:setLeft(476);
    obj.edit45:setTop(343);
    obj.edit45:setWidth(45);
    obj.edit45:setHeight(22);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontColor("black");
    obj.edit45:setFontSize(14);
    obj.edit45:setTransparent(false);
    obj.edit45:setField("Reflexo");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle1);
    obj.edit46:setLeft(456);
    obj.edit46:setTop(383);
    obj.edit46:setWidth(32);
    obj.edit46:setHeight(22);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontColor("black");
    obj.edit46:setFontSize(14);
    obj.edit46:setTransparent(false);
    obj.edit46:setField("FortitudeCon");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle1);
    obj.edit47:setLeft(503);
    obj.edit47:setTop(383);
    obj.edit47:setWidth(32);
    obj.edit47:setHeight(22);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontColor("black");
    obj.edit47:setFontSize(14);
    obj.edit47:setTransparent(false);
    obj.edit47:setField("FortitudeProf");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle1);
    obj.edit48:setLeft(456);
    obj.edit48:setTop(420);
    obj.edit48:setWidth(32);
    obj.edit48:setHeight(22);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontColor("black");
    obj.edit48:setFontSize(14);
    obj.edit48:setTransparent(false);
    obj.edit48:setField("FortitudeItem");
    obj.edit48:setName("edit48");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.rectangle1);
    obj.checkBox29:setLeft(496);
    obj.checkBox29:setTop(423);
    obj.checkBox29:setWidth(12);
    obj.checkBox29:setField("FortitudeTEML1");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.rectangle1);
    obj.checkBox30:setLeft(508);
    obj.checkBox30:setTop(423);
    obj.checkBox30:setWidth(12);
    obj.checkBox30:setField("FortitudeTEML2");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.rectangle1);
    obj.checkBox31:setLeft(520);
    obj.checkBox31:setTop(423);
    obj.checkBox31:setWidth(12);
    obj.checkBox31:setField("FortitudeTEML3");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.rectangle1);
    obj.checkBox32:setLeft(532);
    obj.checkBox32:setTop(423);
    obj.checkBox32:setWidth(12);
    obj.checkBox32:setField("FortitudeTEML4");
    obj.checkBox32:setName("checkBox32");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Página 2");
    obj.tab2:setName("tab2");

    obj.frmPATHFINDER2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER2_svg:setParent(obj.tab2);
    obj.frmPATHFINDER2_svg:setName("frmPATHFINDER2_svg");
    obj.frmPATHFINDER2_svg:setAlign("client");
    obj.frmPATHFINDER2_svg:setTheme("light");
    obj.frmPATHFINDER2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPATHFINDER2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(905);
    obj.rectangle2:setHeight(1175);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(905);
    obj.image2:setHeight(1175);
    obj.image2:setSRC("/PATHFINDER/images/2.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Página 3");
    obj.tab3:setName("tab3");

    obj.frmPATHFINDER3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER3_svg:setParent(obj.tab3);
    obj.frmPATHFINDER3_svg:setName("frmPATHFINDER3_svg");
    obj.frmPATHFINDER3_svg:setAlign("client");
    obj.frmPATHFINDER3_svg:setTheme("light");
    obj.frmPATHFINDER3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmPATHFINDER3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox3);
    obj.rectangle3:setWidth(905);
    obj.rectangle3:setHeight(1175);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(905);
    obj.image3:setHeight(1175);
    obj.image3:setSRC("/PATHFINDER/images/3.png");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Página 4");
    obj.tab4:setName("tab4");

    obj.frmPATHFINDER4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER4_svg:setParent(obj.tab4);
    obj.frmPATHFINDER4_svg:setName("frmPATHFINDER4_svg");
    obj.frmPATHFINDER4_svg:setAlign("client");
    obj.frmPATHFINDER4_svg:setTheme("light");
    obj.frmPATHFINDER4_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmPATHFINDER4_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox4);
    obj.rectangle4:setWidth(905);
    obj.rectangle4:setHeight(1175);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setName("rectangle4");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle4);
    obj.image4:setLeft(0);
    obj.image4:setTop(0);
    obj.image4:setWidth(905);
    obj.image4:setHeight(1175);
    obj.image4:setSRC("/PATHFINDER/images/4.png");
    obj.image4:setStyle("stretch");
    obj.image4:setOptimize(true);
    obj.image4:setName("image4");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.frmPATHFINDER1_svg ~= nil then self.frmPATHFINDER1_svg:destroy(); self.frmPATHFINDER1_svg = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.frmPATHFINDER4_svg ~= nil then self.frmPATHFINDER4_svg:destroy(); self.frmPATHFINDER4_svg = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.frmPATHFINDER2_svg ~= nil then self.frmPATHFINDER2_svg:destroy(); self.frmPATHFINDER2_svg = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.frmPATHFINDER3_svg ~= nil then self.frmPATHFINDER3_svg:destroy(); self.frmPATHFINDER3_svg = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPATHFINDER()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPATHFINDER();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPATHFINDER = {
    newEditor = newfrmPATHFINDER, 
    new = newfrmPATHFINDER, 
    name = "frmPATHFINDER", 
    dataType = "PathFinder_Oficial", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "PathFinder 2E (Oficial)", 
    description=""};

frmPATHFINDER = _frmPATHFINDER;
Firecast.registrarForm(_frmPATHFINDER);
Firecast.registrarDataType(_frmPATHFINDER);

return _frmPATHFINDER;
