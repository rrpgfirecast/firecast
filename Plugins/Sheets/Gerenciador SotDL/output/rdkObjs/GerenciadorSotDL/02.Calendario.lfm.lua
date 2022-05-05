require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciador02()
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
    obj:setName("frmGerenciador02");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});


		local function write(str)
            local mesa = Firecast.getMesaDe(sheet);
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;
		


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.popClima = GUI.fromHandle(_obj_newObject("popup"));
    obj.popClima:setParent(obj.scrollBox1);
    obj.popClima:setName("popClima");
    obj.popClima:setWidth(240);
    obj.popClima:setHeight(210);
    obj.popClima:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popClima, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popClima);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(9);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(70);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Temperatura");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setHint("");
    obj.label1:setName("label1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(150);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setName("flowPart2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart2);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setField("temperatura");
    obj.comboBox1:setItems({'Glacial', 'Frio', 'Temperado', 'Morno', 'Quente', 'Infernal', 'Personalizado'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout1);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(70);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart3);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Média");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setHint("Valor base da média de temperatura.");
    obj.label2:setName("label2");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(20);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setName("flowPart4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart4);
    obj.edit1:setAlign("client");
    obj.edit1:setFontSize(10);
    obj.edit1:setField("temperatura_1");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(20);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(20);
    obj.flowPart5:setName("flowPart5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart5);
    obj.edit2:setAlign("client");
    obj.edit2:setFontSize(10);
    obj.edit2:setField("temperatura_2");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(20);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setName("flowPart6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart6);
    obj.edit3:setAlign("client");
    obj.edit3:setFontSize(10);
    obj.edit3:setField("temperatura_3");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(20);
    obj.flowPart7:setMaxWidth(50);
    obj.flowPart7:setHeight(20);
    obj.flowPart7:setName("flowPart7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart7);
    obj.edit4:setAlign("client");
    obj.edit4:setFontSize(10);
    obj.edit4:setField("temperatura_4");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(20);
    obj.flowPart8:setMaxWidth(50);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setName("flowPart8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart8);
    obj.edit5:setAlign("client");
    obj.edit5:setFontSize(10);
    obj.edit5:setField("temperatura_5");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(70);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart9);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Variancia");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setHint("Entre 1 e N é adicionado a média do dia aleatoriamente.");
    obj.label3:setName("label3");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(20);
    obj.flowPart10:setMaxWidth(50);
    obj.flowPart10:setHeight(20);
    obj.flowPart10:setName("flowPart10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart10);
    obj.edit6:setAlign("client");
    obj.edit6:setFontSize(10);
    obj.edit6:setField("temperaturaVar_1");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setMin(1);
    obj.edit6:setName("edit6");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(20);
    obj.flowPart11:setMaxWidth(50);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart11);
    obj.edit7:setAlign("client");
    obj.edit7:setFontSize(10);
    obj.edit7:setField("temperaturaVar_2");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setMin(1);
    obj.edit7:setName("edit7");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(20);
    obj.flowPart12:setMaxWidth(50);
    obj.flowPart12:setHeight(20);
    obj.flowPart12:setName("flowPart12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart12);
    obj.edit8:setAlign("client");
    obj.edit8:setFontSize(10);
    obj.edit8:setField("temperaturaVar_3");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setMin(1);
    obj.edit8:setName("edit8");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(20);
    obj.flowPart13:setMaxWidth(50);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart13);
    obj.edit9:setAlign("client");
    obj.edit9:setFontSize(10);
    obj.edit9:setField("temperaturaVar_4");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setMin(1);
    obj.edit9:setName("edit9");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout1);
    obj.flowPart14:setMinWidth(20);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart14);
    obj.edit10:setAlign("client");
    obj.edit10:setFontSize(10);
    obj.edit10:setField("temperaturaVar_5");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setMin(1);
    obj.edit10:setName("edit10");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout1);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout1);
    obj.flowPart15:setMinWidth(70);
    obj.flowPart15:setMaxWidth(100);
    obj.flowPart15:setHeight(15);
    obj.flowPart15:setName("flowPart15");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart15);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Chance");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setHint("Chance de usar essa faixa de temperatura. De mais frio que o normal a mais quente que o normal.");
    obj.label4:setName("label4");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout1);
    obj.flowPart16:setMinWidth(20);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart16);
    obj.edit11:setAlign("client");
    obj.edit11:setFontSize(10);
    obj.edit11:setField("temperaturaChance_1");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setName("edit11");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout1);
    obj.flowPart17:setMinWidth(20);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart17);
    obj.edit12:setAlign("client");
    obj.edit12:setFontSize(10);
    obj.edit12:setField("temperaturaChance_2");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setMin(0);
    obj.edit12:setName("edit12");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout1);
    obj.flowPart18:setMinWidth(20);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart18);
    obj.edit13:setAlign("client");
    obj.edit13:setFontSize(10);
    obj.edit13:setField("temperaturaChance_3");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setName("edit13");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout1);
    obj.flowPart19:setMinWidth(20);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart19);
    obj.edit14:setAlign("client");
    obj.edit14:setFontSize(10);
    obj.edit14:setField("temperaturaChance_4");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setName("edit14");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout1);
    obj.flowPart20:setMinWidth(20);
    obj.flowPart20:setMaxWidth(50);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart20);
    obj.edit15:setAlign("client");
    obj.edit15:setFontSize(10);
    obj.edit15:setField("temperaturaChance_5");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setMin(0);
    obj.edit15:setName("edit15");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout1);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout1);
    obj.flowPart21:setMinWidth(70);
    obj.flowPart21:setMaxWidth(100);
    obj.flowPart21:setHeight(15);
    obj.flowPart21:setName("flowPart21");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart21);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("MinMax");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setHint("Variação de temperatura ao longo do dia em relação a média. Calculando independente da Variancia, usando a Chance. ");
    obj.label5:setName("label5");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout1);
    obj.flowPart22:setMinWidth(20);
    obj.flowPart22:setMaxWidth(50);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart22);
    obj.edit16:setAlign("client");
    obj.edit16:setFontSize(10);
    obj.edit16:setField("temperaturaMM_1");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setMin(1);
    obj.edit16:setName("edit16");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout1);
    obj.flowPart23:setMinWidth(20);
    obj.flowPart23:setMaxWidth(50);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart23);
    obj.edit17:setAlign("client");
    obj.edit17:setFontSize(10);
    obj.edit17:setField("temperaturaMM_2");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setMin(1);
    obj.edit17:setName("edit17");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout1);
    obj.flowPart24:setMinWidth(20);
    obj.flowPart24:setMaxWidth(50);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart24);
    obj.edit18:setAlign("client");
    obj.edit18:setFontSize(10);
    obj.edit18:setField("temperaturaMM_3");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setMin(1);
    obj.edit18:setName("edit18");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout1);
    obj.flowPart25:setMinWidth(20);
    obj.flowPart25:setMaxWidth(50);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart25);
    obj.edit19:setAlign("client");
    obj.edit19:setFontSize(10);
    obj.edit19:setField("temperaturaMM_4");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setMin(1);
    obj.edit19:setName("edit19");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout1);
    obj.flowPart26:setMinWidth(20);
    obj.flowPart26:setMaxWidth(50);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart26);
    obj.edit20:setAlign("client");
    obj.edit20:setFontSize(10);
    obj.edit20:setField("temperaturaMM_5");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setMin(1);
    obj.edit20:setName("edit20");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout1);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout1);
    obj.flowPart27:setMinWidth(70);
    obj.flowPart27:setMaxWidth(100);
    obj.flowPart27:setHeight(15);
    obj.flowPart27:setName("flowPart27");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart27);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Precipitação");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setHint("");
    obj.label6:setName("label6");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout1);
    obj.flowPart28:setMinWidth(100);
    obj.flowPart28:setMaxWidth(150);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart28);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setField("chuvas");
    obj.comboBox2:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante', 'Personalizado'});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setName("comboBox2");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout1);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout1);
    obj.flowPart29:setMinWidth(70);
    obj.flowPart29:setMaxWidth(100);
    obj.flowPart29:setHeight(15);
    obj.flowPart29:setName("flowPart29");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart29);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Chance");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setHint("Chance de clima ensolarado, nublado, chuviscando, chuva, temporal, tempestade.");
    obj.label7:setName("label7");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout1);
    obj.flowPart30:setMinWidth(20);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart30);
    obj.edit21:setAlign("client");
    obj.edit21:setFontSize(10);
    obj.edit21:setField("chuvaChance_1");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setMin(0);
    obj.edit21:setName("edit21");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout1);
    obj.flowPart31:setMinWidth(20);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart31);
    obj.edit22:setAlign("client");
    obj.edit22:setFontSize(10);
    obj.edit22:setField("chuvaChance_2");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setName("edit22");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout1);
    obj.flowPart32:setMinWidth(20);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart32);
    obj.edit23:setAlign("client");
    obj.edit23:setFontSize(10);
    obj.edit23:setField("chuvaChance_3");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setName("edit23");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout1);
    obj.flowPart33:setMinWidth(20);
    obj.flowPart33:setMaxWidth(50);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart33);
    obj.edit24:setAlign("client");
    obj.edit24:setFontSize(10);
    obj.edit24:setField("chuvaChance_4");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setMin(0);
    obj.edit24:setName("edit24");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout1);
    obj.flowPart34:setMinWidth(20);
    obj.flowPart34:setMaxWidth(50);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart34);
    obj.edit25:setAlign("client");
    obj.edit25:setFontSize(10);
    obj.edit25:setField("chuvaChance_5");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setName("edit25");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout1);
    obj.flowPart35:setMinWidth(20);
    obj.flowPart35:setMaxWidth(50);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart35);
    obj.edit26:setAlign("client");
    obj.edit26:setFontSize(10);
    obj.edit26:setField("chuvaChance_6");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setMin(0);
    obj.edit26:setName("edit26");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout1);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout1);
    obj.flowPart36:setMinWidth(70);
    obj.flowPart36:setMaxWidth(100);
    obj.flowPart36:setHeight(15);
    obj.flowPart36:setName("flowPart36");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart36);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Areia");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setHint("Força minima do vento para tempestade de areia.");
    obj.label8:setName("label8");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout1);
    obj.flowPart37:setMinWidth(100);
    obj.flowPart37:setMaxWidth(150);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart37);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setField("areia");
    obj.comboBox3:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante', 'Personalizado'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout1);
    obj.flowPart38:setMinWidth(20);
    obj.flowPart38:setMaxWidth(50);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart38);
    obj.edit27:setAlign("client");
    obj.edit27:setFontSize(10);
    obj.edit27:setField("areiaMin");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setMin(1);
    obj.edit27:setName("edit27");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout1);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout1);
    obj.flowPart39:setMinWidth(70);
    obj.flowPart39:setMaxWidth(100);
    obj.flowPart39:setHeight(15);
    obj.flowPart39:setName("flowPart39");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart39);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Ventos");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setHint("");
    obj.label9:setName("label9");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout1);
    obj.flowPart40:setMinWidth(100);
    obj.flowPart40:setMaxWidth(150);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.flowPart40);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setField("ventos");
    obj.comboBox4:setItems({'Nenhum', 'Pouco', 'Razoável', 'Muito', 'Constante', 'Personalizado'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout1);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout1);
    obj.flowPart41:setMinWidth(70);
    obj.flowPart41:setMaxWidth(100);
    obj.flowPart41:setHeight(15);
    obj.flowPart41:setName("flowPart41");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart41);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Chance");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setHint("Chance de cada intensidade dos ventos.");
    obj.label10:setName("label10");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout1);
    obj.flowPart42:setMinWidth(20);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart42);
    obj.edit28:setAlign("client");
    obj.edit28:setFontSize(10);
    obj.edit28:setField("ventosChance_1");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setMin(0);
    obj.edit28:setName("edit28");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout1);
    obj.flowPart43:setMinWidth(20);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart43);
    obj.edit29:setAlign("client");
    obj.edit29:setFontSize(10);
    obj.edit29:setField("ventosChance_2");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setName("edit29");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout1);
    obj.flowPart44:setMinWidth(20);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart44);
    obj.edit30:setAlign("client");
    obj.edit30:setFontSize(10);
    obj.edit30:setField("ventosChance_3");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setMin(0);
    obj.edit30:setName("edit30");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout1);
    obj.flowPart45:setMinWidth(20);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart45);
    obj.edit31:setAlign("client");
    obj.edit31:setFontSize(10);
    obj.edit31:setField("ventosChance_4");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setMin(0);
    obj.edit31:setName("edit31");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout1);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(50);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart46);
    obj.edit32:setAlign("client");
    obj.edit32:setFontSize(10);
    obj.edit32:setField("ventosChance_5");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setMin(0);
    obj.edit32:setName("edit32");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout1);
    obj.flowPart47:setMinWidth(20);
    obj.flowPart47:setMaxWidth(50);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart47);
    obj.edit33:setAlign("client");
    obj.edit33:setFontSize(10);
    obj.edit33:setField("ventosChance_6");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setName("edit33");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout1);
    obj.flowPart48:setMinWidth(20);
    obj.flowPart48:setMaxWidth(50);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart48);
    obj.edit34:setAlign("client");
    obj.edit34:setFontSize(10);
    obj.edit34:setField("ventosChance_7");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setMin(0);
    obj.edit34:setName("edit34");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout1);
    obj.flowPart49:setMinWidth(20);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart49);
    obj.edit35:setAlign("client");
    obj.edit35:setFontSize(10);
    obj.edit35:setField("ventosChance_8");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setName("edit35");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout1);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.popCelestial = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCelestial:setParent(obj.scrollBox1);
    obj.popCelestial:setName("popCelestial");
    obj.popCelestial:setWidth(250);
    obj.popCelestial:setHeight(190);
    obj.popCelestial:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popCelestial, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popCelestial);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout2);
    obj.flowPart50:setMinWidth(100);
    obj.flowPart50:setMaxWidth(150);
    obj.flowPart50:setHeight(15);
    obj.flowPart50:setName("flowPart50");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart50);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Eventos Celestes");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout2);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout2);
    obj.flowPart51:setMinWidth(70);
    obj.flowPart51:setMaxWidth(100);
    obj.flowPart51:setHeight(15);
    obj.flowPart51:setName("flowPart51");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart51);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Sobrenatural");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setHint("");
    obj.label12:setName("label12");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout2);
    obj.flowPart52:setMinWidth(100);
    obj.flowPart52:setMaxWidth(150);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart52);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setField("sobrentural");
    obj.comboBox5:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout2);
    obj.flowPart53:setMinWidth(20);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart53);
    obj.edit36:setAlign("client");
    obj.edit36:setFontSize(10);
    obj.edit36:setField("sobrentural_chance");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowLayout2);
    obj.dataLink1:setField("sobrentural");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout2);
    obj.flowPart54:setMinWidth(70);
    obj.flowPart54:setMaxWidth(100);
    obj.flowPart54:setHeight(15);
    obj.flowPart54:setName("flowPart54");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart54);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Aurora");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setHint("");
    obj.label13:setName("label13");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout2);
    obj.flowPart55:setMinWidth(100);
    obj.flowPart55:setMaxWidth(150);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart55);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setField("auroras");
    obj.comboBox6:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout2);
    obj.flowPart56:setMinWidth(20);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart56);
    obj.edit37:setAlign("client");
    obj.edit37:setFontSize(10);
    obj.edit37:setField("auroras_chance");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowLayout2);
    obj.dataLink2:setField("auroras");
    obj.dataLink2:setName("dataLink2");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout2);
    obj.flowPart57:setMinWidth(70);
    obj.flowPart57:setMaxWidth(100);
    obj.flowPart57:setHeight(15);
    obj.flowPart57:setName("flowPart57");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart57);
    obj.label14:setAlign("top");
    obj.label14:setFontSize(10);
    obj.label14:setText("Cometas");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setAutoSize(true);
    obj.label14:setHint("");
    obj.label14:setName("label14");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout2);
    obj.flowPart58:setMinWidth(100);
    obj.flowPart58:setMaxWidth(150);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart58);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setField("cometas");
    obj.comboBox7:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout2);
    obj.flowPart59:setMinWidth(20);
    obj.flowPart59:setMaxWidth(50);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart59);
    obj.edit38:setAlign("client");
    obj.edit38:setFontSize(10);
    obj.edit38:setField("cometas_chance");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowLayout2);
    obj.dataLink3:setField("cometas");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout2);
    obj.flowPart60:setMinWidth(70);
    obj.flowPart60:setMaxWidth(100);
    obj.flowPart60:setHeight(15);
    obj.flowPart60:setName("flowPart60");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart60);
    obj.label15:setAlign("top");
    obj.label15:setFontSize(10);
    obj.label15:setText("Estrela Cadente");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWordWrap(true);
    obj.label15:setTextTrimming("none");
    obj.label15:setAutoSize(true);
    obj.label15:setHint("");
    obj.label15:setName("label15");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout2);
    obj.flowPart61:setMinWidth(100);
    obj.flowPart61:setMaxWidth(150);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart61);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setField("cadentes");
    obj.comboBox8:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout2);
    obj.flowPart62:setMinWidth(20);
    obj.flowPart62:setMaxWidth(50);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart62);
    obj.edit39:setAlign("client");
    obj.edit39:setFontSize(10);
    obj.edit39:setField("cadentes_chance");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout2);
    obj.dataLink4:setField("cadentes");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout2);
    obj.flowPart63:setMinWidth(70);
    obj.flowPart63:setMaxWidth(100);
    obj.flowPart63:setHeight(15);
    obj.flowPart63:setName("flowPart63");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart63);
    obj.label16:setAlign("top");
    obj.label16:setFontSize(10);
    obj.label16:setText("Eclipse Lunar");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWordWrap(true);
    obj.label16:setTextTrimming("none");
    obj.label16:setAutoSize(true);
    obj.label16:setHint("");
    obj.label16:setName("label16");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout2);
    obj.flowPart64:setMinWidth(100);
    obj.flowPart64:setMaxWidth(150);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart64);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setField("lunar");
    obj.comboBox9:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout2);
    obj.flowPart65:setMinWidth(20);
    obj.flowPart65:setMaxWidth(50);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart65);
    obj.edit40:setAlign("client");
    obj.edit40:setFontSize(10);
    obj.edit40:setField("lunar_chance");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setName("edit40");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout2);
    obj.dataLink5:setField("lunar");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout2);
    obj.flowPart66:setMinWidth(70);
    obj.flowPart66:setMaxWidth(100);
    obj.flowPart66:setHeight(15);
    obj.flowPart66:setName("flowPart66");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart66);
    obj.label17:setAlign("top");
    obj.label17:setFontSize(10);
    obj.label17:setText("Eclipse Solar");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setAutoSize(true);
    obj.label17:setHint("");
    obj.label17:setName("label17");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout2);
    obj.flowPart67:setMinWidth(100);
    obj.flowPart67:setMaxWidth(150);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart67);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setField("solar");
    obj.comboBox10:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout2);
    obj.flowPart68:setMinWidth(20);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart68);
    obj.edit41:setAlign("client");
    obj.edit41:setFontSize(10);
    obj.edit41:setField("solar_chance");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setName("edit41");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout2);
    obj.dataLink6:setField("solar");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout2);
    obj.flowPart69:setMinWidth(70);
    obj.flowPart69:setMaxWidth(100);
    obj.flowPart69:setHeight(15);
    obj.flowPart69:setName("flowPart69");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart69);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(10);
    obj.label18:setText("Meteoros");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setHint("");
    obj.label18:setName("label18");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout2);
    obj.flowPart70:setMinWidth(100);
    obj.flowPart70:setMaxWidth(150);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.flowPart70);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setField("meteoros");
    obj.comboBox11:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout2);
    obj.flowPart71:setMinWidth(20);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart71);
    obj.edit42:setAlign("client");
    obj.edit42:setFontSize(10);
    obj.edit42:setField("meteoros_chance");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setName("edit42");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout2);
    obj.dataLink7:setField("meteoros");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout2);
    obj.flowPart72:setMinWidth(70);
    obj.flowPart72:setMaxWidth(100);
    obj.flowPart72:setHeight(15);
    obj.flowPart72:setName("flowPart72");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart72);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(10);
    obj.label19:setText("Terremotos");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setHint("");
    obj.label19:setName("label19");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout2);
    obj.flowPart73:setMinWidth(100);
    obj.flowPart73:setMaxWidth(150);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart73);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setField("terremotos");
    obj.comboBox12:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout2);
    obj.flowPart74:setMinWidth(20);
    obj.flowPart74:setMaxWidth(50);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart74);
    obj.edit43:setAlign("client");
    obj.edit43:setFontSize(10);
    obj.edit43:setField("terremotos_chance");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setName("edit43");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout2);
    obj.dataLink8:setField("terremotos");
    obj.dataLink8:setName("dataLink8");

    obj.popMoon = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMoon:setParent(obj.scrollBox1);
    obj.popMoon:setName("popMoon");
    obj.popMoon:setWidth(250);
    obj.popMoon:setHeight(190);
    obj.popMoon:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMoon, "autoScopeNode",  "false");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popMoon);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(3);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout3);
    obj.flowPart75:setMinWidth(100);
    obj.flowPart75:setMaxWidth(150);
    obj.flowPart75:setHeight(15);
    obj.flowPart75:setName("flowPart75");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart75);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Fases da Lua");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout3);
    obj.flowPart76:setMinWidth(100);
    obj.flowPart76:setMaxWidth(150);
    obj.flowPart76:setHeight(15);
    obj.flowPart76:setName("flowPart76");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart76);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("Nome Alternativo");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout3);
    obj.flowPart77:setMinWidth(20);
    obj.flowPart77:setMaxWidth(50);
    obj.flowPart77:setHeight(15);
    obj.flowPart77:setName("flowPart77");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart77);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Dur.");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout3);
    obj.flowPart78:setMinWidth(100);
    obj.flowPart78:setMaxWidth(150);
    obj.flowPart78:setHeight(15);
    obj.flowPart78:setName("flowPart78");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart78);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(10);
    obj.label23:setText("Cheia");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout3);
    obj.flowPart79:setMinWidth(100);
    obj.flowPart79:setMaxWidth(150);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart79);
    obj.edit44:setAlign("client");
    obj.edit44:setFontSize(10);
    obj.edit44:setField("lua_cheia");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setName("edit44");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout3);
    obj.flowPart80:setMinWidth(20);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart80);
    obj.edit45:setAlign("client");
    obj.edit45:setFontSize(10);
    obj.edit45:setField("lua_cheia_duration");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setName("edit45");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout3);
    obj.flowPart81:setMinWidth(100);
    obj.flowPart81:setMaxWidth(150);
    obj.flowPart81:setHeight(15);
    obj.flowPart81:setName("flowPart81");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart81);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Minguante Convexo");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout3);
    obj.flowPart82:setMinWidth(100);
    obj.flowPart82:setMaxWidth(150);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart82);
    obj.edit46:setAlign("client");
    obj.edit46:setFontSize(10);
    obj.edit46:setField("lua_minguante_convexo");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setName("edit46");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout3);
    obj.flowPart83:setMinWidth(20);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart83);
    obj.edit47:setAlign("client");
    obj.edit47:setFontSize(10);
    obj.edit47:setField("lua_minguante_convexo_duration");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setName("edit47");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout3);
    obj.flowPart84:setMinWidth(100);
    obj.flowPart84:setMaxWidth(150);
    obj.flowPart84:setHeight(15);
    obj.flowPart84:setName("flowPart84");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart84);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Quarto Minguante");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout3);
    obj.flowPart85:setMinWidth(100);
    obj.flowPart85:setMaxWidth(150);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart85);
    obj.edit48:setAlign("client");
    obj.edit48:setFontSize(10);
    obj.edit48:setField("lua_quarto_minguante");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setName("edit48");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout3);
    obj.flowPart86:setMinWidth(20);
    obj.flowPart86:setMaxWidth(50);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart86);
    obj.edit49:setAlign("client");
    obj.edit49:setFontSize(10);
    obj.edit49:setField("lua_quarto_minguante_duration");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setName("edit49");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout3);
    obj.flowPart87:setMinWidth(100);
    obj.flowPart87:setMaxWidth(150);
    obj.flowPart87:setHeight(15);
    obj.flowPart87:setName("flowPart87");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart87);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Minguante Concavo");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout3);
    obj.flowPart88:setMinWidth(100);
    obj.flowPart88:setMaxWidth(150);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart88);
    obj.edit50:setAlign("client");
    obj.edit50:setFontSize(10);
    obj.edit50:setField("lua_minguante_concavo");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setName("edit50");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout3);
    obj.flowPart89:setMinWidth(20);
    obj.flowPart89:setMaxWidth(50);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart89);
    obj.edit51:setAlign("client");
    obj.edit51:setFontSize(10);
    obj.edit51:setField("lua_minguante_concavo_duration");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setName("edit51");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout3);
    obj.flowPart90:setMinWidth(100);
    obj.flowPart90:setMaxWidth(150);
    obj.flowPart90:setHeight(15);
    obj.flowPart90:setName("flowPart90");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart90);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Lua Nova");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout3);
    obj.flowPart91:setMinWidth(100);
    obj.flowPart91:setMaxWidth(150);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart91);
    obj.edit52:setAlign("client");
    obj.edit52:setFontSize(10);
    obj.edit52:setField("lua_lua_nova");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setName("edit52");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout3);
    obj.flowPart92:setMinWidth(20);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(20);
    obj.flowPart92:setName("flowPart92");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart92);
    obj.edit53:setAlign("client");
    obj.edit53:setFontSize(10);
    obj.edit53:setField("lua_lua_nova_duration");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setName("edit53");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout3);
    obj.flowPart93:setMinWidth(100);
    obj.flowPart93:setMaxWidth(150);
    obj.flowPart93:setHeight(15);
    obj.flowPart93:setName("flowPart93");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart93);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Crescente Concavo");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout3);
    obj.flowPart94:setMinWidth(100);
    obj.flowPart94:setMaxWidth(150);
    obj.flowPart94:setHeight(20);
    obj.flowPart94:setName("flowPart94");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart94);
    obj.edit54:setAlign("client");
    obj.edit54:setFontSize(10);
    obj.edit54:setField("lua_crescente_concavo");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setName("edit54");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout3);
    obj.flowPart95:setMinWidth(20);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(20);
    obj.flowPart95:setName("flowPart95");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart95);
    obj.edit55:setAlign("client");
    obj.edit55:setFontSize(10);
    obj.edit55:setField("lua_crescente_concavo_duration");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setName("edit55");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout3);
    obj.flowPart96:setMinWidth(100);
    obj.flowPart96:setMaxWidth(150);
    obj.flowPart96:setHeight(15);
    obj.flowPart96:setName("flowPart96");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart96);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Quarto Crescente");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout3);
    obj.flowPart97:setMinWidth(100);
    obj.flowPart97:setMaxWidth(150);
    obj.flowPart97:setHeight(20);
    obj.flowPart97:setName("flowPart97");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart97);
    obj.edit56:setAlign("client");
    obj.edit56:setFontSize(10);
    obj.edit56:setField("lua_quarto_crescente");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setName("edit56");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout3);
    obj.flowPart98:setMinWidth(20);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(20);
    obj.flowPart98:setName("flowPart98");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart98);
    obj.edit57:setAlign("client");
    obj.edit57:setFontSize(10);
    obj.edit57:setField("lua_quarto_crescente_duration");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setName("edit57");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout3);
    obj.flowPart99:setMinWidth(100);
    obj.flowPart99:setMaxWidth(150);
    obj.flowPart99:setHeight(15);
    obj.flowPart99:setName("flowPart99");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart99);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Crescente Convexo");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout3);
    obj.flowPart100:setMinWidth(100);
    obj.flowPart100:setMaxWidth(150);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart100);
    obj.edit58:setAlign("client");
    obj.edit58:setFontSize(10);
    obj.edit58:setField("lua_crescente_convexo");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setName("edit58");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout3);
    obj.flowPart101:setMinWidth(20);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart101);
    obj.edit59:setAlign("client");
    obj.edit59:setFontSize(10);
    obj.edit59:setField("lua_crescente_convexo_duration");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setName("edit59");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(345);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(250);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout2);
    obj.label31:setWidth(250);
    obj.label31:setHeight(20);
    obj.label31:setText("MESES");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(10);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Novo");
    obj.button1:setName("button1");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setLeft(115);
    obj.label32:setTop(0);
    obj.label32:setWidth(40);
    obj.label32:setHeight(25);
    obj.label32:setText("Total");
    obj.label32:setHitTest(true);
    obj.label32:setHint("Quantos dias dura o ano.");
    obj.label32:setName("label32");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(165);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.dias = GUI.fromHandle(_obj_newObject("label"));
    obj.dias:setParent(obj.layout3);
    obj.dias:setLeft(165);
    obj.dias:setTop(0);
    obj.dias:setWidth(35);
    obj.dias:setHeight(25);
    obj.dias:setField("dias");
    obj.dias:setHorzTextAlign("center");
    obj.dias:setFontSize(12);
    obj.dias:setName("dias");
    obj.dias:setHitTest(true);
    obj.dias:setHint("Se estiver vermelho a duração do ano e das estações está dessincronizada. ");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout2);
    obj.label33:setLeft(6);
    obj.label33:setTop(50);
    obj.label33:setWidth(30);
    obj.label33:setHeight(25);
    obj.label33:setText("Nº");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setHitTest(true);
    obj.label33:setHint("Qual a ordem dos meses?");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout2);
    obj.label34:setLeft(45);
    obj.label34:setTop(50);
    obj.label34:setWidth(110);
    obj.label34:setHeight(25);
    obj.label34:setText("Nome");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout2);
    obj.label35:setLeft(155);
    obj.label35:setTop(50);
    obj.label35:setWidth(55);
    obj.label35:setHeight(25);
    obj.label35:setText("Duração");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setHitTest(true);
    obj.label35:setHint("Quantos dias dura esse mês.");
    obj.label35:setName("label35");

    obj.rclMeses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMeses:setParent(obj.layout2);
    obj.rclMeses:setLeft(5);
    obj.rclMeses:setTop(80);
    obj.rclMeses:setWidth(240);
    obj.rclMeses:setHeight(260);
    obj.rclMeses:setName("rclMeses");
    obj.rclMeses:setField("listaMeses");
    obj.rclMeses:setTemplateForm("frmGerenciador02_MES");
    obj.rclMeses:setLayout("vertical");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout2);
    obj.dataLink9:setFields({'duracaoEstacao', 'dias'});
    obj.dataLink9:setName("dataLink9");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(250);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setName("rectangle3");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout4);
    obj.label36:setWidth(250);
    obj.label36:setHeight(20);
    obj.label36:setText("DIAS DA SEMANA");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout5);
    obj.button2:setLeft(10);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Novo");
    obj.button2:setName("button2");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(125);
    obj.label37:setTop(0);
    obj.label37:setWidth(40);
    obj.label37:setHeight(25);
    obj.label37:setText("Desvio");
    obj.label37:setHitTest(true);
    obj.label37:setHint("O ano 1 começa em quem dia da semana?");
    obj.label37:setName("label37");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout5);
    obj.edit60:setLeft(165);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(35);
    obj.edit60:setHeight(25);
    obj.edit60:setField("desvioSemana");
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setLeft(6);
    obj.label38:setTop(50);
    obj.label38:setWidth(30);
    obj.label38:setHeight(25);
    obj.label38:setText("Nº");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setHitTest(true);
    obj.label38:setHint("Qual a ordem dos dias da semana?");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setLeft(35);
    obj.label39:setTop(50);
    obj.label39:setWidth(165);
    obj.label39:setHeight(25);
    obj.label39:setText("Nome");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rclSemana = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSemana:setParent(obj.layout4);
    obj.rclSemana:setLeft(5);
    obj.rclSemana:setTop(80);
    obj.rclSemana:setWidth(240);
    obj.rclSemana:setHeight(260);
    obj.rclSemana:setName("rclSemana");
    obj.rclSemana:setField("listaSemana");
    obj.rclSemana:setTemplateForm("frmGerenciador02_SEMANA");
    obj.rclSemana:setLayout("vertical");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(275);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setName("rectangle4");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout6);
    obj.label40:setWidth(275);
    obj.label40:setHeight(20);
    obj.label40:setText("LUAS");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(25);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout7);
    obj.button3:setLeft(10);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Novo");
    obj.button3:setName("button3");

    obj.celestialBt = GUI.fromHandle(_obj_newObject("button"));
    obj.celestialBt:setParent(obj.layout7);
    obj.celestialBt:setLeft(35);
    obj.celestialBt:setTop(0);
    obj.celestialBt:setWidth(25);
    obj.celestialBt:setHeight(25);
    obj.celestialBt:setText("i");
    obj.celestialBt:setName("celestialBt");
    obj.celestialBt:setHint("Eventos Celestiais");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(15);
    obj.label41:setTop(50);
    obj.label41:setWidth(110);
    obj.label41:setHeight(25);
    obj.label41:setText("Nome");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(120);
    obj.label42:setTop(50);
    obj.label42:setWidth(55);
    obj.label42:setHeight(25);
    obj.label42:setText("Ciclo");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setHitTest(true);
    obj.label42:setHint("Quantos dias leva o ciclo lunar?");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout6);
    obj.label43:setLeft(155);
    obj.label43:setTop(50);
    obj.label43:setWidth(55);
    obj.label43:setHeight(25);
    obj.label43:setText("Desvio");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setHitTest(true);
    obj.label43:setHint("No ano 1 em que dia começa o ciclo lunar (lua cheia)?");
    obj.label43:setName("label43");

    obj.rclLuas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLuas:setParent(obj.layout6);
    obj.rclLuas:setLeft(5);
    obj.rclLuas:setTop(80);
    obj.rclLuas:setWidth(265);
    obj.rclLuas:setHeight(260);
    obj.rclLuas:setName("rclLuas");
    obj.rclLuas:setField("listaLuas");
    obj.rclLuas:setTemplateForm("frmGerenciador02_LUA");
    obj.rclLuas:setLayout("vertical");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(250);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setName("rectangle5");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout8);
    obj.label44:setWidth(250);
    obj.label44:setHeight(20);
    obj.label44:setText("ESTAÇÕES");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout9);
    obj.button4:setLeft(10);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setHint("Novo");
    obj.button4:setName("button4");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout9);
    obj.label45:setLeft(125);
    obj.label45:setTop(0);
    obj.label45:setWidth(40);
    obj.label45:setHeight(25);
    obj.label45:setText("Desvio");
    obj.label45:setHitTest(true);
    obj.label45:setHint("Em que dia do ano começa a primeira estação?");
    obj.label45:setName("label45");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout9);
    obj.edit61:setLeft(165);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(35);
    obj.edit61:setHeight(25);
    obj.edit61:setField("desvioEstacao");
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout8);
    obj.label46:setLeft(6);
    obj.label46:setTop(50);
    obj.label46:setWidth(30);
    obj.label46:setHeight(25);
    obj.label46:setText("Nº");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setHitTest(true);
    obj.label46:setHint("Qual a ordem das estações?");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout8);
    obj.label47:setLeft(45);
    obj.label47:setTop(50);
    obj.label47:setWidth(85);
    obj.label47:setHeight(25);
    obj.label47:setText("Nome");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout8);
    obj.label48:setLeft(130);
    obj.label48:setTop(50);
    obj.label48:setWidth(55);
    obj.label48:setHeight(25);
    obj.label48:setText("Duração");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setHitTest(true);
    obj.label48:setHint("Quantos dias dura essa estação?");
    obj.label48:setName("label48");

    obj.rclEstacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEstacoes:setParent(obj.layout8);
    obj.rclEstacoes:setLeft(5);
    obj.rclEstacoes:setTop(80);
    obj.rclEstacoes:setWidth(240);
    obj.rclEstacoes:setHeight(260);
    obj.rclEstacoes:setName("rclEstacoes");
    obj.rclEstacoes:setField("listaEstacoes");
    obj.rclEstacoes:setTemplateForm("frmGerenciador02_ESTACAO");
    obj.rclEstacoes:setLayout("vertical");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(210);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setName("rectangle6");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout10);
    obj.label49:setLeft(5);
    obj.label49:setTop(5);
    obj.label49:setWidth(30);
    obj.label49:setHeight(25);
    obj.label49:setText("Dia");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout10);
    obj.edit62:setLeft(5);
    obj.edit62:setTop(30);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setField("dia");
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout10);
    obj.label50:setLeft(35);
    obj.label50:setTop(5);
    obj.label50:setWidth(30);
    obj.label50:setHeight(25);
    obj.label50:setText("Mês");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout10);
    obj.edit63:setLeft(35);
    obj.edit63:setTop(30);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setField("mes");
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout10);
    obj.label51:setLeft(65);
    obj.label51:setTop(5);
    obj.label51:setWidth(40);
    obj.label51:setHeight(25);
    obj.label51:setText("Ano");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout10);
    obj.edit64:setLeft(65);
    obj.edit64:setTop(30);
    obj.edit64:setWidth(40);
    obj.edit64:setHeight(25);
    obj.edit64:setField("ano");
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout10);
    obj.label52:setLeft(105);
    obj.label52:setTop(5);
    obj.label52:setWidth(100);
    obj.label52:setHeight(25);
    obj.label52:setText("Era");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout10);
    obj.edit65:setLeft(105);
    obj.edit65:setTop(30);
    obj.edit65:setWidth(100);
    obj.edit65:setHeight(25);
    obj.edit65:setField("era");
    obj.edit65:setName("edit65");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout10);
    obj.button5:setLeft(5);
    obj.button5:setTop(55);
    obj.button5:setWidth(100);
    obj.button5:setHeight(25);
    obj.button5:setText("Avançar");
    obj.button5:setHint("Avança X dias no Calandario.");
    obj.button5:setName("button5");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout10);
    obj.edit66:setLeft(105);
    obj.edit66:setTop(55);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setField("add");
    obj.edit66:setName("edit66");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout10);
    obj.label53:setLeft(160);
    obj.label53:setTop(55);
    obj.label53:setWidth(45);
    obj.label53:setHeight(25);
    obj.label53:setText("Dias");
    obj.label53:setName("label53");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout10);
    obj.dataLink10:setField("add");
    obj.dataLink10:setDefaultValue("1");
    obj.dataLink10:setName("dataLink10");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout10);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("data");
    obj.textEditor1:setName("textEditor1");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(180);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(155);
    obj.layout11:setName("layout11");

    obj.dataLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.dataLabel:setParent(obj.layout11);
    obj.dataLabel:setLeft(0);
    obj.dataLabel:setTop(0);
    obj.dataLabel:setWidth(200);
    obj.dataLabel:setHeight(20);
    obj.dataLabel:setField("dataLabel");
    obj.dataLabel:setName("dataLabel");
    obj.dataLabel:setFontSize(10);

    obj.estacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.estacaoLabel:setParent(obj.layout11);
    obj.estacaoLabel:setLeft(0);
    obj.estacaoLabel:setTop(20);
    obj.estacaoLabel:setWidth(200);
    obj.estacaoLabel:setHeight(20);
    obj.estacaoLabel:setField("estacaoLabel");
    obj.estacaoLabel:setName("estacaoLabel");
    obj.estacaoLabel:setFontSize(10);

    obj.temperaturaLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.temperaturaLabel:setParent(obj.layout11);
    obj.temperaturaLabel:setLeft(0);
    obj.temperaturaLabel:setTop(40);
    obj.temperaturaLabel:setWidth(200);
    obj.temperaturaLabel:setHeight(20);
    obj.temperaturaLabel:setField("temperaturaLabel");
    obj.temperaturaLabel:setName("temperaturaLabel");
    obj.temperaturaLabel:setFontSize(10);
    obj.temperaturaLabel:setHitTest(true);

    obj.precipitacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.precipitacaoLabel:setParent(obj.layout11);
    obj.precipitacaoLabel:setLeft(0);
    obj.precipitacaoLabel:setTop(60);
    obj.precipitacaoLabel:setWidth(200);
    obj.precipitacaoLabel:setHeight(20);
    obj.precipitacaoLabel:setField("precipitacaoLabel");
    obj.precipitacaoLabel:setName("precipitacaoLabel");
    obj.precipitacaoLabel:setFontSize(10);
    obj.precipitacaoLabel:setHitTest(true);

    obj.ventoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.ventoLabel:setParent(obj.layout11);
    obj.ventoLabel:setLeft(0);
    obj.ventoLabel:setTop(80);
    obj.ventoLabel:setWidth(200);
    obj.ventoLabel:setHeight(20);
    obj.ventoLabel:setField("ventoLabel");
    obj.ventoLabel:setName("ventoLabel");
    obj.ventoLabel:setFontSize(10);
    obj.ventoLabel:setHitTest(true);

    obj.luasLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.luasLabel:setParent(obj.layout11);
    obj.luasLabel:setLeft(0);
    obj.luasLabel:setTop(100);
    obj.luasLabel:setWidth(200);
    obj.luasLabel:setHeight(35);
    obj.luasLabel:setField("luasLabel");
    obj.luasLabel:setName("luasLabel");
    obj.luasLabel:setFontSize(10);
    obj.luasLabel:setWordWrap(true);
    obj.luasLabel:setTextTrimming("none");

    obj.eventosLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.eventosLabel:setParent(obj.layout11);
    obj.eventosLabel:setLeft(0);
    obj.eventosLabel:setTop(135);
    obj.eventosLabel:setWidth(200);
    obj.eventosLabel:setHeight(20);
    obj.eventosLabel:setField("eventosLabel");
    obj.eventosLabel:setName("eventosLabel");
    obj.eventosLabel:setFontSize(10);
    obj.eventosLabel:setHitTest(true);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout10);
    obj.dataLink11:setFields({'dia', 'mes', 'ano', 'dias', 'duracaoEstacao', 'desvioSemana', 'desvioEstacao'});
    obj.dataLink11:setName("dataLink11");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						local type = sheet.sobrentural;
            						if type == "Raro" then
            							sheet.sobrentural_chance = 1;
            						elseif type == "Incomum" then
            							sheet.sobrentural_chance = 3;
            						elseif type == "Comum" then
            							sheet.sobrentural_chance = 7;
            						elseif type == "Constante" then
            							sheet.sobrentural_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.sobrentural_chance = 0;
            						end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.auroras;
            						if type == "Raro" then
            							sheet.auroras_chance = 1;
            						elseif type == "Incomum" then
            							sheet.auroras_chance = 3;
            						elseif type == "Comum" then
            							sheet.auroras_chance = 7;
            						elseif type == "Constante" then
            							sheet.auroras_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.auroras_chance = 0;
            						end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.cometas;
            						if type == "Raro" then
            							sheet.cometas_chance = 1;
            						elseif type == "Incomum" then
            							sheet.cometas_chance = 3;
            						elseif type == "Comum" then
            							sheet.cometas_chance = 7;
            						elseif type == "Constante" then
            							sheet.cometas_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.cometas_chance = 0;
            						end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.cadentes;
            						if type == "Raro" then
            							sheet.cadentes_chance = 1;
            						elseif type == "Incomum" then
            							sheet.cadentes_chance = 3;
            						elseif type == "Comum" then
            							sheet.cadentes_chance = 7;
            						elseif type == "Constante" then
            							sheet.cadentes_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.cadentes_chance = 0;
            						end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.lunar;
            						if type == "Raro" then
            							sheet.lunar_chance = 1;
            						elseif type == "Incomum" then
            							sheet.lunar_chance = 3;
            						elseif type == "Comum" then
            							sheet.lunar_chance = 7;
            						elseif type == "Constante" then
            							sheet.lunar_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.lunar_chance = 0;
            						end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.solar;
            						if type == "Raro" then
            							sheet.solar_chance = 1;
            						elseif type == "Incomum" then
            							sheet.solar_chance = 3;
            						elseif type == "Comum" then
            							sheet.solar_chance = 7;
            						elseif type == "Constante" then
            							sheet.solar_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.solar_chance = 0;
            						end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.meteoros;
            						if type == "Raro" then
            							sheet.meteoros_chance = 1;
            						elseif type == "Incomum" then
            							sheet.meteoros_chance = 3;
            						elseif type == "Comum" then
            							sheet.meteoros_chance = 7;
            						elseif type == "Constante" then
            							sheet.meteoros_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.meteoros_chance = 0;
            						end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.terremotos;
            						if type == "Raro" then
            							sheet.terremotos_chance = 1;
            						elseif type == "Incomum" then
            							sheet.terremotos_chance = 3;
            						elseif type == "Comum" then
            							sheet.terremotos_chance = 7;
            						elseif type == "Constante" then
            							sheet.terremotos_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.terremotos_chance = 0;
            						end;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local meses = ndb.getChildNodes(sheet.listaMeses);
            								local num = #meses + 1;
            
            								local node = self.rclMeses:append();
            								if node~=nil then
            									node.ordem = num;
            									node.mes = "Mês " .. num;
            									node.dias = 30;
            								end;
            
            								self.rclMeses:sort();
            							end;
        end, obj);

    obj._e_event9 = obj.rclMeses:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							if sheet.dias ~= sheet.duracaoEstacao then
            								self.dias.fontColor = "red";
            							else
            								self.dias.fontColor = "white";
            							end;
            						end;
        end, obj);

    obj._e_event11 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local semana = ndb.getChildNodes(sheet.listaSemana);
            								local num = #semana + 1;
            
            								local node = self.rclSemana:append();
            								if node~=nil then
            									node.ordem = num;
            									node.dia = "Dia " .. num;
            								end;
            
            								self.rclSemana:sort();
            							end;
        end, obj);

    obj._e_event12 = obj.rclSemana:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                        return 1;
            		                else   
            		                        return 0;
            		                end;
        end, obj);

    obj._e_event13 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local node = self.rclLuas:append();
            								if node~=nil then
            									node.luas = "Lua";
            									node.ciclo = 28;
            									node.desvio = 0;
            								end;
            
            								self.rclLuas:sort();
            							end;
        end, obj);

    obj._e_event14 = obj.celestialBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCelestial");
            							
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("bottomCenter", self.celestialBt);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de eventos celestiais para exibir");
            							end;
        end, obj);

    obj._e_event15 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local estacao = ndb.getChildNodes(sheet.listaEstacoes);
            								local num = #estacao + 1;
            
            								local node = self.rclEstacoes:append();
            								if node~=nil then
            									node.ordem = num;
            									node.estacao = "Estação " .. num;
            									node.dias = 90;
            								end;
            
            								self.rclEstacoes:sort();
            							end;
        end, obj);

    obj._e_event16 = obj.rclEstacoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event17 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            							local tempo = tonumber(sheet.tempo) or 1;
            							local add = tonumber(sheet.add) or 1;
            
            							tempo = tempo + add;
            							local tempoRestante = tempo;
            
            							local anoDuracao = tonumber(sheet.dias) or 1;
            							local ano = math.floor((tempo-1) / anoDuracao) + 1;
            							tempoRestante = tempoRestante - ((ano-1) * anoDuracao);
            
            							local meses = ndb.getChildNodes(sheet.listaMeses);
            							local mes = #meses;
            							local mesDuracao = 1;
            							local search = true;
            							local aux = 0;
            							for i=1, #meses, 1 do
            								if tempoRestante <= meses[i].cumulativo and search then
            									search = false;
            									mes = i-1;
            									if i > 1 then
            										aux = meses[i-1].cumulativo;
            									end;
            									tempoRestante = tempoRestante - aux;
            								end;
            							end;
            							if mes == #meses then
            								aux = meses[#meses].cumulativo; 
            								tempoRestante = tempoRestante - aux;
            							end;
            
            							sheet.tempo = tempo;
            							sheet.dia = tempoRestante;
            							sheet.mes = mes;
            							sheet.ano = ano;
            						end;
        end, obj);

    obj._e_event18 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							-- Reading sheet
            
            							local seed;
            							if sheet.seed == nil then
            								seed = math.random(1, 99999);
            								sheet.seed = seed;
            							else
            								seed = tonumber(sheet.seed) or 0;
            							end;
            
            							local dia = tonumber(sheet.dia) or 1;
            							local mes = tonumber(sheet.mes) or 1;
            							local ano = tonumber(sheet.ano) or 1;
            
            							local anoDuracao = tonumber(sheet.dias) or 1;
            							local duracaoEstacao = tonumber(sheet.duracaoEstacao) or 1;
            
            							local desvioSemana = tonumber(sheet.desvioSemana) or 0;
            							local desvioEstacao = tonumber(sheet.desvioEstacao) or 0;
            
            							local meses = ndb.getChildNodes(sheet.listaMeses);
            							local semana = ndb.getChildNodes(sheet.listaSemana); 
            							local estacoes = ndb.getChildNodes(sheet.listaEstacoes); 
            							local luas = ndb.getChildNodes(sheet.listaLuas); 
            
            							-- processing date
            
            							if meses[mes] == nil or #semana < 1 or #estacoes < 1 then
            								return;
            							end;
            							
            							local nomeMes = "not found";
            							for i=1, #meses, 1 do
            								if meses[i].ordem == mes then
            									nomeMes = meses[i].mes;
            								end;
            							end;
            
            							local diaDoAno = dia + meses[mes].cumulativo;
            							local tempo = diaDoAno + (ano-1) * anoDuracao;
            
            							local diaDaSemana = (tempo + desvioSemana) % #semana;
            							if diaDaSemana == 0 then
            								diaDaSemana = #semana;
            							end;
            							local nomeDiaDaSemana = "not found";
            							for i=1, #semana, 1 do
            								if semana[i].ordem == diaDaSemana then
            									nomeDiaDaSemana = semana[i].dia;
            								end;
            							end;
            
            							-- defining season
            							local estacao = 0;
            							local diaDaEstacao = (tempo - desvioEstacao) % duracaoEstacao;
            							if diaDaEstacao == 0 then
            								diaDaEstacao = duracaoEstacao;
            							end;
            							local estacaoPos = 0;
            							for i=1, #estacoes, 1 do
            								if diaDaEstacao > estacoes[i].cumulativo then
            									estacao = i;
            									estacaoPos = diaDaEstacao - estacoes[i].cumulativo;
            								end
            							end;
            							local estacaoNome = estacoes[estacao].estacao;
            
            							local estacaoEpoca = "fim";
            							local porcEstacao = estacaoPos / (tonumber(estacoes[estacao].dias) or 1);
            							if porcEstacao < 0.33 then
            								estacaoEpoca = "começo";
            							elseif porcEstacao < 0.67 then
            								estacaoEpoca = "meio";
            							end;
            
            							-- defining temperatures
            							math.randomseed(tempo + seed);
            
            							local mimTemp = 0;
            							local maxTemp = 0;
            
            							 -- The average temperature
            							local temperatures = {tonumber(estacoes[estacao].temperatura_1) or 0,tonumber(estacoes[estacao].temperatura_2) or 0,tonumber(estacoes[estacao].temperatura_3) or 0,tonumber(estacoes[estacao].temperatura_4) or 0,tonumber(estacoes[estacao].temperatura_5) or 0};
            
            							 -- The temperature variance
            							local temperaturesVar = {tonumber(estacoes[estacao].temperaturaVar_1) or 1,tonumber(estacoes[estacao].temperaturaVar_2) or 1,tonumber(estacoes[estacao].temperaturaVar_3) or 1,tonumber(estacoes[estacao].temperaturaVar_4) or 1,tonumber(estacoes[estacao].temperaturaVar_5) or 1};
            
            							-- The temperature chance
            							local temperaturesChances = {tonumber(estacoes[estacao].temperaturaChance_1) or 0,tonumber(estacoes[estacao].temperaturaChance_2) or 0,tonumber(estacoes[estacao].temperaturaChance_3) or 0,tonumber(estacoes[estacao].temperaturaChance_4) or 0,tonumber(estacoes[estacao].temperaturaChance_5) or 0};
            							for i=2, 5, 1 do 
            								temperaturesChances[i] = temperaturesChances[i-1] + temperaturesChances[i];
            							end;
            
            							local MinMaxTemps = {tonumber(estacoes[estacao].temperaturaMM_1) or 1,tonumber(estacoes[estacao].temperaturaMM_2) or 1,tonumber(estacoes[estacao].temperaturaMM_3) or 1,tonumber(estacoes[estacao].temperaturaMM_4) or 1,tonumber(estacoes[estacao].temperaturaMM_5) or 1};
            							local selected = 5;
            
            							-- Define temperature range to be used
            							local sensacao = "";
            							local dice1 = math.random(1, 100);
            							if dice1 <= temperaturesChances[1] then
            								selected = 1;
            								sensacao = "muito mais frio que o normal"
            							elseif dice1 <= temperaturesChances[2] then
            								selected = 2;
            								sensacao = "mais frio que o normal"
            							elseif dice1 <= temperaturesChances[3] then
            								selected = 3;
            								sensacao = "com a temperatura padrão"
            							elseif dice1 <= temperaturesChances[4] then
            								selected = 4;
            								sensacao = "mais quente que o normal"
            							else
            								selected = 5;
            								sensacao = "muito mais quente que o normal"
            							end;
            
            							local dice2 = math.random(1, temperaturesVar[selected]);
            							local baseTemp = temperatures[selected] + dice2;
            
            							-- Definine min and max temperature of the day
            							local dice3 = math.random(1, 100);
            							if dice3 <= temperaturesChances[1] then
            								selected = 1;
            							elseif dice3 <= temperaturesChances[2] then
            								selected = 2;
            							elseif dice3 <= temperaturesChances[3] then
            								selected = 3;
            							elseif dice3 <= temperaturesChances[4] then
            								selected = 4;
            							else
            								selected = 5;
            							end;
            
            							minTemp = 0 - MinMaxTemps[selected];
            							maxTemp = 0 + MinMaxTemps[selected];
            
            							-- defining rain
            							local intensidade;
            							local nevoa = false;
            
            							-- Define rain intensity chance
            							local intensidadeChance = {tonumber(estacoes[estacao].chuvaChance_1) or 0,tonumber(estacoes[estacao].chuvaChance_2) or 0,tonumber(estacoes[estacao].chuvaChance_3) or 0,tonumber(estacoes[estacao].chuvaChance_4) or 0,tonumber(estacoes[estacao].chuvaChance_5) or 0,tonumber(estacoes[estacao].chuvaChance_6) or 0};
            							for i=2, 6, 1 do 
            								intensidadeChance[i] = intensidadeChance[i-1] + intensidadeChance[i];
            							end;
            
            							local dice4 = math.random(1, 100);
            							local dice5;
            							if dice4 <= intensidadeChance[1] then
            								intensidade = 1;
            								dice5 = 0;
            							elseif dice4 <= intensidadeChance[2] then
            								intensidade = 2;
            								dice5 = math.random(1, 10);
            							elseif dice4 <= intensidadeChance[3] then
            								intensidade = 3;
            								dice5 = 0 - math.random(1, 3);
            							elseif dice4 <= intensidadeChance[4] then
            								intensidade = 4;
            								dice5 = 0 - math.random(1, 6);
            							elseif dice4 <= intensidadeChance[5] then
            								intensidade = 5;
            								dice5 = 0 - math.random(1, 8);
            							else
            								intensidade = 6;
            								dice5 = 0 - math.random(1, 10);
            							end;
            							baseTemp = baseTemp + dice5;
            
            							local dice6 = math.random(1, 100);
            							if dice6 > intensidadeChance[3] and dice6 <= intensidadeChance[4] then
            								nevoa = true;
            							end;
            
            							-- defining wind
            
            							-- define each wind intensity chance
            							local ventosChance = {tonumber(estacoes[estacao].ventosChance_1) or 0,tonumber(estacoes[estacao].ventosChance_2) or 0,tonumber(estacoes[estacao].ventosChance_3) or 0,tonumber(estacoes[estacao].ventosChance_4) or 0,tonumber(estacoes[estacao].ventosChance_5) or 0,tonumber(estacoes[estacao].ventosChance_6) or 0,tonumber(estacoes[estacao].ventosChance_7) or 0,tonumber(estacoes[estacao].ventosChance_8) or 0};
            							for i=2, 8, 1 do 
            								ventosChance[i] = ventosChance[i-1] + ventosChance[i];
            							end;
            
            							local ventos = 0;
            							local ventosVelocidade;
            
            							local dice7 = math.random(1, 100);
            
            							if dice7 <= ventosChance[1] then
            								ventos = 1;
            								ventosVelocidade = 0;
            								baseTemp = baseTemp + math.random(1, 10);
            							elseif dice7 <= ventosChance[2] then
            								ventos = 2;
            								ventosVelocidade = math.random(1, 16) - 1;
            								if ventosVelocidade == 0 then
            									ventos = 1;
            									baseTemp = baseTemp + math.random(1, 10);
            								end
            							elseif dice7 <= ventosChance[3] then
            								ventos = 3;
            								ventosVelocidade = math.random(1, 15) + 15;
            								baseTemp = baseTemp - math.random(1, 2);
            							elseif dice7 <= ventosChance[4] then
            								ventos = 4;
            								ventosVelocidade = math.random(1, 15) + 30;
            								baseTemp = baseTemp - math.random(1, 3);
            							elseif dice7 <= ventosChance[5] then
            								ventos = 5;
            								ventosVelocidade = math.random(1, 35) + 45;
            								baseTemp = baseTemp - math.random(1, 4);
            							elseif dice7 <= ventosChance[6] then
            								ventos = 6;
            								ventosVelocidade = math.random(1, 40) + 80;
            								baseTemp = baseTemp - math.random(1, 5);
            							elseif dice7 <= ventosChance[7] then
            								ventos = 7;
            								ventosVelocidade = math.random(1, 160) + 120;
            								baseTemp = baseTemp - math.random(1, 6);
            							else
            								ventos = 8;
            								ventosVelocidade = math.random(1, 200) + 280;
            								baseTemp = baseTemp - math.random(1, 8);
            							end;
            
            							-- Defining sandstorm
            
            							local areia = false;
            							local areiaMin = (tonumber(estacoes[estacao].areiaMin) or 9)
            							if intensidade == 1 and ventos >= estacoes[estacao].areiaMin then
            								areia = true;
            							end;
            
            							-- defining moons
            
            							local luasInfo = "";
            							local luasLabel = "";
            							if #luas > 1 then
            								luasInfo = "No céu as luas ";
            								luasLabel = "Luas: ";
            							elseif #luas > 0 then
            								luasInfo = "No céu a lua ";
            								luasLabel = "Lua: ";
            							end;
            							for i=1, #luas, 1 do
            								local ciclo = tonumber(luas[i].ciclo) or 1;
            								local desvio = tonumber(luas[i].desvio) or 0;
            
            								-- define day in the moon cicle
            								local diaCiclo = (tempo+desvio) % ciclo;
            								if diaCiclo == 0 then
            									diaCiclo = ciclo;
            								end;
            
            								local porcentagemCiclo = diaCiclo / ciclo;
            
            								if luas[i].luas == nil then
            									luas[i].luas = "Lua";
            								end;
            
            								-- define percentage of each phase
            								local phases = {0.125,0.25,0.375,0.5,0.625,0.75,0.875,1};
            								local durations = {luas[i].lua_cheia_duration,luas[i].lua_minguante_convexo_duration,luas[i].lua_quarto_minguante_duration,luas[i].lua_minguante_concavo_duration,luas[i].lua_lua_nova_duration,luas[i].lua_crescente_concavo_duration,luas[i].lua_quarto_crescente_duration,luas[i].lua_crescente_convexo_duration};
            								local pos = 0;
            								for j=1, 8, 1 do
            									pos = pos + (tonumber(durations[j]) or math.floor(ciclo/8));
            									phases[j] = (pos / ciclo);
            								end;
            
            								if porcentagemCiclo <= phases[1] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_cheia or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_cheia or "") .. ")";
            								elseif porcentagemCiclo <= phases[2] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_minguante_convexo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_minguante_convexo or "") .. ")";
            								elseif porcentagemCiclo <= phases[3] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_quarto_minguante or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_quarto_minguante or "") .. ")";
            								elseif porcentagemCiclo <= phases[4] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_minguante_concavo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_minguante_concavo or "") .. ")";
            								elseif porcentagemCiclo <= phases[5] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_lua_nova or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_lua_nova or "") .. ")";
            								elseif porcentagemCiclo <= phases[6] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_crescente_concavo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_crescente_concavo or "") .. ")";
            								elseif porcentagemCiclo <= phases[7] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_quarto_crescente or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_quarto_crescente or "") .. ")";
            								else
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_crescente_convexo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_crescente_convexo or "") .. ")";
            								end;
            
            								if i < #luas then
            									luasInfo = luasInfo .. ", ";
            									luasLabel = luasLabel .. ", ";
            								else
            									luasInfo = luasInfo .. ". ";
            									luasLabel = luasLabel .. ". ";
            								end;
            							end;
            							sheet.luasLabel = luasLabel;
            
            							-- defining celestial events
            
            							local eventChance = {};
            							eventChance[0] = 0;
            							local events = {sheet.sobrentural_chance, sheet.auroras_chance, sheet.cometas_chance, sheet.cadentes_chance, sheet.lunar_chance, sheet.solar_chance, sheet.meteoros_chance, sheet.terremotos_chance};
            
            							for i = 1, 8, 1 do 
            								eventChance[i] = eventChance[i-1] + (tonumber(events[i]) or 0);
            							end;
            							
            							local dice8 = math.random(1, 100);
            							local event = 0;
            							local subEvent = math.random(1, 10);
            							if dice8 <= eventChance[1] then
            								event = 1;
            							elseif dice8 <= eventChance[2] then
            								event = 2;
            							elseif dice8 <= eventChance[3] then
            								event = 3;
            							elseif dice8 <= eventChance[4] then
            								event = 4;
            							elseif dice8 <= eventChance[5] then
            								event = 5;
            								if #luas <1 then
            									event = 0;
            								end;
            							elseif dice8 <= eventChance[6] then
            								event = 6;
            							elseif dice8 <= eventChance[7] then
            								event = 7;
            							elseif dice8 <= eventChance[8] then
            								event = 8;
            							end;
            
            							-- finalizing
            							minTemp = minTemp + baseTemp;
            							maxTemp = maxTemp + baseTemp;
            
            							-- saving variables
            							sheet.tempo = tempo;
            							-- sheet.era = tempo;
            
            							-- Cleaning hints
            
            							self.temperaturaLabel.hint="A temperatura atinge seu ponto mais baixo de meia noite e mais alto de meio dia. ";
            							self.precipitacaoLabel.hint="";
            							self.ventoLabel.hint="";
            							self.eventosLabel.hint="";
            
            							-- defining message
            							local data = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana .. ". Era o " .. estacaoEpoca .. " do " .. estacaoNome .. ". Estava " .. sensacao .. " pra época, variando entre " .. minTemp .. "º C e " .. maxTemp .. "º C entre a noite e o dia. ";
            							sheet.dataLabel = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana;
            							sheet.estacaoLabel = estacaoNome .. " (" .. estacaoEpoca .. ")";
            							sheet.temperaturaLabel = "Temperatura: " .. minTemp .. "º C ~ " .. maxTemp .. "º C";
            
            							if minTemp < 5 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Frio: CD15 + 1/teste a cada hora contra 1d6 dano.";
            							elseif minTemp < -15 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Severo: CD15 + 1/teste a cada 10 minutos contra 1d6 dano. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif minTemp < -30 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Extremo: CD15 + 1/teste a cada minuto contra 1d4 dano. Criaturas vestindo armaduras de metal são afetadas por esfriar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif maxTemp > 32 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Quente: CD15 + 1/teste a cada hora contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. ";
            							elseif maxTemp > 43 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada 10 minutos contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif maxTemp > 60 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada minuto contra 1d6 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. riaturas vestindo armaduras de metal são afetadas por esquentar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							end;
            
            							if intensidade > 1 then
            								local precipitacao;
            								local labels;
            								local penalidades;
            								if baseTemp < 0 then
            									precipitacao = {"", "O dia estava nublado. ", "Pequenos flocos de neve caiam lentamente e durante todo o dia. ", "Nevava ao longo do dia, com pequenas e raras pausas. ", "Uma forte nevasca atingia a região cobrindo tudo com neve. ", "Estava caindo uma tempestade de granizo. Grandes pedras de gelo atingiam o chão. "};
            									labels = {"", "Nublado.", "Neve leve.", "Neve.", "Nevasca.", "Granizo."};
            									penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Deslocamento na neve custa 2 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. . Deslocamento na neve custa 4 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Pedras de gelo que causam 1d8 de dano por minuto caem em todos na região. Deslocamento na neve custa 4 quadrados. "};
            								else
            									precipitacao = {"", "O dia estava nublado. ", "Chuviscava, deixando tudo coberto por uma fina camada de água. ", "Chuvia ao longo do dia, com pequenas e raras pausas. ", "Um temporal atingia a região. ", "Uma forte tempestade atingia a região. Raios e trovões eram ouvidos ao longe. "};
            									labels = {"", "Nublado.", "Chuviscando.", "Chuva.", "Temporal.", "Tempestade."};
            									penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Raios que causam (1d10)d8 de dano caem aleatoriamente. "};
            								end;
            								data = data .. precipitacao[intensidade];
            								sheet.precipitacaoLabel = "Precipitação: " .. labels[intensidade];
            								self.precipitacaoLabel.hint = penalidades[intensidade];
            							else
            								sheet.precipitacaoLabel = "Precipitação: Nenhuma."
            							end;
            							if nevoa and baseTemp < 20 then
            								data = data .. "Uma forte neblina se espalhava, cobrindo tudo. ";
            								sheet.precipitacaoLabel = sheet.precipitacaoLabel .. " Névoa.";
            								self.precipitacaoLabel.hint = self.precipitacaoLabel.hint .. "\n Neblina obscurece visão além de 1,5m dando camuflagem (20%) a alvos distantes. ";
            							end;
            							if areia then
            								if ventos == 1 then
            									data = data .. "Não ventava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Sem vento."
            								elseif ventos == 2 then
            									data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h)."
            								elseif ventos == 3 then
            									data = data .. "Um vento Moderado de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            									sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar.";
            								elseif ventos == 4 then
            									data = data .. "Um vento Forte de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            									sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar, -2 Ouvir e -2 ataques a distancia.";
            								elseif ventos == 5 then
            									data = data .. "Um vento Severo de " .. ventosVelocidade .. "Km/h levantava a areia criando uma tempestade de areia que cobria tudo. ";
            									sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir e -4 ataques a distancia.";
            								elseif ventos == 6 then
            									data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h cria uma perigosa tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. ";
            								elseif ventos == 7 then
            									data = data .. "Um Furação de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. ";
            								else
            									data = data .. "Um Tornado de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            								end;
            							else
            								if ventos == 1 then
            									data = data .. "Não ventava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Sem vento.";
            								elseif ventos == 2 then
            									data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h).";
            								elseif ventos == 3 then
            									data = data .. "Uma vento Moderado " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. ";
            								elseif ventos == 4 then
            									data = data .. "Uma vento Forte de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas, -2 Ouvir e -2 ataques a distancia.";
            								elseif ventos == 5 then
            									data = data .. "Uma vento Severo de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas, -4 Ouvir e -4 ataques a distancia.";
            								elseif ventos == 6 then
            									data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h se formava e arrastava consigo tudo que podia. ";
            									sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas, -8 Ouvir e impossivel fazer ataques a distancia.";
            								elseif ventos == 7 then
            									data = data .. "Um Furacão se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            									sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. ";
            								else
            									data = data .. "Um Tornado se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            									sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h)."
            									self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            								end;
            							end;
            
            							data = data .. luasInfo;
            
            							if event > 0 then
            								if event == 1 then
            									local subEvent = math.random(1, 36);
            									
            									local sobrenatural = {"Toda vez que o vento soprava naquele dia era possivel ouvir estranhos sons trazidos de longe. Não se podia ver a origem daqueles sons nas proximidades. ", "Toda vez que o vento soprava naquele dia todos se sentiam como se ficassem leves e levitassem um pouco. ", "Uma estranha chuva de granizo começa. Cada granizo que toca o chão explode soltando um som como o de um trovão. ", "Durante a noite um estranho fenomeno ocorre. As estrelas do céu começam a cair num chuva de estrelas. Em pouco menos de uma hora todo céu ficava escuro. ", "As nuvens assumem a forma de teias e se espalham pelo céu de forma intricada. ", "Uma estranha nevoa surge pela manhã. Ela era densa e ficava muito difícil de atravessa-la. ", "Em certo ponto do dia diversas rachaduras começam a surgir no céu, causando ondas de choque e estrondos. ", "Todos acordam calmos, incapazes de sentir emoções fortes ou raiva. ", "Uma estranha chuva começa. Cada gota de chuva tinha uma cor diferente e brilhava. Ficando mais dificil de enchergar coisas distantes com precisão por conta de todas cores e brilhos. ", "Uma estranha neve começa a cair. Ela se espalhava mesmo sem vento, e caminhar por ela não deixava pegadas. ", "As nuvens adquirem uma luminosidade natural, como o sol ou a lua. Ficando tudo claro mesmo a noite. ", "Uma estranha chuva começa. Quanto mais vão ficando molhados, mais leves vão se tornando. Após alguns minutos os objetos molhados começam a flutuar. ", "Uma estranha neve começa a cair. Ela fazia um som relaxante e caia lentamente, deixando todos sonolentos. ", "Uma estranha neve começa a cair. Ela era pesada. Quanto mais se acumulava sobre algo mais seu peso ficava evidente. ", "Um estranho vento começa a soprar. Ele entrava mesmo em lugares completamente fechados, como se fosse incorporeo. ", "Grandes nuvens escuras de fumaça surgem no céu. Era possivel ver faiscas e chamas brancas saindo de seu interior. ", "Uma estranha chuva começa a cair. Assim que a água toca algo ela se congela. Cobrindo tudo em gelo. ", "Estranhas nuvens de tempestade negra surgem. Raios a atravessam sem ir em direção ao chão. O barulho dos trovões e do vento forte dificultam a audição. ", "Toda vez que o vento soprava era possivel ouvir os gritos dos mortos. Vozes do além, felizes ou tristes, podiam ser ouvidas em qualquer lugar. ", "Uma estranha tempestade começa. Cada vez que um raio parte o céu uma rachadura se abre, por onde é possivel ver outros mundos. ", "Estranhas nuvens de fumaça surgem no céu. Começa uma chuva estranha que se incendeia ao tocar qualquer coisa. ", "Um estranho vento começa a soprar, sempre vindo pelas costas e empurrando todos para frente. ", "Uma estranha neblina surge. Vez ou outra as pessoas que tentavam atravessa-la se encontram longe de onde estavam, em outro ponto da neblina. ", "O céu fica coberto de luzes douradas, algumas pessoas se sentem inspiradas e mais felizes. ", "Nuvens em forma de monstros surgem no céu. Sempre que o vento empurra uma para perto de outro elas brigam e se despedaçam. ", "Uma estranha chuva de granizo começa. Ao invés de blocos de gelo liso, pedras de gelo cheias de espinhos começam a cair. ", "Uma estranha nevoa vermelha cobre tudo. Dela era possivel ouvir o som de batalhas distantes e o sofrimento dos soldados. ", "O céu estava especialmente limpo. Nenhum sinal de nuvens. Tambem estava especialmente claro, mesmo em lugares de sombra. ", "Uma estranha chuva começa a cair de nuvens negra. Assim que a água escura toca algo ela se congela. Cobrindo tudo em gelo negro. ", "Uma tempestade estranha surge. As nuvens pareciam ter estranhas runas e grande quantidade de energia pode ser sentida emanando delas. ", "Uma estranha neve começa a cair. Ela era acizentada e fazia aqueles que a tocavam se sentirem mal. ", "O céu parece estranho e distorcido, sendo dificil entender sua forma. As nuvens pareciam retorcidas e as luzes pareciam fraquejar como se estivessem falhando. ", "Uma estranha chuva começa. Tudo que ela tocava começava a se dissolver lentamente. ", "Estranhos ventos quentes começam, acompanhados por faiscas e pequenas chamas. ", "Começa a chover de baixo pra cima. Água, de poços, lagos e rios começa a subir. ", "As núvens assumem a forma de engrenagens e começam a se conectar e girar, formando complexos mecanismos. "};
            									
            									local label = {"Vento Sussurrante", "Vento Ágil ", "Granizo Trovão", "Granizo Estrelar", "Nuvens de Teia", "Nevoa Solida", "Ceurremoto", "Calma Psiquica", "Chuva Prismatica", "Neve Fantasma", "Nuvens Brilhantes", "Chuva Levitante", "Neve do Sono", "Neve de Chumbo", "Vento Incorporeo", "Nuvens Incendiarias", "Chuva Congelante", "Tempestade Alucinogena", "Tempestade Fantasma", "Tempestade Planar", "Tempestade de Fogo", "Vento de Cauda", "Nevoa Eterea", "Céu Dourado", "Nuvens Monstro", "Nevasca Atroz", "Nevoa Vermelha", "Claridade Celestial", "Chuva Negra", "Tempestade Arcana", "Nevasca Negra", "Céu Aberrante", "Chuva Ácida", "Sopro Draconico", "Chuva Reversa", "Núvens Mecanicas"};
            
            									local efeitos = {"Qualquer criatura pode mandar uma mensagem ou som pra um local familiar escolhido. 50% de chance de apagar chamas desprotegidas. ", "Personagens podem voar com deslocamento de voo 12m bom, ou 9m se usar armadura media ou superior. 50% de chance de apagar chamas desprotegidas. ", "Causa 1d6 de dano por minuto. Torna testes de ouvir impossiveis. ", "Deixa o céu totalmente escuro. Barulho das estrelas caindo impoe -4 em ouvir. Estrelas voltam ao céu no dia seguinte. ", "Como a magia teia contra criaturas voadoras. ", "Como a magia nevoa solida. ", "Fortitude CD15 pra evitar surdez por uma hora. Fortitude CD15 para evitar 2d6 de dano em criaturas voadoras. ", "Remove todos efeitos de moral, furia, inspirar coragem, ou confusão. Criaturas não conseguem tomar ações violetas, mas podem se defender. ", "-8 em Observar. ", "+4 Furtividade, -4 Observar. Impossivel rastrear pegadas. Custa 2 quadrados para se mover pela neve. ", "Criaturas fracas contra luz do dia são afetadas como se fosse dia. ", "Criatuas molhadas voam subindo 6m por rodada. Chuva apaga chamas desprotegidas e tem 75% de chance de apagar chamas protegidas. -4 em ouvir, observar, e ataques a distancia. ", "Fortidude CD15 a cada hora para não dormir por 1h. -4 Observar, ouvir e ataques a distancia. Deslocamento custa o dobro. ", "Criatuas cobertas pela neve tomam 1d6 de dano por minuto. -8 Observar, ouvir e impossivel atacar a distancia. Apaga chamas desprotegidas e 50% de chance de apagar protegidas. Deslocamento custa o dobro. ", "Nega efeitos contra frio ou calor de roupas. Apenas bloqueado por energia. Apaga todas chamas. ", "Como a magia nuvem incendiaria", "Fortitude CD15 a cada hora. Na primeira falha deslocamento cai pela metade e -1 em ataques, CA e Reflexos. Na segunda falha Sofre de lentidão e penalidade aumenta pra -2. Na terceira falha fica presa em gelo e paralisada. Na quarta falha a criatura morre congelada. ", "-4 Ouvir e Observar. ", "Um personagem que passe 10 minutos chamando um espirito consegue sua atenção por 1d6 rodadas antes dele ser carregado pelo vento. -8 em ouvir, impossivel atacar a distancia. Apaga chamas desprotegidas, 75% de chance de apagar chamas protegidas. ", "Fortitude ou Vontade CD15 para criaturas voadoras não serem tragadas pra um plano aleatorio. ", "1d6 de dano por rodada por fogo. -4 Observar, Ouvir, e impossivel atacar a distancia. ", "Aumenta em 9m todos deslocamentos terrestres e de voo. ", "Vontade CD15 pra não ser teleportado pra lugar aleatorio da neblina a cada movimento. ", "Bonus moral de +1 em ataques e +2 em pericias para criaturas neutras e o dobro pra criaturas boas. ", "", "1d6 de dano por minuto, -4 em ouvir. ", "Vontade CD15 por minuto ou sofrer os efeitos de confusão. ", "+4 Observar, Ouvir, Sentir motivação. Dissipa confusão, medo ou ilusões. ", "Fortitude CD15 pra evitar nível negativo. -4 Observar, Ouvir e ataques a distancia. Apaga chamas desprotegidas e 75% das chamas protegidas. Deslocamento custa o dobro. ", "Aumenta em 1 a CD de todas magias. Aumenta em 1 os níveis de todos conjuradores. ", "Qualquer criatura morta durante a nevasca volta como uma aparição 1d4 rodadas depois. ", "Vontade 18 contra a magia insanidade, dura 1d6 horas. ", "1d6 de dano ácido por minuto. Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", "50% de chance de incendiar objetos inflamaveis. ", "Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", ""};
            
            									data = data .. sobrenatural[subEvent];
            									sheet.eventosLabel = "Eventos: " .. label[subEvent] .. ".";
            									self.eventosLabel.hint = efeitos[subEvent];
            								elseif event == 2 then
            									data = data .. "Durante a noite, o céu ficava coberto por uma Aurora. As grandes luzes se espalhavam pelo céu como panos de luz colorida. "
            									sheet.eventosLabel = "Eventos: Aurora."
            								elseif event == 3 then
            									data = data .. "Durante a noite, um cometa é visto atravessando os céus lentamente. Atravessando-o como uma linha de fogo. "
            									sheet.eventosLabel = "Eventos: Cometa."
            								elseif event == 4 then
            									local subEvent = math.random(1, 10);
            									if subEvent <= 7 then
            										data = data .. "Durante a noite, uma estrela cadente é vista cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrela Cadente."
            									elseif subEvent <= 9 then
            										data = data .. "Durante a noite, algumas estrelas cadentes podem ser vistas cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            									else
            										data = data .. "Durante a noite, frequentemente se pode ver estrelas cadentes cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            									end;
            								elseif event == 5 then
            									local subEvent = math.random(1, 4);
            									if subEvent <= 3 then
            										data = data .. "Durante a noite, um eclipse lunar penumbral ocorre. A lua fica vermelha, deixando tudo com uma aparencia avermelhada. "
            										sheet.eventosLabel = "Eventos: Lua de Sangue."
            									else
            										data = data .. "Durante a noite, um eclipse lunar ocorre. Deixando tudo escuro. "
            										sheet.eventosLabel = "Eventos: Eclipse Lunar."
            									end;
            								elseif event == 6 then
            									local subEvent = math.random(1, 4);
            									if subEvent <= 3 then
            										data = data .. "Durante o dia, um eclipse solar anular ocorre. O sol fica coberto por uma mancha negra, mas era possivel ver o circulo de fogo em volta da mancha. "
            										sheet.eventosLabel = "Eventos: Eclipse Solar Anular."
            									else
            										data = data .. "Durante o dia, um eclipse solar ocorre. Deixando tudo escuro por alguns minutos. "
            										sheet.eventosLabel = "Eventos: Eclipse Solar."
            									end;
            								elseif event == 7 then
            									local subEvent = math.random(1, 10);
            									if subEvent <= 7 then
            										data = data .. "Durante a noite, uma fraca chuva de meteoros é vista. Algumas vezes era possivel ver pequenos meteoros cruzando o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									elseif subEvent <= 9 then
            										data = data .. "Durante a noite, uma chuva de meteoros é vista. Varias vezes era possivel perceber os pequenos meteoros cruzando o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									else
            										data = data .. "Durante a noite, uma forte chuva de meteoros é vista. Dezenas de meteoros iluminam o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									end;
            								elseif event == 8 then
            									data = data .. "Em certo momento do dia um terremoto começa, fazendo o chão se tremer e derrubando construções e objetos. ";
            									sheet.eventosLabel = "Eventos: Terremoto."
            								end;
            							else
            								sheet.eventosLabel = "Eventos: Nenhum."
            							end;
            							sheet.data = data;
            						end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.precipitacaoLabel ~= nil then self.precipitacaoLabel:destroy(); self.precipitacaoLabel = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLabel ~= nil then self.dataLabel:destroy(); self.dataLabel = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.popClima ~= nil then self.popClima:destroy(); self.popClima = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclSemana ~= nil then self.rclSemana:destroy(); self.rclSemana = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.rclMeses ~= nil then self.rclMeses:destroy(); self.rclMeses = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.celestialBt ~= nil then self.celestialBt:destroy(); self.celestialBt = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.estacaoLabel ~= nil then self.estacaoLabel:destroy(); self.estacaoLabel = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.popMoon ~= nil then self.popMoon:destroy(); self.popMoon = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.ventoLabel ~= nil then self.ventoLabel:destroy(); self.ventoLabel = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.eventosLabel ~= nil then self.eventosLabel:destroy(); self.eventosLabel = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.rclEstacoes ~= nil then self.rclEstacoes:destroy(); self.rclEstacoes = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.popCelestial ~= nil then self.popCelestial:destroy(); self.popCelestial = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.luasLabel ~= nil then self.luasLabel:destroy(); self.luasLabel = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.rclLuas ~= nil then self.rclLuas:destroy(); self.rclLuas = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.temperaturaLabel ~= nil then self.temperaturaLabel:destroy(); self.temperaturaLabel = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.dias ~= nil then self.dias:destroy(); self.dias = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciador02()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciador02();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciador02 = {
    newEditor = newfrmGerenciador02, 
    new = newfrmGerenciador02, 
    name = "frmGerenciador02", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador02 = _frmGerenciador02;
Firecast.registrarForm(_frmGerenciador02);

return _frmGerenciador02;
