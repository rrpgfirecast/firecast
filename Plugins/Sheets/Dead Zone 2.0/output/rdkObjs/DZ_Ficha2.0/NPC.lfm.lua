require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDZ_NPC_svg()
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
    obj:setName("frmDZ_NPC_svg");
    obj:setPadding({left=4, top=4, right=4, bottom=4});
    obj:setHeight(600);
    obj:setWidth(1200);
    obj:setTheme("light");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Adicionar");
    obj.button1:setWidth(120);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");
    obj.button1:setFontColor("#000000");
    obj.button1:setFontSize(20);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setVertTextAlign("center");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setFontFamily("kalam");

    obj.rclListaNPC = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaNPC:setParent(obj);
    obj.rclListaNPC:setName("rclListaNPC");
    obj.rclListaNPC:setField("ListagemNPC");
    obj.rclListaNPC:setTemplateForm("frmListaNPC");
    obj.rclListaNPC:setAlign("client");
    obj.rclListaNPC:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(900);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoItem);
    obj.rectangle1:setWidth(900);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("Transparent");
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(600);
    obj.image1:setHeight(600);
    obj.image1:setSRC("/DZ_Ficha2.0/images/FichaNPC.png");
    obj.image1:setStyle("proportional");
    obj.image1:setOptimize(true);
    obj.image1:setAlign("left");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setWidth(300);
    obj.image2:setHeight(600);
    obj.image2:setSRC("/DZ_Ficha2.0/images/silhu.png");
    obj.image2:setStyle("proportional");
    obj.image2:setEditable(true);
    obj.image2:setShowProgress(true);
    obj.image2:setOptimize(true);
    obj.image2:setHint("O ideal é: 300x600 em png");
    obj.image2:setAlign("right");
    obj.image2:setField("NpcII");
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(28);
    obj.edit1:setLeft(125);
    obj.edit1:setTop(20);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(50);
    obj.edit1:setField("NPC_nick");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("leading");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontFamily("kalam");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(30);
    obj.edit2:setLeft(500);
    obj.edit2:setTop(20);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(50);
    obj.edit2:setField("NPC_idade");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("leading");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontFamily("kalam");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setTransparent(true);
    obj.edit3:setLeft(146);
    obj.edit3:setTop(80);
    obj.edit3:setWidth(25);
    obj.edit3:setHeight(30);
    obj.edit3:setField("NPC_fisico");
    obj.edit3:setVertTextAlign("leading");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#C0504D");
    obj.edit3:setFontSize(15);
    obj.edit3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setFontFamily("kalam");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setTransparent(true);
    obj.edit4:setLeft(146);
    obj.edit4:setTop(105);
    obj.edit4:setWidth(25);
    obj.edit4:setHeight(30);
    obj.edit4:setField("NPC_social");
    obj.edit4:setVertTextAlign("leading");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#C0504D");
    obj.edit4:setFontSize(15);
    obj.edit4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setFontFamily("kalam");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setTransparent(true);
    obj.edit5:setLeft(146);
    obj.edit5:setTop(130);
    obj.edit5:setWidth(25);
    obj.edit5:setHeight(30);
    obj.edit5:setField("NPC_mental");
    obj.edit5:setVertTextAlign("leading");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#C0504D");
    obj.edit5:setFontSize(15);
    obj.edit5:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setFontFamily("kalam");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setTransparent(true);
    obj.edit6:setLeft(146);
    obj.edit6:setTop(155);
    obj.edit6:setWidth(25);
    obj.edit6:setHeight(30);
    obj.edit6:setField("NPC_espiritual");
    obj.edit6:setVertTextAlign("leading");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#C0504D");
    obj.edit6:setFontSize(15);
    obj.edit6:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setFontFamily("kalam");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setTransparent(true);
    obj.edit7:setLeft(275);
    obj.edit7:setTop(75);
    obj.edit7:setWidth(25);
    obj.edit7:setHeight(30);
    obj.edit7:setField("NPC_P1");
    obj.edit7:setVertTextAlign("leading");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#C0504D");
    obj.edit7:setFontSize(15);
    obj.edit7:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setFontFamily("kalam");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setTransparent(true);
    obj.edit8:setLeft(275);
    obj.edit8:setTop(96);
    obj.edit8:setWidth(25);
    obj.edit8:setHeight(30);
    obj.edit8:setField("NPC_P2");
    obj.edit8:setVertTextAlign("leading");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("#C0504D");
    obj.edit8:setFontSize(15);
    obj.edit8:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setFontFamily("kalam");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setTransparent(true);
    obj.edit9:setLeft(275);
    obj.edit9:setTop(117);
    obj.edit9:setWidth(25);
    obj.edit9:setHeight(30);
    obj.edit9:setField("NPC_P3");
    obj.edit9:setVertTextAlign("leading");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("#C0504D");
    obj.edit9:setFontSize(15);
    obj.edit9:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setFontFamily("kalam");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setTransparent(true);
    obj.edit10:setLeft(275);
    obj.edit10:setTop(138);
    obj.edit10:setWidth(25);
    obj.edit10:setHeight(30);
    obj.edit10:setField("NPC_P4");
    obj.edit10:setVertTextAlign("leading");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("#C0504D");
    obj.edit10:setFontSize(15);
    obj.edit10:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setFontFamily("kalam");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setTransparent(true);
    obj.edit11:setLeft(275);
    obj.edit11:setTop(159);
    obj.edit11:setWidth(25);
    obj.edit11:setHeight(30);
    obj.edit11:setField("NPC_P5");
    obj.edit11:setVertTextAlign("leading");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#C0504D");
    obj.edit11:setFontSize(15);
    obj.edit11:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setFontFamily("kalam");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setTransparent(true);
    obj.edit12:setLeft(275);
    obj.edit12:setTop(182);
    obj.edit12:setWidth(25);
    obj.edit12:setHeight(30);
    obj.edit12:setField("NPC_P6");
    obj.edit12:setVertTextAlign("leading");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("#C0504D");
    obj.edit12:setFontSize(15);
    obj.edit12:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setFontFamily("kalam");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setTransparent(true);
    obj.edit13:setLeft(275);
    obj.edit13:setTop(205);
    obj.edit13:setWidth(25);
    obj.edit13:setHeight(30);
    obj.edit13:setField("NPC_P7");
    obj.edit13:setVertTextAlign("leading");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#C0504D");
    obj.edit13:setFontSize(15);
    obj.edit13:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setFontFamily("kalam");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setTransparent(true);
    obj.edit14:setLeft(275);
    obj.edit14:setTop(225);
    obj.edit14:setWidth(25);
    obj.edit14:setHeight(30);
    obj.edit14:setField("NPC_P8");
    obj.edit14:setVertTextAlign("leading");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("#C0504D");
    obj.edit14:setFontSize(15);
    obj.edit14:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setFontFamily("kalam");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setTransparent(true);
    obj.edit15:setLeft(275);
    obj.edit15:setTop(250);
    obj.edit15:setWidth(25);
    obj.edit15:setHeight(30);
    obj.edit15:setField("NPC_P9");
    obj.edit15:setVertTextAlign("leading");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("#C0504D");
    obj.edit15:setFontSize(15);
    obj.edit15:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setFontFamily("kalam");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setTransparent(true);
    obj.edit16:setLeft(275);
    obj.edit16:setTop(275);
    obj.edit16:setWidth(25);
    obj.edit16:setHeight(30);
    obj.edit16:setField("NPC_P10");
    obj.edit16:setVertTextAlign("leading");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("#C0504D");
    obj.edit16:setFontSize(15);
    obj.edit16:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setFontFamily("kalam");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setTransparent(true);
    obj.edit17:setLeft(315);
    obj.edit17:setTop(100);
    obj.edit17:setWidth(25);
    obj.edit17:setHeight(30);
    obj.edit17:setField("NPC_Saude1");
    obj.edit17:setVertTextAlign("leading");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("#C0504D");
    obj.edit17:setFontSize(15);
    obj.edit17:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setFontFamily("kalam");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setTransparent(true);
    obj.edit18:setLeft(340);
    obj.edit18:setTop(100);
    obj.edit18:setWidth(25);
    obj.edit18:setHeight(30);
    obj.edit18:setField("NPC_Saude2");
    obj.edit18:setVertTextAlign("leading");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("#C0504D");
    obj.edit18:setFontSize(15);
    obj.edit18:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setFontFamily("kalam");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setTransparent(true);
    obj.edit19:setLeft(365);
    obj.edit19:setTop(100);
    obj.edit19:setWidth(25);
    obj.edit19:setHeight(30);
    obj.edit19:setField("NPC_Saude3");
    obj.edit19:setVertTextAlign("leading");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("#C0504D");
    obj.edit19:setFontSize(15);
    obj.edit19:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setFontFamily("kalam");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle1);
    obj.edit20:setTransparent(true);
    obj.edit20:setLeft(508);
    obj.edit20:setTop(74);
    obj.edit20:setWidth(25);
    obj.edit20:setHeight(30);
    obj.edit20:setField("NPC_Moralidade");
    obj.edit20:setVertTextAlign("leading");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("#C0504D");
    obj.edit20:setFontSize(15);
    obj.edit20:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setFontFamily("kalam");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(420);
    obj.comboBox1:setTop(100);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("NPC_MoralidadeS");
    obj.comboBox1:setItems({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', 'Santo'});
    obj.comboBox1:setValues({'Se', 'Eg', 'Mo', 'Ho', 'Sa'});
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("#C0504D");
    obj.comboBox1:setFontSize(15);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setVertTextAlign("center");
    lfm_setPropAsString(obj.comboBox1, "fontStyle",  "bold");
    obj.comboBox1:setFontFamily("kalam");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle1);
    obj.edit21:setTransparent(true);
    obj.edit21:setLeft(128);
    obj.edit21:setTop(218);
    obj.edit21:setWidth(25);
    obj.edit21:setHeight(30);
    obj.edit21:setField("NPC_Iniciativa");
    obj.edit21:setVertTextAlign("leading");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("#C0504D");
    obj.edit21:setFontSize(15);
    obj.edit21:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setFontFamily("kalam");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle1);
    obj.edit22:setTransparent(true);
    obj.edit22:setLeft(128);
    obj.edit22:setTop(251);
    obj.edit22:setWidth(25);
    obj.edit22:setHeight(30);
    obj.edit22:setField("NPC_Imunidade");
    obj.edit22:setVertTextAlign("leading");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("#C0504D");
    obj.edit22:setFontSize(15);
    obj.edit22:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setFontFamily("kalam");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle1);
    obj.edit23:setTransparent(true);
    obj.edit23:setLeft(100);
    obj.edit23:setTop(290);
    obj.edit23:setWidth(25);
    obj.edit23:setHeight(30);
    obj.edit23:setField("NPC_ATK");
    obj.edit23:setVertTextAlign("leading");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("#C0504D");
    obj.edit23:setFontSize(15);
    obj.edit23:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");
    obj.edit23:setFontFamily("kalam");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setTransparent(true);
    obj.edit24:setLeft(55);
    obj.edit24:setTop(315);
    obj.edit24:setWidth(25);
    obj.edit24:setHeight(30);
    obj.edit24:setField("NPC_ATK1");
    obj.edit24:setVertTextAlign("leading");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("#C0504D");
    obj.edit24:setFontSize(15);
    obj.edit24:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setFontFamily("kalam");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle1);
    obj.edit25:setTransparent(true);
    obj.edit25:setLeft(125);
    obj.edit25:setTop(315);
    obj.edit25:setWidth(25);
    obj.edit25:setHeight(30);
    obj.edit25:setField("NPC_ATK2");
    obj.edit25:setVertTextAlign("leading");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("#C0504D");
    obj.edit25:setFontSize(15);
    obj.edit25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setFontFamily("kalam");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle1);
    obj.edit26:setTransparent(true);
    obj.edit26:setLeft(190);
    obj.edit26:setTop(315);
    obj.edit26:setWidth(25);
    obj.edit26:setHeight(30);
    obj.edit26:setField("NPC_ATK3");
    obj.edit26:setVertTextAlign("leading");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("#C0504D");
    obj.edit26:setFontSize(15);
    obj.edit26:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");
    obj.edit26:setFontFamily("kalam");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle1);
    obj.edit27:setTransparent(true);
    obj.edit27:setLeft(185);
    obj.edit27:setTop(420);
    obj.edit27:setWidth(25);
    obj.edit27:setHeight(30);
    obj.edit27:setField("NPC_DEF");
    obj.edit27:setVertTextAlign("leading");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#C0504D");
    obj.edit27:setFontSize(15);
    obj.edit27:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");
    obj.edit27:setFontFamily("kalam");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle1);
    obj.edit28:setTransparent(true);
    obj.edit28:setLeft(55);
    obj.edit28:setTop(445);
    obj.edit28:setWidth(25);
    obj.edit28:setHeight(30);
    obj.edit28:setField("NPC_DEF1");
    obj.edit28:setVertTextAlign("leading");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("#C0504D");
    obj.edit28:setFontSize(15);
    obj.edit28:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");
    obj.edit28:setFontFamily("kalam");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle1);
    obj.edit29:setTransparent(true);
    obj.edit29:setLeft(125);
    obj.edit29:setTop(445);
    obj.edit29:setWidth(25);
    obj.edit29:setHeight(30);
    obj.edit29:setField("NPC_DEF2");
    obj.edit29:setVertTextAlign("leading");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#C0504D");
    obj.edit29:setFontSize(15);
    obj.edit29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit29, "fontStyle",  "bold");
    obj.edit29:setFontFamily("kalam");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle1);
    obj.edit30:setTransparent(true);
    obj.edit30:setLeft(190);
    obj.edit30:setTop(445);
    obj.edit30:setWidth(25);
    obj.edit30:setHeight(30);
    obj.edit30:setField("NPC_DEF3");
    obj.edit30:setVertTextAlign("leading");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("#C0504D");
    obj.edit30:setFontSize(15);
    obj.edit30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "bold");
    obj.edit30:setFontFamily("kalam");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(40);
    obj.layout2:setTop(350);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(75);
    obj.layout2:setName("layout2");

    obj.NPC_DescATK = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescATK:setParent(obj.layout2);
    obj.NPC_DescATK:setName("NPC_DescATK");
    obj.NPC_DescATK:setFontFamily("kalam");
    obj.NPC_DescATK:setWidth(200);
    obj.NPC_DescATK:setHeight(75);
    obj.NPC_DescATK:setFontSize(13);
    obj.NPC_DescATK:setFontColor("#548DD4");
    obj.NPC_DescATK:setField("NPC_DescATK");
    obj.NPC_DescATK:setTransparent(true);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(40);
    obj.layout3:setTop(480);
    obj.layout3:setWidth(220);
    obj.layout3:setHeight(60);
    obj.layout3:setName("layout3");

    obj.NPC_DescDEF = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescDEF:setParent(obj.layout3);
    obj.NPC_DescDEF:setName("NPC_DescDEF");
    obj.NPC_DescDEF:setFontFamily("kalam");
    obj.NPC_DescDEF:setWidth(220);
    obj.NPC_DescDEF:setHeight(60);
    obj.NPC_DescDEF:setFontSize(13);
    obj.NPC_DescDEF:setFontColor("#548DD4");
    obj.NPC_DescDEF:setField("NPC_DescDEF");
    obj.NPC_DescDEF:setTransparent(true);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(315);
    obj.layout4:setTop(159);
    obj.layout4:setWidth(230);
    obj.layout4:setHeight(150);
    obj.layout4:setName("layout4");

    obj.NPC_Equip = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Equip:setParent(obj.layout4);
    obj.NPC_Equip:setName("NPC_Equip");
    obj.NPC_Equip:setFontFamily("kalam");
    obj.NPC_Equip:setWidth(230);
    obj.NPC_Equip:setHeight(150);
    obj.NPC_Equip:setFontSize(13);
    obj.NPC_Equip:setFontColor("#548DD4");
    obj.NPC_Equip:setField("NPC_Equip");
    obj.NPC_Equip:setTransparent(true);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(275);
    obj.layout5:setTop(355);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(1800);
    obj.layout5:setName("layout5");

    obj.NPC_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Circunstancia:setParent(obj.layout5);
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
            self.rclListaNPC:append();
        end, obj);

    obj._e_event1 = obj.rclListaNPC:addEventListener("onSelect",
        function (_)
            local node = self.rclListaNPC.selectedNode; 
                                     self.boxDetalhesDoItem.node = node;                       
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.NPC_Circunstancia ~= nil then self.NPC_Circunstancia:destroy(); self.NPC_Circunstancia = nil; end;
        if self.NPC_DescATK ~= nil then self.NPC_DescATK:destroy(); self.NPC_DescATK = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.rclListaNPC ~= nil then self.rclListaNPC:destroy(); self.rclListaNPC = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.NPC_DescDEF ~= nil then self.NPC_DescDEF:destroy(); self.NPC_DescDEF = nil; end;
        if self.NPC_Equip ~= nil then self.NPC_Equip:destroy(); self.NPC_Equip = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDZ_NPC_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDZ_NPC_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDZ_NPC_svg = {
    newEditor = newfrmDZ_NPC_svg, 
    new = newfrmDZ_NPC_svg, 
    name = "frmDZ_NPC_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDZ_NPC_svg = _frmDZ_NPC_svg;
Firecast.registrarForm(_frmDZ_NPC_svg);

return _frmDZ_NPC_svg;
