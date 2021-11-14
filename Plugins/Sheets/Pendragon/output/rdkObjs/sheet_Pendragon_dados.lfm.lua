require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDados()
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
    obj:setName("frmDados");
    obj:setAlign("client");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setName("rectangle1");

    obj.dLCabecalho = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLCabecalho:setParent(obj.rectangle1);
    obj.dLCabecalho:setName("dLCabecalho");
    obj.dLCabecalho:setFields({'fldNomePJ', 'fldJogador'});
    obj.dLCabecalho:setDefaultValues({'NOME DO PERSONAGEM', 'Jogador'});

    obj.dLDadosIniciais = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDadosIniciais:setParent(obj.rectangle1);
    obj.dLDadosIniciais:setName("dLDadosIniciais");
    obj.dLDadosIniciais:setFields({'fldIdade', 'fldSuserano', 'fldFeudo', 'fldNascimento', 'fldClasseAtual', 'fldRiqueza', 'fldTerraNatal', 'fldClassePai', 'fldCaracteristica'});
    obj.dLDadosIniciais:setDefaultValues({'00 anos', '—', '—', '0', '—', '—', '—', '—', '—'});

    obj.dLDescCaracteristica = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDescCaracteristica:setParent(obj.rectangle1);
    obj.dLDescCaracteristica:setName("dLDescCaracteristica");
    obj.dLDescCaracteristica:setField("fldCarHabilidade");
    obj.dLDescCaracteristica:setDefaultValue("+00 HABILIDADE");

    obj.dLDadosAdicionais = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDadosAdicionais:setParent(obj.rectangle1);
    obj.dLDadosAdicionais:setName("dLDadosAdicionais");
    obj.dLDadosAdicionais:setFields({'fldCultura', 'fldReligiao', 'fldGloria', 'fldNvGloria', 'fldGloriaAnual', 'fldSomaGloria'});
    obj.dLDadosAdicionais:setDefaultValues({'—', '—', '0', '0', '0', '0'});

    obj.dLAtributosDerivados = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLAtributosDerivados:setParent(obj.rectangle1);
    obj.dLAtributosDerivados:setName("dLAtributosDerivados");
    obj.dLAtributosDerivados:setFields({'fldCarDistintiva', 'fldFerimentos'});
    obj.dLAtributosDerivados:setDefaultValues({'—', '—'});

    obj.dLUpgrades = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLUpgrades:setParent(obj.rectangle1);
    obj.dLUpgrades:setName("dLUpgrades");
    obj.dLUpgrades:setFields({'fldUpgradesGlor', 'fldUpgradesInv'});
    obj.dLUpgrades:setDefaultValues({'—', '—'});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("fldHab01");
    obj.dataLink1:setDefaultValue("Adaga");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("fldHab02");
    obj.dataLink2:setDefaultValue("Arco");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("fldHab03");
    obj.dataLink3:setDefaultValue("Batalha");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setField("fldHab04");
    obj.dataLink4:setDefaultValue("Besta");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setField("fldHab05");
    obj.dataLink5:setDefaultValue("Dardo");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle1);
    obj.dataLink6:setField("fldHab06");
    obj.dataLink6:setDefaultValue("Equitação");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle1);
    obj.dataLink7:setField("fldHab07");
    obj.dataLink7:setDefaultValue("Espada");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle1);
    obj.dataLink8:setField("fldHab08");
    obj.dataLink8:setDefaultValue("Grande Lança");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle1);
    obj.dataLink9:setField("fldHab09");
    obj.dataLink9:setDefaultValue("Grande Machado");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle1);
    obj.dataLink10:setField("fldHab10");
    obj.dataLink10:setDefaultValue("Lança");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle1);
    obj.dataLink11:setField("fldHab11");
    obj.dataLink11:setDefaultValue("Lança Montada");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle1);
    obj.dataLink12:setField("fldHab12");
    obj.dataLink12:setDefaultValue("Machado");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle1);
    obj.dataLink13:setField("fldHab13");
    obj.dataLink13:setDefaultValue("Maça");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle1);
    obj.dataLink14:setField("fldHab14");
    obj.dataLink14:setDefaultValue("—");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle1);
    obj.dataLink15:setField("fldHab15");
    obj.dataLink15:setDefaultValue("—");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle1);
    obj.dataLink16:setField("fldHab16");
    obj.dataLink16:setDefaultValue("Administração");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle1);
    obj.dataLink17:setField("fldHab17");
    obj.dataLink17:setDefaultValue("Atenção");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle1);
    obj.dataLink18:setField("fldHab18");
    obj.dataLink18:setDefaultValue("Canto");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.rectangle1);
    obj.dataLink19:setField("fldHab19");
    obj.dataLink19:setDefaultValue("Caça");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.rectangle1);
    obj.dataLink20:setField("fldHab20");
    obj.dataLink20:setDefaultValue("Cirurgia");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle1);
    obj.dataLink21:setField("fldHab21");
    obj.dataLink21:setDefaultValue("Composição");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.rectangle1);
    obj.dataLink22:setField("fldHab22");
    obj.dataLink22:setDefaultValue("Cortesia");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.rectangle1);
    obj.dataLink23:setField("fldHab23");
    obj.dataLink23:setDefaultValue("Dança");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.rectangle1);
    obj.dataLink24:setField("fldHab24");
    obj.dataLink24:setDefaultValue("Falcoaria");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.rectangle1);
    obj.dataLink25:setField("fldHab25");
    obj.dataLink25:setDefaultValue("Feerismo");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.rectangle1);
    obj.dataLink26:setField("fldHab26");
    obj.dataLink26:setDefaultValue("Flerte");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.rectangle1);
    obj.dataLink27:setField("fldHab27");
    obj.dataLink27:setDefaultValue("Folclore");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.rectangle1);
    obj.dataLink28:setField("fldHab28");
    obj.dataLink28:setDefaultValue("Heráldica");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle1);
    obj.dataLink29:setField("fldHab29");
    obj.dataLink29:setDefaultValue("Intriga");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle1);
    obj.dataLink30:setField("fldHab30");
    obj.dataLink30:setDefaultValue("Jogos");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle1);
    obj.dataLink31:setField("fldHab31");
    obj.dataLink31:setDefaultValue("Leitura (Língua)");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle1);
    obj.dataLink32:setField("fldHab32");
    obj.dataLink32:setDefaultValue("Moda");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle1);
    obj.dataLink33:setField("fldHab33");
    obj.dataLink33:setDefaultValue("Natação");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle1);
    obj.dataLink34:setField("fldHab34");
    obj.dataLink34:setDefaultValue("Navegação");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle1);
    obj.dataLink35:setField("fldHab35");
    obj.dataLink35:setDefaultValue("Ofícios");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle1);
    obj.dataLink36:setField("fldHab36");
    obj.dataLink36:setDefaultValue("Oratória");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle1);
    obj.dataLink37:setField("fldHab37");
    obj.dataLink37:setDefaultValue("Primeiros Socorros");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle1);
    obj.dataLink38:setField("fldHab38");
    obj.dataLink38:setDefaultValue("Reconhecimento");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle1);
    obj.dataLink39:setField("fldHab39");
    obj.dataLink39:setDefaultValue("Religião (Fé)");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle1);
    obj.dataLink40:setField("fldHab40");
    obj.dataLink40:setDefaultValue("Romance");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle1);
    obj.dataLink41:setField("fldHab41");
    obj.dataLink41:setDefaultValue("Tocar (Instrumento)");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle1);
    obj.dataLink42:setField("fldHab42");
    obj.dataLink42:setDefaultValue("Torneio");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle1);
    obj.dataLink43:setField("fldHab43");
    obj.dataLink43:setDefaultValue("—");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle1);
    obj.dataLink44:setField("fldHab44");
    obj.dataLink44:setDefaultValue("—");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle1);
    obj.dataLink45:setField("fldHab45");
    obj.dataLink45:setDefaultValue("—");
    obj.dataLink45:setName("dataLink45");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(60);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("☙");
    obj.label1:setFontColor("#0080ff");
    obj.label1:setFontFamily("Palatino Linotype");
    obj.label1:setFontSize(28);
    obj.label1:setTop(7);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("fldNomePJ");
    obj.edit1:setName("edit1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setHeight(2);
    obj.rectangle2:setWidth(650);
    obj.rectangle2:setTop(33);
    obj.rectangle2:setColor("#0080ff");
    obj.rectangle2:setName("rectangle2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("fldJogador");
    obj.edit2:setName("edit2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(90);
    obj.layout2:setMargins({left = 40, top = 20});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setHeight(90);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setHeight(30);
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setText("Idade:");
    obj.label2:setWidth(41);
    obj.label2:setName("label2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(159);
    obj.layout5:setName("layout5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setField("fldIdade");
    obj.edit3:setWidth(159);
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setText("Suserano:");
    obj.label3:setWidth(64);
    obj.label3:setName("label3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(136);
    obj.layout7:setName("layout7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setField("fldSuserano");
    obj.edit4:setWidth(136);
    obj.edit4:setName("edit4");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout3);
    obj.layout8:setHeight(30);
    obj.layout8:setName("layout8");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout8);
    obj.label4:setText("Feudo:");
    obj.label4:setWidth(44);
    obj.label4:setName("label4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(156);
    obj.layout9:setName("layout9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout9);
    obj.edit5:setField("fldFeudo");
    obj.edit5:setWidth(156);
    obj.edit5:setName("edit5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setHeight(90);
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout11);
    obj.label5:setText("Ordem de Nascimento:");
    obj.label5:setWidth(146);
    obj.label5:setName("label5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(54);
    obj.layout12:setName("layout12");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout12);
    obj.edit6:setField("fldNascimento");
    obj.edit6:setWidth(54);
    obj.edit6:setName("edit6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout13);
    obj.label6:setText("Classe:");
    obj.label6:setWidth(46);
    obj.label6:setName("label6");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(154);
    obj.layout14:setName("layout14");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout14);
    obj.edit7:setField("fldClasseAtual");
    obj.edit7:setWidth(154);
    obj.edit7:setName("edit7");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setHeight(30);
    obj.layout15:setName("layout15");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout15);
    obj.label7:setText("Riqueza:");
    obj.label7:setWidth(57);
    obj.label7:setName("label7");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(143);
    obj.layout16:setName("layout16");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout16);
    obj.edit8:setField("fldRiqueza");
    obj.edit8:setWidth(143);
    obj.edit8:setName("edit8");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout2);
    obj.layout17:setHeight(90);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout18);
    obj.label8:setText("Terra Natal:");
    obj.label8:setWidth(77);
    obj.label8:setName("label8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(173);
    obj.layout19:setName("layout19");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout19);
    obj.edit9:setField("fldTerraNatal");
    obj.edit9:setWidth(173);
    obj.edit9:setName("edit9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setHeight(30);
    obj.layout20:setName("layout20");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout20);
    obj.label9:setText("Classe do Pai:");
    obj.label9:setWidth(87);
    obj.label9:setName("label9");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(163);
    obj.layout21:setName("layout21");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout21);
    obj.edit10:setField("fldClassePai");
    obj.edit10:setWidth(163);
    obj.edit10:setName("edit10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout17);
    obj.layout22:setHeight(30);
    obj.layout22:setName("layout22");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout22);
    obj.label10:setText("Característica:");
    obj.label10:setWidth(93);
    obj.label10:setName("label10");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(157);
    obj.layout23:setName("layout23");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout23);
    obj.edit11:setField("fldCaracteristica");
    obj.edit11:setWidth(157);
    obj.edit11:setName("edit11");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(20);
    obj.layout24:setName("layout24");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout24);
    obj.edit12:setField("fldCarHabilidade");
    obj.edit12:setFontColor("#858585");
    obj.edit12:setFontFamily("Palatino Linotype");
    obj.edit12:setFontSize(10);
    obj.edit12:setTransparent(true);
    obj.edit12:setLeft(550);
    obj.edit12:setWidth(157);
    obj.edit12:setTop(-10);
    obj.edit12:setName("edit12");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(500);
    obj.layout25:setName("layout25");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout25);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(650);
    obj.image1:setHeight(400);
    obj.image1:setURL("/images/shield-flare.png");
    obj.image1:setStyle("proportional");
    obj.image1:setCenter(true);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout25);
    obj.image2:setField("fldBrasao");
    obj.image2:setHeight(290);
    obj.image2:setTop(170);
    obj.image2:setWidth(240);
    obj.image2:setLeft(205);
    obj.image2:setStyle("proportional");
    obj.image2:setCenter(true);
    obj.image2:setEditable(true);
    obj.image2:setHint("Alterar Brasão");
    obj.image2:setName("image2");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout25);
    obj.dataLink46:setField("fldBrasao");
    obj.dataLink46:setDefaultValue("/images/heraldry.png");
    obj.dataLink46:setName("dataLink46");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(60);
    obj.layout26:setMargins({left = 40, top = 25});
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setHeight(30);
    obj.layout28:setName("layout28");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout28);
    obj.label11:setText("Cultura:");
    obj.label11:setWidth(52);
    obj.label11:setName("label11");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(148);
    obj.layout29:setName("layout29");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout29);
    obj.edit13:setField("fldCultura");
    obj.edit13:setWidth(148);
    obj.edit13:setName("edit13");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout26);
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setHeight(30);
    obj.layout31:setName("layout31");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout31);
    obj.label12:setText("Religião:");
    obj.label12:setWidth(58);
    obj.label12:setName("label12");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(142);
    obj.layout32:setName("layout32");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout32);
    obj.edit14:setField("fldReligiao");
    obj.edit14:setWidth(142);
    obj.edit14:setName("edit14");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setHeight(30);
    obj.layout33:setName("layout33");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout33);
    obj.label13:setText("Glória");
    obj.label13:setWidth(44);
    obj.label13:setName("label13");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(156);
    obj.layout34:setName("layout34");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout34);
    obj.edit15:setField("fldGloria");
    obj.edit15:setWidth(156);
    obj.edit15:setName("edit15");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout26);
    obj.layout35:setName("layout35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setHeight(30);
    obj.layout36:setName("layout36");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout36);
    obj.label14:setText("Níveis de Glória:");
    obj.label14:setWidth(105);
    obj.label14:setName("label14");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(145);
    obj.layout37:setName("layout37");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout37);
    obj.edit16:setField("fldNvGloria");
    obj.edit16:setWidth(145);
    obj.edit16:setName("edit16");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout35);
    obj.layout38:setName("layout38");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout38);
    obj.label15:setText("Glória Anual:");
    obj.label15:setWidth(85);
    obj.label15:setName("label15");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(40);
    obj.layout39:setName("layout39");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout39);
    obj.edit17:setField("fldGloriaAnual");
    obj.edit17:setWidth(40);
    obj.edit17:setName("edit17");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout38);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(163);
    obj.layout40:setName("layout40");

    obj.namSomaGloria = GUI.fromHandle(_obj_newObject("label"));
    obj.namSomaGloria:setParent(obj.layout40);
    obj.namSomaGloria:setName("namSomaGloria");
    obj.namSomaGloria:setField("fldSomaGloria");
    obj.namSomaGloria:setWidth(165);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setAlign("top");
    obj.layout41:setName("layout41");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout41);
    obj.label16:setAlign("left");
    obj.label16:setText("☙ ATRIBUTOS");
    obj.label16:setWidth(150);
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setFontColor("#0080ff");
    obj.label16:setFontFamily("Palatino Linotype");
    obj.label16:setFontSize(20);
    obj.label16:setName("label16");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(500);
    obj.layout42:setName("layout42");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout42);
    obj.rectangle3:setHeight(2);
    obj.rectangle3:setWidth(500);
    obj.rectangle3:setTop(25);
    obj.rectangle3:setColor("#0080ff");
    obj.rectangle3:setName("rectangle3");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(165);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(115);
    obj.layout44:setMargins({right=18});
    obj.layout44:setName("layout44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(30);
    obj.layout45:setName("layout45");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout45);
    obj.label17:setText("TAM");
    obj.label17:setTop(10);
    obj.label17:setWidth(143);
    obj.label17:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setFontColor("#858585");
    obj.label17:setFontFamily("Cambria");
    obj.label17:setFontSize(17);
    obj.label17:setHint("Tamanho");
    obj.label17:setHitTest(true);
    obj.label17:setName("label17");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout44);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(173);
    obj.layout46:setName("layout46");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout46);
    obj.image3:setWidth(143);
    obj.image3:setURL("/images/shield.png");
    obj.image3:setStyle("proportional");
    obj.image3:setName("image3");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout44);
    obj.layout47:setWidth(143);
    obj.layout47:setTop(55);
    obj.layout47:setLeft(38);
    obj.layout47:setName("layout47");

    obj.TAM = GUI.fromHandle(_obj_newObject("edit"));
    obj.TAM:setParent(obj.layout47);
    obj.TAM:setName("TAM");
    obj.TAM:setField("fldTamanho");
    obj.TAM:setHint("Tamanho");
    obj.TAM:setHitTest(true);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout43);
    obj.dataLink47:setField("fldTamanho");
    obj.dataLink47:setDefaultValue("0");
    obj.dataLink47:setName("dataLink47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(115);
    obj.layout48:setMargins({right=18});
    obj.layout48:setName("layout48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(30);
    obj.layout49:setName("layout49");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout49);
    obj.label18:setText("DES");
    obj.label18:setTop(10);
    obj.label18:setWidth(143);
    obj.label18:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setFontColor("#858585");
    obj.label18:setFontFamily("Cambria");
    obj.label18:setFontSize(17);
    obj.label18:setHint("Destreza");
    obj.label18:setHitTest(true);
    obj.label18:setName("label18");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout48);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(173);
    obj.layout50:setName("layout50");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout50);
    obj.image4:setWidth(143);
    obj.image4:setURL("/images/shield.png");
    obj.image4:setStyle("proportional");
    obj.image4:setName("image4");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout48);
    obj.layout51:setWidth(143);
    obj.layout51:setTop(55);
    obj.layout51:setLeft(38);
    obj.layout51:setName("layout51");

    obj.DES = GUI.fromHandle(_obj_newObject("edit"));
    obj.DES:setParent(obj.layout51);
    obj.DES:setName("DES");
    obj.DES:setField("fldDestreza");
    obj.DES:setHint("Destreza");
    obj.DES:setHitTest(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout43);
    obj.dataLink48:setField("fldDestreza");
    obj.dataLink48:setDefaultValue("0");
    obj.dataLink48:setName("dataLink48");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout43);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(115);
    obj.layout52:setMargins({right=18});
    obj.layout52:setName("layout52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(30);
    obj.layout53:setName("layout53");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout53);
    obj.label19:setText("FOR");
    obj.label19:setTop(10);
    obj.label19:setWidth(143);
    obj.label19:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setFontColor("#858585");
    obj.label19:setFontFamily("Cambria");
    obj.label19:setFontSize(17);
    obj.label19:setHint("Força");
    obj.label19:setHitTest(true);
    obj.label19:setName("label19");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout52);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(173);
    obj.layout54:setName("layout54");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout54);
    obj.image5:setWidth(143);
    obj.image5:setURL("/images/shield.png");
    obj.image5:setStyle("proportional");
    obj.image5:setName("image5");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout52);
    obj.layout55:setWidth(143);
    obj.layout55:setTop(55);
    obj.layout55:setLeft(38);
    obj.layout55:setName("layout55");

    obj.FOR = GUI.fromHandle(_obj_newObject("edit"));
    obj.FOR:setParent(obj.layout55);
    obj.FOR:setName("FOR");
    obj.FOR:setField("fldForca");
    obj.FOR:setHint("Força");
    obj.FOR:setHitTest(true);

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout43);
    obj.dataLink49:setField("fldForca");
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setName("dataLink49");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout43);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(115);
    obj.layout56:setMargins({right=18});
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(30);
    obj.layout57:setName("layout57");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout57);
    obj.label20:setText("CON");
    obj.label20:setTop(10);
    obj.label20:setWidth(143);
    obj.label20:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setFontColor("#858585");
    obj.label20:setFontFamily("Cambria");
    obj.label20:setFontSize(17);
    obj.label20:setHint("Constituição");
    obj.label20:setHitTest(true);
    obj.label20:setName("label20");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(173);
    obj.layout58:setName("layout58");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout58);
    obj.image6:setWidth(143);
    obj.image6:setURL("/images/shield.png");
    obj.image6:setStyle("proportional");
    obj.image6:setName("image6");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout56);
    obj.layout59:setWidth(143);
    obj.layout59:setTop(55);
    obj.layout59:setLeft(38);
    obj.layout59:setName("layout59");

    obj.CON = GUI.fromHandle(_obj_newObject("edit"));
    obj.CON:setParent(obj.layout59);
    obj.CON:setName("CON");
    obj.CON:setField("fldConstituicao");
    obj.CON:setHint("Constituição");
    obj.CON:setHitTest(true);

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout43);
    obj.dataLink50:setField("fldConstituicao");
    obj.dataLink50:setDefaultValue("0");
    obj.dataLink50:setName("dataLink50");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout43);
    obj.layout60:setAlign("left");
    obj.layout60:setWidth(115);
    obj.layout60:setMargins({right=18});
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(30);
    obj.layout61:setName("layout61");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout61);
    obj.label21:setText("APA");
    obj.label21:setTop(10);
    obj.label21:setWidth(143);
    obj.label21:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setFontColor("#858585");
    obj.label21:setFontFamily("Cambria");
    obj.label21:setFontSize(17);
    obj.label21:setHint("Aparência");
    obj.label21:setHitTest(true);
    obj.label21:setName("label21");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(173);
    obj.layout62:setName("layout62");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout62);
    obj.image7:setWidth(143);
    obj.image7:setURL("/images/shield.png");
    obj.image7:setStyle("proportional");
    obj.image7:setName("image7");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setWidth(143);
    obj.layout63:setTop(55);
    obj.layout63:setLeft(38);
    obj.layout63:setName("layout63");

    obj.APA = GUI.fromHandle(_obj_newObject("edit"));
    obj.APA:setParent(obj.layout63);
    obj.APA:setName("APA");
    obj.APA:setField("fldAparencia");
    obj.APA:setHint("Aparência");
    obj.APA:setHitTest(true);

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout43);
    obj.dataLink51:setField("fldAparencia");
    obj.dataLink51:setDefaultValue("0");
    obj.dataLink51:setName("dataLink51");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setAlign("top");
    obj.layout64:setMargins({left = 40, top = 0});
    obj.layout64:setName("layout64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setName("layout65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setName("layout66");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout66);
    obj.label22:setText("Dano:");
    obj.label22:setWidth(40);
    obj.label22:setHint("(FOR+TAM)/6");
    obj.label22:setHitTest(true);
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout66);
    obj.label23:setField("fldDano");
    obj.label23:setHint("(FOR+TAM)/6");
    obj.label23:setHitTest(true);
    obj.label23:setName("label23");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout65);
    obj.layout67:setName("layout67");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout67);
    obj.label24:setText("Movimento:");
    obj.label24:setWidth(80);
    obj.label24:setHint("(FOR+DES)/10");
    obj.label24:setHitTest(true);
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout67);
    obj.label25:setField("fldMovimento");
    obj.label25:setHint("(FOR+DES)/10");
    obj.label25:setHitTest(true);
    obj.label25:setName("label25");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout64);
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69:setName("layout69");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout69);
    obj.label26:setText("Regeneração:");
    obj.label26:setWidth(90);
    obj.label26:setHint("(FOR+CON)/10");
    obj.label26:setHitTest(true);
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout69);
    obj.label27:setField("fldRegen");
    obj.label27:setHint("(FOR+CON)/10");
    obj.label27:setHitTest(true);
    obj.label27:setName("label27");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout68);
    obj.layout70:setName("layout70");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout70);
    obj.label28:setText("HP:");
    obj.label28:setWidth(25);
    obj.label28:setHint("TAM+CON");
    obj.label28:setHitTest(true);
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout70);
    obj.label29:setField("fldHP");
    obj.label29:setHint("TAM+CON");
    obj.label29:setHitTest(true);
    obj.label29:setName("label29");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout64);
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setName("layout72");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout72);
    obj.label30:setText("");
    obj.label30:setWidth(40);
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout72);
    obj.label31:setText("");
    obj.label31:setName("label31");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setName("layout73");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout73);
    obj.label32:setText("Inconsciente:");
    obj.label32:setWidth(88);
    obj.label32:setHint("HP/4");
    obj.label32:setHitTest(true);
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout73);
    obj.label33:setField("fldInconsciente");
    obj.label33:setHint("HP/4");
    obj.label33:setHitTest(true);
    obj.label33:setName("label33");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.rectangle1);
    obj.dataLink52:setFields({'fldTamanho', 'fldDestreza', 'fldForca', 'fldConstituicao'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.rectangle1);
    obj.dataLink53:setField("fldAparencia");
    obj.dataLink53:setName("dataLink53");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setAlign("top");
    obj.layout74:setMargins({left = 40, top = 25});
    obj.layout74:setHeight(60);
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setName("layout75");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout75);
    obj.label34:setText("Características Distintas:");
    obj.label34:setWidth(164);
    obj.label34:setName("label34");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(486);
    obj.layout76:setName("layout76");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout76);
    obj.edit18:setField("fldCarDistintiva");
    obj.edit18:setWidth(486);
    obj.edit18:setName("edit18");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77:setName("layout77");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout77);
    obj.label35:setText("Ferimentos:");
    obj.label35:setWidth(80);
    obj.label35:setName("label35");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout77);
    obj.layout78:setAlign("left");
    obj.layout78:setWidth(570);
    obj.layout78:setName("layout78");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout78);
    obj.edit19:setField("fldFerimentos");
    obj.edit19:setWidth(570);
    obj.edit19:setName("edit19");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setAlign("top");
    obj.layout79:setName("layout79");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout79);
    obj.label36:setAlign("left");
    obj.label36:setText("☙ HABILIDADES");
    obj.label36:setWidth(175);
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setFontColor("#0080ff");
    obj.label36:setFontFamily("Palatino Linotype");
    obj.label36:setFontSize(20);
    obj.label36:setName("label36");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout79);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(475);
    obj.layout80:setName("layout80");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout80);
    obj.rectangle4:setHeight(2);
    obj.rectangle4:setWidth(475);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setColor("#0080ff");
    obj.rectangle4:setName("rectangle4");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(150);
    obj.layout81:setMargins({left = 40, top = 0});
    obj.layout81:setName("layout81");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout81);
    obj.layout82:setName("layout82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setName("layout83");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout83);
    obj.comboBox1:setField("fldCBHab01");
    obj.comboBox1:setItems({' ', '♞', '⨉'});
    obj.comboBox1:setValues({'N', 'C', 'X'});
    obj.comboBox1:setValue("C");
    obj.comboBox1:setName("comboBox1");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout83);
    obj.edit20:setField("fldHab01");
    obj.edit20:setName("edit20");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setAlign("left");
    obj.layout84:setName("layout84");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout84);
    obj.edit21:setField("fldHabValor01");
    obj.edit21:setType("number");
    obj.edit21:setMin(0);
    obj.edit21:setMax(99);
    obj.edit21:setName("edit21");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout82);
    obj.dataLink54:setField("fldHabValor01");
    obj.dataLink54:setDefaultValue("0");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout82);
    obj.dataLink55:setField("fldCBHab01");
    obj.dataLink55:setDefaultValue("C");
    obj.dataLink55:setName("dataLink55");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout82);
    obj.layout85:setName("layout85");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout85);
    obj.comboBox2:setField("fldCBHab04");
    obj.comboBox2:setItems({' ', '♞', '⨉'});
    obj.comboBox2:setValues({'N', 'C', 'X'});
    obj.comboBox2:setValue("N");
    obj.comboBox2:setName("comboBox2");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout85);
    obj.edit22:setField("fldHab04");
    obj.edit22:setName("edit22");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout85);
    obj.layout86:setAlign("left");
    obj.layout86:setName("layout86");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout86);
    obj.edit23:setField("fldHabValor04");
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setMax(99);
    obj.edit23:setName("edit23");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout82);
    obj.dataLink56:setField("fldHabValor04");
    obj.dataLink56:setDefaultValue("0");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout82);
    obj.dataLink57:setField("fldCBHab04");
    obj.dataLink57:setDefaultValue("N");
    obj.dataLink57:setName("dataLink57");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout82);
    obj.layout87:setName("layout87");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout87);
    obj.comboBox3:setField("fldCBHab07");
    obj.comboBox3:setItems({' ', '♞', '⨉'});
    obj.comboBox3:setValues({'N', 'C', 'X'});
    obj.comboBox3:setValue("C");
    obj.comboBox3:setName("comboBox3");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout87);
    obj.edit24:setField("fldHab07");
    obj.edit24:setName("edit24");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout87);
    obj.layout88:setAlign("left");
    obj.layout88:setName("layout88");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout88);
    obj.edit25:setField("fldHabValor07");
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setMax(99);
    obj.edit25:setName("edit25");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout82);
    obj.dataLink58:setField("fldHabValor07");
    obj.dataLink58:setDefaultValue("0");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout82);
    obj.dataLink59:setField("fldCBHab07");
    obj.dataLink59:setDefaultValue("C");
    obj.dataLink59:setName("dataLink59");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout82);
    obj.layout89:setName("layout89");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout89);
    obj.comboBox4:setField("fldCBHab10");
    obj.comboBox4:setItems({' ', '♞', '⨉'});
    obj.comboBox4:setValues({'N', 'C', 'X'});
    obj.comboBox4:setValue("N");
    obj.comboBox4:setName("comboBox4");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout89);
    obj.edit26:setField("fldHab10");
    obj.edit26:setName("edit26");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setAlign("left");
    obj.layout90:setName("layout90");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout90);
    obj.edit27:setField("fldHabValor10");
    obj.edit27:setType("number");
    obj.edit27:setMin(0);
    obj.edit27:setMax(99);
    obj.edit27:setName("edit27");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout82);
    obj.dataLink60:setField("fldHabValor10");
    obj.dataLink60:setDefaultValue("0");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout82);
    obj.dataLink61:setField("fldCBHab10");
    obj.dataLink61:setDefaultValue("N");
    obj.dataLink61:setName("dataLink61");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout82);
    obj.layout91:setName("layout91");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout91);
    obj.comboBox5:setField("fldCBHab13");
    obj.comboBox5:setItems({' ', '♞', '⨉'});
    obj.comboBox5:setValues({'N', 'C', 'X'});
    obj.comboBox5:setValue("N");
    obj.comboBox5:setName("comboBox5");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout91);
    obj.edit28:setField("fldHab13");
    obj.edit28:setName("edit28");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout91);
    obj.layout92:setAlign("left");
    obj.layout92:setName("layout92");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout92);
    obj.edit29:setField("fldHabValor13");
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setMax(99);
    obj.edit29:setName("edit29");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout82);
    obj.dataLink62:setField("fldHabValor13");
    obj.dataLink62:setDefaultValue("0");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout82);
    obj.dataLink63:setField("fldCBHab13");
    obj.dataLink63:setDefaultValue("N");
    obj.dataLink63:setName("dataLink63");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout81);
    obj.layout93:setName("layout93");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout93);
    obj.layout94:setName("layout94");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout94);
    obj.comboBox6:setField("fldCBHab02");
    obj.comboBox6:setItems({' ', '♞', '⨉'});
    obj.comboBox6:setValues({'N', 'C', 'X'});
    obj.comboBox6:setValue("N");
    obj.comboBox6:setName("comboBox6");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout94);
    obj.edit30:setField("fldHab02");
    obj.edit30:setName("edit30");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setAlign("left");
    obj.layout95:setName("layout95");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout95);
    obj.edit31:setField("fldHabValor02");
    obj.edit31:setType("number");
    obj.edit31:setMin(0);
    obj.edit31:setMax(99);
    obj.edit31:setName("edit31");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout93);
    obj.dataLink64:setField("fldHabValor02");
    obj.dataLink64:setDefaultValue("0");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout93);
    obj.dataLink65:setField("fldCBHab02");
    obj.dataLink65:setDefaultValue("N");
    obj.dataLink65:setName("dataLink65");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout93);
    obj.layout96:setName("layout96");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout96);
    obj.comboBox7:setField("fldCBHab05");
    obj.comboBox7:setItems({' ', '♞', '⨉'});
    obj.comboBox7:setValues({'N', 'C', 'X'});
    obj.comboBox7:setValue("N");
    obj.comboBox7:setName("comboBox7");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout96);
    obj.edit32:setField("fldHab05");
    obj.edit32:setName("edit32");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout96);
    obj.layout97:setAlign("left");
    obj.layout97:setName("layout97");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout97);
    obj.edit33:setField("fldHabValor05");
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setMax(99);
    obj.edit33:setName("edit33");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout93);
    obj.dataLink66:setField("fldHabValor05");
    obj.dataLink66:setDefaultValue("0");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout93);
    obj.dataLink67:setField("fldCBHab05");
    obj.dataLink67:setDefaultValue("N");
    obj.dataLink67:setName("dataLink67");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout93);
    obj.layout98:setName("layout98");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout98);
    obj.comboBox8:setField("fldCBHab08");
    obj.comboBox8:setItems({' ', '♞', '⨉'});
    obj.comboBox8:setValues({'N', 'C', 'X'});
    obj.comboBox8:setValue("N");
    obj.comboBox8:setName("comboBox8");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout98);
    obj.edit34:setField("fldHab08");
    obj.edit34:setName("edit34");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout98);
    obj.layout99:setAlign("left");
    obj.layout99:setName("layout99");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout99);
    obj.edit35:setField("fldHabValor08");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setMax(99);
    obj.edit35:setName("edit35");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout93);
    obj.dataLink68:setField("fldHabValor08");
    obj.dataLink68:setDefaultValue("0");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout93);
    obj.dataLink69:setField("fldCBHab08");
    obj.dataLink69:setDefaultValue("N");
    obj.dataLink69:setName("dataLink69");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout93);
    obj.layout100:setName("layout100");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout100);
    obj.comboBox9:setField("fldCBHab11");
    obj.comboBox9:setItems({' ', '♞', '⨉'});
    obj.comboBox9:setValues({'N', 'C', 'X'});
    obj.comboBox9:setValue("C");
    obj.comboBox9:setName("comboBox9");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout100);
    obj.edit36:setField("fldHab11");
    obj.edit36:setName("edit36");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout100);
    obj.layout101:setAlign("left");
    obj.layout101:setName("layout101");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout101);
    obj.edit37:setField("fldHabValor11");
    obj.edit37:setType("number");
    obj.edit37:setMin(0);
    obj.edit37:setMax(99);
    obj.edit37:setName("edit37");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout93);
    obj.dataLink70:setField("fldHabValor11");
    obj.dataLink70:setDefaultValue("0");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout93);
    obj.dataLink71:setField("fldCBHab11");
    obj.dataLink71:setDefaultValue("C");
    obj.dataLink71:setName("dataLink71");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout93);
    obj.layout102:setName("layout102");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout102);
    obj.comboBox10:setField("fldCBHab14");
    obj.comboBox10:setItems({' ', '♞', '⨉'});
    obj.comboBox10:setValues({'N', 'C', 'X'});
    obj.comboBox10:setValue("N");
    obj.comboBox10:setName("comboBox10");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout102);
    obj.edit38:setField("fldHab14");
    obj.edit38:setName("edit38");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout102);
    obj.layout103:setAlign("left");
    obj.layout103:setName("layout103");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout103);
    obj.edit39:setField("fldHabValor14");
    obj.edit39:setType("number");
    obj.edit39:setMin(0);
    obj.edit39:setMax(99);
    obj.edit39:setName("edit39");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout93);
    obj.dataLink72:setField("fldHabValor14");
    obj.dataLink72:setDefaultValue("0");
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout93);
    obj.dataLink73:setField("fldCBHab14");
    obj.dataLink73:setDefaultValue("N");
    obj.dataLink73:setName("dataLink73");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout81);
    obj.layout104:setName("layout104");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout104);
    obj.layout105:setName("layout105");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout105);
    obj.comboBox11:setField("fldCBHab03");
    obj.comboBox11:setItems({' ', '♞', '⨉'});
    obj.comboBox11:setValues({'N', 'C', 'X'});
    obj.comboBox11:setValue("C");
    obj.comboBox11:setName("comboBox11");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout105);
    obj.edit40:setField("fldHab03");
    obj.edit40:setName("edit40");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setAlign("left");
    obj.layout106:setName("layout106");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout106);
    obj.edit41:setField("fldHabValor03");
    obj.edit41:setType("number");
    obj.edit41:setMin(0);
    obj.edit41:setMax(99);
    obj.edit41:setName("edit41");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout104);
    obj.dataLink74:setField("fldHabValor03");
    obj.dataLink74:setDefaultValue("0");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout104);
    obj.dataLink75:setField("fldCBHab03");
    obj.dataLink75:setDefaultValue("C");
    obj.dataLink75:setName("dataLink75");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout104);
    obj.layout107:setName("layout107");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout107);
    obj.comboBox12:setField("fldCBHab06");
    obj.comboBox12:setItems({' ', '♞', '⨉'});
    obj.comboBox12:setValues({'N', 'C', 'X'});
    obj.comboBox12:setValue("C");
    obj.comboBox12:setName("comboBox12");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout107);
    obj.edit42:setField("fldHab06");
    obj.edit42:setName("edit42");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setAlign("left");
    obj.layout108:setName("layout108");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout108);
    obj.edit43:setField("fldHabValor06");
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setMax(99);
    obj.edit43:setName("edit43");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout104);
    obj.dataLink76:setField("fldHabValor06");
    obj.dataLink76:setDefaultValue("0");
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout104);
    obj.dataLink77:setField("fldCBHab06");
    obj.dataLink77:setDefaultValue("C");
    obj.dataLink77:setName("dataLink77");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout104);
    obj.layout109:setName("layout109");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout109);
    obj.comboBox13:setField("fldCBHab09");
    obj.comboBox13:setItems({' ', '♞', '⨉'});
    obj.comboBox13:setValues({'N', 'C', 'X'});
    obj.comboBox13:setValue("N");
    obj.comboBox13:setName("comboBox13");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout109);
    obj.edit44:setField("fldHab09");
    obj.edit44:setName("edit44");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout109);
    obj.layout110:setAlign("left");
    obj.layout110:setName("layout110");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout110);
    obj.edit45:setField("fldHabValor09");
    obj.edit45:setType("number");
    obj.edit45:setMin(0);
    obj.edit45:setMax(99);
    obj.edit45:setName("edit45");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout104);
    obj.dataLink78:setField("fldHabValor09");
    obj.dataLink78:setDefaultValue("0");
    obj.dataLink78:setName("dataLink78");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout104);
    obj.dataLink79:setField("fldCBHab09");
    obj.dataLink79:setDefaultValue("N");
    obj.dataLink79:setName("dataLink79");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout104);
    obj.layout111:setName("layout111");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout111);
    obj.comboBox14:setField("fldCBHab12");
    obj.comboBox14:setItems({' ', '♞', '⨉'});
    obj.comboBox14:setValues({'N', 'C', 'X'});
    obj.comboBox14:setValue("N");
    obj.comboBox14:setName("comboBox14");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout111);
    obj.edit46:setField("fldHab12");
    obj.edit46:setName("edit46");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout111);
    obj.layout112:setAlign("left");
    obj.layout112:setName("layout112");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout112);
    obj.edit47:setField("fldHabValor12");
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setMax(99);
    obj.edit47:setName("edit47");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout104);
    obj.dataLink80:setField("fldHabValor12");
    obj.dataLink80:setDefaultValue("0");
    obj.dataLink80:setName("dataLink80");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout104);
    obj.dataLink81:setField("fldCBHab12");
    obj.dataLink81:setDefaultValue("N");
    obj.dataLink81:setName("dataLink81");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout104);
    obj.layout113:setName("layout113");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout113);
    obj.comboBox15:setField("fldCBHab15");
    obj.comboBox15:setItems({' ', '♞', '⨉'});
    obj.comboBox15:setValues({'N', 'C', 'X'});
    obj.comboBox15:setValue("N");
    obj.comboBox15:setName("comboBox15");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout113);
    obj.edit48:setField("fldHab15");
    obj.edit48:setName("edit48");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setAlign("left");
    obj.layout114:setName("layout114");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout114);
    obj.edit49:setField("fldHabValor15");
    obj.edit49:setType("number");
    obj.edit49:setMin(0);
    obj.edit49:setMax(99);
    obj.edit49:setName("edit49");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout104);
    obj.dataLink82:setField("fldHabValor15");
    obj.dataLink82:setDefaultValue("0");
    obj.dataLink82:setName("dataLink82");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout104);
    obj.dataLink83:setField("fldCBHab15");
    obj.dataLink83:setDefaultValue("N");
    obj.dataLink83:setName("dataLink83");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(320);
    obj.layout115:setMargins({left = 40, top = 25});
    obj.layout115:setName("layout115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout115);
    obj.layout116:setName("layout116");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout116);
    obj.layout117:setName("layout117");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout117);
    obj.comboBox16:setField("fldCBHab16");
    obj.comboBox16:setItems({' ', '♞', '⨉'});
    obj.comboBox16:setValues({'N', 'C', 'X'});
    obj.comboBox16:setValue("N");
    obj.comboBox16:setName("comboBox16");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout117);
    obj.edit50:setField("fldHab16");
    obj.edit50:setName("edit50");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout117);
    obj.layout118:setAlign("left");
    obj.layout118:setName("layout118");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout118);
    obj.edit51:setField("fldHabValor16");
    obj.edit51:setType("number");
    obj.edit51:setMin(0);
    obj.edit51:setMax(99);
    obj.edit51:setName("edit51");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout116);
    obj.dataLink84:setField("fldHabValor16");
    obj.dataLink84:setDefaultValue("0");
    obj.dataLink84:setName("dataLink84");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout116);
    obj.dataLink85:setField("fldCBHab16");
    obj.dataLink85:setDefaultValue("N");
    obj.dataLink85:setName("dataLink85");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout116);
    obj.layout119:setName("layout119");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout119);
    obj.comboBox17:setField("fldCBHab19");
    obj.comboBox17:setItems({' ', '♞', '⨉'});
    obj.comboBox17:setValues({'N', 'C', 'X'});
    obj.comboBox17:setValue("C");
    obj.comboBox17:setName("comboBox17");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout119);
    obj.edit52:setField("fldHab19");
    obj.edit52:setName("edit52");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout119);
    obj.layout120:setAlign("left");
    obj.layout120:setName("layout120");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout120);
    obj.edit53:setField("fldHabValor19");
    obj.edit53:setType("number");
    obj.edit53:setMin(0);
    obj.edit53:setMax(99);
    obj.edit53:setName("edit53");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout116);
    obj.dataLink86:setField("fldHabValor19");
    obj.dataLink86:setDefaultValue("0");
    obj.dataLink86:setName("dataLink86");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout116);
    obj.dataLink87:setField("fldCBHab19");
    obj.dataLink87:setDefaultValue("C");
    obj.dataLink87:setName("dataLink87");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout116);
    obj.layout121:setName("layout121");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout121);
    obj.comboBox18:setField("fldCBHab22");
    obj.comboBox18:setItems({' ', '♞', '⨉'});
    obj.comboBox18:setValues({'N', 'C', 'X'});
    obj.comboBox18:setValue("C");
    obj.comboBox18:setName("comboBox18");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout121);
    obj.edit54:setField("fldHab22");
    obj.edit54:setName("edit54");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout121);
    obj.layout122:setAlign("left");
    obj.layout122:setName("layout122");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout122);
    obj.edit55:setField("fldHabValor22");
    obj.edit55:setType("number");
    obj.edit55:setMin(0);
    obj.edit55:setMax(99);
    obj.edit55:setName("edit55");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout116);
    obj.dataLink88:setField("fldHabValor22");
    obj.dataLink88:setDefaultValue("0");
    obj.dataLink88:setName("dataLink88");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout116);
    obj.dataLink89:setField("fldCBHab22");
    obj.dataLink89:setDefaultValue("C");
    obj.dataLink89:setName("dataLink89");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout116);
    obj.layout123:setName("layout123");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout123);
    obj.comboBox19:setField("fldCBHab25");
    obj.comboBox19:setItems({' ', '♞', '⨉'});
    obj.comboBox19:setValues({'N', 'C', 'X'});
    obj.comboBox19:setValue("N");
    obj.comboBox19:setName("comboBox19");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout123);
    obj.edit56:setField("fldHab25");
    obj.edit56:setName("edit56");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout123);
    obj.layout124:setAlign("left");
    obj.layout124:setName("layout124");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout124);
    obj.edit57:setField("fldHabValor25");
    obj.edit57:setType("number");
    obj.edit57:setMin(0);
    obj.edit57:setMax(99);
    obj.edit57:setName("edit57");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout116);
    obj.dataLink90:setField("fldHabValor25");
    obj.dataLink90:setDefaultValue("0");
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout116);
    obj.dataLink91:setField("fldCBHab25");
    obj.dataLink91:setDefaultValue("N");
    obj.dataLink91:setName("dataLink91");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout116);
    obj.layout125:setName("layout125");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout125);
    obj.comboBox20:setField("fldCBHab28");
    obj.comboBox20:setItems({' ', '♞', '⨉'});
    obj.comboBox20:setValues({'N', 'C', 'X'});
    obj.comboBox20:setValue("N");
    obj.comboBox20:setName("comboBox20");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout125);
    obj.edit58:setField("fldHab28");
    obj.edit58:setName("edit58");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout125);
    obj.layout126:setAlign("left");
    obj.layout126:setName("layout126");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout126);
    obj.edit59:setField("fldHabValor28");
    obj.edit59:setType("number");
    obj.edit59:setMin(0);
    obj.edit59:setMax(99);
    obj.edit59:setName("edit59");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout116);
    obj.dataLink92:setField("fldHabValor28");
    obj.dataLink92:setDefaultValue("0");
    obj.dataLink92:setName("dataLink92");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout116);
    obj.dataLink93:setField("fldCBHab28");
    obj.dataLink93:setDefaultValue("N");
    obj.dataLink93:setName("dataLink93");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout116);
    obj.layout127:setName("layout127");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout127);
    obj.comboBox21:setField("fldCBHab31");
    obj.comboBox21:setItems({' ', '♞', '⨉'});
    obj.comboBox21:setValues({'N', 'C', 'X'});
    obj.comboBox21:setValue("N");
    obj.comboBox21:setName("comboBox21");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout127);
    obj.edit60:setField("fldHab31");
    obj.edit60:setName("edit60");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout127);
    obj.layout128:setAlign("left");
    obj.layout128:setName("layout128");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout128);
    obj.edit61:setField("fldHabValor31");
    obj.edit61:setType("number");
    obj.edit61:setMin(0);
    obj.edit61:setMax(99);
    obj.edit61:setName("edit61");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout116);
    obj.dataLink94:setField("fldHabValor31");
    obj.dataLink94:setDefaultValue("0");
    obj.dataLink94:setName("dataLink94");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout116);
    obj.dataLink95:setField("fldCBHab31");
    obj.dataLink95:setDefaultValue("N");
    obj.dataLink95:setName("dataLink95");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout116);
    obj.layout129:setName("layout129");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout129);
    obj.comboBox22:setField("fldCBHab34");
    obj.comboBox22:setItems({' ', '♞', '⨉'});
    obj.comboBox22:setValues({'N', 'C', 'X'});
    obj.comboBox22:setValue("N");
    obj.comboBox22:setName("comboBox22");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout129);
    obj.edit62:setField("fldHab34");
    obj.edit62:setName("edit62");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout129);
    obj.layout130:setAlign("left");
    obj.layout130:setName("layout130");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout130);
    obj.edit63:setField("fldHabValor34");
    obj.edit63:setType("number");
    obj.edit63:setMin(0);
    obj.edit63:setMax(99);
    obj.edit63:setName("edit63");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout116);
    obj.dataLink96:setField("fldHabValor34");
    obj.dataLink96:setDefaultValue("0");
    obj.dataLink96:setName("dataLink96");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout116);
    obj.dataLink97:setField("fldCBHab34");
    obj.dataLink97:setDefaultValue("N");
    obj.dataLink97:setName("dataLink97");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout116);
    obj.layout131:setName("layout131");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout131);
    obj.comboBox23:setField("fldCBHab37");
    obj.comboBox23:setItems({' ', '♞', '⨉'});
    obj.comboBox23:setValues({'N', 'C', 'X'});
    obj.comboBox23:setValue("C");
    obj.comboBox23:setName("comboBox23");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout131);
    obj.edit64:setField("fldHab37");
    obj.edit64:setName("edit64");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout131);
    obj.layout132:setAlign("left");
    obj.layout132:setName("layout132");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout132);
    obj.edit65:setField("fldHabValor37");
    obj.edit65:setType("number");
    obj.edit65:setMin(0);
    obj.edit65:setMax(99);
    obj.edit65:setName("edit65");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout116);
    obj.dataLink98:setField("fldHabValor37");
    obj.dataLink98:setDefaultValue("0");
    obj.dataLink98:setName("dataLink98");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout116);
    obj.dataLink99:setField("fldCBHab37");
    obj.dataLink99:setDefaultValue("C");
    obj.dataLink99:setName("dataLink99");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout116);
    obj.layout133:setName("layout133");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout133);
    obj.comboBox24:setField("fldCBHab40");
    obj.comboBox24:setItems({' ', '♞', '⨉'});
    obj.comboBox24:setValues({'N', 'C', 'X'});
    obj.comboBox24:setValue("N");
    obj.comboBox24:setName("comboBox24");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout133);
    obj.edit66:setField("fldHab40");
    obj.edit66:setName("edit66");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout133);
    obj.layout134:setAlign("left");
    obj.layout134:setName("layout134");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout134);
    obj.edit67:setField("fldHabValor40");
    obj.edit67:setType("number");
    obj.edit67:setMin(0);
    obj.edit67:setMax(99);
    obj.edit67:setName("edit67");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout116);
    obj.dataLink100:setField("fldHabValor40");
    obj.dataLink100:setDefaultValue("0");
    obj.dataLink100:setName("dataLink100");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout116);
    obj.dataLink101:setField("fldCBHab40");
    obj.dataLink101:setDefaultValue("N");
    obj.dataLink101:setName("dataLink101");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout116);
    obj.layout135:setName("layout135");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout135);
    obj.comboBox25:setField("fldCBHab43");
    obj.comboBox25:setItems({' ', '♞', '⨉'});
    obj.comboBox25:setValues({'N', 'C', 'X'});
    obj.comboBox25:setValue("N");
    obj.comboBox25:setName("comboBox25");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout135);
    obj.edit68:setField("fldHab43");
    obj.edit68:setName("edit68");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout135);
    obj.layout136:setAlign("left");
    obj.layout136:setName("layout136");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout136);
    obj.edit69:setField("fldHabValor43");
    obj.edit69:setType("number");
    obj.edit69:setMin(0);
    obj.edit69:setMax(99);
    obj.edit69:setName("edit69");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout116);
    obj.dataLink102:setField("fldHabValor43");
    obj.dataLink102:setDefaultValue("0");
    obj.dataLink102:setName("dataLink102");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout116);
    obj.dataLink103:setField("fldCBHab43");
    obj.dataLink103:setDefaultValue("N");
    obj.dataLink103:setName("dataLink103");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout115);
    obj.layout137:setName("layout137");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout137);
    obj.layout138:setName("layout138");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout138);
    obj.comboBox26:setField("fldCBHab17");
    obj.comboBox26:setItems({' ', '♞', '⨉'});
    obj.comboBox26:setValues({'N', 'C', 'X'});
    obj.comboBox26:setValue("C");
    obj.comboBox26:setName("comboBox26");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout138);
    obj.edit70:setField("fldHab17");
    obj.edit70:setName("edit70");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout138);
    obj.layout139:setAlign("left");
    obj.layout139:setName("layout139");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout139);
    obj.edit71:setField("fldHabValor17");
    obj.edit71:setType("number");
    obj.edit71:setMin(0);
    obj.edit71:setMax(99);
    obj.edit71:setName("edit71");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout137);
    obj.dataLink104:setField("fldHabValor17");
    obj.dataLink104:setDefaultValue("0");
    obj.dataLink104:setName("dataLink104");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout137);
    obj.dataLink105:setField("fldCBHab17");
    obj.dataLink105:setDefaultValue("C");
    obj.dataLink105:setName("dataLink105");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout137);
    obj.layout140:setName("layout140");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout140);
    obj.comboBox27:setField("fldCBHab20");
    obj.comboBox27:setItems({' ', '♞', '⨉'});
    obj.comboBox27:setValues({'N', 'C', 'X'});
    obj.comboBox27:setValue("X");
    obj.comboBox27:setName("comboBox27");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout140);
    obj.edit72:setField("fldHab20");
    obj.edit72:setName("edit72");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout140);
    obj.layout141:setAlign("left");
    obj.layout141:setName("layout141");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout141);
    obj.edit73:setField("fldHabValor20");
    obj.edit73:setType("number");
    obj.edit73:setMin(0);
    obj.edit73:setMax(99);
    obj.edit73:setName("edit73");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout137);
    obj.dataLink106:setField("fldHabValor20");
    obj.dataLink106:setDefaultValue("0");
    obj.dataLink106:setName("dataLink106");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout137);
    obj.dataLink107:setField("fldCBHab20");
    obj.dataLink107:setDefaultValue("X");
    obj.dataLink107:setName("dataLink107");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout137);
    obj.layout142:setName("layout142");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout142);
    obj.comboBox28:setField("fldCBHab23");
    obj.comboBox28:setItems({' ', '♞', '⨉'});
    obj.comboBox28:setValues({'N', 'C', 'X'});
    obj.comboBox28:setValue("N");
    obj.comboBox28:setName("comboBox28");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout142);
    obj.edit74:setField("fldHab23");
    obj.edit74:setName("edit74");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout142);
    obj.layout143:setAlign("left");
    obj.layout143:setName("layout143");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout143);
    obj.edit75:setField("fldHabValor23");
    obj.edit75:setType("number");
    obj.edit75:setMin(0);
    obj.edit75:setMax(99);
    obj.edit75:setName("edit75");

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout137);
    obj.dataLink108:setField("fldHabValor23");
    obj.dataLink108:setDefaultValue("0");
    obj.dataLink108:setName("dataLink108");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout137);
    obj.dataLink109:setField("fldCBHab23");
    obj.dataLink109:setDefaultValue("N");
    obj.dataLink109:setName("dataLink109");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout137);
    obj.layout144:setName("layout144");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout144);
    obj.comboBox29:setField("fldCBHab26");
    obj.comboBox29:setItems({' ', '♞', '⨉'});
    obj.comboBox29:setValues({'N', 'C', 'X'});
    obj.comboBox29:setValue("N");
    obj.comboBox29:setName("comboBox29");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout144);
    obj.edit76:setField("fldHab26");
    obj.edit76:setName("edit76");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout144);
    obj.layout145:setAlign("left");
    obj.layout145:setName("layout145");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout145);
    obj.edit77:setField("fldHabValor26");
    obj.edit77:setType("number");
    obj.edit77:setMin(0);
    obj.edit77:setMax(99);
    obj.edit77:setName("edit77");

    obj.dataLink110 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout137);
    obj.dataLink110:setField("fldHabValor26");
    obj.dataLink110:setDefaultValue("0");
    obj.dataLink110:setName("dataLink110");

    obj.dataLink111 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout137);
    obj.dataLink111:setField("fldCBHab26");
    obj.dataLink111:setDefaultValue("N");
    obj.dataLink111:setName("dataLink111");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout137);
    obj.layout146:setName("layout146");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout146);
    obj.comboBox30:setField("fldCBHab29");
    obj.comboBox30:setItems({' ', '♞', '⨉'});
    obj.comboBox30:setValues({'N', 'C', 'X'});
    obj.comboBox30:setValue("N");
    obj.comboBox30:setName("comboBox30");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout146);
    obj.edit78:setField("fldHab29");
    obj.edit78:setName("edit78");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout146);
    obj.layout147:setAlign("left");
    obj.layout147:setName("layout147");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout147);
    obj.edit79:setField("fldHabValor29");
    obj.edit79:setType("number");
    obj.edit79:setMin(0);
    obj.edit79:setMax(99);
    obj.edit79:setName("edit79");

    obj.dataLink112 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout137);
    obj.dataLink112:setField("fldHabValor29");
    obj.dataLink112:setDefaultValue("0");
    obj.dataLink112:setName("dataLink112");

    obj.dataLink113 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout137);
    obj.dataLink113:setField("fldCBHab29");
    obj.dataLink113:setDefaultValue("N");
    obj.dataLink113:setName("dataLink113");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout137);
    obj.layout148:setName("layout148");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout148);
    obj.comboBox31:setField("fldCBHab32");
    obj.comboBox31:setItems({' ', '♞', '⨉'});
    obj.comboBox31:setValues({'N', 'C', 'X'});
    obj.comboBox31:setValue("X");
    obj.comboBox31:setName("comboBox31");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout148);
    obj.edit80:setField("fldHab32");
    obj.edit80:setName("edit80");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout148);
    obj.layout149:setAlign("left");
    obj.layout149:setName("layout149");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout149);
    obj.edit81:setField("fldHabValor32");
    obj.edit81:setType("number");
    obj.edit81:setMin(0);
    obj.edit81:setMax(99);
    obj.edit81:setName("edit81");

    obj.dataLink114 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout137);
    obj.dataLink114:setField("fldHabValor32");
    obj.dataLink114:setDefaultValue("0");
    obj.dataLink114:setName("dataLink114");

    obj.dataLink115 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.layout137);
    obj.dataLink115:setField("fldCBHab32");
    obj.dataLink115:setDefaultValue("X");
    obj.dataLink115:setName("dataLink115");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout137);
    obj.layout150:setName("layout150");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout150);
    obj.comboBox32:setField("fldCBHab35");
    obj.comboBox32:setItems({' ', '♞', '⨉'});
    obj.comboBox32:setValues({'N', 'C', 'X'});
    obj.comboBox32:setValue("X");
    obj.comboBox32:setName("comboBox32");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout150);
    obj.edit82:setField("fldHab35");
    obj.edit82:setName("edit82");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout150);
    obj.layout151:setAlign("left");
    obj.layout151:setName("layout151");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout151);
    obj.edit83:setField("fldHabValor35");
    obj.edit83:setType("number");
    obj.edit83:setMin(0);
    obj.edit83:setMax(99);
    obj.edit83:setName("edit83");

    obj.dataLink116 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout137);
    obj.dataLink116:setField("fldHabValor35");
    obj.dataLink116:setDefaultValue("0");
    obj.dataLink116:setName("dataLink116");

    obj.dataLink117 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout137);
    obj.dataLink117:setField("fldCBHab35");
    obj.dataLink117:setDefaultValue("X");
    obj.dataLink117:setName("dataLink117");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout137);
    obj.layout152:setName("layout152");

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout152);
    obj.comboBox33:setField("fldCBHab38");
    obj.comboBox33:setItems({' ', '♞', '⨉'});
    obj.comboBox33:setValues({'N', 'C', 'X'});
    obj.comboBox33:setValue("N");
    obj.comboBox33:setName("comboBox33");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout152);
    obj.edit84:setField("fldHab38");
    obj.edit84:setName("edit84");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout152);
    obj.layout153:setAlign("left");
    obj.layout153:setName("layout153");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout153);
    obj.edit85:setField("fldHabValor38");
    obj.edit85:setType("number");
    obj.edit85:setMin(0);
    obj.edit85:setMax(99);
    obj.edit85:setName("edit85");

    obj.dataLink118 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout137);
    obj.dataLink118:setField("fldHabValor38");
    obj.dataLink118:setDefaultValue("0");
    obj.dataLink118:setName("dataLink118");

    obj.dataLink119 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout137);
    obj.dataLink119:setField("fldCBHab38");
    obj.dataLink119:setDefaultValue("N");
    obj.dataLink119:setName("dataLink119");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout137);
    obj.layout154:setName("layout154");

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout154);
    obj.comboBox34:setField("fldCBHab41");
    obj.comboBox34:setItems({' ', '♞', '⨉'});
    obj.comboBox34:setValues({'N', 'C', 'X'});
    obj.comboBox34:setValue("N");
    obj.comboBox34:setName("comboBox34");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout154);
    obj.edit86:setField("fldHab41");
    obj.edit86:setName("edit86");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout154);
    obj.layout155:setAlign("left");
    obj.layout155:setName("layout155");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout155);
    obj.edit87:setField("fldHabValor41");
    obj.edit87:setType("number");
    obj.edit87:setMin(0);
    obj.edit87:setMax(99);
    obj.edit87:setName("edit87");

    obj.dataLink120 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout137);
    obj.dataLink120:setField("fldHabValor41");
    obj.dataLink120:setDefaultValue("0");
    obj.dataLink120:setName("dataLink120");

    obj.dataLink121 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout137);
    obj.dataLink121:setField("fldCBHab41");
    obj.dataLink121:setDefaultValue("N");
    obj.dataLink121:setName("dataLink121");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout137);
    obj.layout156:setName("layout156");

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout156);
    obj.comboBox35:setField("fldCBHab44");
    obj.comboBox35:setItems({' ', '♞', '⨉'});
    obj.comboBox35:setValues({'N', 'C', 'X'});
    obj.comboBox35:setValue("N");
    obj.comboBox35:setName("comboBox35");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout156);
    obj.edit88:setField("fldHab44");
    obj.edit88:setName("edit88");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout156);
    obj.layout157:setAlign("left");
    obj.layout157:setName("layout157");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout157);
    obj.edit89:setField("fldHabValor44");
    obj.edit89:setType("number");
    obj.edit89:setMin(0);
    obj.edit89:setMax(99);
    obj.edit89:setName("edit89");

    obj.dataLink122 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout137);
    obj.dataLink122:setField("fldHabValor44");
    obj.dataLink122:setDefaultValue("0");
    obj.dataLink122:setName("dataLink122");

    obj.dataLink123 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink123:setParent(obj.layout137);
    obj.dataLink123:setField("fldCBHab44");
    obj.dataLink123:setDefaultValue("N");
    obj.dataLink123:setName("dataLink123");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout115);
    obj.layout158:setName("layout158");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout158);
    obj.layout159:setName("layout159");

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout159);
    obj.comboBox36:setField("fldCBHab18");
    obj.comboBox36:setItems({' ', '♞', '⨉'});
    obj.comboBox36:setValues({'N', 'C', 'X'});
    obj.comboBox36:setValue("N");
    obj.comboBox36:setName("comboBox36");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout159);
    obj.edit90:setField("fldHab18");
    obj.edit90:setName("edit90");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout159);
    obj.layout160:setAlign("left");
    obj.layout160:setName("layout160");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout160);
    obj.edit91:setField("fldHabValor18");
    obj.edit91:setType("number");
    obj.edit91:setMin(0);
    obj.edit91:setMax(99);
    obj.edit91:setName("edit91");

    obj.dataLink124 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink124:setParent(obj.layout158);
    obj.dataLink124:setField("fldHabValor18");
    obj.dataLink124:setDefaultValue("0");
    obj.dataLink124:setName("dataLink124");

    obj.dataLink125 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink125:setParent(obj.layout158);
    obj.dataLink125:setField("fldCBHab18");
    obj.dataLink125:setDefaultValue("N");
    obj.dataLink125:setName("dataLink125");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout158);
    obj.layout161:setName("layout161");

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout161);
    obj.comboBox37:setField("fldCBHab21");
    obj.comboBox37:setItems({' ', '♞', '⨉'});
    obj.comboBox37:setValues({'N', 'C', 'X'});
    obj.comboBox37:setValue("N");
    obj.comboBox37:setName("comboBox37");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout161);
    obj.edit92:setField("fldHab21");
    obj.edit92:setName("edit92");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout161);
    obj.layout162:setAlign("left");
    obj.layout162:setName("layout162");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout162);
    obj.edit93:setField("fldHabValor21");
    obj.edit93:setType("number");
    obj.edit93:setMin(0);
    obj.edit93:setMax(99);
    obj.edit93:setName("edit93");

    obj.dataLink126 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink126:setParent(obj.layout158);
    obj.dataLink126:setField("fldHabValor21");
    obj.dataLink126:setDefaultValue("0");
    obj.dataLink126:setName("dataLink126");

    obj.dataLink127 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink127:setParent(obj.layout158);
    obj.dataLink127:setField("fldCBHab21");
    obj.dataLink127:setDefaultValue("N");
    obj.dataLink127:setName("dataLink127");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout158);
    obj.layout163:setName("layout163");

    obj.comboBox38 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout163);
    obj.comboBox38:setField("fldCBHab24");
    obj.comboBox38:setItems({' ', '♞', '⨉'});
    obj.comboBox38:setValues({'N', 'C', 'X'});
    obj.comboBox38:setValue("N");
    obj.comboBox38:setName("comboBox38");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout163);
    obj.edit94:setField("fldHab24");
    obj.edit94:setName("edit94");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout163);
    obj.layout164:setAlign("left");
    obj.layout164:setName("layout164");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout164);
    obj.edit95:setField("fldHabValor24");
    obj.edit95:setType("number");
    obj.edit95:setMin(0);
    obj.edit95:setMax(99);
    obj.edit95:setName("edit95");

    obj.dataLink128 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink128:setParent(obj.layout158);
    obj.dataLink128:setField("fldHabValor24");
    obj.dataLink128:setDefaultValue("0");
    obj.dataLink128:setName("dataLink128");

    obj.dataLink129 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink129:setParent(obj.layout158);
    obj.dataLink129:setField("fldCBHab24");
    obj.dataLink129:setDefaultValue("N");
    obj.dataLink129:setName("dataLink129");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout158);
    obj.layout165:setName("layout165");

    obj.comboBox39 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout165);
    obj.comboBox39:setField("fldCBHab27");
    obj.comboBox39:setItems({' ', '♞', '⨉'});
    obj.comboBox39:setValues({'N', 'C', 'X'});
    obj.comboBox39:setValue("N");
    obj.comboBox39:setName("comboBox39");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout165);
    obj.edit96:setField("fldHab27");
    obj.edit96:setName("edit96");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout165);
    obj.layout166:setAlign("left");
    obj.layout166:setName("layout166");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout166);
    obj.edit97:setField("fldHabValor27");
    obj.edit97:setType("number");
    obj.edit97:setMin(0);
    obj.edit97:setMax(99);
    obj.edit97:setName("edit97");

    obj.dataLink130 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink130:setParent(obj.layout158);
    obj.dataLink130:setField("fldHabValor27");
    obj.dataLink130:setDefaultValue("0");
    obj.dataLink130:setName("dataLink130");

    obj.dataLink131 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink131:setParent(obj.layout158);
    obj.dataLink131:setField("fldCBHab27");
    obj.dataLink131:setDefaultValue("N");
    obj.dataLink131:setName("dataLink131");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout158);
    obj.layout167:setName("layout167");

    obj.comboBox40 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout167);
    obj.comboBox40:setField("fldCBHab30");
    obj.comboBox40:setItems({' ', '♞', '⨉'});
    obj.comboBox40:setValues({'N', 'C', 'X'});
    obj.comboBox40:setValue("N");
    obj.comboBox40:setName("comboBox40");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout167);
    obj.edit98:setField("fldHab30");
    obj.edit98:setName("edit98");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout167);
    obj.layout168:setAlign("left");
    obj.layout168:setName("layout168");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout168);
    obj.edit99:setField("fldHabValor30");
    obj.edit99:setType("number");
    obj.edit99:setMin(0);
    obj.edit99:setMax(99);
    obj.edit99:setName("edit99");

    obj.dataLink132 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink132:setParent(obj.layout158);
    obj.dataLink132:setField("fldHabValor30");
    obj.dataLink132:setDefaultValue("0");
    obj.dataLink132:setName("dataLink132");

    obj.dataLink133 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink133:setParent(obj.layout158);
    obj.dataLink133:setField("fldCBHab30");
    obj.dataLink133:setDefaultValue("N");
    obj.dataLink133:setName("dataLink133");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout158);
    obj.layout169:setName("layout169");

    obj.comboBox41 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout169);
    obj.comboBox41:setField("fldCBHab33");
    obj.comboBox41:setItems({' ', '♞', '⨉'});
    obj.comboBox41:setValues({'N', 'C', 'X'});
    obj.comboBox41:setValue("N");
    obj.comboBox41:setName("comboBox41");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout169);
    obj.edit100:setField("fldHab33");
    obj.edit100:setName("edit100");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout169);
    obj.layout170:setAlign("left");
    obj.layout170:setName("layout170");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout170);
    obj.edit101:setField("fldHabValor33");
    obj.edit101:setType("number");
    obj.edit101:setMin(0);
    obj.edit101:setMax(99);
    obj.edit101:setName("edit101");

    obj.dataLink134 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink134:setParent(obj.layout158);
    obj.dataLink134:setField("fldHabValor33");
    obj.dataLink134:setDefaultValue("0");
    obj.dataLink134:setName("dataLink134");

    obj.dataLink135 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink135:setParent(obj.layout158);
    obj.dataLink135:setField("fldCBHab33");
    obj.dataLink135:setDefaultValue("N");
    obj.dataLink135:setName("dataLink135");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout158);
    obj.layout171:setName("layout171");

    obj.comboBox42 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout171);
    obj.comboBox42:setField("fldCBHab36");
    obj.comboBox42:setItems({' ', '♞', '⨉'});
    obj.comboBox42:setValues({'N', 'C', 'X'});
    obj.comboBox42:setValue("N");
    obj.comboBox42:setName("comboBox42");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout171);
    obj.edit102:setField("fldHab36");
    obj.edit102:setName("edit102");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout171);
    obj.layout172:setAlign("left");
    obj.layout172:setName("layout172");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout172);
    obj.edit103:setField("fldHabValor36");
    obj.edit103:setType("number");
    obj.edit103:setMin(0);
    obj.edit103:setMax(99);
    obj.edit103:setName("edit103");

    obj.dataLink136 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink136:setParent(obj.layout158);
    obj.dataLink136:setField("fldHabValor36");
    obj.dataLink136:setDefaultValue("0");
    obj.dataLink136:setName("dataLink136");

    obj.dataLink137 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink137:setParent(obj.layout158);
    obj.dataLink137:setField("fldCBHab36");
    obj.dataLink137:setDefaultValue("N");
    obj.dataLink137:setName("dataLink137");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout158);
    obj.layout173:setName("layout173");

    obj.comboBox43 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout173);
    obj.comboBox43:setField("fldCBHab39");
    obj.comboBox43:setItems({' ', '♞', '⨉'});
    obj.comboBox43:setValues({'N', 'C', 'X'});
    obj.comboBox43:setValue("N");
    obj.comboBox43:setName("comboBox43");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout173);
    obj.edit104:setField("fldHab39");
    obj.edit104:setName("edit104");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout173);
    obj.layout174:setAlign("left");
    obj.layout174:setName("layout174");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout174);
    obj.edit105:setField("fldHabValor39");
    obj.edit105:setType("number");
    obj.edit105:setMin(0);
    obj.edit105:setMax(99);
    obj.edit105:setName("edit105");

    obj.dataLink138 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink138:setParent(obj.layout158);
    obj.dataLink138:setField("fldHabValor39");
    obj.dataLink138:setDefaultValue("0");
    obj.dataLink138:setName("dataLink138");

    obj.dataLink139 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink139:setParent(obj.layout158);
    obj.dataLink139:setField("fldCBHab39");
    obj.dataLink139:setDefaultValue("N");
    obj.dataLink139:setName("dataLink139");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout158);
    obj.layout175:setName("layout175");

    obj.comboBox44 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout175);
    obj.comboBox44:setField("fldCBHab42");
    obj.comboBox44:setItems({' ', '♞', '⨉'});
    obj.comboBox44:setValues({'N', 'C', 'X'});
    obj.comboBox44:setValue("N");
    obj.comboBox44:setName("comboBox44");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout175);
    obj.edit106:setField("fldHab42");
    obj.edit106:setName("edit106");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout175);
    obj.layout176:setAlign("left");
    obj.layout176:setName("layout176");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout176);
    obj.edit107:setField("fldHabValor42");
    obj.edit107:setType("number");
    obj.edit107:setMin(0);
    obj.edit107:setMax(99);
    obj.edit107:setName("edit107");

    obj.dataLink140 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink140:setParent(obj.layout158);
    obj.dataLink140:setField("fldHabValor42");
    obj.dataLink140:setDefaultValue("0");
    obj.dataLink140:setName("dataLink140");

    obj.dataLink141 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink141:setParent(obj.layout158);
    obj.dataLink141:setField("fldCBHab42");
    obj.dataLink141:setDefaultValue("N");
    obj.dataLink141:setName("dataLink141");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout158);
    obj.layout177:setName("layout177");

    obj.comboBox45 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox45:setParent(obj.layout177);
    obj.comboBox45:setField("fldCBHab45");
    obj.comboBox45:setItems({' ', '♞', '⨉'});
    obj.comboBox45:setValues({'N', 'C', 'X'});
    obj.comboBox45:setValue("N");
    obj.comboBox45:setName("comboBox45");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout177);
    obj.edit108:setField("fldHab45");
    obj.edit108:setName("edit108");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.layout177);
    obj.layout178:setAlign("left");
    obj.layout178:setName("layout178");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout178);
    obj.edit109:setField("fldHabValor45");
    obj.edit109:setType("number");
    obj.edit109:setMin(0);
    obj.edit109:setMax(99);
    obj.edit109:setName("edit109");

    obj.dataLink142 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink142:setParent(obj.layout158);
    obj.dataLink142:setField("fldHabValor45");
    obj.dataLink142:setDefaultValue("0");
    obj.dataLink142:setName("dataLink142");

    obj.dataLink143 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink143:setParent(obj.layout158);
    obj.dataLink143:setField("fldCBHab45");
    obj.dataLink143:setDefaultValue("N");
    obj.dataLink143:setName("dataLink143");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle1);
    obj.layout179:setAlign("top");
    obj.layout179:setHeight(20);
    obj.layout179:setMargins({left = 40});
    obj.layout179:setName("layout179");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout179);
    obj.label37:setAlign("left");
    obj.label37:setWidth(180);
    obj.label37:setText("UPGRADES POR GLÓRIA");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setFontColor("#cdcdcd");
    obj.label37:setFontFamily("Palatino Linotype");
    obj.label37:setFontSize(14);
    obj.label37:setName("label37");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout179);
    obj.edit110:setWidth(470);
    obj.edit110:setField("fldUpgradesGlor");
    obj.edit110:setAlign("left");
    obj.edit110:setFontColor("#858585");
    obj.edit110:setName("edit110");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle1);
    obj.layout180:setAlign("top");
    obj.layout180:setHeight(20);
    obj.layout180:setMargins({left = 40});
    obj.layout180:setName("layout180");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout180);
    obj.label38:setAlign("left");
    obj.label38:setWidth(180);
    obj.label38:setText("UPGRADES DE INVERNO");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontColor("#cdcdcd");
    obj.label38:setFontFamily("Palatino Linotype");
    obj.label38:setFontSize(14);
    obj.label38:setName("label38");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout180);
    obj.edit111:setWidth(470);
    obj.edit111:setField("fldUpgradesInv");
    obj.edit111:setAlign("left");
    obj.edit111:setFontColor("#858585");
    obj.edit111:setName("edit111");

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            if (sheet ~= nil) then CalcularGloriaAnual(); end;
        end, obj);

    obj._e_event1 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					sheet.fldTamanho = string.format("%02d", sheet.fldTamanho);
        end, obj);

    obj._e_event2 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					sheet.fldDestreza = string.format("%02d", sheet.fldDestreza);
        end, obj);

    obj._e_event3 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					sheet.fldForca = string.format("%02d", sheet.fldForca);
        end, obj);

    obj._e_event4 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					sheet.fldConstituicao = string.format("%02d", sheet.fldConstituicao);
        end, obj);

    obj._e_event5 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					sheet.fldAparencia = string.format("%02d", sheet.fldAparencia);
        end, obj);

    obj._e_event6 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            				local TAM = (tonumber(sheet.fldTamanho) or 0);
            				local DES = (tonumber(sheet.fldDestreza) or 0);
            				local FOR = (tonumber(sheet.fldForca) or 0);
            				local CON = (tonumber(sheet.fldConstituicao) or 0);
            				
            				sheet.fldDano = tostring(math.floor(((TAM+FOR)/6)+0.5)) .. "d6";
            				sheet.fldMovimento = math.floor(((DES+FOR)/10)+0.5); 
            				sheet.fldRegen = math.floor(((CON+FOR)/10)+0.5); 
            				sheet.fldHP = CON+TAM;
            				sheet.fldInconsciente = math.floor((CON+TAM/4)+0.5);
        end, obj);

    obj._e_event7 = obj.dataLink53:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            				if((tonumber(sheet.fldAparencia)) ~= 0) then
            					local APA = (tonumber(sheet.fldAparencia) or 0);
            					local DistinctFeature = 0;
            					
            					if (APA < 7) then DistinctFeature = 3;
            					elseif (APA > 6 and APA < 10) then DistinctFeature = 2; 
            					elseif (APA > 9 and APA < 13) then DistinctFeature = 1; 
            					elseif (APA > 12 and APA < 17) then DistinctFeature = 2; 
            					elseif (APA > 16) then DistinctFeature = 3; 
            					end;
            					
            					if(sheet.fldCarDistintiva == "" or sheet.fldCarDistintiva == "—") then
            						sheet.fldCarDistintiva = "Escolha " .. tostring(math.floor(DistinctFeature)) .. " característica(s).";
            					elseif(sheet.fldCarDistintiva == "Escolha 1 característica(s)." or sheet.fldCarDistintiva == "Escolha 2 característica(s)." or sheet.fldCarDistintiva == "Escolha 3 característica(s).") then
            						sheet.fldCarDistintiva = "Escolha " .. tostring(math.floor(DistinctFeature)) .. " característica(s).";
            					end;
            				end;
        end, obj);

    obj._e_event8 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor01 = string.format("%02d", sheet.fldHabValor01);
        end, obj);

    obj._e_event9 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event10 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor04 = string.format("%02d", sheet.fldHabValor04);
        end, obj);

    obj._e_event11 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event12 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor07 = string.format("%02d", sheet.fldHabValor07);
        end, obj);

    obj._e_event13 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event14 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor10 = string.format("%02d", sheet.fldHabValor10);
        end, obj);

    obj._e_event15 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event16 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor13 = string.format("%02d", sheet.fldHabValor13);
        end, obj);

    obj._e_event17 = obj.dataLink63:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event18 = obj.dataLink64:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor02 = string.format("%02d", sheet.fldHabValor02);
        end, obj);

    obj._e_event19 = obj.dataLink65:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event20 = obj.dataLink66:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor05 = string.format("%02d", sheet.fldHabValor05);
        end, obj);

    obj._e_event21 = obj.dataLink67:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event22 = obj.dataLink68:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor08 = string.format("%02d", sheet.fldHabValor08);
        end, obj);

    obj._e_event23 = obj.dataLink69:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event24 = obj.dataLink70:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor11 = string.format("%02d", sheet.fldHabValor11);
        end, obj);

    obj._e_event25 = obj.dataLink71:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event26 = obj.dataLink72:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor14 = string.format("%02d", sheet.fldHabValor14);
        end, obj);

    obj._e_event27 = obj.dataLink73:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event28 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor03 = string.format("%02d", sheet.fldHabValor03);
        end, obj);

    obj._e_event29 = obj.dataLink75:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event30 = obj.dataLink76:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor06 = string.format("%02d", sheet.fldHabValor06);
        end, obj);

    obj._e_event31 = obj.dataLink77:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event32 = obj.dataLink78:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor09 = string.format("%02d", sheet.fldHabValor09);
        end, obj);

    obj._e_event33 = obj.dataLink79:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event34 = obj.dataLink80:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor12 = string.format("%02d", sheet.fldHabValor12);
        end, obj);

    obj._e_event35 = obj.dataLink81:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event36 = obj.dataLink82:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor15 = string.format("%02d", sheet.fldHabValor15);
        end, obj);

    obj._e_event37 = obj.dataLink83:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event38 = obj.dataLink84:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor16 = string.format("%02d", sheet.fldHabValor16);
        end, obj);

    obj._e_event39 = obj.dataLink85:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event40 = obj.dataLink86:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor19 = string.format("%02d", sheet.fldHabValor19);
        end, obj);

    obj._e_event41 = obj.dataLink87:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event42 = obj.dataLink88:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor22 = string.format("%02d", sheet.fldHabValor22);
        end, obj);

    obj._e_event43 = obj.dataLink89:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event44 = obj.dataLink90:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor25 = string.format("%02d", sheet.fldHabValor25);
        end, obj);

    obj._e_event45 = obj.dataLink91:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event46 = obj.dataLink92:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor28 = string.format("%02d", sheet.fldHabValor28);
        end, obj);

    obj._e_event47 = obj.dataLink93:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event48 = obj.dataLink94:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor31 = string.format("%02d", sheet.fldHabValor31);
        end, obj);

    obj._e_event49 = obj.dataLink95:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event50 = obj.dataLink96:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor34 = string.format("%02d", sheet.fldHabValor34);
        end, obj);

    obj._e_event51 = obj.dataLink97:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event52 = obj.dataLink98:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor37 = string.format("%02d", sheet.fldHabValor37);
        end, obj);

    obj._e_event53 = obj.dataLink99:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event54 = obj.dataLink100:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor40 = string.format("%02d", sheet.fldHabValor40);
        end, obj);

    obj._e_event55 = obj.dataLink101:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event56 = obj.dataLink102:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor43 = string.format("%02d", sheet.fldHabValor43);
        end, obj);

    obj._e_event57 = obj.dataLink103:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event58 = obj.dataLink104:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor17 = string.format("%02d", sheet.fldHabValor17);
        end, obj);

    obj._e_event59 = obj.dataLink105:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event60 = obj.dataLink106:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor20 = string.format("%02d", sheet.fldHabValor20);
        end, obj);

    obj._e_event61 = obj.dataLink107:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event62 = obj.dataLink108:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor23 = string.format("%02d", sheet.fldHabValor23);
        end, obj);

    obj._e_event63 = obj.dataLink109:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event64 = obj.dataLink110:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor26 = string.format("%02d", sheet.fldHabValor26);
        end, obj);

    obj._e_event65 = obj.dataLink111:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event66 = obj.dataLink112:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor29 = string.format("%02d", sheet.fldHabValor29);
        end, obj);

    obj._e_event67 = obj.dataLink113:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event68 = obj.dataLink114:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor32 = string.format("%02d", sheet.fldHabValor32);
        end, obj);

    obj._e_event69 = obj.dataLink115:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event70 = obj.dataLink116:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor35 = string.format("%02d", sheet.fldHabValor35);
        end, obj);

    obj._e_event71 = obj.dataLink117:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event72 = obj.dataLink118:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor38 = string.format("%02d", sheet.fldHabValor38);
        end, obj);

    obj._e_event73 = obj.dataLink119:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event74 = obj.dataLink120:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor41 = string.format("%02d", sheet.fldHabValor41);
        end, obj);

    obj._e_event75 = obj.dataLink121:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event76 = obj.dataLink122:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor44 = string.format("%02d", sheet.fldHabValor44);
        end, obj);

    obj._e_event77 = obj.dataLink123:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event78 = obj.dataLink124:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor18 = string.format("%02d", sheet.fldHabValor18);
        end, obj);

    obj._e_event79 = obj.dataLink125:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event80 = obj.dataLink126:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor21 = string.format("%02d", sheet.fldHabValor21);
        end, obj);

    obj._e_event81 = obj.dataLink127:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event82 = obj.dataLink128:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor24 = string.format("%02d", sheet.fldHabValor24);
        end, obj);

    obj._e_event83 = obj.dataLink129:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event84 = obj.dataLink130:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor27 = string.format("%02d", sheet.fldHabValor27);
        end, obj);

    obj._e_event85 = obj.dataLink131:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event86 = obj.dataLink132:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor30 = string.format("%02d", sheet.fldHabValor30);
        end, obj);

    obj._e_event87 = obj.dataLink133:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event88 = obj.dataLink134:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor33 = string.format("%02d", sheet.fldHabValor33);
        end, obj);

    obj._e_event89 = obj.dataLink135:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event90 = obj.dataLink136:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor36 = string.format("%02d", sheet.fldHabValor36);
        end, obj);

    obj._e_event91 = obj.dataLink137:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event92 = obj.dataLink138:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor39 = string.format("%02d", sheet.fldHabValor39);
        end, obj);

    obj._e_event93 = obj.dataLink139:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event94 = obj.dataLink140:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor42 = string.format("%02d", sheet.fldHabValor42);
        end, obj);

    obj._e_event95 = obj.dataLink141:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    obj._e_event96 = obj.dataLink142:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual(); 
            					sheet.fldHabValor45 = string.format("%02d", sheet.fldHabValor45);
        end, obj);

    obj._e_event97 = obj.dataLink143:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularGloriaAnual();
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink142 ~= nil then self.dataLink142:destroy(); self.dataLink142 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.namSomaGloria ~= nil then self.namSomaGloria:destroy(); self.namSomaGloria = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.dataLink141 ~= nil then self.dataLink141:destroy(); self.dataLink141 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.FOR ~= nil then self.FOR:destroy(); self.FOR = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.TAM ~= nil then self.TAM:destroy(); self.TAM = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.dataLink138 ~= nil then self.dataLink138:destroy(); self.dataLink138 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.dLUpgrades ~= nil then self.dLUpgrades:destroy(); self.dLUpgrades = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.dataLink128 ~= nil then self.dataLink128:destroy(); self.dataLink128 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.dLDescCaracteristica ~= nil then self.dLDescCaracteristica:destroy(); self.dLDescCaracteristica = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink137 ~= nil then self.dataLink137:destroy(); self.dataLink137 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.dataLink133 ~= nil then self.dataLink133:destroy(); self.dataLink133 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.dataLink126 ~= nil then self.dataLink126:destroy(); self.dataLink126 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.CON ~= nil then self.CON:destroy(); self.CON = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.dataLink130 ~= nil then self.dataLink130:destroy(); self.dataLink130 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.dataLink131 ~= nil then self.dataLink131:destroy(); self.dataLink131 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.dataLink123 ~= nil then self.dataLink123:destroy(); self.dataLink123 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.comboBox45 ~= nil then self.comboBox45:destroy(); self.comboBox45 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.dataLink143 ~= nil then self.dataLink143:destroy(); self.dataLink143 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.dataLink134 ~= nil then self.dataLink134:destroy(); self.dataLink134 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink139 ~= nil then self.dataLink139:destroy(); self.dataLink139 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.dLDadosIniciais ~= nil then self.dLDadosIniciais:destroy(); self.dLDadosIniciais = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.dLAtributosDerivados ~= nil then self.dLAtributosDerivados:destroy(); self.dLAtributosDerivados = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.dataLink127 ~= nil then self.dataLink127:destroy(); self.dataLink127 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.dataLink135 ~= nil then self.dataLink135:destroy(); self.dataLink135 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.APA ~= nil then self.APA:destroy(); self.APA = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.DES ~= nil then self.DES:destroy(); self.DES = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.dataLink129 ~= nil then self.dataLink129:destroy(); self.dataLink129 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.dataLink140 ~= nil then self.dataLink140:destroy(); self.dataLink140 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dLDadosAdicionais ~= nil then self.dLDadosAdicionais:destroy(); self.dLDadosAdicionais = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dLCabecalho ~= nil then self.dLCabecalho:destroy(); self.dLCabecalho = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink132 ~= nil then self.dataLink132:destroy(); self.dataLink132 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink136 ~= nil then self.dataLink136:destroy(); self.dataLink136 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.dataLink125 ~= nil then self.dataLink125:destroy(); self.dataLink125 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.dataLink124 ~= nil then self.dataLink124:destroy(); self.dataLink124 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDados()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDados();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDados = {
    newEditor = newfrmDados, 
    new = newfrmDados, 
    name = "frmDados", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDados = _frmDados;
Firecast.registrarForm(_frmDados);

return _frmDados;
