require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaAnimeE51_svg()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setName("frmFichaAnimeE51_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1087);
    obj.rectangle1:setHeight(1408);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1087);
    obj.image1:setHeight(1408);
    obj.image1:setSRC("/FichaAnimeE5/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.nomePersonagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomePersonagem:setParent(obj.rectangle1);
    obj.nomePersonagem:setName("nomePersonagem");
    obj.nomePersonagem:setLeft(95);
    obj.nomePersonagem:setTop(150);
    obj.nomePersonagem:setWidth(235);
    obj.nomePersonagem:setHeight(40);
    obj.nomePersonagem:setHorzTextAlign("center");
    obj.nomePersonagem:setFontColor("black");
    lfm_setPropAsString(obj.nomePersonagem, "fontStyle", "bold");
    obj.nomePersonagem:setFontSize(24);
    obj.nomePersonagem:setTextPrompt("Escreva aqui");
    obj.nomePersonagem:setField("nomePersonagem");
    obj.nomePersonagem:setTransparent(true);

    obj.nomeJogador = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeJogador:setParent(obj.rectangle1);
    obj.nomeJogador:setName("nomeJogador");
    obj.nomeJogador:setLeft(52);
    obj.nomeJogador:setTop(236);
    obj.nomeJogador:setWidth(325);
    obj.nomeJogador:setHeight(25);
    obj.nomeJogador:setHorzTextAlign("center");
    obj.nomeJogador:setFontColor("black");
    obj.nomeJogador:setFontSize(20);
    obj.nomeJogador:setTextPrompt("Escreva aqui");
    obj.nomeJogador:setField("nomeJogador");
    obj.nomeJogador:setTransparent(true);

    obj.racaEtamanho = GUI.fromHandle(_obj_newObject("edit"));
    obj.racaEtamanho:setParent(obj.rectangle1);
    obj.racaEtamanho:setName("racaEtamanho");
    obj.racaEtamanho:setLeft(418);
    obj.racaEtamanho:setTop(50);
    obj.racaEtamanho:setWidth(235);
    obj.racaEtamanho:setHeight(28);
    obj.racaEtamanho:setHorzTextAlign("leading");
    obj.racaEtamanho:setFontColor("black");
    lfm_setPropAsString(obj.racaEtamanho, "fontStyle", "bold");
    obj.racaEtamanho:setFontSize(20);
    obj.racaEtamanho:setTextPrompt("Escreva aqui");
    obj.racaEtamanho:setField("racaEtamanho");
    obj.racaEtamanho:setTransparent(true);

    obj.descricao = GUI.fromHandle(_obj_newObject("edit"));
    obj.descricao:setParent(obj.rectangle1);
    obj.descricao:setName("descricao");
    obj.descricao:setLeft(418);
    obj.descricao:setTop(112);
    obj.descricao:setWidth(235);
    obj.descricao:setHeight(28);
    obj.descricao:setHorzTextAlign("leading");
    obj.descricao:setFontColor("black");
    lfm_setPropAsString(obj.descricao, "fontStyle", "bold");
    obj.descricao:setFontSize(20);
    obj.descricao:setTextPrompt("Escreva aqui");
    obj.descricao:setField("descricao");
    obj.descricao:setTransparent(true);

    obj.alinhamento = GUI.fromHandle(_obj_newObject("edit"));
    obj.alinhamento:setParent(obj.rectangle1);
    obj.alinhamento:setName("alinhamento");
    obj.alinhamento:setLeft(418);
    obj.alinhamento:setTop(172);
    obj.alinhamento:setWidth(235);
    obj.alinhamento:setHeight(28);
    obj.alinhamento:setHorzTextAlign("leading");
    obj.alinhamento:setFontColor("black");
    lfm_setPropAsString(obj.alinhamento, "fontStyle", "bold");
    obj.alinhamento:setFontSize(20);
    obj.alinhamento:setTextPrompt("Escreva aqui");
    obj.alinhamento:setField("alinhamento");
    obj.alinhamento:setTransparent(true);

    obj.pontosDiscricionarios = GUI.fromHandle(_obj_newObject("edit"));
    obj.pontosDiscricionarios:setParent(obj.rectangle1);
    obj.pontosDiscricionarios:setName("pontosDiscricionarios");
    obj.pontosDiscricionarios:setLeft(418);
    obj.pontosDiscricionarios:setTop(229);
    obj.pontosDiscricionarios:setWidth(110);
    obj.pontosDiscricionarios:setHeight(30);
    obj.pontosDiscricionarios:setHorzTextAlign("center");
    obj.pontosDiscricionarios:setFontColor("black");
    lfm_setPropAsString(obj.pontosDiscricionarios, "fontStyle", "bold");
    obj.pontosDiscricionarios:setFontSize(20);
    obj.pontosDiscricionarios:setTextPrompt("PDISC");
    obj.pontosDiscricionarios:setType("number");
    obj.pontosDiscricionarios:setField("pontosDiscricionarios");
    obj.pontosDiscricionarios:setTransparent(true);

    obj.experiencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.experiencia:setParent(obj.rectangle1);
    obj.experiencia:setName("experiencia");
    obj.experiencia:setLeft(543);
    obj.experiencia:setTop(229);
    obj.experiencia:setWidth(110);
    obj.experiencia:setHeight(30);
    obj.experiencia:setHorzTextAlign("center");
    obj.experiencia:setFontColor("black");
    lfm_setPropAsString(obj.experiencia, "fontStyle", "bold");
    obj.experiencia:setFontSize(20);
    obj.experiencia:setType("number");
    obj.experiencia:setTextPrompt("EXP");
    obj.experiencia:setField("experiencia");
    obj.experiencia:setTransparent(true);

    obj.nivelExperiencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelExperiencia:setParent(obj.rectangle1);
    obj.nivelExperiencia:setName("nivelExperiencia");
    obj.nivelExperiencia:setLeft(936);
    obj.nivelExperiencia:setTop(53);
    obj.nivelExperiencia:setWidth(66);
    obj.nivelExperiencia:setHeight(25);
    obj.nivelExperiencia:setHorzTextAlign("center");
    obj.nivelExperiencia:setFontColor("black");
    lfm_setPropAsString(obj.nivelExperiencia, "fontStyle", "bold");
    obj.nivelExperiencia:setFontSize(20);
    obj.nivelExperiencia:setType("number");
    obj.nivelExperiencia:setTextPrompt("Total");
    obj.nivelExperiencia:setField("nivelExperiencia");
    obj.nivelExperiencia:setTransparent(true);

    obj.classe1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.classe1:setParent(obj.rectangle1);
    obj.classe1:setName("classe1");
    obj.classe1:setLeft(714);
    obj.classe1:setTop(140);
    obj.classe1:setWidth(133);
    obj.classe1:setHeight(25);
    obj.classe1:setHorzTextAlign("leading");
    obj.classe1:setFontColor("black");
    lfm_setPropAsString(obj.classe1, "fontStyle", "bold");
    obj.classe1:setFontSize(16);
    obj.classe1:setTextPrompt("Nome da Classe");
    obj.classe1:setField("classe1");
    obj.classe1:setTransparent(true);

    obj.nivel1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivel1:setParent(obj.rectangle1);
    obj.nivel1:setName("nivel1");
    obj.nivel1:setLeft(859);
    obj.nivel1:setTop(140);
    obj.nivel1:setWidth(66);
    obj.nivel1:setHeight(25);
    obj.nivel1:setHorzTextAlign("center");
    obj.nivel1:setFontColor("black");
    lfm_setPropAsString(obj.nivel1, "fontStyle", "bold");
    obj.nivel1:setFontSize(16);
    obj.nivel1:setType("number");
    obj.nivel1:setTextPrompt("Nível");
    obj.nivel1:setField("nivel1");
    obj.nivel1:setTransparent(true);

    obj.dadoVida1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dadoVida1:setParent(obj.rectangle1);
    obj.dadoVida1:setName("dadoVida1");
    obj.dadoVida1:setLeft(939);
    obj.dadoVida1:setTop(140);
    obj.dadoVida1:setWidth(66);
    obj.dadoVida1:setHeight(25);
    obj.dadoVida1:setHorzTextAlign("center");
    obj.dadoVida1:setFontColor("black");
    lfm_setPropAsString(obj.dadoVida1, "fontStyle", "bold");
    obj.dadoVida1:setFontSize(16);
    obj.dadoVida1:setTextPrompt("DV");
    obj.dadoVida1:setField("dadoVida1");
    obj.dadoVida1:setTransparent(true);

    obj.classe2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.classe2:setParent(obj.rectangle1);
    obj.classe2:setName("classe2");
    obj.classe2:setLeft(714);
    obj.classe2:setTop(188);
    obj.classe2:setWidth(133);
    obj.classe2:setHeight(25);
    obj.classe2:setHorzTextAlign("leading");
    obj.classe2:setFontColor("black");
    lfm_setPropAsString(obj.classe2, "fontStyle", "bold");
    obj.classe2:setFontSize(16);
    obj.classe2:setTextPrompt("Nome da Classe");
    obj.classe2:setField("classe2");
    obj.classe2:setTransparent(true);

    obj.nivel2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivel2:setParent(obj.rectangle1);
    obj.nivel2:setName("nivel2");
    obj.nivel2:setLeft(859);
    obj.nivel2:setTop(188);
    obj.nivel2:setWidth(66);
    obj.nivel2:setHeight(25);
    obj.nivel2:setHorzTextAlign("center");
    obj.nivel2:setFontColor("black");
    lfm_setPropAsString(obj.nivel2, "fontStyle", "bold");
    obj.nivel2:setFontSize(16);
    obj.nivel2:setTextPrompt("Nível");
    obj.nivel2:setType("number");
    obj.nivel2:setField("nivel2");
    obj.nivel2:setTransparent(true);

    obj.dadoVida2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dadoVida2:setParent(obj.rectangle1);
    obj.dadoVida2:setName("dadoVida2");
    obj.dadoVida2:setLeft(939);
    obj.dadoVida2:setTop(188);
    obj.dadoVida2:setWidth(66);
    obj.dadoVida2:setHeight(25);
    obj.dadoVida2:setHorzTextAlign("center");
    obj.dadoVida2:setFontColor("black");
    lfm_setPropAsString(obj.dadoVida2, "fontStyle", "bold");
    obj.dadoVida2:setFontSize(16);
    obj.dadoVida2:setTextPrompt("DV");
    obj.dadoVida2:setField("dadoVida2");
    obj.dadoVida2:setTransparent(true);

    obj.classe3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.classe3:setParent(obj.rectangle1);
    obj.classe3:setName("classe3");
    obj.classe3:setLeft(714);
    obj.classe3:setTop(236);
    obj.classe3:setWidth(133);
    obj.classe3:setHeight(25);
    obj.classe3:setHorzTextAlign("leading");
    obj.classe3:setFontColor("black");
    lfm_setPropAsString(obj.classe3, "fontStyle", "bold");
    obj.classe3:setFontSize(16);
    obj.classe3:setTextPrompt("Nome da Classe");
    obj.classe3:setField("classe3");
    obj.classe3:setTransparent(true);

    obj.nivel3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivel3:setParent(obj.rectangle1);
    obj.nivel3:setName("nivel3");
    obj.nivel3:setLeft(859);
    obj.nivel3:setTop(236);
    obj.nivel3:setWidth(66);
    obj.nivel3:setHeight(25);
    obj.nivel3:setHorzTextAlign("center");
    obj.nivel3:setFontColor("black");
    lfm_setPropAsString(obj.nivel3, "fontStyle", "bold");
    obj.nivel3:setFontSize(16);
    obj.nivel3:setType("number");
    obj.nivel3:setTextPrompt("Nível");
    obj.nivel3:setField("nivel3");
    obj.nivel3:setTransparent(true);

    obj.dadoVida3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.dadoVida3:setParent(obj.rectangle1);
    obj.dadoVida3:setName("dadoVida3");
    obj.dadoVida3:setLeft(939);
    obj.dadoVida3:setTop(236);
    obj.dadoVida3:setWidth(66);
    obj.dadoVida3:setHeight(25);
    obj.dadoVida3:setHorzTextAlign("center");
    obj.dadoVida3:setFontColor("black");
    lfm_setPropAsString(obj.dadoVida3, "fontStyle", "bold");
    obj.dadoVida3:setFontSize(16);
    obj.dadoVida3:setTextPrompt("DV");
    obj.dadoVida3:setField("dadoVida3");
    obj.dadoVida3:setTransparent(true);

    obj.forcaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.forcaBase:setParent(obj.rectangle1);
    obj.forcaBase:setName("forcaBase");
    obj.forcaBase:setLeft(83.5);
    obj.forcaBase:setTop(413);
    obj.forcaBase:setWidth(80);
    obj.forcaBase:setHeight(30);
    obj.forcaBase:setText("10");
    obj.forcaBase:setHorzTextAlign("center");
    obj.forcaBase:setFontColor("black");
    lfm_setPropAsString(obj.forcaBase, "fontStyle", "bold");
    obj.forcaBase:setFontSize(24);
    obj.forcaBase:setType("number");
    obj.forcaBase:setField("forcaBase");

    obj.forcaModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.forcaModificador:setParent(obj.rectangle1);
    obj.forcaModificador:setName("forcaModificador");
    obj.forcaModificador:setLeft(87);
    obj.forcaModificador:setTop(472);
    obj.forcaModificador:setWidth(70);
    obj.forcaModificador:setHeight(25);
    obj.forcaModificador:setEnabled(false);
    obj.forcaModificador:setHorzTextAlign("center");
    obj.forcaModificador:setFontColor("black");
    lfm_setPropAsString(obj.forcaModificador, "fontStyle", "bold");
    obj.forcaModificador:setFontSize(18);
    obj.forcaModificador:setField("forcaModificador");
    obj.forcaModificador:setTransparent(true);

    obj.destrezaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.destrezaBase:setParent(obj.rectangle1);
    obj.destrezaBase:setName("destrezaBase");
    obj.destrezaBase:setLeft(251);
    obj.destrezaBase:setTop(413);
    obj.destrezaBase:setWidth(80);
    obj.destrezaBase:setHeight(30);
    obj.destrezaBase:setText("10");
    obj.destrezaBase:setHorzTextAlign("center");
    obj.destrezaBase:setFontColor("black");
    lfm_setPropAsString(obj.destrezaBase, "fontStyle", "bold");
    obj.destrezaBase:setFontSize(24);
    obj.destrezaBase:setType("number");
    obj.destrezaBase:setField("destrezaBase");

    obj.destrezaModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.destrezaModificador:setParent(obj.rectangle1);
    obj.destrezaModificador:setName("destrezaModificador");
    obj.destrezaModificador:setLeft(255);
    obj.destrezaModificador:setTop(472);
    obj.destrezaModificador:setWidth(70);
    obj.destrezaModificador:setHeight(25);
    obj.destrezaModificador:setEnabled(false);
    obj.destrezaModificador:setFontColor("black");
    obj.destrezaModificador:setHorzTextAlign("center");
    lfm_setPropAsString(obj.destrezaModificador, "fontStyle", "bold");
    obj.destrezaModificador:setFontSize(18);
    obj.destrezaModificador:setField("destrezaModificador");
    obj.destrezaModificador:setTransparent(true);

    obj.constituicaoBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.constituicaoBase:setParent(obj.rectangle1);
    obj.constituicaoBase:setName("constituicaoBase");
    obj.constituicaoBase:setLeft(419);
    obj.constituicaoBase:setTop(413);
    obj.constituicaoBase:setWidth(80);
    obj.constituicaoBase:setHeight(30);
    obj.constituicaoBase:setText("10");
    obj.constituicaoBase:setHorzTextAlign("center");
    obj.constituicaoBase:setFontColor("black");
    lfm_setPropAsString(obj.constituicaoBase, "fontStyle", "bold");
    obj.constituicaoBase:setFontSize(24);
    obj.constituicaoBase:setType("number");
    obj.constituicaoBase:setField("constituicaoBase");

    obj.constituicaoModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.constituicaoModificador:setParent(obj.rectangle1);
    obj.constituicaoModificador:setName("constituicaoModificador");
    obj.constituicaoModificador:setLeft(423);
    obj.constituicaoModificador:setTop(472);
    obj.constituicaoModificador:setWidth(70);
    obj.constituicaoModificador:setHeight(25);
    obj.constituicaoModificador:setEnabled(false);
    obj.constituicaoModificador:setFontColor("black");
    obj.constituicaoModificador:setHorzTextAlign("center");
    lfm_setPropAsString(obj.constituicaoModificador, "fontStyle", "bold");
    obj.constituicaoModificador:setFontSize(18);
    obj.constituicaoModificador:setField("constituicaoModificador");
    obj.constituicaoModificador:setTransparent(true);

    obj.inteligenciaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.inteligenciaBase:setParent(obj.rectangle1);
    obj.inteligenciaBase:setName("inteligenciaBase");
    obj.inteligenciaBase:setLeft(587);
    obj.inteligenciaBase:setTop(413);
    obj.inteligenciaBase:setWidth(80);
    obj.inteligenciaBase:setHeight(30);
    obj.inteligenciaBase:setText("10");
    obj.inteligenciaBase:setHorzTextAlign("center");
    obj.inteligenciaBase:setFontColor("black");
    lfm_setPropAsString(obj.inteligenciaBase, "fontStyle", "bold");
    obj.inteligenciaBase:setFontSize(24);
    obj.inteligenciaBase:setType("number");
    obj.inteligenciaBase:setField("inteligenciaBase");

    obj.inteligenciaModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.inteligenciaModificador:setParent(obj.rectangle1);
    obj.inteligenciaModificador:setName("inteligenciaModificador");
    obj.inteligenciaModificador:setLeft(591);
    obj.inteligenciaModificador:setTop(472);
    obj.inteligenciaModificador:setWidth(70);
    obj.inteligenciaModificador:setHeight(25);
    obj.inteligenciaModificador:setEnabled(false);
    obj.inteligenciaModificador:setHorzTextAlign("center");
    obj.inteligenciaModificador:setFontColor("black");
    lfm_setPropAsString(obj.inteligenciaModificador, "fontStyle", "bold");
    obj.inteligenciaModificador:setFontSize(18);
    obj.inteligenciaModificador:setField("inteligenciaModificador");
    obj.inteligenciaModificador:setTransparent(true);

    obj.sabedoriaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.sabedoriaBase:setParent(obj.rectangle1);
    obj.sabedoriaBase:setName("sabedoriaBase");
    obj.sabedoriaBase:setLeft(755);
    obj.sabedoriaBase:setTop(413);
    obj.sabedoriaBase:setWidth(80);
    obj.sabedoriaBase:setHeight(30);
    obj.sabedoriaBase:setText("10");
    obj.sabedoriaBase:setHorzTextAlign("center");
    obj.sabedoriaBase:setFontColor("black");
    lfm_setPropAsString(obj.sabedoriaBase, "fontStyle", "bold");
    obj.sabedoriaBase:setFontSize(24);
    obj.sabedoriaBase:setType("number");
    obj.sabedoriaBase:setField("sabedoriaBase");

    obj.sabedoriaModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.sabedoriaModificador:setParent(obj.rectangle1);
    obj.sabedoriaModificador:setName("sabedoriaModificador");
    obj.sabedoriaModificador:setLeft(759);
    obj.sabedoriaModificador:setTop(472);
    obj.sabedoriaModificador:setWidth(70);
    obj.sabedoriaModificador:setHeight(25);
    obj.sabedoriaModificador:setEnabled(false);
    obj.sabedoriaModificador:setHorzTextAlign("center");
    obj.sabedoriaModificador:setFontColor("black");
    lfm_setPropAsString(obj.sabedoriaModificador, "fontStyle", "bold");
    obj.sabedoriaModificador:setFontSize(18);
    obj.sabedoriaModificador:setField("sabedoriaModificador");
    obj.sabedoriaModificador:setTransparent(true);

    obj.carismaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.carismaBase:setParent(obj.rectangle1);
    obj.carismaBase:setName("carismaBase");
    obj.carismaBase:setLeft(922);
    obj.carismaBase:setTop(413);
    obj.carismaBase:setWidth(80);
    obj.carismaBase:setHeight(30);
    obj.carismaBase:setText("10");
    obj.carismaBase:setHorzTextAlign("center");
    obj.carismaBase:setFontColor("black");
    lfm_setPropAsString(obj.carismaBase, "fontStyle", "bold");
    obj.carismaBase:setFontSize(24);
    obj.carismaBase:setType("number");
    obj.carismaBase:setField("carismaBase");

    obj.carismaModificador = GUI.fromHandle(_obj_newObject("edit"));
    obj.carismaModificador:setParent(obj.rectangle1);
    obj.carismaModificador:setName("carismaModificador");
    obj.carismaModificador:setLeft(927);
    obj.carismaModificador:setTop(472);
    obj.carismaModificador:setWidth(70);
    obj.carismaModificador:setHeight(25);
    obj.carismaModificador:setEnabled(false);
    obj.carismaModificador:setHorzTextAlign("center");
    obj.carismaModificador:setFontColor("black");
    lfm_setPropAsString(obj.carismaModificador, "fontStyle", "bold");
    obj.carismaModificador:setFontSize(18);
    obj.carismaModificador:setField("carismaModificador");
    obj.carismaModificador:setTransparent(true);

    obj.bonusProficiencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.bonusProficiencia:setParent(obj.rectangle1);
    obj.bonusProficiencia:setName("bonusProficiencia");
    obj.bonusProficiencia:setLeft(75);
    obj.bonusProficiencia:setTop(670);
    obj.bonusProficiencia:setWidth(80);
    obj.bonusProficiencia:setHeight(40);
    obj.bonusProficiencia:setHorzTextAlign("center");
    obj.bonusProficiencia:setFontColor("black");
    lfm_setPropAsString(obj.bonusProficiencia, "fontStyle", "bold");
    obj.bonusProficiencia:setFontSize(30);
    obj.bonusProficiencia:setTextPrompt("BP");
    obj.bonusProficiencia:setField("bonusProeficiencia");
    obj.bonusProficiencia:setTransparent(true);

    obj.PVida_Maxima = GUI.fromHandle(_obj_newObject("edit"));
    obj.PVida_Maxima:setParent(obj.rectangle1);
    obj.PVida_Maxima:setName("PVida_Maxima");
    obj.PVida_Maxima:setLeft(251);
    obj.PVida_Maxima:setTop(645);
    obj.PVida_Maxima:setWidth(43);
    obj.PVida_Maxima:setHeight(32);
    obj.PVida_Maxima:setHorzTextAlign("center");
    obj.PVida_Maxima:setFontColor("black");
    lfm_setPropAsString(obj.PVida_Maxima, "fontStyle", "bold");
    obj.PVida_Maxima:setFontSize(26);
    obj.PVida_Maxima:setType("number");
    obj.PVida_Maxima:setTextPrompt("VM");
    obj.PVida_Maxima:setField("PVida_Atual");
    obj.PVida_Maxima:setTransparent(true);

    obj.PVida_Atual = GUI.fromHandle(_obj_newObject("edit"));
    obj.PVida_Atual:setParent(obj.rectangle1);
    obj.PVida_Atual:setName("PVida_Atual");
    obj.PVida_Atual:setLeft(369);
    obj.PVida_Atual:setTop(645);
    obj.PVida_Atual:setWidth(43);
    obj.PVida_Atual:setHeight(32);
    obj.PVida_Atual:setHorzTextAlign("center");
    obj.PVida_Atual:setFontColor("black");
    lfm_setPropAsString(obj.PVida_Atual, "fontStyle", "bold");
    obj.PVida_Atual:setFontSize(26);
    obj.PVida_Atual:setType("number");
    obj.PVida_Atual:setTextPrompt("VA");
    obj.PVida_Atual:setField("PVida_Maxima");
    obj.PVida_Atual:setTransparent(true);

    obj.classeArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.classeArmadura:setParent(obj.rectangle1);
    obj.classeArmadura:setName("classeArmadura");
    obj.classeArmadura:setLeft(508);
    obj.classeArmadura:setTop(673);
    obj.classeArmadura:setWidth(69);
    obj.classeArmadura:setHeight(32);
    obj.classeArmadura:setText("10");
    obj.classeArmadura:setHorzTextAlign("center");
    obj.classeArmadura:setFontColor("black");
    lfm_setPropAsString(obj.classeArmadura, "fontStyle", "bold");
    obj.classeArmadura:setFontSize(26);
    obj.classeArmadura:setType("number");
    obj.classeArmadura:setTextPrompt("CA");
    obj.classeArmadura:setField("classeArmadura");
    obj.classeArmadura:setTransparent(true);

    obj.PEnergia_Maxima = GUI.fromHandle(_obj_newObject("edit"));
    obj.PEnergia_Maxima:setParent(obj.rectangle1);
    obj.PEnergia_Maxima:setName("PEnergia_Maxima");
    obj.PEnergia_Maxima:setLeft(671);
    obj.PEnergia_Maxima:setTop(645);
    obj.PEnergia_Maxima:setWidth(43);
    obj.PEnergia_Maxima:setHeight(32);
    obj.PEnergia_Maxima:setHorzTextAlign("center");
    obj.PEnergia_Maxima:setFontColor("black");
    lfm_setPropAsString(obj.PEnergia_Maxima, "fontStyle", "bold");
    obj.PEnergia_Maxima:setFontSize(26);
    obj.PEnergia_Maxima:setType("number");
    obj.PEnergia_Maxima:setTextPrompt("EM");
    obj.PEnergia_Maxima:setField("PEnergia_Maxima");
    obj.PEnergia_Maxima:setTransparent(true);

    obj.PEnergia_Atual = GUI.fromHandle(_obj_newObject("edit"));
    obj.PEnergia_Atual:setParent(obj.rectangle1);
    obj.PEnergia_Atual:setName("PEnergia_Atual");
    obj.PEnergia_Atual:setLeft(787);
    obj.PEnergia_Atual:setTop(645);
    obj.PEnergia_Atual:setWidth(43);
    obj.PEnergia_Atual:setHeight(32);
    obj.PEnergia_Atual:setHorzTextAlign("center");
    obj.PEnergia_Atual:setFontColor("black");
    lfm_setPropAsString(obj.PEnergia_Atual, "fontStyle", "bold");
    obj.PEnergia_Atual:setFontSize(26);
    obj.PEnergia_Atual:setType("number");
    obj.PEnergia_Atual:setTextPrompt("EA");
    obj.PEnergia_Atual:setField("PEnergia_Atual");
    obj.PEnergia_Atual:setTransparent(true);

    obj.Deslocamento = GUI.fromHandle(_obj_newObject("edit"));
    obj.Deslocamento:setParent(obj.rectangle1);
    obj.Deslocamento:setName("Deslocamento");
    obj.Deslocamento:setLeft(935);
    obj.Deslocamento:setTop(670);
    obj.Deslocamento:setWidth(77);
    obj.Deslocamento:setHeight(35);
    obj.Deslocamento:setText("9m");
    obj.Deslocamento:setHorzTextAlign("center");
    obj.Deslocamento:setFontColor("black");
    lfm_setPropAsString(obj.Deslocamento, "fontStyle", "bold");
    obj.Deslocamento:setFontSize(30);
    obj.Deslocamento:setTextPrompt("DES");
    obj.Deslocamento:setField("Deslocamento");
    obj.Deslocamento:setTransparent(true);

    obj.salvaGuarda1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.salvaGuarda1:setParent(obj.rectangle1);
    obj.salvaGuarda1:setName("salvaGuarda1");
    obj.salvaGuarda1:setLeft(114);
    obj.salvaGuarda1:setTop(883);
    obj.salvaGuarda1:setWidth(123);
    obj.salvaGuarda1:setHeight(25);
    obj.salvaGuarda1:setHorzTextAlign("leading");
    obj.salvaGuarda1:setFontColor("black");
    lfm_setPropAsString(obj.salvaGuarda1, "fontStyle", "bold");
    obj.salvaGuarda1:setFontSize(16);
    obj.salvaGuarda1:setTextPrompt("Atributo");
    obj.salvaGuarda1:setField("salvaGuarda1");
    obj.salvaGuarda1:setTransparent(true);

    obj.salvaGuarda2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.salvaGuarda2:setParent(obj.rectangle1);
    obj.salvaGuarda2:setName("salvaGuarda2");
    obj.salvaGuarda2:setLeft(114);
    obj.salvaGuarda2:setTop(919);
    obj.salvaGuarda2:setWidth(123);
    obj.salvaGuarda2:setHeight(25);
    obj.salvaGuarda2:setHorzTextAlign("leading");
    obj.salvaGuarda2:setFontColor("black");
    lfm_setPropAsString(obj.salvaGuarda2, "fontStyle", "bold");
    obj.salvaGuarda2:setFontSize(16);
    obj.salvaGuarda2:setTextPrompt("Atributo");
    obj.salvaGuarda2:setField("salvaGuarda2");
    obj.salvaGuarda2:setTransparent(true);

    obj.salvaGuarda3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.salvaGuarda3:setParent(obj.rectangle1);
    obj.salvaGuarda3:setName("salvaGuarda3");
    obj.salvaGuarda3:setLeft(114);
    obj.salvaGuarda3:setTop(955);
    obj.salvaGuarda3:setWidth(123);
    obj.salvaGuarda3:setHeight(25);
    obj.salvaGuarda3:setHorzTextAlign("leading");
    obj.salvaGuarda3:setFontColor("black");
    lfm_setPropAsString(obj.salvaGuarda3, "fontStyle", "bold");
    obj.salvaGuarda3:setFontSize(16);
    obj.salvaGuarda3:setTextPrompt("Atributo");
    obj.salvaGuarda3:setField("salvaGuarda3");
    obj.salvaGuarda3:setTransparent(true);

    obj.salvaGuarda4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.salvaGuarda4:setParent(obj.rectangle1);
    obj.salvaGuarda4:setName("salvaGuarda4");
    obj.salvaGuarda4:setLeft(114);
    obj.salvaGuarda4:setTop(991);
    obj.salvaGuarda4:setWidth(123);
    obj.salvaGuarda4:setHeight(25);
    obj.salvaGuarda4:setHorzTextAlign("leading");
    obj.salvaGuarda4:setFontColor("black");
    lfm_setPropAsString(obj.salvaGuarda4, "fontStyle", "bold");
    obj.salvaGuarda4:setFontSize(16);
    obj.salvaGuarda4:setTextPrompt("Atributo");
    obj.salvaGuarda4:setField("salvaGuarda4");
    obj.salvaGuarda4:setTransparent(true);

    obj.armadura1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armadura1:setParent(obj.rectangle1);
    obj.armadura1:setName("armadura1");
    obj.armadura1:setLeft(261);
    obj.armadura1:setTop(883);
    obj.armadura1:setWidth(123);
    obj.armadura1:setHeight(25);
    obj.armadura1:setHorzTextAlign("leading");
    obj.armadura1:setFontColor("black");
    lfm_setPropAsString(obj.armadura1, "fontStyle", "bold");
    obj.armadura1:setFontSize(16);
    obj.armadura1:setTextPrompt("Tipo");
    obj.armadura1:setField("armadura1");
    obj.armadura1:setTransparent(true);

    obj.armadura2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armadura2:setParent(obj.rectangle1);
    obj.armadura2:setName("armadura2");
    obj.armadura2:setLeft(261);
    obj.armadura2:setTop(919);
    obj.armadura2:setWidth(123);
    obj.armadura2:setHeight(25);
    obj.armadura2:setHorzTextAlign("leading");
    obj.armadura2:setFontColor("black");
    lfm_setPropAsString(obj.armadura2, "fontStyle", "bold");
    obj.armadura2:setFontSize(16);
    obj.armadura2:setTextPrompt("Tipo");
    obj.armadura2:setField("armadura2");
    obj.armadura2:setTransparent(true);

    obj.armadura3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armadura3:setParent(obj.rectangle1);
    obj.armadura3:setName("armadura3");
    obj.armadura3:setLeft(261);
    obj.armadura3:setTop(955);
    obj.armadura3:setWidth(123);
    obj.armadura3:setHeight(25);
    obj.armadura3:setHorzTextAlign("leading");
    obj.armadura3:setFontColor("black");
    lfm_setPropAsString(obj.armadura3, "fontStyle", "bold");
    obj.armadura3:setFontSize(16);
    obj.armadura3:setTextPrompt("Tipo");
    obj.armadura3:setField("armadura3");
    obj.armadura3:setTransparent(true);

    obj.armadura4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armadura4:setParent(obj.rectangle1);
    obj.armadura4:setName("armadura4");
    obj.armadura4:setLeft(261);
    obj.armadura4:setTop(991);
    obj.armadura4:setWidth(123);
    obj.armadura4:setHeight(25);
    obj.armadura4:setHorzTextAlign("leading");
    obj.armadura4:setFontColor("black");
    lfm_setPropAsString(obj.armadura4, "fontStyle", "bold");
    obj.armadura4:setFontSize(16);
    obj.armadura4:setTextPrompt("Tipo");
    obj.armadura4:setField("armadura4");
    obj.armadura4:setTransparent(true);

    obj.armas1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armas1:setParent(obj.rectangle1);
    obj.armas1:setName("armas1");
    obj.armas1:setLeft(409);
    obj.armas1:setTop(883);
    obj.armas1:setWidth(123);
    obj.armas1:setHeight(25);
    obj.armas1:setHorzTextAlign("leading");
    obj.armas1:setFontColor("black");
    lfm_setPropAsString(obj.armas1, "fontStyle", "bold");
    obj.armas1:setFontSize(16);
    obj.armas1:setTextPrompt("Tipo ou Nome");
    obj.armas1:setField("armas1");
    obj.armas1:setTransparent(true);

    obj.armas2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armas2:setParent(obj.rectangle1);
    obj.armas2:setName("armas2");
    obj.armas2:setLeft(409);
    obj.armas2:setTop(919);
    obj.armas2:setWidth(123);
    obj.armas2:setHeight(25);
    obj.armas2:setHorzTextAlign("leading");
    obj.armas2:setFontColor("black");
    lfm_setPropAsString(obj.armas2, "fontStyle", "bold");
    obj.armas2:setFontSize(16);
    obj.armas2:setTextPrompt("Tipo ou Nome");
    obj.armas2:setField("armas2");
    obj.armas2:setTransparent(true);

    obj.armas3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armas3:setParent(obj.rectangle1);
    obj.armas3:setName("armas3");
    obj.armas3:setLeft(409);
    obj.armas3:setTop(955);
    obj.armas3:setWidth(123);
    obj.armas3:setHeight(25);
    obj.armas3:setHorzTextAlign("leading");
    obj.armas3:setFontColor("black");
    lfm_setPropAsString(obj.armas3, "fontStyle", "bold");
    obj.armas3:setFontSize(16);
    obj.armas3:setTextPrompt("Tipo ou Nome");
    obj.armas3:setField("armas3");
    obj.armas3:setTransparent(true);

    obj.armas4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.armas4:setParent(obj.rectangle1);
    obj.armas4:setName("armas4");
    obj.armas4:setLeft(409);
    obj.armas4:setTop(991);
    obj.armas4:setWidth(123);
    obj.armas4:setHeight(25);
    obj.armas4:setHorzTextAlign("leading");
    obj.armas4:setFontColor("black");
    lfm_setPropAsString(obj.armas4, "fontStyle", "bold");
    obj.armas4:setFontSize(16);
    obj.armas4:setTextPrompt("Tipo ou Nome");
    obj.armas4:setField("armas4");
    obj.armas4:setTransparent(true);

    obj.ferramentas1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.ferramentas1:setParent(obj.rectangle1);
    obj.ferramentas1:setName("ferramentas1");
    obj.ferramentas1:setLeft(559);
    obj.ferramentas1:setTop(883);
    obj.ferramentas1:setWidth(123);
    obj.ferramentas1:setHeight(25);
    obj.ferramentas1:setHorzTextAlign("leading");
    obj.ferramentas1:setFontColor("black");
    lfm_setPropAsString(obj.ferramentas1, "fontStyle", "bold");
    obj.ferramentas1:setFontSize(16);
    obj.ferramentas1:setTextPrompt("Tipo");
    obj.ferramentas1:setField("ferramentas1");
    obj.ferramentas1:setTransparent(true);

    obj.ferramentas2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.ferramentas2:setParent(obj.rectangle1);
    obj.ferramentas2:setName("ferramentas2");
    obj.ferramentas2:setLeft(559);
    obj.ferramentas2:setTop(919);
    obj.ferramentas2:setWidth(123);
    obj.ferramentas2:setHeight(25);
    obj.ferramentas2:setHorzTextAlign("leading");
    obj.ferramentas2:setFontColor("black");
    lfm_setPropAsString(obj.ferramentas2, "fontStyle", "bold");
    obj.ferramentas2:setFontSize(16);
    obj.ferramentas2:setTextPrompt("Tipo");
    obj.ferramentas2:setField("ferramentas2");
    obj.ferramentas2:setTransparent(true);

    obj.ferramentas3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.ferramentas3:setParent(obj.rectangle1);
    obj.ferramentas3:setName("ferramentas3");
    obj.ferramentas3:setLeft(559);
    obj.ferramentas3:setTop(955);
    obj.ferramentas3:setWidth(123);
    obj.ferramentas3:setHeight(25);
    obj.ferramentas3:setHorzTextAlign("leading");
    obj.ferramentas3:setFontColor("black");
    lfm_setPropAsString(obj.ferramentas3, "fontStyle", "bold");
    obj.ferramentas3:setFontSize(16);
    obj.ferramentas3:setTextPrompt("Tipo");
    obj.ferramentas3:setField("ferramentas3");
    obj.ferramentas3:setTransparent(true);

    obj.ferramentas4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.ferramentas4:setParent(obj.rectangle1);
    obj.ferramentas4:setName("ferramentas4");
    obj.ferramentas4:setLeft(559);
    obj.ferramentas4:setTop(991);
    obj.ferramentas4:setWidth(123);
    obj.ferramentas4:setHeight(25);
    obj.ferramentas4:setHorzTextAlign("leading");
    obj.ferramentas4:setFontColor("black");
    lfm_setPropAsString(obj.ferramentas4, "fontStyle", "bold");
    obj.ferramentas4:setFontSize(16);
    obj.ferramentas4:setTextPrompt("Tipo");
    obj.ferramentas4:setField("ferramentas4");
    obj.ferramentas4:setTransparent(true);

    obj.periciasEidiomas1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.periciasEidiomas1:setParent(obj.rectangle1);
    obj.periciasEidiomas1:setName("periciasEidiomas1");
    obj.periciasEidiomas1:setLeft(708);
    obj.periciasEidiomas1:setTop(883);
    obj.periciasEidiomas1:setWidth(273);
    obj.periciasEidiomas1:setHeight(25);
    obj.periciasEidiomas1:setHorzTextAlign("leading");
    obj.periciasEidiomas1:setFontColor("black");
    lfm_setPropAsString(obj.periciasEidiomas1, "fontStyle", "bold");
    obj.periciasEidiomas1:setFontSize(16);
    obj.periciasEidiomas1:setTextPrompt("Nome da Pericia/Nome do Idioma");
    obj.periciasEidiomas1:setField("periciasEidiomas1");
    obj.periciasEidiomas1:setTransparent(true);

    obj.periciasEidiomas2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.periciasEidiomas2:setParent(obj.rectangle1);
    obj.periciasEidiomas2:setName("periciasEidiomas2");
    obj.periciasEidiomas2:setLeft(708);
    obj.periciasEidiomas2:setTop(919);
    obj.periciasEidiomas2:setWidth(273);
    obj.periciasEidiomas2:setHeight(25);
    obj.periciasEidiomas2:setHorzTextAlign("leading");
    obj.periciasEidiomas2:setFontColor("black");
    lfm_setPropAsString(obj.periciasEidiomas2, "fontStyle", "bold");
    obj.periciasEidiomas2:setFontSize(16);
    obj.periciasEidiomas2:setTextPrompt("Nome da Pericia/Nome do Idioma");
    obj.periciasEidiomas2:setField("periciasEidiomas2");
    obj.periciasEidiomas2:setTransparent(true);

    obj.periciasEidiomas3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.periciasEidiomas3:setParent(obj.rectangle1);
    obj.periciasEidiomas3:setName("periciasEidiomas3");
    obj.periciasEidiomas3:setLeft(708);
    obj.periciasEidiomas3:setTop(955);
    obj.periciasEidiomas3:setWidth(273);
    obj.periciasEidiomas3:setHeight(25);
    obj.periciasEidiomas3:setHorzTextAlign("leading");
    obj.periciasEidiomas3:setFontColor("black");
    lfm_setPropAsString(obj.periciasEidiomas3, "fontStyle", "bold");
    obj.periciasEidiomas3:setFontSize(16);
    obj.periciasEidiomas3:setTextPrompt("Nome da Pericia/Nome do Idioma");
    obj.periciasEidiomas3:setField("periciasEidiomas3");
    obj.periciasEidiomas3:setTransparent(true);

    obj.periciasEidiomas4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.periciasEidiomas4:setParent(obj.rectangle1);
    obj.periciasEidiomas4:setName("periciasEidiomas4");
    obj.periciasEidiomas4:setLeft(708);
    obj.periciasEidiomas4:setTop(991);
    obj.periciasEidiomas4:setWidth(273);
    obj.periciasEidiomas4:setHeight(25);
    obj.periciasEidiomas4:setHorzTextAlign("leading");
    obj.periciasEidiomas4:setFontColor("black");
    lfm_setPropAsString(obj.periciasEidiomas4, "fontStyle", "bold");
    obj.periciasEidiomas4:setFontSize(16);
    obj.periciasEidiomas4:setTextPrompt("Nome da Pericia/Nome do Idioma");
    obj.periciasEidiomas4:setField("periciasEidiomas4");
    obj.periciasEidiomas4:setTransparent(true);

    obj.armas = GUI.fromHandle(_obj_newObject("edit"));
    obj.armas:setParent(obj.rectangle1);
    obj.armas:setName("armas");
    obj.armas:setLeft(59);
    obj.armas:setTop(1146);
    obj.armas:setWidth(967);
    obj.armas:setHeight(30);
    obj.armas:setHorzTextAlign("leading");
    obj.armas:setFontColor("black");
    lfm_setPropAsString(obj.armas, "fontStyle", "bold");
    obj.armas:setFontSize(16);
    obj.armas:setField("armas");
    obj.armas:setTextPrompt("Armas");

    obj.equipamentos = GUI.fromHandle(_obj_newObject("edit"));
    obj.equipamentos:setParent(obj.rectangle1);
    obj.equipamentos:setName("equipamentos");
    obj.equipamentos:setLeft(59);
    obj.equipamentos:setTop(1180);
    obj.equipamentos:setWidth(967);
    obj.equipamentos:setHeight(30);
    obj.equipamentos:setHorzTextAlign("leading");
    obj.equipamentos:setFontColor("black");
    lfm_setPropAsString(obj.equipamentos, "fontStyle", "bold");
    obj.equipamentos:setFontSize(16);
    obj.equipamentos:setField("equipamentos");
    obj.equipamentos:setTextPrompt("Equipamentos");

    obj.tesouro = GUI.fromHandle(_obj_newObject("edit"));
    obj.tesouro:setParent(obj.rectangle1);
    obj.tesouro:setName("tesouro");
    obj.tesouro:setLeft(59);
    obj.tesouro:setTop(1215);
    obj.tesouro:setWidth(967);
    obj.tesouro:setHeight(30);
    obj.tesouro:setHorzTextAlign("leading");
    obj.tesouro:setFontColor("black");
    lfm_setPropAsString(obj.tesouro, "fontStyle", "bold");
    obj.tesouro:setFontSize(16);
    obj.tesouro:setField("tesouro");
    obj.tesouro:setTextPrompt("Tesouro");

    obj.antecedentes = GUI.fromHandle(_obj_newObject("edit"));
    obj.antecedentes:setParent(obj.rectangle1);
    obj.antecedentes:setName("antecedentes");
    obj.antecedentes:setLeft(59);
    obj.antecedentes:setTop(1250);
    obj.antecedentes:setWidth(967);
    obj.antecedentes:setHeight(30);
    obj.antecedentes:setHorzTextAlign("leading");
    obj.antecedentes:setFontColor("black");
    lfm_setPropAsString(obj.antecedentes, "fontStyle", "bold");
    obj.antecedentes:setFontSize(16);
    obj.antecedentes:setField("antecedentes");
    obj.antecedentes:setTextPrompt("Antecedentes");

    obj.anotacoes1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.anotacoes1:setParent(obj.rectangle1);
    obj.anotacoes1:setName("anotacoes1");
    obj.anotacoes1:setLeft(59);
    obj.anotacoes1:setTop(1285);
    obj.anotacoes1:setWidth(967);
    obj.anotacoes1:setHeight(30);
    obj.anotacoes1:setHorzTextAlign("leading");
    obj.anotacoes1:setFontColor("black");
    lfm_setPropAsString(obj.anotacoes1, "fontStyle", "bold");
    obj.anotacoes1:setFontSize(16);
    obj.anotacoes1:setField("anotacoes1");
    obj.anotacoes1:setTextPrompt("Anotações");

    obj.anotacoes2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.anotacoes2:setParent(obj.rectangle1);
    obj.anotacoes2:setName("anotacoes2");
    obj.anotacoes2:setLeft(59);
    obj.anotacoes2:setTop(1320);
    obj.anotacoes2:setWidth(967);
    obj.anotacoes2:setHeight(30);
    obj.anotacoes2:setHorzTextAlign("leading");
    obj.anotacoes2:setFontColor("black");
    lfm_setPropAsString(obj.anotacoes2, "fontStyle", "bold");
    obj.anotacoes2:setFontSize(16);
    obj.anotacoes2:setField("anotacoes2");
    obj.anotacoes2:setTextPrompt("Anotações");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("forcaBase");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("destrezaBase");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("constituicaoBase");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("inteligenciaBase");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("sabedoriaBase");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("carismaBase");
    obj.dataLink6:setName("dataLink6");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.forcaBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.forcaModificador = mod;
        end);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.destrezaBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.destrezaModificador = mod;
        end);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.constituicaoBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.constituicaoModificador = mod;
        end);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.inteligenciaBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.inteligenciaModificador = mod;
        end);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.sabedoriaBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.sabedoriaModificador = mod;
        end);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            local mod = math.floor(((sheet.carismaBase or 10) - 10) / 2);
                        if (mod >= 0) then
                            mod = "+" .. mod;
                        end;
                        sheet.carismaModificador = mod;
        end);

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

        if self.tesouro ~= nil then self.tesouro:destroy(); self.tesouro = nil; end;
        if self.racaEtamanho ~= nil then self.racaEtamanho:destroy(); self.racaEtamanho = nil; end;
        if self.antecedentes ~= nil then self.antecedentes:destroy(); self.antecedentes = nil; end;
        if self.PVida_Atual ~= nil then self.PVida_Atual:destroy(); self.PVida_Atual = nil; end;
        if self.salvaGuarda1 ~= nil then self.salvaGuarda1:destroy(); self.salvaGuarda1 = nil; end;
        if self.dadoVida2 ~= nil then self.dadoVida2:destroy(); self.dadoVida2 = nil; end;
        if self.armadura3 ~= nil then self.armadura3:destroy(); self.armadura3 = nil; end;
        if self.experiencia ~= nil then self.experiencia:destroy(); self.experiencia = nil; end;
        if self.nivel1 ~= nil then self.nivel1:destroy(); self.nivel1 = nil; end;
        if self.PEnergia_Atual ~= nil then self.PEnergia_Atual:destroy(); self.PEnergia_Atual = nil; end;
        if self.ferramentas1 ~= nil then self.ferramentas1:destroy(); self.ferramentas1 = nil; end;
        if self.pontosDiscricionarios ~= nil then self.pontosDiscricionarios:destroy(); self.pontosDiscricionarios = nil; end;
        if self.bonusProficiencia ~= nil then self.bonusProficiencia:destroy(); self.bonusProficiencia = nil; end;
        if self.armas1 ~= nil then self.armas1:destroy(); self.armas1 = nil; end;
        if self.periciasEidiomas3 ~= nil then self.periciasEidiomas3:destroy(); self.periciasEidiomas3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.PVida_Maxima ~= nil then self.PVida_Maxima:destroy(); self.PVida_Maxima = nil; end;
        if self.dadoVida3 ~= nil then self.dadoVida3:destroy(); self.dadoVida3 = nil; end;
        if self.armadura2 ~= nil then self.armadura2:destroy(); self.armadura2 = nil; end;
        if self.destrezaModificador ~= nil then self.destrezaModificador:destroy(); self.destrezaModificador = nil; end;
        if self.armas4 ~= nil then self.armas4:destroy(); self.armas4 = nil; end;
        if self.periciasEidiomas4 ~= nil then self.periciasEidiomas4:destroy(); self.periciasEidiomas4 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.ferramentas2 ~= nil then self.ferramentas2:destroy(); self.ferramentas2 = nil; end;
        if self.carismaModificador ~= nil then self.carismaModificador:destroy(); self.carismaModificador = nil; end;
        if self.periciasEidiomas2 ~= nil then self.periciasEidiomas2:destroy(); self.periciasEidiomas2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.nomePersonagem ~= nil then self.nomePersonagem:destroy(); self.nomePersonagem = nil; end;
        if self.classe1 ~= nil then self.classe1:destroy(); self.classe1 = nil; end;
        if self.forcaModificador ~= nil then self.forcaModificador:destroy(); self.forcaModificador = nil; end;
        if self.armadura1 ~= nil then self.armadura1:destroy(); self.armadura1 = nil; end;
        if self.Deslocamento ~= nil then self.Deslocamento:destroy(); self.Deslocamento = nil; end;
        if self.anotacoes2 ~= nil then self.anotacoes2:destroy(); self.anotacoes2 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.salvaGuarda4 ~= nil then self.salvaGuarda4:destroy(); self.salvaGuarda4 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.ferramentas3 ~= nil then self.ferramentas3:destroy(); self.ferramentas3 = nil; end;
        if self.constituicaoModificador ~= nil then self.constituicaoModificador:destroy(); self.constituicaoModificador = nil; end;
        if self.constituicaoBase ~= nil then self.constituicaoBase:destroy(); self.constituicaoBase = nil; end;
        if self.sabedoriaModificador ~= nil then self.sabedoriaModificador:destroy(); self.sabedoriaModificador = nil; end;
        if self.nivel2 ~= nil then self.nivel2:destroy(); self.nivel2 = nil; end;
        if self.dadoVida1 ~= nil then self.dadoVida1:destroy(); self.dadoVida1 = nil; end;
        if self.armas2 ~= nil then self.armas2:destroy(); self.armas2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.inteligenciaBase ~= nil then self.inteligenciaBase:destroy(); self.inteligenciaBase = nil; end;
        if self.salvaGuarda3 ~= nil then self.salvaGuarda3:destroy(); self.salvaGuarda3 = nil; end;
        if self.ferramentas4 ~= nil then self.ferramentas4:destroy(); self.ferramentas4 = nil; end;
        if self.descricao ~= nil then self.descricao:destroy(); self.descricao = nil; end;
        if self.alinhamento ~= nil then self.alinhamento:destroy(); self.alinhamento = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.classe3 ~= nil then self.classe3:destroy(); self.classe3 = nil; end;
        if self.nivel3 ~= nil then self.nivel3:destroy(); self.nivel3 = nil; end;
        if self.carismaBase ~= nil then self.carismaBase:destroy(); self.carismaBase = nil; end;
        if self.PEnergia_Maxima ~= nil then self.PEnergia_Maxima:destroy(); self.PEnergia_Maxima = nil; end;
        if self.armas ~= nil then self.armas:destroy(); self.armas = nil; end;
        if self.inteligenciaModificador ~= nil then self.inteligenciaModificador:destroy(); self.inteligenciaModificador = nil; end;
        if self.classeArmadura ~= nil then self.classeArmadura:destroy(); self.classeArmadura = nil; end;
        if self.armas3 ~= nil then self.armas3:destroy(); self.armas3 = nil; end;
        if self.periciasEidiomas1 ~= nil then self.periciasEidiomas1:destroy(); self.periciasEidiomas1 = nil; end;
        if self.nivelExperiencia ~= nil then self.nivelExperiencia:destroy(); self.nivelExperiencia = nil; end;
        if self.nomeJogador ~= nil then self.nomeJogador:destroy(); self.nomeJogador = nil; end;
        if self.equipamentos ~= nil then self.equipamentos:destroy(); self.equipamentos = nil; end;
        if self.destrezaBase ~= nil then self.destrezaBase:destroy(); self.destrezaBase = nil; end;
        if self.salvaGuarda2 ~= nil then self.salvaGuarda2:destroy(); self.salvaGuarda2 = nil; end;
        if self.armadura4 ~= nil then self.armadura4:destroy(); self.armadura4 = nil; end;
        if self.anotacoes1 ~= nil then self.anotacoes1:destroy(); self.anotacoes1 = nil; end;
        if self.forcaBase ~= nil then self.forcaBase:destroy(); self.forcaBase = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.classe2 ~= nil then self.classe2:destroy(); self.classe2 = nil; end;
        if self.sabedoriaBase ~= nil then self.sabedoriaBase:destroy(); self.sabedoriaBase = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaAnimeE51_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaAnimeE51_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaAnimeE51_svg = {
    newEditor = newfrmFichaAnimeE51_svg, 
    new = newfrmFichaAnimeE51_svg, 
    name = "frmFichaAnimeE51_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmFichaAnimeE51_svg = _frmFichaAnimeE51_svg;
Firecast.registrarForm(_frmFichaAnimeE51_svg);

return _frmFichaAnimeE51_svg;
