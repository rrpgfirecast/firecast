require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador02()
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
    obj:setName("frmGerenciador02");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.popClima = gui.fromHandle(_obj_newObject("popup"));
    obj.popClima:setParent(obj.scrollBox1);
    obj.popClima:setName("popClima");
    obj.popClima:setWidth(200);
    obj.popClima:setHeight(100);
    obj.popClima:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popClima);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(70);
    obj.flowPart1:setMaxWidth(70);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Temperatura");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(150);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setName("flowPart2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart2);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setField("temperatura");
    obj.comboBox1:setItems({'Glacial', 'Frio', 'Temperado', 'Morno', 'Quente', 'Infernal'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(70);
    obj.flowPart3:setMaxWidth(70);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart3);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Precipitação");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(150);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setName("flowPart4");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart4);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setField("chuvas");
    obj.comboBox2:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setName("comboBox2");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(70);
    obj.flowPart5:setMaxWidth(70);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart5);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Areia");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(150);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setName("flowPart6");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart6);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setField("areia");
    obj.comboBox3:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(70);
    obj.flowPart7:setMaxWidth(70);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart7);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Ventos");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(150);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setName("flowPart8");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.flowPart8);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setField("ventos");
    obj.comboBox4:setItems({'Nenhum', 'Pouco', 'Razoável', 'Muito', 'Constante'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.popCelestial = gui.fromHandle(_obj_newObject("popup"));
    obj.popCelestial:setParent(obj.scrollBox1);
    obj.popCelestial:setName("popCelestial");
    obj.popCelestial:setWidth(200);
    obj.popCelestial:setHeight(190);
    obj.popCelestial:setBackOpacity(0.4);

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popCelestial);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(2);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(150);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart9);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Eventos Celestes");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setMinWidth(70);
    obj.flowPart10:setMaxWidth(70);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart10);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Sobrenatural");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.flowPart11 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setMinWidth(100);
    obj.flowPart11:setMaxWidth(150);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart11);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setField("sobrentural");
    obj.comboBox5:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.flowPart12 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setMinWidth(70);
    obj.flowPart12:setMaxWidth(70);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart12);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Aurora");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.flowPart13 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setMinWidth(100);
    obj.flowPart13:setMaxWidth(150);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart13);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setField("auroras");
    obj.comboBox6:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(70);
    obj.flowPart14:setMaxWidth(70);
    obj.flowPart14:setHeight(15);
    obj.flowPart14:setName("flowPart14");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart14);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Cometas");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(100);
    obj.flowPart15:setMaxWidth(150);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart15);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setField("cometas");
    obj.comboBox7:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(70);
    obj.flowPart16:setMaxWidth(70);
    obj.flowPart16:setHeight(15);
    obj.flowPart16:setName("flowPart16");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart16);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Estrela Cadente");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(100);
    obj.flowPart17:setMaxWidth(150);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart17);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setField("cadentes");
    obj.comboBox8:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(70);
    obj.flowPart18:setMaxWidth(70);
    obj.flowPart18:setHeight(15);
    obj.flowPart18:setName("flowPart18");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart18);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Eclipse Lunar");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(100);
    obj.flowPart19:setMaxWidth(150);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart19);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setField("lunar");
    obj.comboBox9:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(70);
    obj.flowPart20:setMaxWidth(70);
    obj.flowPart20:setHeight(15);
    obj.flowPart20:setName("flowPart20");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart20);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Eclipse Solar");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(100);
    obj.flowPart21:setMaxWidth(150);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart21);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setField("solar");
    obj.comboBox10:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");

    obj.flowPart22 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(70);
    obj.flowPart22:setMaxWidth(70);
    obj.flowPart22:setHeight(15);
    obj.flowPart22:setName("flowPart22");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart22);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Meteoros");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowPart23 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(100);
    obj.flowPart23:setMaxWidth(150);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.flowPart23);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setField("meteoros");
    obj.comboBox11:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.flowPart24 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(70);
    obj.flowPart24:setMaxWidth(70);
    obj.flowPart24:setHeight(15);
    obj.flowPart24:setName("flowPart24");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart24);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Terremotos");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.flowPart25 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(100);
    obj.flowPart25:setMaxWidth(150);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.comboBox12 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart25);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setField("terremotos");
    obj.comboBox12:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1020);
    obj.layout1:setHeight(345);
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(250);
    obj.layout2:setHeight(345);
    obj.layout2:setName("layout2");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setWidth(250);
    obj.label14:setHeight(20);
    obj.label14:setText("MESES");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(10);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Novo");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setLeft(35);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("O");
    obj.button2:setHint("Organizar");
    obj.button2:setName("button2");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(115);
    obj.label15:setTop(0);
    obj.label15:setWidth(40);
    obj.label15:setHeight(25);
    obj.label15:setText("Total");
    obj.label15:setHitTest(true);
    obj.label15:setHint("Quantos dias dura o ano.");
    obj.label15:setName("label15");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(165);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.dias = gui.fromHandle(_obj_newObject("label"));
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

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(6);
    obj.label16:setTop(50);
    obj.label16:setWidth(30);
    obj.label16:setHeight(25);
    obj.label16:setText("Nº");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setHitTest(true);
    obj.label16:setHint("Qual a ordem dos meses?");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(45);
    obj.label17:setTop(50);
    obj.label17:setWidth(110);
    obj.label17:setHeight(25);
    obj.label17:setText("Nome");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setLeft(155);
    obj.label18:setTop(50);
    obj.label18:setWidth(55);
    obj.label18:setHeight(25);
    obj.label18:setText("Duração");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setHitTest(true);
    obj.label18:setHint("Quantos dias dura esse mês.");
    obj.label18:setName("label18");

    obj.rclMeses = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMeses:setParent(obj.layout2);
    obj.rclMeses:setLeft(5);
    obj.rclMeses:setTop(80);
    obj.rclMeses:setWidth(240);
    obj.rclMeses:setHeight(260);
    obj.rclMeses:setName("rclMeses");
    obj.rclMeses:setField("listaMeses");
    obj.rclMeses:setTemplateForm("frmGerenciador02_MES");
    obj.rclMeses:setLayout("vertical");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'duracaoEstacao', 'dias'});
    obj.dataLink1:setName("dataLink1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(255);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(345);
    obj.layout4:setName("layout4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setName("rectangle3");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout4);
    obj.label19:setWidth(250);
    obj.label19:setHeight(20);
    obj.label19:setText("DIAS DA SEMANA");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout5);
    obj.button3:setLeft(10);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Novo");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout5);
    obj.button4:setLeft(35);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("O");
    obj.button4:setHint("Organizar");
    obj.button4:setName("button4");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout5);
    obj.label20:setLeft(125);
    obj.label20:setTop(0);
    obj.label20:setWidth(40);
    obj.label20:setHeight(25);
    obj.label20:setText("Desvio");
    obj.label20:setHitTest(true);
    obj.label20:setHint("O ano 1 começa em quem dia da semana?");
    obj.label20:setName("label20");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setLeft(165);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(35);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desvioSemana");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(6);
    obj.label21:setTop(50);
    obj.label21:setWidth(30);
    obj.label21:setHeight(25);
    obj.label21:setText("Nº");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setHitTest(true);
    obj.label21:setHint("Qual a ordem dos dias da semana?");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(35);
    obj.label22:setTop(50);
    obj.label22:setWidth(165);
    obj.label22:setHeight(25);
    obj.label22:setText("Nome");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rclSemana = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSemana:setParent(obj.layout4);
    obj.rclSemana:setLeft(5);
    obj.rclSemana:setTop(80);
    obj.rclSemana:setWidth(240);
    obj.rclSemana:setHeight(260);
    obj.rclSemana:setName("rclSemana");
    obj.rclSemana:setField("listaSemana");
    obj.rclSemana:setTemplateForm("frmGerenciador02_SEMANA");
    obj.rclSemana:setLayout("vertical");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(510);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(250);
    obj.layout6:setHeight(345);
    obj.layout6:setName("layout6");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setName("rectangle4");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout6);
    obj.label23:setWidth(250);
    obj.label23:setHeight(20);
    obj.label23:setText("LUAS");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(25);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout7);
    obj.button5:setLeft(10);
    obj.button5:setTop(0);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Novo");
    obj.button5:setName("button5");

    obj.celestialBt = gui.fromHandle(_obj_newObject("button"));
    obj.celestialBt:setParent(obj.layout7);
    obj.celestialBt:setLeft(35);
    obj.celestialBt:setTop(0);
    obj.celestialBt:setWidth(25);
    obj.celestialBt:setHeight(25);
    obj.celestialBt:setText("i");
    obj.celestialBt:setName("celestialBt");
    obj.celestialBt:setHint("Eventos Celestiais");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout6);
    obj.label24:setLeft(15);
    obj.label24:setTop(50);
    obj.label24:setWidth(110);
    obj.label24:setHeight(25);
    obj.label24:setText("Nome");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout6);
    obj.label25:setLeft(120);
    obj.label25:setTop(50);
    obj.label25:setWidth(55);
    obj.label25:setHeight(25);
    obj.label25:setText("Ciclo");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setHitTest(true);
    obj.label25:setHint("Quantos dias leva o ciclo lunar?");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout6);
    obj.label26:setLeft(155);
    obj.label26:setTop(50);
    obj.label26:setWidth(55);
    obj.label26:setHeight(25);
    obj.label26:setText("Desvio");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setHitTest(true);
    obj.label26:setHint("No ano 1 em que dia começa o ciclo lunar (lua cheia)?");
    obj.label26:setName("label26");

    obj.rclLuas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclLuas:setParent(obj.layout6);
    obj.rclLuas:setLeft(5);
    obj.rclLuas:setTop(80);
    obj.rclLuas:setWidth(240);
    obj.rclLuas:setHeight(260);
    obj.rclLuas:setName("rclLuas");
    obj.rclLuas:setField("listaLuas");
    obj.rclLuas:setTemplateForm("frmGerenciador02_LUA");
    obj.rclLuas:setLayout("vertical");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(765);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(345);
    obj.layout8:setName("layout8");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setName("rectangle5");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout8);
    obj.label27:setWidth(250);
    obj.label27:setHeight(20);
    obj.label27:setText("ESTAÇÕES");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout9);
    obj.button6:setLeft(10);
    obj.button6:setTop(0);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setHint("Novo");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout9);
    obj.button7:setLeft(35);
    obj.button7:setTop(0);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("O");
    obj.button7:setHint("Organizar");
    obj.button7:setName("button7");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout9);
    obj.label28:setLeft(125);
    obj.label28:setTop(0);
    obj.label28:setWidth(40);
    obj.label28:setHeight(25);
    obj.label28:setText("Desvio");
    obj.label28:setHitTest(true);
    obj.label28:setHint("Em que dia do ano começa a primeira estação?");
    obj.label28:setName("label28");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout9);
    obj.edit2:setLeft(165);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(35);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desvioEstacao");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout8);
    obj.label29:setLeft(6);
    obj.label29:setTop(50);
    obj.label29:setWidth(30);
    obj.label29:setHeight(25);
    obj.label29:setText("Nº");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setHitTest(true);
    obj.label29:setHint("Qual a ordem das estações?");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout8);
    obj.label30:setLeft(45);
    obj.label30:setTop(50);
    obj.label30:setWidth(85);
    obj.label30:setHeight(25);
    obj.label30:setText("Nome");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout8);
    obj.label31:setLeft(130);
    obj.label31:setTop(50);
    obj.label31:setWidth(55);
    obj.label31:setHeight(25);
    obj.label31:setText("Duração");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setHitTest(true);
    obj.label31:setHint("Quantos dias dura essa estação?");
    obj.label31:setName("label31");

    obj.rclEstacoes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEstacoes:setParent(obj.layout8);
    obj.rclEstacoes:setLeft(5);
    obj.rclEstacoes:setTop(80);
    obj.rclEstacoes:setWidth(240);
    obj.rclEstacoes:setHeight(260);
    obj.rclEstacoes:setName("rclEstacoes");
    obj.rclEstacoes:setField("listaEstacoes");
    obj.rclEstacoes:setTemplateForm("frmGerenciador02_ESTACAO");
    obj.rclEstacoes:setLayout("vertical");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(1020);
    obj.layout10:setTop(0);
    obj.layout10:setWidth(210);
    obj.layout10:setHeight(345);
    obj.layout10:setName("layout10");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setName("rectangle6");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout10);
    obj.label32:setLeft(5);
    obj.label32:setTop(5);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setText("Dia");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout10);
    obj.edit3:setLeft(5);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setField("dia");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout10);
    obj.label33:setLeft(35);
    obj.label33:setTop(5);
    obj.label33:setWidth(30);
    obj.label33:setHeight(25);
    obj.label33:setText("Mês");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout10);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setField("mes");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout10);
    obj.label34:setLeft(65);
    obj.label34:setTop(5);
    obj.label34:setWidth(40);
    obj.label34:setHeight(25);
    obj.label34:setText("Ano");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout10);
    obj.edit5:setLeft(65);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ano");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout10);
    obj.label35:setLeft(105);
    obj.label35:setTop(5);
    obj.label35:setWidth(100);
    obj.label35:setHeight(25);
    obj.label35:setText("Era");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setLeft(105);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("era");
    obj.edit6:setName("edit6");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout10);
    obj.button8:setLeft(5);
    obj.button8:setTop(55);
    obj.button8:setWidth(100);
    obj.button8:setHeight(25);
    obj.button8:setText("Avançar");
    obj.button8:setHint("Avança X dias no Calandario.");
    obj.button8:setName("button8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setLeft(105);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("add");
    obj.edit7:setName("edit7");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout10);
    obj.label36:setLeft(160);
    obj.label36:setTop(55);
    obj.label36:setWidth(45);
    obj.label36:setHeight(25);
    obj.label36:setText("Dias");
    obj.label36:setName("label36");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setField("add");
    obj.dataLink2:setDefaultValue("1");
    obj.dataLink2:setName("dataLink2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout10);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("data");
    obj.textEditor1:setName("textEditor1");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(180);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(155);
    obj.layout11:setName("layout11");

    obj.dataLabel = gui.fromHandle(_obj_newObject("label"));
    obj.dataLabel:setParent(obj.layout11);
    obj.dataLabel:setLeft(0);
    obj.dataLabel:setTop(0);
    obj.dataLabel:setWidth(200);
    obj.dataLabel:setHeight(20);
    obj.dataLabel:setField("dataLabel");
    obj.dataLabel:setName("dataLabel");
    obj.dataLabel:setFontSize(10);

    obj.estacaoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.estacaoLabel:setParent(obj.layout11);
    obj.estacaoLabel:setLeft(0);
    obj.estacaoLabel:setTop(20);
    obj.estacaoLabel:setWidth(200);
    obj.estacaoLabel:setHeight(20);
    obj.estacaoLabel:setField("estacaoLabel");
    obj.estacaoLabel:setName("estacaoLabel");
    obj.estacaoLabel:setFontSize(10);

    obj.temperaturaLabel = gui.fromHandle(_obj_newObject("label"));
    obj.temperaturaLabel:setParent(obj.layout11);
    obj.temperaturaLabel:setLeft(0);
    obj.temperaturaLabel:setTop(40);
    obj.temperaturaLabel:setWidth(200);
    obj.temperaturaLabel:setHeight(20);
    obj.temperaturaLabel:setField("temperaturaLabel");
    obj.temperaturaLabel:setName("temperaturaLabel");
    obj.temperaturaLabel:setFontSize(10);
    obj.temperaturaLabel:setHitTest(true);

    obj.precipitacaoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.precipitacaoLabel:setParent(obj.layout11);
    obj.precipitacaoLabel:setLeft(0);
    obj.precipitacaoLabel:setTop(60);
    obj.precipitacaoLabel:setWidth(200);
    obj.precipitacaoLabel:setHeight(20);
    obj.precipitacaoLabel:setField("precipitacaoLabel");
    obj.precipitacaoLabel:setName("precipitacaoLabel");
    obj.precipitacaoLabel:setFontSize(10);
    obj.precipitacaoLabel:setHitTest(true);

    obj.ventoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.ventoLabel:setParent(obj.layout11);
    obj.ventoLabel:setLeft(0);
    obj.ventoLabel:setTop(80);
    obj.ventoLabel:setWidth(200);
    obj.ventoLabel:setHeight(20);
    obj.ventoLabel:setField("ventoLabel");
    obj.ventoLabel:setName("ventoLabel");
    obj.ventoLabel:setFontSize(10);
    obj.ventoLabel:setHitTest(true);

    obj.luasLabel = gui.fromHandle(_obj_newObject("label"));
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

    obj.eventosLabel = gui.fromHandle(_obj_newObject("label"));
    obj.eventosLabel:setParent(obj.layout11);
    obj.eventosLabel:setLeft(0);
    obj.eventosLabel:setTop(135);
    obj.eventosLabel:setWidth(200);
    obj.eventosLabel:setHeight(20);
    obj.eventosLabel:setField("eventosLabel");
    obj.eventosLabel:setName("eventosLabel");
    obj.eventosLabel:setFontSize(10);
    obj.eventosLabel:setHitTest(true);

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setFields({'dia', 'mes', 'ano', 'dias', 'duracaoEstacao', 'desvioSemana', 'desvioEstacao'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
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

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclMeses:sort();
        end, obj);

    obj._e_event2 = obj.rclMeses:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            							if sheet.dias ~= sheet.duracaoEstacao then
            								self.dias.fontColor = "red";
            							else
            								self.dias.fontColor = "white";
            							end;
            						end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
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

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclSemana:sort();
        end, obj);

    obj._e_event6 = obj.rclSemana:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                        return 1;
            		                else   
            		                        return 0;
            		                end;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (self)
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

    obj._e_event8 = obj.celestialBt:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popCelestial");
            							
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("bottomCenter", self.celestialBt);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de eventos celestiais para exibir");
            							end;
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (self)
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

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (self)
            self.rclEstacoes:sort();
        end, obj);

    obj._e_event11 = obj.rclEstacoes:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event12 = obj.button8:addEventListener("onClick",
        function (self)
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

    obj._e_event13 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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
            
            						local temperatures;
            						local temperaturesVar;
            						local variances = {1, 2, 3, 4, 5};
            						local selected = 5;
            						if estacoes[estacao].temperatura == "Infernal" then
            							temperatures = {31, 35, 41, 49, 57};
            							temperaturesVar = {4, 6, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Quente" then
            							temperatures = {25, 27, 29, 33, 39};
            							temperaturesVar = {2, 2, 4, 6, 6};
            						elseif estacoes[estacao].temperatura == "Morno" then
            							temperatures = {20, 22, 24, 26, 30};
            							temperaturesVar = {3, 2, 2, 4, 6};
            						elseif estacoes[estacao].temperatura == "Frio" then
            							temperatures = {-31, -23, -15, -7, 1};
            							temperaturesVar = {8, 8, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Glacial" then
            							temperatures = {-46, -36, -26, -16, -6};
            							temperaturesVar = {10, 10, 10, 10, 10};
            						else
            							temperatures = {10, 14, 18, 22, 26};
            							temperaturesVar = {4, 4, 4, 4, 4};
            						end;
            
            						local sensacao = "";
            						local dice1 = math.random(1, 100);
            						if dice1 <= 5 then
            							selected = 1;
            							sensacao = "muito mais frio que o normal"
            						elseif dice1 <= 25 then
            							selected = 2;
            							sensacao = "mais frio que o normal"
            						elseif dice1 <= 75 then
            							selected = 3;
            							sensacao = "com a temperatura padrão"
            						elseif dice1 <= 95 then
            							selected = 4;
            							sensacao = "mais quente que o normal"
            						else
            							selected = 5;
            							sensacao = "muito mais quente que o normal"
            						end;
            
            						local dice2 = math.random(1, temperaturesVar[selected]);
            						local baseTemp = temperatures[selected] + dice2;
            
            						local dice3 = math.random(1, 100);
            						if dice3 <= 5 then
            							selected = 1;
            						elseif dice3 <= 25 then
            							selected = 2;
            						elseif dice3 <= 75 then
            							selected = 3;
            						elseif dice3 <= 95 then
            							selected = 4;
            						else
            							selected = 5;
            						end;
            
            						minTemp = 0 - variances[selected];
            						maxTemp = 0 + variances[selected];
            
            						-- defining rain
            
            						local intensidade;
            						local nevoa = false;
            						local intensidadeChance;
            						if estacoes[estacao].chuvas == "Nenhuma" then
            							intensidadeChance = {100, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].chuvas == "Razoável" then
            							intensidadeChance = {80, 86, 92, 97, 99, 100};
            						elseif estacoes[estacao].chuvas == "Muita" then
            							intensidadeChance = {60, 70, 83, 92, 97, 100};
            						elseif estacoes[estacao].chuvas == "Constante" then
            							intensidadeChance = {0, 10, 45, 80, 95, 100};
            						else
            							intensidadeChance = {90, 93, 96, 99, 100, 101};
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
            
            						local ventosChance;
            						local ventos;
            						local ventosVelocidade;
            
            						if estacoes[estacao].ventos == "Nenhum" then
            							ventosChance = {100, 101, 101, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].ventos == "Razoável" then
            							ventosChance = {0, 70, 85, 95, 99, 100, 101, 101};
            						elseif estacoes[estacao].ventos == "Muito" then
            							ventosChance = {0, 50, 70, 80, 90, 95, 99, 100};
            						elseif estacoes[estacao].ventos == "Constante" then
            							ventosChance = {0, 25, 50, 65, 80, 90, 98, 100};
            						else
            							ventosChance = {0, 89, 99, 100, 101, 101, 101, 101};
            						end;
            
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
            
            						-- Defining sand
            
            						local areia = false;
            						if estacoes[estacao].areia == "Pouca" and intensidade == 1 and ventos >= 6 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Razoável" and intensidade == 1 and ventos >= 5 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Muita" and intensidade == 1 and ventos >= 4 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Constante" and intensidade == 1 and ventos >= 3 then
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
            
            							local diaCiclo = (tempo+desvio) % ciclo;
            							if diaCiclo == 0 then
            								diaCiclo = ciclo;
            							end;
            
            							local porcentagemCiclo = diaCiclo / ciclo;
            
            							if luas[i].luas == nil then
            								luas[i].luas = "Lua";
            							end;
            
            							if porcentagemCiclo <= 0.125 then
            								luasInfo = luasInfo .. luas[i].luas .. " cheia";
            								luasLabel = luasLabel .. luas[i].luas .. " (cheia)";
            							elseif porcentagemCiclo <= 0.25 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante convexo)";
            							elseif porcentagemCiclo <= 0.375 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto minguante";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto minguante)";
            							elseif porcentagemCiclo <= 0.5 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante concavo)";
            							elseif porcentagemCiclo <= 0.625 then
            								luasInfo = luasInfo .. luas[i].luas .. " em lua nova";
            								luasLabel = luasLabel .. luas[i].luas .. " (lua nova)";
            							elseif porcentagemCiclo <= 0.75 then
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente concavo)";
            							elseif porcentagemCiclo <= 0.875 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto crescente";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto crescente)";
            							else
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente convexo)";
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
            						local eventType = {sheet.sobrentural, sheet.auroras, sheet.cometas, sheet.cadentes, sheet.lunar, sheet.solar, sheet.meteoros, sheet.terremotos};
            
            						for i = 1, 8, 1 do 
            							if eventType[i] == "Raro" then
            								eventChance[i] = eventChance[i-1] + 1;
            							elseif eventType[i] == "Incomum" then
            								eventChance[i] = eventChance[i-1] + 3;
            							elseif eventType[i] == "Comum" then
            								eventChance[i] = eventChance[i-1] + 7;
            							elseif eventType[i] == "Constante" then
            								eventChance[i] = eventChance[i-1] + 14;
            							else
            								eventChance[i] = eventChance[i-1];
            							end;
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
            
            						-- finalazing
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
            						sheet.temperaturaLabel = "Temperatura: " .. minTemp .. "º C - " .. maxTemp .. "º C";
            
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
            								if subEvent <= 3 then
            									data = data .. "Durante a noite, um eclipse lunar penumbral ocorre. A lua fica vermelha, deixando tudo com uma aparencia avermelhada. "
            									sheet.eventosLabel = "Eventos: Lua de Sangue."
            								else
            									data = data .. "Durante a noite, um eclipse lunar ocorre. Deixando tudo escuro. "
            									sheet.eventosLabel = "Eventos: Eclipse Lunar."
            								end;
            							elseif event == 6 then
            								if subEvent <= 3 then
            									data = data .. "Durante o dia, um eclipse solar anular ocorre. O sol fica coberto por uma mancha negra, mas era possivel ver o circulo de fogo em volta da mancha. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar Anular."
            								else
            									data = data .. "Durante o dia, um eclipse solar ocorre. Deixando tudo escuro por alguns minutos. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar."
            								end;
            							elseif event == 7 then
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.eventosLabel ~= nil then self.eventosLabel:destroy(); self.eventosLabel = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLabel ~= nil then self.dataLabel:destroy(); self.dataLabel = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.popClima ~= nil then self.popClima:destroy(); self.popClima = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rclSemana ~= nil then self.rclSemana:destroy(); self.rclSemana = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rclEstacoes ~= nil then self.rclEstacoes:destroy(); self.rclEstacoes = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.rclMeses ~= nil then self.rclMeses:destroy(); self.rclMeses = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.popCelestial ~= nil then self.popCelestial:destroy(); self.popCelestial = nil; end;
        if self.luasLabel ~= nil then self.luasLabel:destroy(); self.luasLabel = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.celestialBt ~= nil then self.celestialBt:destroy(); self.celestialBt = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.rclLuas ~= nil then self.rclLuas:destroy(); self.rclLuas = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.estacaoLabel ~= nil then self.estacaoLabel:destroy(); self.estacaoLabel = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.temperaturaLabel ~= nil then self.temperaturaLabel:destroy(); self.temperaturaLabel = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.ventoLabel ~= nil then self.ventoLabel:destroy(); self.ventoLabel = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dias ~= nil then self.dias:destroy(); self.dias = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.precipitacaoLabel ~= nil then self.precipitacaoLabel:destroy(); self.precipitacaoLabel = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmGerenciador02);

return _frmGerenciador02;
