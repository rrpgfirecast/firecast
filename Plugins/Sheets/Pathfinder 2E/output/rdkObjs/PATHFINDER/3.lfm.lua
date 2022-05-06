require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPATHFINDER3_svg()
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
    obj:setName("frmPATHFINDER3_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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
    obj.image1:setSRC("/PATHFINDER/images/3.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(33);
    obj.image2:setTop(52);
    obj.image2:setWidth(300);
    obj.image2:setHeight(293);
    obj.image2:setField("RascunhodoPersonagem	");
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(346);
    obj.edit1:setTop(46);
    obj.edit1:setWidth(85);
    obj.edit1:setHeight(20);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(14);
    obj.edit1:setTransparent(true);
    obj.edit1:setField("Etnia");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(437);
    obj.edit2:setTop(46);
    obj.edit2:setWidth(85);
    obj.edit2:setHeight(20);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(14);
    obj.edit2:setTransparent(true);
    obj.edit2:setField("Nacionalidade");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(527);
    obj.edit3:setTop(46);
    obj.edit3:setWidth(105);
    obj.edit3:setHeight(20);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(14);
    obj.edit3:setTransparent(true);
    obj.edit3:setField("LocaldeNascimento");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(637);
    obj.edit4:setTop(46);
    obj.edit4:setWidth(38);
    obj.edit4:setHeight(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(14);
    obj.edit4:setTransparent(true);
    obj.edit4:setField("Idade");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(679);
    obj.edit5:setTop(46);
    obj.edit5:setWidth(106);
    obj.edit5:setHeight(20);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(14);
    obj.edit5:setTransparent(true);
    obj.edit5:setField("GeneroePronomes");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(789);
    obj.edit6:setTop(46);
    obj.edit6:setWidth(38);
    obj.edit6:setHeight(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(14);
    obj.edit6:setTransparent(true);
    obj.edit6:setField("Altura");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(832);
    obj.edit7:setTop(46);
    obj.edit7:setWidth(38);
    obj.edit7:setHeight(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(14);
    obj.edit7:setTransparent(true);
    obj.edit7:setField("Peso");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(346);
    obj.edit8:setTop(85);
    obj.edit8:setWidth(523);
    obj.edit8:setHeight(25);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(14);
    obj.edit8:setTransparent(true);
    obj.edit8:setField("Aparencia");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(346);
    obj.edit9:setTop(148);
    obj.edit9:setWidth(523);
    obj.edit9:setHeight(22);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(14);
    obj.edit9:setTransparent(true);
    obj.edit9:setField("Atitude");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(346);
    obj.edit10:setTop(193);
    obj.edit10:setWidth(523);
    obj.edit10:setHeight(28);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("black");
    obj.edit10:setFontSize(14);
    obj.edit10:setTransparent(true);
    obj.edit10:setField("Crencas");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(346);
    obj.edit11:setTop(242);
    obj.edit11:setWidth(265);
    obj.edit11:setHeight(40);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(14);
    obj.edit11:setTransparent(true);
    obj.edit11:setField("Gostos");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(620);
    obj.edit12:setTop(242);
    obj.edit12:setWidth(248);
    obj.edit12:setHeight(40);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("black");
    obj.edit12:setFontSize(14);
    obj.edit12:setTransparent(true);
    obj.edit12:setField("Aversoes");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setLeft(346);
    obj.edit13:setTop(300);
    obj.edit13:setWidth(523);
    obj.edit13:setHeight(45);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(14);
    obj.edit13:setTransparent(true);
    obj.edit13:setField("Bordoes");
    obj.edit13:setName("edit13");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(33);
    obj.textEditor1:setTop(400);
    obj.textEditor1:setWidth(413);
    obj.textEditor1:setHeight(190);
    obj.textEditor1:setTransparent(false);
    obj.textEditor1:setField("Anotacoes");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle1);
    obj.textEditor2:setLeft(460);
    obj.textEditor2:setTop(400);
    obj.textEditor2:setWidth(410);
    obj.textEditor2:setHeight(45);
    obj.textEditor2:setTransparent(false);
    obj.textEditor2:setField("Aliados");
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle1);
    obj.textEditor3:setLeft(460);
    obj.textEditor3:setTop(473);
    obj.textEditor3:setWidth(410);
    obj.textEditor3:setHeight(45);
    obj.textEditor3:setTransparent(false);
    obj.textEditor3:setField("Inimigos");
    obj.textEditor3:setName("textEditor3");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle1);
    obj.textEditor4:setLeft(460);
    obj.textEditor4:setTop(547);
    obj.textEditor4:setWidth(410);
    obj.textEditor4:setHeight(45);
    obj.textEditor4:setTransparent(false);
    obj.textEditor4:setField("Oranizacao");
    obj.textEditor4:setName("textEditor4");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setLeft(33);
    obj.edit14:setTop(643);
    obj.edit14:setWidth(145);
    obj.edit14:setHeight(20);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(14);
    obj.edit14:setTransparent(false);
    obj.edit14:setField("AcoesAtividadeNome1");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setLeft(182);
    obj.edit15:setTop(643);
    obj.edit15:setWidth(52);
    obj.edit15:setHeight(20);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(14);
    obj.edit15:setTransparent(false);
    obj.edit15:setField("AcoesAtividadeAcoes1");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setLeft(238);
    obj.edit16:setTop(643);
    obj.edit16:setWidth(153);
    obj.edit16:setHeight(20);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(14);
    obj.edit16:setTransparent(false);
    obj.edit16:setField("AcoesAtividadeTracos1");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setLeft(397);
    obj.edit17:setTop(643);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(20);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(14);
    obj.edit17:setTransparent(false);
    obj.edit17:setField("AcoesAtividadePagina1");
    obj.edit17:setName("edit17");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle1);
    obj.textEditor5:setLeft(33);
    obj.textEditor5:setTop(680);
    obj.textEditor5:setWidth(413);
    obj.textEditor5:setHeight(32);
    obj.textEditor5:setHorzTextAlign("center");
    obj.textEditor5:setFontColor("black");
    obj.textEditor5:setFontSize(14);
    obj.textEditor5:setTransparent(false);
    obj.textEditor5:setField("AcoesAtividadeDescricao1");
    obj.textEditor5:setName("textEditor5");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setLeft(33);
    obj.edit18:setTop(732);
    obj.edit18:setWidth(145);
    obj.edit18:setHeight(20);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(14);
    obj.edit18:setTransparent(false);
    obj.edit18:setField("AcoesAtividadeNome2");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setLeft(182);
    obj.edit19:setTop(732);
    obj.edit19:setWidth(52);
    obj.edit19:setHeight(20);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(14);
    obj.edit19:setTransparent(false);
    obj.edit19:setField("AcoesAtividadeAcoes2");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle1);
    obj.edit20:setLeft(238);
    obj.edit20:setTop(732);
    obj.edit20:setWidth(153);
    obj.edit20:setHeight(20);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(14);
    obj.edit20:setTransparent(false);
    obj.edit20:setField("AcoesAtividadeTracos2");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle1);
    obj.edit21:setLeft(397);
    obj.edit21:setTop(732);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(20);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(14);
    obj.edit21:setTransparent(false);
    obj.edit21:setField("AcoesAtividadePagina2");
    obj.edit21:setName("edit21");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle1);
    obj.textEditor6:setLeft(33);
    obj.textEditor6:setTop(769);
    obj.textEditor6:setWidth(413);
    obj.textEditor6:setHeight(32);
    obj.textEditor6:setHorzTextAlign("center");
    obj.textEditor6:setFontColor("black");
    obj.textEditor6:setFontSize(14);
    obj.textEditor6:setTransparent(false);
    obj.textEditor6:setField("AcoesAtividadeDescricao2");
    obj.textEditor6:setName("textEditor6");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle1);
    obj.edit22:setLeft(33);
    obj.edit22:setTop(820);
    obj.edit22:setWidth(145);
    obj.edit22:setHeight(20);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(14);
    obj.edit22:setTransparent(false);
    obj.edit22:setField("AcoesAtividadeNome3");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle1);
    obj.edit23:setLeft(182);
    obj.edit23:setTop(820);
    obj.edit23:setWidth(52);
    obj.edit23:setHeight(20);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(14);
    obj.edit23:setTransparent(false);
    obj.edit23:setField("AcoesAtividadeAcoes3");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setLeft(238);
    obj.edit24:setTop(820);
    obj.edit24:setWidth(153);
    obj.edit24:setHeight(20);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("black");
    obj.edit24:setFontSize(14);
    obj.edit24:setTransparent(false);
    obj.edit24:setField("AcoesAtividadeTracos3");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle1);
    obj.edit25:setLeft(397);
    obj.edit25:setTop(820);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(20);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(14);
    obj.edit25:setTransparent(false);
    obj.edit25:setField("AcoesAtividadePagina3");
    obj.edit25:setName("edit25");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle1);
    obj.textEditor7:setLeft(33);
    obj.textEditor7:setTop(857);
    obj.textEditor7:setWidth(413);
    obj.textEditor7:setHeight(32);
    obj.textEditor7:setHorzTextAlign("center");
    obj.textEditor7:setFontColor("black");
    obj.textEditor7:setFontSize(14);
    obj.textEditor7:setTransparent(false);
    obj.textEditor7:setField("AcoesAtividadeDescricao3");
    obj.textEditor7:setName("textEditor7");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle1);
    obj.edit26:setLeft(459);
    obj.edit26:setTop(643);
    obj.edit26:setWidth(145);
    obj.edit26:setHeight(20);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontColor("black");
    obj.edit26:setFontSize(14);
    obj.edit26:setTransparent(false);
    obj.edit26:setField("AcoesAtividadeNome4");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle1);
    obj.edit27:setLeft(607);
    obj.edit27:setTop(643);
    obj.edit27:setWidth(52);
    obj.edit27:setHeight(20);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(14);
    obj.edit27:setTransparent(false);
    obj.edit27:setField("AcoesAtividadeAcoes4");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle1);
    obj.edit28:setLeft(662);
    obj.edit28:setTop(643);
    obj.edit28:setWidth(153);
    obj.edit28:setHeight(20);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontColor("black");
    obj.edit28:setFontSize(14);
    obj.edit28:setTransparent(false);
    obj.edit28:setField("AcoesAtividadeTracos4");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle1);
    obj.edit29:setLeft(820);
    obj.edit29:setTop(643);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(20);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontColor("black");
    obj.edit29:setFontSize(14);
    obj.edit29:setTransparent(false);
    obj.edit29:setField("AcoesAtividadePagina4");
    obj.edit29:setName("edit29");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle1);
    obj.textEditor8:setLeft(459);
    obj.textEditor8:setTop(680);
    obj.textEditor8:setWidth(410);
    obj.textEditor8:setHeight(32);
    obj.textEditor8:setHorzTextAlign("center");
    obj.textEditor8:setFontColor("black");
    obj.textEditor8:setFontSize(14);
    obj.textEditor8:setTransparent(false);
    obj.textEditor8:setField("AcoesAtividadeDescricao4");
    obj.textEditor8:setName("textEditor8");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle1);
    obj.edit30:setLeft(459);
    obj.edit30:setTop(732);
    obj.edit30:setWidth(145);
    obj.edit30:setHeight(20);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontColor("black");
    obj.edit30:setFontSize(14);
    obj.edit30:setTransparent(false);
    obj.edit30:setField("AcoesAtividadeNome5");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle1);
    obj.edit31:setLeft(607);
    obj.edit31:setTop(732);
    obj.edit31:setWidth(52);
    obj.edit31:setHeight(20);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontColor("black");
    obj.edit31:setFontSize(14);
    obj.edit31:setTransparent(false);
    obj.edit31:setField("AcoesAtividadeAcoes5");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle1);
    obj.edit32:setLeft(662);
    obj.edit32:setTop(732);
    obj.edit32:setWidth(153);
    obj.edit32:setHeight(20);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontColor("black");
    obj.edit32:setFontSize(14);
    obj.edit32:setTransparent(false);
    obj.edit32:setField("AcoesAtividadeTracos5");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle1);
    obj.edit33:setLeft(820);
    obj.edit33:setTop(732);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(20);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontColor("black");
    obj.edit33:setFontSize(14);
    obj.edit33:setTransparent(false);
    obj.edit33:setField("AcoesAtividadePagina5");
    obj.edit33:setName("edit33");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle1);
    obj.textEditor9:setLeft(459);
    obj.textEditor9:setTop(769);
    obj.textEditor9:setWidth(410);
    obj.textEditor9:setHeight(32);
    obj.textEditor9:setHorzTextAlign("center");
    obj.textEditor9:setFontColor("black");
    obj.textEditor9:setFontSize(14);
    obj.textEditor9:setTransparent(false);
    obj.textEditor9:setField("AcoesAtividadeDescricao5");
    obj.textEditor9:setName("textEditor9");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle1);
    obj.edit34:setLeft(459);
    obj.edit34:setTop(820);
    obj.edit34:setWidth(145);
    obj.edit34:setHeight(20);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontColor("black");
    obj.edit34:setFontSize(14);
    obj.edit34:setTransparent(false);
    obj.edit34:setField("AcoesAtividadeNome6");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle1);
    obj.edit35:setLeft(607);
    obj.edit35:setTop(820);
    obj.edit35:setWidth(52);
    obj.edit35:setHeight(20);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontColor("black");
    obj.edit35:setFontSize(14);
    obj.edit35:setTransparent(false);
    obj.edit35:setField("AcoesAtividadeAcoes6");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle1);
    obj.edit36:setLeft(662);
    obj.edit36:setTop(820);
    obj.edit36:setWidth(153);
    obj.edit36:setHeight(20);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontColor("black");
    obj.edit36:setFontSize(14);
    obj.edit36:setTransparent(false);
    obj.edit36:setField("AcoesAtividadeTracos6");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle1);
    obj.edit37:setLeft(820);
    obj.edit37:setTop(820);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(20);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontColor("black");
    obj.edit37:setFontSize(14);
    obj.edit37:setTransparent(false);
    obj.edit37:setField("AcoesAtividadePagina6");
    obj.edit37:setName("edit37");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle1);
    obj.textEditor10:setLeft(459);
    obj.textEditor10:setTop(857);
    obj.textEditor10:setWidth(410);
    obj.textEditor10:setHeight(32);
    obj.textEditor10:setHorzTextAlign("center");
    obj.textEditor10:setFontColor("black");
    obj.textEditor10:setFontSize(14);
    obj.textEditor10:setTransparent(false);
    obj.textEditor10:setField("AcoesAtividadeDescricao6");
    obj.textEditor10:setName("textEditor10");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle1);
    obj.edit38:setLeft(33);
    obj.edit38:setTop(940);
    obj.edit38:setWidth(140);
    obj.edit38:setHeight(20);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontColor("black");
    obj.edit38:setFontSize(14);
    obj.edit38:setTransparent(true);
    obj.edit38:setField("AcoesLivresNome1");
    obj.edit38:setName("edit38");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle1);
    obj.checkBox1:setLeft(172);
    obj.checkBox1:setTop(927);
    obj.checkBox1:setField("chbAcoesLivres1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle1);
    obj.checkBox2:setLeft(172);
    obj.checkBox2:setTop(942);
    obj.checkBox2:setField("chbreacao1");
    obj.checkBox2:setName("checkBox2");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle1);
    obj.edit39:setLeft(238);
    obj.edit39:setTop(940);
    obj.edit39:setWidth(153);
    obj.edit39:setHeight(20);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontColor("black");
    obj.edit39:setFontSize(14);
    obj.edit39:setTransparent(true);
    obj.edit39:setField("AcoesLivresTracos1");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle1);
    obj.edit40:setLeft(397);
    obj.edit40:setTop(940);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(20);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontColor("black");
    obj.edit40:setFontSize(14);
    obj.edit40:setTransparent(true);
    obj.edit40:setField("AcoesLivresPagina1");
    obj.edit40:setName("edit40");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle1);
    obj.textEditor11:setLeft(33);
    obj.textEditor11:setTop(992);
    obj.textEditor11:setWidth(413);
    obj.textEditor11:setHeight(37);
    obj.textEditor11:setHorzTextAlign("center");
    obj.textEditor11:setFontColor("black");
    obj.textEditor11:setFontSize(14);
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setField("AcoesLivresDescricao1");
    obj.textEditor11:setName("textEditor11");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle1);
    obj.edit41:setLeft(33);
    obj.edit41:setTop(1050);
    obj.edit41:setWidth(140);
    obj.edit41:setHeight(20);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontColor("black");
    obj.edit41:setFontSize(14);
    obj.edit41:setTransparent(true);
    obj.edit41:setField("AcoesLivresNome2");
    obj.edit41:setName("edit41");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle1);
    obj.checkBox3:setLeft(172);
    obj.checkBox3:setTop(1037);
    obj.checkBox3:setField("chbAcoesLivres2");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle1);
    obj.checkBox4:setLeft(172);
    obj.checkBox4:setTop(1052);
    obj.checkBox4:setField("chbreacao2");
    obj.checkBox4:setName("checkBox4");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle1);
    obj.edit42:setLeft(238);
    obj.edit42:setTop(1050);
    obj.edit42:setWidth(153);
    obj.edit42:setHeight(20);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontColor("black");
    obj.edit42:setFontSize(14);
    obj.edit42:setTransparent(true);
    obj.edit42:setField("AcoesLivresTracos2");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle1);
    obj.edit43:setLeft(397);
    obj.edit43:setTop(1050);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(20);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontColor("black");
    obj.edit43:setFontSize(14);
    obj.edit43:setTransparent(true);
    obj.edit43:setField("AcoesLivresPagina2");
    obj.edit43:setName("edit43");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle1);
    obj.textEditor12:setLeft(33);
    obj.textEditor12:setTop(1102);
    obj.textEditor12:setWidth(413);
    obj.textEditor12:setHeight(37);
    obj.textEditor12:setHorzTextAlign("center");
    obj.textEditor12:setFontColor("black");
    obj.textEditor12:setFontSize(14);
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setField("AcoesLivresDescricao2");
    obj.textEditor12:setName("textEditor12");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle1);
    obj.edit44:setLeft(459);
    obj.edit44:setTop(940);
    obj.edit44:setWidth(140);
    obj.edit44:setHeight(20);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontColor("black");
    obj.edit44:setFontSize(14);
    obj.edit44:setTransparent(true);
    obj.edit44:setField("AcoesLivresNome3");
    obj.edit44:setName("edit44");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle1);
    obj.checkBox5:setLeft(598);
    obj.checkBox5:setTop(927);
    obj.checkBox5:setField("chbAcoesLivres3");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectangle1);
    obj.checkBox6:setLeft(598);
    obj.checkBox6:setTop(942);
    obj.checkBox6:setField("chbreacao3");
    obj.checkBox6:setName("checkBox6");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle1);
    obj.edit45:setLeft(664);
    obj.edit45:setTop(940);
    obj.edit45:setWidth(153);
    obj.edit45:setHeight(20);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontColor("black");
    obj.edit45:setFontSize(14);
    obj.edit45:setTransparent(true);
    obj.edit45:setField("AcoesLivresTracos3");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle1);
    obj.edit46:setLeft(822);
    obj.edit46:setTop(940);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(20);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontColor("black");
    obj.edit46:setFontSize(14);
    obj.edit46:setTransparent(true);
    obj.edit46:setField("AcoesLivresPagina3");
    obj.edit46:setName("edit46");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle1);
    obj.textEditor13:setLeft(459);
    obj.textEditor13:setTop(992);
    obj.textEditor13:setWidth(413);
    obj.textEditor13:setHeight(37);
    obj.textEditor13:setHorzTextAlign("center");
    obj.textEditor13:setFontColor("black");
    obj.textEditor13:setFontSize(14);
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setField("AcoesLivresDescricao3");
    obj.textEditor13:setName("textEditor13");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle1);
    obj.edit47:setLeft(459);
    obj.edit47:setTop(1050);
    obj.edit47:setWidth(140);
    obj.edit47:setHeight(20);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontColor("black");
    obj.edit47:setFontSize(14);
    obj.edit47:setTransparent(true);
    obj.edit47:setField("AcoesLivresNome4");
    obj.edit47:setName("edit47");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.rectangle1);
    obj.checkBox7:setLeft(598);
    obj.checkBox7:setTop(1037);
    obj.checkBox7:setField("chbAcoesLivres4");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.rectangle1);
    obj.checkBox8:setLeft(598);
    obj.checkBox8:setTop(1052);
    obj.checkBox8:setField("chbreacao4");
    obj.checkBox8:setName("checkBox8");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle1);
    obj.edit48:setLeft(664);
    obj.edit48:setTop(1050);
    obj.edit48:setWidth(153);
    obj.edit48:setHeight(20);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontColor("black");
    obj.edit48:setFontSize(14);
    obj.edit48:setTransparent(true);
    obj.edit48:setField("AcoesLivresTracos4");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle1);
    obj.edit49:setLeft(822);
    obj.edit49:setTop(1050);
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(20);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontColor("black");
    obj.edit49:setFontSize(14);
    obj.edit49:setTransparent(true);
    obj.edit49:setField("AcoesLivresPagina4");
    obj.edit49:setName("edit49");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.rectangle1);
    obj.textEditor14:setLeft(459);
    obj.textEditor14:setTop(1102);
    obj.textEditor14:setWidth(413);
    obj.textEditor14:setHeight(37);
    obj.textEditor14:setHorzTextAlign("center");
    obj.textEditor14:setFontColor("black");
    obj.textEditor14:setFontSize(14);
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setField("AcoesLivresDescricao4");
    obj.textEditor14:setName("textEditor14");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPATHFINDER3_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPATHFINDER3_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPATHFINDER3_svg = {
    newEditor = newfrmPATHFINDER3_svg, 
    new = newfrmPATHFINDER3_svg, 
    name = "frmPATHFINDER3_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPATHFINDER3_svg = _frmPATHFINDER3_svg;
Firecast.registrarForm(_frmPATHFINDER3_svg);

return _frmPATHFINDER3_svg;
