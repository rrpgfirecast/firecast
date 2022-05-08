require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister8_svg()
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
    obj:setName("frmFichaRPGmeister8_svg");
    obj:setAlign("client");
    obj:setMargins({top=1});


		local function getNumber(text)
			local mod = "0";
			if text~= nil then
				mod = string.gsub(text, "%.", "");
				mod = string.gsub(mod, "k", "000");
				mod = string.gsub(mod, "K", "");
				mod = string.gsub(mod, "g", "");
				mod = string.gsub(mod, "P", "");
				mod = string.gsub(mod, "p", "");
				mod = string.gsub(mod, "O", "");
				mod = string.gsub(mod, "o", "");
				mod = string.gsub(mod, "X", "");
				mod = string.gsub(mod, "x", "");
				mod = string.gsub(mod, " ", "");
				mod = string.gsub(mod, ",", ".");
			end
			return tonumber(mod);
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.boxDetalhesDoCompanheiro = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoCompanheiro:setParent(obj.scrollBox1);
    obj.boxDetalhesDoCompanheiro:setName("boxDetalhesDoCompanheiro");
    obj.boxDetalhesDoCompanheiro:setVisible(false);
    obj.boxDetalhesDoCompanheiro:setLeft(0);
    obj.boxDetalhesDoCompanheiro:setTop(0);
    obj.boxDetalhesDoCompanheiro:setWidth(1335);
    obj.boxDetalhesDoCompanheiro:setHeight(620);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(135);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(10);
    obj.label1:setWidth(70);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(70);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(125);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nomeComp");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(35);
    obj.label2:setWidth(70);
    obj.label2:setHeight(20);
    obj.label2:setText("Raça");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(70);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(125);
    obj.edit2:setHeight(25);
    obj.edit2:setField("racaComp");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(60);
    obj.label3:setWidth(70);
    obj.label3:setHeight(20);
    obj.label3:setText("Tipo");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(70);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(125);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipoComp");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(5);
    obj.label4:setTop(85);
    obj.label4:setWidth(70);
    obj.label4:setHeight(20);
    obj.label4:setText("Subtipos");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(70);
    obj.edit4:setTop(80);
    obj.edit4:setWidth(125);
    obj.edit4:setHeight(25);
    obj.edit4:setField("subtiposComp");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(5);
    obj.label5:setTop(110);
    obj.label5:setWidth(70);
    obj.label5:setHeight(20);
    obj.label5:setText("Tamanho");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(70);
    obj.edit5:setTop(105);
    obj.edit5:setWidth(125);
    obj.edit5:setHeight(25);
    obj.edit5:setField("tamanhoComp");
    obj.edit5:setName("edit5");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(138);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(110);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(5);
    obj.label6:setTop(10);
    obj.label6:setWidth(40);
    obj.label6:setHeight(20);
    obj.label6:setText("DVs");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle2);
    obj.edit6:setLeft(35);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(25);
    obj.edit6:setField("dvsComp");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(110);
    obj.label7:setTop(8);
    obj.label7:setWidth(40);
    obj.label7:setHeight(20);
    obj.label7:setText("PVs");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle2);
    obj.edit7:setLeft(140);
    obj.edit7:setTop(5);
    obj.edit7:setWidth(55);
    obj.edit7:setHeight(25);
    obj.edit7:setField("pvsComp");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(35);
    obj.label8:setWidth(60);
    obj.label8:setHeight(20);
    obj.label8:setText("CA");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle2);
    obj.edit8:setLeft(70);
    obj.edit8:setTop(30);
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(25);
    obj.edit8:setField("caComp");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(5);
    obj.label9:setTop(60);
    obj.label9:setWidth(60);
    obj.label9:setHeight(20);
    obj.label9:setText("Toque");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle2);
    obj.edit9:setLeft(70);
    obj.edit9:setTop(55);
    obj.edit9:setWidth(35);
    obj.edit9:setHeight(25);
    obj.edit9:setField("toqueComp");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(5);
    obj.label10:setTop(85);
    obj.label10:setWidth(60);
    obj.label10:setHeight(20);
    obj.label10:setText("Surpresa");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle2);
    obj.edit10:setLeft(70);
    obj.edit10:setTop(80);
    obj.edit10:setWidth(35);
    obj.edit10:setHeight(25);
    obj.edit10:setField("surpresaComp");
    obj.edit10:setName("edit10");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle2);
    obj.textEditor1:setLeft(105);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(90);
    obj.textEditor1:setHeight(75);
    obj.textEditor1:setField("caCompDesc");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(251);
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setHeight(110);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle3);
    obj.button1:setLeft(5);
    obj.button1:setTop(8);
    obj.button1:setWidth(70);
    obj.button1:setHeight(20);
    obj.button1:setText("Iniciativa");
    obj.button1:setName("button1");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle3);
    obj.edit11:setLeft(80);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setField("iniciativaComp");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle3);
    obj.edit12:setLeft(110);
    obj.edit12:setTop(5);
    obj.edit12:setWidth(85);
    obj.edit12:setHeight(25);
    obj.edit12:setField("iniciativaCompDesc");
    obj.edit12:setName("edit12");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle3);
    obj.label11:setLeft(2);
    obj.label11:setTop(35);
    obj.label11:setWidth(85);
    obj.label11:setHeight(20);
    obj.label11:setText("Deslocamento");
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle3);
    obj.edit13:setLeft(80);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(115);
    obj.edit13:setHeight(25);
    obj.edit13:setField("deslocamentoComp");
    obj.edit13:setName("edit13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle3);
    obj.label12:setLeft(5);
    obj.label12:setTop(60);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setText("BBA");
    obj.label12:setName("label12");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle3);
    obj.edit14:setLeft(35);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(55);
    obj.edit14:setHeight(25);
    obj.edit14:setField("bbaComp");
    obj.edit14:setName("edit14");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle3);
    obj.button2:setLeft(90);
    obj.button2:setTop(58);
    obj.button2:setWidth(60);
    obj.button2:setHeight(20);
    obj.button2:setText("Agarrar");
    obj.button2:setName("button2");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle3);
    obj.edit15:setLeft(150);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(45);
    obj.edit15:setHeight(25);
    obj.edit15:setField("agarrarComp");
    obj.edit15:setName("edit15");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle3);
    obj.label13:setLeft(5);
    obj.label13:setTop(85);
    obj.label13:setWidth(40);
    obj.label13:setHeight(20);
    obj.label13:setText("Esp.");
    obj.label13:setName("label13");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle3);
    obj.edit16:setLeft(35);
    obj.edit16:setTop(80);
    obj.edit16:setWidth(35);
    obj.edit16:setHeight(25);
    obj.edit16:setField("esp1Comp");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle3);
    obj.edit17:setLeft(70);
    obj.edit17:setTop(80);
    obj.edit17:setWidth(35);
    obj.edit17:setHeight(25);
    obj.edit17:setField("esp2Comp");
    obj.edit17:setName("edit17");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle3);
    obj.label14:setLeft(110);
    obj.label14:setTop(85);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setText("Alc.");
    obj.label14:setName("label14");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle3);
    obj.edit18:setLeft(140);
    obj.edit18:setTop(80);
    obj.edit18:setWidth(55);
    obj.edit18:setHeight(25);
    obj.edit18:setField("alcanceComp");
    obj.edit18:setName("edit18");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(364);
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setHeight(160);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle4);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(195);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setLeft(0);
    obj.button3:setTop(3);
    obj.button3:setWidth(42);
    obj.button3:setHeight(20);
    obj.button3:setText("FOR");
    obj.button3:setName("button3");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setLeft(45);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("forComp");
    obj.edit19:setName("edit19");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(80);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setLeft(80);
    obj.label15:setTop(0);
    obj.label15:setWidth(30);
    obj.label15:setHeight(25);
    obj.label15:setField("forModComp");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setField("forCompDesc");
    obj.edit20:setName("edit20");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle4);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(195);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(0);
    obj.button4:setTop(3);
    obj.button4:setWidth(42);
    obj.button4:setHeight(20);
    obj.button4:setText("DES");
    obj.button4:setName("button4");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout2);
    obj.edit21:setLeft(45);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("desComp");
    obj.edit21:setName("edit21");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(80);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(80);
    obj.label16:setTop(0);
    obj.label16:setWidth(30);
    obj.label16:setHeight(25);
    obj.label16:setField("desModComp");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout2);
    obj.edit22:setLeft(115);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(75);
    obj.edit22:setHeight(25);
    obj.edit22:setField("desCompDesc");
    obj.edit22:setName("edit22");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle4);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(55);
    obj.layout3:setWidth(195);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(0);
    obj.button5:setTop(3);
    obj.button5:setWidth(42);
    obj.button5:setHeight(20);
    obj.button5:setText("CON");
    obj.button5:setName("button5");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout3);
    obj.edit23:setLeft(45);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("conComp");
    obj.edit23:setName("edit23");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(80);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(80);
    obj.label17:setTop(0);
    obj.label17:setWidth(30);
    obj.label17:setHeight(25);
    obj.label17:setField("conModComp");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout3);
    obj.edit24:setLeft(115);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(75);
    obj.edit24:setHeight(25);
    obj.edit24:setField("conCompDesc");
    obj.edit24:setName("edit24");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle4);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(80);
    obj.layout4:setWidth(195);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout4);
    obj.button6:setLeft(0);
    obj.button6:setTop(3);
    obj.button6:setWidth(42);
    obj.button6:setHeight(20);
    obj.button6:setText("INT");
    obj.button6:setName("button6");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setLeft(45);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("intComp");
    obj.edit25:setName("edit25");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout4);
    obj.rectangle8:setLeft(80);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setLeft(80);
    obj.label18:setTop(0);
    obj.label18:setWidth(30);
    obj.label18:setHeight(25);
    obj.label18:setField("intModComp");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setLeft(115);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(75);
    obj.edit26:setHeight(25);
    obj.edit26:setField("intCompDesc");
    obj.edit26:setName("edit26");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle4);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(105);
    obj.layout5:setWidth(195);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout5);
    obj.button7:setLeft(0);
    obj.button7:setTop(3);
    obj.button7:setWidth(42);
    obj.button7:setHeight(20);
    obj.button7:setText("SAB");
    obj.button7:setName("button7");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout5);
    obj.edit27:setLeft(45);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setField("sabComp");
    obj.edit27:setName("edit27");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout5);
    obj.rectangle9:setLeft(80);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout5);
    obj.label19:setLeft(80);
    obj.label19:setTop(0);
    obj.label19:setWidth(30);
    obj.label19:setHeight(25);
    obj.label19:setField("sabModComp");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout5);
    obj.edit28:setLeft(115);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(75);
    obj.edit28:setHeight(25);
    obj.edit28:setField("sabCompDesc");
    obj.edit28:setName("edit28");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle4);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(130);
    obj.layout6:setWidth(195);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout6);
    obj.button8:setLeft(0);
    obj.button8:setTop(3);
    obj.button8:setWidth(42);
    obj.button8:setHeight(20);
    obj.button8:setText("CAR");
    obj.button8:setName("button8");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout6);
    obj.edit29:setLeft(45);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setField("carComp");
    obj.edit29:setName("edit29");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout6);
    obj.rectangle10:setLeft(80);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout6);
    obj.label20:setLeft(80);
    obj.label20:setTop(0);
    obj.label20:setWidth(30);
    obj.label20:setHeight(25);
    obj.label20:setField("carModComp");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout6);
    obj.edit30:setLeft(115);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(75);
    obj.edit30:setHeight(25);
    obj.edit30:setField("carCompDesc");
    obj.edit30:setName("edit30");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(527);
    obj.rectangle11:setWidth(200);
    obj.rectangle11:setHeight(85);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle11);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(5);
    obj.layout7:setWidth(195);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout7);
    obj.button9:setLeft(0);
    obj.button9:setTop(3);
    obj.button9:setWidth(42);
    obj.button9:setHeight(20);
    obj.button9:setText("FORT");
    obj.button9:setName("button9");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout7);
    obj.edit31:setLeft(45);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setField("fortComp");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout7);
    obj.edit32:setLeft(80);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(110);
    obj.edit32:setHeight(25);
    obj.edit32:setField("fortCompDesc");
    obj.edit32:setName("edit32");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle11);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(30);
    obj.layout8:setWidth(195);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout8);
    obj.button10:setLeft(0);
    obj.button10:setTop(3);
    obj.button10:setWidth(42);
    obj.button10:setHeight(20);
    obj.button10:setText("REF");
    obj.button10:setName("button10");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout8);
    obj.edit33:setLeft(45);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setField("refComp");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout8);
    obj.edit34:setLeft(80);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(110);
    obj.edit34:setHeight(25);
    obj.edit34:setField("refCompDesc");
    obj.edit34:setName("edit34");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle11);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(55);
    obj.layout9:setWidth(195);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout9);
    obj.button11:setLeft(0);
    obj.button11:setTop(3);
    obj.button11:setWidth(42);
    obj.button11:setHeight(20);
    obj.button11:setText("VON");
    obj.button11:setName("button11");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout9);
    obj.edit35:setLeft(45);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setField("vonComp");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout9);
    obj.edit36:setLeft(80);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(110);
    obj.edit36:setHeight(25);
    obj.edit36:setField("vonCompDesc");
    obj.edit36:setName("edit36");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle12:setLeft(205);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(300);
    obj.rectangle12:setHeight(300);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle12);
    obj.label21:setLeft(0);
    obj.label21:setTop(0);
    obj.label21:setWidth(300);
    obj.label21:setHeight(25);
    obj.label21:setText("PERÍCIAS");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle12);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(290);
    obj.textEditor2:setHeight(265);
    obj.textEditor2:setField("periciasComp");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle13:setLeft(510);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(300);
    obj.rectangle13:setHeight(300);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle13);
    obj.label22:setLeft(0);
    obj.label22:setTop(0);
    obj.label22:setWidth(300);
    obj.label22:setHeight(25);
    obj.label22:setText("TALENTOS");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle13);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setWidth(290);
    obj.textEditor3:setHeight(265);
    obj.textEditor3:setField("talentosComp");
    obj.textEditor3:setName("textEditor3");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle14:setLeft(815);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(300);
    obj.rectangle14:setHeight(300);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle14);
    obj.label23:setLeft(0);
    obj.label23:setTop(0);
    obj.label23:setWidth(300);
    obj.label23:setHeight(25);
    obj.label23:setText("HABILIDADES");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle14);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setWidth(290);
    obj.textEditor4:setHeight(265);
    obj.textEditor4:setField("habilidadesComp");
    obj.textEditor4:setName("textEditor4");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle15:setLeft(205);
    obj.rectangle15:setTop(305);
    obj.rectangle15:setWidth(300);
    obj.rectangle15:setHeight(300);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle15);
    obj.label24:setLeft(0);
    obj.label24:setTop(0);
    obj.label24:setWidth(300);
    obj.label24:setHeight(25);
    obj.label24:setText("INVENTARIO");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle15);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setWidth(290);
    obj.textEditor5:setHeight(240);
    obj.textEditor5:setField("inventarioComp");
    obj.textEditor5:setName("textEditor5");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle15);
    obj.label25:setLeft(55);
    obj.label25:setTop(275);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("PESO");
    obj.label25:setName("label25");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle15);
    obj.edit37:setLeft(95);
    obj.edit37:setTop(270);
    obj.edit37:setWidth(70);
    obj.edit37:setHeight(25);
    obj.edit37:setField("pesoInventorioComp");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle15);
    obj.label26:setLeft(175);
    obj.label26:setTop(275);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setText("PREÇO");
    obj.label26:setName("label26");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle15);
    obj.edit38:setLeft(225);
    obj.edit38:setTop(270);
    obj.edit38:setWidth(70);
    obj.edit38:setHeight(25);
    obj.edit38:setField("precoInventorioComp");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.boxDetalhesDoCompanheiro);
    obj.dataLink1:setField("precoInventorioComp");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle16:setLeft(510);
    obj.rectangle16:setTop(305);
    obj.rectangle16:setWidth(300);
    obj.rectangle16:setHeight(300);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle16);
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(300);
    obj.label27:setHeight(25);
    obj.label27:setText("ATAQUES");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle16);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setWidth(290);
    obj.textEditor6:setHeight(120);
    obj.textEditor6:setField("ataquesComp");
    obj.textEditor6:setName("textEditor6");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle16);
    obj.label28:setLeft(5);
    obj.label28:setTop(150);
    obj.label28:setWidth(100);
    obj.label28:setHeight(20);
    obj.label28:setText("Macro");
    obj.label28:setName("label28");


					local function lines(str)
					   local t = {}
					   local function helper(line)
					      table.insert(t, line)
					      return ""
					   end
					   helper((str:gsub("(.-)\r?\n", helper)))
					   return t
					end
				


    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle16);
    obj.button12:setLeft(55);
    obj.button12:setTop(150);
    obj.button12:setWidth(50);
    obj.button12:setHeight(20);
    obj.button12:setHint("Envia tudo do segundo espaço para ataques no chat.");
    obj.button12:setText("Atacar");
    obj.button12:setName("button12");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle16);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(170);
    obj.textEditor7:setWidth(290);
    obj.textEditor7:setHeight(120);
    obj.textEditor7:setField("macro");
    obj.textEditor7:setName("textEditor7");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle17:setLeft(815);
    obj.rectangle17:setTop(305);
    obj.rectangle17:setWidth(300);
    obj.rectangle17:setHeight(300);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle17);
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(300);
    obj.label29:setHeight(25);
    obj.label29:setText("OUTROS");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle17);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setWidth(290);
    obj.textEditor8:setHeight(265);
    obj.textEditor8:setField("outrosComp");
    obj.textEditor8:setName("textEditor8");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle18:setLeft(1120);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(202);
    obj.rectangle18:setHeight(202);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.boxDetalhesDoCompanheiro);
    obj.image1:setLeft(1121);
    obj.image1:setTop(1);
    obj.image1:setWidth(200);
    obj.image1:setHeight(200);
    obj.image1:setField("avatarComp");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox1);
    obj.button13:setText("Novo Companheiro");
    obj.button13:setLeft(1140);
    obj.button13:setTop(206);
    obj.button13:setWidth(160);
    obj.button13:setHeight(20);
    obj.button13:setName("button13");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.scrollBox1);
    obj.rectangle19:setLeft(1119);
    obj.rectangle19:setTop(229);
    obj.rectangle19:setWidth(202);
    obj.rectangle19:setHeight(362);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.rclListaDosCompanheiros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosCompanheiros:setParent(obj.scrollBox1);
    obj.rclListaDosCompanheiros:setName("rclListaDosCompanheiros");
    obj.rclListaDosCompanheiros:setField("campoDosCompanheiros");
    obj.rclListaDosCompanheiros:setTemplateForm("frmFichaRPGmeister8CS_svg");
    obj.rclListaDosCompanheiros:setLeft(1120);
    obj.rclListaDosCompanheiros:setTop(230);
    obj.rclListaDosCompanheiros:setWidth(200);
    obj.rclListaDosCompanheiros:setHeight(360);
    obj.rclListaDosCompanheiros:setSelectable(true);
    obj.rclListaDosCompanheiros:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = Firecast.interpretarRolagem("1d20 + " .. (node.iniciativaComp or 0));
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de iniciativa de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = Firecast.interpretarRolagem("1d20 + " .. (node.agarrarComp or 0));
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de agarrar de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.forModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de força de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event3 = obj.edit19:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.forComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.forModComp = mod;
            					end;
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.desModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de destreza de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event5 = obj.edit21:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.desComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.desModComp = mod;
            					end;
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.conModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de constituição de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event7 = obj.edit23:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.conComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.conModComp = mod;
            					end;
        end, obj);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.intModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de inteligência de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event9 = obj.edit25:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.intComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.intModComp = mod;
            					end;
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.sabModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de sabedoria de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event11 = obj.edit27:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.sabComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.sabModComp = mod;
            					end;
        end, obj);

    obj._e_event12 = obj.button8:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.carModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de carisma de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event13 = obj.edit29:addEventListener("onUserChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.carComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.carModComp = mod;
            					end;
        end, obj);

    obj._e_event14 = obj.button9:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.fortComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de fortitude de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event15 = obj.button10:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.refComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de reflexos de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event16 = obj.button11:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.vonComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de vontade de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event17 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nodes = NDB.getChildNodes(sheet.campoDosCompanheiros);   
            					local total = 0;
            					for i=1, #nodes, 1 do
            						total = total + (getNumber(nodes[i].precoInventorioComp) or 0);
            					end
            					sheet.precoInventorioComp = total;
        end, obj);

    obj._e_event18 = obj.button12:addEventListener("onClick",
        function (_)
            local macro = self.boxDetalhesDoCompanheiro.node.macro;
            						if macro~=nil then
            							local macros = lines(macro);
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            							for i=1, #macros, 1 do
            								mesaDoPersonagem.activeChat:enviarMensagem(macros[i]);
            							end;
            						end;
        end, obj);

    obj._e_event19 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", self.rclListaDosCompanheiros.selectedNode.avatarComp);
        end, obj);

    obj._e_event20 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclListaDosCompanheiros:append();
        end, obj);

    obj._e_event21 = obj.rclListaDosCompanheiros:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            				self.boxDetalhesDoCompanheiro.node = node;
            				self.boxDetalhesDoCompanheiro.visible = (node ~= nil);
        end, obj);

    obj._e_event22 = obj.rclListaDosCompanheiros:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosCompanheiros.selectedNode == nil and sheet ~= nil then
            					local nodes = NDB.getChildNodes(sheet.campoDosCompanheiros);               
            					if #nodes > 0 then
            						self.rclListaDosCompanheiros.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.boxDetalhesDoCompanheiro ~= nil then self.boxDetalhesDoCompanheiro:destroy(); self.boxDetalhesDoCompanheiro = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.rclListaDosCompanheiros ~= nil then self.rclListaDosCompanheiros:destroy(); self.rclListaDosCompanheiros = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister8_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister8_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister8_svg = {
    newEditor = newfrmFichaRPGmeister8_svg, 
    new = newfrmFichaRPGmeister8_svg, 
    name = "frmFichaRPGmeister8_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister8_svg = _frmFichaRPGmeister8_svg;
Firecast.registrarForm(_frmFichaRPGmeister8_svg);

return _frmFichaRPGmeister8_svg;
