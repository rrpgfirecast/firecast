require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmEquipamentos()
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
    obj:setName("frmEquipamentos");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setHeight(900);
    obj.layout1:setWidth(1255);
    obj.layout1:setMargins({right=0});
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(175);
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(400);
    obj.layout2:setMargins({right=25});
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("Cabeça (Alto)");
    obj.label1:setAlign("top");
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(325);
    obj.layout3:setMargins({bottom=0});
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(50);
    obj.layout4:setMargins({bottom=0});
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(125);
    obj.layout5:setMargins({right=0});
    obj.layout5:setName("layout5");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setText("Nome");
    obj.label2:setWidth(125);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setTop(20);
    obj.edit1:setField("head1_nome");
    obj.edit1:setWidth(125);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(75);
    obj.layout6:setMargins({right=0});
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setText("Def");
    obj.label3:setWidth(75);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setTop(20);
    obj.edit2:setField("head1_def");
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(125);
    obj.layout7:setMargins({right=0});
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setText("Bônus");
    obj.label4:setWidth(125);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout7);
    obj.edit3:setTop(20);
    obj.edit3:setField("head1_bonus");
    obj.edit3:setWidth(125);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout3);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("head1_desc");
    obj.textEditor1:setName("textEditor1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(75);
    obj.layout8:setMargins({top=50});
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setWidth(75);
    obj.rectangle2:setHeight(100);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setWidth(75);
    obj.image1:setHeight(100);
    obj.image1:setField("head1_pic");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(400);
    obj.layout9:setMargins({right=25});
    obj.layout9:setName("layout9");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout9);
    obj.label5:setText("Cabeça (Meio)");
    obj.label5:setAlign("top");
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(325);
    obj.layout10:setMargins({bottom=0});
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(50);
    obj.layout11:setMargins({bottom=0});
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(125);
    obj.layout12:setMargins({right=0});
    obj.layout12:setName("layout12");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout12);
    obj.label6:setText("Nome");
    obj.label6:setWidth(125);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout12);
    obj.edit4:setTop(20);
    obj.edit4:setField("head2_nome");
    obj.edit4:setWidth(125);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(75);
    obj.layout13:setMargins({right=0});
    obj.layout13:setName("layout13");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout13);
    obj.label7:setText("Def");
    obj.label7:setWidth(75);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout13);
    obj.edit5:setTop(20);
    obj.edit5:setField("head2_def");
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(125);
    obj.layout14:setMargins({right=0});
    obj.layout14:setName("layout14");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout14);
    obj.label8:setText("Bônus");
    obj.label8:setWidth(125);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(13);
    obj.label8:setName("label8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout14);
    obj.edit6:setTop(20);
    obj.edit6:setField("head2_bonus");
    obj.edit6:setWidth(125);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout10);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("head2_desc");
    obj.textEditor2:setName("textEditor2");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout9);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(75);
    obj.layout15:setMargins({top=50});
    obj.layout15:setName("layout15");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout15);
    obj.rectangle3:setWidth(75);
    obj.rectangle3:setHeight(100);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle3);
    obj.image2:setWidth(75);
    obj.image2:setHeight(100);
    obj.image2:setField("head2_pic");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(400);
    obj.layout16:setMargins({right=25});
    obj.layout16:setName("layout16");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout16);
    obj.label9:setText("Cabeça (Baixo)");
    obj.label9:setAlign("top");
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(325);
    obj.layout17:setMargins({bottom=0});
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(50);
    obj.layout18:setMargins({bottom=0});
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(125);
    obj.layout19:setMargins({right=0});
    obj.layout19:setName("layout19");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout19);
    obj.label10:setText("Nome");
    obj.label10:setWidth(125);
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setFontSize(13);
    obj.label10:setName("label10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout19);
    obj.edit7:setTop(20);
    obj.edit7:setField("head3_nome");
    obj.edit7:setWidth(125);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(75);
    obj.layout20:setMargins({right=0});
    obj.layout20:setName("layout20");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout20);
    obj.label11:setText("Def");
    obj.label11:setWidth(75);
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setFontSize(13);
    obj.label11:setName("label11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout20);
    obj.edit8:setTop(20);
    obj.edit8:setField("head3_def");
    obj.edit8:setWidth(75);
    obj.edit8:setHeight(25);
    obj.edit8:setName("edit8");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(125);
    obj.layout21:setMargins({right=0});
    obj.layout21:setName("layout21");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout21);
    obj.label12:setText("Bônus");
    obj.label12:setWidth(125);
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setFontSize(13);
    obj.label12:setName("label12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout21);
    obj.edit9:setTop(20);
    obj.edit9:setField("head3_bonus");
    obj.edit9:setWidth(125);
    obj.edit9:setHeight(25);
    obj.edit9:setName("edit9");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout17);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("head3_desc");
    obj.textEditor3:setName("textEditor3");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout16);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(75);
    obj.layout22:setMargins({top=50});
    obj.layout22:setName("layout22");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout22);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setHeight(100);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle4);
    obj.image3:setWidth(75);
    obj.image3:setHeight(100);
    obj.image3:setField("head3_pic");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image3:setName("image3");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setHeight(175);
    obj.rectangle5:setMargins({bottom=5});
    obj.rectangle5:setName("rectangle5");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle5);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(400);
    obj.layout23:setMargins({right=25});
    obj.layout23:setName("layout23");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout23);
    obj.label13:setText("Mão Esquerda");
    obj.label13:setAlign("top");
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(325);
    obj.layout24:setMargins({bottom=0});
    obj.layout24:setName("layout24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(50);
    obj.layout25:setMargins({bottom=0});
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(125);
    obj.layout26:setMargins({right=0});
    obj.layout26:setName("layout26");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout26);
    obj.label14:setText("Nome");
    obj.label14:setWidth(125);
    obj.label14:setHorzTextAlign("leading");
    obj.label14:setFontSize(13);
    obj.label14:setName("label14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout26);
    obj.edit10:setTop(20);
    obj.edit10:setField("left_nome");
    obj.edit10:setWidth(125);
    obj.edit10:setHeight(25);
    obj.edit10:setName("edit10");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(75);
    obj.layout27:setMargins({right=0});
    obj.layout27:setName("layout27");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout27);
    obj.label15:setText("Dano/Def");
    obj.label15:setWidth(75);
    obj.label15:setHorzTextAlign("leading");
    obj.label15:setFontSize(13);
    obj.label15:setName("label15");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout27);
    obj.edit11:setTop(20);
    obj.edit11:setField("left_def");
    obj.edit11:setWidth(75);
    obj.edit11:setHeight(25);
    obj.edit11:setName("edit11");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(125);
    obj.layout28:setMargins({right=0});
    obj.layout28:setName("layout28");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout28);
    obj.label16:setText("Intensidade/Bônus");
    obj.label16:setWidth(125);
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout28);
    obj.edit12:setTop(20);
    obj.edit12:setField("left_bonus");
    obj.edit12:setWidth(125);
    obj.edit12:setHeight(25);
    obj.edit12:setName("edit12");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout24);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("left_desc");
    obj.textEditor4:setName("textEditor4");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout23);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(75);
    obj.layout29:setMargins({top=50});
    obj.layout29:setName("layout29");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout29);
    obj.rectangle6:setWidth(75);
    obj.rectangle6:setHeight(100);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle6);
    obj.image4:setWidth(75);
    obj.image4:setHeight(100);
    obj.image4:setField("left_pic");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image4:setName("image4");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle5);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(400);
    obj.layout30:setMargins({right=25});
    obj.layout30:setName("layout30");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout30);
    obj.label17:setText("Armadura");
    obj.label17:setAlign("top");
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(325);
    obj.layout31:setMargins({bottom=0});
    obj.layout31:setName("layout31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(50);
    obj.layout32:setMargins({bottom=0});
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(125);
    obj.layout33:setMargins({right=0});
    obj.layout33:setName("layout33");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout33);
    obj.label18:setText("Nome");
    obj.label18:setWidth(125);
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout33);
    obj.edit13:setTop(20);
    obj.edit13:setField("armor_nome");
    obj.edit13:setWidth(125);
    obj.edit13:setHeight(25);
    obj.edit13:setName("edit13");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout32);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(75);
    obj.layout34:setMargins({right=0});
    obj.layout34:setName("layout34");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout34);
    obj.label19:setText("Def");
    obj.label19:setWidth(75);
    obj.label19:setHorzTextAlign("leading");
    obj.label19:setFontSize(13);
    obj.label19:setName("label19");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout34);
    obj.edit14:setTop(20);
    obj.edit14:setField("armor_def");
    obj.edit14:setWidth(75);
    obj.edit14:setHeight(25);
    obj.edit14:setName("edit14");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout32);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(125);
    obj.layout35:setMargins({right=0});
    obj.layout35:setName("layout35");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout35);
    obj.label20:setText("Bônus");
    obj.label20:setWidth(125);
    obj.label20:setHorzTextAlign("leading");
    obj.label20:setFontSize(13);
    obj.label20:setName("label20");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout35);
    obj.edit15:setTop(20);
    obj.edit15:setField("armor_bonus");
    obj.edit15:setWidth(125);
    obj.edit15:setHeight(25);
    obj.edit15:setName("edit15");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout31);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("armor_desc");
    obj.textEditor5:setName("textEditor5");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout30);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(75);
    obj.layout36:setMargins({top=50});
    obj.layout36:setName("layout36");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout36);
    obj.rectangle7:setWidth(75);
    obj.rectangle7:setHeight(100);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle7);
    obj.image5:setWidth(75);
    obj.image5:setHeight(100);
    obj.image5:setField("armor_pic");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image5:setName("image5");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle5);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(400);
    obj.layout37:setMargins({right=25});
    obj.layout37:setName("layout37");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout37);
    obj.label21:setText("Mão Direita");
    obj.label21:setAlign("top");
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(325);
    obj.layout38:setMargins({bottom=0});
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(50);
    obj.layout39:setMargins({bottom=0});
    obj.layout39:setName("layout39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(125);
    obj.layout40:setMargins({right=0});
    obj.layout40:setName("layout40");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout40);
    obj.label22:setText("Nome");
    obj.label22:setWidth(125);
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setFontSize(13);
    obj.label22:setName("label22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout40);
    obj.edit16:setTop(20);
    obj.edit16:setField("right_nome");
    obj.edit16:setWidth(125);
    obj.edit16:setHeight(25);
    obj.edit16:setName("edit16");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout39);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(75);
    obj.layout41:setMargins({right=0});
    obj.layout41:setName("layout41");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout41);
    obj.label23:setText("Dano/Def");
    obj.label23:setWidth(75);
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setFontSize(13);
    obj.label23:setName("label23");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout41);
    obj.edit17:setTop(20);
    obj.edit17:setField("right_def");
    obj.edit17:setWidth(75);
    obj.edit17:setHeight(25);
    obj.edit17:setName("edit17");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout39);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(125);
    obj.layout42:setMargins({right=0});
    obj.layout42:setName("layout42");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout42);
    obj.label24:setText("Intensidade/Bônus");
    obj.label24:setWidth(125);
    obj.label24:setHorzTextAlign("leading");
    obj.label24:setFontSize(13);
    obj.label24:setName("label24");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout42);
    obj.edit18:setTop(20);
    obj.edit18:setField("right_bonus");
    obj.edit18:setWidth(125);
    obj.edit18:setHeight(25);
    obj.edit18:setName("edit18");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout38);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("right_desc");
    obj.textEditor6:setName("textEditor6");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout37);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(75);
    obj.layout43:setMargins({top=50});
    obj.layout43:setName("layout43");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout43);
    obj.rectangle8:setWidth(75);
    obj.rectangle8:setHeight(100);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle8);
    obj.image6:setWidth(75);
    obj.image6:setHeight(100);
    obj.image6:setField("right_pic");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image6:setName("image6");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setAlign("top");
    obj.rectangle9:setHeight(175);
    obj.rectangle9:setMargins({bottom=5});
    obj.rectangle9:setName("rectangle9");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle9);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(400);
    obj.layout44:setMargins({right=25});
    obj.layout44:setName("layout44");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout44);
    obj.label25:setText("Capa");
    obj.label25:setAlign("top");
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(325);
    obj.layout45:setMargins({bottom=0});
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(50);
    obj.layout46:setMargins({bottom=0});
    obj.layout46:setName("layout46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(125);
    obj.layout47:setMargins({right=0});
    obj.layout47:setName("layout47");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout47);
    obj.label26:setText("Nome");
    obj.label26:setWidth(125);
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setFontSize(13);
    obj.label26:setName("label26");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout47);
    obj.edit19:setTop(20);
    obj.edit19:setField("garmel_nome");
    obj.edit19:setWidth(125);
    obj.edit19:setHeight(25);
    obj.edit19:setName("edit19");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(75);
    obj.layout48:setMargins({right=0});
    obj.layout48:setName("layout48");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout48);
    obj.label27:setText("Def");
    obj.label27:setWidth(75);
    obj.label27:setHorzTextAlign("leading");
    obj.label27:setFontSize(13);
    obj.label27:setName("label27");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout48);
    obj.edit20:setTop(20);
    obj.edit20:setField("garmel_def");
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setName("edit20");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout46);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(125);
    obj.layout49:setMargins({right=0});
    obj.layout49:setName("layout49");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout49);
    obj.label28:setText("Bônus");
    obj.label28:setWidth(125);
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setFontSize(13);
    obj.label28:setName("label28");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout49);
    obj.edit21:setTop(20);
    obj.edit21:setField("garmel_bonus");
    obj.edit21:setWidth(125);
    obj.edit21:setHeight(25);
    obj.edit21:setName("edit21");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout45);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("garmel_desc");
    obj.textEditor7:setName("textEditor7");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout44);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(75);
    obj.layout50:setMargins({top=50});
    obj.layout50:setName("layout50");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout50);
    obj.rectangle10:setWidth(75);
    obj.rectangle10:setHeight(100);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle10);
    obj.image7:setWidth(75);
    obj.image7:setHeight(100);
    obj.image7:setField("garmel_pic");
    obj.image7:setEditable(true);
    obj.image7:setStyle("autoFit");
    obj.image7:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image7:setName("image7");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle9);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(400);
    obj.layout51:setMargins({right=25});
    obj.layout51:setName("layout51");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout51);
    obj.label29:setText("Bota");
    obj.label29:setAlign("top");
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(325);
    obj.layout52:setMargins({bottom=0});
    obj.layout52:setName("layout52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(50);
    obj.layout53:setMargins({bottom=0});
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(125);
    obj.layout54:setMargins({right=0});
    obj.layout54:setName("layout54");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout54);
    obj.label30:setText("Nome");
    obj.label30:setWidth(125);
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setFontSize(13);
    obj.label30:setName("label30");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout54);
    obj.edit22:setTop(20);
    obj.edit22:setField("bota_nome");
    obj.edit22:setWidth(125);
    obj.edit22:setHeight(25);
    obj.edit22:setName("edit22");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout53);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(75);
    obj.layout55:setMargins({right=0});
    obj.layout55:setName("layout55");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout55);
    obj.label31:setText("Def");
    obj.label31:setWidth(75);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setFontSize(13);
    obj.label31:setName("label31");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout55);
    obj.edit23:setTop(20);
    obj.edit23:setField("bota_def");
    obj.edit23:setWidth(75);
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout53);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(125);
    obj.layout56:setMargins({right=0});
    obj.layout56:setName("layout56");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout56);
    obj.label32:setText("Bônus");
    obj.label32:setWidth(125);
    obj.label32:setHorzTextAlign("leading");
    obj.label32:setFontSize(13);
    obj.label32:setName("label32");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout56);
    obj.edit24:setTop(20);
    obj.edit24:setField("bota_bonus");
    obj.edit24:setWidth(125);
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout52);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("bota_desc");
    obj.textEditor8:setName("textEditor8");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout51);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(75);
    obj.layout57:setMargins({top=50});
    obj.layout57:setName("layout57");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout57);
    obj.rectangle11:setWidth(75);
    obj.rectangle11:setHeight(100);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.rectangle11);
    obj.image8:setWidth(75);
    obj.image8:setHeight(100);
    obj.image8:setField("bota_pic");
    obj.image8:setEditable(true);
    obj.image8:setStyle("autoFit");
    obj.image8:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image8:setName("image8");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle9);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(400);
    obj.layout58:setMargins({right=25});
    obj.layout58:setName("layout58");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout58);
    obj.label33:setText("Acessório");
    obj.label33:setAlign("top");
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout58);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(325);
    obj.layout59:setMargins({bottom=0});
    obj.layout59:setName("layout59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(50);
    obj.layout60:setMargins({bottom=0});
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(125);
    obj.layout61:setMargins({right=0});
    obj.layout61:setName("layout61");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout61);
    obj.label34:setText("Nome");
    obj.label34:setWidth(125);
    obj.label34:setHorzTextAlign("leading");
    obj.label34:setFontSize(13);
    obj.label34:setName("label34");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout61);
    obj.edit25:setTop(20);
    obj.edit25:setField("acessorio1_nome");
    obj.edit25:setWidth(125);
    obj.edit25:setHeight(25);
    obj.edit25:setName("edit25");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(75);
    obj.layout62:setMargins({right=0});
    obj.layout62:setName("layout62");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout62);
    obj.label35:setText("Def");
    obj.label35:setWidth(75);
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setFontSize(13);
    obj.label35:setName("label35");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout62);
    obj.edit26:setTop(20);
    obj.edit26:setField("acessorio1_def");
    obj.edit26:setWidth(75);
    obj.edit26:setHeight(25);
    obj.edit26:setName("edit26");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(125);
    obj.layout63:setMargins({right=0});
    obj.layout63:setName("layout63");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout63);
    obj.label36:setText("Bônus");
    obj.label36:setWidth(125);
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setFontSize(13);
    obj.label36:setName("label36");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout63);
    obj.edit27:setTop(20);
    obj.edit27:setField("acessorio1_bonus");
    obj.edit27:setWidth(125);
    obj.edit27:setHeight(25);
    obj.edit27:setName("edit27");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout59);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("acessorio1_desc");
    obj.textEditor9:setName("textEditor9");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout58);
    obj.layout64:setAlign("left");
    obj.layout64:setWidth(75);
    obj.layout64:setMargins({top=50});
    obj.layout64:setName("layout64");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout64);
    obj.rectangle12:setWidth(75);
    obj.rectangle12:setHeight(100);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.rectangle12);
    obj.image9:setWidth(75);
    obj.image9:setHeight(100);
    obj.image9:setField("acessorio1_pic");
    obj.image9:setEditable(true);
    obj.image9:setStyle("autoFit");
    obj.image9:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image9:setName("image9");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout1);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(175);
    obj.rectangle13:setMargins({bottom=5});
    obj.rectangle13:setName("rectangle13");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle13);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(400);
    obj.layout65:setMargins({right=25});
    obj.layout65:setName("layout65");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout65);
    obj.label37:setText("Acessório");
    obj.label37:setAlign("top");
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(325);
    obj.layout66:setMargins({bottom=0});
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(50);
    obj.layout67:setMargins({bottom=0});
    obj.layout67:setName("layout67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(125);
    obj.layout68:setMargins({right=0});
    obj.layout68:setName("layout68");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout68);
    obj.label38:setText("Nome");
    obj.label38:setWidth(125);
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout68);
    obj.edit28:setTop(20);
    obj.edit28:setField("acessorio2_nome");
    obj.edit28:setWidth(125);
    obj.edit28:setHeight(25);
    obj.edit28:setName("edit28");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(75);
    obj.layout69:setMargins({right=0});
    obj.layout69:setName("layout69");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout69);
    obj.label39:setText("Def");
    obj.label39:setWidth(75);
    obj.label39:setHorzTextAlign("leading");
    obj.label39:setFontSize(13);
    obj.label39:setName("label39");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout69);
    obj.edit29:setTop(20);
    obj.edit29:setField("acessorio2_def");
    obj.edit29:setWidth(75);
    obj.edit29:setHeight(25);
    obj.edit29:setName("edit29");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout67);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(125);
    obj.layout70:setMargins({right=0});
    obj.layout70:setName("layout70");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout70);
    obj.label40:setText("Bônus");
    obj.label40:setWidth(125);
    obj.label40:setHorzTextAlign("leading");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout70);
    obj.edit30:setTop(20);
    obj.edit30:setField("acessorio2_bonus");
    obj.edit30:setWidth(125);
    obj.edit30:setHeight(25);
    obj.edit30:setName("edit30");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout66);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("acessorio2_desc");
    obj.textEditor10:setName("textEditor10");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout65);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(75);
    obj.layout71:setMargins({top=50});
    obj.layout71:setName("layout71");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout71);
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(100);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle14);
    obj.image10:setWidth(75);
    obj.image10:setHeight(100);
    obj.image10:setField("acessorio2_pic");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image10:setName("image10");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle13);
    obj.layout72:setAlign("left");
    obj.layout72:setWidth(400);
    obj.layout72:setMargins({right=25});
    obj.layout72:setName("layout72");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout72);
    obj.label41:setText("Itens");
    obj.label41:setAlign("top");
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout72);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("itens_desc");
    obj.textEditor11:setName("textEditor11");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle13);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(400);
    obj.layout73:setMargins({right=25});
    obj.layout73:setName("layout73");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout73);
    obj.label42:setText("Acessório");
    obj.label42:setAlign("top");
    obj.label42:setHeight(25);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout73);
    obj.layout74:setAlign("left");
    obj.layout74:setWidth(325);
    obj.layout74:setMargins({bottom=0});
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(50);
    obj.layout75:setMargins({bottom=0});
    obj.layout75:setName("layout75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(125);
    obj.layout76:setMargins({right=0});
    obj.layout76:setName("layout76");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout76);
    obj.label43:setText("Nome");
    obj.label43:setWidth(125);
    obj.label43:setHorzTextAlign("leading");
    obj.label43:setFontSize(13);
    obj.label43:setName("label43");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout76);
    obj.edit31:setTop(20);
    obj.edit31:setField("acessorio3_nome");
    obj.edit31:setWidth(125);
    obj.edit31:setHeight(25);
    obj.edit31:setName("edit31");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout75);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(75);
    obj.layout77:setMargins({right=0});
    obj.layout77:setName("layout77");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout77);
    obj.label44:setText("Def");
    obj.label44:setWidth(75);
    obj.label44:setHorzTextAlign("leading");
    obj.label44:setFontSize(13);
    obj.label44:setName("label44");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout77);
    obj.edit32:setTop(20);
    obj.edit32:setField("acessorio3_def");
    obj.edit32:setWidth(75);
    obj.edit32:setHeight(25);
    obj.edit32:setName("edit32");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout75);
    obj.layout78:setAlign("left");
    obj.layout78:setWidth(125);
    obj.layout78:setMargins({right=0});
    obj.layout78:setName("layout78");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout78);
    obj.label45:setText("Bônus");
    obj.label45:setWidth(125);
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setFontSize(13);
    obj.label45:setName("label45");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout78);
    obj.edit33:setTop(20);
    obj.edit33:setField("acessorio3_bonus");
    obj.edit33:setWidth(125);
    obj.edit33:setHeight(25);
    obj.edit33:setName("edit33");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout74);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("acessorio3_desc");
    obj.textEditor12:setName("textEditor12");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout73);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(75);
    obj.layout79:setMargins({top=50});
    obj.layout79:setName("layout79");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout79);
    obj.rectangle15:setWidth(75);
    obj.rectangle15:setHeight(100);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle15);
    obj.image11:setWidth(75);
    obj.image11:setHeight(100);
    obj.image11:setField("acessorio3_pic");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image11:setName("image11");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout1);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setHeight(175);
    obj.rectangle16:setMargins({bottom=5});
    obj.rectangle16:setName("rectangle16");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle16);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(600);
    obj.layout80:setMargins({right=37.5});
    obj.layout80:setName("layout80");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout80);
    obj.label46:setText("Orbs");
    obj.label46:setAlign("top");
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout80);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("orbs_desc");
    obj.textEditor13:setName("textEditor13");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle16);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(600);
    obj.layout81:setMargins({right=37.5});
    obj.layout81:setName("layout81");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout81);
    obj.label47:setText("Clã");
    obj.label47:setAlign("top");
    obj.label47:setHeight(25);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout81);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setField("cla_desc");
    obj.textEditor14:setName("textEditor14");

    obj._e_event0 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head1_pic);
        end, obj);

    obj._e_event1 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head2_pic);
        end, obj);

    obj._e_event2 = obj.image3:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head3_pic);
        end, obj);

    obj._e_event3 = obj.image4:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.left_pic);
        end, obj);

    obj._e_event4 = obj.image5:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.armor_pic);
        end, obj);

    obj._e_event5 = obj.image6:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.right_pic);
        end, obj);

    obj._e_event6 = obj.image7:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.garmel_pic);
        end, obj);

    obj._e_event7 = obj.image8:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.bota_pic);
        end, obj);

    obj._e_event8 = obj.image9:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio1_pic);
        end, obj);

    obj._e_event9 = obj.image10:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio2_pic);
        end, obj);

    obj._e_event10 = obj.image11:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio3_pic);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmEquipamentos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmEquipamentos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmEquipamentos = {
    newEditor = newfrmEquipamentos, 
    new = newfrmEquipamentos, 
    name = "frmEquipamentos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEquipamentos = _frmEquipamentos;
Firecast.registrarForm(_frmEquipamentos);

return _frmEquipamentos;
