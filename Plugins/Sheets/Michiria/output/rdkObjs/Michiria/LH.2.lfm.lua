require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLH2()
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
    obj:setName("frmLH2");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function selectDetalheNode(node, lista)
            if node==nil then return end

            local listas = {"rclListaDosGenjutsus", "rclListaDosNinjutsus", "rclListaDosBasicos", "rclListaDosClans", "rclListaDosKekkeis", "rclListaDosPassivos", "rclListaDosKuchyoses", "rclListaDosEstLutas", "rclListaDasTransformacoes", "rclListaDosTaijutsus", "rclListaDosEspeciais", "rclListaDosEspeciais2", "rclListaDosPassivosNobres", "rclListaDosOutros", "rclListaDosOutros2"}

            for i=1, #listas, 1 do
                if listas[i] ~= lista then
                    local rcl = self:findControlByName(listas[i]);
                    if rcl~=nil then 
                        rcl.selectedNode = nil 
                    else
                        --showMessage(listas[i] .. " was null.")
                    end
                elseif listas[i]==lista then
                    --showMessage(lista .. " was ignored.")
                end
            end               
            self.boxDetalhesDoJutsu.node = node; 
        end
    


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(205);
    obj.layout1:setName("layout1");

    obj.boxDetalhesDoJutsu = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoJutsu:setParent(obj.layout1);
    obj.boxDetalhesDoJutsu:setName("boxDetalhesDoJutsu");
    obj.boxDetalhesDoJutsu:setVisible(true);
    obj.boxDetalhesDoJutsu:setAlign("left");
    obj.boxDetalhesDoJutsu:setWidth(600);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoJutsu);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(205);
    obj.rectangle1:setWidth(590);
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(200);
    obj.layout2:setMargins({bottom=4, top=4, left=4, right=4});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({left=2});
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("top");
    obj.label1:setText("Descrição");
    obj.label1:setHeight(30);
    obj.label1:setAutoSize(true);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.DescJutsu = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.DescJutsu:setParent(obj.layout3);
    obj.DescJutsu:setAlign("top");
    obj.DescJutsu:setName("DescJutsu");
    obj.DescJutsu:setField("campoTextoGrande2");
    obj.DescJutsu:setHeight(150);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setAlign("top");
    obj.button1:setText("Copiar informações (Ctrl+C)");
    obj.button1:setHeight(30);
    obj.button1:setName("button1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(380);
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({bottom=4, top=4 ,right=4});
    obj.layout5:setName("layout5");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome");
    obj.label2:setWidth(100);
    obj.label2:setAutoSize(true);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoJutsu");
    obj.edit1:setName("edit1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4, right=4});
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setAlign("left");
    obj.label3:setText("Gasto");
    obj.label3:setWidth(100);
    obj.label3:setAutoSize(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setAlign("client");
    obj.edit2:setField("campoGasto");
    obj.edit2:setName("edit2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setMargins({bottom=4, right=4});
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("left");
    obj.label4:setText("Quantidade");
    obj.label4:setWidth(100);
    obj.label4:setAutoSize(true);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout7);
    obj.edit3:setAlign("client");
    obj.edit3:setField("campoQuantidade");
    obj.edit3:setName("edit3");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(30);
    obj.layout8:setMargins({bottom=4, right=4});
    obj.layout8:setName("layout8");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setAlign("left");
    obj.label5:setText("Alcance");
    obj.label5:setWidth(100);
    obj.label5:setAutoSize(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setAlign("client");
    obj.edit4:setField("campoAlcance");
    obj.edit4:setName("edit4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(30);
    obj.layout9:setMargins({bottom=4, right=4});
    obj.layout9:setName("layout9");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout9);
    obj.label6:setAlign("left");
    obj.label6:setText("Tempo");
    obj.label6:setWidth(100);
    obj.label6:setAutoSize(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout9);
    obj.edit5:setAlign("client");
    obj.edit5:setField("campoTempo");
    obj.edit5:setName("edit5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout4);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(30);
    obj.layout10:setMargins({bottom=4, right=4});
    obj.layout10:setName("layout10");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout10);
    obj.label7:setAlign("left");
    obj.label7:setText("Dano");
    obj.label7:setWidth(100);
    obj.label7:setAutoSize(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setAlign("client");
    obj.edit6:setField("campoDano");
    obj.edit6:setName("edit6");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(200);
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(200);
    obj.layout12:setName("layout12");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout12);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setColor("grey");
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout13);
    obj.button2:setText("Adicionar Ninjutsu");
    obj.button2:setWidth(200);
    obj.button2:setAlign("client");
    obj.button2:setMargins({left=2, right=2});
    obj.button2:setName("button2");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(170);
    obj.layout14:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout14:setName("layout14");

    obj.rclListaDosNinjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosNinjutsus:setParent(obj.layout14);
    obj.rclListaDosNinjutsus:setName("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setField("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosNinjutsus:setAlign("client");
    obj.rclListaDosNinjutsus:setHeight(200);
    obj.rclListaDosNinjutsus:setSelectable(true);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(200);
    obj.layout15:setName("layout15");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout15);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle3);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout16);
    obj.button3:setText("Adicionar Genjutsu");
    obj.button3:setWidth(200);
    obj.button3:setAlign("client");
    obj.button3:setMargins({left=2, right=2});
    obj.button3:setName("button3");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle3);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(170);
    obj.layout17:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout17:setName("layout17");

    obj.rclListaDosGenjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosGenjutsus:setParent(obj.layout17);
    obj.rclListaDosGenjutsus:setName("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setField("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosGenjutsus:setAlign("client");
    obj.rclListaDosGenjutsus:setHeight(200);
    obj.rclListaDosGenjutsus:setSelectable(true);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout11);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(200);
    obj.layout18:setName("layout18");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout18);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setColor("grey");
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle4);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout19);
    obj.button4:setText("Adicionar Taijutsu");
    obj.button4:setWidth(200);
    obj.button4:setAlign("client");
    obj.button4:setMargins({left=2, right=2});
    obj.button4:setName("button4");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle4);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(170);
    obj.layout20:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout20:setName("layout20");

    obj.rclListaDosTaijutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTaijutsus:setParent(obj.layout20);
    obj.rclListaDosTaijutsus:setName("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setField("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosTaijutsus:setAlign("client");
    obj.rclListaDosTaijutsus:setHeight(200);
    obj.rclListaDosTaijutsus:setSelectable(true);

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout11);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(200);
    obj.layout21:setName("layout21");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout21);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setColor("grey");
    obj.rectangle5:setWidth(200);
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle5);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(30);
    obj.layout22:setName("layout22");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout22);
    obj.button5:setText("Adicionar Especial");
    obj.button5:setWidth(200);
    obj.button5:setAlign("client");
    obj.button5:setMargins({left=2, right=2});
    obj.button5:setName("button5");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle5);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(170);
    obj.layout23:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout23:setName("layout23");

    obj.rclListaDosEspeciais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEspeciais:setParent(obj.layout23);
    obj.rclListaDosEspeciais:setName("rclListaDosEspeciais");
    obj.rclListaDosEspeciais:setField("rclListaDosEspeciais");
    obj.rclListaDosEspeciais:setTemplateForm("frmLH2_1");
    obj.rclListaDosEspeciais:setAlign("client");
    obj.rclListaDosEspeciais:setHeight(200);
    obj.rclListaDosEspeciais:setSelectable(true);

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout11);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(200);
    obj.layout24:setName("layout24");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout24);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setColor("grey");
    obj.rectangle6:setWidth(200);
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle6);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(30);
    obj.layout25:setName("layout25");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout25);
    obj.button6:setText("Adicionar Especial 2");
    obj.button6:setWidth(200);
    obj.button6:setAlign("client");
    obj.button6:setMargins({left=2, right=2});
    obj.button6:setName("button6");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle6);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(170);
    obj.layout26:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout26:setName("layout26");

    obj.rclListaDosEspeciais2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEspeciais2:setParent(obj.layout26);
    obj.rclListaDosEspeciais2:setName("rclListaDosEspeciais2");
    obj.rclListaDosEspeciais2:setField("rclListaDosEspeciais2");
    obj.rclListaDosEspeciais2:setTemplateForm("frmLH2_1");
    obj.rclListaDosEspeciais2:setAlign("client");
    obj.rclListaDosEspeciais2:setHeight(200);
    obj.rclListaDosEspeciais2:setSelectable(true);

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(200);
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(200);
    obj.layout28:setName("layout28");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout28);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setColor("grey");
    obj.rectangle7:setWidth(200);
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle7);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(30);
    obj.layout29:setName("layout29");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout29);
    obj.button7:setText("Adicionar Básicos");
    obj.button7:setWidth(200);
    obj.button7:setAlign("client");
    obj.button7:setMargins({left=2, right=2});
    obj.button7:setName("button7");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle7);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(170);
    obj.layout30:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout30:setName("layout30");

    obj.rclListaDosBasicos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosBasicos:setParent(obj.layout30);
    obj.rclListaDosBasicos:setName("rclListaDosBasicos");
    obj.rclListaDosBasicos:setField("rclListaDosBasicos");
    obj.rclListaDosBasicos:setTemplateForm("frmLH2_1");
    obj.rclListaDosBasicos:setAlign("client");
    obj.rclListaDosBasicos:setHeight(200);
    obj.rclListaDosBasicos:setSelectable(true);

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(200);
    obj.layout31:setName("layout31");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout31);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setColor("grey");
    obj.rectangle8:setWidth(200);
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle8);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(30);
    obj.layout32:setName("layout32");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout32);
    obj.button8:setText("Adicionar Jutsu do Clan");
    obj.button8:setWidth(200);
    obj.button8:setAlign("client");
    obj.button8:setMargins({left=2, right=2});
    obj.button8:setName("button8");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle8);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(170);
    obj.layout33:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout33:setName("layout33");

    obj.rclListaDosClans = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosClans:setParent(obj.layout33);
    obj.rclListaDosClans:setName("rclListaDosClans");
    obj.rclListaDosClans:setField("rclListaDosClans");
    obj.rclListaDosClans:setTemplateForm("frmLH2_1");
    obj.rclListaDosClans:setAlign("client");
    obj.rclListaDosClans:setHeight(200);
    obj.rclListaDosClans:setSelectable(true);

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout27);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(200);
    obj.layout34:setName("layout34");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout34);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setColor("grey");
    obj.rectangle9:setWidth(200);
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle9);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(30);
    obj.layout35:setName("layout35");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout35);
    obj.button9:setText("Adicionar Kekkei Genkai");
    obj.button9:setWidth(200);
    obj.button9:setAlign("client");
    obj.button9:setMargins({left=2, right=2});
    obj.button9:setName("button9");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle9);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(170);
    obj.layout36:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout36:setName("layout36");

    obj.rclListaDosKekkeis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKekkeis:setParent(obj.layout36);
    obj.rclListaDosKekkeis:setName("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setField("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setTemplateForm("frmLH2_1");
    obj.rclListaDosKekkeis:setAlign("client");
    obj.rclListaDosKekkeis:setHeight(200);
    obj.rclListaDosKekkeis:setSelectable(true);

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout27);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(200);
    obj.layout37:setName("layout37");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout37);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setColor("grey");
    obj.rectangle10:setWidth(200);
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle10);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(30);
    obj.layout38:setName("layout38");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout38);
    obj.button10:setText("Adicionar Transformação");
    obj.button10:setWidth(200);
    obj.button10:setAlign("client");
    obj.button10:setMargins({left=2, right=2});
    obj.button10:setName("button10");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle10);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(170);
    obj.layout39:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout39:setName("layout39");

    obj.rclListaDasTransformacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTransformacoes:setParent(obj.layout39);
    obj.rclListaDasTransformacoes:setName("rclListaDasTransformacoes");
    obj.rclListaDasTransformacoes:setField("rclListaDasTransformacoes");
    obj.rclListaDasTransformacoes:setTemplateForm("frmLH2_1");
    obj.rclListaDasTransformacoes:setAlign("client");
    obj.rclListaDasTransformacoes:setHeight(200);
    obj.rclListaDasTransformacoes:setSelectable(true);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout27);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(200);
    obj.layout40:setName("layout40");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout40);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setColor("grey");
    obj.rectangle11:setWidth(200);
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setName("rectangle11");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle11);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(30);
    obj.layout41:setName("layout41");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout41);
    obj.button11:setText("Adicionar Outro");
    obj.button11:setWidth(200);
    obj.button11:setAlign("client");
    obj.button11:setMargins({left=2, right=2});
    obj.button11:setName("button11");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle11);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(170);
    obj.layout42:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout42:setName("layout42");

    obj.rclListaDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout42);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("rclListaDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmLH2_1");
    obj.rclListaDosOutros:setAlign("client");
    obj.rclListaDosOutros:setHeight(200);
    obj.rclListaDosOutros:setSelectable(true);

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox1);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(200);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(200);
    obj.layout44:setName("layout44");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout44);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setColor("grey");
    obj.rectangle12:setWidth(200);
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setName("rectangle12");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle12);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(30);
    obj.layout45:setName("layout45");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout45);
    obj.button12:setText("Adicionar Estilo de Luta");
    obj.button12:setWidth(200);
    obj.button12:setAlign("client");
    obj.button12:setMargins({left=2, right=2});
    obj.button12:setName("button12");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle12);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(170);
    obj.layout46:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout46:setName("layout46");

    obj.rclListaDosEstLutas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.layout46);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH2_1");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(200);
    obj.rclListaDosEstLutas:setSelectable(true);

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout43);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(200);
    obj.layout47:setName("layout47");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout47);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setColor("grey");
    obj.rectangle13:setWidth(200);
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setName("rectangle13");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle13);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(30);
    obj.layout48:setName("layout48");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout48);
    obj.button13:setText("Adicionar Kuchyose");
    obj.button13:setWidth(200);
    obj.button13:setAlign("client");
    obj.button13:setMargins({left=2, right=2});
    obj.button13:setName("button13");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle13);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(170);
    obj.layout49:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout49:setName("layout49");

    obj.rclListaDosKuchyoses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.layout49);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH2_1");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(200);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout43);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(200);
    obj.layout50:setName("layout50");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout50);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setColor("grey");
    obj.rectangle14:setWidth(200);
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setName("rectangle14");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle14);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(30);
    obj.layout51:setName("layout51");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout51);
    obj.button14:setText("Adicionar Passivas");
    obj.button14:setWidth(200);
    obj.button14:setAlign("client");
    obj.button14:setMargins({left=2, right=2});
    obj.button14:setName("button14");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle14);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(170);
    obj.layout52:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout52:setName("layout52");

    obj.rclListaDosPassivos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosPassivos:setParent(obj.layout52);
    obj.rclListaDosPassivos:setName("rclListaDosPassivos");
    obj.rclListaDosPassivos:setField("rclListaDosPassivos");
    obj.rclListaDosPassivos:setTemplateForm("frmLH2_1");
    obj.rclListaDosPassivos:setAlign("client");
    obj.rclListaDosPassivos:setHeight(200);
    obj.rclListaDosPassivos:setSelectable(true);

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout43);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(200);
    obj.layout53:setName("layout53");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout53);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setColor("grey");
    obj.rectangle15:setWidth(200);
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setName("rectangle15");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle15);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(30);
    obj.layout54:setName("layout54");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout54);
    obj.button15:setText("Adicionar Passivas Nobres");
    obj.button15:setWidth(200);
    obj.button15:setAlign("client");
    obj.button15:setMargins({left=2, right=2});
    obj.button15:setName("button15");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle15);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(170);
    obj.layout55:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout55:setName("layout55");

    obj.rclListaDosPassivosNobres = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosPassivosNobres:setParent(obj.layout55);
    obj.rclListaDosPassivosNobres:setName("rclListaDosPassivosNobres");
    obj.rclListaDosPassivosNobres:setField("rclListaDosPassivosNobres");
    obj.rclListaDosPassivosNobres:setTemplateForm("frmLH2_1");
    obj.rclListaDosPassivosNobres:setAlign("client");
    obj.rclListaDosPassivosNobres:setHeight(200);
    obj.rclListaDosPassivosNobres:setSelectable(true);

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout43);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(200);
    obj.layout56:setName("layout56");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout56);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setColor("grey");
    obj.rectangle16:setWidth(200);
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setName("rectangle16");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle16);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(30);
    obj.layout57:setName("layout57");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout57);
    obj.button16:setText("Adicionar Outro 2");
    obj.button16:setWidth(200);
    obj.button16:setAlign("client");
    obj.button16:setMargins({left=2, right=2});
    obj.button16:setName("button16");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle16);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(170);
    obj.layout58:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout58:setName("layout58");

    obj.rclListaDosOutros2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros2:setParent(obj.layout58);
    obj.rclListaDosOutros2:setName("rclListaDosOutros2");
    obj.rclListaDosOutros2:setField("rclListaDosOutros2");
    obj.rclListaDosOutros2:setTemplateForm("frmLH2_1");
    obj.rclListaDosOutros2:setAlign("client");
    obj.rclListaDosOutros2:setHeight(200);
    obj.rclListaDosOutros2:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            require("system.lua");
                                                jutsu = (self.boxDetalhesDoJutsu.node.campoJutsu or "--//--");
                                                desc = (self.boxDetalhesDoJutsu.node.campoTextoGrande2 or "--//--");
                                                gasto = (self.boxDetalhesDoJutsu.node.campoGasto or "--//--");
                                                quant = (self.boxDetalhesDoJutsu.node.campoQuantidade or "--//--");
                                                alcan = (self.boxDetalhesDoJutsu.node.CampoAlcance or "--//--");
                                                tempo = (self.boxDetalhesDoJutsu.node.CampoTempo or "--//--");
                                                dano = (self.boxDetalhesDoJutsu.node.CampoDano or "--//--");
                                                System.setClipboardText("Nome: " .. jutsu .. "\n"
                                                                     .. "Descrição: " .. desc .. "\n"
                                                                     .. "Gasto: " .. gasto .. "\n"
                                                                     .. "Quantidade: " .. quant .. "\n"
                                                                     .. "Alcance: " .. alcan .. "\n"
                                                                     .. "Tempo: " .. tempo .. "\n"
                                                                     .. "Dano: " .. dano);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosNinjutsus:append();
                                        if item~=nil then item.campoJutsu = "Ninjutsu" end
        end, obj);

    obj._e_event2 = obj.rclListaDosNinjutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosNinjutsus.selectedNode, "rclListaDosNinjutsus")
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosGenjutsus:append();
                                        if item~=nil then item.campoJutsu = "Genjutsu" end
        end, obj);

    obj._e_event4 = obj.rclListaDosGenjutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosGenjutsus.selectedNode, "rclListaDosGenjutsus")
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosTaijutsus:append();
                                        if item~=nil then item.campoJutsu = "Taijutsu" end
        end, obj);

    obj._e_event6 = obj.rclListaDosTaijutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosTaijutsus.selectedNode, "rclListaDosTaijutsus")
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEspeciais:append();
                                        if item~=nil then item.campoJutsu = "Especial" end
        end, obj);

    obj._e_event8 = obj.rclListaDosEspeciais:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEspeciais.selectedNode, "rclListaDosEspeciais")
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEspeciais2:append();
                                        if item~=nil then item.campoJutsu = "Especial 2" end
        end, obj);

    obj._e_event10 = obj.rclListaDosEspeciais2:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEspeciais2.selectedNode, "rclListaDosEspeciais2")
        end, obj);

    obj._e_event11 = obj.button7:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosBasicos:append();
                                        if item~=nil then item.campoJutsu = "Básicos" end
        end, obj);

    obj._e_event12 = obj.rclListaDosBasicos:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosBasicos.selectedNode, "rclListaDosBasicos")
        end, obj);

    obj._e_event13 = obj.button8:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosClans:append();
                                        if item~=nil then item.campoJutsu = "Jutsu do Clan" end
        end, obj);

    obj._e_event14 = obj.rclListaDosClans:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosClans.selectedNode, "rclListaDosClans")
        end, obj);

    obj._e_event15 = obj.button9:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosKekkeis:append();
                                        if item~=nil then item.campoJutsu = "Kekkei Genkai" end
        end, obj);

    obj._e_event16 = obj.rclListaDosKekkeis:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosKekkeis.selectedNode, "rclListaDosKekkeis")
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (_)
            local item = self.rclListaDasTransformacoes:append();
                                        if item~=nil then item.campoJutsu = "Transformação" end
        end, obj);

    obj._e_event18 = obj.rclListaDasTransformacoes:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDasTransformacoes.selectedNode, "rclListaDasTransformacoes")
        end, obj);

    obj._e_event19 = obj.button11:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosOutros:append();
                                        if item~=nil then item.campoJutsu = "Outro" end
        end, obj);

    obj._e_event20 = obj.rclListaDosOutros:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosOutros.selectedNode, "rclListaDosOutros")
        end, obj);

    obj._e_event21 = obj.button12:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEstLutas:append();
                                        if item~=nil then item.campoJutsu = "Estilo de Luta" end
        end, obj);

    obj._e_event22 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEstLutas.selectedNode, "rclListaDosEstLutas")
        end, obj);

    obj._e_event23 = obj.button13:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosKuchyoses:append();
                                        if item~=nil then item.campoJutsu = "Kuchyose" end
        end, obj);

    obj._e_event24 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosKuchyoses.selectedNode, "rclListaDosKuchyoses")
        end, obj);

    obj._e_event25 = obj.button14:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosPassivos:append();
                                        if item~=nil then item.campoJutsu = "Passivas" end
        end, obj);

    obj._e_event26 = obj.rclListaDosPassivos:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosPassivos.selectedNode, "rclListaDosPassivos")
        end, obj);

    obj._e_event27 = obj.button15:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosPassivosNobres:append();
                                        if item~=nil then item.campoJutsu = "Passivas Nobres" end
        end, obj);

    obj._e_event28 = obj.rclListaDosPassivosNobres:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosPassivosNobres.selectedNode, "rclListaDosPassivosNobres")
        end, obj);

    obj._e_event29 = obj.button16:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosOutros2:append();
                                        if item~=nil then item.campoJutsu = "Outro 2" end
        end, obj);

    obj._e_event30 = obj.rclListaDosOutros2:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosOutros2.selectedNode, "rclListaDosOutros2")
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rclListaDosClans ~= nil then self.rclListaDosClans:destroy(); self.rclListaDosClans = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.rclListaDosKekkeis ~= nil then self.rclListaDosKekkeis:destroy(); self.rclListaDosKekkeis = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rclListaDosBasicos ~= nil then self.rclListaDosBasicos:destroy(); self.rclListaDosBasicos = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rclListaDosEspeciais2 ~= nil then self.rclListaDosEspeciais2:destroy(); self.rclListaDosEspeciais2 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.rclListaDosGenjutsus ~= nil then self.rclListaDosGenjutsus:destroy(); self.rclListaDosGenjutsus = nil; end;
        if self.DescJutsu ~= nil then self.DescJutsu:destroy(); self.DescJutsu = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.boxDetalhesDoJutsu ~= nil then self.boxDetalhesDoJutsu:destroy(); self.boxDetalhesDoJutsu = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.rclListaDosNinjutsus ~= nil then self.rclListaDosNinjutsus:destroy(); self.rclListaDosNinjutsus = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclListaDosPassivos ~= nil then self.rclListaDosPassivos:destroy(); self.rclListaDosPassivos = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rclListaDosOutros2 ~= nil then self.rclListaDosOutros2:destroy(); self.rclListaDosOutros2 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rclListaDosEspeciais ~= nil then self.rclListaDosEspeciais:destroy(); self.rclListaDosEspeciais = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rclListaDosTaijutsus ~= nil then self.rclListaDosTaijutsus:destroy(); self.rclListaDosTaijutsus = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rclListaDosPassivosNobres ~= nil then self.rclListaDosPassivosNobres:destroy(); self.rclListaDosPassivosNobres = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.rclListaDasTransformacoes ~= nil then self.rclListaDasTransformacoes:destroy(); self.rclListaDasTransformacoes = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLH2()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLH2();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLH2 = {
    newEditor = newfrmLH2, 
    new = newfrmLH2, 
    name = "frmLH2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH2 = _frmLH2;
Firecast.registrarForm(_frmLH2);

return _frmLH2;
