require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLH4()
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
    obj:setName("frmLH4");
    obj:setTheme("dark");
    obj:setWidth(710);
    obj:setPadding({left=4, top=4, right=4, bottom=4});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(800);
    obj.scrollBox1:setWidth(700);
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(350);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("grey");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(350);
    obj.rectangle1:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setText("Adicionar Kenjutsu");
    obj.button1:setWidth(270);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclListaDosKenjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKenjutsus:setParent(obj.rectangle1);
    obj.rclListaDosKenjutsus:setName("rclListaDosKenjutsus");
    obj.rclListaDosKenjutsus:setField("campoDosKenjutsus");
    obj.rclListaDosKenjutsus:setTemplateForm("frmLH4_1");
    obj.rclListaDosKenjutsus:setAlign("client");
    obj.rclListaDosKenjutsus:setHeight(300);
    obj.rclListaDosKenjutsus:setSelectable(true);

    obj.boxDetalhesDoKenjutsu = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoKenjutsu:setParent(obj.rectangle1);
    obj.boxDetalhesDoKenjutsu:setName("boxDetalhesDoKenjutsu");
    obj.boxDetalhesDoKenjutsu:setVisible(false);
    obj.boxDetalhesDoKenjutsu:setAlign("right");
    obj.boxDetalhesDoKenjutsu:setWidth(400);
    obj.boxDetalhesDoKenjutsu:setMargins({left=4, right=4});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoKenjutsu);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(300);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("left");
    obj.label1:setText("Jutsu");
    obj.label1:setWidth(100);
    obj.label1:setAutoSize(true);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoKenjutsu");
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({bottom=4});
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setText("Gasto");
    obj.label2:setWidth(100);
    obj.label2:setAutoSize(true);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("campoGasto");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({bottom=4});
    obj.layout5:setName("layout5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setAlign("left");
    obj.label3:setText("Quantidade");
    obj.label3:setWidth(100);
    obj.label3:setAutoSize(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setAlign("client");
    obj.edit3:setField("campoQuantidade");
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4});
    obj.layout6:setName("layout6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout6);
    obj.label4:setAlign("left");
    obj.label4:setText("Alcance");
    obj.label4:setWidth(100);
    obj.label4:setAutoSize(true);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setAlign("client");
    obj.edit4:setField("campoAlcance");
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setMargins({bottom=4});
    obj.layout7:setName("layout7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout7);
    obj.label5:setAlign("left");
    obj.label5:setText("Tempo");
    obj.label5:setWidth(100);
    obj.label5:setAutoSize(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setAlign("client");
    obj.edit5:setField("campoTempo");
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(110);
    obj.layout8:setName("layout8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("client");
    obj.layout9:setMargins({left=2});
    obj.layout9:setName("layout9");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout9);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setHeight(150);
    obj.textEditor1:setName("textEditor1");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(350);
    obj.layout10:setMargins({bottom=4});
    obj.layout10:setName("layout10");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout10);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setHeight(350);
    obj.rectangle3:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle3:setName("rectangle3");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle3);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(30);
    obj.layout11:setMargins({bottom=4});
    obj.layout11:setName("layout11");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout11);
    obj.button2:setText("Adicionar Kuchyose");
    obj.button2:setWidth(270);
    obj.button2:setAlign("left");
    obj.button2:setName("button2");

    obj.rclListaDosKuchyoses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.rectangle3);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("campoDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH4_2");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(300);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.boxDetalhesDoKuchyose = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoKuchyose:setParent(obj.rectangle3);
    obj.boxDetalhesDoKuchyose:setName("boxDetalhesDoKuchyose");
    obj.boxDetalhesDoKuchyose:setVisible(false);
    obj.boxDetalhesDoKuchyose:setAlign("right");
    obj.boxDetalhesDoKuchyose:setWidth(400);
    obj.boxDetalhesDoKuchyose:setMargins({left=4, right=4});

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.boxDetalhesDoKuchyose);
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setHeight(300);
    obj.rectangle4:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle4:setName("rectangle4");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle4);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(30);
    obj.layout12:setMargins({bottom=4});
    obj.layout12:setName("layout12");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout12);
    obj.label6:setAlign("left");
    obj.label6:setText("Jutsu");
    obj.label6:setWidth(100);
    obj.label6:setAutoSize(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout12);
    obj.edit6:setAlign("client");
    obj.edit6:setField("campoKuchyose");
    obj.edit6:setName("edit6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle4);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(30);
    obj.layout13:setMargins({bottom=4});
    obj.layout13:setName("layout13");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout13);
    obj.label7:setAlign("left");
    obj.label7:setText("Gasto");
    obj.label7:setWidth(100);
    obj.label7:setAutoSize(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout13);
    obj.edit7:setAlign("client");
    obj.edit7:setField("campoGasto");
    obj.edit7:setName("edit7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle4);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(30);
    obj.layout14:setMargins({bottom=4});
    obj.layout14:setName("layout14");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout14);
    obj.label8:setAlign("left");
    obj.label8:setText("Quantidade");
    obj.label8:setWidth(100);
    obj.label8:setAutoSize(true);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout14);
    obj.edit8:setAlign("client");
    obj.edit8:setField("campoQuantidade");
    obj.edit8:setName("edit8");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle4);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(30);
    obj.layout15:setMargins({bottom=4});
    obj.layout15:setName("layout15");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout15);
    obj.label9:setAlign("left");
    obj.label9:setText("Alcance");
    obj.label9:setWidth(100);
    obj.label9:setAutoSize(true);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout15);
    obj.edit9:setAlign("client");
    obj.edit9:setField("campoAlcance");
    obj.edit9:setName("edit9");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle4);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(30);
    obj.layout16:setMargins({bottom=4});
    obj.layout16:setName("layout16");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout16);
    obj.label10:setAlign("left");
    obj.label10:setText("Tempo");
    obj.label10:setWidth(100);
    obj.label10:setAutoSize(true);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout16);
    obj.edit10:setAlign("client");
    obj.edit10:setField("campoTempo");
    obj.edit10:setName("edit10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle4);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(110);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("client");
    obj.layout18:setMargins({left=2});
    obj.layout18:setName("layout18");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout18);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setField("campoTextoGrande");
    obj.textEditor2:setHeight(150);
    obj.textEditor2:setName("textEditor2");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(350);
    obj.layout19:setMargins({bottom=4});
    obj.layout19:setName("layout19");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout19);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setColor("grey");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setHeight(350);
    obj.rectangle5:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle5:setName("rectangle5");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle5);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(30);
    obj.layout20:setMargins({bottom=4});
    obj.layout20:setName("layout20");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout20);
    obj.button3:setText("Adicionar Estilo de Luta");
    obj.button3:setWidth(270);
    obj.button3:setAlign("left");
    obj.button3:setName("button3");

    obj.rclListaDosEstLutas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.rectangle5);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("campoDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH2_3");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(300);
    obj.rclListaDosEstLutas:setSelectable(true);

    obj.boxDetalhesDoEstLuta = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoEstLuta:setParent(obj.rectangle5);
    obj.boxDetalhesDoEstLuta:setName("boxDetalhesDoEstLuta");
    obj.boxDetalhesDoEstLuta:setVisible(false);
    obj.boxDetalhesDoEstLuta:setAlign("right");
    obj.boxDetalhesDoEstLuta:setWidth(400);
    obj.boxDetalhesDoEstLuta:setMargins({left=4, right=4});

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.boxDetalhesDoEstLuta);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setHeight(300);
    obj.rectangle6:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle6:setName("rectangle6");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle6);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(30);
    obj.layout21:setMargins({bottom=4});
    obj.layout21:setName("layout21");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout21);
    obj.label11:setAlign("left");
    obj.label11:setText("Nome");
    obj.label11:setWidth(100);
    obj.label11:setAutoSize(true);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout21);
    obj.edit11:setAlign("client");
    obj.edit11:setField("campoEstLuta");
    obj.edit11:setName("edit11");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle6);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(30);
    obj.layout22:setMargins({bottom=4});
    obj.layout22:setName("layout22");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout22);
    obj.label12:setAlign("left");
    obj.label12:setText("Gasto");
    obj.label12:setWidth(100);
    obj.label12:setAutoSize(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout22);
    obj.edit12:setAlign("client");
    obj.edit12:setField("campoGasto");
    obj.edit12:setName("edit12");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle6);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(30);
    obj.layout23:setMargins({bottom=4});
    obj.layout23:setName("layout23");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout23);
    obj.label13:setAlign("left");
    obj.label13:setText("Quantidade");
    obj.label13:setWidth(100);
    obj.label13:setAutoSize(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout23);
    obj.edit13:setAlign("client");
    obj.edit13:setField("campoQuantidade");
    obj.edit13:setName("edit13");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle6);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(30);
    obj.layout24:setMargins({bottom=4});
    obj.layout24:setName("layout24");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout24);
    obj.label14:setAlign("left");
    obj.label14:setText("Alcance");
    obj.label14:setWidth(100);
    obj.label14:setAutoSize(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout24);
    obj.edit14:setAlign("client");
    obj.edit14:setField("campoAlcance");
    obj.edit14:setName("edit14");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle6);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(30);
    obj.layout25:setMargins({bottom=4});
    obj.layout25:setName("layout25");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout25);
    obj.label15:setAlign("left");
    obj.label15:setText("Tempo");
    obj.label15:setWidth(100);
    obj.label15:setAutoSize(true);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout25);
    obj.edit15:setAlign("client");
    obj.edit15:setField("campoTempo");
    obj.edit15:setName("edit15");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle6);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(110);
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setAlign("client");
    obj.layout27:setMargins({left=2});
    obj.layout27:setName("layout27");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout27);
    obj.textEditor3:setAlign("top");
    obj.textEditor3:setField("campoTextoGrande");
    obj.textEditor3:setHeight(150);
    obj.textEditor3:setName("textEditor3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                    -- Vamos inserir um novo item no nosso recordList                              
                                    self.rclListaDosKenjutsus:append();
        end, obj);

    obj._e_event1 = obj.rclListaDosKenjutsus:addEventListener("onSelect",
        function (_)
            --[[
                                Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                                --]]                      
                                local node = self.rclListaDosKenjutsus.selectedNode;  
                                self.boxDetalhesDoKenjutsu.node = node;                       
                                -- a caixa de detalhe só ficará visível se houver item selecionado
                                self.boxDetalhesDoKenjutsu.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosKuchyoses:append();
        end, obj);

    obj._e_event3 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (_)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosKuchyoses.selectedNode;  
                        self.boxDetalhesDoKuchyose.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoKuchyose.visible = (node ~= nil);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosEstLutas:append();
        end, obj);

    obj._e_event5 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (_)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosEstLutas.selectedNode;  
                        self.boxDetalhesDoEstLuta.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoEstLuta.visible = (node ~= nil);
        end, obj);

    function obj:_releaseEvents()
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
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rclListaDosKenjutsus ~= nil then self.rclListaDosKenjutsus:destroy(); self.rclListaDosKenjutsus = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.boxDetalhesDoEstLuta ~= nil then self.boxDetalhesDoEstLuta:destroy(); self.boxDetalhesDoEstLuta = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.boxDetalhesDoKuchyose ~= nil then self.boxDetalhesDoKuchyose:destroy(); self.boxDetalhesDoKuchyose = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.boxDetalhesDoKenjutsu ~= nil then self.boxDetalhesDoKenjutsu:destroy(); self.boxDetalhesDoKenjutsu = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLH4()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLH4();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLH4 = {
    newEditor = newfrmLH4, 
    new = newfrmLH4, 
    name = "frmLH4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH4 = _frmLH4;
Firecast.registrarForm(_frmLH4);

return _frmLH4;
