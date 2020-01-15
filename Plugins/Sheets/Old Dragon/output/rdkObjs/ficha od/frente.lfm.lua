require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmficha_od1_svg()
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
    obj:setName("frmficha_od1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(629);
    obj.rectangle1:setHeight(893);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(629);
    obj.image1:setHeight(893);
    obj.image1:setSRC("/ficha od/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(61);
    obj.layout1:setTop(62);
    obj.layout1:setWidth(322);
    obj.layout1:setHeight(41);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(30);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(322);
    obj.edit1:setHeight(42);
    obj.edit1:setField("nome_personagem");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("black");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(54);
    obj.layout2:setTop(112);
    obj.layout2:setWidth(226);
    obj.layout2:setHeight(29);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(14.2);
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(226);
    obj.edit2:setHeight(30);
    obj.edit2:setField("classe");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("black");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(292);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(43);
    obj.layout3:setHeight(32);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(14.2);
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(43);
    obj.edit3:setHeight(33);
    obj.edit3:setField("nivel");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("black");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(348);
    obj.layout4:setTop(112);
    obj.layout4:setWidth(94);
    obj.layout4:setHeight(29);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(14.2);
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(94);
    obj.edit4:setHeight(30);
    obj.edit4:setField("raca");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("black");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(454);
    obj.layout5:setTop(112);
    obj.layout5:setWidth(121);
    obj.layout5:setHeight(29);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14.2);
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(121);
    obj.edit5:setHeight(30);
    obj.edit5:setField("alinhamento");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("black");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(135);
    obj.layout6:setTop(199);
    obj.layout6:setWidth(47);
    obj.layout6:setHeight(43);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(30);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(47);
    obj.edit6:setHeight(44);
    obj.edit6:setField("forca");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("black");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(196);
    obj.layout7:setTop(195);
    obj.layout7:setWidth(44);
    obj.layout7:setHeight(42);
    obj.layout7:setName("layout7");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout7);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(44);
    obj.label1:setHeight(42);
    obj.label1:setFontSize(21);
    obj.label1:setField("mod_forca");
    obj.label1:setName("label1");
    obj.label1:setFontColor("black");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(135);
    obj.layout8:setTop(254);
    obj.layout8:setWidth(47);
    obj.layout8:setHeight(43);
    obj.layout8:setName("layout8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(30);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(47);
    obj.edit7:setHeight(44);
    obj.edit7:setField("destreza");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("black");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(196);
    obj.layout9:setTop(251);
    obj.layout9:setWidth(44);
    obj.layout9:setHeight(42);
    obj.layout9:setName("layout9");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout9);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(44);
    obj.label2:setHeight(42);
    obj.label2:setFontSize(21);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("center");
    obj.label2:setField("mod_destreza");
    obj.label2:setName("label2");
    obj.label2:setFontColor("black");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(135);
    obj.layout10:setTop(311);
    obj.layout10:setWidth(47);
    obj.layout10:setHeight(43);
    obj.layout10:setName("layout10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(30);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(47);
    obj.edit8:setHeight(44);
    obj.edit8:setField("constituicao");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("black");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(196);
    obj.layout11:setTop(308);
    obj.layout11:setWidth(44);
    obj.layout11:setHeight(43);
    obj.layout11:setName("layout11");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout11);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(44);
    obj.label3:setHeight(43);
    obj.label3:setFontSize(21);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setVertTextAlign("center");
    obj.label3:setField("mod_constituicao");
    obj.label3:setName("label3");
    obj.label3:setFontColor("black");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(135);
    obj.layout12:setTop(367);
    obj.layout12:setWidth(47);
    obj.layout12:setHeight(43);
    obj.layout12:setName("layout12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(30);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(47);
    obj.edit9:setHeight(44);
    obj.edit9:setField("inteligencia");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("black");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(196);
    obj.layout13:setTop(364);
    obj.layout13:setWidth(44);
    obj.layout13:setHeight(43);
    obj.layout13:setName("layout13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setTransparent(true);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(44);
    obj.edit10:setHeight(43);
    obj.edit10:setFontSize(21);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setField("idiomas");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("black");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(246);
    obj.layout14:setTop(364);
    obj.layout14:setWidth(44);
    obj.layout14:setHeight(43);
    obj.layout14:setName("layout14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setTransparent(true);
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(44);
    obj.edit11:setHeight(43);
    obj.edit11:setFontSize(21);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setField("aprender_magia");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("black");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(135);
    obj.layout15:setTop(423);
    obj.layout15:setWidth(47);
    obj.layout15:setHeight(43);
    obj.layout15:setName("layout15");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(30);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(47);
    obj.edit12:setHeight(44);
    obj.edit12:setField("sabedoria");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("black");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(196);
    obj.layout16:setTop(420);
    obj.layout16:setWidth(44);
    obj.layout16:setHeight(43);
    obj.layout16:setName("layout16");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout16);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(44);
    obj.label4:setHeight(43);
    obj.label4:setFontSize(21);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setField("mod_sabedoria");
    obj.label4:setName("label4");
    obj.label4:setFontColor("black");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(135);
    obj.layout17:setTop(479);
    obj.layout17:setWidth(47);
    obj.layout17:setHeight(43);
    obj.layout17:setName("layout17");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout17);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(30);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(47);
    obj.edit13:setHeight(44);
    obj.edit13:setField("carisma");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("black");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(197);
    obj.layout18:setTop(476);
    obj.layout18:setWidth(43);
    obj.layout18:setHeight(41);
    obj.layout18:setName("layout18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout18);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(21);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(43);
    obj.edit14:setHeight(42);
    obj.edit14:setField("seguidores");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("black");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(247);
    obj.layout19:setTop(476);
    obj.layout19:setWidth(43);
    obj.layout19:setHeight(41);
    obj.layout19:setName("layout19");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout19);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(21);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(43);
    obj.edit15:setHeight(42);
    obj.edit15:setField("ajuste_reacao");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("black");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(374);
    obj.layout20:setTop(201);
    obj.layout20:setWidth(55);
    obj.layout20:setHeight(41);
    obj.layout20:setName("layout20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout20);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(30);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(55);
    obj.edit16:setHeight(42);
    obj.edit16:setField("pv_total");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("black");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(444);
    obj.layout21:setTop(196);
    obj.layout21:setWidth(39);
    obj.layout21:setHeight(40);
    obj.layout21:setName("layout21");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout21);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(21);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(39);
    obj.edit17:setHeight(41);
    obj.edit17:setField("dv");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("black");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(491);
    obj.layout22:setTop(196);
    obj.layout22:setWidth(39);
    obj.layout22:setHeight(40);
    obj.layout22:setName("layout22");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout22);
    obj.label5:setFontSize(21);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setVertTextAlign("center");
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(39);
    obj.label5:setHeight(41);
    obj.label5:setField("pv_bonus_con");
    obj.label5:setName("label5");
    obj.label5:setFontColor("black");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(537);
    obj.layout23:setTop(196);
    obj.layout23:setWidth(40);
    obj.layout23:setHeight(41);
    obj.layout23:setName("layout23");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout23);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(21);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(42);
    obj.edit18:setField("porcentagem_ressureicao");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("black");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(369);
    obj.layout24:setTop(253);
    obj.layout24:setWidth(208);
    obj.layout24:setHeight(32);
    obj.layout24:setName("layout24");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout24);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(20);
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(208);
    obj.edit19:setHeight(33);
    obj.edit19:setField("pv_atual");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("black");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(376);
    obj.layout25:setTop(303);
    obj.layout25:setWidth(55);
    obj.layout25:setHeight(41);
    obj.layout25:setName("layout25");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout25);
    obj.label6:setFontSize(30);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("center");
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setWidth(55);
    obj.label6:setHeight(42);
    obj.label6:setField("ca_total");
    obj.label6:setName("label6");
    obj.label6:setFontColor("black");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(444);
    obj.layout26:setTop(299);
    obj.layout26:setWidth(39);
    obj.layout26:setHeight(36);
    obj.layout26:setName("layout26");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout26);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(21);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(39);
    obj.edit20:setHeight(37);
    obj.edit20:setField("ca_armadura");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("black");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(491);
    obj.layout27:setTop(299);
    obj.layout27:setWidth(39);
    obj.layout27:setHeight(36);
    obj.layout27:setName("layout27");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout27);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(21);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(39);
    obj.edit21:setHeight(37);
    obj.edit21:setField("ca_escudo");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("black");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(537);
    obj.layout28:setTop(299);
    obj.layout28:setWidth(39);
    obj.layout28:setHeight(36);
    obj.layout28:setName("layout28");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout28);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(21);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(39);
    obj.edit22:setHeight(37);
    obj.edit22:setField("ca_racial");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("black");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(444);
    obj.layout29:setTop(350);
    obj.layout29:setWidth(39);
    obj.layout29:setHeight(36);
    obj.layout29:setName("layout29");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout29);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(21);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(39);
    obj.edit23:setHeight(37);
    obj.edit23:setField("ca_outro1");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("black");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(491);
    obj.layout30:setTop(350);
    obj.layout30:setWidth(39);
    obj.layout30:setHeight(36);
    obj.layout30:setName("layout30");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout30);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(21);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(39);
    obj.edit24:setHeight(37);
    obj.edit24:setField("ca_outro2");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("black");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(537);
    obj.layout31:setTop(350);
    obj.layout31:setWidth(39);
    obj.layout31:setHeight(36);
    obj.layout31:setName("layout31");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout31);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(21);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(39);
    obj.edit25:setHeight(37);
    obj.edit25:setField("ca_outro3");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("black");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(372);
    obj.layout32:setTop(413);
    obj.layout32:setWidth(48);
    obj.layout32:setHeight(41);
    obj.layout32:setName("layout32");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout32);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(30);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(48);
    obj.edit26:setHeight(42);
    obj.edit26:setField("jp");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("black");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(435);
    obj.layout33:setTop(408);
    obj.layout33:setWidth(42);
    obj.layout33:setHeight(42);
    obj.layout33:setName("layout33");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout33);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(24);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(42);
    obj.edit27:setHeight(43);
    obj.edit27:setField("jp_mod_destreza");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("black");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(485);
    obj.layout34:setTop(408);
    obj.layout34:setWidth(42);
    obj.layout34:setHeight(42);
    obj.layout34:setName("layout34");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout34);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(24);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(42);
    obj.edit28:setHeight(43);
    obj.edit28:setField("jp_mod_constituicao");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("black");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(535);
    obj.layout35:setTop(408);
    obj.layout35:setWidth(42);
    obj.layout35:setHeight(42);
    obj.layout35:setName("layout35");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout35);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(24);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(42);
    obj.edit29:setHeight(43);
    obj.edit29:setField("jp_mod_sabedoria");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("black");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(316);
    obj.layout36:setTop(476);
    obj.layout36:setWidth(113);
    obj.layout36:setHeight(39);
    obj.layout36:setName("layout36");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout36);
    obj.label7:setFontSize(30);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("center");
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(113);
    obj.label7:setHeight(40);
    obj.label7:setField("movimento_total");
    obj.label7:setName("label7");
    obj.label7:setFontColor("black");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(441);
    obj.layout37:setTop(475);
    obj.layout37:setWidth(41);
    obj.layout37:setHeight(40);
    obj.layout37:setName("layout37");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout37);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(24);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(41);
    obj.edit30:setHeight(41);
    obj.edit30:setField("movimento_raça");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("black");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(490);
    obj.layout38:setTop(475);
    obj.layout38:setWidth(40);
    obj.layout38:setHeight(40);
    obj.layout38:setName("layout38");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout38);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(24);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(41);
    obj.edit31:setField("movimento_carga");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("black");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(536);
    obj.layout39:setTop(475);
    obj.layout39:setWidth(41);
    obj.layout39:setHeight(41);
    obj.layout39:setName("layout39");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout39);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(24);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(41);
    obj.edit32:setHeight(42);
    obj.edit32:setField("movimento_armadura");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("black");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(110);
    obj.layout40:setTop(583);
    obj.layout40:setWidth(44);
    obj.layout40:setHeight(34);
    obj.layout40:setName("layout40");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout40);
    obj.label8:setFontSize(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(44);
    obj.label8:setHeight(35);
    obj.label8:setField("ba_cac_total");
    obj.label8:setName("label8");
    obj.label8:setFontColor("black");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(163);
    obj.layout41:setTop(583);
    obj.layout41:setWidth(30);
    obj.layout41:setHeight(35);
    obj.layout41:setName("layout41");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout41);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(21);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(36);
    obj.edit33:setField("ba_cac_classe");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("black");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(201);
    obj.layout42:setTop(583);
    obj.layout42:setWidth(30);
    obj.layout42:setHeight(36);
    obj.layout42:setName("layout42");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout42);
    obj.label9:setFontSize(21);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setVertTextAlign("center");
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(30);
    obj.label9:setHeight(37);
    obj.label9:setField("ba_cac_mod_forca");
    obj.label9:setName("label9");
    obj.label9:setFontColor("black");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(238);
    obj.layout43:setTop(583);
    obj.layout43:setWidth(30);
    obj.layout43:setHeight(36);
    obj.layout43:setName("layout43");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout43);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(21);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(37);
    obj.edit34:setField("ba_cac_item");
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("black");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(275);
    obj.layout44:setTop(583);
    obj.layout44:setWidth(30);
    obj.layout44:setHeight(36);
    obj.layout44:setName("layout44");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout44);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(21);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(37);
    obj.edit35:setField("ba_cac_misc");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("black");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(381);
    obj.layout45:setTop(582);
    obj.layout45:setWidth(44);
    obj.layout45:setHeight(38);
    obj.layout45:setName("layout45");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout45);
    obj.label10:setFontSize(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("center");
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(44);
    obj.label10:setHeight(39);
    obj.label10:setField("ba_distancia_total");
    obj.label10:setName("label10");
    obj.label10:setFontColor("black");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(435);
    obj.layout46:setTop(583);
    obj.layout46:setWidth(30);
    obj.layout46:setHeight(35);
    obj.layout46:setName("layout46");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout46);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(21);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(36);
    obj.edit36:setField("ba_distancia_classe");
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("black");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(472);
    obj.layout47:setTop(583);
    obj.layout47:setWidth(30);
    obj.layout47:setHeight(36);
    obj.layout47:setName("layout47");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout47);
    obj.label11:setFontSize(21);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("center");
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(30);
    obj.label11:setHeight(37);
    obj.label11:setField("ba_distancia_mod_destreza");
    obj.label11:setName("label11");
    obj.label11:setFontColor("black");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(510);
    obj.layout48:setTop(583);
    obj.layout48:setWidth(30);
    obj.layout48:setHeight(36);
    obj.layout48:setName("layout48");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout48);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(21);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(37);
    obj.edit37:setField("ba_distancia_item");
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("black");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(547);
    obj.layout49:setTop(583);
    obj.layout49:setWidth(30);
    obj.layout49:setHeight(36);
    obj.layout49:setName("layout49");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout49);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(21);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(37);
    obj.edit38:setField("ba_distancia_misc");
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("black");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(52);
    obj.layout50:setTop(651);
    obj.layout50:setWidth(141);
    obj.layout50:setHeight(26);
    obj.layout50:setName("layout50");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout50);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(14.2);
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(141);
    obj.edit39:setHeight(27);
    obj.edit39:setField("arma1");
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("black");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(201);
    obj.layout51:setTop(651);
    obj.layout51:setWidth(52);
    obj.layout51:setHeight(26);
    obj.layout51:setName("layout51");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout51);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(14.2);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(52);
    obj.edit40:setHeight(27);
    obj.edit40:setField("ataque1");
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("black");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(261);
    obj.layout52:setTop(650);
    obj.layout52:setWidth(52);
    obj.layout52:setHeight(26);
    obj.layout52:setName("layout52");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout52);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(14.2);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(52);
    obj.edit41:setHeight(27);
    obj.edit41:setField("dano1");
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("black");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(320);
    obj.layout53:setTop(650);
    obj.layout53:setWidth(39);
    obj.layout53:setHeight(26);
    obj.layout53:setName("layout53");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout53);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(10);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(39);
    obj.edit42:setHeight(27);
    obj.edit42:setField("tipo1");
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("black");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(367);
    obj.layout54:setTop(650);
    obj.layout54:setWidth(39);
    obj.layout54:setHeight(26);
    obj.layout54:setName("layout54");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout54);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(10);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(39);
    obj.edit43:setHeight(27);
    obj.edit43:setField("critico1");
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("black");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(416);
    obj.layout55:setTop(650);
    obj.layout55:setWidth(71);
    obj.layout55:setHeight(26);
    obj.layout55:setName("layout55");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout55);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(10);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(71);
    obj.edit44:setHeight(27);
    obj.edit44:setField("especial1");
    obj.edit44:setName("edit44");
    obj.edit44:setFontColor("black");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(494);
    obj.layout56:setTop(650);
    obj.layout56:setWidth(84);
    obj.layout56:setHeight(26);
    obj.layout56:setName("layout56");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout56);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(14.2);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(84);
    obj.edit45:setHeight(27);
    obj.edit45:setField("alcance1");
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("black");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(52);
    obj.layout57:setTop(678);
    obj.layout57:setWidth(141);
    obj.layout57:setHeight(26);
    obj.layout57:setName("layout57");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout57);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(14.2);
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(141);
    obj.edit46:setHeight(27);
    obj.edit46:setField("arma2");
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("black");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(201);
    obj.layout58:setTop(678);
    obj.layout58:setWidth(52);
    obj.layout58:setHeight(26);
    obj.layout58:setName("layout58");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout58);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(14.2);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(52);
    obj.edit47:setHeight(27);
    obj.edit47:setField("ataque2");
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("black");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(261);
    obj.layout59:setTop(678);
    obj.layout59:setWidth(53);
    obj.layout59:setHeight(26);
    obj.layout59:setName("layout59");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout59);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(14.2);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(53);
    obj.edit48:setHeight(27);
    obj.edit48:setField("dano2");
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("black");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(320);
    obj.layout60:setTop(678);
    obj.layout60:setWidth(39);
    obj.layout60:setHeight(26);
    obj.layout60:setName("layout60");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout60);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(10);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(39);
    obj.edit49:setHeight(27);
    obj.edit49:setField("tipo2");
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("black");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(367);
    obj.layout61:setTop(678);
    obj.layout61:setWidth(39);
    obj.layout61:setHeight(26);
    obj.layout61:setName("layout61");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout61);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(10);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(39);
    obj.edit50:setHeight(27);
    obj.edit50:setField("critico2");
    obj.edit50:setName("edit50");
    obj.edit50:setFontColor("black");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(416);
    obj.layout62:setTop(678);
    obj.layout62:setWidth(71);
    obj.layout62:setHeight(26);
    obj.layout62:setName("layout62");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout62);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(10);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(71);
    obj.edit51:setHeight(27);
    obj.edit51:setField("especial2");
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("black");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(494);
    obj.layout63:setTop(678);
    obj.layout63:setWidth(84);
    obj.layout63:setHeight(26);
    obj.layout63:setName("layout63");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout63);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(14.2);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(84);
    obj.edit52:setHeight(27);
    obj.edit52:setField("alcance2");
    obj.edit52:setName("edit52");
    obj.edit52:setFontColor("black");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(52);
    obj.layout64:setTop(705);
    obj.layout64:setWidth(141);
    obj.layout64:setHeight(26);
    obj.layout64:setName("layout64");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout64);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(14.2);
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(141);
    obj.edit53:setHeight(27);
    obj.edit53:setField("arma3");
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("black");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(201);
    obj.layout65:setTop(705);
    obj.layout65:setWidth(52);
    obj.layout65:setHeight(26);
    obj.layout65:setName("layout65");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout65);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(14.2);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(52);
    obj.edit54:setHeight(27);
    obj.edit54:setField("ataque3");
    obj.edit54:setName("edit54");
    obj.edit54:setFontColor("black");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(261);
    obj.layout66:setTop(705);
    obj.layout66:setWidth(53);
    obj.layout66:setHeight(26);
    obj.layout66:setName("layout66");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout66);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(14.2);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(53);
    obj.edit55:setHeight(27);
    obj.edit55:setField("dano3");
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("black");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(320);
    obj.layout67:setTop(705);
    obj.layout67:setWidth(39);
    obj.layout67:setHeight(26);
    obj.layout67:setName("layout67");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout67);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(10);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(39);
    obj.edit56:setHeight(27);
    obj.edit56:setField("tipo3");
    obj.edit56:setName("edit56");
    obj.edit56:setFontColor("black");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(367);
    obj.layout68:setTop(705);
    obj.layout68:setWidth(39);
    obj.layout68:setHeight(26);
    obj.layout68:setName("layout68");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout68);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(10);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(39);
    obj.edit57:setHeight(27);
    obj.edit57:setField("critico3");
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("black");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(416);
    obj.layout69:setTop(705);
    obj.layout69:setWidth(71);
    obj.layout69:setHeight(26);
    obj.layout69:setName("layout69");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout69);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(10);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(71);
    obj.edit58:setHeight(27);
    obj.edit58:setField("especial3");
    obj.edit58:setName("edit58");
    obj.edit58:setFontColor("black");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(494);
    obj.layout70:setTop(705);
    obj.layout70:setWidth(84);
    obj.layout70:setHeight(26);
    obj.layout70:setName("layout70");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout70);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(14.2);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(84);
    obj.edit59:setHeight(27);
    obj.edit59:setField("alcance3");
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("black");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(52);
    obj.layout71:setTop(733);
    obj.layout71:setWidth(141);
    obj.layout71:setHeight(26);
    obj.layout71:setName("layout71");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout71);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(14.2);
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(141);
    obj.edit60:setHeight(27);
    obj.edit60:setField("arma4");
    obj.edit60:setName("edit60");
    obj.edit60:setFontColor("black");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(201);
    obj.layout72:setTop(733);
    obj.layout72:setWidth(52);
    obj.layout72:setHeight(26);
    obj.layout72:setName("layout72");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout72);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(14.2);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(52);
    obj.edit61:setHeight(27);
    obj.edit61:setField("ataque4");
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("black");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(261);
    obj.layout73:setTop(732);
    obj.layout73:setWidth(53);
    obj.layout73:setHeight(26);
    obj.layout73:setName("layout73");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout73);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(14.2);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(53);
    obj.edit62:setHeight(27);
    obj.edit62:setField("dano4");
    obj.edit62:setName("edit62");
    obj.edit62:setFontColor("black");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(320);
    obj.layout74:setTop(732);
    obj.layout74:setWidth(39);
    obj.layout74:setHeight(26);
    obj.layout74:setName("layout74");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout74);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(10);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(39);
    obj.edit63:setHeight(27);
    obj.edit63:setField("tipo4");
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("black");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(367);
    obj.layout75:setTop(732);
    obj.layout75:setWidth(39);
    obj.layout75:setHeight(26);
    obj.layout75:setName("layout75");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout75);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(10);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(39);
    obj.edit64:setHeight(27);
    obj.edit64:setField("critico4");
    obj.edit64:setName("edit64");
    obj.edit64:setFontColor("black");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(416);
    obj.layout76:setTop(732);
    obj.layout76:setWidth(71);
    obj.layout76:setHeight(26);
    obj.layout76:setName("layout76");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout76);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(10);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(71);
    obj.edit65:setHeight(27);
    obj.edit65:setField("especial4");
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("black");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(494);
    obj.layout77:setTop(732);
    obj.layout77:setWidth(84);
    obj.layout77:setHeight(26);
    obj.layout77:setName("layout77");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout77);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(14.2);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(84);
    obj.edit66:setHeight(27);
    obj.edit66:setField("alcance4");
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("black");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(53);
    obj.layout78:setTop(799);
    obj.layout78:setWidth(238);
    obj.layout78:setHeight(23);
    obj.layout78:setName("layout78");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout78);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(14.2);
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(238);
    obj.edit67:setHeight(24);
    obj.edit67:setField("idiomas1");
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("black");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(53);
    obj.layout79:setTop(822);
    obj.layout79:setWidth(238);
    obj.layout79:setHeight(23);
    obj.layout79:setName("layout79");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout79);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(14.2);
    obj.edit68:setHorzTextAlign("leading");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(238);
    obj.edit68:setHeight(24);
    obj.edit68:setField("idiomas2");
    obj.edit68:setName("edit68");
    obj.edit68:setFontColor("black");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(372);
    obj.layout80:setTop(799);
    obj.layout80:setWidth(206);
    obj.layout80:setHeight(23);
    obj.layout80:setName("layout80");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout80);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(14.2);
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(206);
    obj.edit69:setHeight(24);
    obj.edit69:setField("xp_atual");
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("black");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(383);
    obj.layout81:setTop(822);
    obj.layout81:setWidth(194);
    obj.layout81:setHeight(23);
    obj.layout81:setName("layout81");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout81);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(14.2);
    obj.edit70:setHorzTextAlign("leading");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(194);
    obj.edit70:setHeight(24);
    obj.edit70:setField("xp_proximo_nivel");
    obj.edit70:setName("edit70");
    obj.edit70:setFontColor("black");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("forca");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("destreza");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("constituicao");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("inteligencia");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("sabedoria");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("carisma");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'ca_armadura', 'ca_escudo', 'ca_racial', 'ca_outro1', 'ca_outro2', 'ca_outro3'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'jp', 'constituicao', 'destreza', 'sabedoria'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'movimento_raca', 'movimento_carga', 'movimento_armadura'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'ba_cac_classe', 'ba_cac_mod_forca', 'ba_cac_item', 'ba_cac_misc'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'ba_distancia_classe', 'ba_distancia_mod_destreza', 'ba_distancia_item', 'ba_distancia_misc'});
    obj.dataLink11:setName("dataLink11");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.forca or 10) - 10) / 2)
            			if (mod >= 0) then
            				mod = "+"..mod
            			end
            			sheet.mod_forca = mod
            			sheet.ba_cac_mod_forca = mod
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.destreza or 10) - 10) / 2)
            			if (mod >= 0) then
            				mod = "+"..mod
            			end
            			sheet.mod_destreza = mod
            			sheet.ca_outro1 = mod
            			sheet.ba_distancia_mod_destreza = mod
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.constituicao or 10) - 10) / 2)
            			if (mod >= 0) then
            				mod = "+"..mod
            			end
            			sheet.mod_constituicao = mod
            			sheet.pv_bonus_con = mod
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local idiomas = math.floor((sheet.inteligencia or 10) / 6)
            			sheet.idiomas = idiomas
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.sabedoria or 10) - 10) / 2)
            			if (mod >= 0) then
            				mod = "+"..mod
            			end
            			sheet.mod_sabedoria = mod
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.carisma or 10) - 10) / 2)
            			if ((mod + 1) > 0) then
            				sheet.seguidores = (mod + 1)
            			else
            				sheet.seguidores = 0
            			end
            			sheet.ajuste_reacao = (mod * 5)
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local ca_base = 10
            			local ca_bonus = (sheet.ca_armadura or 0) + (sheet.ca_escudo or 0) + (sheet.ca_racial or 0) + (sheet.ca_outro1 or 0) + (sheet.ca_outro2 or 0) + (sheet.ca_outro3 or 0)
            			sheet.ca_total = ca_base + ca_bonus
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.jp_mod_constituicao = (sheet.jp or 0) - (sheet.mod_constituicao or 0)
            			sheet.jp_mod_destreza = (sheet.jp or 0) - (sheet.mod_destreza or 0)
            			sheet.jp_mod_sabedoria = (sheet.jp or 0) - (sheet.mod_sabedoria or 0)
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.movimento_total = (sheet.movimento_raca or 0) + (sheet.movimento_carga or 0) + (sheet.movimento_armadura or 0)
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ba_cac_total = (sheet.ba_cac_classe or 0) + (sheet.ba_cac_mod_forca or 0) + (sheet.ba_cac_item or 0) + (sheet.ba_cac_misc or 0)
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ba_distancia_total = (sheet.ba_distancia_classe or 0) + (sheet.ba_distancia_mod_destreza or 0) + (sheet.ba_distancia_item or 0) + (sheet.ba_distancia_misc or 0)
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmficha_od1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmficha_od1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmficha_od1_svg = {
    newEditor = newfrmficha_od1_svg, 
    new = newfrmficha_od1_svg, 
    name = "frmficha_od1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmficha_od1_svg = _frmficha_od1_svg;
Firecast.registrarForm(_frmficha_od1_svg);

return _frmficha_od1_svg;
