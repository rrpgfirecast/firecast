require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("OTomoByRafa");
    obj:setTitle("O Tomo");
    obj:setName("frmMain");
    obj:setTheme("dark");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setWidth(1216);
    obj.flowLayout1:setHeight(818);
    obj.flowLayout1:setMargins({left=10, right=10, top=10, bottom=10});
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setLineSpacing(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(1216);
    obj.flowPart1:setMaxWidth(1216);
    obj.flowPart1:setHeight(818);
    obj.flowPart1:setName("flowPart1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("img/o_tomo_bg.png");
    obj.image1:setStyle("originalSize");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart1);
    obj.image2:setLeft(809);
    obj.image2:setTop(53);
    obj.image2:setWidth(390);
    obj.image2:setHeight(299);
    obj.image2:setEditable(true);
    obj.image2:setField("imagem");
    obj.image2:setStyle("stretch");
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setLeft(868);
    obj.edit1:setTop(72);
    obj.edit1:setWidth(40);
    obj.edit1:setField("pvImg");
    obj.edit1:setFontSize(16);
    obj.edit1:setFontColor("green");
    obj.edit1:setName("edit1");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontFamily("Ar Julian");
    obj.edit1:setTransparent(true);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart1);
    obj.edit2:setLeft(820);
    obj.edit2:setTop(102);
    obj.edit2:setWidth(60);
    obj.edit2:setField("pdNameImg");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontSize(29);
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("black");
    obj.edit2:setFontFamily("Ar Julian");
    obj.edit2:setTransparent(true);

    obj.edtPdImg = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtPdImg:setParent(obj.flowPart1);
    obj.edtPdImg:setLeft(868);
    obj.edtPdImg:setTop(108);
    obj.edtPdImg:setWidth(40);
    obj.edtPdImg:setField("pdImg");
    obj.edtPdImg:setFontSize(16);
    obj.edtPdImg:setName("edtPdImg");
    obj.edtPdImg:setFontColor("black");
    obj.edtPdImg:setHorzTextAlign("center");
    obj.edtPdImg:setFontFamily("Ar Julian");
    obj.edtPdImg:setTransparent(true);

    obj.edtIdade = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtIdade:setParent(obj.flowPart1);
    obj.edtIdade:setLeft(978);
    obj.edtIdade:setTop(280);
    obj.edtIdade:setWidth(60);
    obj.edtIdade:setField("idade");
    obj.edtIdade:setFontSize(26);
    obj.edtIdade:setName("edtIdade");
    obj.edtIdade:setFontColor("black");
    obj.edtIdade:setHorzTextAlign("center");
    obj.edtIdade:setFontFamily("Ar Julian");
    obj.edtIdade:setTransparent(true);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart1);
    obj.image3:setLeft(842);
    obj.image3:setTop(196);
    obj.image3:setWidth(100);
    obj.image3:setHeight(100);
    obj.image3:setField("imgConduta");
    obj.image3:setName("image3");

    obj.edtNatureza = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNatureza:setParent(obj.flowPart1);
    obj.edtNatureza:setReadOnly(true);
    obj.edtNatureza:setField("conduta");
    obj.edtNatureza:setLeft(840);
    obj.edtNatureza:setTop(290);
    obj.edtNatureza:setWidth(106);
    obj.edtNatureza:setFontSize(20);
    obj.edtNatureza:setName("edtNatureza");
    obj.edtNatureza:setHitTest(true);
    obj.edtNatureza:setCursor("handPoint");
    obj.edtNatureza:setFontColor("black");
    obj.edtNatureza:setHorzTextAlign("center");
    obj.edtNatureza:setFontFamily("Ar Julian");
    obj.edtNatureza:setTransparent(true);

    obj.cbbConduta = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cbbConduta:setParent(obj.flowPart1);
    obj.cbbConduta:setField("conduta");
    obj.cbbConduta:setLeft(843);
    obj.cbbConduta:setTop(294);
    obj.cbbConduta:setItems({"Nocte", "Solar", "Virtus"});
    obj.cbbConduta:setValues({'nocte', 'solar', 'virtus'});
    obj.cbbConduta:setVisible(false);
    obj.cbbConduta:setName("cbbConduta");
    obj.cbbConduta:setFontFamily("Ar Julian");
    obj.cbbConduta:setFontSize(14);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowPart1);
    obj.image4:setLeft(1082);
    obj.image4:setTop(202);
    obj.image4:setWidth(80);
    obj.image4:setHeight(80);
    obj.image4:setField("imgNatureza");
    obj.image4:setName("image4");

    obj.edtConduta = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtConduta:setParent(obj.flowPart1);
    obj.edtConduta:setReadOnly(true);
    obj.edtConduta:setField("natureza");
    obj.edtConduta:setLeft(1069);
    obj.edtConduta:setTop(290);
    obj.edtConduta:setWidth(106);
    obj.edtConduta:setFontSize(20);
    obj.edtConduta:setName("edtConduta");
    obj.edtConduta:setHitTest(true);
    obj.edtConduta:setCursor("handPoint");
    obj.edtConduta:setFontColor("black");
    obj.edtConduta:setHorzTextAlign("center");
    obj.edtConduta:setFontFamily("Ar Julian");
    obj.edtConduta:setTransparent(true);

    obj.cbbNatureza = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cbbNatureza:setParent(obj.flowPart1);
    obj.cbbNatureza:setField("natureza");
    obj.cbbNatureza:setLeft(1073);
    obj.cbbNatureza:setTop(294);
    obj.cbbNatureza:setItems({"Cruzado", "Dominador", "Druídico", "Líder", "Escarrado"});
    obj.cbbNatureza:setValues({'cruzado', 'dominador', 'druidico', 'lider', 'escarrado'});
    obj.cbbNatureza:setVisible(false);
    obj.cbbNatureza:setName("cbbNatureza");
    obj.cbbNatureza:setFontFamily("Ar Julian");
    obj.cbbNatureza:setFontSize(14);

    obj.colorComboBox1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox1:setParent(obj.flowPart1);
    obj.colorComboBox1:setLeft(1168);
    obj.colorComboBox1:setTop(6);
    obj.colorComboBox1:setWidth(48);
    obj.colorComboBox1:setField("imgColor");
    obj.colorComboBox1:setName("colorComboBox1");


        function changeColor()
            if sheet ~= nil then
                self.edtPdImg.fontColor = sheet.imgColor;
                self.edtIdade.fontColor = sheet.imgColor;
                self.edtNatureza.fontColor = sheet.imgColor;
                self.edtConduta.fontColor = sheet.imgColor;
                self.edtPdMinusOne.fontColor = sheet.imgColor;
                self.edtPdMinusTwo.fontColor = sheet.imgColor;
                self.edtPdMinusThree.fontColor = sheet.imgColor;
            end
        end
    


    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flowPart1);
    obj.image5:setAlign("client");
    obj.image5:setSRC("img/o_tomo_bg_avatar.png");
    obj.image5:setStyle("originalSize");
    obj.image5:setName("image5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart1);
    obj.edit3:setLeft(284);
    obj.edit3:setTop(2);
    obj.edit3:setWidth(644);
    obj.edit3:setField("frasePersonagem");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "italic");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("black");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontFamily("Ar Julian");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(24);

    obj.imgOrdem = GUI.fromHandle(_obj_newObject("image"));
    obj.imgOrdem:setParent(obj.flowPart1);
    obj.imgOrdem:setName("imgOrdem");
    obj.imgOrdem:setLeft(164);
    obj.imgOrdem:setTop(40);
    obj.imgOrdem:setWidth(34);
    obj.imgOrdem:setHeight(26);
    obj.imgOrdem:setField("ordem");
    obj.imgOrdem:setStyle("proportional");
    obj.imgOrdem:setHitTest(true);
    obj.imgOrdem:setCursor("handPoint");

    obj.popupSelectOrdem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupSelectOrdem:setParent(obj.flowPart1);
    obj.popupSelectOrdem:setName("popupSelectOrdem");
    obj.popupSelectOrdem:setWidth(210);
    obj.popupSelectOrdem:setHeight(60);
    obj.popupSelectOrdem:setBackOpacity(0.5);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popupSelectOrdem);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("white");
    obj.rectangle1:setStrokeSize(0);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.popupSelectOrdem);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("top");
    obj.label1:setText("Selecione uma ordem!");
    obj.label1:setAutoSize(true);
    obj.label1:setFontSize(14);
    obj.label1:setName("label1");
    obj.label1:setFontColor("black");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontFamily("Ar Julian");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({top=4, bottom=4});
    obj.layout2:setName("layout2");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout2);
    obj.image6:setAlign("left");
    obj.image6:setSRC("img/ordem1.png");
    obj.image6:setWidth(40);
    obj.image6:setHitTest(true);
    obj.image6:setCursor("handPoint");
    obj.image6:setHint("Andos");
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout2);
    obj.image7:setAlign("left");
    obj.image7:setSRC("img/ordem2.png");
    obj.image7:setWidth(40);
    obj.image7:setHitTest(true);
    obj.image7:setCursor("handPoint");
    obj.image7:setHint("Ayopi");
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout2);
    obj.image8:setAlign("left");
    obj.image8:setSRC("img/ordem3.png");
    obj.image8:setWidth(40);
    obj.image8:setHitTest(true);
    obj.image8:setCursor("handPoint");
    obj.image8:setHint("Nain");
    obj.image8:setName("image8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout2);
    obj.image9:setAlign("left");
    obj.image9:setSRC("img/ordem4.png");
    obj.image9:setWidth(40);
    obj.image9:setHitTest(true);
    obj.image9:setCursor("handPoint");
    obj.image9:setHint("Fejedelem");
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout2);
    obj.image10:setAlign("left");
    obj.image10:setSRC("img/ordem5.png");
    obj.image10:setWidth(40);
    obj.image10:setHitTest(true);
    obj.image10:setCursor("handPoint");
    obj.image10:setHint("Atroce");
    obj.image10:setName("image10");

    obj.imgClasse = GUI.fromHandle(_obj_newObject("image"));
    obj.imgClasse:setParent(obj.flowPart1);
    obj.imgClasse:setName("imgClasse");
    obj.imgClasse:setLeft(211);
    obj.imgClasse:setTop(40);
    obj.imgClasse:setWidth(34);
    obj.imgClasse:setHeight(26);
    obj.imgClasse:setField("class");
    obj.imgClasse:setStyle("proportional");
    obj.imgClasse:setHitTest(true);
    obj.imgClasse:setCursor("handPoint");

    obj.popupSelectClasse = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupSelectClasse:setParent(obj.flowPart1);
    obj.popupSelectClasse:setName("popupSelectClasse");
    obj.popupSelectClasse:setWidth(296);
    obj.popupSelectClasse:setHeight(60);
    obj.popupSelectClasse:setBackOpacity(0.5);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.popupSelectClasse);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("white");
    obj.rectangle2:setStrokeSize(0);
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.popupSelectClasse);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setAlign("top");
    obj.label2:setText("Selecione uma ocupação!");
    obj.label2:setAutoSize(true);
    obj.label2:setFontSize(14);
    obj.label2:setName("label2");
    obj.label2:setFontColor("black");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontFamily("Ar Julian");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("client");
    obj.layout4:setMargins({top=4, bottom=4});
    obj.layout4:setName("layout4");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout4);
    obj.image11:setAlign("left");
    obj.image11:setSRC("img/class1.png");
    obj.image11:setWidth(40);
    obj.image11:setHitTest(true);
    obj.image11:setCursor("handPoint");
    obj.image11:setHint("Arruaceiro");
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout4);
    obj.image12:setAlign("left");
    obj.image12:setSRC("img/class2.png");
    obj.image12:setWidth(40);
    obj.image12:setHitTest(true);
    obj.image12:setCursor("handPoint");
    obj.image12:setHint("Guerreiro");
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout4);
    obj.image13:setAlign("left");
    obj.image13:setSRC("img/class3.png");
    obj.image13:setWidth(40);
    obj.image13:setHitTest(true);
    obj.image13:setCursor("handPoint");
    obj.image13:setHint("Lutador");
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout4);
    obj.image14:setAlign("left");
    obj.image14:setSRC("img/class4.png");
    obj.image14:setWidth(40);
    obj.image14:setHitTest(true);
    obj.image14:setCursor("handPoint");
    obj.image14:setHint("Ocultista");
    obj.image14:setName("image14");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout4);
    obj.image15:setAlign("left");
    obj.image15:setSRC("img/class5.png");
    obj.image15:setWidth(40);
    obj.image15:setHitTest(true);
    obj.image15:setCursor("handPoint");
    obj.image15:setHint("Paladino");
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout4);
    obj.image16:setAlign("left");
    obj.image16:setSRC("img/class6.png");
    obj.image16:setWidth(40);
    obj.image16:setHitTest(true);
    obj.image16:setCursor("handPoint");
    obj.image16:setHint("Pensante");
    obj.image16:setName("image16");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout4);
    obj.image17:setAlign("left");
    obj.image17:setSRC("img/class7.png");
    obj.image17:setWidth(40);
    obj.image17:setHitTest(true);
    obj.image17:setCursor("handPoint");
    obj.image17:setHint("Sacerdote");
    obj.image17:setName("image17");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart1);
    obj.edit4:setLeft(10);
    obj.edit4:setTop(78);
    obj.edit4:setWidth(240);
    obj.edit4:setField("nome");
    obj.edit4:setFontSize(18);
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("black");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontFamily("Ar Julian");
    obj.edit4:setTransparent(true);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart1);
    obj.edit5:setLeft(52);
    obj.edit5:setTop(126);
    obj.edit5:setWidth(50);
    obj.edit5:setField("np");
    obj.edit5:setFontSize(18);
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("black");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontFamily("Ar Julian");
    obj.edit5:setTransparent(true);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart1);
    obj.edit6:setLeft(158);
    obj.edit6:setTop(126);
    obj.edit6:setWidth(50);
    obj.edit6:setField("nc");
    obj.edit6:setFontSize(18);
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("black");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontFamily("Ar Julian");
    obj.edit6:setTransparent(true);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart1);
    obj.edit7:setLeft(8);
    obj.edit7:setTop(217);
    obj.edit7:setWidth(50);
    obj.edit7:setField("stm");
    obj.edit7:setFontSize(18);
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("black");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontFamily("Ar Julian");
    obj.edit7:setTransparent(true);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart1);
    obj.edit8:setLeft(35);
    obj.edit8:setTop(260);
    obj.edit8:setWidth(69);
    obj.edit8:setField("stmText");
    obj.edit8:setFontSize(12);
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("black");
    obj.edit8:setFontFamily("Ar Julian");
    obj.edit8:setTransparent(true);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart1);
    obj.edit9:setLeft(8);
    obj.edit9:setTop(290);
    obj.edit9:setWidth(50);
    obj.edit9:setField("des");
    obj.edit9:setFontSize(18);
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("black");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontFamily("Ar Julian");
    obj.edit9:setTransparent(true);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart1);
    obj.edit10:setLeft(35);
    obj.edit10:setTop(333);
    obj.edit10:setWidth(69);
    obj.edit10:setField("desText");
    obj.edit10:setFontSize(12);
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("black");
    obj.edit10:setFontFamily("Ar Julian");
    obj.edit10:setTransparent(true);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart1);
    obj.edit11:setLeft(8);
    obj.edit11:setTop(364);
    obj.edit11:setWidth(50);
    obj.edit11:setField("int");
    obj.edit11:setFontSize(18);
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("black");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontFamily("Ar Julian");
    obj.edit11:setTransparent(true);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart1);
    obj.edit12:setLeft(35);
    obj.edit12:setTop(406);
    obj.edit12:setWidth(69);
    obj.edit12:setField("intText");
    obj.edit12:setFontSize(12);
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("black");
    obj.edit12:setFontFamily("Ar Julian");
    obj.edit12:setTransparent(true);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart1);
    obj.edit13:setLeft(8);
    obj.edit13:setTop(436);
    obj.edit13:setWidth(50);
    obj.edit13:setField("car");
    obj.edit13:setFontSize(18);
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("black");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontFamily("Ar Julian");
    obj.edit13:setTransparent(true);

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart1);
    obj.edit14:setLeft(35);
    obj.edit14:setTop(481);
    obj.edit14:setWidth(69);
    obj.edit14:setField("carText");
    obj.edit14:setFontSize(12);
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("black");
    obj.edit14:setFontFamily("Ar Julian");
    obj.edit14:setTransparent(true);

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart1);
    obj.edit15:setLeft(200);
    obj.edit15:setTop(209);
    obj.edit15:setWidth(40);
    obj.edit15:setField("itensQtd");
    obj.edit15:setFontSize(18);
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("black");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontFamily("Ar Julian");
    obj.edit15:setTransparent(true);

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart1);
    obj.edit16:setLeft(134);
    obj.edit16:setTop(244);
    obj.edit16:setWidth(118);
    obj.edit16:setHeight(18);
    obj.edit16:setField("bag1");
    obj.edit16:setFontSize(12);
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("black");
    obj.edit16:setFontFamily("Ar Julian");
    obj.edit16:setTransparent(true);

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart1);
    obj.edit17:setLeft(134);
    obj.edit17:setTop(260);
    obj.edit17:setWidth(118);
    obj.edit17:setHeight(18);
    obj.edit17:setField("bag2");
    obj.edit17:setFontSize(12);
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("black");
    obj.edit17:setFontFamily("Ar Julian");
    obj.edit17:setTransparent(true);

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart1);
    obj.edit18:setLeft(134);
    obj.edit18:setTop(276);
    obj.edit18:setWidth(118);
    obj.edit18:setHeight(18);
    obj.edit18:setField("bag3");
    obj.edit18:setFontSize(12);
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("black");
    obj.edit18:setFontFamily("Ar Julian");
    obj.edit18:setTransparent(true);

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart1);
    obj.edit19:setLeft(134);
    obj.edit19:setTop(292);
    obj.edit19:setWidth(118);
    obj.edit19:setHeight(18);
    obj.edit19:setField("bag4");
    obj.edit19:setFontSize(12);
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("black");
    obj.edit19:setFontFamily("Ar Julian");
    obj.edit19:setTransparent(true);

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart1);
    obj.edit20:setLeft(134);
    obj.edit20:setTop(324);
    obj.edit20:setWidth(118);
    obj.edit20:setHeight(18);
    obj.edit20:setField("bag5");
    obj.edit20:setFontSize(12);
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("black");
    obj.edit20:setFontFamily("Ar Julian");
    obj.edit20:setTransparent(true);

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart1);
    obj.edit21:setLeft(134);
    obj.edit21:setTop(340);
    obj.edit21:setWidth(118);
    obj.edit21:setHeight(18);
    obj.edit21:setField("bag6");
    obj.edit21:setFontSize(12);
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("black");
    obj.edit21:setFontFamily("Ar Julian");
    obj.edit21:setTransparent(true);

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart1);
    obj.edit22:setLeft(134);
    obj.edit22:setTop(368);
    obj.edit22:setWidth(118);
    obj.edit22:setHeight(18);
    obj.edit22:setField("bag7");
    obj.edit22:setFontSize(12);
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("black");
    obj.edit22:setFontFamily("Ar Julian");
    obj.edit22:setTransparent(true);

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart1);
    obj.edit23:setLeft(134);
    obj.edit23:setTop(384);
    obj.edit23:setWidth(118);
    obj.edit23:setHeight(18);
    obj.edit23:setField("bag8");
    obj.edit23:setFontSize(12);
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("black");
    obj.edit23:setFontFamily("Ar Julian");
    obj.edit23:setTransparent(true);

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart1);
    obj.edit24:setLeft(134);
    obj.edit24:setTop(400);
    obj.edit24:setWidth(118);
    obj.edit24:setHeight(18);
    obj.edit24:setField("bag9");
    obj.edit24:setFontSize(12);
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("black");
    obj.edit24:setFontFamily("Ar Julian");
    obj.edit24:setTransparent(true);

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart1);
    obj.edit25:setLeft(134);
    obj.edit25:setTop(416);
    obj.edit25:setWidth(118);
    obj.edit25:setHeight(18);
    obj.edit25:setField("bag10");
    obj.edit25:setFontSize(12);
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("black");
    obj.edit25:setFontFamily("Ar Julian");
    obj.edit25:setTransparent(true);

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart1);
    obj.edit26:setLeft(134);
    obj.edit26:setTop(432);
    obj.edit26:setWidth(118);
    obj.edit26:setHeight(18);
    obj.edit26:setField("bag11");
    obj.edit26:setFontSize(12);
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("black");
    obj.edit26:setFontFamily("Ar Julian");
    obj.edit26:setTransparent(true);

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart1);
    obj.edit27:setLeft(134);
    obj.edit27:setTop(448);
    obj.edit27:setWidth(118);
    obj.edit27:setHeight(18);
    obj.edit27:setField("bag12");
    obj.edit27:setFontSize(12);
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("black");
    obj.edit27:setFontFamily("Ar Julian");
    obj.edit27:setTransparent(true);

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart1);
    obj.edit28:setLeft(134);
    obj.edit28:setTop(464);
    obj.edit28:setWidth(118);
    obj.edit28:setHeight(18);
    obj.edit28:setField("bag13");
    obj.edit28:setFontSize(12);
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("black");
    obj.edit28:setFontFamily("Ar Julian");
    obj.edit28:setTransparent(true);

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart1);
    obj.edit29:setLeft(134);
    obj.edit29:setTop(480);
    obj.edit29:setWidth(118);
    obj.edit29:setHeight(18);
    obj.edit29:setField("bag14");
    obj.edit29:setFontSize(12);
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("black");
    obj.edit29:setFontFamily("Ar Julian");
    obj.edit29:setTransparent(true);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart1);
    obj.label3:setLeft(52);
    obj.label3:setTop(571);
    obj.label3:setWidth(40);
    obj.label3:setField("pvMinusOne");
    obj.label3:setFontSize(18);
    obj.label3:setFontColor("green");
    obj.label3:setName("label3");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontFamily("Ar Julian");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart1);
    obj.label4:setLeft(52);
    obj.label4:setTop(601);
    obj.label4:setWidth(40);
    obj.label4:setField("pvMinusTwo");
    obj.label4:setFontSize(18);
    obj.label4:setFontColor("green");
    obj.label4:setName("label4");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontFamily("Ar Julian");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart1);
    obj.label5:setLeft(52);
    obj.label5:setTop(631);
    obj.label5:setWidth(40);
    obj.label5:setField("pvMinusThree");
    obj.label5:setFontSize(18);
    obj.label5:setFontColor("green");
    obj.label5:setName("label5");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontFamily("Ar Julian");

    obj.edtPdMinusOne = GUI.fromHandle(_obj_newObject("label"));
    obj.edtPdMinusOne:setParent(obj.flowPart1);
    obj.edtPdMinusOne:setLeft(86);
    obj.edtPdMinusOne:setTop(571);
    obj.edtPdMinusOne:setWidth(40);
    obj.edtPdMinusOne:setField("pdMinusOne");
    obj.edtPdMinusOne:setFontSize(18);
    obj.edtPdMinusOne:setFontColor("gold");
    obj.edtPdMinusOne:setName("edtPdMinusOne");
    obj.edtPdMinusOne:setHorzTextAlign("center");
    obj.edtPdMinusOne:setFontFamily("Ar Julian");

    obj.edtPdMinusTwo = GUI.fromHandle(_obj_newObject("label"));
    obj.edtPdMinusTwo:setParent(obj.flowPart1);
    obj.edtPdMinusTwo:setLeft(86);
    obj.edtPdMinusTwo:setTop(601);
    obj.edtPdMinusTwo:setWidth(40);
    obj.edtPdMinusTwo:setField("pdMinusTwo");
    obj.edtPdMinusTwo:setFontSize(18);
    obj.edtPdMinusTwo:setFontColor("gold");
    obj.edtPdMinusTwo:setName("edtPdMinusTwo");
    obj.edtPdMinusTwo:setHorzTextAlign("center");
    obj.edtPdMinusTwo:setFontFamily("Ar Julian");

    obj.edtPdMinusThree = GUI.fromHandle(_obj_newObject("label"));
    obj.edtPdMinusThree:setParent(obj.flowPart1);
    obj.edtPdMinusThree:setLeft(86);
    obj.edtPdMinusThree:setTop(631);
    obj.edtPdMinusThree:setWidth(40);
    obj.edtPdMinusThree:setField("pdMinusThree");
    obj.edtPdMinusThree:setFontSize(18);
    obj.edtPdMinusThree:setFontColor("gold");
    obj.edtPdMinusThree:setName("edtPdMinusThree");
    obj.edtPdMinusThree:setHorzTextAlign("center");
    obj.edtPdMinusThree:setFontFamily("Ar Julian");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.flowPart1);
    obj.imageCheckBox1:setWidth(14);
    obj.imageCheckBox1:setHeight(14);
    obj.imageCheckBox1:setLeft(12);
    obj.imageCheckBox1:setTop(721);
    obj.imageCheckBox1:setField("crossPrestigio1");
    obj.imageCheckBox1:setImageChecked("img/x.png");
    obj.imageCheckBox1:setImageUnchecked("");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart1);
    obj.edit30:setLeft(24);
    obj.edit30:setTop(712);
    obj.edit30:setWidth(204);
    obj.edit30:setField("prestigio1");
    obj.edit30:setFontSize(16);
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("black");
    obj.edit30:setFontFamily("Ar Julian");
    obj.edit30:setTransparent(true);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart1);
    obj.button1:setLeft(230);
    obj.button1:setTop(718);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("!");
    obj.button1:setFontColor("white");
    obj.button1:setFontSize(14);
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setMargins({right=2});
    obj.button1:setCursor("handPoint");
    obj.button1:setName("button1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.flowPart1);
    obj.imageCheckBox2:setWidth(14);
    obj.imageCheckBox2:setHeight(14);
    obj.imageCheckBox2:setLeft(12);
    obj.imageCheckBox2:setTop(751);
    obj.imageCheckBox2:setField("crossPrestigio2");
    obj.imageCheckBox2:setImageChecked("img/x.png");
    obj.imageCheckBox2:setImageUnchecked("");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart1);
    obj.edit31:setLeft(24);
    obj.edit31:setTop(742);
    obj.edit31:setWidth(204);
    obj.edit31:setField("prestigio2");
    obj.edit31:setFontSize(16);
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("black");
    obj.edit31:setFontFamily("Ar Julian");
    obj.edit31:setTransparent(true);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart1);
    obj.button2:setLeft(230);
    obj.button2:setTop(748);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("!");
    obj.button2:setFontColor("white");
    obj.button2:setFontSize(14);
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setMargins({right=2});
    obj.button2:setCursor("handPoint");
    obj.button2:setName("button2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.flowPart1);
    obj.imageCheckBox3:setWidth(14);
    obj.imageCheckBox3:setHeight(14);
    obj.imageCheckBox3:setLeft(12);
    obj.imageCheckBox3:setTop(781);
    obj.imageCheckBox3:setField("crossPrestigio3");
    obj.imageCheckBox3:setImageChecked("img/x.png");
    obj.imageCheckBox3:setImageUnchecked("");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart1);
    obj.edit32:setLeft(24);
    obj.edit32:setTop(772);
    obj.edit32:setWidth(204);
    obj.edit32:setField("prestigio3");
    obj.edit32:setFontSize(16);
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("black");
    obj.edit32:setFontFamily("Ar Julian");
    obj.edit32:setTransparent(true);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowPart1);
    obj.button3:setLeft(230);
    obj.button3:setTop(778);
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("!");
    obj.button3:setFontColor("white");
    obj.button3:setFontSize(14);
    lfm_setPropAsString(obj.button3, "fontStyle",  "bold");
    obj.button3:setMargins({right=2});
    obj.button3:setCursor("handPoint");
    obj.button3:setName("button3");

    obj.popPrestigio1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPrestigio1:setParent(obj.flowPart1);
    obj.popPrestigio1:setName("popPrestigio1");
    obj.popPrestigio1:setWidth(600);
    obj.popPrestigio1:setHeight(150);
    obj.popPrestigio1:setBackOpacity(0.5);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.popPrestigio1);
    obj.label6:setAlign("top");
    obj.label6:setText("Descrição");
    obj.label6:setAutoSize(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontColor("white");
    obj.label6:setFontSize(16);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");
    obj.label6:setFontFamily("Ar Julian");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.popPrestigio1);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("prestigio1");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "white");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "false");
    obj.richEdit1:setName("richEdit1");

    obj.popPrestigio2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPrestigio2:setParent(obj.flowPart1);
    obj.popPrestigio2:setName("popPrestigio2");
    obj.popPrestigio2:setWidth(600);
    obj.popPrestigio2:setHeight(150);
    obj.popPrestigio2:setBackOpacity(0.5);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.popPrestigio2);
    obj.label7:setAlign("top");
    obj.label7:setText("Descrição");
    obj.label7:setAutoSize(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontColor("white");
    obj.label7:setFontSize(16);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");
    obj.label7:setFontFamily("Ar Julian");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.popPrestigio2);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("prestigio2");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "white");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "showToolbar",  "false");
    obj.richEdit2:setName("richEdit2");

    obj.popPrestigio3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPrestigio3:setParent(obj.flowPart1);
    obj.popPrestigio3:setName("popPrestigio3");
    obj.popPrestigio3:setWidth(600);
    obj.popPrestigio3:setHeight(150);
    obj.popPrestigio3:setBackOpacity(0.5);

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.popPrestigio3);
    obj.label8:setAlign("top");
    obj.label8:setText("Descrição");
    obj.label8:setAutoSize(true);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontColor("white");
    obj.label8:setFontSize(16);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");
    obj.label8:setFontFamily("Ar Julian");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.popPrestigio3);
    obj.richEdit3:setAlign("client");
    obj.richEdit3:setField("prestigio3");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "white");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "showToolbar",  "false");
    obj.richEdit3:setName("richEdit3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowPart1);
    obj.button4:setLeft(525);
    obj.button4:setTop(339);
    obj.button4:setWidth(20);
    obj.button4:setHeight(20);
    obj.button4:setText("➕");
    obj.button4:setFontColor("white");
    obj.button4:setCursor("handPoint");
    obj.button4:setFontSize(10);
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setName("button4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart1);
    obj.layout5:setLeft(278);
    obj.layout5:setTop(366);
    obj.layout5:setWidth(255);
    obj.layout5:setHeight(420);
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("client");
    obj.layout6:setName("layout6");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout6);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rclDons = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDons:setParent(obj.scrollBox2);
    obj.rclDons:setName("rclDons");
    obj.rclDons:setField("dons");
    obj.rclDons:setTemplateForm("frmDonsItem");
    obj.rclDons:setAlign("client");
    obj.rclDons:setSelectable(true);

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart1);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setVisible(false);
    obj.edit33:setField("donConfig");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("black");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontFamily("Ar Julian");
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(24);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart1);
    obj.layout7:setLeft(540);
    obj.layout7:setTop(366);
    obj.layout7:setWidth(254);
    obj.layout7:setHeight(420);
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("client");
    obj.layout8:setName("layout8");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout8);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rclDons2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDons2:setParent(obj.scrollBox3);
    obj.rclDons2:setName("rclDons2");
    obj.rclDons2:setField("dons2");
    obj.rclDons2:setTemplateForm("frmDonsItem");
    obj.rclDons2:setAlign("client");
    obj.rclDons2:setSelectable(true);


        
            local function setPopupDonsNode(donRightLeft)
                if(donRightLeft == 1) then
                    self.boxDonsDetails = self.rclDons.selectedNode;
                else
                    self.boxDons2Details = self.rclDons2.selectedNode;
                end
                                                                
            end       

            local function insertDon() 
                if sheet ~= nil then
                    if(sheet.donConfig == '0') then
                        sheet.donConfig = '1';
                        self.rclDons:append();
                    else
                        sheet.donConfig = '0';
                        self.rclDons2:append();
                    end
                end
                
            end
        


    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart1);
    obj.label9:setLeft(448);
    obj.label9:setTop(57);
    obj.label9:setWidth(50);
    obj.label9:setField("eq");
    obj.label9:setFontSize(18);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");
    obj.label9:setFontColor("black");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontFamily("Ar Julian");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart1);
    obj.label10:setLeft(554);
    obj.label10:setTop(57);
    obj.label10:setWidth(50);
    obj.label10:setField("aa");
    obj.label10:setFontSize(18);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setName("label10");
    obj.label10:setFontColor("black");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontFamily("Ar Julian");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart1);
    obj.edit34:setLeft(259);
    obj.edit34:setTop(116);
    obj.edit34:setWidth(40);
    obj.edit34:setField("ataque1Letra");
    obj.edit34:setFontSize(18);
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("black");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontFamily("Ar Julian");
    obj.edit34:setTransparent(true);

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart1);
    obj.edit35:setLeft(425);
    obj.edit35:setTop(114);
    obj.edit35:setWidth(50);
    obj.edit35:setField("ataque1V1");
    obj.edit35:setFontSize(18);
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("black");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontFamily("Ar Julian");
    obj.edit35:setTransparent(true);

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart1);
    obj.edit36:setLeft(469);
    obj.edit36:setTop(114);
    obj.edit36:setWidth(50);
    obj.edit36:setField("ataque1V2");
    obj.edit36:setFontSize(18);
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("black");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontFamily("Ar Julian");
    obj.edit36:setTransparent(true);

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart1);
    obj.edit37:setLeft(539);
    obj.edit37:setTop(116);
    obj.edit37:setWidth(40);
    obj.edit37:setField("ataque2Letra");
    obj.edit37:setFontSize(18);
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("black");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontFamily("Ar Julian");
    obj.edit37:setTransparent(true);

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart1);
    obj.edit38:setLeft(703);
    obj.edit38:setTop(116);
    obj.edit38:setWidth(50);
    obj.edit38:setField("ataque2V1");
    obj.edit38:setFontSize(18);
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("black");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontFamily("Ar Julian");
    obj.edit38:setTransparent(true);

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart1);
    obj.edit39:setLeft(749);
    obj.edit39:setTop(116);
    obj.edit39:setWidth(50);
    obj.edit39:setField("ataque2V2");
    obj.edit39:setFontSize(18);
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("black");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontFamily("Ar Julian");
    obj.edit39:setTransparent(true);

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart1);
    obj.edit40:setLeft(281);
    obj.edit40:setTop(146);
    obj.edit40:setWidth(190);
    obj.edit40:setField("nomeAtk1");
    obj.edit40:setFontSize(18);
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("black");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontFamily("Ar Julian");
    obj.edit40:setTransparent(true);

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart1);
    obj.edit41:setLeft(281);
    obj.edit41:setTop(180);
    obj.edit41:setWidth(190);
    obj.edit41:setField("nomeAtk1Desc");
    obj.edit41:setFontSize(18);
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("black");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontFamily("Ar Julian");
    obj.edit41:setTransparent(true);

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart1);
    obj.edit42:setLeft(559);
    obj.edit42:setTop(146);
    obj.edit42:setWidth(190);
    obj.edit42:setField("nomeAtk2");
    obj.edit42:setFontSize(18);
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("black");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontFamily("Ar Julian");
    obj.edit42:setTransparent(true);

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart1);
    obj.edit43:setLeft(559);
    obj.edit43:setTop(180);
    obj.edit43:setWidth(190);
    obj.edit43:setField("nomeAtk2Desc");
    obj.edit43:setFontSize(18);
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("black");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontFamily("Ar Julian");
    obj.edit43:setTransparent(true);

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart1);
    obj.edit44:setLeft(259);
    obj.edit44:setTop(236);
    obj.edit44:setWidth(40);
    obj.edit44:setField("ataqueProtLetra");
    obj.edit44:setFontSize(18);
    lfm_setPropAsString(obj.edit44, "fontStyle",  "bold");
    obj.edit44:setName("edit44");
    obj.edit44:setFontColor("black");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontFamily("Ar Julian");
    obj.edit44:setTransparent(true);

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart1);
    obj.edit45:setLeft(425);
    obj.edit45:setTop(234);
    obj.edit45:setWidth(50);
    obj.edit45:setField("ataqueProtV1");
    obj.edit45:setFontSize(18);
    lfm_setPropAsString(obj.edit45, "fontStyle",  "bold");
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("black");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontFamily("Ar Julian");
    obj.edit45:setTransparent(true);

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart1);
    obj.edit46:setLeft(469);
    obj.edit46:setTop(234);
    obj.edit46:setWidth(50);
    obj.edit46:setField("ataqueProtV2");
    obj.edit46:setFontSize(18);
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("black");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontFamily("Ar Julian");
    obj.edit46:setTransparent(true);

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart1);
    obj.edit47:setLeft(538);
    obj.edit47:setTop(233);
    obj.edit47:setWidth(40);
    obj.edit47:setField("protecaoLetra");
    obj.edit47:setFontSize(18);
    lfm_setPropAsString(obj.edit47, "fontStyle",  "bold");
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("black");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontFamily("Ar Julian");
    obj.edit47:setTransparent(true);

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart1);
    obj.edit48:setLeft(703);
    obj.edit48:setTop(232);
    obj.edit48:setWidth(50);
    obj.edit48:setField("protecaoV1");
    obj.edit48:setFontSize(18);
    lfm_setPropAsString(obj.edit48, "fontStyle",  "bold");
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("black");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontFamily("Ar Julian");
    obj.edit48:setTransparent(true);

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart1);
    obj.edit49:setLeft(747);
    obj.edit49:setTop(232);
    obj.edit49:setWidth(50);
    obj.edit49:setField("protecaoV2");
    obj.edit49:setFontSize(18);
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("black");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontFamily("Ar Julian");
    obj.edit49:setTransparent(true);

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart1);
    obj.edit50:setLeft(281);
    obj.edit50:setTop(266);
    obj.edit50:setWidth(190);
    obj.edit50:setField("nomeAtkProt");
    obj.edit50:setFontSize(18);
    obj.edit50:setName("edit50");
    obj.edit50:setFontColor("black");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontFamily("Ar Julian");
    obj.edit50:setTransparent(true);

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart1);
    obj.edit51:setLeft(281);
    obj.edit51:setTop(300);
    obj.edit51:setWidth(190);
    obj.edit51:setField("nomeAtkProtDesc");
    obj.edit51:setFontSize(18);
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("black");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontFamily("Ar Julian");
    obj.edit51:setTransparent(true);

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart1);
    obj.edit52:setLeft(559);
    obj.edit52:setTop(264);
    obj.edit52:setWidth(190);
    obj.edit52:setField("nomeProtecao");
    obj.edit52:setFontSize(18);
    obj.edit52:setName("edit52");
    obj.edit52:setFontColor("black");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontFamily("Ar Julian");
    obj.edit52:setTransparent(true);

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart1);
    obj.edit53:setLeft(762);
    obj.edit53:setTop(264);
    obj.edit53:setWidth(30);
    obj.edit53:setField("rp");
    obj.edit53:setFontSize(18);
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("black");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontFamily("Ar Julian");
    obj.edit53:setTransparent(true);

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart1);
    obj.edit54:setLeft(618);
    obj.edit54:setTop(299);
    obj.edit54:setWidth(106);
    obj.edit54:setField("nomeProtecaoDesc");
    obj.edit54:setFontSize(18);
    obj.edit54:setName("edit54");
    obj.edit54:setFontColor("black");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontFamily("Ar Julian");
    obj.edit54:setTransparent(true);

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.flowPart1);
    obj.imageCheckBox4:setWidth(10);
    obj.imageCheckBox4:setHeight(10);
    obj.imageCheckBox4:setLeft(731);
    obj.imageCheckBox4:setTop(300);
    obj.imageCheckBox4:setField("cross1");
    obj.imageCheckBox4:setImageChecked("img/x.png");
    obj.imageCheckBox4:setImageUnchecked("");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.flowPart1);
    obj.imageCheckBox5:setWidth(10);
    obj.imageCheckBox5:setHeight(10);
    obj.imageCheckBox5:setLeft(748);
    obj.imageCheckBox5:setTop(300);
    obj.imageCheckBox5:setField("cross2");
    obj.imageCheckBox5:setImageChecked("img/x.png");
    obj.imageCheckBox5:setImageUnchecked("");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.flowPart1);
    obj.imageCheckBox6:setWidth(10);
    obj.imageCheckBox6:setHeight(10);
    obj.imageCheckBox6:setLeft(764);
    obj.imageCheckBox6:setTop(300);
    obj.imageCheckBox6:setField("cross3");
    obj.imageCheckBox6:setImageChecked("img/x.png");
    obj.imageCheckBox6:setImageUnchecked("");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.flowPart1);
    obj.imageCheckBox7:setWidth(10);
    obj.imageCheckBox7:setHeight(10);
    obj.imageCheckBox7:setLeft(782);
    obj.imageCheckBox7:setTop(300);
    obj.imageCheckBox7:setField("cross4");
    obj.imageCheckBox7:setImageChecked("img/x.png");
    obj.imageCheckBox7:setImageUnchecked("");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.flowPart1);
    obj.imageCheckBox8:setWidth(10);
    obj.imageCheckBox8:setHeight(10);
    obj.imageCheckBox8:setLeft(731);
    obj.imageCheckBox8:setTop(318);
    obj.imageCheckBox8:setField("cross5");
    obj.imageCheckBox8:setImageChecked("img/x.png");
    obj.imageCheckBox8:setImageUnchecked("");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.flowPart1);
    obj.imageCheckBox9:setWidth(10);
    obj.imageCheckBox9:setHeight(10);
    obj.imageCheckBox9:setLeft(748);
    obj.imageCheckBox9:setTop(318);
    obj.imageCheckBox9:setField("cross6");
    obj.imageCheckBox9:setImageChecked("img/x.png");
    obj.imageCheckBox9:setImageUnchecked("");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.flowPart1);
    obj.imageCheckBox10:setWidth(10);
    obj.imageCheckBox10:setHeight(10);
    obj.imageCheckBox10:setLeft(764);
    obj.imageCheckBox10:setTop(318);
    obj.imageCheckBox10:setField("cross7");
    obj.imageCheckBox10:setImageChecked("img/x.png");
    obj.imageCheckBox10:setImageUnchecked("");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.flowPart1);
    obj.imageCheckBox11:setWidth(10);
    obj.imageCheckBox11:setHeight(10);
    obj.imageCheckBox11:setLeft(782);
    obj.imageCheckBox11:setTop(318);
    obj.imageCheckBox11:setField("cross8");
    obj.imageCheckBox11:setImageChecked("img/x.png");
    obj.imageCheckBox11:setImageUnchecked("");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart1);
    obj.label11:setLeft(840);
    obj.label11:setTop(379);
    obj.label11:setWidth(40);
    obj.label11:setField("fort");
    obj.label11:setFontSize(18);
    obj.label11:setName("label11");
    obj.label11:setFontColor("black");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontFamily("Ar Julian");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart1);
    obj.label12:setLeft(1030);
    obj.label12:setTop(379);
    obj.label12:setWidth(40);
    obj.label12:setField("vont");
    obj.label12:setFontSize(18);
    obj.label12:setName("label12");
    obj.label12:setFontColor("black");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontFamily("Ar Julian");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart1);
    obj.edit55:setLeft(812);
    obj.edit55:setTop(442);
    obj.edit55:setWidth(190);
    obj.edit55:setField("cabeca");
    obj.edit55:setFontSize(16);
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("black");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontFamily("Ar Julian");
    obj.edit55:setTransparent(true);

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart1);
    obj.edit56:setLeft(812);
    obj.edit56:setTop(482);
    obj.edit56:setWidth(190);
    obj.edit56:setField("acessorio1");
    obj.edit56:setFontSize(16);
    obj.edit56:setName("edit56");
    obj.edit56:setFontColor("black");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontFamily("Ar Julian");
    obj.edit56:setTransparent(true);

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart1);
    obj.edit57:setLeft(812);
    obj.edit57:setTop(522);
    obj.edit57:setWidth(190);
    obj.edit57:setField("peitoral");
    obj.edit57:setFontSize(16);
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("black");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontFamily("Ar Julian");
    obj.edit57:setTransparent(true);

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart1);
    obj.edit58:setLeft(812);
    obj.edit58:setTop(560);
    obj.edit58:setWidth(190);
    obj.edit58:setField("ombro");
    obj.edit58:setFontSize(16);
    obj.edit58:setName("edit58");
    obj.edit58:setFontColor("black");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontFamily("Ar Julian");
    obj.edit58:setTransparent(true);

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart1);
    obj.edit59:setLeft(812);
    obj.edit59:setTop(600);
    obj.edit59:setWidth(190);
    obj.edit59:setField("calca");
    obj.edit59:setFontSize(16);
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("black");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontFamily("Ar Julian");
    obj.edit59:setTransparent(true);

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart1);
    obj.edit60:setLeft(812);
    obj.edit60:setTop(639);
    obj.edit60:setWidth(190);
    obj.edit60:setField("cintura");
    obj.edit60:setFontSize(16);
    obj.edit60:setName("edit60");
    obj.edit60:setFontColor("black");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontFamily("Ar Julian");
    obj.edit60:setTransparent(true);

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart1);
    obj.edit61:setLeft(1007);
    obj.edit61:setTop(442);
    obj.edit61:setWidth(190);
    obj.edit61:setField("mascara");
    obj.edit61:setFontSize(16);
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("black");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontFamily("Ar Julian");
    obj.edit61:setTransparent(true);

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart1);
    obj.edit62:setLeft(1007);
    obj.edit62:setTop(482);
    obj.edit62:setWidth(190);
    obj.edit62:setField("acessorio2");
    obj.edit62:setFontSize(16);
    obj.edit62:setName("edit62");
    obj.edit62:setFontColor("black");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontFamily("Ar Julian");
    obj.edit62:setTransparent(true);

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart1);
    obj.edit63:setLeft(1007);
    obj.edit63:setTop(522);
    obj.edit63:setWidth(190);
    obj.edit63:setField("vestienta");
    obj.edit63:setFontSize(16);
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("black");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontFamily("Ar Julian");
    obj.edit63:setTransparent(true);

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart1);
    obj.edit64:setLeft(1007);
    obj.edit64:setTop(560);
    obj.edit64:setWidth(190);
    obj.edit64:setField("pulso");
    obj.edit64:setFontSize(16);
    obj.edit64:setName("edit64");
    obj.edit64:setFontColor("black");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontFamily("Ar Julian");
    obj.edit64:setTransparent(true);

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart1);
    obj.edit65:setLeft(1007);
    obj.edit65:setTop(600);
    obj.edit65:setWidth(190);
    obj.edit65:setField("maos");
    obj.edit65:setFontSize(16);
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("black");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontFamily("Ar Julian");
    obj.edit65:setTransparent(true);

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart1);
    obj.edit66:setLeft(1007);
    obj.edit66:setTop(639);
    obj.edit66:setWidth(190);
    obj.edit66:setField("pes");
    obj.edit66:setFontSize(16);
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("black");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontFamily("Ar Julian");
    obj.edit66:setTransparent(true);

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.flowPart1);
    obj.imageCheckBox12:setLeft(871);
    obj.imageCheckBox12:setTop(686);
    obj.imageCheckBox12:setWidth(17);
    obj.imageCheckBox12:setHeight(22);
    obj.imageCheckBox12:setField("of101");
    obj.imageCheckBox12:setImageChecked("img/oficio1.png");
    obj.imageCheckBox12:setImageUnchecked("");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.flowPart1);
    obj.imageCheckBox13:setLeft(887);
    obj.imageCheckBox13:setTop(682);
    obj.imageCheckBox13:setWidth(17);
    obj.imageCheckBox13:setHeight(22);
    obj.imageCheckBox13:setField("of102");
    obj.imageCheckBox13:setImageChecked("img/oficio2.png");
    obj.imageCheckBox13:setImageUnchecked("");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.flowPart1);
    obj.imageCheckBox14:setLeft(904);
    obj.imageCheckBox14:setTop(684);
    obj.imageCheckBox14:setWidth(17);
    obj.imageCheckBox14:setHeight(22);
    obj.imageCheckBox14:setField("of103");
    obj.imageCheckBox14:setImageChecked("img/oficio3.png");
    obj.imageCheckBox14:setImageUnchecked("");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.flowPart1);
    obj.imageCheckBox15:setLeft(944);
    obj.imageCheckBox15:setTop(686);
    obj.imageCheckBox15:setWidth(17);
    obj.imageCheckBox15:setHeight(22);
    obj.imageCheckBox15:setField("of201");
    obj.imageCheckBox15:setImageChecked("img/oficio1.png");
    obj.imageCheckBox15:setImageUnchecked("");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.flowPart1);
    obj.imageCheckBox16:setLeft(960);
    obj.imageCheckBox16:setTop(682);
    obj.imageCheckBox16:setWidth(17);
    obj.imageCheckBox16:setHeight(22);
    obj.imageCheckBox16:setField("of202");
    obj.imageCheckBox16:setImageChecked("img/oficio2.png");
    obj.imageCheckBox16:setImageUnchecked("");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.flowPart1);
    obj.imageCheckBox17:setLeft(977);
    obj.imageCheckBox17:setTop(684);
    obj.imageCheckBox17:setWidth(17);
    obj.imageCheckBox17:setHeight(22);
    obj.imageCheckBox17:setField("of203");
    obj.imageCheckBox17:setImageChecked("img/oficio3.png");
    obj.imageCheckBox17:setImageUnchecked("");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.flowPart1);
    obj.imageCheckBox18:setLeft(1017);
    obj.imageCheckBox18:setTop(686);
    obj.imageCheckBox18:setWidth(17);
    obj.imageCheckBox18:setHeight(22);
    obj.imageCheckBox18:setField("of301");
    obj.imageCheckBox18:setImageChecked("img/oficio1.png");
    obj.imageCheckBox18:setImageUnchecked("");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.flowPart1);
    obj.imageCheckBox19:setLeft(1033);
    obj.imageCheckBox19:setTop(682);
    obj.imageCheckBox19:setWidth(17);
    obj.imageCheckBox19:setHeight(22);
    obj.imageCheckBox19:setField("of302");
    obj.imageCheckBox19:setImageChecked("img/oficio2.png");
    obj.imageCheckBox19:setImageUnchecked("");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.flowPart1);
    obj.imageCheckBox20:setLeft(1050);
    obj.imageCheckBox20:setTop(684);
    obj.imageCheckBox20:setWidth(17);
    obj.imageCheckBox20:setHeight(22);
    obj.imageCheckBox20:setField("of303");
    obj.imageCheckBox20:setImageChecked("img/oficio3.png");
    obj.imageCheckBox20:setImageUnchecked("");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.flowPart1);
    obj.imageCheckBox21:setLeft(1090);
    obj.imageCheckBox21:setTop(686);
    obj.imageCheckBox21:setWidth(17);
    obj.imageCheckBox21:setHeight(22);
    obj.imageCheckBox21:setField("of401");
    obj.imageCheckBox21:setImageChecked("img/oficio1.png");
    obj.imageCheckBox21:setImageUnchecked("");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.flowPart1);
    obj.imageCheckBox22:setLeft(1106);
    obj.imageCheckBox22:setTop(682);
    obj.imageCheckBox22:setWidth(17);
    obj.imageCheckBox22:setHeight(22);
    obj.imageCheckBox22:setField("of402");
    obj.imageCheckBox22:setImageChecked("img/oficio2.png");
    obj.imageCheckBox22:setImageUnchecked("");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.flowPart1);
    obj.imageCheckBox23:setLeft(1123);
    obj.imageCheckBox23:setTop(684);
    obj.imageCheckBox23:setWidth(17);
    obj.imageCheckBox23:setHeight(22);
    obj.imageCheckBox23:setField("of403");
    obj.imageCheckBox23:setImageChecked("img/oficio3.png");
    obj.imageCheckBox23:setImageUnchecked("");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart1);
    obj.edit67:setLeft(873);
    obj.edit67:setTop(704);
    obj.edit67:setWidth(44);
    obj.edit67:setHeight(18);
    obj.edit67:setField("ofiDice1");
    obj.edit67:setFontSize(14);
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("black");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontFamily("Ar Julian");
    obj.edit67:setTransparent(true);

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart1);
    obj.edit68:setLeft(869);
    obj.edit68:setTop(718);
    obj.edit68:setWidth(52);
    obj.edit68:setHeight(18);
    obj.edit68:setField("ofiDesc1");
    obj.edit68:setFontSize(9.5);
    obj.edit68:setTransparent(true);
    obj.edit68:setName("edit68");
    obj.edit68:setFontColor("black");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontFamily("Ar Julian");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart1);
    obj.edit69:setLeft(946);
    obj.edit69:setTop(704);
    obj.edit69:setWidth(44);
    obj.edit69:setHeight(18);
    obj.edit69:setField("ofiDice2");
    obj.edit69:setFontSize(14);
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("black");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontFamily("Ar Julian");
    obj.edit69:setTransparent(true);

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart1);
    obj.edit70:setLeft(942);
    obj.edit70:setTop(718);
    obj.edit70:setWidth(52);
    obj.edit70:setHeight(18);
    obj.edit70:setField("ofiDesc2");
    obj.edit70:setFontSize(9.5);
    obj.edit70:setTransparent(true);
    obj.edit70:setName("edit70");
    obj.edit70:setFontColor("black");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontFamily("Ar Julian");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart1);
    obj.edit71:setLeft(1019);
    obj.edit71:setTop(704);
    obj.edit71:setWidth(44);
    obj.edit71:setHeight(18);
    obj.edit71:setField("ofiDice3");
    obj.edit71:setFontSize(14);
    obj.edit71:setName("edit71");
    obj.edit71:setFontColor("black");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontFamily("Ar Julian");
    obj.edit71:setTransparent(true);

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart1);
    obj.edit72:setLeft(1015);
    obj.edit72:setTop(718);
    obj.edit72:setWidth(52);
    obj.edit72:setHeight(18);
    obj.edit72:setField("ofiDesc3");
    obj.edit72:setFontSize(9.5);
    obj.edit72:setTransparent(true);
    obj.edit72:setName("edit72");
    obj.edit72:setFontColor("black");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontFamily("Ar Julian");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart1);
    obj.edit73:setLeft(1093);
    obj.edit73:setTop(704);
    obj.edit73:setWidth(44);
    obj.edit73:setHeight(18);
    obj.edit73:setField("ofiDice4");
    obj.edit73:setFontSize(14);
    obj.edit73:setName("edit73");
    obj.edit73:setFontColor("black");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontFamily("Ar Julian");
    obj.edit73:setTransparent(true);

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart1);
    obj.edit74:setLeft(1088);
    obj.edit74:setTop(718);
    obj.edit74:setWidth(52);
    obj.edit74:setHeight(18);
    obj.edit74:setField("ofiDesc4");
    obj.edit74:setFontSize(9.5);
    obj.edit74:setTransparent(true);
    obj.edit74:setName("edit74");
    obj.edit74:setFontColor("black");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontFamily("Ar Julian");


        function changeOficio1(oficio)
            if sheet ~= nil then
                if (oficio == 1) then                
                    sheet.of102 = false;
                    sheet.of103 = false;
                elseif (oficio == 2) then
                    sheet.of101 = true;
                    sheet.of103 = false;
                else
                    sheet.of101 = true;
                    sheet.of102 = true;
                end
            end
        end
        function changeOficio2(oficio)
            if sheet ~= nil then
                if (oficio == 1) then                
                    sheet.of202 = false;
                    sheet.of203 = false;
                elseif (oficio == 2) then
                    sheet.of201 = true;
                    sheet.of203 = false;
                else
                    sheet.of201 = true;
                    sheet.of202 = true;
                end
            end
        end
        function changeOficio3(oficio)
            if sheet ~= nil then
                if (oficio == 1) then                
                    sheet.of302 = false;
                    sheet.of303 = false;
                elseif (oficio == 2) then
                    sheet.of301 = true;
                    sheet.of303 = false;
                else
                    sheet.of301 = true;
                    sheet.of302 = true;
                end
            end
        end
        function changeOficio4(oficio)
            if sheet ~= nil then
                if (oficio == 1) then                
                    sheet.of402 = false;
                    sheet.of403 = false;
                elseif (oficio == 2) then
                    sheet.of401 = true;
                    sheet.of403 = false;
                else
                    sheet.of401 = true;
                    sheet.of402 = true;
                end
            end
        end
    


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowPart1);
    obj.dataLink1:setFields({'np', 'nc', 'stm', 'des', 'int', 'rp'});
    obj.dataLink1:setName("dataLink1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Verso");
    obj.tab2:setName("tab2");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab2);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox4);
    obj.flowLayout2:setWidth(1216);
    obj.flowLayout2:setHeight(818);
    obj.flowLayout2:setMargins({left=10, right=10, top=10, bottom=10});
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setLineSpacing(2);
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(1216);
    obj.flowPart2:setMaxWidth(1216);
    obj.flowPart2:setHeight(818);
    obj.flowPart2:setName("flowPart2");

    obj.frmVerso = GUI.fromHandle(_obj_newObject("form"));
    obj.frmVerso:setParent(obj.flowPart2);
    obj.frmVerso:setName("frmVerso");
    obj.frmVerso:setAlign("client");
    obj.frmVerso:setTheme("light");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.frmVerso);
    obj.image18:setAlign("client");
    obj.image18:setSRC("img/background_historia.png");
    obj.image18:setStyle("originalSize");
    obj.image18:setName("image18");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.frmVerso);
    obj.richEdit4:setAlign("client");
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "transparent");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "black");
    obj.richEdit4:setField("historia");
    obj.richEdit4:setMargins({left=19, right=18, top=32, bottom=18});
    obj.richEdit4:setName("richEdit4");

    obj._e_event0 = obj.edtNatureza:addEventListener("onClick",
        function (_)
            self.cbbConduta.visible = true;
        end, obj);

    obj._e_event1 = obj.cbbConduta:addEventListener("onChange",
        function (_)
            self.cbbConduta.visible = false; sheet.imgConduta = "img/" .. sheet.conduta .. ".png";
        end, obj);

    obj._e_event2 = obj.edtConduta:addEventListener("onClick",
        function (_)
            self.cbbNatureza.visible = true;
        end, obj);

    obj._e_event3 = obj.cbbNatureza:addEventListener("onChange",
        function (_)
            self.cbbNatureza.visible = false; sheet.imgNatureza = "img/" .. sheet.natureza .. ".png";
        end, obj);

    obj._e_event4 = obj.colorComboBox1:addEventListener("onChange",
        function (_)
            changeColor()
        end, obj);

    obj._e_event5 = obj.imgOrdem:addEventListener("onClick",
        function (_)
            self.popupSelectOrdem:show("bottom", self.imgOrdem);
        end, obj);

    obj._e_event6 = obj.image6:addEventListener("onClick",
        function (_)
            sheet.ordem = "img/ordem1.png"; self.popupSelectOrdem:close();
        end, obj);

    obj._e_event7 = obj.image7:addEventListener("onClick",
        function (_)
            sheet.ordem = "img/ordem2.png"; self.popupSelectOrdem:close();
        end, obj);

    obj._e_event8 = obj.image8:addEventListener("onClick",
        function (_)
            sheet.ordem = "img/ordem3.png"; self.popupSelectOrdem:close();
        end, obj);

    obj._e_event9 = obj.image9:addEventListener("onClick",
        function (_)
            sheet.ordem = "img/ordem4.png"; self.popupSelectOrdem:close();
        end, obj);

    obj._e_event10 = obj.image10:addEventListener("onClick",
        function (_)
            sheet.ordem = "img/ordem5.png"; self.popupSelectOrdem:close();
        end, obj);

    obj._e_event11 = obj.imgClasse:addEventListener("onClick",
        function (_)
            self.popupSelectClasse:show("bottom", self.imgClasse);
        end, obj);

    obj._e_event12 = obj.image11:addEventListener("onClick",
        function (_)
            sheet.class = "img/class1.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event13 = obj.image12:addEventListener("onClick",
        function (_)
            sheet.class = "img/class2.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event14 = obj.image13:addEventListener("onClick",
        function (_)
            sheet.class = "img/class3.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event15 = obj.image14:addEventListener("onClick",
        function (_)
            sheet.class = "img/class4.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event16 = obj.image15:addEventListener("onClick",
        function (_)
            sheet.class = "img/class5.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event17 = obj.image16:addEventListener("onClick",
        function (_)
            sheet.class = "img/class6.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event18 = obj.image17:addEventListener("onClick",
        function (_)
            sheet.class = "img/class7.png"; self.popupSelectClasse:close();
        end, obj);

    obj._e_event19 = obj.button1:addEventListener("onClick",
        function (_)
            self.popPrestigio1:show();
        end, obj);

    obj._e_event20 = obj.button2:addEventListener("onClick",
        function (_)
            self.popPrestigio2:show();
        end, obj);

    obj._e_event21 = obj.button3:addEventListener("onClick",
        function (_)
            self.popPrestigio3:show();
        end, obj);

    obj._e_event22 = obj.button4:addEventListener("onClick",
        function (_)
            insertDon()
        end, obj);

    obj._e_event23 = obj.rclDons:addEventListener("onSelect",
        function (_)
            setPopupDonsNode(1);
        end, obj);

    obj._e_event24 = obj.rclDons2:addEventListener("onSelect",
        function (_)
            setPopupDonsNode(2);
        end, obj);

    obj._e_event25 = obj.imageCheckBox12:addEventListener("onClick",
        function (_)
            changeOficio1(1)
        end, obj);

    obj._e_event26 = obj.imageCheckBox13:addEventListener("onClick",
        function (_)
            changeOficio1(2)
        end, obj);

    obj._e_event27 = obj.imageCheckBox14:addEventListener("onClick",
        function (_)
            changeOficio1(3)
        end, obj);

    obj._e_event28 = obj.imageCheckBox15:addEventListener("onClick",
        function (_)
            changeOficio2(1)
        end, obj);

    obj._e_event29 = obj.imageCheckBox16:addEventListener("onClick",
        function (_)
            changeOficio2(2)
        end, obj);

    obj._e_event30 = obj.imageCheckBox17:addEventListener("onClick",
        function (_)
            changeOficio2(3)
        end, obj);

    obj._e_event31 = obj.imageCheckBox18:addEventListener("onClick",
        function (_)
            changeOficio3(1)
        end, obj);

    obj._e_event32 = obj.imageCheckBox19:addEventListener("onClick",
        function (_)
            changeOficio3(2)
        end, obj);

    obj._e_event33 = obj.imageCheckBox20:addEventListener("onClick",
        function (_)
            changeOficio3(3)
        end, obj);

    obj._e_event34 = obj.imageCheckBox21:addEventListener("onClick",
        function (_)
            changeOficio4(1)
        end, obj);

    obj._e_event35 = obj.imageCheckBox22:addEventListener("onClick",
        function (_)
            changeOficio4(2)
        end, obj);

    obj._e_event36 = obj.imageCheckBox23:addEventListener("onClick",
        function (_)
            changeOficio4(3)
        end, obj);

    obj._e_event37 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.eq = (tonumber(sheet.des) or 0) + (tonumber(sheet.rp) or 0) + 9;
            
            
                    if (tonumber(sheet.des) or 0) >= 0 then
                        sheet.aa = math.floor((tonumber(sheet.des) or 0) / 2 + 1);
                    else
                        sheet.aa = math.floor((tonumber(sheet.des) or 0) / 2  + 1.5);
                    end
                    
                    if (tonumber(sheet.aa) or 0) > 0 then
                        sheet.aa = "+" .. sheet.aa;
                    end
            
                    sheet.fort = (tonumber(sheet.np) or 0) + (tonumber(sheet.stm) or 0) + math.floor( (tonumber(sheet.int) or 0) / 2 );
            
                    sheet.vont = (tonumber(sheet.nc) or 0) + (tonumber(sheet.int) or 0) + math.floor( (tonumber(sheet.stm) or 0) / 2 );
            
                    sheet.pvMinusOne = math.floor( (tonumber(sheet.pvImg) or 0) / 2 );
                    sheet.pvMinusTwo = math.floor( (tonumber(sheet.pvMinusOne) or 0) / 2 );
                    sheet.pvMinusThree = math.floor( (tonumber(sheet.pvMinusTwo) or 0) / 2 );
                    sheet.pdMinusOne = math.floor( (tonumber(sheet.pdImg) or 0) / 2 );
                    sheet.pdMinusTwo = math.floor( (tonumber(sheet.pdMinusOne) or 0) / 2 );
                    sheet.pdMinusThree = math.floor( (tonumber(sheet.pdMinusTwo) or 0) / 2 );
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
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

        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edtIdade ~= nil then self.edtIdade:destroy(); self.edtIdade = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.cbbNatureza ~= nil then self.cbbNatureza:destroy(); self.cbbNatureza = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.popPrestigio1 ~= nil then self.popPrestigio1:destroy(); self.popPrestigio1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edtConduta ~= nil then self.edtConduta:destroy(); self.edtConduta = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.colorComboBox1 ~= nil then self.colorComboBox1:destroy(); self.colorComboBox1 = nil; end;
        if self.imgOrdem ~= nil then self.imgOrdem:destroy(); self.imgOrdem = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.popPrestigio3 ~= nil then self.popPrestigio3:destroy(); self.popPrestigio3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edtPdImg ~= nil then self.edtPdImg:destroy(); self.edtPdImg = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.popupSelectClasse ~= nil then self.popupSelectClasse:destroy(); self.popupSelectClasse = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.edtPdMinusThree ~= nil then self.edtPdMinusThree:destroy(); self.edtPdMinusThree = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rclDons2 ~= nil then self.rclDons2:destroy(); self.rclDons2 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edtPdMinusOne ~= nil then self.edtPdMinusOne:destroy(); self.edtPdMinusOne = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.edtNatureza ~= nil then self.edtNatureza:destroy(); self.edtNatureza = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.rclDons ~= nil then self.rclDons:destroy(); self.rclDons = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.popupSelectOrdem ~= nil then self.popupSelectOrdem:destroy(); self.popupSelectOrdem = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.frmVerso ~= nil then self.frmVerso:destroy(); self.frmVerso = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.imgClasse ~= nil then self.imgClasse:destroy(); self.imgClasse = nil; end;
        if self.popPrestigio2 ~= nil then self.popPrestigio2:destroy(); self.popPrestigio2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edtPdMinusTwo ~= nil then self.edtPdMinusTwo:destroy(); self.edtPdMinusTwo = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.cbbConduta ~= nil then self.cbbConduta:destroy(); self.cbbConduta = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "OTomoByRafa", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "O Tomo", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
