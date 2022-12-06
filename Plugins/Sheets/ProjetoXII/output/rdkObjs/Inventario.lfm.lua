require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha333_svg()
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
    obj:setName("frmFicha333_svg");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setSRC("/imagens/Inventario.png");
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(700);
    obj.image1:setHeight(900);
    obj.image1:setName("image1");

    obj.InventarioM1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InventarioM1:setParent(obj.scrollBox1);
    obj.InventarioM1:setName("InventarioM1");
    obj.InventarioM1:setAlign("client");
    obj.InventarioM1:setVisible(true);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.InventarioM1);
    obj.image2:setSRC("/imagens/Inventario.png");
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(700);
    obj.image2:setHeight(900);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.InventarioM1);
    obj.image3:setSRC("/imagens/Numero 1.png");
    obj.image3:setLeft(399.25);
    obj.image3:setTop(301);
    obj.image3:setWidth(24);
    obj.image3:setHeight(22);
    obj.image3:setName("image3");

    obj.itemEsquerda = GUI.fromHandle(_obj_newObject("image"));
    obj.itemEsquerda:setParent(obj.InventarioM1);
    obj.itemEsquerda:setField("itemEsquerda");
    obj.itemEsquerda:setName("itemEsquerda");
    obj.itemEsquerda:setLeft(131.75);
    obj.itemEsquerda:setTop(175);
    obj.itemEsquerda:setWidth(138.75);
    obj.itemEsquerda:setHeight(121.50);
    obj.itemEsquerda:setEditable(true);
    obj.itemEsquerda:setStyle("proportional");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.InventarioM1);
    obj.image4:setField("itemDireita");
    obj.image4:setLeft(428.75);
    obj.image4:setTop(175);
    obj.image4:setWidth(138.75);
    obj.image4:setHeight(121.50);
    obj.image4:setEditable(true);
    obj.image4:setStyle("proportional");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.InventarioM1);
    obj.image5:setField("Item1");
    obj.image5:setLeft(90.75);
    obj.image5:setTop(342);
    obj.image5:setWidth(138.75);
    obj.image5:setHeight(121.50);
    obj.image5:setEditable(true);
    obj.image5:setStyle("proportional");
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.InventarioM1);
    obj.image6:setField("Item2");
    obj.image6:setLeft(277.75);
    obj.image6:setTop(342);
    obj.image6:setWidth(138.75);
    obj.image6:setHeight(121.50);
    obj.image6:setEditable(true);
    obj.image6:setStyle("proportional");
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.InventarioM1);
    obj.image7:setField("Item3");
    obj.image7:setLeft(470.75);
    obj.image7:setTop(342);
    obj.image7:setWidth(138.75);
    obj.image7:setHeight(121.50);
    obj.image7:setEditable(true);
    obj.image7:setStyle("proportional");
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.InventarioM1);
    obj.image8:setField("Item4");
    obj.image8:setLeft(92.50);
    obj.image8:setTop(581);
    obj.image8:setWidth(134.88);
    obj.image8:setHeight(121.25);
    obj.image8:setEditable(true);
    obj.image8:setStyle("proportional");
    obj.image8:setName("image8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.InventarioM1);
    obj.image9:setField("Item5");
    obj.image9:setLeft(280.25);
    obj.image9:setTop(581);
    obj.image9:setWidth(134.14);
    obj.image9:setHeight(120.16);
    obj.image9:setEditable(true);
    obj.image9:setStyle("proportional");
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.InventarioM1);
    obj.image10:setField("Item6");
    obj.image10:setLeft(472.25);
    obj.image10:setTop(581);
    obj.image10:setWidth(134.14);
    obj.image10:setHeight(120.38);
    obj.image10:setEditable(true);
    obj.image10:setStyle("proportional");
    obj.image10:setName("image10");

    obj.troca1 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca1:setParent(obj.InventarioM1);
    obj.troca1:setName("troca1");
    obj.troca1:setLeft(88);
    obj.troca1:setTop(206.25);
    obj.troca1:setWidth(43);
    obj.troca1:setHeight(41);
    obj.troca1:setHitTest(true);
    obj.troca1:setCursor("handPoint");
    obj.troca1:setOpacity(0);

    obj.troca2 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca2:setParent(obj.InventarioM1);
    obj.troca2:setName("troca2");
    obj.troca2:setLeft(569);
    obj.troca2:setTop(206.25);
    obj.troca2:setWidth(43);
    obj.troca2:setHeight(41);
    obj.troca2:setHitTest(true);
    obj.troca2:setCursor("handPoint");
    obj.troca2:setOpacity(0);

    obj.troca3 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca3:setParent(obj.InventarioM1);
    obj.troca3:setName("troca3");
    obj.troca3:setLeft(88);
    obj.troca3:setTop(472.75);
    obj.troca3:setWidth(43);
    obj.troca3:setHeight(41);
    obj.troca3:setHitTest(true);
    obj.troca3:setCursor("handPoint");
    obj.troca3:setOpacity(0);

    obj.troca4 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca4:setParent(obj.InventarioM1);
    obj.troca4:setName("troca4");
    obj.troca4:setLeft(276);
    obj.troca4:setTop(471.75);
    obj.troca4:setWidth(43);
    obj.troca4:setHeight(41);
    obj.troca4:setHitTest(true);
    obj.troca4:setCursor("handPoint");
    obj.troca4:setOpacity(0);

    obj.troca5 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca5:setParent(obj.InventarioM1);
    obj.troca5:setName("troca5");
    obj.troca5:setLeft(468);
    obj.troca5:setTop(471.75);
    obj.troca5:setWidth(43);
    obj.troca5:setHeight(41);
    obj.troca5:setHitTest(true);
    obj.troca5:setCursor("handPoint");
    obj.troca5:setOpacity(0);

    obj.troca6 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca6:setParent(obj.InventarioM1);
    obj.troca6:setName("troca6");
    obj.troca6:setLeft(87.74);
    obj.troca6:setTop(702);
    obj.troca6:setWidth(42.13);
    obj.troca6:setHeight(49.75);
    obj.troca6:setHitTest(true);
    obj.troca6:setCursor("handPoint");
    obj.troca6:setOpacity(0);

    obj.troca7 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca7:setParent(obj.InventarioM1);
    obj.troca7:setName("troca7");
    obj.troca7:setLeft(277.50);
    obj.troca7:setTop(702);
    obj.troca7:setWidth(42.13);
    obj.troca7:setHeight(49.75);
    obj.troca7:setHitTest(true);
    obj.troca7:setCursor("handPoint");
    obj.troca7:setOpacity(0);

    obj.troca8 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca8:setParent(obj.InventarioM1);
    obj.troca8:setName("troca8");
    obj.troca8:setLeft(468);
    obj.troca8:setTop(702);
    obj.troca8:setWidth(42.13);
    obj.troca8:setHeight(49.75);
    obj.troca8:setHitTest(true);
    obj.troca8:setCursor("handPoint");
    obj.troca8:setOpacity(0);

    obj.popMeuPopup1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup1:setParent(obj.InventarioM1);
    obj.popMeuPopup1:setName("popMeuPopup1");
    obj.popMeuPopup1:setWidth(400);
    obj.popMeuPopup1:setHeight(533);
    obj.popMeuPopup1:setBackOpacity(0.5);
    obj.popMeuPopup1:setAlign("left");
    obj.popMeuPopup1:setMargins({bottom=400});

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.popMeuPopup1);
    obj.image11:setSRC("/imagens/infDosItens.png");
    obj.image11:setWidth(400);
    obj.image11:setHeight(533);
    obj.image11:setLeft(0);
    obj.image11:setTop(0);
    obj.image11:setName("image11");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.popMeuPopup1);
    obj.button1:setLeft(70.28);
    obj.button1:setTop(101.31);
    obj.button1:setWidth(41.25);
    obj.button1:setHeight(23.34);
    obj.button1:setText("Usar");
    obj.button1:setName("button1");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.popMeuPopup1);
    obj.image12:setField("itemEsquerda");
    obj.image12:setLeft(132.75);
    obj.image12:setTop(67.25);
    obj.image12:setWidth(140.75);
    obj.image12:setHeight(114.50);
    obj.image12:setEditable(true);
    obj.image12:setStyle("proportional");
    obj.image12:setName("image12");

    obj.nome1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome1:setParent(obj.popMeuPopup1);
    obj.nome1:setField("nome1");
    obj.nome1:setName("nome1");
    obj.nome1:setLeft(145);
    obj.nome1:setTop(202);
    obj.nome1:setWidth(206.25);
    obj.nome1:setHeight(39.75);
    obj.nome1:setTransparent(true);
    obj.nome1:setFontSize(20);

    obj.dano1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano1:setParent(obj.popMeuPopup1);
    obj.dano1:setField("dano1");
    obj.dano1:setName("dano1");
    obj.dano1:setLeft(133);
    obj.dano1:setTop(248.25);
    obj.dano1:setWidth(212.50);
    obj.dano1:setHeight(36.75);
    obj.dano1:setTransparent(true);
    obj.dano1:setFontSize(20);

    obj.adicional1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional1:setParent(obj.popMeuPopup1);
    obj.adicional1:setField("adicional1");
    obj.adicional1:setName("adicional1");
    obj.adicional1:setLeft(179);
    obj.adicional1:setTop(297.25);
    obj.adicional1:setWidth(168);
    obj.adicional1:setHeight(36);
    obj.adicional1:setTransparent(true);
    obj.adicional1:setFontSize(20);

    obj.efeito1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito1:setParent(obj.popMeuPopup1);
    obj.efeito1:setField("efeito1");
    obj.efeito1:setName("efeito1");
    obj.efeito1:setLeft(55);
    obj.efeito1:setTop(362.25);
    obj.efeito1:setWidth(285.25);
    obj.efeito1:setHeight(100.75);
    obj.efeito1:setTransparent(true);
    obj.efeito1:setFontSize(20);

    obj.bdeleted1 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted1:setParent(obj.popMeuPopup1);
    obj.bdeleted1:setName("bdeleted1");
    obj.bdeleted1:setLeft(295.75);
    obj.bdeleted1:setTop(104);
    obj.bdeleted1:setWidth(43);
    obj.bdeleted1:setHeight(41);
    obj.bdeleted1:setHitTest(true);
    obj.bdeleted1:setCursor("handPoint");
    obj.bdeleted1:setOpacity(0);

    obj.popMeuPopup2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup2:setParent(obj.InventarioM1);
    obj.popMeuPopup2:setName("popMeuPopup2");
    obj.popMeuPopup2:setWidth(400);
    obj.popMeuPopup2:setHeight(533);
    obj.popMeuPopup2:setBackOpacity(0.5);
    obj.popMeuPopup2:setAlign("left");
    obj.popMeuPopup2:setMargins({bottom=400});

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.popMeuPopup2);
    obj.image13:setSRC("/imagens/infDosItens.png");
    obj.image13:setWidth(400);
    obj.image13:setHeight(533);
    obj.image13:setLeft(0);
    obj.image13:setTop(0);
    obj.image13:setName("image13");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.popMeuPopup2);
    obj.button2:setLeft(70.28);
    obj.button2:setTop(101.31);
    obj.button2:setWidth(41.25);
    obj.button2:setHeight(23.34);
    obj.button2:setText("Usar");
    obj.button2:setName("button2");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.popMeuPopup2);
    obj.image14:setField("itemDireita");
    obj.image14:setLeft(132.75);
    obj.image14:setTop(67.25);
    obj.image14:setWidth(140.75);
    obj.image14:setHeight(114.50);
    obj.image14:setEditable(true);
    obj.image14:setStyle("proportional");
    obj.image14:setName("image14");

    obj.nome2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome2:setParent(obj.popMeuPopup2);
    obj.nome2:setField("nome2");
    obj.nome2:setName("nome2");
    obj.nome2:setLeft(140);
    obj.nome2:setTop(201.25);
    obj.nome2:setWidth(206.25);
    obj.nome2:setHeight(36.75);
    obj.nome2:setTransparent(true);
    obj.nome2:setFontSize(20);

    obj.dano2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano2:setParent(obj.popMeuPopup2);
    obj.dano2:setField("dano2");
    obj.dano2:setName("dano2");
    obj.dano2:setLeft(133);
    obj.dano2:setTop(248.25);
    obj.dano2:setWidth(212.50);
    obj.dano2:setHeight(36.75);
    obj.dano2:setTransparent(true);
    obj.dano2:setFontSize(20);

    obj.adicional2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional2:setParent(obj.popMeuPopup2);
    obj.adicional2:setField("adicional2");
    obj.adicional2:setName("adicional2");
    obj.adicional2:setLeft(179);
    obj.adicional2:setTop(297.25);
    obj.adicional2:setWidth(168);
    obj.adicional2:setHeight(36);
    obj.adicional2:setTransparent(true);
    obj.adicional2:setFontSize(20);

    obj.efeito2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito2:setParent(obj.popMeuPopup2);
    obj.efeito2:setField("efeito2");
    obj.efeito2:setName("efeito2");
    obj.efeito2:setLeft(55);
    obj.efeito2:setTop(362.25);
    obj.efeito2:setWidth(285.25);
    obj.efeito2:setHeight(100.75);
    obj.efeito2:setTransparent(true);
    obj.efeito2:setFontSize(20);

    obj.bdeleted2 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted2:setParent(obj.popMeuPopup2);
    obj.bdeleted2:setName("bdeleted2");
    obj.bdeleted2:setLeft(295.75);
    obj.bdeleted2:setTop(104);
    obj.bdeleted2:setWidth(43);
    obj.bdeleted2:setHeight(41);
    obj.bdeleted2:setHitTest(true);
    obj.bdeleted2:setCursor("handPoint");
    obj.bdeleted2:setOpacity(0);

    obj.popMeuPopup3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup3:setParent(obj.InventarioM1);
    obj.popMeuPopup3:setName("popMeuPopup3");
    obj.popMeuPopup3:setWidth(400);
    obj.popMeuPopup3:setHeight(533);
    obj.popMeuPopup3:setBackOpacity(0.5);
    obj.popMeuPopup3:setAlign("left");
    obj.popMeuPopup3:setMargins({bottom=400});

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.popMeuPopup3);
    obj.image15:setSRC("/imagens/infDosItens.png");
    obj.image15:setWidth(400);
    obj.image15:setHeight(533);
    obj.image15:setLeft(0);
    obj.image15:setTop(0);
    obj.image15:setName("image15");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.popMeuPopup3);
    obj.button3:setLeft(70.28);
    obj.button3:setTop(101.31);
    obj.button3:setWidth(41.25);
    obj.button3:setHeight(23.34);
    obj.button3:setText("Usar");
    obj.button3:setName("button3");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.popMeuPopup3);
    obj.image16:setField("Item1");
    obj.image16:setLeft(132.75);
    obj.image16:setTop(67.25);
    obj.image16:setWidth(140.75);
    obj.image16:setHeight(114.50);
    obj.image16:setEditable(true);
    obj.image16:setStyle("proportional");
    obj.image16:setName("image16");

    obj.nome3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome3:setParent(obj.popMeuPopup3);
    obj.nome3:setField("nome3");
    obj.nome3:setName("nome3");
    obj.nome3:setLeft(140);
    obj.nome3:setTop(201.25);
    obj.nome3:setWidth(206.25);
    obj.nome3:setHeight(36.75);
    obj.nome3:setTransparent(true);
    obj.nome3:setFontSize(20);

    obj.dano3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano3:setParent(obj.popMeuPopup3);
    obj.dano3:setField("dano3");
    obj.dano3:setName("dano3");
    obj.dano3:setLeft(133);
    obj.dano3:setTop(248.25);
    obj.dano3:setWidth(212.50);
    obj.dano3:setHeight(36.75);
    obj.dano3:setTransparent(true);
    obj.dano3:setFontSize(20);

    obj.adicional3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional3:setParent(obj.popMeuPopup3);
    obj.adicional3:setField("adicional3");
    obj.adicional3:setName("adicional3");
    obj.adicional3:setLeft(179);
    obj.adicional3:setTop(297.25);
    obj.adicional3:setWidth(168);
    obj.adicional3:setHeight(36);
    obj.adicional3:setTransparent(true);
    obj.adicional3:setFontSize(20);

    obj.efeito3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito3:setParent(obj.popMeuPopup3);
    obj.efeito3:setField("efeito3");
    obj.efeito3:setName("efeito3");
    obj.efeito3:setLeft(55);
    obj.efeito3:setTop(362.25);
    obj.efeito3:setWidth(285.25);
    obj.efeito3:setHeight(100.75);
    obj.efeito3:setTransparent(true);
    obj.efeito3:setFontSize(20);

    obj.bdeleted3 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted3:setParent(obj.popMeuPopup3);
    obj.bdeleted3:setName("bdeleted3");
    obj.bdeleted3:setLeft(295.75);
    obj.bdeleted3:setTop(104);
    obj.bdeleted3:setWidth(43);
    obj.bdeleted3:setHeight(41);
    obj.bdeleted3:setHitTest(true);
    obj.bdeleted3:setCursor("handPoint");
    obj.bdeleted3:setOpacity(0);

    obj.popMeuPopup4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup4:setParent(obj.InventarioM1);
    obj.popMeuPopup4:setName("popMeuPopup4");
    obj.popMeuPopup4:setWidth(400);
    obj.popMeuPopup4:setHeight(533);
    obj.popMeuPopup4:setBackOpacity(0.5);
    obj.popMeuPopup4:setAlign("left");
    obj.popMeuPopup4:setMargins({bottom=400});

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.popMeuPopup4);
    obj.image17:setSRC("/imagens/infDosItens.png");
    obj.image17:setWidth(400);
    obj.image17:setHeight(533);
    obj.image17:setLeft(0);
    obj.image17:setTop(0);
    obj.image17:setName("image17");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.popMeuPopup4);
    obj.button4:setLeft(70.28);
    obj.button4:setTop(101.31);
    obj.button4:setWidth(41.25);
    obj.button4:setHeight(23.34);
    obj.button4:setText("Usar");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.popMeuPopup4);
    obj.button5:setLeft(70.28);
    obj.button5:setTop(101.31);
    obj.button5:setWidth(41.25);
    obj.button5:setHeight(23.34);
    obj.button5:setText("Usar");
    obj.button5:setName("button5");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.popMeuPopup4);
    obj.image18:setField("Item2");
    obj.image18:setLeft(132.75);
    obj.image18:setTop(67.25);
    obj.image18:setWidth(140.75);
    obj.image18:setHeight(114.50);
    obj.image18:setEditable(true);
    obj.image18:setStyle("proportional");
    obj.image18:setName("image18");

    obj.nome4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome4:setParent(obj.popMeuPopup4);
    obj.nome4:setField("nome4");
    obj.nome4:setName("nome4");
    obj.nome4:setLeft(140);
    obj.nome4:setTop(201.25);
    obj.nome4:setWidth(206.25);
    obj.nome4:setHeight(36.75);
    obj.nome4:setTransparent(true);
    obj.nome4:setFontSize(20);

    obj.dano4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano4:setParent(obj.popMeuPopup4);
    obj.dano4:setField("dano4");
    obj.dano4:setName("dano4");
    obj.dano4:setLeft(133);
    obj.dano4:setTop(248.25);
    obj.dano4:setWidth(212.50);
    obj.dano4:setHeight(36.75);
    obj.dano4:setTransparent(true);
    obj.dano4:setFontSize(20);

    obj.adicional4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional4:setParent(obj.popMeuPopup4);
    obj.adicional4:setField("adicional4");
    obj.adicional4:setName("adicional4");
    obj.adicional4:setLeft(179);
    obj.adicional4:setTop(297.25);
    obj.adicional4:setWidth(168);
    obj.adicional4:setHeight(36);
    obj.adicional4:setTransparent(true);
    obj.adicional4:setFontSize(20);

    obj.efeito4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito4:setParent(obj.popMeuPopup4);
    obj.efeito4:setField("efeito4");
    obj.efeito4:setName("efeito4");
    obj.efeito4:setLeft(55);
    obj.efeito4:setTop(362.25);
    obj.efeito4:setWidth(285.25);
    obj.efeito4:setHeight(100.75);
    obj.efeito4:setTransparent(true);
    obj.efeito4:setFontSize(20);

    obj.bdeleted4 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted4:setParent(obj.popMeuPopup4);
    obj.bdeleted4:setName("bdeleted4");
    obj.bdeleted4:setLeft(295.75);
    obj.bdeleted4:setTop(104);
    obj.bdeleted4:setWidth(43);
    obj.bdeleted4:setHeight(41);
    obj.bdeleted4:setHitTest(true);
    obj.bdeleted4:setCursor("handPoint");
    obj.bdeleted4:setOpacity(0);

    obj.popMeuPopup5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup5:setParent(obj.InventarioM1);
    obj.popMeuPopup5:setName("popMeuPopup5");
    obj.popMeuPopup5:setWidth(400);
    obj.popMeuPopup5:setHeight(533);
    obj.popMeuPopup5:setBackOpacity(0.5);
    obj.popMeuPopup5:setAlign("left");
    obj.popMeuPopup5:setMargins({bottom=400});

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.popMeuPopup5);
    obj.image19:setSRC("/imagens/infDosItens.png");
    obj.image19:setWidth(400);
    obj.image19:setHeight(533);
    obj.image19:setLeft(0);
    obj.image19:setTop(0);
    obj.image19:setName("image19");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.popMeuPopup5);
    obj.button6:setLeft(70.28);
    obj.button6:setTop(101.31);
    obj.button6:setWidth(41.25);
    obj.button6:setHeight(23.34);
    obj.button6:setText("Usar");
    obj.button6:setName("button6");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.popMeuPopup5);
    obj.image20:setField("Item3");
    obj.image20:setLeft(132.75);
    obj.image20:setTop(67.25);
    obj.image20:setWidth(140.75);
    obj.image20:setHeight(114.50);
    obj.image20:setEditable(true);
    obj.image20:setStyle("proportional");
    obj.image20:setName("image20");

    obj.nome5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome5:setParent(obj.popMeuPopup5);
    obj.nome5:setField("nome5");
    obj.nome5:setName("nome5");
    obj.nome5:setLeft(140);
    obj.nome5:setTop(201.25);
    obj.nome5:setWidth(206.25);
    obj.nome5:setHeight(36.75);
    obj.nome5:setTransparent(true);
    obj.nome5:setFontSize(20);

    obj.dano5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano5:setParent(obj.popMeuPopup5);
    obj.dano5:setField("dano5");
    obj.dano5:setName("dano5");
    obj.dano5:setLeft(133);
    obj.dano5:setTop(248.25);
    obj.dano5:setWidth(212.50);
    obj.dano5:setHeight(36.75);
    obj.dano5:setTransparent(true);
    obj.dano5:setFontSize(20);

    obj.adicional5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional5:setParent(obj.popMeuPopup5);
    obj.adicional5:setField("adicional5");
    obj.adicional5:setName("adicional5");
    obj.adicional5:setLeft(179);
    obj.adicional5:setTop(297.25);
    obj.adicional5:setWidth(168);
    obj.adicional5:setHeight(36);
    obj.adicional5:setTransparent(true);
    obj.adicional5:setFontSize(20);

    obj.efeito5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito5:setParent(obj.popMeuPopup5);
    obj.efeito5:setField("efeito5");
    obj.efeito5:setName("efeito5");
    obj.efeito5:setLeft(55);
    obj.efeito5:setTop(362.25);
    obj.efeito5:setWidth(285.25);
    obj.efeito5:setHeight(100.75);
    obj.efeito5:setTransparent(true);
    obj.efeito5:setFontSize(20);

    obj.bdeleted5 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted5:setParent(obj.popMeuPopup5);
    obj.bdeleted5:setName("bdeleted5");
    obj.bdeleted5:setLeft(295.75);
    obj.bdeleted5:setTop(104);
    obj.bdeleted5:setWidth(43);
    obj.bdeleted5:setHeight(41);
    obj.bdeleted5:setHitTest(true);
    obj.bdeleted5:setCursor("handPoint");
    obj.bdeleted5:setOpacity(0);

    obj.popMeuPopup6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup6:setParent(obj.InventarioM1);
    obj.popMeuPopup6:setName("popMeuPopup6");
    obj.popMeuPopup6:setWidth(400);
    obj.popMeuPopup6:setHeight(533);
    obj.popMeuPopup6:setBackOpacity(0.5);
    obj.popMeuPopup6:setAlign("left");
    obj.popMeuPopup6:setMargins({bottom=400});

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.popMeuPopup6);
    obj.image21:setSRC("/imagens/infDosItens.png");
    obj.image21:setWidth(400);
    obj.image21:setHeight(533);
    obj.image21:setLeft(0);
    obj.image21:setTop(0);
    obj.image21:setName("image21");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.popMeuPopup6);
    obj.button7:setLeft(70.28);
    obj.button7:setTop(101.31);
    obj.button7:setWidth(41.25);
    obj.button7:setHeight(23.34);
    obj.button7:setText("Usar");
    obj.button7:setName("button7");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.popMeuPopup6);
    obj.image22:setField("Item4");
    obj.image22:setLeft(132.75);
    obj.image22:setTop(67.25);
    obj.image22:setWidth(140.75);
    obj.image22:setHeight(114.50);
    obj.image22:setEditable(true);
    obj.image22:setStyle("proportional");
    obj.image22:setName("image22");

    obj.nome6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome6:setParent(obj.popMeuPopup6);
    obj.nome6:setField("nome6");
    obj.nome6:setName("nome6");
    obj.nome6:setLeft(140);
    obj.nome6:setTop(201.25);
    obj.nome6:setWidth(206.25);
    obj.nome6:setHeight(36.75);
    obj.nome6:setTransparent(true);
    obj.nome6:setFontSize(20);

    obj.dano6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano6:setParent(obj.popMeuPopup6);
    obj.dano6:setField("dano6");
    obj.dano6:setName("dano6");
    obj.dano6:setLeft(133);
    obj.dano6:setTop(248.25);
    obj.dano6:setWidth(212.50);
    obj.dano6:setHeight(36.75);
    obj.dano6:setTransparent(true);
    obj.dano6:setFontSize(20);

    obj.adicional6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional6:setParent(obj.popMeuPopup6);
    obj.adicional6:setField("adicional6");
    obj.adicional6:setName("adicional6");
    obj.adicional6:setLeft(179);
    obj.adicional6:setTop(297.25);
    obj.adicional6:setWidth(168);
    obj.adicional6:setHeight(36);
    obj.adicional6:setTransparent(true);
    obj.adicional6:setFontSize(20);

    obj.efeito6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito6:setParent(obj.popMeuPopup6);
    obj.efeito6:setField("efeito6");
    obj.efeito6:setName("efeito6");
    obj.efeito6:setLeft(55);
    obj.efeito6:setTop(362.25);
    obj.efeito6:setWidth(285.25);
    obj.efeito6:setHeight(100.75);
    obj.efeito6:setTransparent(true);
    obj.efeito6:setFontSize(20);

    obj.bdeleted6 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted6:setParent(obj.popMeuPopup6);
    obj.bdeleted6:setName("bdeleted6");
    obj.bdeleted6:setLeft(295.75);
    obj.bdeleted6:setTop(104);
    obj.bdeleted6:setWidth(43);
    obj.bdeleted6:setHeight(41);
    obj.bdeleted6:setHitTest(true);
    obj.bdeleted6:setCursor("handPoint");
    obj.bdeleted6:setOpacity(0);

    obj.popMeuPopup7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup7:setParent(obj.InventarioM1);
    obj.popMeuPopup7:setName("popMeuPopup7");
    obj.popMeuPopup7:setWidth(400);
    obj.popMeuPopup7:setHeight(533);
    obj.popMeuPopup7:setBackOpacity(0.5);
    obj.popMeuPopup7:setAlign("left");
    obj.popMeuPopup7:setMargins({bottom=400});

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.popMeuPopup7);
    obj.image23:setSRC("/imagens/infDosItens.png");
    obj.image23:setWidth(400);
    obj.image23:setHeight(533);
    obj.image23:setLeft(0);
    obj.image23:setTop(0);
    obj.image23:setName("image23");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.popMeuPopup7);
    obj.button8:setLeft(70.28);
    obj.button8:setTop(101.31);
    obj.button8:setWidth(41.25);
    obj.button8:setHeight(23.34);
    obj.button8:setText("Usar");
    obj.button8:setName("button8");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.popMeuPopup7);
    obj.image24:setField("Item5");
    obj.image24:setLeft(132.75);
    obj.image24:setTop(67.25);
    obj.image24:setWidth(140.75);
    obj.image24:setHeight(114.50);
    obj.image24:setEditable(true);
    obj.image24:setStyle("proportional");
    obj.image24:setName("image24");

    obj.nome7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome7:setParent(obj.popMeuPopup7);
    obj.nome7:setField("nome7");
    obj.nome7:setName("nome7");
    obj.nome7:setLeft(140);
    obj.nome7:setTop(201.25);
    obj.nome7:setWidth(206.25);
    obj.nome7:setHeight(36.75);
    obj.nome7:setTransparent(true);
    obj.nome7:setFontSize(20);

    obj.dano7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano7:setParent(obj.popMeuPopup7);
    obj.dano7:setField("dano7");
    obj.dano7:setName("dano7");
    obj.dano7:setLeft(133);
    obj.dano7:setTop(248.25);
    obj.dano7:setWidth(212.50);
    obj.dano7:setHeight(36.75);
    obj.dano7:setTransparent(true);
    obj.dano7:setFontSize(20);

    obj.adicional7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional7:setParent(obj.popMeuPopup7);
    obj.adicional7:setField("adicional7");
    obj.adicional7:setName("adicional7");
    obj.adicional7:setLeft(179);
    obj.adicional7:setTop(297.25);
    obj.adicional7:setWidth(168);
    obj.adicional7:setHeight(36);
    obj.adicional7:setTransparent(true);
    obj.adicional7:setFontSize(20);

    obj.efeito7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito7:setParent(obj.popMeuPopup7);
    obj.efeito7:setField("efeito7");
    obj.efeito7:setName("efeito7");
    obj.efeito7:setLeft(55);
    obj.efeito7:setTop(362.25);
    obj.efeito7:setWidth(285.25);
    obj.efeito7:setHeight(100.75);
    obj.efeito7:setTransparent(true);
    obj.efeito7:setFontSize(20);

    obj.bdeleted7 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted7:setParent(obj.popMeuPopup7);
    obj.bdeleted7:setName("bdeleted7");
    obj.bdeleted7:setLeft(295.75);
    obj.bdeleted7:setTop(104);
    obj.bdeleted7:setWidth(43);
    obj.bdeleted7:setHeight(41);
    obj.bdeleted7:setHitTest(true);
    obj.bdeleted7:setCursor("handPoint");
    obj.bdeleted7:setOpacity(0);

    obj.popMeuPopup8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup8:setParent(obj.InventarioM1);
    obj.popMeuPopup8:setName("popMeuPopup8");
    obj.popMeuPopup8:setWidth(400);
    obj.popMeuPopup8:setHeight(533);
    obj.popMeuPopup8:setBackOpacity(0.5);
    obj.popMeuPopup8:setAlign("left");
    obj.popMeuPopup8:setMargins({bottom=400});

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.popMeuPopup8);
    obj.image25:setSRC("/imagens/infDosItens.png");
    obj.image25:setWidth(400);
    obj.image25:setHeight(533);
    obj.image25:setLeft(0);
    obj.image25:setTop(0);
    obj.image25:setName("image25");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.popMeuPopup8);
    obj.button9:setLeft(70.28);
    obj.button9:setTop(101.31);
    obj.button9:setWidth(41.25);
    obj.button9:setHeight(23.34);
    obj.button9:setText("Usar");
    obj.button9:setName("button9");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.popMeuPopup8);
    obj.image26:setField("Item6");
    obj.image26:setLeft(132.75);
    obj.image26:setTop(67.25);
    obj.image26:setWidth(140.75);
    obj.image26:setHeight(114.50);
    obj.image26:setEditable(true);
    obj.image26:setStyle("proportional");
    obj.image26:setName("image26");

    obj.nome8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome8:setParent(obj.popMeuPopup8);
    obj.nome8:setField("nome8");
    obj.nome8:setName("nome8");
    obj.nome8:setLeft(140);
    obj.nome8:setTop(201.25);
    obj.nome8:setWidth(206.25);
    obj.nome8:setHeight(36.75);
    obj.nome8:setTransparent(true);
    obj.nome8:setFontSize(20);

    obj.dano8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano8:setParent(obj.popMeuPopup8);
    obj.dano8:setField("dano8");
    obj.dano8:setName("dano8");
    obj.dano8:setLeft(133);
    obj.dano8:setTop(248.25);
    obj.dano8:setWidth(212.50);
    obj.dano8:setHeight(36.75);
    obj.dano8:setTransparent(true);
    obj.dano8:setFontSize(20);

    obj.adicional8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional8:setParent(obj.popMeuPopup8);
    obj.adicional8:setField("adicional8");
    obj.adicional8:setName("adicional8");
    obj.adicional8:setLeft(179);
    obj.adicional8:setTop(297.25);
    obj.adicional8:setWidth(168);
    obj.adicional8:setHeight(36);
    obj.adicional8:setTransparent(true);
    obj.adicional8:setFontSize(20);

    obj.efeito8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito8:setParent(obj.popMeuPopup8);
    obj.efeito8:setField("efeito8");
    obj.efeito8:setName("efeito8");
    obj.efeito8:setLeft(55);
    obj.efeito8:setTop(362.25);
    obj.efeito8:setWidth(285.25);
    obj.efeito8:setHeight(100.75);
    obj.efeito8:setTransparent(true);
    obj.efeito8:setFontSize(20);

    obj.bdeleted8 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted8:setParent(obj.popMeuPopup8);
    obj.bdeleted8:setName("bdeleted8");
    obj.bdeleted8:setLeft(295.75);
    obj.bdeleted8:setTop(104);
    obj.bdeleted8:setWidth(43);
    obj.bdeleted8:setHeight(41);
    obj.bdeleted8:setHitTest(true);
    obj.bdeleted8:setCursor("handPoint");
    obj.bdeleted8:setOpacity(0);

    obj.Inf1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf1:setParent(obj.InventarioM1);
    obj.Inf1:setName("Inf1");
    obj.Inf1:setLeft(88);
    obj.Inf1:setTop(165.25);
    obj.Inf1:setWidth(43);
    obj.Inf1:setHeight(41);
    obj.Inf1:setHitTest(true);
    obj.Inf1:setCursor("handPoint");
    obj.Inf1:setOpacity(0);

    obj.Inf2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf2:setParent(obj.InventarioM1);
    obj.Inf2:setName("Inf2");
    obj.Inf2:setLeft(569);
    obj.Inf2:setTop(165.25);
    obj.Inf2:setWidth(43);
    obj.Inf2:setHeight(41);
    obj.Inf2:setHitTest(true);
    obj.Inf2:setCursor("handPoint");
    obj.Inf2:setOpacity(0);

    obj.Inf3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf3:setParent(obj.InventarioM1);
    obj.Inf3:setName("Inf3");
    obj.Inf3:setLeft(187);
    obj.Inf3:setTop(472.25);
    obj.Inf3:setWidth(43);
    obj.Inf3:setHeight(41);
    obj.Inf3:setHitTest(true);
    obj.Inf3:setCursor("handPoint");
    obj.Inf3:setOpacity(0);

    obj.Inf4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf4:setParent(obj.InventarioM1);
    obj.Inf4:setName("Inf4");
    obj.Inf4:setLeft(375);
    obj.Inf4:setTop(472.25);
    obj.Inf4:setWidth(43);
    obj.Inf4:setHeight(41);
    obj.Inf4:setHitTest(true);
    obj.Inf4:setCursor("handPoint");
    obj.Inf4:setOpacity(0);

    obj.Inf5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf5:setParent(obj.InventarioM1);
    obj.Inf5:setName("Inf5");
    obj.Inf5:setLeft(567);
    obj.Inf5:setTop(472.25);
    obj.Inf5:setWidth(43);
    obj.Inf5:setHeight(41);
    obj.Inf5:setHitTest(true);
    obj.Inf5:setCursor("handPoint");
    obj.Inf5:setOpacity(0);

    obj.Inf6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf6:setParent(obj.InventarioM1);
    obj.Inf6:setName("Inf6");
    obj.Inf6:setLeft(189);
    obj.Inf6:setTop(683);
    obj.Inf6:setWidth(42);
    obj.Inf6:setHeight(47);
    obj.Inf6:setHitTest(true);
    obj.Inf6:setCursor("handPoint");
    obj.Inf6:setOpacity(0);

    obj.Inf7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf7:setParent(obj.InventarioM1);
    obj.Inf7:setName("Inf7");
    obj.Inf7:setLeft(377);
    obj.Inf7:setTop(683);
    obj.Inf7:setWidth(42);
    obj.Inf7:setHeight(47);
    obj.Inf7:setHitTest(true);
    obj.Inf7:setCursor("handPoint");
    obj.Inf7:setOpacity(0);

    obj.Inf8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf8:setParent(obj.InventarioM1);
    obj.Inf8:setName("Inf8");
    obj.Inf8:setLeft(569);
    obj.Inf8:setTop(683);
    obj.Inf8:setWidth(42);
    obj.Inf8:setHeight(47);
    obj.Inf8:setHitTest(true);
    obj.Inf8:setCursor("handPoint");
    obj.Inf8:setOpacity(0);

    obj.botaoDeletar1 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar1:setParent(obj.InventarioM1);
    obj.botaoDeletar1:setName("botaoDeletar1");
    obj.botaoDeletar1:setLeft(283);
    obj.botaoDeletar1:setTop(178.75);
    obj.botaoDeletar1:setWidth(43);
    obj.botaoDeletar1:setHeight(41);
    obj.botaoDeletar1:setHitTest(true);
    obj.botaoDeletar1:setCursor("handPoint");
    obj.botaoDeletar1:setOpacity(0);

    obj.botaoDeletar2 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar2:setParent(obj.InventarioM1);
    obj.botaoDeletar2:setName("botaoDeletar2");
    obj.botaoDeletar2:setLeft(372);
    obj.botaoDeletar2:setTop(178.75);
    obj.botaoDeletar2:setWidth(43);
    obj.botaoDeletar2:setHeight(41);
    obj.botaoDeletar2:setHitTest(true);
    obj.botaoDeletar2:setCursor("handPoint");
    obj.botaoDeletar2:setOpacity(0);

    obj.botaoDeletar3 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar3:setParent(obj.InventarioM1);
    obj.botaoDeletar3:setName("botaoDeletar3");
    obj.botaoDeletar3:setLeft(132);
    obj.botaoDeletar3:setTop(472.75);
    obj.botaoDeletar3:setWidth(43);
    obj.botaoDeletar3:setHeight(41);
    obj.botaoDeletar3:setHitTest(true);
    obj.botaoDeletar3:setCursor("handPoint");
    obj.botaoDeletar3:setOpacity(0);

    obj.botaoDeletar4 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar4:setParent(obj.InventarioM1);
    obj.botaoDeletar4:setName("botaoDeletar4");
    obj.botaoDeletar4:setLeft(319);
    obj.botaoDeletar4:setTop(472.75);
    obj.botaoDeletar4:setWidth(43);
    obj.botaoDeletar4:setHeight(41);
    obj.botaoDeletar4:setHitTest(true);
    obj.botaoDeletar4:setCursor("handPoint");
    obj.botaoDeletar4:setOpacity(0);

    obj.botaoDeletar5 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar5:setParent(obj.InventarioM1);
    obj.botaoDeletar5:setName("botaoDeletar5");
    obj.botaoDeletar5:setLeft(512);
    obj.botaoDeletar5:setTop(472.75);
    obj.botaoDeletar5:setWidth(43);
    obj.botaoDeletar5:setHeight(41);
    obj.botaoDeletar5:setHitTest(true);
    obj.botaoDeletar5:setCursor("handPoint");
    obj.botaoDeletar5:setOpacity(0);

    obj.botaoDeletar6 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar6:setParent(obj.InventarioM1);
    obj.botaoDeletar6:setName("botaoDeletar6");
    obj.botaoDeletar6:setLeft(132.74);
    obj.botaoDeletar6:setTop(702);
    obj.botaoDeletar6:setWidth(42.13);
    obj.botaoDeletar6:setHeight(49.75);
    obj.botaoDeletar6:setHitTest(true);
    obj.botaoDeletar6:setCursor("handPoint");
    obj.botaoDeletar6:setOpacity(0);

    obj.botaoDeletar7 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar7:setParent(obj.InventarioM1);
    obj.botaoDeletar7:setName("botaoDeletar7");
    obj.botaoDeletar7:setLeft(320.34);
    obj.botaoDeletar7:setTop(702);
    obj.botaoDeletar7:setWidth(42.13);
    obj.botaoDeletar7:setHeight(49.75);
    obj.botaoDeletar7:setHitTest(true);
    obj.botaoDeletar7:setCursor("handPoint");
    obj.botaoDeletar7:setOpacity(0);

    obj.botaoDeletar8 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeletar8:setParent(obj.InventarioM1);
    obj.botaoDeletar8:setName("botaoDeletar8");
    obj.botaoDeletar8:setLeft(513.86);
    obj.botaoDeletar8:setTop(702);
    obj.botaoDeletar8:setWidth(42.13);
    obj.botaoDeletar8:setHeight(49.75);
    obj.botaoDeletar8:setHitTest(true);
    obj.botaoDeletar8:setCursor("handPoint");
    obj.botaoDeletar8:setOpacity(0);


                local function RolarItem1()  --- sua variavel      
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);   
                          mesaDoPersonagem.chat:rolarDados(sheet.dano1 .. " + " .. sheet.adicional1, "Item",
                                function (rolado)   
								                            
                                 end);        
                                   end;  
        



                local function RolarItem2()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano2 .. " + " .. sheet.adicional2, "Item",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem3()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano3 .. " + " .. sheet.adicional3, "Item",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem4()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano4 .. " + " .. sheet.adicional4, "Item",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem5()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano5 .. " + " .. sheet.adicional5, "Item",
                                function (rolado)                               
                                 end);        
                                   end;   
        



                local function RolarItem6()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano6 .. " + " .. sheet.adicional6, "Item",
                                function (rolado)                               
                                 end);       
                                   end;  
        



                local function RolarItem7()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano7 .. " + " .. sheet.adicional7, "Item",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem8()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano8 .. " + " .. sheet.adicional8, "Item",
                                function (rolado)                               
                                 end);        
                                   end;  
        


    obj.InventarioM2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InventarioM2:setParent(obj.scrollBox1);
    obj.InventarioM2:setName("InventarioM2");
    obj.InventarioM2:setAlign("client");
    obj.InventarioM2:setVisible(false);

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.InventarioM2);
    obj.image27:setSRC("/imagens/Inventario.png");
    obj.image27:setLeft(0);
    obj.image27:setTop(0);
    obj.image27:setWidth(700);
    obj.image27:setHeight(900);
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.InventarioM2);
    obj.image28:setSRC("/imagens/Numero 2.png");
    obj.image28:setLeft(399.25);
    obj.image28:setTop(301);
    obj.image28:setWidth(24);
    obj.image28:setHeight(22);
    obj.image28:setName("image28");

    obj.itemEsquerda1 = GUI.fromHandle(_obj_newObject("image"));
    obj.itemEsquerda1:setParent(obj.InventarioM2);
    obj.itemEsquerda1:setField("itemEsquerda1");
    obj.itemEsquerda1:setName("itemEsquerda1");
    obj.itemEsquerda1:setLeft(132.31);
    obj.itemEsquerda1:setTop(174.25);
    obj.itemEsquerda1:setWidth(136.94);
    obj.itemEsquerda1:setHeight(122.25);
    obj.itemEsquerda1:setEditable(true);
    obj.itemEsquerda1:setStyle("proportional");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.InventarioM2);
    obj.image29:setField("itemDireita1");
    obj.image29:setLeft(429.50);
    obj.image29:setTop(174);
    obj.image29:setWidth(136.75);
    obj.image29:setHeight(122.25);
    obj.image29:setEditable(true);
    obj.image29:setStyle("proportional");
    obj.image29:setName("image29");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.InventarioM2);
    obj.image30:setField("Item7");
    obj.image30:setLeft(90.75);
    obj.image30:setTop(342);
    obj.image30:setWidth(138.75);
    obj.image30:setHeight(121.50);
    obj.image30:setEditable(true);
    obj.image30:setStyle("proportional");
    obj.image30:setName("image30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.InventarioM2);
    obj.image31:setField("Item8");
    obj.image31:setLeft(277.75);
    obj.image31:setTop(342);
    obj.image31:setWidth(138.75);
    obj.image31:setHeight(121.50);
    obj.image31:setEditable(true);
    obj.image31:setStyle("proportional");
    obj.image31:setName("image31");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.InventarioM2);
    obj.image32:setField("Item9");
    obj.image32:setLeft(470.75);
    obj.image32:setTop(342);
    obj.image32:setWidth(138.75);
    obj.image32:setHeight(121.50);
    obj.image32:setEditable(true);
    obj.image32:setStyle("proportional");
    obj.image32:setName("image32");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.InventarioM2);
    obj.image33:setField("Item10");
    obj.image33:setLeft(92.50);
    obj.image33:setTop(581);
    obj.image33:setWidth(134.88);
    obj.image33:setHeight(121.25);
    obj.image33:setEditable(true);
    obj.image33:setStyle("proportional");
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.InventarioM2);
    obj.image34:setField("Item11");
    obj.image34:setLeft(280.25);
    obj.image34:setTop(581);
    obj.image34:setWidth(134.14);
    obj.image34:setHeight(120.16);
    obj.image34:setEditable(true);
    obj.image34:setStyle("proportional");
    obj.image34:setName("image34");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.InventarioM2);
    obj.image35:setField("Item12");
    obj.image35:setLeft(472.25);
    obj.image35:setTop(581);
    obj.image35:setWidth(134.14);
    obj.image35:setHeight(120.38);
    obj.image35:setEditable(true);
    obj.image35:setStyle("proportional");
    obj.image35:setName("image35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.InventarioM2);
    obj.image36:setLeft(88.50);
    obj.image36:setTop(206.25);
    obj.image36:setWidth(43);
    obj.image36:setHeight(41);
    obj.image36:setHitTest(true);
    obj.image36:setCursor("handPoint");
    obj.image36:setOpacity(0);
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.InventarioM2);
    obj.image37:setLeft(569);
    obj.image37:setTop(206.25);
    obj.image37:setWidth(43);
    obj.image37:setHeight(41);
    obj.image37:setHitTest(true);
    obj.image37:setCursor("handPoint");
    obj.image37:setOpacity(0);
    obj.image37:setName("image37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.InventarioM2);
    obj.image38:setLeft(88);
    obj.image38:setTop(472.75);
    obj.image38:setWidth(43);
    obj.image38:setHeight(41);
    obj.image38:setHitTest(true);
    obj.image38:setCursor("handPoint");
    obj.image38:setOpacity(0);
    obj.image38:setName("image38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.InventarioM2);
    obj.image39:setLeft(276);
    obj.image39:setTop(471.75);
    obj.image39:setWidth(43);
    obj.image39:setHeight(41);
    obj.image39:setHitTest(true);
    obj.image39:setCursor("handPoint");
    obj.image39:setOpacity(0);
    obj.image39:setName("image39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.InventarioM2);
    obj.image40:setLeft(468);
    obj.image40:setTop(471.75);
    obj.image40:setWidth(43);
    obj.image40:setHeight(41);
    obj.image40:setHitTest(true);
    obj.image40:setCursor("handPoint");
    obj.image40:setOpacity(0);
    obj.image40:setName("image40");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.InventarioM2);
    obj.image41:setLeft(88.50);
    obj.image41:setTop(710);
    obj.image41:setWidth(44.12);
    obj.image41:setHeight(42);
    obj.image41:setHitTest(true);
    obj.image41:setCursor("handPoint");
    obj.image41:setOpacity(0);
    obj.image41:setName("image41");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.InventarioM2);
    obj.image42:setLeft(276.50);
    obj.image42:setTop(710);
    obj.image42:setWidth(44.12);
    obj.image42:setHeight(42);
    obj.image42:setHitTest(true);
    obj.image42:setCursor("handPoint");
    obj.image42:setOpacity(0);
    obj.image42:setName("image42");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.InventarioM2);
    obj.image43:setLeft(468);
    obj.image43:setTop(710);
    obj.image43:setWidth(44.12);
    obj.image43:setHeight(42);
    obj.image43:setHitTest(true);
    obj.image43:setCursor("handPoint");
    obj.image43:setOpacity(0);
    obj.image43:setName("image43");

    obj.popMeuPopup9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup9:setParent(obj.InventarioM2);
    obj.popMeuPopup9:setName("popMeuPopup9");
    obj.popMeuPopup9:setWidth(400);
    obj.popMeuPopup9:setHeight(533);
    obj.popMeuPopup9:setBackOpacity(0.5);
    obj.popMeuPopup9:setAlign("left");
    obj.popMeuPopup9:setMargins({bottom=400});

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.popMeuPopup9);
    obj.image44:setSRC("/imagens/infDosItens.png");
    obj.image44:setWidth(400);
    obj.image44:setHeight(533);
    obj.image44:setLeft(0);
    obj.image44:setTop(0);
    obj.image44:setName("image44");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.popMeuPopup9);
    obj.button10:setLeft(70.28);
    obj.button10:setTop(101.31);
    obj.button10:setWidth(41.25);
    obj.button10:setHeight(23.34);
    obj.button10:setText("Usar");
    obj.button10:setName("button10");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.popMeuPopup9);
    obj.image45:setField("itemEsquerda1");
    obj.image45:setLeft(132.75);
    obj.image45:setTop(67.25);
    obj.image45:setWidth(140.75);
    obj.image45:setHeight(114.50);
    obj.image45:setEditable(true);
    obj.image45:setStyle("proportional");
    obj.image45:setName("image45");

    obj.nome9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome9:setParent(obj.popMeuPopup9);
    obj.nome9:setField("nome9");
    obj.nome9:setName("nome9");
    obj.nome9:setLeft(145);
    obj.nome9:setTop(202);
    obj.nome9:setWidth(206.25);
    obj.nome9:setHeight(39.75);
    obj.nome9:setTransparent(true);
    obj.nome9:setFontSize(20);

    obj.dano9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano9:setParent(obj.popMeuPopup9);
    obj.dano9:setField("dano9");
    obj.dano9:setName("dano9");
    obj.dano9:setLeft(133);
    obj.dano9:setTop(248.25);
    obj.dano9:setWidth(212.50);
    obj.dano9:setHeight(36.75);
    obj.dano9:setTransparent(true);
    obj.dano9:setFontSize(20);

    obj.adicional9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional9:setParent(obj.popMeuPopup9);
    obj.adicional9:setField("adicional9");
    obj.adicional9:setName("adicional9");
    obj.adicional9:setLeft(179);
    obj.adicional9:setTop(297.25);
    obj.adicional9:setWidth(168);
    obj.adicional9:setHeight(36);
    obj.adicional9:setTransparent(true);
    obj.adicional9:setFontSize(20);

    obj.efeito9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito9:setParent(obj.popMeuPopup9);
    obj.efeito9:setField("efeito9");
    obj.efeito9:setName("efeito9");
    obj.efeito9:setLeft(55);
    obj.efeito9:setTop(362.25);
    obj.efeito9:setWidth(285.25);
    obj.efeito9:setHeight(100.75);
    obj.efeito9:setTransparent(true);
    obj.efeito9:setFontSize(20);

    obj.bdeleted9 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted9:setParent(obj.popMeuPopup9);
    obj.bdeleted9:setName("bdeleted9");
    obj.bdeleted9:setLeft(295.75);
    obj.bdeleted9:setTop(104);
    obj.bdeleted9:setWidth(43);
    obj.bdeleted9:setHeight(41);
    obj.bdeleted9:setHitTest(true);
    obj.bdeleted9:setCursor("handPoint");
    obj.bdeleted9:setOpacity(0);

    obj.popMeuPopup10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup10:setParent(obj.InventarioM2);
    obj.popMeuPopup10:setName("popMeuPopup10");
    obj.popMeuPopup10:setWidth(400);
    obj.popMeuPopup10:setHeight(533);
    obj.popMeuPopup10:setBackOpacity(0.5);
    obj.popMeuPopup10:setAlign("left");
    obj.popMeuPopup10:setMargins({bottom=400});

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.popMeuPopup10);
    obj.image46:setSRC("/imagens/infDosItens.png");
    obj.image46:setWidth(400);
    obj.image46:setHeight(533);
    obj.image46:setLeft(0);
    obj.image46:setTop(0);
    obj.image46:setName("image46");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.popMeuPopup10);
    obj.button11:setLeft(70.28);
    obj.button11:setTop(101.31);
    obj.button11:setWidth(41.25);
    obj.button11:setHeight(23.34);
    obj.button11:setText("Usar");
    obj.button11:setName("button11");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.popMeuPopup10);
    obj.image47:setField("itemDireita1");
    obj.image47:setLeft(132.75);
    obj.image47:setTop(67.25);
    obj.image47:setWidth(140.75);
    obj.image47:setHeight(114.50);
    obj.image47:setEditable(true);
    obj.image47:setStyle("proportional");
    obj.image47:setName("image47");

    obj.nome10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome10:setParent(obj.popMeuPopup10);
    obj.nome10:setField("nome10");
    obj.nome10:setName("nome10");
    obj.nome10:setLeft(140);
    obj.nome10:setTop(201.25);
    obj.nome10:setWidth(206.25);
    obj.nome10:setHeight(36.75);
    obj.nome10:setTransparent(true);
    obj.nome10:setFontSize(20);

    obj.dano10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano10:setParent(obj.popMeuPopup10);
    obj.dano10:setField("dano10");
    obj.dano10:setName("dano10");
    obj.dano10:setLeft(133);
    obj.dano10:setTop(248.25);
    obj.dano10:setWidth(212.50);
    obj.dano10:setHeight(36.75);
    obj.dano10:setTransparent(true);
    obj.dano10:setFontSize(20);

    obj.adicional10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional10:setParent(obj.popMeuPopup10);
    obj.adicional10:setField("adicional10");
    obj.adicional10:setName("adicional10");
    obj.adicional10:setLeft(179);
    obj.adicional10:setTop(297.25);
    obj.adicional10:setWidth(168);
    obj.adicional10:setHeight(36);
    obj.adicional10:setTransparent(true);
    obj.adicional10:setFontSize(20);

    obj.efeito10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito10:setParent(obj.popMeuPopup10);
    obj.efeito10:setField("efeito10");
    obj.efeito10:setName("efeito10");
    obj.efeito10:setLeft(55);
    obj.efeito10:setTop(362.25);
    obj.efeito10:setWidth(285.25);
    obj.efeito10:setHeight(100.75);
    obj.efeito10:setTransparent(true);
    obj.efeito10:setFontSize(20);

    obj.bdeleted10 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted10:setParent(obj.popMeuPopup10);
    obj.bdeleted10:setName("bdeleted10");
    obj.bdeleted10:setLeft(295.75);
    obj.bdeleted10:setTop(104);
    obj.bdeleted10:setWidth(43);
    obj.bdeleted10:setHeight(41);
    obj.bdeleted10:setHitTest(true);
    obj.bdeleted10:setCursor("handPoint");
    obj.bdeleted10:setOpacity(0);

    obj.popMeuPopup11 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup11:setParent(obj.InventarioM2);
    obj.popMeuPopup11:setName("popMeuPopup11");
    obj.popMeuPopup11:setWidth(400);
    obj.popMeuPopup11:setHeight(533);
    obj.popMeuPopup11:setBackOpacity(0.5);
    obj.popMeuPopup11:setAlign("left");
    obj.popMeuPopup11:setMargins({bottom=400});

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.popMeuPopup11);
    obj.image48:setSRC("/imagens/infDosItens.png");
    obj.image48:setWidth(400);
    obj.image48:setHeight(533);
    obj.image48:setLeft(0);
    obj.image48:setTop(0);
    obj.image48:setName("image48");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.popMeuPopup11);
    obj.button12:setLeft(70.28);
    obj.button12:setTop(101.31);
    obj.button12:setWidth(41.25);
    obj.button12:setHeight(23.34);
    obj.button12:setText("Usar");
    obj.button12:setName("button12");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.popMeuPopup11);
    obj.image49:setField("Item7");
    obj.image49:setLeft(132.75);
    obj.image49:setTop(67.25);
    obj.image49:setWidth(140.75);
    obj.image49:setHeight(114.50);
    obj.image49:setEditable(true);
    obj.image49:setStyle("proportional");
    obj.image49:setName("image49");

    obj.nome11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome11:setParent(obj.popMeuPopup11);
    obj.nome11:setField("nome11");
    obj.nome11:setName("nome11");
    obj.nome11:setLeft(140);
    obj.nome11:setTop(201.25);
    obj.nome11:setWidth(206.25);
    obj.nome11:setHeight(36.75);
    obj.nome11:setTransparent(true);
    obj.nome11:setFontSize(20);

    obj.dano11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano11:setParent(obj.popMeuPopup11);
    obj.dano11:setField("dano11");
    obj.dano11:setName("dano11");
    obj.dano11:setLeft(133);
    obj.dano11:setTop(248.25);
    obj.dano11:setWidth(212.50);
    obj.dano11:setHeight(36.75);
    obj.dano11:setTransparent(true);
    obj.dano11:setFontSize(20);

    obj.adicional11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional11:setParent(obj.popMeuPopup11);
    obj.adicional11:setField("adicional11");
    obj.adicional11:setName("adicional11");
    obj.adicional11:setLeft(179);
    obj.adicional11:setTop(297.25);
    obj.adicional11:setWidth(168);
    obj.adicional11:setHeight(36);
    obj.adicional11:setTransparent(true);
    obj.adicional11:setFontSize(20);

    obj.efeito11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito11:setParent(obj.popMeuPopup11);
    obj.efeito11:setField("efeito11");
    obj.efeito11:setName("efeito11");
    obj.efeito11:setLeft(55);
    obj.efeito11:setTop(362.25);
    obj.efeito11:setWidth(285.25);
    obj.efeito11:setHeight(100.75);
    obj.efeito11:setTransparent(true);
    obj.efeito11:setFontSize(20);

    obj.bdeleted11 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted11:setParent(obj.popMeuPopup11);
    obj.bdeleted11:setName("bdeleted11");
    obj.bdeleted11:setLeft(295.75);
    obj.bdeleted11:setTop(104);
    obj.bdeleted11:setWidth(43);
    obj.bdeleted11:setHeight(41);
    obj.bdeleted11:setHitTest(true);
    obj.bdeleted11:setCursor("handPoint");
    obj.bdeleted11:setOpacity(0);

    obj.popMeuPopup12 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup12:setParent(obj.InventarioM2);
    obj.popMeuPopup12:setName("popMeuPopup12");
    obj.popMeuPopup12:setWidth(400);
    obj.popMeuPopup12:setHeight(533);
    obj.popMeuPopup12:setBackOpacity(0.5);
    obj.popMeuPopup12:setAlign("left");
    obj.popMeuPopup12:setMargins({bottom=400});

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.popMeuPopup12);
    obj.image50:setSRC("/imagens/infDosItens.png");
    obj.image50:setWidth(400);
    obj.image50:setHeight(533);
    obj.image50:setLeft(0);
    obj.image50:setTop(0);
    obj.image50:setName("image50");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.popMeuPopup12);
    obj.button13:setLeft(70.28);
    obj.button13:setTop(101.31);
    obj.button13:setWidth(41.25);
    obj.button13:setHeight(23.34);
    obj.button13:setText("Usar");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.popMeuPopup12);
    obj.button14:setLeft(70.28);
    obj.button14:setTop(101.31);
    obj.button14:setWidth(41.25);
    obj.button14:setHeight(23.34);
    obj.button14:setText("Usar");
    obj.button14:setName("button14");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.popMeuPopup12);
    obj.image51:setField("Item8");
    obj.image51:setLeft(132.75);
    obj.image51:setTop(67.25);
    obj.image51:setWidth(140.75);
    obj.image51:setHeight(114.50);
    obj.image51:setEditable(true);
    obj.image51:setStyle("proportional");
    obj.image51:setName("image51");

    obj.nome12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome12:setParent(obj.popMeuPopup12);
    obj.nome12:setField("nome12");
    obj.nome12:setName("nome12");
    obj.nome12:setLeft(140);
    obj.nome12:setTop(201.25);
    obj.nome12:setWidth(206.25);
    obj.nome12:setHeight(36.75);
    obj.nome12:setTransparent(true);
    obj.nome12:setFontSize(20);

    obj.dano12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano12:setParent(obj.popMeuPopup12);
    obj.dano12:setField("dano12");
    obj.dano12:setName("dano12");
    obj.dano12:setLeft(133);
    obj.dano12:setTop(248.25);
    obj.dano12:setWidth(212.50);
    obj.dano12:setHeight(36.75);
    obj.dano12:setTransparent(true);
    obj.dano12:setFontSize(20);

    obj.adicional12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional12:setParent(obj.popMeuPopup12);
    obj.adicional12:setField("adicional12");
    obj.adicional12:setName("adicional12");
    obj.adicional12:setLeft(179);
    obj.adicional12:setTop(297.25);
    obj.adicional12:setWidth(168);
    obj.adicional12:setHeight(36);
    obj.adicional12:setTransparent(true);
    obj.adicional12:setFontSize(20);

    obj.efeito12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito12:setParent(obj.popMeuPopup12);
    obj.efeito12:setField("efeito12");
    obj.efeito12:setName("efeito12");
    obj.efeito12:setLeft(55);
    obj.efeito12:setTop(362.25);
    obj.efeito12:setWidth(285.25);
    obj.efeito12:setHeight(100.75);
    obj.efeito12:setTransparent(true);
    obj.efeito12:setFontSize(20);

    obj.bdeleted12 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted12:setParent(obj.popMeuPopup12);
    obj.bdeleted12:setName("bdeleted12");
    obj.bdeleted12:setLeft(295.75);
    obj.bdeleted12:setTop(104);
    obj.bdeleted12:setWidth(43);
    obj.bdeleted12:setHeight(41);
    obj.bdeleted12:setHitTest(true);
    obj.bdeleted12:setCursor("handPoint");
    obj.bdeleted12:setOpacity(0);

    obj.popMeuPopup13 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup13:setParent(obj.InventarioM2);
    obj.popMeuPopup13:setName("popMeuPopup13");
    obj.popMeuPopup13:setWidth(400);
    obj.popMeuPopup13:setHeight(533);
    obj.popMeuPopup13:setBackOpacity(0.5);
    obj.popMeuPopup13:setAlign("left");
    obj.popMeuPopup13:setMargins({bottom=400});

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.popMeuPopup13);
    obj.image52:setSRC("/imagens/infDosItens.png");
    obj.image52:setWidth(400);
    obj.image52:setHeight(533);
    obj.image52:setLeft(0);
    obj.image52:setTop(0);
    obj.image52:setName("image52");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.popMeuPopup13);
    obj.button15:setLeft(70.28);
    obj.button15:setTop(101.31);
    obj.button15:setWidth(41.25);
    obj.button15:setHeight(23.34);
    obj.button15:setText("Usar");
    obj.button15:setName("button15");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.popMeuPopup13);
    obj.image53:setField("Item9");
    obj.image53:setLeft(132.75);
    obj.image53:setTop(67.25);
    obj.image53:setWidth(140.75);
    obj.image53:setHeight(114.50);
    obj.image53:setEditable(true);
    obj.image53:setStyle("proportional");
    obj.image53:setName("image53");

    obj.nome13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome13:setParent(obj.popMeuPopup13);
    obj.nome13:setField("nome13");
    obj.nome13:setName("nome13");
    obj.nome13:setLeft(140);
    obj.nome13:setTop(201.25);
    obj.nome13:setWidth(206.25);
    obj.nome13:setHeight(36.75);
    obj.nome13:setTransparent(true);
    obj.nome13:setFontSize(20);

    obj.dano13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano13:setParent(obj.popMeuPopup13);
    obj.dano13:setField("dano13");
    obj.dano13:setName("dano13");
    obj.dano13:setLeft(133);
    obj.dano13:setTop(248.25);
    obj.dano13:setWidth(212.50);
    obj.dano13:setHeight(36.75);
    obj.dano13:setTransparent(true);
    obj.dano13:setFontSize(20);

    obj.adicional13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional13:setParent(obj.popMeuPopup13);
    obj.adicional13:setField("adicional13");
    obj.adicional13:setName("adicional13");
    obj.adicional13:setLeft(179);
    obj.adicional13:setTop(297.25);
    obj.adicional13:setWidth(168);
    obj.adicional13:setHeight(36);
    obj.adicional13:setTransparent(true);
    obj.adicional13:setFontSize(20);

    obj.efeito13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito13:setParent(obj.popMeuPopup13);
    obj.efeito13:setField("efeito13");
    obj.efeito13:setName("efeito13");
    obj.efeito13:setLeft(55);
    obj.efeito13:setTop(362.25);
    obj.efeito13:setWidth(285.25);
    obj.efeito13:setHeight(100.75);
    obj.efeito13:setTransparent(true);
    obj.efeito13:setFontSize(20);

    obj.bdeleted13 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted13:setParent(obj.popMeuPopup13);
    obj.bdeleted13:setName("bdeleted13");
    obj.bdeleted13:setLeft(295.75);
    obj.bdeleted13:setTop(104);
    obj.bdeleted13:setWidth(43);
    obj.bdeleted13:setHeight(41);
    obj.bdeleted13:setHitTest(true);
    obj.bdeleted13:setCursor("handPoint");
    obj.bdeleted13:setOpacity(0);

    obj.popMeuPopup14 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup14:setParent(obj.InventarioM2);
    obj.popMeuPopup14:setName("popMeuPopup14");
    obj.popMeuPopup14:setWidth(400);
    obj.popMeuPopup14:setHeight(533);
    obj.popMeuPopup14:setBackOpacity(0.5);
    obj.popMeuPopup14:setAlign("left");
    obj.popMeuPopup14:setMargins({bottom=400});

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.popMeuPopup14);
    obj.image54:setSRC("/imagens/infDosItens.png");
    obj.image54:setWidth(400);
    obj.image54:setHeight(533);
    obj.image54:setLeft(0);
    obj.image54:setTop(0);
    obj.image54:setName("image54");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.popMeuPopup14);
    obj.button16:setLeft(70.28);
    obj.button16:setTop(101.31);
    obj.button16:setWidth(41.25);
    obj.button16:setHeight(23.34);
    obj.button16:setText("Usar");
    obj.button16:setName("button16");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.popMeuPopup14);
    obj.image55:setField("Item10");
    obj.image55:setLeft(132.75);
    obj.image55:setTop(67.25);
    obj.image55:setWidth(140.75);
    obj.image55:setHeight(114.50);
    obj.image55:setEditable(true);
    obj.image55:setStyle("proportional");
    obj.image55:setName("image55");

    obj.nome14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome14:setParent(obj.popMeuPopup14);
    obj.nome14:setField("nome14");
    obj.nome14:setName("nome14");
    obj.nome14:setLeft(140);
    obj.nome14:setTop(201.25);
    obj.nome14:setWidth(206.25);
    obj.nome14:setHeight(36.75);
    obj.nome14:setTransparent(true);
    obj.nome14:setFontSize(20);

    obj.dano14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano14:setParent(obj.popMeuPopup14);
    obj.dano14:setField("dano14");
    obj.dano14:setName("dano14");
    obj.dano14:setLeft(133);
    obj.dano14:setTop(248.25);
    obj.dano14:setWidth(212.50);
    obj.dano14:setHeight(36.75);
    obj.dano14:setTransparent(true);
    obj.dano14:setFontSize(20);

    obj.adicional14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional14:setParent(obj.popMeuPopup14);
    obj.adicional14:setField("adicional14");
    obj.adicional14:setName("adicional14");
    obj.adicional14:setLeft(179);
    obj.adicional14:setTop(297.25);
    obj.adicional14:setWidth(168);
    obj.adicional14:setHeight(36);
    obj.adicional14:setTransparent(true);
    obj.adicional14:setFontSize(20);

    obj.efeito14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito14:setParent(obj.popMeuPopup14);
    obj.efeito14:setField("efeito14");
    obj.efeito14:setName("efeito14");
    obj.efeito14:setLeft(55);
    obj.efeito14:setTop(362.25);
    obj.efeito14:setWidth(285.25);
    obj.efeito14:setHeight(100.75);
    obj.efeito14:setTransparent(true);
    obj.efeito14:setFontSize(20);

    obj.bdeleted14 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted14:setParent(obj.popMeuPopup14);
    obj.bdeleted14:setName("bdeleted14");
    obj.bdeleted14:setLeft(295.75);
    obj.bdeleted14:setTop(104);
    obj.bdeleted14:setWidth(43);
    obj.bdeleted14:setHeight(41);
    obj.bdeleted14:setHitTest(true);
    obj.bdeleted14:setCursor("handPoint");
    obj.bdeleted14:setOpacity(0);

    obj.popMeuPopup15 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup15:setParent(obj.InventarioM2);
    obj.popMeuPopup15:setName("popMeuPopup15");
    obj.popMeuPopup15:setWidth(400);
    obj.popMeuPopup15:setHeight(700);
    obj.popMeuPopup15:setBackOpacity(0.5);
    obj.popMeuPopup15:setAlign("left");
    obj.popMeuPopup15:setMargins({bottom=400});

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.popMeuPopup15);
    obj.image56:setSRC("/imagens/infDosItens.png");
    obj.image56:setWidth(400);
    obj.image56:setHeight(700);
    obj.image56:setLeft(0);
    obj.image56:setTop(0);
    obj.image56:setName("image56");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.popMeuPopup15);
    obj.button17:setLeft(70.28);
    obj.button17:setTop(101.31);
    obj.button17:setWidth(41.25);
    obj.button17:setHeight(23.34);
    obj.button17:setText("Usar");
    obj.button17:setName("button17");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.popMeuPopup15);
    obj.image57:setField("Item11");
    obj.image57:setLeft(132.75);
    obj.image57:setTop(67.25);
    obj.image57:setWidth(140.75);
    obj.image57:setHeight(114.50);
    obj.image57:setEditable(true);
    obj.image57:setStyle("proportional");
    obj.image57:setName("image57");

    obj.nome15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome15:setParent(obj.popMeuPopup15);
    obj.nome15:setField("nome15");
    obj.nome15:setName("nome15");
    obj.nome15:setLeft(140);
    obj.nome15:setTop(201.25);
    obj.nome15:setWidth(206.25);
    obj.nome15:setHeight(36.75);
    obj.nome15:setTransparent(true);
    obj.nome15:setFontSize(20);

    obj.dano15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano15:setParent(obj.popMeuPopup15);
    obj.dano15:setField("dano15");
    obj.dano15:setName("dano15");
    obj.dano15:setLeft(133);
    obj.dano15:setTop(248.25);
    obj.dano15:setWidth(212.50);
    obj.dano15:setHeight(36.75);
    obj.dano15:setTransparent(true);
    obj.dano15:setFontSize(20);

    obj.adicional15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional15:setParent(obj.popMeuPopup15);
    obj.adicional15:setField("adicional15");
    obj.adicional15:setName("adicional15");
    obj.adicional15:setLeft(179);
    obj.adicional15:setTop(297.25);
    obj.adicional15:setWidth(168);
    obj.adicional15:setHeight(36);
    obj.adicional15:setTransparent(true);
    obj.adicional15:setFontSize(20);

    obj.efeito15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito15:setParent(obj.popMeuPopup15);
    obj.efeito15:setField("efeito15");
    obj.efeito15:setName("efeito15");
    obj.efeito15:setLeft(55);
    obj.efeito15:setTop(362.25);
    obj.efeito15:setWidth(285.25);
    obj.efeito15:setHeight(100.75);
    obj.efeito15:setTransparent(true);
    obj.efeito15:setFontSize(20);

    obj.bdeleted15 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted15:setParent(obj.popMeuPopup15);
    obj.bdeleted15:setName("bdeleted15");
    obj.bdeleted15:setLeft(295.75);
    obj.bdeleted15:setTop(104);
    obj.bdeleted15:setWidth(43);
    obj.bdeleted15:setHeight(41);
    obj.bdeleted15:setHitTest(true);
    obj.bdeleted15:setCursor("handPoint");
    obj.bdeleted15:setOpacity(0);

    obj.popMeuPopup16 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup16:setParent(obj.InventarioM2);
    obj.popMeuPopup16:setName("popMeuPopup16");
    obj.popMeuPopup16:setWidth(400);
    obj.popMeuPopup16:setHeight(700);
    obj.popMeuPopup16:setBackOpacity(0.5);
    obj.popMeuPopup16:setAlign("left");
    obj.popMeuPopup16:setMargins({bottom=400});

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.popMeuPopup16);
    obj.image58:setSRC("/imagens/infDosItens.png");
    obj.image58:setWidth(400);
    obj.image58:setHeight(700);
    obj.image58:setLeft(0);
    obj.image58:setTop(0);
    obj.image58:setName("image58");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.popMeuPopup16);
    obj.button18:setLeft(70.28);
    obj.button18:setTop(101.31);
    obj.button18:setWidth(41.25);
    obj.button18:setHeight(23.34);
    obj.button18:setText("Usar");
    obj.button18:setName("button18");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.popMeuPopup16);
    obj.image59:setField("Item12");
    obj.image59:setLeft(132.75);
    obj.image59:setTop(67.25);
    obj.image59:setWidth(140.75);
    obj.image59:setHeight(114.50);
    obj.image59:setEditable(true);
    obj.image59:setStyle("proportional");
    obj.image59:setName("image59");

    obj.nome16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome16:setParent(obj.popMeuPopup16);
    obj.nome16:setField("nome16");
    obj.nome16:setName("nome16");
    obj.nome16:setLeft(140);
    obj.nome16:setTop(201.25);
    obj.nome16:setWidth(206.25);
    obj.nome16:setHeight(36.75);
    obj.nome16:setTransparent(true);
    obj.nome16:setFontSize(20);

    obj.dano16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano16:setParent(obj.popMeuPopup16);
    obj.dano16:setField("dano16");
    obj.dano16:setName("dano16");
    obj.dano16:setLeft(133);
    obj.dano16:setTop(248.25);
    obj.dano16:setWidth(212.50);
    obj.dano16:setHeight(36.75);
    obj.dano16:setTransparent(true);
    obj.dano16:setFontSize(20);

    obj.adicional16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional16:setParent(obj.popMeuPopup16);
    obj.adicional16:setField("adicional16");
    obj.adicional16:setName("adicional16");
    obj.adicional16:setLeft(179);
    obj.adicional16:setTop(297.25);
    obj.adicional16:setWidth(168);
    obj.adicional16:setHeight(36);
    obj.adicional16:setTransparent(true);
    obj.adicional16:setFontSize(20);

    obj.efeito16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito16:setParent(obj.popMeuPopup16);
    obj.efeito16:setField("efeito16");
    obj.efeito16:setName("efeito16");
    obj.efeito16:setLeft(55);
    obj.efeito16:setTop(362.25);
    obj.efeito16:setWidth(285.25);
    obj.efeito16:setHeight(100.75);
    obj.efeito16:setTransparent(true);
    obj.efeito16:setFontSize(20);

    obj.bdeleted16 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted16:setParent(obj.popMeuPopup16);
    obj.bdeleted16:setName("bdeleted16");
    obj.bdeleted16:setLeft(295.75);
    obj.bdeleted16:setTop(104);
    obj.bdeleted16:setWidth(43);
    obj.bdeleted16:setHeight(41);
    obj.bdeleted16:setHitTest(true);
    obj.bdeleted16:setCursor("handPoint");
    obj.bdeleted16:setOpacity(0);


                local function RolarItem9()  --- sua variavel      
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);   
                          mesaDoPersonagem.chat:rolarDados(sheet.dano9 .. " + " .. sheet.adicional9, "Rolou Item da Mochila nivel 2",
                                function (rolado)   
								                            
                                 end);        
                                   end;  
        



                local function RolarItem10()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano10 .. " + " .. sheet.adicional10, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem11()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano11 .. " + " .. sheet.adicional11, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem12()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano12 .. " + " .. sheet.adicional12, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem13()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano13 .. " + " .. sheet.adicional13, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;   
        



                local function RolarItem14()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano14 .. " + " .. sheet.adicional14, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);       
                                   end;  
        



                local function RolarItem15()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano15 .. " + " .. sheet.adicional15, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;  
        



                local function RolarItem16()        
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
                          mesaDoPersonagem.chat:rolarDados(sheet.dano16 .. " + " .. sheet.adicional16, "Rolou Item da Mochila nivel 2",
                                function (rolado)                               
                                 end);        
                                   end;  
        


    obj.Inf22 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf22:setParent(obj.InventarioM2);
    obj.Inf22:setName("Inf22");
    obj.Inf22:setLeft(88);
    obj.Inf22:setTop(165.25);
    obj.Inf22:setWidth(43);
    obj.Inf22:setHeight(41);
    obj.Inf22:setHitTest(true);
    obj.Inf22:setCursor("handPoint");
    obj.Inf22:setOpacity(0);

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.InventarioM2);
    obj.image60:setLeft(569);
    obj.image60:setTop(165.25);
    obj.image60:setWidth(43);
    obj.image60:setHeight(41);
    obj.image60:setHitTest(true);
    obj.image60:setCursor("handPoint");
    obj.image60:setOpacity(0);
    obj.image60:setName("image60");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.InventarioM2);
    obj.image61:setLeft(187);
    obj.image61:setTop(472.25);
    obj.image61:setWidth(43);
    obj.image61:setHeight(41);
    obj.image61:setHitTest(true);
    obj.image61:setCursor("handPoint");
    obj.image61:setOpacity(0);
    obj.image61:setName("image61");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.InventarioM2);
    obj.image62:setLeft(375);
    obj.image62:setTop(472.25);
    obj.image62:setWidth(43);
    obj.image62:setHeight(41);
    obj.image62:setHitTest(true);
    obj.image62:setCursor("handPoint");
    obj.image62:setOpacity(0);
    obj.image62:setName("image62");

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.InventarioM2);
    obj.image63:setLeft(567);
    obj.image63:setTop(472.25);
    obj.image63:setWidth(43);
    obj.image63:setHeight(41);
    obj.image63:setHitTest(true);
    obj.image63:setCursor("handPoint");
    obj.image63:setOpacity(0);
    obj.image63:setName("image63");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.InventarioM2);
    obj.image64:setLeft(189);
    obj.image64:setTop(683);
    obj.image64:setWidth(42);
    obj.image64:setHeight(47);
    obj.image64:setHitTest(true);
    obj.image64:setCursor("handPoint");
    obj.image64:setOpacity(0);
    obj.image64:setName("image64");

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.InventarioM2);
    obj.image65:setLeft(377);
    obj.image65:setTop(683);
    obj.image65:setWidth(42);
    obj.image65:setHeight(47);
    obj.image65:setHitTest(true);
    obj.image65:setCursor("handPoint");
    obj.image65:setOpacity(0);
    obj.image65:setName("image65");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.InventarioM2);
    obj.image66:setLeft(569);
    obj.image66:setTop(683);
    obj.image66:setWidth(42);
    obj.image66:setHeight(47);
    obj.image66:setHitTest(true);
    obj.image66:setCursor("handPoint");
    obj.image66:setOpacity(0);
    obj.image66:setName("image66");

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.InventarioM2);
    obj.image67:setLeft(283);
    obj.image67:setTop(178.75);
    obj.image67:setWidth(43);
    obj.image67:setHeight(41);
    obj.image67:setHitTest(true);
    obj.image67:setCursor("handPoint");
    obj.image67:setOpacity(0);
    obj.image67:setName("image67");

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.InventarioM2);
    obj.image68:setLeft(372);
    obj.image68:setTop(178.75);
    obj.image68:setWidth(43);
    obj.image68:setHeight(41);
    obj.image68:setHitTest(true);
    obj.image68:setCursor("handPoint");
    obj.image68:setOpacity(0);
    obj.image68:setName("image68");

    obj.image69 = GUI.fromHandle(_obj_newObject("image"));
    obj.image69:setParent(obj.InventarioM2);
    obj.image69:setLeft(132);
    obj.image69:setTop(472.75);
    obj.image69:setWidth(43);
    obj.image69:setHeight(41);
    obj.image69:setHitTest(true);
    obj.image69:setCursor("handPoint");
    obj.image69:setOpacity(0);
    obj.image69:setName("image69");

    obj.image70 = GUI.fromHandle(_obj_newObject("image"));
    obj.image70:setParent(obj.InventarioM2);
    obj.image70:setLeft(319);
    obj.image70:setTop(472.75);
    obj.image70:setWidth(43);
    obj.image70:setHeight(41);
    obj.image70:setHitTest(true);
    obj.image70:setCursor("handPoint");
    obj.image70:setOpacity(0);
    obj.image70:setName("image70");

    obj.image71 = GUI.fromHandle(_obj_newObject("image"));
    obj.image71:setParent(obj.InventarioM2);
    obj.image71:setLeft(512);
    obj.image71:setTop(472.75);
    obj.image71:setWidth(43);
    obj.image71:setHeight(41);
    obj.image71:setHitTest(true);
    obj.image71:setCursor("handPoint");
    obj.image71:setOpacity(0);
    obj.image71:setName("image71");

    obj.image72 = GUI.fromHandle(_obj_newObject("image"));
    obj.image72:setParent(obj.InventarioM2);
    obj.image72:setLeft(132.74);
    obj.image72:setTop(702);
    obj.image72:setWidth(42.13);
    obj.image72:setHeight(49.75);
    obj.image72:setHitTest(true);
    obj.image72:setCursor("handPoint");
    obj.image72:setOpacity(0);
    obj.image72:setName("image72");

    obj.image73 = GUI.fromHandle(_obj_newObject("image"));
    obj.image73:setParent(obj.InventarioM2);
    obj.image73:setLeft(320.34);
    obj.image73:setTop(702);
    obj.image73:setWidth(42.13);
    obj.image73:setHeight(49.75);
    obj.image73:setHitTest(true);
    obj.image73:setCursor("handPoint");
    obj.image73:setOpacity(0);
    obj.image73:setName("image73");

    obj.image74 = GUI.fromHandle(_obj_newObject("image"));
    obj.image74:setParent(obj.InventarioM2);
    obj.image74:setLeft(513.86);
    obj.image74:setTop(702);
    obj.image74:setWidth(42.13);
    obj.image74:setHeight(49.75);
    obj.image74:setHitTest(true);
    obj.image74:setCursor("handPoint");
    obj.image74:setOpacity(0);
    obj.image74:setName("image74");

    obj.InventarioM3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InventarioM3:setParent(obj.scrollBox1);
    obj.InventarioM3:setName("InventarioM3");
    obj.InventarioM3:setAlign("client");
    obj.InventarioM3:setVisible(false);

    obj.image75 = GUI.fromHandle(_obj_newObject("image"));
    obj.image75:setParent(obj.InventarioM3);
    obj.image75:setSRC("/imagens/Inventario.png");
    obj.image75:setLeft(0);
    obj.image75:setTop(0);
    obj.image75:setWidth(700);
    obj.image75:setHeight(900);
    obj.image75:setName("image75");

    obj.image76 = GUI.fromHandle(_obj_newObject("image"));
    obj.image76:setParent(obj.InventarioM3);
    obj.image76:setSRC("/imagens/Numero 3.png");
    obj.image76:setLeft(399.25);
    obj.image76:setTop(301);
    obj.image76:setWidth(24);
    obj.image76:setHeight(22);
    obj.image76:setName("image76");

    obj.itemEsquerda2 = GUI.fromHandle(_obj_newObject("image"));
    obj.itemEsquerda2:setParent(obj.InventarioM3);
    obj.itemEsquerda2:setField("itemEsquerda2");
    obj.itemEsquerda2:setName("itemEsquerda2");
    obj.itemEsquerda2:setLeft(132.31);
    obj.itemEsquerda2:setTop(174.25);
    obj.itemEsquerda2:setWidth(136.94);
    obj.itemEsquerda2:setHeight(122.25);
    obj.itemEsquerda2:setEditable(true);
    obj.itemEsquerda2:setStyle("proportional");

    obj.image77 = GUI.fromHandle(_obj_newObject("image"));
    obj.image77:setParent(obj.InventarioM3);
    obj.image77:setField("itemDireita2");
    obj.image77:setLeft(429.50);
    obj.image77:setTop(174);
    obj.image77:setWidth(136.75);
    obj.image77:setHeight(122.25);
    obj.image77:setEditable(true);
    obj.image77:setStyle("proportional");
    obj.image77:setName("image77");

    obj.image78 = GUI.fromHandle(_obj_newObject("image"));
    obj.image78:setParent(obj.InventarioM3);
    obj.image78:setField("Item13");
    obj.image78:setLeft(90.75);
    obj.image78:setTop(342);
    obj.image78:setWidth(138.75);
    obj.image78:setHeight(121.50);
    obj.image78:setEditable(true);
    obj.image78:setStyle("proportional");
    obj.image78:setName("image78");

    obj.image79 = GUI.fromHandle(_obj_newObject("image"));
    obj.image79:setParent(obj.InventarioM3);
    obj.image79:setField("Item14");
    obj.image79:setLeft(277.75);
    obj.image79:setTop(342);
    obj.image79:setWidth(138.75);
    obj.image79:setHeight(121.50);
    obj.image79:setEditable(true);
    obj.image79:setStyle("proportional");
    obj.image79:setName("image79");

    obj.image80 = GUI.fromHandle(_obj_newObject("image"));
    obj.image80:setParent(obj.InventarioM3);
    obj.image80:setField("Item15");
    obj.image80:setLeft(470.75);
    obj.image80:setTop(342);
    obj.image80:setWidth(138.75);
    obj.image80:setHeight(121.50);
    obj.image80:setEditable(true);
    obj.image80:setStyle("proportional");
    obj.image80:setName("image80");

    obj.image81 = GUI.fromHandle(_obj_newObject("image"));
    obj.image81:setParent(obj.InventarioM3);
    obj.image81:setField("Item16");
    obj.image81:setLeft(92.50);
    obj.image81:setTop(581);
    obj.image81:setWidth(134.88);
    obj.image81:setHeight(121.25);
    obj.image81:setEditable(true);
    obj.image81:setStyle("proportional");
    obj.image81:setName("image81");

    obj.image82 = GUI.fromHandle(_obj_newObject("image"));
    obj.image82:setParent(obj.InventarioM3);
    obj.image82:setField("Item17");
    obj.image82:setLeft(280.25);
    obj.image82:setTop(581);
    obj.image82:setWidth(134.14);
    obj.image82:setHeight(120.16);
    obj.image82:setEditable(true);
    obj.image82:setStyle("proportional");
    obj.image82:setName("image82");

    obj.image83 = GUI.fromHandle(_obj_newObject("image"));
    obj.image83:setParent(obj.InventarioM3);
    obj.image83:setField("Item18");
    obj.image83:setLeft(472.25);
    obj.image83:setTop(581);
    obj.image83:setWidth(134.14);
    obj.image83:setHeight(120.38);
    obj.image83:setEditable(true);
    obj.image83:setStyle("proportional");
    obj.image83:setName("image83");

    obj.image84 = GUI.fromHandle(_obj_newObject("image"));
    obj.image84:setParent(obj.InventarioM3);
    obj.image84:setLeft(88.50);
    obj.image84:setTop(206.25);
    obj.image84:setWidth(43);
    obj.image84:setHeight(41);
    obj.image84:setHitTest(true);
    obj.image84:setCursor("handPoint");
    obj.image84:setOpacity(0);
    obj.image84:setName("image84");

    obj.image85 = GUI.fromHandle(_obj_newObject("image"));
    obj.image85:setParent(obj.InventarioM3);
    obj.image85:setLeft(569);
    obj.image85:setTop(206.25);
    obj.image85:setWidth(43);
    obj.image85:setHeight(41);
    obj.image85:setHitTest(true);
    obj.image85:setCursor("handPoint");
    obj.image85:setOpacity(0);
    obj.image85:setName("image85");

    obj.image86 = GUI.fromHandle(_obj_newObject("image"));
    obj.image86:setParent(obj.InventarioM3);
    obj.image86:setLeft(88);
    obj.image86:setTop(472.75);
    obj.image86:setWidth(43);
    obj.image86:setHeight(41);
    obj.image86:setHitTest(true);
    obj.image86:setCursor("handPoint");
    obj.image86:setOpacity(0);
    obj.image86:setName("image86");

    obj.image87 = GUI.fromHandle(_obj_newObject("image"));
    obj.image87:setParent(obj.InventarioM3);
    obj.image87:setLeft(276);
    obj.image87:setTop(471.75);
    obj.image87:setWidth(43);
    obj.image87:setHeight(41);
    obj.image87:setHitTest(true);
    obj.image87:setCursor("handPoint");
    obj.image87:setOpacity(0);
    obj.image87:setName("image87");

    obj.image88 = GUI.fromHandle(_obj_newObject("image"));
    obj.image88:setParent(obj.InventarioM3);
    obj.image88:setLeft(468);
    obj.image88:setTop(471.75);
    obj.image88:setWidth(43);
    obj.image88:setHeight(41);
    obj.image88:setHitTest(true);
    obj.image88:setCursor("handPoint");
    obj.image88:setOpacity(0);
    obj.image88:setName("image88");

    obj.image89 = GUI.fromHandle(_obj_newObject("image"));
    obj.image89:setParent(obj.InventarioM3);
    obj.image89:setLeft(88.50);
    obj.image89:setTop(710);
    obj.image89:setWidth(44.12);
    obj.image89:setHeight(42);
    obj.image89:setHitTest(true);
    obj.image89:setCursor("handPoint");
    obj.image89:setOpacity(0);
    obj.image89:setName("image89");

    obj.image90 = GUI.fromHandle(_obj_newObject("image"));
    obj.image90:setParent(obj.InventarioM3);
    obj.image90:setLeft(276.50);
    obj.image90:setTop(710);
    obj.image90:setWidth(44.12);
    obj.image90:setHeight(42);
    obj.image90:setHitTest(true);
    obj.image90:setCursor("handPoint");
    obj.image90:setOpacity(0);
    obj.image90:setName("image90");

    obj.image91 = GUI.fromHandle(_obj_newObject("image"));
    obj.image91:setParent(obj.InventarioM3);
    obj.image91:setLeft(468);
    obj.image91:setTop(710);
    obj.image91:setWidth(44.12);
    obj.image91:setHeight(42);
    obj.image91:setHitTest(true);
    obj.image91:setCursor("handPoint");
    obj.image91:setOpacity(0);
    obj.image91:setName("image91");

    obj.popMeuPopup17 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup17:setParent(obj.InventarioM3);
    obj.popMeuPopup17:setName("popMeuPopup17");
    obj.popMeuPopup17:setWidth(400);
    obj.popMeuPopup17:setHeight(533);
    obj.popMeuPopup17:setBackOpacity(0.5);

    obj.image92 = GUI.fromHandle(_obj_newObject("image"));
    obj.image92:setParent(obj.popMeuPopup17);
    obj.image92:setSRC("/imagens/infDosItens.png");
    obj.image92:setWidth(400);
    obj.image92:setHeight(533);
    obj.image92:setLeft(0);
    obj.image92:setTop(0);
    obj.image92:setName("image92");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.popMeuPopup17);
    obj.button19:setLeft(70.28);
    obj.button19:setTop(101.31);
    obj.button19:setWidth(41.25);
    obj.button19:setHeight(23.34);
    obj.button19:setText("Usar");
    obj.button19:setName("button19");

    obj.image93 = GUI.fromHandle(_obj_newObject("image"));
    obj.image93:setParent(obj.popMeuPopup17);
    obj.image93:setField("itemEsquerda2");
    obj.image93:setLeft(132.75);
    obj.image93:setTop(67.25);
    obj.image93:setWidth(140.75);
    obj.image93:setHeight(114.50);
    obj.image93:setEditable(true);
    obj.image93:setStyle("proportional");
    obj.image93:setName("image93");

    obj.nome17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome17:setParent(obj.popMeuPopup17);
    obj.nome17:setField("nome17");
    obj.nome17:setName("nome17");
    obj.nome17:setLeft(145);
    obj.nome17:setTop(202);
    obj.nome17:setWidth(206.25);
    obj.nome17:setHeight(39.75);
    obj.nome17:setTransparent(true);
    obj.nome17:setFontSize(20);

    obj.dano17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano17:setParent(obj.popMeuPopup17);
    obj.dano17:setField("dano17");
    obj.dano17:setName("dano17");
    obj.dano17:setLeft(133);
    obj.dano17:setTop(248.25);
    obj.dano17:setWidth(212.50);
    obj.dano17:setHeight(36.75);
    obj.dano17:setTransparent(true);
    obj.dano17:setFontSize(20);

    obj.adicional17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional17:setParent(obj.popMeuPopup17);
    obj.adicional17:setField("adicional17");
    obj.adicional17:setName("adicional17");
    obj.adicional17:setLeft(179);
    obj.adicional17:setTop(297.25);
    obj.adicional17:setWidth(168);
    obj.adicional17:setHeight(36);
    obj.adicional17:setTransparent(true);
    obj.adicional17:setFontSize(20);

    obj.efeito17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito17:setParent(obj.popMeuPopup17);
    obj.efeito17:setField("efeito17");
    obj.efeito17:setName("efeito17");
    obj.efeito17:setLeft(55);
    obj.efeito17:setTop(362.25);
    obj.efeito17:setWidth(285.25);
    obj.efeito17:setHeight(100.75);
    obj.efeito17:setTransparent(true);
    obj.efeito17:setFontSize(20);

    obj.bdeleted17 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted17:setParent(obj.popMeuPopup17);
    obj.bdeleted17:setName("bdeleted17");
    obj.bdeleted17:setLeft(295.75);
    obj.bdeleted17:setTop(104);
    obj.bdeleted17:setWidth(43);
    obj.bdeleted17:setHeight(41);
    obj.bdeleted17:setHitTest(true);
    obj.bdeleted17:setCursor("handPoint");
    obj.bdeleted17:setOpacity(0);

    obj.popMeuPopup18 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup18:setParent(obj.InventarioM3);
    obj.popMeuPopup18:setName("popMeuPopup18");
    obj.popMeuPopup18:setWidth(400);
    obj.popMeuPopup18:setHeight(533);
    obj.popMeuPopup18:setBackOpacity(0.5);
    obj.popMeuPopup18:setAlign("left");
    obj.popMeuPopup18:setMargins({bottom=400});

    obj.image94 = GUI.fromHandle(_obj_newObject("image"));
    obj.image94:setParent(obj.popMeuPopup18);
    obj.image94:setSRC("/imagens/infDosItens.png");
    obj.image94:setWidth(400);
    obj.image94:setHeight(533);
    obj.image94:setLeft(0);
    obj.image94:setTop(0);
    obj.image94:setName("image94");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.popMeuPopup18);
    obj.button20:setLeft(70.28);
    obj.button20:setTop(101.31);
    obj.button20:setWidth(41.25);
    obj.button20:setHeight(23.34);
    obj.button20:setText("Usar");
    obj.button20:setName("button20");

    obj.image95 = GUI.fromHandle(_obj_newObject("image"));
    obj.image95:setParent(obj.popMeuPopup18);
    obj.image95:setField("itemDireita2");
    obj.image95:setLeft(132.75);
    obj.image95:setTop(67.25);
    obj.image95:setWidth(140.75);
    obj.image95:setHeight(114.50);
    obj.image95:setEditable(true);
    obj.image95:setStyle("proportional");
    obj.image95:setName("image95");

    obj.nome18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome18:setParent(obj.popMeuPopup18);
    obj.nome18:setField("nome18");
    obj.nome18:setName("nome18");
    obj.nome18:setLeft(140);
    obj.nome18:setTop(201.25);
    obj.nome18:setWidth(206.25);
    obj.nome18:setHeight(36.75);
    obj.nome18:setTransparent(true);
    obj.nome18:setFontSize(20);

    obj.dano18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano18:setParent(obj.popMeuPopup18);
    obj.dano18:setField("dano18");
    obj.dano18:setName("dano18");
    obj.dano18:setLeft(133);
    obj.dano18:setTop(248.25);
    obj.dano18:setWidth(212.50);
    obj.dano18:setHeight(36.75);
    obj.dano18:setTransparent(true);
    obj.dano18:setFontSize(20);

    obj.adicional18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional18:setParent(obj.popMeuPopup18);
    obj.adicional18:setField("adicional18");
    obj.adicional18:setName("adicional18");
    obj.adicional18:setLeft(179);
    obj.adicional18:setTop(297.25);
    obj.adicional18:setWidth(168);
    obj.adicional18:setHeight(36);
    obj.adicional18:setTransparent(true);
    obj.adicional18:setFontSize(20);

    obj.efeito18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito18:setParent(obj.popMeuPopup18);
    obj.efeito18:setField("efeito18");
    obj.efeito18:setName("efeito18");
    obj.efeito18:setLeft(55);
    obj.efeito18:setTop(362.25);
    obj.efeito18:setWidth(285.25);
    obj.efeito18:setHeight(100.75);
    obj.efeito18:setTransparent(true);
    obj.efeito18:setFontSize(20);

    obj.bdeleted18 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted18:setParent(obj.popMeuPopup18);
    obj.bdeleted18:setName("bdeleted18");
    obj.bdeleted18:setLeft(295.75);
    obj.bdeleted18:setTop(104);
    obj.bdeleted18:setWidth(43);
    obj.bdeleted18:setHeight(41);
    obj.bdeleted18:setHitTest(true);
    obj.bdeleted18:setCursor("handPoint");
    obj.bdeleted18:setOpacity(0);

    obj.popMeuPopup19 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup19:setParent(obj.InventarioM3);
    obj.popMeuPopup19:setName("popMeuPopup19");
    obj.popMeuPopup19:setWidth(400);
    obj.popMeuPopup19:setHeight(533);
    obj.popMeuPopup19:setBackOpacity(0.5);
    obj.popMeuPopup19:setAlign("left");
    obj.popMeuPopup19:setMargins({bottom=400});

    obj.image96 = GUI.fromHandle(_obj_newObject("image"));
    obj.image96:setParent(obj.popMeuPopup19);
    obj.image96:setSRC("/imagens/infDosItens.png");
    obj.image96:setWidth(400);
    obj.image96:setHeight(533);
    obj.image96:setLeft(0);
    obj.image96:setTop(0);
    obj.image96:setName("image96");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.popMeuPopup19);
    obj.button21:setLeft(70.28);
    obj.button21:setTop(101.31);
    obj.button21:setWidth(41.25);
    obj.button21:setHeight(23.34);
    obj.button21:setText("Usar");
    obj.button21:setName("button21");

    obj.image97 = GUI.fromHandle(_obj_newObject("image"));
    obj.image97:setParent(obj.popMeuPopup19);
    obj.image97:setField("Item13");
    obj.image97:setLeft(132.75);
    obj.image97:setTop(67.25);
    obj.image97:setWidth(140.75);
    obj.image97:setHeight(114.50);
    obj.image97:setEditable(true);
    obj.image97:setStyle("proportional");
    obj.image97:setName("image97");

    obj.nome19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome19:setParent(obj.popMeuPopup19);
    obj.nome19:setField("nome19");
    obj.nome19:setName("nome19");
    obj.nome19:setLeft(140);
    obj.nome19:setTop(201.25);
    obj.nome19:setWidth(206.25);
    obj.nome19:setHeight(36.75);
    obj.nome19:setTransparent(true);
    obj.nome19:setFontSize(20);

    obj.dano19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano19:setParent(obj.popMeuPopup19);
    obj.dano19:setField("dano19");
    obj.dano19:setName("dano19");
    obj.dano19:setLeft(133);
    obj.dano19:setTop(248.25);
    obj.dano19:setWidth(212.50);
    obj.dano19:setHeight(36.75);
    obj.dano19:setTransparent(true);
    obj.dano19:setFontSize(20);

    obj.adicional19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional19:setParent(obj.popMeuPopup19);
    obj.adicional19:setField("adicional19");
    obj.adicional19:setName("adicional19");
    obj.adicional19:setLeft(179);
    obj.adicional19:setTop(297.25);
    obj.adicional19:setWidth(168);
    obj.adicional19:setHeight(36);
    obj.adicional19:setTransparent(true);
    obj.adicional19:setFontSize(20);

    obj.efeito19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito19:setParent(obj.popMeuPopup19);
    obj.efeito19:setField("efeito19");
    obj.efeito19:setName("efeito19");
    obj.efeito19:setLeft(55);
    obj.efeito19:setTop(362.25);
    obj.efeito19:setWidth(285.25);
    obj.efeito19:setHeight(100.75);
    obj.efeito19:setTransparent(true);
    obj.efeito19:setFontSize(20);

    obj.bdeleted19 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted19:setParent(obj.popMeuPopup19);
    obj.bdeleted19:setName("bdeleted19");
    obj.bdeleted19:setLeft(295.75);
    obj.bdeleted19:setTop(104);
    obj.bdeleted19:setWidth(43);
    obj.bdeleted19:setHeight(41);
    obj.bdeleted19:setHitTest(true);
    obj.bdeleted19:setCursor("handPoint");
    obj.bdeleted19:setOpacity(0);

    obj.popMeuPopup20 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup20:setParent(obj.InventarioM3);
    obj.popMeuPopup20:setName("popMeuPopup20");
    obj.popMeuPopup20:setWidth(400);
    obj.popMeuPopup20:setHeight(533);
    obj.popMeuPopup20:setBackOpacity(0.5);
    obj.popMeuPopup20:setAlign("left");
    obj.popMeuPopup20:setMargins({bottom=400});

    obj.image98 = GUI.fromHandle(_obj_newObject("image"));
    obj.image98:setParent(obj.popMeuPopup20);
    obj.image98:setSRC("/imagens/infDosItens.png");
    obj.image98:setWidth(400);
    obj.image98:setHeight(533);
    obj.image98:setLeft(0);
    obj.image98:setTop(0);
    obj.image98:setName("image98");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.popMeuPopup20);
    obj.button22:setLeft(70.28);
    obj.button22:setTop(101.31);
    obj.button22:setWidth(41.25);
    obj.button22:setHeight(23.34);
    obj.button22:setText("Usar");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.popMeuPopup20);
    obj.button23:setLeft(70.28);
    obj.button23:setTop(101.31);
    obj.button23:setWidth(41.25);
    obj.button23:setHeight(23.34);
    obj.button23:setText("Usar");
    obj.button23:setName("button23");

    obj.image99 = GUI.fromHandle(_obj_newObject("image"));
    obj.image99:setParent(obj.popMeuPopup20);
    obj.image99:setField("Item14");
    obj.image99:setLeft(132.75);
    obj.image99:setTop(67.25);
    obj.image99:setWidth(140.75);
    obj.image99:setHeight(114.50);
    obj.image99:setEditable(true);
    obj.image99:setStyle("proportional");
    obj.image99:setName("image99");

    obj.nome20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome20:setParent(obj.popMeuPopup20);
    obj.nome20:setField("nome20");
    obj.nome20:setName("nome20");
    obj.nome20:setLeft(140);
    obj.nome20:setTop(201.25);
    obj.nome20:setWidth(206.25);
    obj.nome20:setHeight(36.75);
    obj.nome20:setTransparent(true);
    obj.nome20:setFontSize(20);

    obj.dano20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano20:setParent(obj.popMeuPopup20);
    obj.dano20:setField("dano20");
    obj.dano20:setName("dano20");
    obj.dano20:setLeft(133);
    obj.dano20:setTop(248.25);
    obj.dano20:setWidth(212.50);
    obj.dano20:setHeight(36.75);
    obj.dano20:setTransparent(true);
    obj.dano20:setFontSize(20);

    obj.adicional20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional20:setParent(obj.popMeuPopup20);
    obj.adicional20:setField("adicional20");
    obj.adicional20:setName("adicional20");
    obj.adicional20:setLeft(179);
    obj.adicional20:setTop(297.25);
    obj.adicional20:setWidth(168);
    obj.adicional20:setHeight(36);
    obj.adicional20:setTransparent(true);
    obj.adicional20:setFontSize(20);

    obj.efeito20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito20:setParent(obj.popMeuPopup20);
    obj.efeito20:setField("efeito20");
    obj.efeito20:setName("efeito20");
    obj.efeito20:setLeft(55);
    obj.efeito20:setTop(362.25);
    obj.efeito20:setWidth(285.25);
    obj.efeito20:setHeight(100.75);
    obj.efeito20:setTransparent(true);
    obj.efeito20:setFontSize(20);

    obj.bdeleted20 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted20:setParent(obj.popMeuPopup20);
    obj.bdeleted20:setName("bdeleted20");
    obj.bdeleted20:setLeft(295.75);
    obj.bdeleted20:setTop(104);
    obj.bdeleted20:setWidth(43);
    obj.bdeleted20:setHeight(41);
    obj.bdeleted20:setHitTest(true);
    obj.bdeleted20:setCursor("handPoint");
    obj.bdeleted20:setOpacity(0);

    obj.popMeuPopup21 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup21:setParent(obj.InventarioM3);
    obj.popMeuPopup21:setName("popMeuPopup21");
    obj.popMeuPopup21:setWidth(400);
    obj.popMeuPopup21:setHeight(533);
    obj.popMeuPopup21:setBackOpacity(0.5);
    obj.popMeuPopup21:setAlign("left");
    obj.popMeuPopup21:setMargins({bottom=400});

    obj.image100 = GUI.fromHandle(_obj_newObject("image"));
    obj.image100:setParent(obj.popMeuPopup21);
    obj.image100:setSRC("/imagens/infDosItens.png");
    obj.image100:setWidth(400);
    obj.image100:setHeight(533);
    obj.image100:setLeft(0);
    obj.image100:setTop(0);
    obj.image100:setName("image100");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.popMeuPopup21);
    obj.button24:setLeft(70.28);
    obj.button24:setTop(101.31);
    obj.button24:setWidth(41.25);
    obj.button24:setHeight(23.34);
    obj.button24:setText("Usar");
    obj.button24:setName("button24");

    obj.image101 = GUI.fromHandle(_obj_newObject("image"));
    obj.image101:setParent(obj.popMeuPopup21);
    obj.image101:setField("Item15");
    obj.image101:setLeft(132.75);
    obj.image101:setTop(67.25);
    obj.image101:setWidth(140.75);
    obj.image101:setHeight(114.50);
    obj.image101:setEditable(true);
    obj.image101:setStyle("proportional");
    obj.image101:setName("image101");

    obj.nome21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome21:setParent(obj.popMeuPopup21);
    obj.nome21:setField("nome21");
    obj.nome21:setName("nome21");
    obj.nome21:setLeft(140);
    obj.nome21:setTop(201.25);
    obj.nome21:setWidth(206.25);
    obj.nome21:setHeight(36.75);
    obj.nome21:setTransparent(true);
    obj.nome21:setFontSize(20);

    obj.dano21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano21:setParent(obj.popMeuPopup21);
    obj.dano21:setField("dano21");
    obj.dano21:setName("dano21");
    obj.dano21:setLeft(133);
    obj.dano21:setTop(248.25);
    obj.dano21:setWidth(212.50);
    obj.dano21:setHeight(36.75);
    obj.dano21:setTransparent(true);
    obj.dano21:setFontSize(20);

    obj.adicional21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional21:setParent(obj.popMeuPopup21);
    obj.adicional21:setField("adicional21");
    obj.adicional21:setName("adicional21");
    obj.adicional21:setLeft(179);
    obj.adicional21:setTop(297.25);
    obj.adicional21:setWidth(168);
    obj.adicional21:setHeight(36);
    obj.adicional21:setTransparent(true);
    obj.adicional21:setFontSize(20);

    obj.efeito21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito21:setParent(obj.popMeuPopup21);
    obj.efeito21:setField("efeito21");
    obj.efeito21:setName("efeito21");
    obj.efeito21:setLeft(55);
    obj.efeito21:setTop(362.25);
    obj.efeito21:setWidth(285.25);
    obj.efeito21:setHeight(100.75);
    obj.efeito21:setTransparent(true);
    obj.efeito21:setFontSize(20);

    obj.bdeleted21 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted21:setParent(obj.popMeuPopup21);
    obj.bdeleted21:setName("bdeleted21");
    obj.bdeleted21:setLeft(295.75);
    obj.bdeleted21:setTop(104);
    obj.bdeleted21:setWidth(43);
    obj.bdeleted21:setHeight(41);
    obj.bdeleted21:setHitTest(true);
    obj.bdeleted21:setCursor("handPoint");
    obj.bdeleted21:setOpacity(0);

    obj.popMeuPopup22 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup22:setParent(obj.InventarioM3);
    obj.popMeuPopup22:setName("popMeuPopup22");
    obj.popMeuPopup22:setWidth(400);
    obj.popMeuPopup22:setHeight(533);
    obj.popMeuPopup22:setBackOpacity(0.5);
    obj.popMeuPopup22:setAlign("left");
    obj.popMeuPopup22:setMargins({bottom=400});

    obj.image102 = GUI.fromHandle(_obj_newObject("image"));
    obj.image102:setParent(obj.popMeuPopup22);
    obj.image102:setSRC("/imagens/infDosItens.png");
    obj.image102:setWidth(400);
    obj.image102:setHeight(533);
    obj.image102:setLeft(0);
    obj.image102:setTop(0);
    obj.image102:setName("image102");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.popMeuPopup22);
    obj.button25:setLeft(70.28);
    obj.button25:setTop(101.31);
    obj.button25:setWidth(41.25);
    obj.button25:setHeight(23.34);
    obj.button25:setText("Usar");
    obj.button25:setName("button25");

    obj.image103 = GUI.fromHandle(_obj_newObject("image"));
    obj.image103:setParent(obj.popMeuPopup22);
    obj.image103:setField("Item16");
    obj.image103:setLeft(132.75);
    obj.image103:setTop(67.25);
    obj.image103:setWidth(140.75);
    obj.image103:setHeight(114.50);
    obj.image103:setEditable(true);
    obj.image103:setStyle("proportional");
    obj.image103:setName("image103");

    obj.nome22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome22:setParent(obj.popMeuPopup22);
    obj.nome22:setField("nome22");
    obj.nome22:setName("nome22");
    obj.nome22:setLeft(140);
    obj.nome22:setTop(201.25);
    obj.nome22:setWidth(206.25);
    obj.nome22:setHeight(36.75);
    obj.nome22:setTransparent(true);
    obj.nome22:setFontSize(20);

    obj.dano22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano22:setParent(obj.popMeuPopup22);
    obj.dano22:setField("dano22");
    obj.dano22:setName("dano22");
    obj.dano22:setLeft(133);
    obj.dano22:setTop(248.25);
    obj.dano22:setWidth(212.50);
    obj.dano22:setHeight(36.75);
    obj.dano22:setTransparent(true);
    obj.dano22:setFontSize(20);

    obj.adicional22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional22:setParent(obj.popMeuPopup22);
    obj.adicional22:setField("adicional22");
    obj.adicional22:setName("adicional22");
    obj.adicional22:setLeft(179);
    obj.adicional22:setTop(297.25);
    obj.adicional22:setWidth(168);
    obj.adicional22:setHeight(36);
    obj.adicional22:setTransparent(true);
    obj.adicional22:setFontSize(20);

    obj.efeito22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito22:setParent(obj.popMeuPopup22);
    obj.efeito22:setField("efeito22");
    obj.efeito22:setName("efeito22");
    obj.efeito22:setLeft(55);
    obj.efeito22:setTop(362.25);
    obj.efeito22:setWidth(285.25);
    obj.efeito22:setHeight(100.75);
    obj.efeito22:setTransparent(true);
    obj.efeito22:setFontSize(20);

    obj.bdeleted22 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted22:setParent(obj.popMeuPopup22);
    obj.bdeleted22:setName("bdeleted22");
    obj.bdeleted22:setLeft(295.75);
    obj.bdeleted22:setTop(104);
    obj.bdeleted22:setWidth(43);
    obj.bdeleted22:setHeight(41);
    obj.bdeleted22:setHitTest(true);
    obj.bdeleted22:setCursor("handPoint");
    obj.bdeleted22:setOpacity(0);

    obj.popMeuPopup23 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup23:setParent(obj.InventarioM3);
    obj.popMeuPopup23:setName("popMeuPopup23");
    obj.popMeuPopup23:setWidth(400);
    obj.popMeuPopup23:setHeight(533);
    obj.popMeuPopup23:setBackOpacity(0.5);
    obj.popMeuPopup23:setAlign("left");
    obj.popMeuPopup23:setMargins({bottom=400});

    obj.image104 = GUI.fromHandle(_obj_newObject("image"));
    obj.image104:setParent(obj.popMeuPopup23);
    obj.image104:setSRC("/imagens/infDosItens.png");
    obj.image104:setWidth(400);
    obj.image104:setHeight(533);
    obj.image104:setLeft(0);
    obj.image104:setTop(0);
    obj.image104:setName("image104");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.popMeuPopup23);
    obj.button26:setLeft(70.28);
    obj.button26:setTop(101.31);
    obj.button26:setWidth(41.25);
    obj.button26:setHeight(23.34);
    obj.button26:setText("Usar");
    obj.button26:setName("button26");

    obj.image105 = GUI.fromHandle(_obj_newObject("image"));
    obj.image105:setParent(obj.popMeuPopup23);
    obj.image105:setField("Item17");
    obj.image105:setLeft(132.75);
    obj.image105:setTop(67.25);
    obj.image105:setWidth(140.75);
    obj.image105:setHeight(114.50);
    obj.image105:setEditable(true);
    obj.image105:setStyle("proportional");
    obj.image105:setName("image105");

    obj.nome23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome23:setParent(obj.popMeuPopup23);
    obj.nome23:setField("nome23");
    obj.nome23:setName("nome23");
    obj.nome23:setLeft(140);
    obj.nome23:setTop(201.25);
    obj.nome23:setWidth(206.25);
    obj.nome23:setHeight(36.75);
    obj.nome23:setTransparent(true);
    obj.nome23:setFontSize(20);

    obj.dano23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano23:setParent(obj.popMeuPopup23);
    obj.dano23:setField("dano23");
    obj.dano23:setName("dano23");
    obj.dano23:setLeft(133);
    obj.dano23:setTop(248.25);
    obj.dano23:setWidth(212.50);
    obj.dano23:setHeight(36.75);
    obj.dano23:setTransparent(true);
    obj.dano23:setFontSize(20);

    obj.adicional23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional23:setParent(obj.popMeuPopup23);
    obj.adicional23:setField("adicional23");
    obj.adicional23:setName("adicional23");
    obj.adicional23:setLeft(179);
    obj.adicional23:setTop(297.25);
    obj.adicional23:setWidth(168);
    obj.adicional23:setHeight(36);
    obj.adicional23:setTransparent(true);
    obj.adicional23:setFontSize(20);

    obj.efeito23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito23:setParent(obj.popMeuPopup23);
    obj.efeito23:setField("efeito23");
    obj.efeito23:setName("efeito23");
    obj.efeito23:setLeft(55);
    obj.efeito23:setTop(362.25);
    obj.efeito23:setWidth(285.25);
    obj.efeito23:setHeight(100.75);
    obj.efeito23:setTransparent(true);
    obj.efeito23:setFontSize(20);

    obj.bdeleted23 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted23:setParent(obj.popMeuPopup23);
    obj.bdeleted23:setName("bdeleted23");
    obj.bdeleted23:setLeft(295.75);
    obj.bdeleted23:setTop(104);
    obj.bdeleted23:setWidth(43);
    obj.bdeleted23:setHeight(41);
    obj.bdeleted23:setHitTest(true);
    obj.bdeleted23:setCursor("handPoint");
    obj.bdeleted23:setOpacity(0);

    obj.popMeuPopup24 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup24:setParent(obj.InventarioM3);
    obj.popMeuPopup24:setName("popMeuPopup24");
    obj.popMeuPopup24:setWidth(400);
    obj.popMeuPopup24:setHeight(533);
    obj.popMeuPopup24:setBackOpacity(0.5);
    obj.popMeuPopup24:setAlign("left");
    obj.popMeuPopup24:setMargins({bottom=400});

    obj.image106 = GUI.fromHandle(_obj_newObject("image"));
    obj.image106:setParent(obj.popMeuPopup24);
    obj.image106:setSRC("/imagens/infDosItens.png");
    obj.image106:setWidth(400);
    obj.image106:setHeight(533);
    obj.image106:setLeft(0);
    obj.image106:setTop(0);
    obj.image106:setName("image106");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.popMeuPopup24);
    obj.button27:setLeft(70.28);
    obj.button27:setTop(101.31);
    obj.button27:setWidth(41.25);
    obj.button27:setHeight(23.34);
    obj.button27:setText("Usar");
    obj.button27:setName("button27");

    obj.image107 = GUI.fromHandle(_obj_newObject("image"));
    obj.image107:setParent(obj.popMeuPopup24);
    obj.image107:setField("Item18");
    obj.image107:setLeft(132.75);
    obj.image107:setTop(67.25);
    obj.image107:setWidth(140.75);
    obj.image107:setHeight(114.50);
    obj.image107:setEditable(true);
    obj.image107:setStyle("proportional");
    obj.image107:setName("image107");

    obj.nome24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome24:setParent(obj.popMeuPopup24);
    obj.nome24:setField("nome24");
    obj.nome24:setName("nome24");
    obj.nome24:setLeft(140);
    obj.nome24:setTop(201.25);
    obj.nome24:setWidth(206.25);
    obj.nome24:setHeight(36.75);
    obj.nome24:setTransparent(true);
    obj.nome24:setFontSize(20);

    obj.dano24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dano24:setParent(obj.popMeuPopup24);
    obj.dano24:setField("dano24");
    obj.dano24:setName("dano24");
    obj.dano24:setLeft(133);
    obj.dano24:setTop(248.25);
    obj.dano24:setWidth(212.50);
    obj.dano24:setHeight(36.75);
    obj.dano24:setTransparent(true);
    obj.dano24:setFontSize(20);

    obj.adicional24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.adicional24:setParent(obj.popMeuPopup24);
    obj.adicional24:setField("adicional24");
    obj.adicional24:setName("adicional24");
    obj.adicional24:setLeft(179);
    obj.adicional24:setTop(297.25);
    obj.adicional24:setWidth(168);
    obj.adicional24:setHeight(36);
    obj.adicional24:setTransparent(true);
    obj.adicional24:setFontSize(20);

    obj.efeito24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.efeito24:setParent(obj.popMeuPopup24);
    obj.efeito24:setField("efeito24");
    obj.efeito24:setName("efeito24");
    obj.efeito24:setLeft(55);
    obj.efeito24:setTop(362.25);
    obj.efeito24:setWidth(285.25);
    obj.efeito24:setHeight(100.75);
    obj.efeito24:setTransparent(true);
    obj.efeito24:setFontSize(20);

    obj.bdeleted24 = GUI.fromHandle(_obj_newObject("image"));
    obj.bdeleted24:setParent(obj.popMeuPopup24);
    obj.bdeleted24:setName("bdeleted24");
    obj.bdeleted24:setLeft(295.75);
    obj.bdeleted24:setTop(104);
    obj.bdeleted24:setWidth(43);
    obj.bdeleted24:setHeight(41);
    obj.bdeleted24:setHitTest(true);
    obj.bdeleted24:setCursor("handPoint");
    obj.bdeleted24:setOpacity(0);


				   local function RolarItem17()  --- sua variavel      
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);   
							 mesaDoPersonagem.chat:rolarDados(sheet.dano17 .. " + " .. sheet.adicional17, "Rolou Item da Mochila nivel 3",
								   function (rolado)   
															   
									end);        
									  end;  
		   



				   local function RolarItem18()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano18 .. " + " .. sheet.adicional18, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;  
		   



				   local function RolarItem19()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano19 .. " + " .. sheet.adicional19, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;  
		   



				   local function RolarItem20()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano20 .. " + " .. sheet.adicional20, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;  
		   



				   local function RolarItem21()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano21 .. " + " .. sheet.adicional21, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;   
		   



				   local function RolarItem22()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano22 .. " + " .. sheet.adicional22, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);       
									  end;  
		   



				   local function RolarItem23()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano23 .. " + " .. sheet.adicional23, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;  
		   



				   local function RolarItem24()        
						   local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
							 mesaDoPersonagem.chat:rolarDados(sheet.dano24 .. " + " .. sheet.adicional24, "Rolou Item da Mochila nivel 3",
								   function (rolado)                               
									end);        
									  end;  
		   


    obj.Inf24 = GUI.fromHandle(_obj_newObject("image"));
    obj.Inf24:setParent(obj.InventarioM3);
    obj.Inf24:setName("Inf24");
    obj.Inf24:setLeft(88);
    obj.Inf24:setTop(165.25);
    obj.Inf24:setWidth(43);
    obj.Inf24:setHeight(41);
    obj.Inf24:setHitTest(true);
    obj.Inf24:setCursor("handPoint");
    obj.Inf24:setOpacity(0);

    obj.image108 = GUI.fromHandle(_obj_newObject("image"));
    obj.image108:setParent(obj.InventarioM3);
    obj.image108:setLeft(569);
    obj.image108:setTop(165.25);
    obj.image108:setWidth(43);
    obj.image108:setHeight(41);
    obj.image108:setHitTest(true);
    obj.image108:setCursor("handPoint");
    obj.image108:setOpacity(0);
    obj.image108:setName("image108");

    obj.image109 = GUI.fromHandle(_obj_newObject("image"));
    obj.image109:setParent(obj.InventarioM3);
    obj.image109:setLeft(187);
    obj.image109:setTop(472.25);
    obj.image109:setWidth(43);
    obj.image109:setHeight(41);
    obj.image109:setHitTest(true);
    obj.image109:setCursor("handPoint");
    obj.image109:setOpacity(0);
    obj.image109:setName("image109");

    obj.image110 = GUI.fromHandle(_obj_newObject("image"));
    obj.image110:setParent(obj.InventarioM3);
    obj.image110:setLeft(375);
    obj.image110:setTop(472.25);
    obj.image110:setWidth(43);
    obj.image110:setHeight(41);
    obj.image110:setHitTest(true);
    obj.image110:setCursor("handPoint");
    obj.image110:setOpacity(0);
    obj.image110:setName("image110");

    obj.image111 = GUI.fromHandle(_obj_newObject("image"));
    obj.image111:setParent(obj.InventarioM3);
    obj.image111:setLeft(567);
    obj.image111:setTop(472.25);
    obj.image111:setWidth(43);
    obj.image111:setHeight(41);
    obj.image111:setHitTest(true);
    obj.image111:setCursor("handPoint");
    obj.image111:setOpacity(0);
    obj.image111:setName("image111");

    obj.image112 = GUI.fromHandle(_obj_newObject("image"));
    obj.image112:setParent(obj.InventarioM3);
    obj.image112:setLeft(189);
    obj.image112:setTop(683);
    obj.image112:setWidth(42);
    obj.image112:setHeight(47);
    obj.image112:setHitTest(true);
    obj.image112:setCursor("handPoint");
    obj.image112:setOpacity(0);
    obj.image112:setName("image112");

    obj.image113 = GUI.fromHandle(_obj_newObject("image"));
    obj.image113:setParent(obj.InventarioM3);
    obj.image113:setLeft(377);
    obj.image113:setTop(683);
    obj.image113:setWidth(42);
    obj.image113:setHeight(47);
    obj.image113:setHitTest(true);
    obj.image113:setCursor("handPoint");
    obj.image113:setOpacity(0);
    obj.image113:setName("image113");

    obj.image114 = GUI.fromHandle(_obj_newObject("image"));
    obj.image114:setParent(obj.InventarioM3);
    obj.image114:setLeft(569);
    obj.image114:setTop(683);
    obj.image114:setWidth(42);
    obj.image114:setHeight(47);
    obj.image114:setHitTest(true);
    obj.image114:setCursor("handPoint");
    obj.image114:setOpacity(0);
    obj.image114:setName("image114");

    obj.image115 = GUI.fromHandle(_obj_newObject("image"));
    obj.image115:setParent(obj.InventarioM3);
    obj.image115:setLeft(283);
    obj.image115:setTop(178.75);
    obj.image115:setWidth(43);
    obj.image115:setHeight(41);
    obj.image115:setHitTest(true);
    obj.image115:setCursor("handPoint");
    obj.image115:setOpacity(0);
    obj.image115:setName("image115");

    obj.image116 = GUI.fromHandle(_obj_newObject("image"));
    obj.image116:setParent(obj.InventarioM3);
    obj.image116:setLeft(372);
    obj.image116:setTop(178.75);
    obj.image116:setWidth(43);
    obj.image116:setHeight(41);
    obj.image116:setHitTest(true);
    obj.image116:setCursor("handPoint");
    obj.image116:setOpacity(0);
    obj.image116:setName("image116");

    obj.image117 = GUI.fromHandle(_obj_newObject("image"));
    obj.image117:setParent(obj.InventarioM3);
    obj.image117:setLeft(132);
    obj.image117:setTop(472.75);
    obj.image117:setWidth(43);
    obj.image117:setHeight(41);
    obj.image117:setHitTest(true);
    obj.image117:setCursor("handPoint");
    obj.image117:setOpacity(0);
    obj.image117:setName("image117");

    obj.image118 = GUI.fromHandle(_obj_newObject("image"));
    obj.image118:setParent(obj.InventarioM3);
    obj.image118:setLeft(319);
    obj.image118:setTop(472.75);
    obj.image118:setWidth(43);
    obj.image118:setHeight(41);
    obj.image118:setHitTest(true);
    obj.image118:setCursor("handPoint");
    obj.image118:setOpacity(0);
    obj.image118:setName("image118");

    obj.image119 = GUI.fromHandle(_obj_newObject("image"));
    obj.image119:setParent(obj.InventarioM3);
    obj.image119:setLeft(512);
    obj.image119:setTop(472.75);
    obj.image119:setWidth(43);
    obj.image119:setHeight(41);
    obj.image119:setHitTest(true);
    obj.image119:setCursor("handPoint");
    obj.image119:setOpacity(0);
    obj.image119:setName("image119");

    obj.image120 = GUI.fromHandle(_obj_newObject("image"));
    obj.image120:setParent(obj.InventarioM3);
    obj.image120:setLeft(132.74);
    obj.image120:setTop(702);
    obj.image120:setWidth(42.13);
    obj.image120:setHeight(49.75);
    obj.image120:setHitTest(true);
    obj.image120:setCursor("handPoint");
    obj.image120:setOpacity(0);
    obj.image120:setName("image120");

    obj.image121 = GUI.fromHandle(_obj_newObject("image"));
    obj.image121:setParent(obj.InventarioM3);
    obj.image121:setLeft(320.34);
    obj.image121:setTop(702);
    obj.image121:setWidth(42.13);
    obj.image121:setHeight(49.75);
    obj.image121:setHitTest(true);
    obj.image121:setCursor("handPoint");
    obj.image121:setOpacity(0);
    obj.image121:setName("image121");

    obj.image122 = GUI.fromHandle(_obj_newObject("image"));
    obj.image122:setParent(obj.InventarioM3);
    obj.image122:setLeft(513.86);
    obj.image122:setTop(702);
    obj.image122:setWidth(42.13);
    obj.image122:setHeight(49.75);
    obj.image122:setHitTest(true);
    obj.image122:setCursor("handPoint");
    obj.image122:setOpacity(0);
    obj.image122:setName("image122");

    obj.mochila1c = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila1c:setParent(obj.scrollBox1);
    obj.mochila1c:setName("mochila1c");
    obj.mochila1c:setField("mochila1c");
    obj.mochila1c:setLeft(88);
    obj.mochila1c:setTop(775);
    obj.mochila1c:setWidth(90);
    obj.mochila1c:setHeight(77);
    obj.mochila1c:setSRC("/imagens/mochilalv1Cadeado.png");
    obj.mochila1c:setVisible(false);

    obj.mochila2c = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila2c:setParent(obj.scrollBox1);
    obj.mochila2c:setName("mochila2c");
    obj.mochila2c:setLeft(220);
    obj.mochila2c:setTop(775);
    obj.mochila2c:setWidth(90);
    obj.mochila2c:setHeight(77);
    obj.mochila2c:setSRC("/imagens/mochilalv2Cadeado.png");
    obj.mochila2c:setVisible(true);

    obj.mochila3c = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila3c:setParent(obj.scrollBox1);
    obj.mochila3c:setName("mochila3c");
    obj.mochila3c:setField("mochila3c");
    obj.mochila3c:setLeft(360);
    obj.mochila3c:setTop(775);
    obj.mochila3c:setWidth(90);
    obj.mochila3c:setHeight(77);
    obj.mochila3c:setSRC("/imagens/mochilalv3Cadeado.png");
    obj.mochila3c:setVisible(true);

    obj.mochila4c = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila4c:setParent(obj.scrollBox1);
    obj.mochila4c:setName("mochila4c");
    obj.mochila4c:setField("mochila4c");
    obj.mochila4c:setLeft(496);
    obj.mochila4c:setTop(775);
    obj.mochila4c:setWidth(90);
    obj.mochila4c:setHeight(77);
    obj.mochila4c:setSRC("/imagens/mochilalv4Cadeado.png");
    obj.mochila4c:setVisible(true);

    obj.mochila1 = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila1:setParent(obj.scrollBox1);
    obj.mochila1:setName("mochila1");
    obj.mochila1:setField("mochila1");
    obj.mochila1:setLeft(88);
    obj.mochila1:setTop(775);
    obj.mochila1:setWidth(90);
    obj.mochila1:setHeight(77);
    obj.mochila1:setSRC("/imagens/mochilalv1.png");
    obj.mochila1:setHitTest(true);
    obj.mochila1:setCursor("handPoint");

    obj.mochila2 = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila2:setParent(obj.scrollBox1);
    obj.mochila2:setName("mochila2");
    obj.mochila2:setLeft(220);
    obj.mochila2:setTop(775);
    obj.mochila2:setWidth(90);
    obj.mochila2:setHeight(77);
    obj.mochila2:setSRC("/imagens/mochilalv2.png");
    obj.mochila2:setHitTest(true);
    obj.mochila2:setCursor("handPoint");

    obj.mochila3 = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila3:setParent(obj.scrollBox1);
    obj.mochila3:setName("mochila3");
    obj.mochila3:setField("mochila3");
    obj.mochila3:setLeft(360);
    obj.mochila3:setTop(775);
    obj.mochila3:setWidth(90);
    obj.mochila3:setHeight(77);
    obj.mochila3:setSRC("/imagens/mochilalv3.png");
    obj.mochila3:setHitTest(true);
    obj.mochila3:setCursor("handPoint");

    obj.mochila4 = GUI.fromHandle(_obj_newObject("image"));
    obj.mochila4:setParent(obj.scrollBox1);
    obj.mochila4:setName("mochila4");
    obj.mochila4:setLeft(496);
    obj.mochila4:setTop(775);
    obj.mochila4:setWidth(90);
    obj.mochila4:setHeight(77);
    obj.mochila4:setSRC("/imagens/mochilalv4.png");
    obj.mochila4:setHitTest(true);
    obj.mochila4:setCursor("handPoint");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("nivelatributo");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.troca1:addEventListener("onClick",
        function (_)
            local aux = sheet.nome1;
            		local aux2 = sheet.dano1;
            		local aux3 = sheet.adicional1;
            		local aux4 = sheet.efeito1;
            		sheet.nome1 = sheet.nome3;
            		sheet.dano1 = sheet.dano3;
            		sheet.adicional1 = sheet.adicional3;
            		sheet.efeito1 = sheet.efeito3;
            		sheet.nome3 = aux;
            		sheet.dano3 = aux2;
            		sheet.adicional3 = aux3;
            		sheet.efeito3 = aux4;	   
                   local aux = sheet.itemEsquerda;
                   sheet.itemEsquerda = sheet.Item1;
                   sheet.Item1 = aux;
        end, obj);

    obj._e_event1 = obj.troca2:addEventListener("onClick",
        function (_)
            local aux = sheet.nome2;
            		local aux2 = sheet.dano2;
            		local aux3 = sheet.adicional2;
            		local aux4 = sheet.efeito2;
            		sheet.nome2 = sheet.nome5;
            		sheet.dano2 = sheet.dano5;
            		sheet.adicional2 = sheet.adicional5;
            		sheet.efeito2 = sheet.efeito5;
            		sheet.nome5 = aux;
            		sheet.dano5 = aux2;
            		sheet.adicional5 = aux3;
            		sheet.efeito5 = aux4;	  
                   local aux = sheet.itemDireita;
                   sheet.itemDireita = sheet.Item3;
                   sheet.Item3 = aux;
        end, obj);

    obj._e_event2 = obj.troca3:addEventListener("onClick",
        function (_)
            local aux = sheet.nome3;
            		local aux2 = sheet.dano3;
            		local aux3 = sheet.adicional3;
            		local aux4 = sheet.efeito3;
            		sheet.nome3 = sheet.nome1;
            		sheet.dano3 = sheet.dano1;
            		sheet.adicional3 = sheet.adicional1;
            		sheet.efeito3 = sheet.efeito1;
            		sheet.nome1 = aux;
            		sheet.dano1 = aux2;
            		sheet.adicional1 = aux3;
            		sheet.efeito1 = aux4;
                  local aux = sheet.itemEsquerda;
                   sheet.itemEsquerda = sheet.item1;
                    sheet.item1 = aux;
        end, obj);

    obj._e_event3 = obj.troca4:addEventListener("onClick",
        function (_)
            local aux = sheet.nome4;
            		local aux2 = sheet.dano4;
            		local aux3 = sheet.adicional4;
            		local aux4 = sheet.efeito4;
            		sheet.nome4 = sheet.nome3;
            		sheet.dano4 = sheet.dano3;
            		sheet.adicional4 = sheet.adicional3;
            		sheet.efeito4 = sheet.efeito3;
            		sheet.nome3 = aux;
            		sheet.dano3 = aux2;
            		sheet.adicional3 = aux3;
            		sheet.efeito3 = aux4;
                  local aux = sheet.Item2;
                   sheet.Item2 = sheet.Item1;
                    sheet.Item1 = aux;
        end, obj);

    obj._e_event4 = obj.troca5:addEventListener("onClick",
        function (_)
            local aux = sheet.nome5;
            		local aux2 = sheet.dano5;
            		local aux3 = sheet.adicional5;
            		local aux4 = sheet.efeito5;
            		sheet.nome5 = sheet.nome4;
            		sheet.dano5 = sheet.dano4;
            		sheet.adicional5 = sheet.adicional4;
            		sheet.efeito5 = sheet.efeito4;
            		sheet.nome4 = aux;
            		sheet.dano4 = aux2;
            		sheet.adicional4 = aux3;
            		sheet.efeito4 = aux4;
                  local aux = sheet.Item3;
                   sheet.Item3 = sheet.Item2;
                    sheet.Item2 = aux;
        end, obj);

    obj._e_event5 = obj.troca6:addEventListener("onClick",
        function (_)
            local aux = sheet.nome6;
            		local aux2 = sheet.dano6;
            		local aux3 = sheet.adicional6;
            		local aux4 = sheet.efeito6;
            		sheet.nome6 = sheet.nome7;
            		sheet.dano6 = sheet.dano7;
            		sheet.adicional6 = sheet.adicional7;
            		sheet.efeito6 = sheet.efeito7;
            		sheet.nome7 = aux;
            		sheet.dano7 = aux2;
            		sheet.adicional7 = aux3;
            		sheet.efeito7 = aux4;		 
                  local aux = sheet.Item4;
                   sheet.Item4 = sheet.Item5;
                    sheet.Item5 = aux;
        end, obj);

    obj._e_event6 = obj.troca7:addEventListener("onClick",
        function (_)
            local aux = sheet.nome7;
            		local aux2 = sheet.dano7;
            		local aux3 = sheet.adicional7;
            		local aux4 = sheet.efeito7;
            		sheet.nome7 = sheet.nome4;
            		sheet.dano7 = sheet.dano4;
            		sheet.adicional7 = sheet.adicional4;
            		sheet.efeito7 = sheet.efeito4;
            		sheet.nome4 = aux;
            		sheet.dano4 = aux2;
            		sheet.adicional4 = aux3;
            		sheet.efeito4 = aux4;		 
                  local aux = sheet.Item5;
                   sheet.Item5 = sheet.Item2;
                    sheet.Item2 = aux;
        end, obj);

    obj._e_event7 = obj.troca8:addEventListener("onClick",
        function (_)
            local aux = sheet.nome8;
            		local aux2 = sheet.dano8;
            		local aux3 = sheet.adicional8;
            		local aux4 = sheet.efeito8;
            		sheet.nome8 = sheet.nome5;
            		sheet.dano8 = sheet.dano5;
            		sheet.adicional8 = sheet.adicional5;
            		sheet.efeito8 = sheet.efeito5;
            		sheet.nome5 = aux;
            		sheet.dano5 = aux2;
            		sheet.adicional5 = aux3;
            		sheet.efeito5 = aux4;
                  local aux = sheet.Item6;
                   sheet.Item6 = sheet.Item3;
                    sheet.Item3 = aux;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            RolarItem1()
        end, obj);

    obj._e_event9 = obj.bdeleted1:addEventListener("onClick",
        function (_)
            --mochila 
                   self.nome1.text = ("")
            	   self.dano1.text = ("")
            	   self.adicional1.text = ("")
            	   self.efeito1.text = ("")
            	   sheet.itemEsquerda = nil
        end, obj);

    obj._e_event10 = obj.button2:addEventListener("onClick",
        function (_)
            RolarItem2();
        end, obj);

    obj._e_event11 = obj.bdeleted2:addEventListener("onClick",
        function (_)
            self.nome2.text = ("")
            	   self.dano2.text = ("")
            	   self.adicional2.text = ("")
            	   self.efeito2.text = ("")
            	   sheet.itemDireita = nil
        end, obj);

    obj._e_event12 = obj.button3:addEventListener("onClick",
        function (_)
            RolarItem3()
        end, obj);

    obj._e_event13 = obj.bdeleted3:addEventListener("onClick",
        function (_)
            self.nome3.text = ("")
            	   self.dano3.text = ("")
            	   self.adicional3.text = ("")
            	   self.efeito3.text = ("")
            	   sheet.Item1 = nil
        end, obj);

    obj._e_event14 = obj.button4:addEventListener("onClick",
        function (_)
            RolarItem4()
        end, obj);

    obj._e_event15 = obj.button5:addEventListener("onClick",
        function (_)
            RolarItem4();
        end, obj);

    obj._e_event16 = obj.bdeleted4:addEventListener("onClick",
        function (_)
            self.nome4.text = ("")
            	   self.dano4.text = ("")
            	   self.adicional4.text = ("")
            	   self.efeito4.text = ("")
            	   sheet.Item2 = nil
        end, obj);

    obj._e_event17 = obj.button6:addEventListener("onClick",
        function (_)
            RolarItem5()
        end, obj);

    obj._e_event18 = obj.bdeleted5:addEventListener("onClick",
        function (_)
            self.nome5.text = ("")
            	   self.dano5.text = ("")
            	   self.adicional5.text = ("")
            	   self.efeito5.text = ("")
            	   sheet.Item3 = nil
        end, obj);

    obj._e_event19 = obj.button7:addEventListener("onClick",
        function (_)
            RolarItem6()
        end, obj);

    obj._e_event20 = obj.bdeleted6:addEventListener("onClick",
        function (_)
            self.nome6.text = ("")
            	   self.dano6.text = ("")
            	   self.adicional6.text = ("")
            	   self.efeito6.text = ("")
            	   sheet.Item4 = nil
        end, obj);

    obj._e_event21 = obj.button8:addEventListener("onClick",
        function (_)
            RolarItem7()
        end, obj);

    obj._e_event22 = obj.bdeleted7:addEventListener("onClick",
        function (_)
            self.nome7.text = ("")
            	   self.dano7.text = ("")
            	   self.adicional7.text = ("")
            	   self.efeito7.text = ("")
            	   sheet.Item5 = nil
        end, obj);

    obj._e_event23 = obj.button9:addEventListener("onClick",
        function (_)
            RolarItem8()
        end, obj);

    obj._e_event24 = obj.bdeleted8:addEventListener("onClick",
        function (_)
            self.nome8.text = ("")
            	   self.dano8.text = ("")
            	   self.adicional8.text = ("")
            	   self.efeito8.text = ("")
            	   sheet.Item6 = nil
        end, obj);

    obj._e_event25 = obj.Inf1:addEventListener("onClick",
        function (_)
            self.popMeuPopup1.scopeNode = sheet; 
            				  self.popMeuPopup1:show();
        end, obj);

    obj._e_event26 = obj.Inf2:addEventListener("onClick",
        function (_)
            self.popMeuPopup2.scopeNode = sheet; 
            				  self.popMeuPopup2:show();
        end, obj);

    obj._e_event27 = obj.Inf3:addEventListener("onClick",
        function (_)
            self.popMeuPopup3.scopeNode = sheet; 
            				  self.popMeuPopup3:show();
        end, obj);

    obj._e_event28 = obj.Inf4:addEventListener("onClick",
        function (_)
            self.popMeuPopup4.scopeNode = sheet; 
            				  self.popMeuPopup4:show();
        end, obj);

    obj._e_event29 = obj.Inf5:addEventListener("onClick",
        function (_)
            self.popMeuPopup5.scopeNode = sheet; 
            				  self.popMeuPopup5:show();
        end, obj);

    obj._e_event30 = obj.Inf6:addEventListener("onClick",
        function (_)
            self.popMeuPopup6.scopeNode = sheet; 
            				  self.popMeuPopup6:show();
        end, obj);

    obj._e_event31 = obj.Inf7:addEventListener("onClick",
        function (_)
            self.popMeuPopup7.scopeNode = sheet; 
            				  self.popMeuPopup7:show();
        end, obj);

    obj._e_event32 = obj.Inf8:addEventListener("onClick",
        function (_)
            self.popMeuPopup8.scopeNode = sheet; 
            				  self.popMeuPopup8:show();
        end, obj);

    obj._e_event33 = obj.botaoDeletar1:addEventListener("onClick",
        function (_)
            self.nome1.text = ("")
            	   self.dano1.text = ("")
            	   self.adicional1.text = ("")
            	   self.efeito1.text = ("")
            	   sheet.itemEsquerda = nil
        end, obj);

    obj._e_event34 = obj.botaoDeletar2:addEventListener("onClick",
        function (_)
            self.nome2.text = ("")
            	   self.dano2.text = ("")
            	   self.adicional2.text = ("")
            	   self.efeito2.text = ("")
            	   sheet.itemDireita = nil
        end, obj);

    obj._e_event35 = obj.botaoDeletar3:addEventListener("onClick",
        function (_)
            self.nome3.text = ("")
            	   self.dano3.text = ("")
            	   self.adicional3.text = ("")
            	   self.efeito3.text = ("")
            	   sheet.Item1 = nil
        end, obj);

    obj._e_event36 = obj.botaoDeletar4:addEventListener("onClick",
        function (_)
            self.nome4.text = ("")
            	   self.dano4.text = ("")
            	   self.adicional4.text = ("")
            	   self.efeito4.text = ("")
            	   sheet.Item2 = nil
        end, obj);

    obj._e_event37 = obj.botaoDeletar5:addEventListener("onClick",
        function (_)
            self.nome5.text = ("")
            	   self.dano5.text = ("")
            	   self.adicional5.text = ("")
            	   self.efeito5.text = ("")
            	   sheet.Item3 = nil
        end, obj);

    obj._e_event38 = obj.botaoDeletar6:addEventListener("onClick",
        function (_)
            self.nome6.text = ("")
            	   self.dano6.text = ("")
            	   self.adicional6.text = ("")
            	   self.efeito6.text = ("")
            	   sheet.Item4 = nil
        end, obj);

    obj._e_event39 = obj.botaoDeletar7:addEventListener("onClick",
        function (_)
            self.nome7.text = ("")
            	   self.dano7.text = ("")
            	   self.adicional7.text = ("")
            	   self.efeito7.text = ("")
            	   sheet.Item5 = nil
        end, obj);

    obj._e_event40 = obj.botaoDeletar8:addEventListener("onClick",
        function (_)
            self.nome8.text = ("")
            	   self.dano8.text = ("")
            	   self.adicional8.text = ("")
            	   self.efeito8.text = ("")
            	   sheet.Item6 = nil
        end, obj);

    obj._e_event41 = obj.image36:addEventListener("onClick",
        function (_)
            local aux = sheet.nome9;
            		local aux2 = sheet.dano9;
            		local aux3 = sheet.adicional9;
            		local aux4 = sheet.efeito9;
            		sheet.nome9 = sheet.nome11;
            		sheet.dano9 = sheet.dano11;
            		sheet.adicional9 = sheet.adicional11;
            		sheet.efeito9 = sheet.efeito3;
            		sheet.nome11 = aux;
            		sheet.dano11 = aux2;
            		sheet.adicional11 = aux3;
            		sheet.efeito11 = aux4;      
                   local aux = sheet.itemEsquerda1;
                   sheet.itemEsquerda1 = sheet.Item7;
                   sheet.Item7 = aux;
        end, obj);

    obj._e_event42 = obj.image37:addEventListener("onClick",
        function (_)
            local aux = sheet.nome10;
            		local aux2 = sheet.dano10;
            		local aux3 = sheet.adicional10;
            		local aux4 = sheet.efeito10;
            		sheet.nome10 = sheet.nome13;
            		sheet.dano10 = sheet.dano13;
            		sheet.adicional10 = sheet.adicional13;
            		sheet.efeito10 = sheet.efeito13;
            		sheet.nome13 = aux;
            		sheet.dano13 = aux2;
            		sheet.adicional13 = aux3;
            		sheet.efeito13 = aux4;	  
                   local aux = sheet.itemDireita1;
                   sheet.itemDireita1 = sheet.Item9;
                   sheet.Item9 = aux;
        end, obj);

    obj._e_event43 = obj.image38:addEventListener("onClick",
        function (_)
            local aux = sheet.nome11;
            		local aux2 = sheet.dano11;
            		local aux3 = sheet.adicional11;
            		local aux4 = sheet.efeito11;
            		sheet.nome11 = sheet.nome9;
            		sheet.dano11 = sheet.dano9;
            		sheet.adicional11 = sheet.adicional9;
            		sheet.efeito11 = sheet.efeito9;
            		sheet.nome9 = aux;
            		sheet.dano9 = aux2;
            		sheet.adicional9 = aux3;
            		sheet.efeito9 = aux4;
                  local aux = sheet.itemEsquerda1;
                   sheet.itemEsquerda1 = sheet.item7;
                    sheet.item7 = aux;
        end, obj);

    obj._e_event44 = obj.image39:addEventListener("onClick",
        function (_)
            local aux = sheet.nome12;
            		local aux2 = sheet.dano12;
            		local aux3 = sheet.adicional12;
            		local aux4 = sheet.efeito12;
            		sheet.nome12 = sheet.nome11;
            		sheet.dano12 = sheet.dano11;
            		sheet.adicional12 = sheet.adicional11;
            		sheet.efeito12 = sheet.efeito11;
            		sheet.nome11 = aux;
            		sheet.dano11 = aux2;
            		sheet.adicional11 = aux3;
            		sheet.efeito11 = aux4;
                  local aux = sheet.Item8;
                   sheet.Item8 = sheet.Item7;
                    sheet.Item7 = aux;
        end, obj);

    obj._e_event45 = obj.image40:addEventListener("onClick",
        function (_)
            local aux = sheet.nome13;
            		local aux2 = sheet.dano13;
            		local aux3 = sheet.adicional13;
            		local aux4 = sheet.efeito13;
            		sheet.nome13 = sheet.nome12;
            		sheet.dano13 = sheet.dano12;
            		sheet.adicional13 = sheet.adicional12;
            		sheet.efeito13 = sheet.efeito12;
            		sheet.nome12 = aux;
            		sheet.dano12 = aux2;
            		sheet.adicional12 = aux3;
            		sheet.efeito12 = aux4;
                  local aux = sheet.Item9;
                   sheet.Item9 = sheet.Item8;
                    sheet.Item8 = aux;
        end, obj);

    obj._e_event46 = obj.image41:addEventListener("onClick",
        function (_)
            local aux = sheet.nome14;
            		local aux2 = sheet.dano14;
            		local aux3 = sheet.adicional14;
            		local aux4 = sheet.efeito14;
            		sheet.nome14 = sheet.nome15;
            		sheet.dano14 = sheet.dano15;
            		sheet.adicional14 = sheet.adicional15;
            		sheet.efeito14 = sheet.efeito15;
            		sheet.nome15 = aux;
            		sheet.dano15 = aux2;
            		sheet.adicional15 = aux3;
            		sheet.efeito15 = aux4;		 
                  local aux = sheet.Item10;
                   sheet.Item10 = sheet.Item11;
                    sheet.Item11 = aux;
        end, obj);

    obj._e_event47 = obj.image42:addEventListener("onClick",
        function (_)
            local aux = sheet.nome15;
            		local aux2 = sheet.dano15;
            		local aux3 = sheet.adicional15;
            		local aux4 = sheet.efeito15;
            		sheet.nome15 = sheet.nome12;
            		sheet.dano15 = sheet.dano12;
            		sheet.adicional15 = sheet.adicional12;
            		sheet.efeito15 = sheet.efeito12;
            		sheet.nome12 = aux;
            		sheet.dano12 = aux2;
            		sheet.adicional12 = aux3;
            		sheet.efeito12 = aux4;		 
                  local aux = sheet.Item11;
                   sheet.Item11 = sheet.Item8;
                    sheet.Item8 = aux;
        end, obj);

    obj._e_event48 = obj.image43:addEventListener("onClick",
        function (_)
            local aux = sheet.nome16;
            		local aux2 = sheet.dano16;
            		local aux3 = sheet.adicional16;
            		local aux4 = sheet.efeito16;
            		sheet.nome16 = sheet.nome13;
            		sheet.dano16 = sheet.dano13;
            		sheet.adicional16 = sheet.adicional13;
            		sheet.efeito16 = sheet.efeito13;
            		sheet.nome13 = aux;
            		sheet.dano13 = aux2;
            		sheet.adicional13 = aux3;
            		sheet.efeito13 = aux4;
                  local aux = sheet.Item12;
                   sheet.Item12 = sheet.Item9;
                    sheet.Item9 = aux;
        end, obj);

    obj._e_event49 = obj.button10:addEventListener("onClick",
        function (_)
            RolarItem9()
        end, obj);

    obj._e_event50 = obj.bdeleted9:addEventListener("onClick",
        function (_)
            self.nome9.text = ("")
            	   self.dano9.text = ("")
            	   self.adicional9.text = ("")
            	   self.efeito9.text = ("")
            	   sheet.itemEsquerda1 = nil
        end, obj);

    obj._e_event51 = obj.button11:addEventListener("onClick",
        function (_)
            RolarItem10()
        end, obj);

    obj._e_event52 = obj.bdeleted10:addEventListener("onClick",
        function (_)
            self.nome10.text = ("")
            	   self.dano10.text = ("")
            	   self.adicional10.text = ("")
            	   self.efeito10.text = ("")
            	   sheet.itemDireita1 = nil
        end, obj);

    obj._e_event53 = obj.button12:addEventListener("onClick",
        function (_)
            RolarItem11()
        end, obj);

    obj._e_event54 = obj.bdeleted11:addEventListener("onClick",
        function (_)
            self.nome11.text = ("")
            	   self.dano11.text = ("")
            	   self.adicional11.text = ("")
            	   self.efeito11.text = ("")
            	   sheet.Item7 = nil
        end, obj);

    obj._e_event55 = obj.button13:addEventListener("onClick",
        function (_)
            RolarItem12()
        end, obj);

    obj._e_event56 = obj.button14:addEventListener("onClick",
        function (_)
            RolarItem12()
        end, obj);

    obj._e_event57 = obj.bdeleted12:addEventListener("onClick",
        function (_)
            self.nome12.text = ("")
            	   self.dano12.text = ("")
            	   self.adicional12.text = ("")
            	   self.efeito12.text = ("")
            	   sheet.Item8 = nil
        end, obj);

    obj._e_event58 = obj.button15:addEventListener("onClick",
        function (_)
            RolarItem13()
        end, obj);

    obj._e_event59 = obj.bdeleted13:addEventListener("onClick",
        function (_)
            self.nome13.text = ("")
            	   self.dano13.text = ("")
            	   self.adicional13.text = ("")
            	   self.efeito13.text = ("")
            	   sheet.Item9 = nil
        end, obj);

    obj._e_event60 = obj.button16:addEventListener("onClick",
        function (_)
            RolarItem14()
        end, obj);

    obj._e_event61 = obj.bdeleted14:addEventListener("onClick",
        function (_)
            self.nome14.text = ("")
            	   self.dano14.text = ("")
            	   self.adicional14.text = ("")
            	   self.efeito14.text = ("")
            	   sheet.Item10 = nil
        end, obj);

    obj._e_event62 = obj.button17:addEventListener("onClick",
        function (_)
            RolarItem15()
        end, obj);

    obj._e_event63 = obj.bdeleted15:addEventListener("onClick",
        function (_)
            self.nome15.text = ("")
            	   self.dano15.text = ("")
            	   self.adicional15.text = ("")
            	   self.efeito15.text = ("")
            	   sheet.Item11 = nil
        end, obj);

    obj._e_event64 = obj.button18:addEventListener("onClick",
        function (_)
            RolarItem16()
        end, obj);

    obj._e_event65 = obj.bdeleted16:addEventListener("onClick",
        function (_)
            self.nome16.text = ("")
            	   self.dano16.text = ("")
            	   self.adicional16.text = ("")
            	   self.efeito16.text = ("")
            	   sheet.Item12 = nil
        end, obj);

    obj._e_event66 = obj.Inf22:addEventListener("onClick",
        function (_)
            self.popMeuPopup9.scopeNode = sheet; 
            				  self.popMeuPopup9:show();
        end, obj);

    obj._e_event67 = obj.image60:addEventListener("onClick",
        function (_)
            self.popMeuPopup10.scopeNode = sheet; 
            				  self.popMeuPopup10:show();
        end, obj);

    obj._e_event68 = obj.image61:addEventListener("onClick",
        function (_)
            self.popMeuPopup11.scopeNode = sheet; 
            				  self.popMeuPopup11:show();
        end, obj);

    obj._e_event69 = obj.image62:addEventListener("onClick",
        function (_)
            self.popMeuPopup12.scopeNode = sheet; 
            				  self.popMeuPopup12:show();
        end, obj);

    obj._e_event70 = obj.image63:addEventListener("onClick",
        function (_)
            self.popMeuPopup13.scopeNode = sheet; 
            				  self.popMeuPopup13:show();
        end, obj);

    obj._e_event71 = obj.image64:addEventListener("onClick",
        function (_)
            self.popMeuPopup14.scopeNode = sheet; 
            				  self.popMeuPopup14:show();
        end, obj);

    obj._e_event72 = obj.image65:addEventListener("onClick",
        function (_)
            self.popMeuPopup15.scopeNode = sheet; 
            				  self.popMeuPopup15:show();
        end, obj);

    obj._e_event73 = obj.image66:addEventListener("onClick",
        function (_)
            self.popMeuPopup16.scopeNode = sheet; 
            				  self.popMeuPopup16:show();
        end, obj);

    obj._e_event74 = obj.image67:addEventListener("onClick",
        function (_)
            self.nome9.text = ("")
            	   self.dano9.text = ("")
            	   self.adicional9.text = ("")
            	   self.efeito9.text = ("")
            	   sheet.itemEsquerda1 = nil
        end, obj);

    obj._e_event75 = obj.image68:addEventListener("onClick",
        function (_)
            self.nome10.text = ("")
            	   self.dano10.text = ("")
            	   self.adicional10.text = ("")
            	   self.efeito10.text = ("")
            	   sheet.itemDireita1 = nil
        end, obj);

    obj._e_event76 = obj.image69:addEventListener("onClick",
        function (_)
            self.nome11.text = ("")
            	   self.dano11.text = ("")
            	   self.adicional11.text = ("")
            	   self.efeito11.text = ("")
            	   sheet.Item7 = nil
        end, obj);

    obj._e_event77 = obj.image70:addEventListener("onClick",
        function (_)
            self.nome12.text = ("")
            	   self.dano12.text = ("")
            	   self.adicional12.text = ("")
            	   self.efeito12.text = ("")
            	   sheet.Item8 = nil
        end, obj);

    obj._e_event78 = obj.image71:addEventListener("onClick",
        function (_)
            self.nome13.text = ("")
            	   self.dano13.text = ("")
            	   self.adicional13.text = ("")
            	   self.efeito13.text = ("")
            	   sheet.Item9 = nil
        end, obj);

    obj._e_event79 = obj.image72:addEventListener("onClick",
        function (_)
            self.nome14.text = ("")
            	   self.dano14.text = ("")
            	   self.adicional14.text = ("")
            	   self.efeito14.text = ("")
            	   sheet.Item10 = nil
        end, obj);

    obj._e_event80 = obj.image73:addEventListener("onClick",
        function (_)
            self.nome15.text = ("")
            	   self.dano15.text = ("")
            	   self.adicional15.text = ("")
            	   self.efeito15.text = ("")
            	   sheet.Item11 = nil
        end, obj);

    obj._e_event81 = obj.image74:addEventListener("onClick",
        function (_)
            self.nome16.text = ("")
            	   self.dano16.text = ("")
            	   self.adicional16.text = ("")
            	   self.efeito16.text = ("")
            	   sheet.Item12 = nil
        end, obj);

    obj._e_event82 = obj.image84:addEventListener("onClick",
        function (_)
            local aux = sheet.nome17;
            	 local aux2 = sheet.dano17;
            	 local aux3 = sheet.adicional17;
            	 local aux4 = sheet.efeito17;
            	 sheet.nome17 = sheet.nome19;
            	 sheet.dano17 = sheet.dano19;
            	 sheet.adicional17 = sheet.adicional19;
            	 sheet.efeito17 = sheet.efeito3;
            	 sheet.nome19 = aux;
            	 sheet.dano19 = aux2;
            	 sheet.adicional19 = aux3;
            	 sheet.efeito19 = aux4;      
            	local aux = sheet.itemEsquerda2;
            	sheet.itemEsquerda2 = sheet.Item13;
            	sheet.Item13 = aux;
        end, obj);

    obj._e_event83 = obj.image85:addEventListener("onClick",
        function (_)
            local aux = sheet.nome18;
            	 local aux2 = sheet.dano18;
            	 local aux3 = sheet.adicional18;
            	 local aux4 = sheet.efeito18;
            	 sheet.nome18 = sheet.nome13;
            	 sheet.dano18 = sheet.dano13;
            	 sheet.adicional18 = sheet.adicional21;
            	 sheet.efeito18 = sheet.efeito21;
            	 sheet.nome21 = aux;
            	 sheet.dano21 = aux2;
            	 sheet.adicional21 = aux3;
            	 sheet.efeito21 = aux4;	  
            	local aux = sheet.itemDireita2;
            	sheet.itemDireita2 = sheet.Item15;
            	sheet.Item15 = aux;
        end, obj);

    obj._e_event84 = obj.image86:addEventListener("onClick",
        function (_)
            local aux = sheet.nome19;
            	 local aux2 = sheet.dano19;
            	 local aux3 = sheet.adicional19;
            	 local aux4 = sheet.efeito19;
            	 sheet.nome19 = sheet.nome17;
            	 sheet.dano19 = sheet.dano17;
            	 sheet.adicional19 = sheet.adicional17;
            	 sheet.efeito19 = sheet.efeito17;
            	 sheet.nome17 = aux;
            	 sheet.dano17 = aux2;
            	 sheet.adicional17 = aux3;
            	 sheet.efeito17 = aux4;
               local aux = sheet.itemEsquerda2;
            	sheet.itemEsquerda2 = sheet.item13;
            	 sheet.item13 = aux;
        end, obj);

    obj._e_event85 = obj.image87:addEventListener("onClick",
        function (_)
            local aux = sheet.nome20;
            	 local aux2 = sheet.dano20;
            	 local aux3 = sheet.adicional20;
            	 local aux4 = sheet.efeito20;
            	 sheet.nome20 = sheet.nome19;
            	 sheet.dano20 = sheet.dano19;
            	 sheet.adicional20 = sheet.adicional19;
            	 sheet.efeito20 = sheet.efeito19;
            	 sheet.nome19 = aux;
            	 sheet.dano19 = aux2;
            	 sheet.adicional19 = aux3;
            	 sheet.efeito19 = aux4;
               local aux = sheet.Item14;
            	sheet.Item14 = sheet.Item13;
            	 sheet.Item13 = aux;
        end, obj);

    obj._e_event86 = obj.image88:addEventListener("onClick",
        function (_)
            local aux = sheet.nome21;
            	 local aux2 = sheet.dano21;
            	 local aux3 = sheet.adicional21;
            	 local aux4 = sheet.efeito21;
            	 sheet.nome21 = sheet.nome20;
            	 sheet.dano21 = sheet.dano20;
            	 sheet.adicional21 = sheet.adicional20;
            	 sheet.efeito21 = sheet.efeito20;
            	 sheet.nome20 = aux;
            	 sheet.dano20 = aux2;
            	 sheet.adicional20 = aux3;
            	 sheet.efeito20 = aux4;
               local aux = sheet.Item15;
            	sheet.Item15 = sheet.Item14;
            	 sheet.Item14 = aux;
        end, obj);

    obj._e_event87 = obj.image89:addEventListener("onClick",
        function (_)
            local aux = sheet.nome22;
            	 local aux2 = sheet.dano22;
            	 local aux3 = sheet.adicional22;
            	 local aux4 = sheet.efeito22;
            	 sheet.nome22 = sheet.nome23;
            	 sheet.dano22 = sheet.dano23;
            	 sheet.adicional22 = sheet.adicional23;
            	 sheet.efeito22 = sheet.efeito23;
            	 sheet.nome23 = aux;
            	 sheet.dano23 = aux2;
            	 sheet.adicional23 = aux3;
            	 sheet.efeito23 = aux4;		 
               local aux = sheet.Item16;
            	sheet.Item16 = sheet.Item17;
            	 sheet.Item17 = aux;
        end, obj);

    obj._e_event88 = obj.image90:addEventListener("onClick",
        function (_)
            local aux = sheet.nome23;
            	 local aux2 = sheet.dano23;
            	 local aux3 = sheet.adicional23;
            	 local aux4 = sheet.efeito23;
            	 sheet.nome23 = sheet.nome20;
            	 sheet.dano23 = sheet.dano20;
            	 sheet.adicional23 = sheet.adicional20;
            	 sheet.efeito23 = sheet.efeito20;
            	 sheet.nome20 = aux;
            	 sheet.dano20 = aux2;
            	 sheet.adicional20 = aux3;
            	 sheet.efeito20 = aux4;		 
               local aux = sheet.Item17;
            	sheet.Item17 = sheet.Item14;
            	 sheet.Item14 = aux;
        end, obj);

    obj._e_event89 = obj.image91:addEventListener("onClick",
        function (_)
            local aux = sheet.nome24;
            	 local aux2 = sheet.dano24;
            	 local aux3 = sheet.adicional24;
            	 local aux4 = sheet.efeito24;
            	 sheet.nome24 = sheet.nome13;
            	 sheet.dano24 = sheet.dano13;
            	 sheet.adicional24 = sheet.adicional21;
            	 sheet.efeito24 = sheet.efeito21;
            	 sheet.nome21 = aux;
            	 sheet.dano21 = aux2;
            	 sheet.adicional21 = aux3;
            	 sheet.efeito21 = aux4;
               local aux = sheet.Item18;
            	sheet.Item18 = sheet.Item15;
            	 sheet.Item15 = aux;
        end, obj);

    obj._e_event90 = obj.button19:addEventListener("onClick",
        function (_)
            RolarItem17()
        end, obj);

    obj._e_event91 = obj.bdeleted17:addEventListener("onClick",
        function (_)
            self.nome17.text = ("")
            		  self.dano17.text = ("")
            		  self.adicional17.text = ("")
            		  self.efeito17.text = ("")
            		  sheet.itemEsquerda2 = nil
        end, obj);

    obj._e_event92 = obj.button20:addEventListener("onClick",
        function (_)
            RolarItem18()
        end, obj);

    obj._e_event93 = obj.bdeleted18:addEventListener("onClick",
        function (_)
            self.nome18.text = ("")
            		  self.dano18.text = ("")
            		  self.adicional18.text = ("")
            		  self.efeito18.text = ("")
            		  sheet.itemDireita2 = nil
        end, obj);

    obj._e_event94 = obj.button21:addEventListener("onClick",
        function (_)
            RolarItem19()
        end, obj);

    obj._e_event95 = obj.bdeleted19:addEventListener("onClick",
        function (_)
            self.nome19.text = ("")
            		  self.dano19.text = ("")
            		  self.adicional19.text = ("")
            		  self.efeito19.text = ("")
            		  sheet.Item13 = nil
        end, obj);

    obj._e_event96 = obj.button22:addEventListener("onClick",
        function (_)
            RolarItem20()
        end, obj);

    obj._e_event97 = obj.button23:addEventListener("onClick",
        function (_)
            RolarItem20()
        end, obj);

    obj._e_event98 = obj.bdeleted20:addEventListener("onClick",
        function (_)
            self.nome20.text = ("")
            		  self.dano20.text = ("")
            		  self.adicional20.text = ("")
            		  self.efeito20.text = ("")
            		  sheet.Item14 = nil
        end, obj);

    obj._e_event99 = obj.button24:addEventListener("onClick",
        function (_)
            RolarItem21()
        end, obj);

    obj._e_event100 = obj.bdeleted21:addEventListener("onClick",
        function (_)
            self.nome21.text = ("")
            		  self.dano21.text = ("")
            		  self.adicional21.text = ("")
            		  self.efeito21.text = ("")
            		  sheet.Item15 = nil
        end, obj);

    obj._e_event101 = obj.button25:addEventListener("onClick",
        function (_)
            RolarItem22()
        end, obj);

    obj._e_event102 = obj.bdeleted22:addEventListener("onClick",
        function (_)
            self.nome22.text = ("")
            		  self.dano22.text = ("")
            		  self.adicional22.text = ("")
            		  self.efeito22.text = ("")
            		  sheet.Item16 = nil
        end, obj);

    obj._e_event103 = obj.button26:addEventListener("onClick",
        function (_)
            RolarItem23()
        end, obj);

    obj._e_event104 = obj.bdeleted23:addEventListener("onClick",
        function (_)
            self.nome23.text = ("")
            		  self.dano23.text = ("")
            		  self.adicional23.text = ("")
            		  self.efeito23.text = ("")
            		  sheet.Item17 = nil
        end, obj);

    obj._e_event105 = obj.button27:addEventListener("onClick",
        function (_)
            RolarItem24()
        end, obj);

    obj._e_event106 = obj.bdeleted24:addEventListener("onClick",
        function (_)
            self.nome24.text = ("")
            		  self.dano24.text = ("")
            		  self.adicional24.text = ("")
            		  self.efeito24.text = ("")
            		  sheet.Item18 = nil
        end, obj);

    obj._e_event107 = obj.Inf24:addEventListener("onClick",
        function (_)
            self.popMeuPopup17.scopeNode = sheet; 
            					 self.popMeuPopup17:show();
        end, obj);

    obj._e_event108 = obj.image108:addEventListener("onClick",
        function (_)
            self.popMeuPopup18.scopeNode = sheet; 
            					 self.popMeuPopup18:show();
        end, obj);

    obj._e_event109 = obj.image109:addEventListener("onClick",
        function (_)
            self.popMeuPopup19.scopeNode = sheet; 
            					 self.popMeuPopup19:show();
        end, obj);

    obj._e_event110 = obj.image110:addEventListener("onClick",
        function (_)
            self.popMeuPopup20.scopeNode = sheet; 
            					 self.popMeuPopup20:show();
        end, obj);

    obj._e_event111 = obj.image111:addEventListener("onClick",
        function (_)
            self.popMeuPopup21.scopeNode = sheet; 
            					 self.popMeuPopup21:show();
        end, obj);

    obj._e_event112 = obj.image112:addEventListener("onClick",
        function (_)
            self.popMeuPopup22.scopeNode = sheet; 
            					 self.popMeuPopup22:show();
        end, obj);

    obj._e_event113 = obj.image113:addEventListener("onClick",
        function (_)
            self.popMeuPopup23.scopeNode = sheet; 
            					 self.popMeuPopup23:show();
        end, obj);

    obj._e_event114 = obj.image114:addEventListener("onClick",
        function (_)
            self.popMeuPopup24.scopeNode = sheet; 
            					 self.popMeuPopup24:show();
        end, obj);

    obj._e_event115 = obj.image115:addEventListener("onClick",
        function (_)
            self.nome17.text = ("")
            		  self.dano17.text = ("")
            		  self.adicional17.text = ("")
            		  self.efeito17.text = ("")
            		  sheet.itemEsquerda2 = nil
        end, obj);

    obj._e_event116 = obj.image116:addEventListener("onClick",
        function (_)
            self.nome18.text = ("")
            		  self.dano18.text = ("")
            		  self.adicional18.text = ("")
            		  self.efeito18.text = ("")
            		  sheet.itemDireita2 = nil
        end, obj);

    obj._e_event117 = obj.image117:addEventListener("onClick",
        function (_)
            self.nome19.text = ("")
            		  self.dano19.text = ("")
            		  self.adicional19.text = ("")
            		  self.efeito19.text = ("")
            		  sheet.Item13 = nil
        end, obj);

    obj._e_event118 = obj.image118:addEventListener("onClick",
        function (_)
            self.nome20.text = ("")
            		  self.dano20.text = ("")
            		  self.adicional20.text = ("")
            		  self.efeito20.text = ("")
            		  sheet.Item14 = nil
        end, obj);

    obj._e_event119 = obj.image119:addEventListener("onClick",
        function (_)
            self.nome21.text = ("")
            		  self.dano21.text = ("")
            		  self.adicional21.text = ("")
            		  self.efeito21.text = ("")
            		  sheet.Item15 = nil
        end, obj);

    obj._e_event120 = obj.image120:addEventListener("onClick",
        function (_)
            self.nome22.text = ("")
            		  self.dano22.text = ("")
            		  self.adicional22.text = ("")
            		  self.efeito22.text = ("")
            		  sheet.Item16 = nil
        end, obj);

    obj._e_event121 = obj.image121:addEventListener("onClick",
        function (_)
            self.nome23.text = ("")
            		  self.dano23.text = ("")
            		  self.adicional23.text = ("")
            		  self.efeito23.text = ("")
            		  sheet.Item17 = nil
        end, obj);

    obj._e_event122 = obj.image122:addEventListener("onClick",
        function (_)
            self.nome24.text = ("")
            		  self.dano24.text = ("")
            		  self.adicional24.text = ("")
            		  self.efeito24.text = ("")
            		  sheet.Item18 = nil
        end, obj);

    obj._e_event123 = obj.mochila1:addEventListener("onClick",
        function (_)
            self.InventarioM1.visible = true
                         self.InventarioM2.visible = false
            			 self.InventarioM3.visible = false
        end, obj);

    obj._e_event124 = obj.mochila2:addEventListener("onClick",
        function (_)
            self.InventarioM2.visible = true
                         self.InventarioM1.visible = false
            			 self.InventarioM3.visible = false
        end, obj);

    obj._e_event125 = obj.mochila3:addEventListener("onClick",
        function (_)
            self.InventarioM3.visible = true
            				self.InventarioM1.visible = false
            				self.InventarioM2.visible = false
        end, obj);

    obj._e_event126 = obj.mochila4:addEventListener("onClick",
        function (_)
        end, obj);

    obj._e_event127 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelatributo >= 10 then
            	self.mochila2.visible = true
            	else
            	self.mochila2.visible = false
            	end;
            
                if sheet.nivelatributo >= 25 then
            	self.mochila3.visible = true
            	else
            	self.mochila3.visible = false
            	end;
            
                if sheet.nivelatributo >= 100 then
            	self.mochila4.visible = true
            	else
            	self.mochila4.visible = false
            	end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
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

        if self.botaoDeletar7 ~= nil then self.botaoDeletar7:destroy(); self.botaoDeletar7 = nil; end;
        if self.dano14 ~= nil then self.dano14:destroy(); self.dano14 = nil; end;
        if self.image74 ~= nil then self.image74:destroy(); self.image74 = nil; end;
        if self.popMeuPopup24 ~= nil then self.popMeuPopup24:destroy(); self.popMeuPopup24 = nil; end;
        if self.image109 ~= nil then self.image109:destroy(); self.image109 = nil; end;
        if self.efeito16 ~= nil then self.efeito16:destroy(); self.efeito16 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.popMeuPopup2 ~= nil then self.popMeuPopup2:destroy(); self.popMeuPopup2 = nil; end;
        if self.efeito6 ~= nil then self.efeito6:destroy(); self.efeito6 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.mochila4c ~= nil then self.mochila4c:destroy(); self.mochila4c = nil; end;
        if self.image111 ~= nil then self.image111:destroy(); self.image111 = nil; end;
        if self.dano16 ~= nil then self.dano16:destroy(); self.dano16 = nil; end;
        if self.image94 ~= nil then self.image94:destroy(); self.image94 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.image117 ~= nil then self.image117:destroy(); self.image117 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.InventarioM2 ~= nil then self.InventarioM2:destroy(); self.InventarioM2 = nil; end;
        if self.adicional1 ~= nil then self.adicional1:destroy(); self.adicional1 = nil; end;
        if self.image98 ~= nil then self.image98:destroy(); self.image98 = nil; end;
        if self.dano10 ~= nil then self.dano10:destroy(); self.dano10 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.bdeleted7 ~= nil then self.bdeleted7:destroy(); self.bdeleted7 = nil; end;
        if self.bdeleted13 ~= nil then self.bdeleted13:destroy(); self.bdeleted13 = nil; end;
        if self.dano19 ~= nil then self.dano19:destroy(); self.dano19 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.efeito15 ~= nil then self.efeito15:destroy(); self.efeito15 = nil; end;
        if self.image80 ~= nil then self.image80:destroy(); self.image80 = nil; end;
        if self.image120 ~= nil then self.image120:destroy(); self.image120 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dano5 ~= nil then self.dano5:destroy(); self.dano5 = nil; end;
        if self.dano15 ~= nil then self.dano15:destroy(); self.dano15 = nil; end;
        if self.efeito23 ~= nil then self.efeito23:destroy(); self.efeito23 = nil; end;
        if self.mochila2c ~= nil then self.mochila2c:destroy(); self.mochila2c = nil; end;
        if self.mochila3c ~= nil then self.mochila3c:destroy(); self.mochila3c = nil; end;
        if self.nome5 ~= nil then self.nome5:destroy(); self.nome5 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.bdeleted2 ~= nil then self.bdeleted2:destroy(); self.bdeleted2 = nil; end;
        if self.botaoDeletar6 ~= nil then self.botaoDeletar6:destroy(); self.botaoDeletar6 = nil; end;
        if self.adicional22 ~= nil then self.adicional22:destroy(); self.adicional22 = nil; end;
        if self.image110 ~= nil then self.image110:destroy(); self.image110 = nil; end;
        if self.efeito12 ~= nil then self.efeito12:destroy(); self.efeito12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.efeito2 ~= nil then self.efeito2:destroy(); self.efeito2 = nil; end;
        if self.popMeuPopup6 ~= nil then self.popMeuPopup6:destroy(); self.popMeuPopup6 = nil; end;
        if self.image101 ~= nil then self.image101:destroy(); self.image101 = nil; end;
        if self.image70 ~= nil then self.image70:destroy(); self.image70 = nil; end;
        if self.nome4 ~= nil then self.nome4:destroy(); self.nome4 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.botaoDeletar2 ~= nil then self.botaoDeletar2:destroy(); self.botaoDeletar2 = nil; end;
        if self.image85 ~= nil then self.image85:destroy(); self.image85 = nil; end;
        if self.Inf24 ~= nil then self.Inf24:destroy(); self.Inf24 = nil; end;
        if self.adicional7 ~= nil then self.adicional7:destroy(); self.adicional7 = nil; end;
        if self.bdeleted1 ~= nil then self.bdeleted1:destroy(); self.bdeleted1 = nil; end;
        if self.bdeleted14 ~= nil then self.bdeleted14:destroy(); self.bdeleted14 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.efeito22 ~= nil then self.efeito22:destroy(); self.efeito22 = nil; end;
        if self.mochila1c ~= nil then self.mochila1c:destroy(); self.mochila1c = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.image115 ~= nil then self.image115:destroy(); self.image115 = nil; end;
        if self.adicional12 ~= nil then self.adicional12:destroy(); self.adicional12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.image81 ~= nil then self.image81:destroy(); self.image81 = nil; end;
        if self.dano3 ~= nil then self.dano3:destroy(); self.dano3 = nil; end;
        if self.efeito18 ~= nil then self.efeito18:destroy(); self.efeito18 = nil; end;
        if self.adicional15 ~= nil then self.adicional15:destroy(); self.adicional15 = nil; end;
        if self.nome10 ~= nil then self.nome10:destroy(); self.nome10 = nil; end;
        if self.adicional17 ~= nil then self.adicional17:destroy(); self.adicional17 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.efeito3 ~= nil then self.efeito3:destroy(); self.efeito3 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.adicional19 ~= nil then self.adicional19:destroy(); self.adicional19 = nil; end;
        if self.dano20 ~= nil then self.dano20:destroy(); self.dano20 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.image79 ~= nil then self.image79:destroy(); self.image79 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.bdeleted12 ~= nil then self.bdeleted12:destroy(); self.bdeleted12 = nil; end;
        if self.adicional10 ~= nil then self.adicional10:destroy(); self.adicional10 = nil; end;
        if self.image88 ~= nil then self.image88:destroy(); self.image88 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.nome8 ~= nil then self.nome8:destroy(); self.nome8 = nil; end;
        if self.nome16 ~= nil then self.nome16:destroy(); self.nome16 = nil; end;
        if self.InventarioM1 ~= nil then self.InventarioM1:destroy(); self.InventarioM1 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.Inf7 ~= nil then self.Inf7:destroy(); self.Inf7 = nil; end;
        if self.bdeleted5 ~= nil then self.bdeleted5:destroy(); self.bdeleted5 = nil; end;
        if self.nome12 ~= nil then self.nome12:destroy(); self.nome12 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.efeito7 ~= nil then self.efeito7:destroy(); self.efeito7 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.image86 ~= nil then self.image86:destroy(); self.image86 = nil; end;
        if self.image106 ~= nil then self.image106:destroy(); self.image106 = nil; end;
        if self.bdeleted23 ~= nil then self.bdeleted23:destroy(); self.bdeleted23 = nil; end;
        if self.image118 ~= nil then self.image118:destroy(); self.image118 = nil; end;
        if self.popMeuPopup22 ~= nil then self.popMeuPopup22:destroy(); self.popMeuPopup22 = nil; end;
        if self.image107 ~= nil then self.image107:destroy(); self.image107 = nil; end;
        if self.adicional3 ~= nil then self.adicional3:destroy(); self.adicional3 = nil; end;
        if self.adicional11 ~= nil then self.adicional11:destroy(); self.adicional11 = nil; end;
        if self.image95 ~= nil then self.image95:destroy(); self.image95 = nil; end;
        if self.nome1 ~= nil then self.nome1:destroy(); self.nome1 = nil; end;
        if self.image114 ~= nil then self.image114:destroy(); self.image114 = nil; end;
        if self.nome15 ~= nil then self.nome15:destroy(); self.nome15 = nil; end;
        if self.nome14 ~= nil then self.nome14:destroy(); self.nome14 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.mochila2 ~= nil then self.mochila2:destroy(); self.mochila2 = nil; end;
        if self.image78 ~= nil then self.image78:destroy(); self.image78 = nil; end;
        if self.bdeleted10 ~= nil then self.bdeleted10:destroy(); self.bdeleted10 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.dano21 ~= nil then self.dano21:destroy(); self.dano21 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.troca8 ~= nil then self.troca8:destroy(); self.troca8 = nil; end;
        if self.nome13 ~= nil then self.nome13:destroy(); self.nome13 = nil; end;
        if self.efeito21 ~= nil then self.efeito21:destroy(); self.efeito21 = nil; end;
        if self.adicional8 ~= nil then self.adicional8:destroy(); self.adicional8 = nil; end;
        if self.image91 ~= nil then self.image91:destroy(); self.image91 = nil; end;
        if self.adicional24 ~= nil then self.adicional24:destroy(); self.adicional24 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.popMeuPopup16 ~= nil then self.popMeuPopup16:destroy(); self.popMeuPopup16 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.adicional13 ~= nil then self.adicional13:destroy(); self.adicional13 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.image83 ~= nil then self.image83:destroy(); self.image83 = nil; end;
        if self.image92 ~= nil then self.image92:destroy(); self.image92 = nil; end;
        if self.efeito17 ~= nil then self.efeito17:destroy(); self.efeito17 = nil; end;
        if self.bdeleted20 ~= nil then self.bdeleted20:destroy(); self.bdeleted20 = nil; end;
        if self.efeito24 ~= nil then self.efeito24:destroy(); self.efeito24 = nil; end;
        if self.popMeuPopup8 ~= nil then self.popMeuPopup8:destroy(); self.popMeuPopup8 = nil; end;
        if self.efeito19 ~= nil then self.efeito19:destroy(); self.efeito19 = nil; end;
        if self.adicional14 ~= nil then self.adicional14:destroy(); self.adicional14 = nil; end;
        if self.nome20 ~= nil then self.nome20:destroy(); self.nome20 = nil; end;
        if self.popMeuPopup13 ~= nil then self.popMeuPopup13:destroy(); self.popMeuPopup13 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.dano17 ~= nil then self.dano17:destroy(); self.dano17 = nil; end;
        if self.troca1 ~= nil then self.troca1:destroy(); self.troca1 = nil; end;
        if self.adicional2 ~= nil then self.adicional2:destroy(); self.adicional2 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.image103 ~= nil then self.image103:destroy(); self.image103 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.image122 ~= nil then self.image122:destroy(); self.image122 = nil; end;
        if self.dano2 ~= nil then self.dano2:destroy(); self.dano2 = nil; end;
        if self.popMeuPopup10 ~= nil then self.popMeuPopup10:destroy(); self.popMeuPopup10 = nil; end;
        if self.botaoDeletar3 ~= nil then self.botaoDeletar3:destroy(); self.botaoDeletar3 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.nome22 ~= nil then self.nome22:destroy(); self.nome22 = nil; end;
        if self.troca7 ~= nil then self.troca7:destroy(); self.troca7 = nil; end;
        if self.dano4 ~= nil then self.dano4:destroy(); self.dano4 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.bdeleted4 ~= nil then self.bdeleted4:destroy(); self.bdeleted4 = nil; end;
        if self.image82 ~= nil then self.image82:destroy(); self.image82 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.nome9 ~= nil then self.nome9:destroy(); self.nome9 = nil; end;
        if self.popMeuPopup5 ~= nil then self.popMeuPopup5:destroy(); self.popMeuPopup5 = nil; end;
        if self.image97 ~= nil then self.image97:destroy(); self.image97 = nil; end;
        if self.bdeleted8 ~= nil then self.bdeleted8:destroy(); self.bdeleted8 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.bdeleted3 ~= nil then self.bdeleted3:destroy(); self.bdeleted3 = nil; end;
        if self.popMeuPopup12 ~= nil then self.popMeuPopup12:destroy(); self.popMeuPopup12 = nil; end;
        if self.nome21 ~= nil then self.nome21:destroy(); self.nome21 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.bdeleted21 ~= nil then self.bdeleted21:destroy(); self.bdeleted21 = nil; end;
        if self.popMeuPopup7 ~= nil then self.popMeuPopup7:destroy(); self.popMeuPopup7 = nil; end;
        if self.image96 ~= nil then self.image96:destroy(); self.image96 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.Inf22 ~= nil then self.Inf22:destroy(); self.Inf22 = nil; end;
        if self.nome18 ~= nil then self.nome18:destroy(); self.nome18 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.troca2 ~= nil then self.troca2:destroy(); self.troca2 = nil; end;
        if self.troca4 ~= nil then self.troca4:destroy(); self.troca4 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.image99 ~= nil then self.image99:destroy(); self.image99 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.efeito4 ~= nil then self.efeito4:destroy(); self.efeito4 = nil; end;
        if self.image77 ~= nil then self.image77:destroy(); self.image77 = nil; end;
        if self.adicional4 ~= nil then self.adicional4:destroy(); self.adicional4 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.efeito13 ~= nil then self.efeito13:destroy(); self.efeito13 = nil; end;
        if self.bdeleted24 ~= nil then self.bdeleted24:destroy(); self.bdeleted24 = nil; end;
        if self.mochila1 ~= nil then self.mochila1:destroy(); self.mochila1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.dano22 ~= nil then self.dano22:destroy(); self.dano22 = nil; end;
        if self.botaoDeletar8 ~= nil then self.botaoDeletar8:destroy(); self.botaoDeletar8 = nil; end;
        if self.nome19 ~= nil then self.nome19:destroy(); self.nome19 = nil; end;
        if self.troca3 ~= nil then self.troca3:destroy(); self.troca3 = nil; end;
        if self.popMeuPopup15 ~= nil then self.popMeuPopup15:destroy(); self.popMeuPopup15 = nil; end;
        if self.popMeuPopup18 ~= nil then self.popMeuPopup18:destroy(); self.popMeuPopup18 = nil; end;
        if self.nome7 ~= nil then self.nome7:destroy(); self.nome7 = nil; end;
        if self.bdeleted18 ~= nil then self.bdeleted18:destroy(); self.bdeleted18 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.popMeuPopup19 ~= nil then self.popMeuPopup19:destroy(); self.popMeuPopup19 = nil; end;
        if self.adicional9 ~= nil then self.adicional9:destroy(); self.adicional9 = nil; end;
        if self.troca6 ~= nil then self.troca6:destroy(); self.troca6 = nil; end;
        if self.image108 ~= nil then self.image108:destroy(); self.image108 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.image89 ~= nil then self.image89:destroy(); self.image89 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.efeito1 ~= nil then self.efeito1:destroy(); self.efeito1 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.adicional18 ~= nil then self.adicional18:destroy(); self.adicional18 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.efeito8 ~= nil then self.efeito8:destroy(); self.efeito8 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.image93 ~= nil then self.image93:destroy(); self.image93 = nil; end;
        if self.Inf8 ~= nil then self.Inf8:destroy(); self.Inf8 = nil; end;
        if self.bdeleted17 ~= nil then self.bdeleted17:destroy(); self.bdeleted17 = nil; end;
        if self.image90 ~= nil then self.image90:destroy(); self.image90 = nil; end;
        if self.image69 ~= nil then self.image69:destroy(); self.image69 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.nome2 ~= nil then self.nome2:destroy(); self.nome2 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.image87 ~= nil then self.image87:destroy(); self.image87 = nil; end;
        if self.popMeuPopup11 ~= nil then self.popMeuPopup11:destroy(); self.popMeuPopup11 = nil; end;
        if self.image84 ~= nil then self.image84:destroy(); self.image84 = nil; end;
        if self.Inf2 ~= nil then self.Inf2:destroy(); self.Inf2 = nil; end;
        if self.botaoDeletar1 ~= nil then self.botaoDeletar1:destroy(); self.botaoDeletar1 = nil; end;
        if self.adicional20 ~= nil then self.adicional20:destroy(); self.adicional20 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.adicional6 ~= nil then self.adicional6:destroy(); self.adicional6 = nil; end;
        if self.efeito5 ~= nil then self.efeito5:destroy(); self.efeito5 = nil; end;
        if self.Inf5 ~= nil then self.Inf5:destroy(); self.Inf5 = nil; end;
        if self.popMeuPopup3 ~= nil then self.popMeuPopup3:destroy(); self.popMeuPopup3 = nil; end;
        if self.dano12 ~= nil then self.dano12:destroy(); self.dano12 = nil; end;
        if self.bdeleted9 ~= nil then self.bdeleted9:destroy(); self.bdeleted9 = nil; end;
        if self.dano8 ~= nil then self.dano8:destroy(); self.dano8 = nil; end;
        if self.efeito14 ~= nil then self.efeito14:destroy(); self.efeito14 = nil; end;
        if self.nome6 ~= nil then self.nome6:destroy(); self.nome6 = nil; end;
        if self.botaoDeletar5 ~= nil then self.botaoDeletar5:destroy(); self.botaoDeletar5 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.image75 ~= nil then self.image75:destroy(); self.image75 = nil; end;
        if self.efeito10 ~= nil then self.efeito10:destroy(); self.efeito10 = nil; end;
        if self.popMeuPopup21 ~= nil then self.popMeuPopup21:destroy(); self.popMeuPopup21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.image105 ~= nil then self.image105:destroy(); self.image105 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.botaoDeletar4 ~= nil then self.botaoDeletar4:destroy(); self.botaoDeletar4 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.nome24 ~= nil then self.nome24:destroy(); self.nome24 = nil; end;
        if self.adicional23 ~= nil then self.adicional23:destroy(); self.adicional23 = nil; end;
        if self.image121 ~= nil then self.image121:destroy(); self.image121 = nil; end;
        if self.troca5 ~= nil then self.troca5:destroy(); self.troca5 = nil; end;
        if self.adicional16 ~= nil then self.adicional16:destroy(); self.adicional16 = nil; end;
        if self.mochila3 ~= nil then self.mochila3:destroy(); self.mochila3 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.image73 ~= nil then self.image73:destroy(); self.image73 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.popMeuPopup23 ~= nil then self.popMeuPopup23:destroy(); self.popMeuPopup23 = nil; end;
        if self.bdeleted11 ~= nil then self.bdeleted11:destroy(); self.bdeleted11 = nil; end;
        if self.popMeuPopup14 ~= nil then self.popMeuPopup14:destroy(); self.popMeuPopup14 = nil; end;
        if self.dano23 ~= nil then self.dano23:destroy(); self.dano23 = nil; end;
        if self.Inf1 ~= nil then self.Inf1:destroy(); self.Inf1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.image116 ~= nil then self.image116:destroy(); self.image116 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.image76 ~= nil then self.image76:destroy(); self.image76 = nil; end;
        if self.popMeuPopup20 ~= nil then self.popMeuPopup20:destroy(); self.popMeuPopup20 = nil; end;
        if self.image100 ~= nil then self.image100:destroy(); self.image100 = nil; end;
        if self.itemEsquerda ~= nil then self.itemEsquerda:destroy(); self.itemEsquerda = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.bdeleted22 ~= nil then self.bdeleted22:destroy(); self.bdeleted22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.popMeuPopup4 ~= nil then self.popMeuPopup4:destroy(); self.popMeuPopup4 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.Inf3 ~= nil then self.Inf3:destroy(); self.Inf3 = nil; end;
        if self.Inf4 ~= nil then self.Inf4:destroy(); self.Inf4 = nil; end;
        if self.efeito9 ~= nil then self.efeito9:destroy(); self.efeito9 = nil; end;
        if self.efeito11 ~= nil then self.efeito11:destroy(); self.efeito11 = nil; end;
        if self.mochila4 ~= nil then self.mochila4:destroy(); self.mochila4 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.bdeleted6 ~= nil then self.bdeleted6:destroy(); self.bdeleted6 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.dano9 ~= nil then self.dano9:destroy(); self.dano9 = nil; end;
        if self.dano18 ~= nil then self.dano18:destroy(); self.dano18 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.dano6 ~= nil then self.dano6:destroy(); self.dano6 = nil; end;
        if self.image72 ~= nil then self.image72:destroy(); self.image72 = nil; end;
        if self.adicional5 ~= nil then self.adicional5:destroy(); self.adicional5 = nil; end;
        if self.image104 ~= nil then self.image104:destroy(); self.image104 = nil; end;
        if self.dano13 ~= nil then self.dano13:destroy(); self.dano13 = nil; end;
        if self.nome11 ~= nil then self.nome11:destroy(); self.nome11 = nil; end;
        if self.dano1 ~= nil then self.dano1:destroy(); self.dano1 = nil; end;
        if self.dano11 ~= nil then self.dano11:destroy(); self.dano11 = nil; end;
        if self.image71 ~= nil then self.image71:destroy(); self.image71 = nil; end;
        if self.efeito20 ~= nil then self.efeito20:destroy(); self.efeito20 = nil; end;
        if self.image112 ~= nil then self.image112:destroy(); self.image112 = nil; end;
        if self.image113 ~= nil then self.image113:destroy(); self.image113 = nil; end;
        if self.adicional21 ~= nil then self.adicional21:destroy(); self.adicional21 = nil; end;
        if self.popMeuPopup17 ~= nil then self.popMeuPopup17:destroy(); self.popMeuPopup17 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dano24 ~= nil then self.dano24:destroy(); self.dano24 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.bdeleted15 ~= nil then self.bdeleted15:destroy(); self.bdeleted15 = nil; end;
        if self.bdeleted16 ~= nil then self.bdeleted16:destroy(); self.bdeleted16 = nil; end;
        if self.dano7 ~= nil then self.dano7:destroy(); self.dano7 = nil; end;
        if self.InventarioM3 ~= nil then self.InventarioM3:destroy(); self.InventarioM3 = nil; end;
        if self.Inf6 ~= nil then self.Inf6:destroy(); self.Inf6 = nil; end;
        if self.popMeuPopup1 ~= nil then self.popMeuPopup1:destroy(); self.popMeuPopup1 = nil; end;
        if self.nome17 ~= nil then self.nome17:destroy(); self.nome17 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.popMeuPopup9 ~= nil then self.popMeuPopup9:destroy(); self.popMeuPopup9 = nil; end;
        if self.itemEsquerda2 ~= nil then self.itemEsquerda2:destroy(); self.itemEsquerda2 = nil; end;
        if self.itemEsquerda1 ~= nil then self.itemEsquerda1:destroy(); self.itemEsquerda1 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.bdeleted19 ~= nil then self.bdeleted19:destroy(); self.bdeleted19 = nil; end;
        if self.nome23 ~= nil then self.nome23:destroy(); self.nome23 = nil; end;
        if self.image119 ~= nil then self.image119:destroy(); self.image119 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.nome3 ~= nil then self.nome3:destroy(); self.nome3 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.image102 ~= nil then self.image102:destroy(); self.image102 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha333_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha333_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha333_svg = {
    newEditor = newfrmFicha333_svg, 
    new = newfrmFicha333_svg, 
    name = "frmFicha333_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha333_svg = _frmFicha333_svg;
Firecast.registrarForm(_frmFicha333_svg);

return _frmFicha333_svg;
