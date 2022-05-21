require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPendragon()
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
    obj:setDataType("thirteen.Pendragon");
    obj:setTitle("Pendragon 5.2");
    obj:setName("frmPendragon");
    obj:setTheme("dark");


		local function CalcularGloriaAnual()
			local node = NDB.getRoot(sheet);
			local SomaHabs = 0;
			local SomaVirts = 0;
			local SomaBonus = 0;
			
			-- INDEXANDO HABILIDADES
			local tbHabilidades = {
				{sheet.fldCBHab01, sheet.fldHabValor01},
				{sheet.fldCBHab02, sheet.fldHabValor02},
				{sheet.fldCBHab03, sheet.fldHabValor03},
				{sheet.fldCBHab04, sheet.fldHabValor04},
				{sheet.fldCBHab05, sheet.fldHabValor05},
				{sheet.fldCBHab06, sheet.fldHabValor06},
				{sheet.fldCBHab07, sheet.fldHabValor07},
				{sheet.fldCBHab08, sheet.fldHabValor08},
				{sheet.fldCBHab09, sheet.fldHabValor09},
				{sheet.fldCBHab10, sheet.fldHabValor10},
				{sheet.fldCBHab11, sheet.fldHabValor11},
				{sheet.fldCBHab12, sheet.fldHabValor12},
				{sheet.fldCBHab13, sheet.fldHabValor13},
				{sheet.fldCBHab14, sheet.fldHabValor14},
				{sheet.fldCBHab15, sheet.fldHabValor15},
				{sheet.fldCBHab16, sheet.fldHabValor16},
				{sheet.fldCBHab17, sheet.fldHabValor17},
				{sheet.fldCBHab18, sheet.fldHabValor18},
				{sheet.fldCBHab19, sheet.fldHabValor19},
				{sheet.fldCBHab20, sheet.fldHabValor20},
				{sheet.fldCBHab21, sheet.fldHabValor21},
				{sheet.fldCBHab22, sheet.fldHabValor22},
				{sheet.fldCBHab23, sheet.fldHabValor23},
				{sheet.fldCBHab24, sheet.fldHabValor24},
				{sheet.fldCBHab25, sheet.fldHabValor25},
				{sheet.fldCBHab26, sheet.fldHabValor26},
				{sheet.fldCBHab27, sheet.fldHabValor27},
				{sheet.fldCBHab28, sheet.fldHabValor28},
				{sheet.fldCBHab29, sheet.fldHabValor29},
				{sheet.fldCBHab30, sheet.fldHabValor30},
				{sheet.fldCBHab31, sheet.fldHabValor31},
				{sheet.fldCBHab32, sheet.fldHabValor32},
				{sheet.fldCBHab33, sheet.fldHabValor33},
				{sheet.fldCBHab34, sheet.fldHabValor34},
				{sheet.fldCBHab35, sheet.fldHabValor35},
				{sheet.fldCBHab36, sheet.fldHabValor36},
				{sheet.fldCBHab37, sheet.fldHabValor37},
				{sheet.fldCBHab38, sheet.fldHabValor38},
				{sheet.fldCBHab39, sheet.fldHabValor39}, 
				{sheet.fldCBHab40, sheet.fldHabValor40}, 
				{sheet.fldCBHab41, sheet.fldHabValor41}, 
				{sheet.fldCBHab42, sheet.fldHabValor42}, 
				{sheet.fldCBHab43, sheet.fldHabValor43}, 
				{sheet.fldCBHab44, sheet.fldHabValor44}, 
				{sheet.fldCBHab45, sheet.fldHabValor45} 
			}
			
			-- INDEXANDO VIRTUDES
			local tbVirtudes = {
				sheet.fldValCastidade, sheet.fldValLuxuria,
				sheet.fldValEnergia, sheet.fldValPreguica,
				sheet.fldValPerdao, sheet.fldValVinganca,
				sheet.fldValGenerosidade, sheet.fldValEgoismo,
				sheet.fldValHonestidade, sheet.fldValMalicia,
				sheet.fldValJustica, sheet.fldValArbitrariedade,
				sheet.fldValMisericordia, sheet.fldValCrueldade,
				sheet.fldValModestia, sheet.fldValOrgulho,
				sheet.fldValEspiritualidade, sheet.fldValCinismo,
				sheet.fldValPrudencia, sheet.fldValImprudencia,
				sheet.fldValTemperanca, sheet.fldValIndulgencia,
				sheet.fldValConfianca, sheet.fldValDesconfianca,
				sheet.fldValCoragem, sheet.fldValCovardia
			}
			
			-- SOMANDO HABILIDADES CAVALEIRESCAS
			for i = 1, #tbHabilidades do
				if(tbHabilidades[i][1] == "C" and tonumber(tbHabilidades[i][2]) > 15) then SomaHabs = SomaHabs + tbHabilidades[i][2]; end;
			end;
			
			-- SOMANDO VIRTUDES ELEVADAS
			for i = 1, #tbVirtudes do
				if(tonumber((tbVirtudes[i]) or 0) > 15) then SomaVirts = SomaVirts + tonumber(tbVirtudes[i]); end;
			end;
			
			-- CHECANDO BONUS DIVERSOS
			if(self.flagHonra.visible == true) then
				SomaBonus = SomaBonus + 100;
			end;
			if(self.flagReli.visible == true) then
				SomaBonus = SomaBonus + 100;
			end;
			if(self.flagRom.visible == true) then
				SomaBonus = SomaBonus + 100;
			end;
			
			-- SOMANDO BONUS DIVERSOS
			SomaBonus = SomaBonus + (tonumber(node.countSum) or 0);
			
			-- APLICANDO VALOR AO CAMPO
			sheet.fldSomaGloria = "+ " .. tostring(math.floor(SomaHabs + SomaVirts + SomaBonus));
		end;

		local function CalcularVirtude(a)
			-- TRATANDO VARIÁVEIS
			a = a or "";
			-- FORÇANDO VÍCIOS A SOMAREM UM TOTAL DE 20 COM A VIRTUDE PREENCHIDA
			if(a == "virtude") then
				sheet.fldValLuxuria = string.format("%02d",(20 - tonumber(sheet.fldValCastidade)));
				sheet.fldValPreguica = string.format("%02d",(20 - tonumber(sheet.fldValEnergia)));
				sheet.fldValVinganca = string.format("%02d",(20 - tonumber(sheet.fldValPerdao)));
				sheet.fldValEgoismo = string.format("%02d",(20 - tonumber(sheet.fldValGenerosidade)));
				sheet.fldValMalicia = string.format("%02d",(20 - tonumber(sheet.fldValHonestidade)));
				sheet.fldValArbitrariedade = string.format("%02d",(20 - tonumber(sheet.fldValJustica)));
				sheet.fldValCrueldade = string.format("%02d",(20 - tonumber(sheet.fldValMisericordia)));
				sheet.fldValOrgulho = string.format("%02d",(20 - tonumber(sheet.fldValModestia)));
				sheet.fldValCinismo = string.format("%02d",(20 - tonumber(sheet.fldValEspiritualidade)));
				sheet.fldValImprudencia = string.format("%02d",(20 - tonumber(sheet.fldValPrudencia)));
				sheet.fldValIndulgencia = string.format("%02d",(20 - tonumber(sheet.fldValTemperanca)));
				sheet.fldValDesconfianca = string.format("%02d",(20 - tonumber(sheet.fldValConfianca)));
				sheet.fldValCovardia = string.format("%02d",(20 - tonumber(sheet.fldValCoragem)));
				
			-- FORÇANDO VIRTUDES A SOMAREM UM TOTAL DE 20 COM O VÍCIO PREENCHIDO
			elseif(a == "vicio") then
				sheet.fldValCastidade = string.format("%02d",(20 - tonumber(sheet.fldValLuxuria)));
				sheet.fldValEnergia = string.format("%02d",(20 - tonumber(sheet.fldValPreguica)));
				sheet.fldValPerdao = string.format("%02d",(20 - tonumber(sheet.fldValVinganca)));
				sheet.fldValGenerosidade = string.format("%02d",(20 - tonumber(sheet.fldValEgoismo)));
				sheet.fldValHonestidade = string.format("%02d",(20 - tonumber(sheet.fldValMalicia)));
				sheet.fldValJustica = string.format("%02d",(20 - tonumber(sheet.fldValArbitrariedade)));
				sheet.fldValMisericordia = string.format("%02d",(20 - tonumber(sheet.fldValCrueldade)));
				sheet.fldValModestia = string.format("%02d",(20 - tonumber(sheet.fldValOrgulho)));
				sheet.fldValEspiritualidade = string.format("%02d",(20 - tonumber(sheet.fldValCinismo)));
				sheet.fldValPrudencia = string.format("%02d",(20 - tonumber(sheet.fldValImprudencia)));
				sheet.fldValTemperanca = string.format("%02d",(20 - tonumber(sheet.fldValIndulgencia)));
				sheet.fldValConfianca = string.format("%02d",(20 - tonumber(sheet.fldValDesconfianca)));
				sheet.fldValCoragem = string.format("%02d",(20 - tonumber(sheet.fldValCovardia)));
			end;
			
			-- FORMATANDO O TEXTO DOS TRAÇOS ACIMA DE 10
			self.namCastidade.visible = tonumber(sheet.fldValCastidade) < 11;
			self.namCastidadeB.visible = tonumber(sheet.fldValCastidade) > 10;
			self.namLuxuria.visible = tonumber(sheet.fldValLuxuria) < 11;
			self.namLuxuriaB.visible = tonumber(sheet.fldValLuxuria) > 10;
			self.namEnergia.visible = tonumber(sheet.fldValEnergia) < 11;
			self.namEnergiaB.visible = tonumber(sheet.fldValEnergia) > 10;
			self.namPreguica.visible = tonumber(sheet.fldValPreguica) < 11;
			self.namPreguicaB.visible = tonumber(sheet.fldValPreguica) > 10;
			self.namPerdao.visible = tonumber(sheet.fldValPerdao) < 11;
			self.namPerdaoB.visible = tonumber(sheet.fldValPerdao) > 10;
			self.namVinganca.visible = tonumber(sheet.fldValVinganca) < 11;
			self.namVingancaB.visible = tonumber(sheet.fldValVinganca) > 10;
			self.namGenerosidade.visible = tonumber(sheet.fldValGenerosidade) < 11;
			self.namGenerosidadeB.visible = tonumber(sheet.fldValGenerosidade) > 10;
			self.namEgoismo.visible = tonumber(sheet.fldValEgoismo) < 11;
			self.namEgoismoB.visible = tonumber(sheet.fldValEgoismo) > 10;
			self.namHonestidade.visible = tonumber(sheet.fldValHonestidade) < 11;
			self.namHonestidadeB.visible = tonumber(sheet.fldValHonestidade) > 10;
			self.namMalicia.visible = tonumber(sheet.fldValMalicia) < 11;
			self.namMaliciaB.visible = tonumber(sheet.fldValMalicia) > 10;
			self.namJustica.visible = tonumber(sheet.fldValJustica) < 11;
			self.namJusticaB.visible = tonumber(sheet.fldValJustica) > 10;
			self.namArbitrariedade.visible = tonumber(sheet.fldValArbitrariedade) < 11;
			self.namArbitrariedadeB.visible = tonumber(sheet.fldValArbitrariedade) > 10;
			self.namMisericordia.visible = tonumber(sheet.fldValMisericordia) < 11;
			self.namMisericordiaB.visible = tonumber(sheet.fldValMisericordia) > 10;
			self.namCrueldade.visible = tonumber(sheet.fldValCrueldade) < 11;
			self.namCrueldadeB.visible = tonumber(sheet.fldValCrueldade) > 10;
			self.namModestia.visible = tonumber(sheet.fldValModestia) < 11;
			self.namModestiaB.visible = tonumber(sheet.fldValModestia) > 10;
			self.namOrgulho.visible = tonumber(sheet.fldValOrgulho) < 11;
			self.namOrgulhoB.visible = tonumber(sheet.fldValOrgulho) > 10;
			self.namEspiritualidade.visible = tonumber(sheet.fldValEspiritualidade) < 11;
			self.namEspiritualidadeB.visible = tonumber(sheet.fldValEspiritualidade) > 10;
			self.namCinismo.visible = tonumber(sheet.fldValCinismo) < 11;
			self.namCinismoB.visible = tonumber(sheet.fldValCinismo) > 10;
			self.namPrudencia.visible = tonumber(sheet.fldValPrudencia) < 11;
			self.namPrudenciaB.visible = tonumber(sheet.fldValPrudencia) > 10;
			self.namImprudencia.visible = tonumber(sheet.fldValImprudencia) < 11;
			self.namImprudenciaB.visible = tonumber(sheet.fldValImprudencia) > 10;
			self.namTemperanca.visible = tonumber(sheet.fldValTemperanca) < 11;
			self.namTemperancaB.visible = tonumber(sheet.fldValTemperanca) > 10;
			self.namIndulgencia.visible = tonumber(sheet.fldValIndulgencia) < 11;
			self.namIndulgenciaB.visible = tonumber(sheet.fldValIndulgencia) > 10;
			self.namConfianca.visible = tonumber(sheet.fldValConfianca) < 11;
			self.namConfiancaB.visible = tonumber(sheet.fldValConfianca) > 10;
			self.namDesconfianca.visible = tonumber(sheet.fldValDesconfianca) < 11;
			self.namDesconfiancaB.visible = tonumber(sheet.fldValDesconfianca) > 10;
			self.namCoragem.visible = tonumber(sheet.fldValCoragem) < 11;
			self.namCoragemB.visible = tonumber(sheet.fldValCoragem) > 10;
			self.namCovardia.visible = tonumber(sheet.fldValCovardia) < 11;
			self.namCovardiaB.visible = tonumber(sheet.fldValCovardia) > 10;
			
			-- CAPTANDO SOMA DE BÔNUS
			local node = NDB.getRoot(sheet);
			local SomaRom = 0;
			
			-- CHECANDO QUANTAS VIRTUDES ACIMA DE 15
			if(tonumber(sheet.fldValCastidade) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValEnergia) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValPerdao) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValGenerosidade) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValHonestidade) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValJustica) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValMisericordia) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValModestia) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValEspiritualidade) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValPrudencia) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValTemperanca) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValConfianca) > 15) then SomaRom = SomaRom + 1; end;
			if(tonumber(sheet.fldValCoragem) > 15) then SomaRom = SomaRom + 1; end;
			
			-- SOMANDO QUANTAS PAIXÕES ACIMA DE 15
			SomaRom = SomaRom + node.countRom;
			
			-- LIMITANDO NÚMERO DE VIRTUDES E PAIXÕES ACIMA DE 15 PARA 3
			if(SomaRom > 3) then SomaRom = 3; end;
			
			-- CHECANDO SE ALGUM VÍCIO ACIMA DE 15
			if(tonumber(sheet.fldValCastidade) < 5
			or tonumber(sheet.fldValEnergia) < 5 
			or tonumber(sheet.fldValPerdao) < 5 
			or tonumber(sheet.fldValGenerosidade) < 5 
			or tonumber(sheet.fldValHonestidade) < 5 
			or tonumber(sheet.fldValJustica) < 5 
			or tonumber(sheet.fldValMisericordia) < 5 
			or tonumber(sheet.fldValModestia) < 5 
			or tonumber(sheet.fldValEspiritualidade) < 5 
			or tonumber(sheet.fldValPrudencia) < 5 
			or tonumber(sheet.fldValTemperanca) < 5 
			or tonumber(sheet.fldValConfianca) < 5 
			or tonumber(sheet.fldValCoragem) < 5) then 
				SomaRom = SomaRom + 1; 
			end;
			
			-- INICIALIZANDO VARIÁVEIS
			local tbReligiao = {};
			local SomaReligiao = 0;
			
			-- ADICIONANDO VIRTUDES MARCADAS COMO RELIGIOSAS
			if(sheet.fldChCastidade == true) then table.insert(tbReligiao, sheet.fldValCastidade); end;
			if(sheet.fldChEnergia == true) then table.insert(tbReligiao, sheet.fldValEnergia); end;
			if(sheet.fldChPerdao == true) then table.insert(tbReligiao, sheet.fldValPerdao); end;
			if(sheet.fldChGenerosidade == true) then table.insert(tbReligiao, sheet.fldValGenerosidade); end;
			if(sheet.fldChHonestidade == true) then table.insert(tbReligiao, sheet.fldValHonestidade); end;
			if(sheet.fldChJustica == true) then table.insert(tbReligiao, sheet.fldValJustica); end;
			if(sheet.fldChMisericordia == true) then table.insert(tbReligiao, sheet.fldValMisericordia); end;
			if(sheet.fldChModestia == true) then table.insert(tbReligiao, sheet.fldValModestia); end;
			if(sheet.fldChEspiritualidade == true) then table.insert(tbReligiao, sheet.fldValEspiritualidade); end;
			if(sheet.fldChPrudencia == true) then table.insert(tbReligiao, sheet.fldValPrudencia); end;
			if(sheet.fldChTemperanca == true) then table.insert(tbReligiao, sheet.fldValTemperanca); end;
			if(sheet.fldChConfianca == true) then table.insert(tbReligiao, sheet.fldValConfianca); end;
			if(sheet.fldChCoragem == true) then table.insert(tbReligiao, sheet.fldValCoragem); end;
			
			-- ADICIONANDO VÍCIOS MARCADOS COMO RELIGIOSOS
			if(sheet.fldChLuxuria == true) then table.insert(tbReligiao, sheet.fldValLuxuria); end;
			if(sheet.fldChPreguica == true) then table.insert(tbReligiao, sheet.fldValPreguica); end;
			if(sheet.fldChVinganca == true) then table.insert(tbReligiao, sheet.fldValVinganca); end;
			if(sheet.fldChEgoismo == true) then table.insert(tbReligiao, sheet.fldValEgoismo); end;
			if(sheet.fldChMalicia == true) then table.insert(tbReligiao, sheet.fldValMalicia); end;
			if(sheet.fldChArbitrariedade == true) then table.insert(tbReligiao, sheet.fldValArbitrariedade); end;
			if(sheet.fldChCrueldade == true) then table.insert(tbReligiao, sheet.fldValCrueldade); end;
			if(sheet.fldChOrgulho == true) then table.insert(tbReligiao, sheet.fldValOrgulho); end;
			if(sheet.fldChCinismo == true) then table.insert(tbReligiao, sheet.fldValCinismo); end;
			if(sheet.fldChImprudencia == true) then table.insert(tbReligiao, sheet.fldValImprudencia); end;
			if(sheet.fldChIndulgencia == true) then table.insert(tbReligiao, sheet.fldValIndulgencia); end;
			if(sheet.fldChDesconfianca == true) then table.insert(tbReligiao, sheet.fldValDesconfianca); end;
			if(sheet.fldChCovardia == true) then table.insert(tbReligiao, sheet.fldValCovardia); end;
			
			-- SOMANDO VALORES DE TRAÇOS RELIGIOSOS
			for i = 1, #tbReligiao do
				SomaReligiao = SomaReligiao + tbReligiao[i];
			end;
			
			local SomaHonra = (tonumber(sheet.fldValEnergia) or 0) + (tonumber(sheet.fldValGenerosidade) or 0) + (tonumber(sheet.fldValJustica) or 0);
			SomaHonra = SomaHonra + (tonumber(sheet.fldValMisericordia) or 0) + (tonumber(sheet.fldValModestia) or 0) + (tonumber(sheet.fldValCoragem) or 0);
			
			-- APLICANDO RESULTADO NA FICHA
			sheet.fldSomaHonra = string.format("%02d", SomaHonra);
			sheet.fldSomaReligiao = string.format("%02d", SomaReligiao);
			sheet.fldSomaRomance = string.format("%02d", SomaRom);
			
			-- ALTERNANDO VISIBILIDADE DAS FLAGS DOS BÔNUS
			self.flagRom.visible = SomaRom > 3;
			self.flagHonra.visible = SomaHonra > 79;
			self.flagReli.visible = SomaReligiao > 79;
		end;
		
		local function ContabilizarPaixoes()
			if (sheet ~= nil) then
				-- INICIALIZANDO VARIÁVEIS
				local node = NDB.getRoot(sheet);
				local objetos = NDB.getChildNodes(node.fldPaixoes);
				local soma = 0;
				local flagSomaRom = 0;
				
				-- SOMANDO E CONTABILIZANDO PAIXÕES MAIORES DO QUE 15
				for i =1 , #objetos do 
					if(tonumber((objetos[i].valorPX) or 0) > 15) then
						soma = soma + (tonumber(objetos[i].valorPX) or 0);
						flagSomaRom = flagSomaRom + 1;
					end;
				end;
				
				-- ATRIBUINDO VALORES AO NDB
				node.countSum = soma;
				node.countRom = flagSomaRom;
				
				-- RECALCULANDO GLORIA
				CalcularGloriaAnual();
			end;
		end;
		
	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#272727");
    obj.rectangle1:setPadding({top = 20});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(20);
    obj.image1:setWidth(291);
    obj.image1:setHeight(217.5);
    obj.image1:setURL("/images/Dragon.png");
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(33);
    obj.image2:setTop(-23);
    obj.image2:setWidth(623);
    obj.image2:setHeight(534.5);
    obj.image2:setURL("/images/trail.png");
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(120);
    obj.image3:setTop(110);
    obj.image3:setWidth(60);
    obj.image3:setHeight(1516);
    obj.image3:setURL("/images/Border-short.png");
    obj.image3:setStyle("proportional");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setLeft(300);
    obj.image4:setHeight(22);
    obj.image4:setURL("/images/star.png");
    obj.image4:setStyle("proportional");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setLeft(330);
    obj.image5:setTop(80);
    obj.image5:setHeight(22);
    obj.image5:setURL("/images/star.png");
    obj.image5:setStyle("proportional");
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox1);
    obj.image6:setLeft(400);
    obj.image6:setTop(40);
    obj.image6:setHeight(22);
    obj.image6:setURL("/images/star.png");
    obj.image6:setStyle("proportional");
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setLeft(470);
    obj.image7:setTop(0);
    obj.image7:setHeight(18);
    obj.image7:setURL("/images/star.png");
    obj.image7:setStyle("proportional");
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setLeft(540);
    obj.image8:setTop(60);
    obj.image8:setHeight(22);
    obj.image8:setURL("/images/star.png");
    obj.image8:setStyle("proportional");
    obj.image8:setName("image8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox1);
    obj.image9:setLeft(600);
    obj.image9:setTop(15);
    obj.image9:setHeight(18);
    obj.image9:setURL("/images/star.png");
    obj.image9:setStyle("proportional");
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox1);
    obj.image10:setLeft(670);
    obj.image10:setTop(68);
    obj.image10:setHeight(22);
    obj.image10:setURL("/images/star.png");
    obj.image10:setStyle("proportional");
    obj.image10:setName("image10");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox1);
    obj.image11:setLeft(900);
    obj.image11:setTop(30);
    obj.image11:setHeight(20);
    obj.image11:setURL("/images/star.png");
    obj.image11:setStyle("proportional");
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox1);
    obj.image12:setLeft(0);
    obj.image12:setTop(230);
    obj.image12:setHeight(22);
    obj.image12:setURL("/images/star.png");
    obj.image12:setStyle("proportional");
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.scrollBox1);
    obj.image13:setLeft(40);
    obj.image13:setTop(290);
    obj.image13:setHeight(15);
    obj.image13:setURL("/images/star.png");
    obj.image13:setStyle("proportional");
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.scrollBox1);
    obj.image14:setLeft(10);
    obj.image14:setTop(360);
    obj.image14:setHeight(22);
    obj.image14:setURL("/images/star.png");
    obj.image14:setStyle("proportional");
    obj.image14:setName("image14");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.scrollBox1);
    obj.image15:setLeft(45);
    obj.image15:setTop(390);
    obj.image15:setHeight(22);
    obj.image15:setURL("/images/star.png");
    obj.image15:setStyle("proportional");
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.scrollBox1);
    obj.image16:setLeft(0);
    obj.image16:setTop(480);
    obj.image16:setHeight(15);
    obj.image16:setURL("/images/star.png");
    obj.image16:setStyle("proportional");
    obj.image16:setName("image16");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.scrollBox1);
    obj.image17:setLeft(15);
    obj.image17:setTop(610);
    obj.image17:setHeight(18);
    obj.image17:setURL("/images/star.png");
    obj.image17:setStyle("proportional");
    obj.image17:setName("image17");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.scrollBox1);
    obj.image18:setLeft(22);
    obj.image18:setTop(850);
    obj.image18:setHeight(15);
    obj.image18:setURL("/images/star.png");
    obj.image18:setStyle("proportional");
    obj.image18:setName("image18");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.scrollBox1);
    obj.image19:setLeft(390);
    obj.image19:setTop(72);
    obj.image19:setHeight(12);
    obj.image19:setWidth(14);
    obj.image19:setURL("/images/shine.png");
    obj.image19:setName("image19");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.scrollBox1);
    obj.image20:setLeft(480);
    obj.image20:setTop(65);
    obj.image20:setHeight(12);
    obj.image20:setWidth(14);
    obj.image20:setURL("/images/shine.png");
    obj.image20:setName("image20");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.scrollBox1);
    obj.image21:setLeft(587);
    obj.image21:setTop(30);
    obj.image21:setHeight(12);
    obj.image21:setWidth(14);
    obj.image21:setURL("/images/shine.png");
    obj.image21:setName("image21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.scrollBox1);
    obj.image22:setLeft(667);
    obj.image22:setTop(0);
    obj.image22:setHeight(12);
    obj.image22:setWidth(14);
    obj.image22:setURL("/images/shine.png");
    obj.image22:setName("image22");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.scrollBox1);
    obj.image23:setLeft(745);
    obj.image23:setTop(50);
    obj.image23:setHeight(12);
    obj.image23:setWidth(14);
    obj.image23:setURL("/images/shine.png");
    obj.image23:setName("image23");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.scrollBox1);
    obj.image24:setLeft(850);
    obj.image24:setTop(0);
    obj.image24:setHeight(12);
    obj.image24:setWidth(14);
    obj.image24:setURL("/images/shine.png");
    obj.image24:setName("image24");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.scrollBox1);
    obj.image25:setLeft(90);
    obj.image25:setTop(250);
    obj.image25:setHeight(12);
    obj.image25:setWidth(14);
    obj.image25:setURL("/images/shine.png");
    obj.image25:setName("image25");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.scrollBox1);
    obj.image26:setLeft(50);
    obj.image26:setTop(310);
    obj.image26:setHeight(12);
    obj.image26:setWidth(14);
    obj.image26:setURL("/images/shine.png");
    obj.image26:setName("image26");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.scrollBox1);
    obj.image27:setLeft(60);
    obj.image27:setTop(420);
    obj.image27:setHeight(12);
    obj.image27:setWidth(14);
    obj.image27:setURL("/images/shine.png");
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.scrollBox1);
    obj.image28:setLeft(80);
    obj.image28:setTop(560);
    obj.image28:setHeight(12);
    obj.image28:setWidth(14);
    obj.image28:setURL("/images/shine.png");
    obj.image28:setName("image28");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.scrollBox1);
    obj.image29:setLeft(55);
    obj.image29:setTop(700);
    obj.image29:setHeight(12);
    obj.image29:setWidth(14);
    obj.image29:setURL("/images/shine.png");
    obj.image29:setName("image29");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.scrollBox1);
    obj.image30:setLeft(80);
    obj.image30:setTop(740);
    obj.image30:setHeight(12);
    obj.image30:setWidth(14);
    obj.image30:setURL("/images/shine.png");
    obj.image30:setName("image30");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setMargins({left = 185, top = 110});
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(1800);
    obj.layout1:setName("layout1");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.layout1);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Dados");
    obj.tab1:setName("tab1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.tab1);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#272727");
    obj.rectangle2:setPadding({top = 20});

    obj.dLCabecalho = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLCabecalho:setParent(obj.rectangle2);
    obj.dLCabecalho:setName("dLCabecalho");
    obj.dLCabecalho:setFields({'fldNomePJ', 'fldJogador'});
    obj.dLCabecalho:setDefaultValues({'NOME DO PERSONAGEM', 'Jogador'});

    obj.dLDadosIniciais = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDadosIniciais:setParent(obj.rectangle2);
    obj.dLDadosIniciais:setName("dLDadosIniciais");
    obj.dLDadosIniciais:setFields({'fldIdade', 'fldSuserano', 'fldFeudo', 'fldNascimento', 'fldClasseAtual', 'fldRiqueza', 'fldTerraNatal', 'fldClassePai', 'fldCaracteristica'});
    obj.dLDadosIniciais:setDefaultValues({'00 anos', '—', '—', '0', '—', '—', '—', '—', '—'});

    obj.dLDescCaracteristica = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDescCaracteristica:setParent(obj.rectangle2);
    obj.dLDescCaracteristica:setName("dLDescCaracteristica");
    obj.dLDescCaracteristica:setField("fldCarHabilidade");
    obj.dLDescCaracteristica:setDefaultValue("+00 HABILIDADE");

    obj.dLDadosAdicionais = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLDadosAdicionais:setParent(obj.rectangle2);
    obj.dLDadosAdicionais:setName("dLDadosAdicionais");
    obj.dLDadosAdicionais:setFields({'fldCultura', 'fldReligiao', 'fldGloria', 'fldNvGloria', 'fldGloriaAnual', 'fldSomaGloria'});
    obj.dLDadosAdicionais:setDefaultValues({'—', '—', '0', '0', '0', '0'});

    obj.dLAtributosDerivados = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLAtributosDerivados:setParent(obj.rectangle2);
    obj.dLAtributosDerivados:setName("dLAtributosDerivados");
    obj.dLAtributosDerivados:setFields({'fldCarDistintiva', 'fldFerimentos'});
    obj.dLAtributosDerivados:setDefaultValues({'—', '—'});

    obj.dLUpgrades = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dLUpgrades:setParent(obj.rectangle2);
    obj.dLUpgrades:setName("dLUpgrades");
    obj.dLUpgrades:setFields({'fldUpgradesGlor', 'fldUpgradesInv'});
    obj.dLUpgrades:setDefaultValues({'—', '—'});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("fldHab01");
    obj.dataLink1:setDefaultValue("Adaga");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setField("fldHab02");
    obj.dataLink2:setDefaultValue("Arco");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setField("fldHab03");
    obj.dataLink3:setDefaultValue("Batalha");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setField("fldHab04");
    obj.dataLink4:setDefaultValue("Besta");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setField("fldHab05");
    obj.dataLink5:setDefaultValue("Dardo");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setField("fldHab06");
    obj.dataLink6:setDefaultValue("Equitação");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle2);
    obj.dataLink7:setField("fldHab07");
    obj.dataLink7:setDefaultValue("Espada");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle2);
    obj.dataLink8:setField("fldHab08");
    obj.dataLink8:setDefaultValue("Grande Lança");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle2);
    obj.dataLink9:setField("fldHab09");
    obj.dataLink9:setDefaultValue("Grande Machado");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle2);
    obj.dataLink10:setField("fldHab10");
    obj.dataLink10:setDefaultValue("Lança");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle2);
    obj.dataLink11:setField("fldHab11");
    obj.dataLink11:setDefaultValue("Lança Montada");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle2);
    obj.dataLink12:setField("fldHab12");
    obj.dataLink12:setDefaultValue("Machado");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle2);
    obj.dataLink13:setField("fldHab13");
    obj.dataLink13:setDefaultValue("Maça");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle2);
    obj.dataLink14:setField("fldHab14");
    obj.dataLink14:setDefaultValue("—");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle2);
    obj.dataLink15:setField("fldHab15");
    obj.dataLink15:setDefaultValue("—");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle2);
    obj.dataLink16:setField("fldHab16");
    obj.dataLink16:setDefaultValue("Administração");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle2);
    obj.dataLink17:setField("fldHab17");
    obj.dataLink17:setDefaultValue("Atenção");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle2);
    obj.dataLink18:setField("fldHab18");
    obj.dataLink18:setDefaultValue("Canto");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.rectangle2);
    obj.dataLink19:setField("fldHab19");
    obj.dataLink19:setDefaultValue("Caça");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.rectangle2);
    obj.dataLink20:setField("fldHab20");
    obj.dataLink20:setDefaultValue("Cirurgia");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle2);
    obj.dataLink21:setField("fldHab21");
    obj.dataLink21:setDefaultValue("Composição");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.rectangle2);
    obj.dataLink22:setField("fldHab22");
    obj.dataLink22:setDefaultValue("Cortesia");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.rectangle2);
    obj.dataLink23:setField("fldHab23");
    obj.dataLink23:setDefaultValue("Dança");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.rectangle2);
    obj.dataLink24:setField("fldHab24");
    obj.dataLink24:setDefaultValue("Falcoaria");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.rectangle2);
    obj.dataLink25:setField("fldHab25");
    obj.dataLink25:setDefaultValue("Feerismo");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.rectangle2);
    obj.dataLink26:setField("fldHab26");
    obj.dataLink26:setDefaultValue("Flerte");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.rectangle2);
    obj.dataLink27:setField("fldHab27");
    obj.dataLink27:setDefaultValue("Folclore");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.rectangle2);
    obj.dataLink28:setField("fldHab28");
    obj.dataLink28:setDefaultValue("Heráldica");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle2);
    obj.dataLink29:setField("fldHab29");
    obj.dataLink29:setDefaultValue("Intriga");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle2);
    obj.dataLink30:setField("fldHab30");
    obj.dataLink30:setDefaultValue("Jogos");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle2);
    obj.dataLink31:setField("fldHab31");
    obj.dataLink31:setDefaultValue("Leitura (Língua)");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle2);
    obj.dataLink32:setField("fldHab32");
    obj.dataLink32:setDefaultValue("Moda");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle2);
    obj.dataLink33:setField("fldHab33");
    obj.dataLink33:setDefaultValue("Natação");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle2);
    obj.dataLink34:setField("fldHab34");
    obj.dataLink34:setDefaultValue("Navegação");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle2);
    obj.dataLink35:setField("fldHab35");
    obj.dataLink35:setDefaultValue("Ofícios");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle2);
    obj.dataLink36:setField("fldHab36");
    obj.dataLink36:setDefaultValue("Oratória");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle2);
    obj.dataLink37:setField("fldHab37");
    obj.dataLink37:setDefaultValue("Primeiros Socorros");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle2);
    obj.dataLink38:setField("fldHab38");
    obj.dataLink38:setDefaultValue("Reconhecimento");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle2);
    obj.dataLink39:setField("fldHab39");
    obj.dataLink39:setDefaultValue("Religião (Fé)");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle2);
    obj.dataLink40:setField("fldHab40");
    obj.dataLink40:setDefaultValue("Romance");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle2);
    obj.dataLink41:setField("fldHab41");
    obj.dataLink41:setDefaultValue("Tocar (Instrumento)");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle2);
    obj.dataLink42:setField("fldHab42");
    obj.dataLink42:setDefaultValue("Torneio");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle2);
    obj.dataLink43:setField("fldHab43");
    obj.dataLink43:setDefaultValue("—");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle2);
    obj.dataLink44:setField("fldHab44");
    obj.dataLink44:setDefaultValue("—");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle2);
    obj.dataLink45:setField("fldHab45");
    obj.dataLink45:setDefaultValue("—");
    obj.dataLink45:setName("dataLink45");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle2);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(60);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("☙");
    obj.label1:setFontColor("#0080ff");
    obj.label1:setFontFamily("Palatino Linotype");
    obj.label1:setFontSize(28);
    obj.label1:setTop(7);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("fldNomePJ");
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("#0080ff");
    obj.edit1:setFontFamily("Palatino Linotype");
    obj.edit1:setFontSize(26);
    obj.edit1:setTextTrimming("character");
    obj.edit1:setWidth(700);
    obj.edit1:setLeft(35);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setHeight(2);
    obj.rectangle3:setWidth(650);
    obj.rectangle3:setTop(33);
    obj.rectangle3:setColor("#0080ff");
    obj.rectangle3:setName("rectangle3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setField("fldJogador");
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("white");
    obj.edit2:setFontFamily("Palatino Linotype");
    obj.edit2:setFontSize(13);
    obj.edit2:setTextTrimming("character");
    obj.edit2:setWidth(700);
    obj.edit2:setHeight(33);
    obj.edit2:setTop(33);
    obj.edit2:setLeft(37);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(90);
    obj.layout3:setMargins({left = 40, top = 20});
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setHeight(90);
    obj.layout4:setName("layout4");
    obj.layout4:setWidth(209);
    obj.layout4:setAlign("left");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");
    obj.layout5:setAlign("top");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setText("Idade:");
    obj.label2:setWidth(41);
    obj.label2:setName("label2");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("white");
    obj.label2:setFontFamily("Cambria");
    obj.label2:setFontSize(14);
    obj.label2:setAlign("left");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(159);
    obj.layout6:setName("layout6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setField("fldIdade");
    obj.edit3:setWidth(159);
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setFontSize(14);
    obj.edit3:setHeight(30);
    obj.edit3:setTransparent(true);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setHeight(30);
    obj.layout7:setName("layout7");
    obj.layout7:setAlign("top");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout7);
    obj.label3:setText("Suserano:");
    obj.label3:setWidth(64);
    obj.label3:setName("label3");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("white");
    obj.label3:setFontFamily("Cambria");
    obj.label3:setFontSize(14);
    obj.label3:setAlign("left");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(136);
    obj.layout8:setName("layout8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setField("fldSuserano");
    obj.edit4:setWidth(136);
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setFontFamily("Cambria");
    obj.edit4:setFontSize(14);
    obj.edit4:setHeight(30);
    obj.edit4:setTransparent(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");
    obj.layout9:setAlign("top");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout9);
    obj.label4:setText("Feudo:");
    obj.label4:setWidth(44);
    obj.label4:setName("label4");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("white");
    obj.label4:setFontFamily("Cambria");
    obj.label4:setFontSize(14);
    obj.label4:setAlign("left");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(156);
    obj.layout10:setName("layout10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout10);
    obj.edit5:setField("fldFeudo");
    obj.edit5:setWidth(156);
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setFontFamily("Cambria");
    obj.edit5:setFontSize(14);
    obj.edit5:setHeight(30);
    obj.edit5:setTransparent(true);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout3);
    obj.layout11:setHeight(90);
    obj.layout11:setName("layout11");
    obj.layout11:setWidth(209);
    obj.layout11:setAlign("left");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");
    obj.layout12:setAlign("top");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout12);
    obj.label5:setText("Ordem de Nascimento:");
    obj.label5:setWidth(146);
    obj.label5:setName("label5");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("white");
    obj.label5:setFontFamily("Cambria");
    obj.label5:setFontSize(14);
    obj.label5:setAlign("left");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(54);
    obj.layout13:setName("layout13");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout13);
    obj.edit6:setField("fldNascimento");
    obj.edit6:setWidth(54);
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setFontFamily("Cambria");
    obj.edit6:setFontSize(14);
    obj.edit6:setHeight(30);
    obj.edit6:setTransparent(true);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");
    obj.layout14:setAlign("top");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout14);
    obj.label6:setText("Classe:");
    obj.label6:setWidth(46);
    obj.label6:setName("label6");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("white");
    obj.label6:setFontFamily("Cambria");
    obj.label6:setFontSize(14);
    obj.label6:setAlign("left");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(154);
    obj.layout15:setName("layout15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout15);
    obj.edit7:setField("fldClasseAtual");
    obj.edit7:setWidth(154);
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setFontFamily("Cambria");
    obj.edit7:setFontSize(14);
    obj.edit7:setHeight(30);
    obj.edit7:setTransparent(true);

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");
    obj.layout16:setAlign("top");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout16);
    obj.label7:setText("Riqueza:");
    obj.label7:setWidth(57);
    obj.label7:setName("label7");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontColor("white");
    obj.label7:setFontFamily("Cambria");
    obj.label7:setFontSize(14);
    obj.label7:setAlign("left");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(143);
    obj.layout17:setName("layout17");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout17);
    obj.edit8:setField("fldRiqueza");
    obj.edit8:setWidth(143);
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setFontFamily("Cambria");
    obj.edit8:setFontSize(14);
    obj.edit8:setHeight(30);
    obj.edit8:setTransparent(true);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout3);
    obj.layout18:setHeight(90);
    obj.layout18:setName("layout18");
    obj.layout18:setWidth(250);
    obj.layout18:setAlign("left");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");
    obj.layout19:setAlign("top");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout19);
    obj.label8:setText("Terra Natal:");
    obj.label8:setWidth(77);
    obj.label8:setName("label8");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontColor("white");
    obj.label8:setFontFamily("Cambria");
    obj.label8:setFontSize(14);
    obj.label8:setAlign("left");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(173);
    obj.layout20:setName("layout20");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout20);
    obj.edit9:setField("fldTerraNatal");
    obj.edit9:setWidth(173);
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("#cdcdcd");
    obj.edit9:setFontFamily("Cambria");
    obj.edit9:setFontSize(14);
    obj.edit9:setHeight(30);
    obj.edit9:setTransparent(true);

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setHeight(30);
    obj.layout21:setName("layout21");
    obj.layout21:setAlign("top");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout21);
    obj.label9:setText("Classe do Pai:");
    obj.label9:setWidth(87);
    obj.label9:setName("label9");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontColor("white");
    obj.label9:setFontFamily("Cambria");
    obj.label9:setFontSize(14);
    obj.label9:setAlign("left");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(163);
    obj.layout22:setName("layout22");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout22);
    obj.edit10:setField("fldClassePai");
    obj.edit10:setWidth(163);
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("#cdcdcd");
    obj.edit10:setFontFamily("Cambria");
    obj.edit10:setFontSize(14);
    obj.edit10:setHeight(30);
    obj.edit10:setTransparent(true);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout18);
    obj.layout23:setHeight(30);
    obj.layout23:setName("layout23");
    obj.layout23:setAlign("top");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout23);
    obj.label10:setText("Característica:");
    obj.label10:setWidth(93);
    obj.label10:setName("label10");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontColor("white");
    obj.label10:setFontFamily("Cambria");
    obj.label10:setFontSize(14);
    obj.label10:setAlign("left");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(157);
    obj.layout24:setName("layout24");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout24);
    obj.edit11:setField("fldCaracteristica");
    obj.edit11:setWidth(157);
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#cdcdcd");
    obj.edit11:setFontFamily("Cambria");
    obj.edit11:setFontSize(14);
    obj.edit11:setHeight(30);
    obj.edit11:setTransparent(true);

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle2);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(20);
    obj.layout25:setName("layout25");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout25);
    obj.edit12:setField("fldCarHabilidade");
    obj.edit12:setFontColor("#858585");
    obj.edit12:setFontFamily("Palatino Linotype");
    obj.edit12:setFontSize(10);
    obj.edit12:setTransparent(true);
    obj.edit12:setLeft(550);
    obj.edit12:setWidth(157);
    obj.edit12:setTop(-10);
    obj.edit12:setName("edit12");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle2);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(500);
    obj.layout26:setName("layout26");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.layout26);
    obj.image31:setLeft(0);
    obj.image31:setTop(0);
    obj.image31:setWidth(650);
    obj.image31:setHeight(400);
    obj.image31:setURL("/images/shield-flare.png");
    obj.image31:setStyle("proportional");
    obj.image31:setCenter(true);
    obj.image31:setName("image31");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.layout26);
    obj.image32:setField("fldBrasao");
    obj.image32:setHeight(290);
    obj.image32:setTop(170);
    obj.image32:setWidth(240);
    obj.image32:setLeft(205);
    obj.image32:setStyle("proportional");
    obj.image32:setCenter(true);
    obj.image32:setEditable(true);
    obj.image32:setHint("Alterar Brasão");
    obj.image32:setName("image32");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout26);
    obj.dataLink46:setField("fldBrasao");
    obj.dataLink46:setDefaultValue("/images/heraldry.png");
    obj.dataLink46:setName("dataLink46");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle2);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(60);
    obj.layout27:setMargins({left = 40, top = 25});
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setName("layout28");
    obj.layout28:setWidth(209);
    obj.layout28:setAlign("left");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setHeight(30);
    obj.layout29:setName("layout29");
    obj.layout29:setAlign("top");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout29);
    obj.label11:setText("Cultura:");
    obj.label11:setWidth(52);
    obj.label11:setName("label11");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontColor("white");
    obj.label11:setFontFamily("Cambria");
    obj.label11:setFontSize(14);
    obj.label11:setAlign("left");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(148);
    obj.layout30:setName("layout30");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout30);
    obj.edit13:setField("fldCultura");
    obj.edit13:setWidth(148);
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#cdcdcd");
    obj.edit13:setFontFamily("Cambria");
    obj.edit13:setFontSize(14);
    obj.edit13:setHeight(30);
    obj.edit13:setTransparent(true);

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setName("layout31");
    obj.layout31:setWidth(209);
    obj.layout31:setAlign("left");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setHeight(30);
    obj.layout32:setName("layout32");
    obj.layout32:setAlign("top");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout32);
    obj.label12:setText("Religião:");
    obj.label12:setWidth(58);
    obj.label12:setName("label12");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setFontColor("white");
    obj.label12:setFontFamily("Cambria");
    obj.label12:setFontSize(14);
    obj.label12:setAlign("left");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(142);
    obj.layout33:setName("layout33");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout33);
    obj.edit14:setField("fldReligiao");
    obj.edit14:setWidth(142);
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("#cdcdcd");
    obj.edit14:setFontFamily("Cambria");
    obj.edit14:setFontSize(14);
    obj.edit14:setHeight(30);
    obj.edit14:setTransparent(true);

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout31);
    obj.layout34:setHeight(30);
    obj.layout34:setName("layout34");
    obj.layout34:setAlign("top");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout34);
    obj.label13:setText("Glória");
    obj.label13:setWidth(44);
    obj.label13:setName("label13");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontColor("white");
    obj.label13:setFontFamily("Cambria");
    obj.label13:setFontSize(14);
    obj.label13:setAlign("left");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(156);
    obj.layout35:setName("layout35");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout35);
    obj.edit15:setField("fldGloria");
    obj.edit15:setWidth(156);
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("#cdcdcd");
    obj.edit15:setFontFamily("Cambria");
    obj.edit15:setFontSize(14);
    obj.edit15:setHeight(30);
    obj.edit15:setTransparent(true);

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout27);
    obj.layout36:setName("layout36");
    obj.layout36:setWidth(250);
    obj.layout36:setAlign("left");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setHeight(30);
    obj.layout37:setName("layout37");
    obj.layout37:setAlign("top");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout37);
    obj.label14:setText("Níveis de Glória:");
    obj.label14:setWidth(105);
    obj.label14:setName("label14");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setFontColor("white");
    obj.label14:setFontFamily("Cambria");
    obj.label14:setFontSize(14);
    obj.label14:setAlign("left");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(145);
    obj.layout38:setName("layout38");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout38);
    obj.edit16:setField("fldNvGloria");
    obj.edit16:setWidth(145);
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("#cdcdcd");
    obj.edit16:setFontFamily("Cambria");
    obj.edit16:setFontSize(14);
    obj.edit16:setHeight(30);
    obj.edit16:setTransparent(true);

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout36);
    obj.layout39:setName("layout39");
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout39);
    obj.label15:setText("Glória Anual:");
    obj.label15:setWidth(85);
    obj.label15:setName("label15");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setFontColor("white");
    obj.label15:setFontFamily("Cambria");
    obj.label15:setFontSize(14);
    obj.label15:setAlign("left");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(40);
    obj.layout40:setName("layout40");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout40);
    obj.edit17:setField("fldGloriaAnual");
    obj.edit17:setWidth(40);
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("#cdcdcd");
    obj.edit17:setFontFamily("Cambria");
    obj.edit17:setFontSize(14);
    obj.edit17:setHeight(30);
    obj.edit17:setTransparent(true);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout39);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(163);
    obj.layout41:setName("layout41");

    obj.namSomaGloria = GUI.fromHandle(_obj_newObject("label"));
    obj.namSomaGloria:setParent(obj.layout41);
    obj.namSomaGloria:setName("namSomaGloria");
    obj.namSomaGloria:setField("fldSomaGloria");
    obj.namSomaGloria:setWidth(165);
    lfm_setPropAsString(obj.namSomaGloria, "fontStyle",  "bold");
    obj.namSomaGloria:setFontColor("white");
    obj.namSomaGloria:setFontFamily("Cambria");
    obj.namSomaGloria:setFontSize(14);
    obj.namSomaGloria:setAlign("left");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle2);
    obj.layout42:setAlign("top");
    obj.layout42:setName("layout42");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout42);
    obj.label16:setAlign("left");
    obj.label16:setText("☙ ATRIBUTOS");
    obj.label16:setWidth(150);
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setFontColor("#0080ff");
    obj.label16:setFontFamily("Palatino Linotype");
    obj.label16:setFontSize(20);
    obj.label16:setName("label16");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(500);
    obj.layout43:setName("layout43");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout43);
    obj.rectangle4:setHeight(2);
    obj.rectangle4:setWidth(500);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setColor("#0080ff");
    obj.rectangle4:setName("rectangle4");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle2);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(165);
    obj.layout44:setName("layout44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(115);
    obj.layout45:setMargins({right=18});
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(30);
    obj.layout46:setName("layout46");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout46);
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

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout45);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(173);
    obj.layout47:setName("layout47");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.layout47);
    obj.image33:setWidth(143);
    obj.image33:setURL("/images/shield.png");
    obj.image33:setStyle("proportional");
    obj.image33:setName("image33");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout45);
    obj.layout48:setWidth(143);
    obj.layout48:setTop(55);
    obj.layout48:setLeft(38);
    obj.layout48:setName("layout48");

    obj.TAM = GUI.fromHandle(_obj_newObject("edit"));
    obj.TAM:setParent(obj.layout48);
    obj.TAM:setName("TAM");
    obj.TAM:setField("fldTamanho");
    obj.TAM:setHint("Tamanho");
    obj.TAM:setHitTest(true);
    obj.TAM:setText("00");
    obj.TAM:setWidth(66);
    obj.TAM:setAlign("left");
    lfm_setPropAsString(obj.TAM, "fontStyle",  "bold");
    obj.TAM:setFontColor("white");
    obj.TAM:setFontFamily("Cambria");
    obj.TAM:setFontSize(47);
    obj.TAM:setHorzTextAlign("center");
    obj.TAM:setType("number");
    obj.TAM:setMin(0);
    obj.TAM:setMax(99);
    obj.TAM:setTransparent(true);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout44);
    obj.dataLink47:setField("fldTamanho");
    obj.dataLink47:setDefaultValue("0");
    obj.dataLink47:setName("dataLink47");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout44);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(115);
    obj.layout49:setMargins({right=18});
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(30);
    obj.layout50:setName("layout50");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout50);
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

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(173);
    obj.layout51:setName("layout51");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.layout51);
    obj.image34:setWidth(143);
    obj.image34:setURL("/images/shield.png");
    obj.image34:setStyle("proportional");
    obj.image34:setName("image34");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setWidth(143);
    obj.layout52:setTop(55);
    obj.layout52:setLeft(38);
    obj.layout52:setName("layout52");

    obj.DES = GUI.fromHandle(_obj_newObject("edit"));
    obj.DES:setParent(obj.layout52);
    obj.DES:setName("DES");
    obj.DES:setField("fldDestreza");
    obj.DES:setHint("Destreza");
    obj.DES:setHitTest(true);
    obj.DES:setText("00");
    obj.DES:setWidth(66);
    obj.DES:setAlign("left");
    lfm_setPropAsString(obj.DES, "fontStyle",  "bold");
    obj.DES:setFontColor("white");
    obj.DES:setFontFamily("Cambria");
    obj.DES:setFontSize(47);
    obj.DES:setHorzTextAlign("center");
    obj.DES:setType("number");
    obj.DES:setMin(0);
    obj.DES:setMax(99);
    obj.DES:setTransparent(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout44);
    obj.dataLink48:setField("fldDestreza");
    obj.dataLink48:setDefaultValue("0");
    obj.dataLink48:setName("dataLink48");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout44);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(115);
    obj.layout53:setMargins({right=18});
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(30);
    obj.layout54:setName("layout54");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout54);
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

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout53);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(173);
    obj.layout55:setName("layout55");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.layout55);
    obj.image35:setWidth(143);
    obj.image35:setURL("/images/shield.png");
    obj.image35:setStyle("proportional");
    obj.image35:setName("image35");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout53);
    obj.layout56:setWidth(143);
    obj.layout56:setTop(55);
    obj.layout56:setLeft(38);
    obj.layout56:setName("layout56");

    obj.FOR = GUI.fromHandle(_obj_newObject("edit"));
    obj.FOR:setParent(obj.layout56);
    obj.FOR:setName("FOR");
    obj.FOR:setField("fldForca");
    obj.FOR:setHint("Força");
    obj.FOR:setHitTest(true);
    obj.FOR:setText("00");
    obj.FOR:setWidth(66);
    obj.FOR:setAlign("left");
    lfm_setPropAsString(obj.FOR, "fontStyle",  "bold");
    obj.FOR:setFontColor("white");
    obj.FOR:setFontFamily("Cambria");
    obj.FOR:setFontSize(47);
    obj.FOR:setHorzTextAlign("center");
    obj.FOR:setType("number");
    obj.FOR:setMin(0);
    obj.FOR:setMax(99);
    obj.FOR:setTransparent(true);

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout44);
    obj.dataLink49:setField("fldForca");
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setName("dataLink49");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout44);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(115);
    obj.layout57:setMargins({right=18});
    obj.layout57:setName("layout57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout57);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(30);
    obj.layout58:setName("layout58");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout58);
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

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout57);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(173);
    obj.layout59:setName("layout59");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.layout59);
    obj.image36:setWidth(143);
    obj.image36:setURL("/images/shield.png");
    obj.image36:setStyle("proportional");
    obj.image36:setName("image36");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout57);
    obj.layout60:setWidth(143);
    obj.layout60:setTop(55);
    obj.layout60:setLeft(38);
    obj.layout60:setName("layout60");

    obj.CON = GUI.fromHandle(_obj_newObject("edit"));
    obj.CON:setParent(obj.layout60);
    obj.CON:setName("CON");
    obj.CON:setField("fldConstituicao");
    obj.CON:setHint("Constituição");
    obj.CON:setHitTest(true);
    obj.CON:setText("00");
    obj.CON:setWidth(66);
    obj.CON:setAlign("left");
    lfm_setPropAsString(obj.CON, "fontStyle",  "bold");
    obj.CON:setFontColor("white");
    obj.CON:setFontFamily("Cambria");
    obj.CON:setFontSize(47);
    obj.CON:setHorzTextAlign("center");
    obj.CON:setType("number");
    obj.CON:setMin(0);
    obj.CON:setMax(99);
    obj.CON:setTransparent(true);

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout44);
    obj.dataLink50:setField("fldConstituicao");
    obj.dataLink50:setDefaultValue("0");
    obj.dataLink50:setName("dataLink50");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout44);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(115);
    obj.layout61:setMargins({right=18});
    obj.layout61:setName("layout61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout61);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(30);
    obj.layout62:setName("layout62");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout62);
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

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout61);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(173);
    obj.layout63:setName("layout63");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.layout63);
    obj.image37:setWidth(143);
    obj.image37:setURL("/images/shield.png");
    obj.image37:setStyle("proportional");
    obj.image37:setName("image37");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout61);
    obj.layout64:setWidth(143);
    obj.layout64:setTop(55);
    obj.layout64:setLeft(38);
    obj.layout64:setName("layout64");

    obj.APA = GUI.fromHandle(_obj_newObject("edit"));
    obj.APA:setParent(obj.layout64);
    obj.APA:setName("APA");
    obj.APA:setField("fldAparencia");
    obj.APA:setHint("Aparência");
    obj.APA:setHitTest(true);
    obj.APA:setText("00");
    obj.APA:setWidth(66);
    obj.APA:setAlign("left");
    lfm_setPropAsString(obj.APA, "fontStyle",  "bold");
    obj.APA:setFontColor("white");
    obj.APA:setFontFamily("Cambria");
    obj.APA:setFontSize(47);
    obj.APA:setHorzTextAlign("center");
    obj.APA:setType("number");
    obj.APA:setMin(0);
    obj.APA:setMax(99);
    obj.APA:setTransparent(true);

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout44);
    obj.dataLink51:setField("fldAparencia");
    obj.dataLink51:setDefaultValue("0");
    obj.dataLink51:setName("dataLink51");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle2);
    obj.layout65:setAlign("top");
    obj.layout65:setMargins({left = 40, top = 0});
    obj.layout65:setName("layout65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setName("layout66");
    obj.layout66:setWidth(209);
    obj.layout66:setAlign("left");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setName("layout67");
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(30);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout67);
    obj.label22:setText("Dano:");
    obj.label22:setWidth(40);
    obj.label22:setHint("(FOR+TAM)/6");
    obj.label22:setHitTest(true);
    obj.label22:setName("label22");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setFontColor("white");
    obj.label22:setFontFamily("Cambria");
    obj.label22:setFontSize(14);
    obj.label22:setAlign("left");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout67);
    obj.label23:setField("fldDano");
    obj.label23:setHint("(FOR+TAM)/6");
    obj.label23:setHitTest(true);
    obj.label23:setName("label23");
    obj.label23:setFontColor("#6f6f6f");
    obj.label23:setFontFamily("Cambria");
    obj.label23:setFontSize(14);
    obj.label23:setAlign("left");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout66);
    obj.layout68:setName("layout68");
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(30);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout68);
    obj.label24:setText("Movimento:");
    obj.label24:setWidth(80);
    obj.label24:setHint("(FOR+DES)/10");
    obj.label24:setHitTest(true);
    obj.label24:setName("label24");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setFontColor("white");
    obj.label24:setFontFamily("Cambria");
    obj.label24:setFontSize(14);
    obj.label24:setAlign("left");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout68);
    obj.label25:setField("fldMovimento");
    obj.label25:setHint("(FOR+DES)/10");
    obj.label25:setHitTest(true);
    obj.label25:setName("label25");
    obj.label25:setFontColor("#6f6f6f");
    obj.label25:setFontFamily("Cambria");
    obj.label25:setFontSize(14);
    obj.label25:setAlign("left");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout65);
    obj.layout69:setName("layout69");
    obj.layout69:setWidth(209);
    obj.layout69:setAlign("left");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setName("layout70");
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(30);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout70);
    obj.label26:setText("Regeneração:");
    obj.label26:setWidth(90);
    obj.label26:setHint("(FOR+CON)/10");
    obj.label26:setHitTest(true);
    obj.label26:setName("label26");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setFontColor("white");
    obj.label26:setFontFamily("Cambria");
    obj.label26:setFontSize(14);
    obj.label26:setAlign("left");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout70);
    obj.label27:setField("fldRegen");
    obj.label27:setHint("(FOR+CON)/10");
    obj.label27:setHitTest(true);
    obj.label27:setName("label27");
    obj.label27:setFontColor("#6f6f6f");
    obj.label27:setFontFamily("Cambria");
    obj.label27:setFontSize(14);
    obj.label27:setAlign("left");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setName("layout71");
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(30);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout71);
    obj.label28:setText("HP:");
    obj.label28:setWidth(25);
    obj.label28:setHint("TAM+CON");
    obj.label28:setHitTest(true);
    obj.label28:setName("label28");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setFontColor("white");
    obj.label28:setFontFamily("Cambria");
    obj.label28:setFontSize(14);
    obj.label28:setAlign("left");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout71);
    obj.label29:setField("fldHP");
    obj.label29:setHint("TAM+CON");
    obj.label29:setHitTest(true);
    obj.label29:setName("label29");
    obj.label29:setFontColor("#6f6f6f");
    obj.label29:setFontFamily("Cambria");
    obj.label29:setFontSize(14);
    obj.label29:setAlign("left");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout65);
    obj.layout72:setName("layout72");
    obj.layout72:setWidth(209);
    obj.layout72:setAlign("left");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73:setName("layout73");
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(30);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout73);
    obj.label30:setText("");
    obj.label30:setWidth(40);
    obj.label30:setName("label30");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setFontColor("white");
    obj.label30:setFontFamily("Cambria");
    obj.label30:setFontSize(14);
    obj.label30:setAlign("left");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout73);
    obj.label31:setText("");
    obj.label31:setName("label31");
    obj.label31:setFontColor("#6f6f6f");
    obj.label31:setFontFamily("Cambria");
    obj.label31:setFontSize(14);
    obj.label31:setAlign("left");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout72);
    obj.layout74:setName("layout74");
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(30);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout74);
    obj.label32:setText("Inconsciente:");
    obj.label32:setWidth(88);
    obj.label32:setHint("HP/4");
    obj.label32:setHitTest(true);
    obj.label32:setName("label32");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setFontColor("white");
    obj.label32:setFontFamily("Cambria");
    obj.label32:setFontSize(14);
    obj.label32:setAlign("left");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout74);
    obj.label33:setField("fldInconsciente");
    obj.label33:setHint("HP/4");
    obj.label33:setHitTest(true);
    obj.label33:setName("label33");
    obj.label33:setFontColor("#6f6f6f");
    obj.label33:setFontFamily("Cambria");
    obj.label33:setFontSize(14);
    obj.label33:setAlign("left");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.rectangle2);
    obj.dataLink52:setFields({'fldTamanho', 'fldDestreza', 'fldForca', 'fldConstituicao'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.rectangle2);
    obj.dataLink53:setField("fldAparencia");
    obj.dataLink53:setName("dataLink53");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle2);
    obj.layout75:setAlign("top");
    obj.layout75:setMargins({left = 40, top = 25});
    obj.layout75:setHeight(60);
    obj.layout75:setName("layout75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setName("layout76");
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(30);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout76);
    obj.label34:setText("Características Distintas:");
    obj.label34:setWidth(164);
    obj.label34:setName("label34");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setFontColor("white");
    obj.label34:setFontFamily("Cambria");
    obj.label34:setFontSize(14);
    obj.label34:setAlign("left");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout76);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(486);
    obj.layout77:setName("layout77");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout77);
    obj.edit18:setField("fldCarDistintiva");
    obj.edit18:setWidth(486);
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("#cdcdcd");
    obj.edit18:setFontFamily("Cambria");
    obj.edit18:setFontSize(14);
    obj.edit18:setHeight(30);
    obj.edit18:setTransparent(true);

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout75);
    obj.layout78:setName("layout78");
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(30);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout78);
    obj.label35:setText("Ferimentos:");
    obj.label35:setWidth(80);
    obj.label35:setName("label35");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setFontColor("white");
    obj.label35:setFontFamily("Cambria");
    obj.label35:setFontSize(14);
    obj.label35:setAlign("left");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(570);
    obj.layout79:setName("layout79");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout79);
    obj.edit19:setField("fldFerimentos");
    obj.edit19:setWidth(570);
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("#cdcdcd");
    obj.edit19:setFontFamily("Cambria");
    obj.edit19:setFontSize(14);
    obj.edit19:setHeight(30);
    obj.edit19:setTransparent(true);

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle2);
    obj.layout80:setAlign("top");
    obj.layout80:setName("layout80");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout80);
    obj.label36:setAlign("left");
    obj.label36:setText("☙ HABILIDADES");
    obj.label36:setWidth(175);
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setFontColor("#0080ff");
    obj.label36:setFontFamily("Palatino Linotype");
    obj.label36:setFontSize(20);
    obj.label36:setName("label36");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout80);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(475);
    obj.layout81:setName("layout81");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout81);
    obj.rectangle5:setHeight(2);
    obj.rectangle5:setWidth(475);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setColor("#0080ff");
    obj.rectangle5:setName("rectangle5");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle2);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(150);
    obj.layout82:setMargins({left = 40, top = 0});
    obj.layout82:setName("layout82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setName("layout83");
    obj.layout83:setWidth(209);
    obj.layout83:setAlign("left");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setName("layout84");
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(30);

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout84);
    obj.comboBox1:setField("fldCBHab01");
    obj.comboBox1:setItems({' ', '♞', '⨉'});
    obj.comboBox1:setValues({'N', 'C', 'X'});
    obj.comboBox1:setValue("C");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setHint("Tipo de Habilidade");
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setWidth(35);
    obj.comboBox1:setAlign("left");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout84);
    obj.edit20:setField("fldHab01");
    obj.edit20:setName("edit20");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setFontColor("white");
    obj.edit20:setFontFamily("Cambria");
    obj.edit20:setFontSize(14);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(140);
    obj.edit20:setTransparent(true);

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout84);
    obj.layout85:setAlign("left");
    obj.layout85:setName("layout85");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout85);
    obj.edit21:setField("fldHabValor01");
    obj.edit21:setType("number");
    obj.edit21:setMin(0);
    obj.edit21:setMax(99);
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("#cdcdcd");
    obj.edit21:setFontFamily("Cambria");
    obj.edit21:setFontSize(14);
    obj.edit21:setTransparent(true);
    obj.edit21:setHeight(30);

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout83);
    obj.dataLink54:setField("fldHabValor01");
    obj.dataLink54:setDefaultValue("0");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout83);
    obj.dataLink55:setField("fldCBHab01");
    obj.dataLink55:setDefaultValue("C");
    obj.dataLink55:setName("dataLink55");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout83);
    obj.layout86:setName("layout86");
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(30);

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout86);
    obj.comboBox2:setField("fldCBHab04");
    obj.comboBox2:setItems({' ', '♞', '⨉'});
    obj.comboBox2:setValues({'N', 'C', 'X'});
    obj.comboBox2:setValue("N");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setHint("Tipo de Habilidade");
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setWidth(35);
    obj.comboBox2:setAlign("left");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout86);
    obj.edit22:setField("fldHab04");
    obj.edit22:setName("edit22");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setFontColor("white");
    obj.edit22:setFontFamily("Cambria");
    obj.edit22:setFontSize(14);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(140);
    obj.edit22:setTransparent(true);

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("left");
    obj.layout87:setName("layout87");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout87);
    obj.edit23:setField("fldHabValor04");
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setMax(99);
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("#cdcdcd");
    obj.edit23:setFontFamily("Cambria");
    obj.edit23:setFontSize(14);
    obj.edit23:setTransparent(true);
    obj.edit23:setHeight(30);

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout83);
    obj.dataLink56:setField("fldHabValor04");
    obj.dataLink56:setDefaultValue("0");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout83);
    obj.dataLink57:setField("fldCBHab04");
    obj.dataLink57:setDefaultValue("N");
    obj.dataLink57:setName("dataLink57");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout83);
    obj.layout88:setName("layout88");
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(30);

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout88);
    obj.comboBox3:setField("fldCBHab07");
    obj.comboBox3:setItems({' ', '♞', '⨉'});
    obj.comboBox3:setValues({'N', 'C', 'X'});
    obj.comboBox3:setValue("C");
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setHint("Tipo de Habilidade");
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setWidth(35);
    obj.comboBox3:setAlign("left");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout88);
    obj.edit24:setField("fldHab07");
    obj.edit24:setName("edit24");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setFontColor("white");
    obj.edit24:setFontFamily("Cambria");
    obj.edit24:setFontSize(14);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(140);
    obj.edit24:setTransparent(true);

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setAlign("left");
    obj.layout89:setName("layout89");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout89);
    obj.edit25:setField("fldHabValor07");
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setMax(99);
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("#cdcdcd");
    obj.edit25:setFontFamily("Cambria");
    obj.edit25:setFontSize(14);
    obj.edit25:setTransparent(true);
    obj.edit25:setHeight(30);

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout83);
    obj.dataLink58:setField("fldHabValor07");
    obj.dataLink58:setDefaultValue("0");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout83);
    obj.dataLink59:setField("fldCBHab07");
    obj.dataLink59:setDefaultValue("C");
    obj.dataLink59:setName("dataLink59");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout83);
    obj.layout90:setName("layout90");
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(30);

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout90);
    obj.comboBox4:setField("fldCBHab10");
    obj.comboBox4:setItems({' ', '♞', '⨉'});
    obj.comboBox4:setValues({'N', 'C', 'X'});
    obj.comboBox4:setValue("N");
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setHint("Tipo de Habilidade");
    obj.comboBox4:setName("comboBox4");
    obj.comboBox4:setWidth(35);
    obj.comboBox4:setAlign("left");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout90);
    obj.edit26:setField("fldHab10");
    obj.edit26:setName("edit26");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");
    obj.edit26:setFontColor("white");
    obj.edit26:setFontFamily("Cambria");
    obj.edit26:setFontSize(14);
    obj.edit26:setAlign("left");
    obj.edit26:setWidth(140);
    obj.edit26:setTransparent(true);

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout90);
    obj.layout91:setAlign("left");
    obj.layout91:setName("layout91");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout91);
    obj.edit27:setField("fldHabValor10");
    obj.edit27:setType("number");
    obj.edit27:setMin(0);
    obj.edit27:setMax(99);
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#cdcdcd");
    obj.edit27:setFontFamily("Cambria");
    obj.edit27:setFontSize(14);
    obj.edit27:setTransparent(true);
    obj.edit27:setHeight(30);

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout83);
    obj.dataLink60:setField("fldHabValor10");
    obj.dataLink60:setDefaultValue("0");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout83);
    obj.dataLink61:setField("fldCBHab10");
    obj.dataLink61:setDefaultValue("N");
    obj.dataLink61:setName("dataLink61");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout83);
    obj.layout92:setName("layout92");
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(30);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout92);
    obj.comboBox5:setField("fldCBHab13");
    obj.comboBox5:setItems({' ', '♞', '⨉'});
    obj.comboBox5:setValues({'N', 'C', 'X'});
    obj.comboBox5:setValue("N");
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setHint("Tipo de Habilidade");
    obj.comboBox5:setName("comboBox5");
    obj.comboBox5:setWidth(35);
    obj.comboBox5:setAlign("left");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout92);
    obj.edit28:setField("fldHab13");
    obj.edit28:setName("edit28");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");
    obj.edit28:setFontColor("white");
    obj.edit28:setFontFamily("Cambria");
    obj.edit28:setFontSize(14);
    obj.edit28:setAlign("left");
    obj.edit28:setWidth(140);
    obj.edit28:setTransparent(true);

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setAlign("left");
    obj.layout93:setName("layout93");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout93);
    obj.edit29:setField("fldHabValor13");
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setMax(99);
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#cdcdcd");
    obj.edit29:setFontFamily("Cambria");
    obj.edit29:setFontSize(14);
    obj.edit29:setTransparent(true);
    obj.edit29:setHeight(30);

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout83);
    obj.dataLink62:setField("fldHabValor13");
    obj.dataLink62:setDefaultValue("0");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout83);
    obj.dataLink63:setField("fldCBHab13");
    obj.dataLink63:setDefaultValue("N");
    obj.dataLink63:setName("dataLink63");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout82);
    obj.layout94:setName("layout94");
    obj.layout94:setWidth(209);
    obj.layout94:setAlign("left");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setName("layout95");
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(30);

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout95);
    obj.comboBox6:setField("fldCBHab02");
    obj.comboBox6:setItems({' ', '♞', '⨉'});
    obj.comboBox6:setValues({'N', 'C', 'X'});
    obj.comboBox6:setValue("N");
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setHint("Tipo de Habilidade");
    obj.comboBox6:setName("comboBox6");
    obj.comboBox6:setWidth(35);
    obj.comboBox6:setAlign("left");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout95);
    obj.edit30:setField("fldHab02");
    obj.edit30:setName("edit30");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "bold");
    obj.edit30:setFontColor("white");
    obj.edit30:setFontFamily("Cambria");
    obj.edit30:setFontSize(14);
    obj.edit30:setAlign("left");
    obj.edit30:setWidth(140);
    obj.edit30:setTransparent(true);

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout95);
    obj.layout96:setAlign("left");
    obj.layout96:setName("layout96");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout96);
    obj.edit31:setField("fldHabValor02");
    obj.edit31:setType("number");
    obj.edit31:setMin(0);
    obj.edit31:setMax(99);
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("#cdcdcd");
    obj.edit31:setFontFamily("Cambria");
    obj.edit31:setFontSize(14);
    obj.edit31:setTransparent(true);
    obj.edit31:setHeight(30);

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout94);
    obj.dataLink64:setField("fldHabValor02");
    obj.dataLink64:setDefaultValue("0");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout94);
    obj.dataLink65:setField("fldCBHab02");
    obj.dataLink65:setDefaultValue("N");
    obj.dataLink65:setName("dataLink65");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout94);
    obj.layout97:setName("layout97");
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(30);

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout97);
    obj.comboBox7:setField("fldCBHab05");
    obj.comboBox7:setItems({' ', '♞', '⨉'});
    obj.comboBox7:setValues({'N', 'C', 'X'});
    obj.comboBox7:setValue("N");
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setHint("Tipo de Habilidade");
    obj.comboBox7:setName("comboBox7");
    obj.comboBox7:setWidth(35);
    obj.comboBox7:setAlign("left");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout97);
    obj.edit32:setField("fldHab05");
    obj.edit32:setName("edit32");
    lfm_setPropAsString(obj.edit32, "fontStyle",  "bold");
    obj.edit32:setFontColor("white");
    obj.edit32:setFontFamily("Cambria");
    obj.edit32:setFontSize(14);
    obj.edit32:setAlign("left");
    obj.edit32:setWidth(140);
    obj.edit32:setTransparent(true);

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout97);
    obj.layout98:setAlign("left");
    obj.layout98:setName("layout98");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout98);
    obj.edit33:setField("fldHabValor05");
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setMax(99);
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("#cdcdcd");
    obj.edit33:setFontFamily("Cambria");
    obj.edit33:setFontSize(14);
    obj.edit33:setTransparent(true);
    obj.edit33:setHeight(30);

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout94);
    obj.dataLink66:setField("fldHabValor05");
    obj.dataLink66:setDefaultValue("0");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout94);
    obj.dataLink67:setField("fldCBHab05");
    obj.dataLink67:setDefaultValue("N");
    obj.dataLink67:setName("dataLink67");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout94);
    obj.layout99:setName("layout99");
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(30);

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout99);
    obj.comboBox8:setField("fldCBHab08");
    obj.comboBox8:setItems({' ', '♞', '⨉'});
    obj.comboBox8:setValues({'N', 'C', 'X'});
    obj.comboBox8:setValue("N");
    obj.comboBox8:setTransparent(true);
    obj.comboBox8:setHint("Tipo de Habilidade");
    obj.comboBox8:setName("comboBox8");
    obj.comboBox8:setWidth(35);
    obj.comboBox8:setAlign("left");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout99);
    obj.edit34:setField("fldHab08");
    obj.edit34:setName("edit34");
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setFontColor("white");
    obj.edit34:setFontFamily("Cambria");
    obj.edit34:setFontSize(14);
    obj.edit34:setAlign("left");
    obj.edit34:setWidth(140);
    obj.edit34:setTransparent(true);

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout99);
    obj.layout100:setAlign("left");
    obj.layout100:setName("layout100");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout100);
    obj.edit35:setField("fldHabValor08");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setMax(99);
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("#cdcdcd");
    obj.edit35:setFontFamily("Cambria");
    obj.edit35:setFontSize(14);
    obj.edit35:setTransparent(true);
    obj.edit35:setHeight(30);

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout94);
    obj.dataLink68:setField("fldHabValor08");
    obj.dataLink68:setDefaultValue("0");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout94);
    obj.dataLink69:setField("fldCBHab08");
    obj.dataLink69:setDefaultValue("N");
    obj.dataLink69:setName("dataLink69");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout94);
    obj.layout101:setName("layout101");
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(30);

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout101);
    obj.comboBox9:setField("fldCBHab11");
    obj.comboBox9:setItems({' ', '♞', '⨉'});
    obj.comboBox9:setValues({'N', 'C', 'X'});
    obj.comboBox9:setValue("C");
    obj.comboBox9:setTransparent(true);
    obj.comboBox9:setHint("Tipo de Habilidade");
    obj.comboBox9:setName("comboBox9");
    obj.comboBox9:setWidth(35);
    obj.comboBox9:setAlign("left");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout101);
    obj.edit36:setField("fldHab11");
    obj.edit36:setName("edit36");
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setFontColor("white");
    obj.edit36:setFontFamily("Cambria");
    obj.edit36:setFontSize(14);
    obj.edit36:setAlign("left");
    obj.edit36:setWidth(140);
    obj.edit36:setTransparent(true);

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout101);
    obj.layout102:setAlign("left");
    obj.layout102:setName("layout102");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout102);
    obj.edit37:setField("fldHabValor11");
    obj.edit37:setType("number");
    obj.edit37:setMin(0);
    obj.edit37:setMax(99);
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("#cdcdcd");
    obj.edit37:setFontFamily("Cambria");
    obj.edit37:setFontSize(14);
    obj.edit37:setTransparent(true);
    obj.edit37:setHeight(30);

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout94);
    obj.dataLink70:setField("fldHabValor11");
    obj.dataLink70:setDefaultValue("0");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout94);
    obj.dataLink71:setField("fldCBHab11");
    obj.dataLink71:setDefaultValue("C");
    obj.dataLink71:setName("dataLink71");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout94);
    obj.layout103:setName("layout103");
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(30);

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout103);
    obj.comboBox10:setField("fldCBHab14");
    obj.comboBox10:setItems({' ', '♞', '⨉'});
    obj.comboBox10:setValues({'N', 'C', 'X'});
    obj.comboBox10:setValue("N");
    obj.comboBox10:setTransparent(true);
    obj.comboBox10:setHint("Tipo de Habilidade");
    obj.comboBox10:setName("comboBox10");
    obj.comboBox10:setWidth(35);
    obj.comboBox10:setAlign("left");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout103);
    obj.edit38:setField("fldHab14");
    obj.edit38:setName("edit38");
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setFontColor("white");
    obj.edit38:setFontFamily("Cambria");
    obj.edit38:setFontSize(14);
    obj.edit38:setAlign("left");
    obj.edit38:setWidth(140);
    obj.edit38:setTransparent(true);

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout103);
    obj.layout104:setAlign("left");
    obj.layout104:setName("layout104");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout104);
    obj.edit39:setField("fldHabValor14");
    obj.edit39:setType("number");
    obj.edit39:setMin(0);
    obj.edit39:setMax(99);
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("#cdcdcd");
    obj.edit39:setFontFamily("Cambria");
    obj.edit39:setFontSize(14);
    obj.edit39:setTransparent(true);
    obj.edit39:setHeight(30);

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout94);
    obj.dataLink72:setField("fldHabValor14");
    obj.dataLink72:setDefaultValue("0");
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout94);
    obj.dataLink73:setField("fldCBHab14");
    obj.dataLink73:setDefaultValue("N");
    obj.dataLink73:setName("dataLink73");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout82);
    obj.layout105:setName("layout105");
    obj.layout105:setWidth(209);
    obj.layout105:setAlign("left");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setName("layout106");
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(30);

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout106);
    obj.comboBox11:setField("fldCBHab03");
    obj.comboBox11:setItems({' ', '♞', '⨉'});
    obj.comboBox11:setValues({'N', 'C', 'X'});
    obj.comboBox11:setValue("C");
    obj.comboBox11:setTransparent(true);
    obj.comboBox11:setHint("Tipo de Habilidade");
    obj.comboBox11:setName("comboBox11");
    obj.comboBox11:setWidth(35);
    obj.comboBox11:setAlign("left");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout106);
    obj.edit40:setField("fldHab03");
    obj.edit40:setName("edit40");
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setFontColor("white");
    obj.edit40:setFontFamily("Cambria");
    obj.edit40:setFontSize(14);
    obj.edit40:setAlign("left");
    obj.edit40:setWidth(140);
    obj.edit40:setTransparent(true);

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout106);
    obj.layout107:setAlign("left");
    obj.layout107:setName("layout107");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout107);
    obj.edit41:setField("fldHabValor03");
    obj.edit41:setType("number");
    obj.edit41:setMin(0);
    obj.edit41:setMax(99);
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("#cdcdcd");
    obj.edit41:setFontFamily("Cambria");
    obj.edit41:setFontSize(14);
    obj.edit41:setTransparent(true);
    obj.edit41:setHeight(30);

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout105);
    obj.dataLink74:setField("fldHabValor03");
    obj.dataLink74:setDefaultValue("0");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout105);
    obj.dataLink75:setField("fldCBHab03");
    obj.dataLink75:setDefaultValue("C");
    obj.dataLink75:setName("dataLink75");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout105);
    obj.layout108:setName("layout108");
    obj.layout108:setAlign("top");
    obj.layout108:setHeight(30);

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout108);
    obj.comboBox12:setField("fldCBHab06");
    obj.comboBox12:setItems({' ', '♞', '⨉'});
    obj.comboBox12:setValues({'N', 'C', 'X'});
    obj.comboBox12:setValue("C");
    obj.comboBox12:setTransparent(true);
    obj.comboBox12:setHint("Tipo de Habilidade");
    obj.comboBox12:setName("comboBox12");
    obj.comboBox12:setWidth(35);
    obj.comboBox12:setAlign("left");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout108);
    obj.edit42:setField("fldHab06");
    obj.edit42:setName("edit42");
    lfm_setPropAsString(obj.edit42, "fontStyle",  "bold");
    obj.edit42:setFontColor("white");
    obj.edit42:setFontFamily("Cambria");
    obj.edit42:setFontSize(14);
    obj.edit42:setAlign("left");
    obj.edit42:setWidth(140);
    obj.edit42:setTransparent(true);

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setAlign("left");
    obj.layout109:setName("layout109");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout109);
    obj.edit43:setField("fldHabValor06");
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setMax(99);
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("#cdcdcd");
    obj.edit43:setFontFamily("Cambria");
    obj.edit43:setFontSize(14);
    obj.edit43:setTransparent(true);
    obj.edit43:setHeight(30);

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout105);
    obj.dataLink76:setField("fldHabValor06");
    obj.dataLink76:setDefaultValue("0");
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout105);
    obj.dataLink77:setField("fldCBHab06");
    obj.dataLink77:setDefaultValue("C");
    obj.dataLink77:setName("dataLink77");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout105);
    obj.layout110:setName("layout110");
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(30);

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout110);
    obj.comboBox13:setField("fldCBHab09");
    obj.comboBox13:setItems({' ', '♞', '⨉'});
    obj.comboBox13:setValues({'N', 'C', 'X'});
    obj.comboBox13:setValue("N");
    obj.comboBox13:setTransparent(true);
    obj.comboBox13:setHint("Tipo de Habilidade");
    obj.comboBox13:setName("comboBox13");
    obj.comboBox13:setWidth(35);
    obj.comboBox13:setAlign("left");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout110);
    obj.edit44:setField("fldHab09");
    obj.edit44:setName("edit44");
    lfm_setPropAsString(obj.edit44, "fontStyle",  "bold");
    obj.edit44:setFontColor("white");
    obj.edit44:setFontFamily("Cambria");
    obj.edit44:setFontSize(14);
    obj.edit44:setAlign("left");
    obj.edit44:setWidth(140);
    obj.edit44:setTransparent(true);

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout110);
    obj.layout111:setAlign("left");
    obj.layout111:setName("layout111");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout111);
    obj.edit45:setField("fldHabValor09");
    obj.edit45:setType("number");
    obj.edit45:setMin(0);
    obj.edit45:setMax(99);
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("#cdcdcd");
    obj.edit45:setFontFamily("Cambria");
    obj.edit45:setFontSize(14);
    obj.edit45:setTransparent(true);
    obj.edit45:setHeight(30);

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout105);
    obj.dataLink78:setField("fldHabValor09");
    obj.dataLink78:setDefaultValue("0");
    obj.dataLink78:setName("dataLink78");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout105);
    obj.dataLink79:setField("fldCBHab09");
    obj.dataLink79:setDefaultValue("N");
    obj.dataLink79:setName("dataLink79");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout105);
    obj.layout112:setName("layout112");
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(30);

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout112);
    obj.comboBox14:setField("fldCBHab12");
    obj.comboBox14:setItems({' ', '♞', '⨉'});
    obj.comboBox14:setValues({'N', 'C', 'X'});
    obj.comboBox14:setValue("N");
    obj.comboBox14:setTransparent(true);
    obj.comboBox14:setHint("Tipo de Habilidade");
    obj.comboBox14:setName("comboBox14");
    obj.comboBox14:setWidth(35);
    obj.comboBox14:setAlign("left");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout112);
    obj.edit46:setField("fldHab12");
    obj.edit46:setName("edit46");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setFontColor("white");
    obj.edit46:setFontFamily("Cambria");
    obj.edit46:setFontSize(14);
    obj.edit46:setAlign("left");
    obj.edit46:setWidth(140);
    obj.edit46:setTransparent(true);

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout112);
    obj.layout113:setAlign("left");
    obj.layout113:setName("layout113");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout113);
    obj.edit47:setField("fldHabValor12");
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setMax(99);
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("#cdcdcd");
    obj.edit47:setFontFamily("Cambria");
    obj.edit47:setFontSize(14);
    obj.edit47:setTransparent(true);
    obj.edit47:setHeight(30);

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout105);
    obj.dataLink80:setField("fldHabValor12");
    obj.dataLink80:setDefaultValue("0");
    obj.dataLink80:setName("dataLink80");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout105);
    obj.dataLink81:setField("fldCBHab12");
    obj.dataLink81:setDefaultValue("N");
    obj.dataLink81:setName("dataLink81");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout105);
    obj.layout114:setName("layout114");
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(30);

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout114);
    obj.comboBox15:setField("fldCBHab15");
    obj.comboBox15:setItems({' ', '♞', '⨉'});
    obj.comboBox15:setValues({'N', 'C', 'X'});
    obj.comboBox15:setValue("N");
    obj.comboBox15:setTransparent(true);
    obj.comboBox15:setHint("Tipo de Habilidade");
    obj.comboBox15:setName("comboBox15");
    obj.comboBox15:setWidth(35);
    obj.comboBox15:setAlign("left");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout114);
    obj.edit48:setField("fldHab15");
    obj.edit48:setName("edit48");
    lfm_setPropAsString(obj.edit48, "fontStyle",  "bold");
    obj.edit48:setFontColor("white");
    obj.edit48:setFontFamily("Cambria");
    obj.edit48:setFontSize(14);
    obj.edit48:setAlign("left");
    obj.edit48:setWidth(140);
    obj.edit48:setTransparent(true);

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout114);
    obj.layout115:setAlign("left");
    obj.layout115:setName("layout115");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout115);
    obj.edit49:setField("fldHabValor15");
    obj.edit49:setType("number");
    obj.edit49:setMin(0);
    obj.edit49:setMax(99);
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("#cdcdcd");
    obj.edit49:setFontFamily("Cambria");
    obj.edit49:setFontSize(14);
    obj.edit49:setTransparent(true);
    obj.edit49:setHeight(30);

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout105);
    obj.dataLink82:setField("fldHabValor15");
    obj.dataLink82:setDefaultValue("0");
    obj.dataLink82:setName("dataLink82");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout105);
    obj.dataLink83:setField("fldCBHab15");
    obj.dataLink83:setDefaultValue("N");
    obj.dataLink83:setName("dataLink83");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle2);
    obj.layout116:setAlign("top");
    obj.layout116:setHeight(320);
    obj.layout116:setMargins({left = 40, top = 25});
    obj.layout116:setName("layout116");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout116);
    obj.layout117:setName("layout117");
    obj.layout117:setWidth(209);
    obj.layout117:setAlign("left");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout117);
    obj.layout118:setName("layout118");
    obj.layout118:setAlign("top");
    obj.layout118:setHeight(30);

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout118);
    obj.comboBox16:setField("fldCBHab16");
    obj.comboBox16:setItems({' ', '♞', '⨉'});
    obj.comboBox16:setValues({'N', 'C', 'X'});
    obj.comboBox16:setValue("N");
    obj.comboBox16:setTransparent(true);
    obj.comboBox16:setHint("Tipo de Habilidade");
    obj.comboBox16:setName("comboBox16");
    obj.comboBox16:setWidth(35);
    obj.comboBox16:setAlign("left");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout118);
    obj.edit50:setField("fldHab16");
    obj.edit50:setName("edit50");
    lfm_setPropAsString(obj.edit50, "fontStyle",  "bold");
    obj.edit50:setFontColor("white");
    obj.edit50:setFontFamily("Cambria");
    obj.edit50:setFontSize(14);
    obj.edit50:setAlign("left");
    obj.edit50:setWidth(140);
    obj.edit50:setTransparent(true);

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout118);
    obj.layout119:setAlign("left");
    obj.layout119:setName("layout119");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout119);
    obj.edit51:setField("fldHabValor16");
    obj.edit51:setType("number");
    obj.edit51:setMin(0);
    obj.edit51:setMax(99);
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("#cdcdcd");
    obj.edit51:setFontFamily("Cambria");
    obj.edit51:setFontSize(14);
    obj.edit51:setTransparent(true);
    obj.edit51:setHeight(30);

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout117);
    obj.dataLink84:setField("fldHabValor16");
    obj.dataLink84:setDefaultValue("0");
    obj.dataLink84:setName("dataLink84");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout117);
    obj.dataLink85:setField("fldCBHab16");
    obj.dataLink85:setDefaultValue("N");
    obj.dataLink85:setName("dataLink85");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout117);
    obj.layout120:setName("layout120");
    obj.layout120:setAlign("top");
    obj.layout120:setHeight(30);

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout120);
    obj.comboBox17:setField("fldCBHab19");
    obj.comboBox17:setItems({' ', '♞', '⨉'});
    obj.comboBox17:setValues({'N', 'C', 'X'});
    obj.comboBox17:setValue("C");
    obj.comboBox17:setTransparent(true);
    obj.comboBox17:setHint("Tipo de Habilidade");
    obj.comboBox17:setName("comboBox17");
    obj.comboBox17:setWidth(35);
    obj.comboBox17:setAlign("left");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout120);
    obj.edit52:setField("fldHab19");
    obj.edit52:setName("edit52");
    lfm_setPropAsString(obj.edit52, "fontStyle",  "bold");
    obj.edit52:setFontColor("white");
    obj.edit52:setFontFamily("Cambria");
    obj.edit52:setFontSize(14);
    obj.edit52:setAlign("left");
    obj.edit52:setWidth(140);
    obj.edit52:setTransparent(true);

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout120);
    obj.layout121:setAlign("left");
    obj.layout121:setName("layout121");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout121);
    obj.edit53:setField("fldHabValor19");
    obj.edit53:setType("number");
    obj.edit53:setMin(0);
    obj.edit53:setMax(99);
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("#cdcdcd");
    obj.edit53:setFontFamily("Cambria");
    obj.edit53:setFontSize(14);
    obj.edit53:setTransparent(true);
    obj.edit53:setHeight(30);

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout117);
    obj.dataLink86:setField("fldHabValor19");
    obj.dataLink86:setDefaultValue("0");
    obj.dataLink86:setName("dataLink86");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout117);
    obj.dataLink87:setField("fldCBHab19");
    obj.dataLink87:setDefaultValue("C");
    obj.dataLink87:setName("dataLink87");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout117);
    obj.layout122:setName("layout122");
    obj.layout122:setAlign("top");
    obj.layout122:setHeight(30);

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout122);
    obj.comboBox18:setField("fldCBHab22");
    obj.comboBox18:setItems({' ', '♞', '⨉'});
    obj.comboBox18:setValues({'N', 'C', 'X'});
    obj.comboBox18:setValue("C");
    obj.comboBox18:setTransparent(true);
    obj.comboBox18:setHint("Tipo de Habilidade");
    obj.comboBox18:setName("comboBox18");
    obj.comboBox18:setWidth(35);
    obj.comboBox18:setAlign("left");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout122);
    obj.edit54:setField("fldHab22");
    obj.edit54:setName("edit54");
    lfm_setPropAsString(obj.edit54, "fontStyle",  "bold");
    obj.edit54:setFontColor("white");
    obj.edit54:setFontFamily("Cambria");
    obj.edit54:setFontSize(14);
    obj.edit54:setAlign("left");
    obj.edit54:setWidth(140);
    obj.edit54:setTransparent(true);

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout122);
    obj.layout123:setAlign("left");
    obj.layout123:setName("layout123");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout123);
    obj.edit55:setField("fldHabValor22");
    obj.edit55:setType("number");
    obj.edit55:setMin(0);
    obj.edit55:setMax(99);
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("#cdcdcd");
    obj.edit55:setFontFamily("Cambria");
    obj.edit55:setFontSize(14);
    obj.edit55:setTransparent(true);
    obj.edit55:setHeight(30);

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout117);
    obj.dataLink88:setField("fldHabValor22");
    obj.dataLink88:setDefaultValue("0");
    obj.dataLink88:setName("dataLink88");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout117);
    obj.dataLink89:setField("fldCBHab22");
    obj.dataLink89:setDefaultValue("C");
    obj.dataLink89:setName("dataLink89");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout117);
    obj.layout124:setName("layout124");
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(30);

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout124);
    obj.comboBox19:setField("fldCBHab25");
    obj.comboBox19:setItems({' ', '♞', '⨉'});
    obj.comboBox19:setValues({'N', 'C', 'X'});
    obj.comboBox19:setValue("N");
    obj.comboBox19:setTransparent(true);
    obj.comboBox19:setHint("Tipo de Habilidade");
    obj.comboBox19:setName("comboBox19");
    obj.comboBox19:setWidth(35);
    obj.comboBox19:setAlign("left");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout124);
    obj.edit56:setField("fldHab25");
    obj.edit56:setName("edit56");
    lfm_setPropAsString(obj.edit56, "fontStyle",  "bold");
    obj.edit56:setFontColor("white");
    obj.edit56:setFontFamily("Cambria");
    obj.edit56:setFontSize(14);
    obj.edit56:setAlign("left");
    obj.edit56:setWidth(140);
    obj.edit56:setTransparent(true);

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout124);
    obj.layout125:setAlign("left");
    obj.layout125:setName("layout125");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout125);
    obj.edit57:setField("fldHabValor25");
    obj.edit57:setType("number");
    obj.edit57:setMin(0);
    obj.edit57:setMax(99);
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("#cdcdcd");
    obj.edit57:setFontFamily("Cambria");
    obj.edit57:setFontSize(14);
    obj.edit57:setTransparent(true);
    obj.edit57:setHeight(30);

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout117);
    obj.dataLink90:setField("fldHabValor25");
    obj.dataLink90:setDefaultValue("0");
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout117);
    obj.dataLink91:setField("fldCBHab25");
    obj.dataLink91:setDefaultValue("N");
    obj.dataLink91:setName("dataLink91");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout117);
    obj.layout126:setName("layout126");
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(30);

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout126);
    obj.comboBox20:setField("fldCBHab28");
    obj.comboBox20:setItems({' ', '♞', '⨉'});
    obj.comboBox20:setValues({'N', 'C', 'X'});
    obj.comboBox20:setValue("N");
    obj.comboBox20:setTransparent(true);
    obj.comboBox20:setHint("Tipo de Habilidade");
    obj.comboBox20:setName("comboBox20");
    obj.comboBox20:setWidth(35);
    obj.comboBox20:setAlign("left");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout126);
    obj.edit58:setField("fldHab28");
    obj.edit58:setName("edit58");
    lfm_setPropAsString(obj.edit58, "fontStyle",  "bold");
    obj.edit58:setFontColor("white");
    obj.edit58:setFontFamily("Cambria");
    obj.edit58:setFontSize(14);
    obj.edit58:setAlign("left");
    obj.edit58:setWidth(140);
    obj.edit58:setTransparent(true);

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout126);
    obj.layout127:setAlign("left");
    obj.layout127:setName("layout127");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout127);
    obj.edit59:setField("fldHabValor28");
    obj.edit59:setType("number");
    obj.edit59:setMin(0);
    obj.edit59:setMax(99);
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("#cdcdcd");
    obj.edit59:setFontFamily("Cambria");
    obj.edit59:setFontSize(14);
    obj.edit59:setTransparent(true);
    obj.edit59:setHeight(30);

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout117);
    obj.dataLink92:setField("fldHabValor28");
    obj.dataLink92:setDefaultValue("0");
    obj.dataLink92:setName("dataLink92");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout117);
    obj.dataLink93:setField("fldCBHab28");
    obj.dataLink93:setDefaultValue("N");
    obj.dataLink93:setName("dataLink93");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout117);
    obj.layout128:setName("layout128");
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(30);

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout128);
    obj.comboBox21:setField("fldCBHab31");
    obj.comboBox21:setItems({' ', '♞', '⨉'});
    obj.comboBox21:setValues({'N', 'C', 'X'});
    obj.comboBox21:setValue("N");
    obj.comboBox21:setTransparent(true);
    obj.comboBox21:setHint("Tipo de Habilidade");
    obj.comboBox21:setName("comboBox21");
    obj.comboBox21:setWidth(35);
    obj.comboBox21:setAlign("left");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout128);
    obj.edit60:setField("fldHab31");
    obj.edit60:setName("edit60");
    lfm_setPropAsString(obj.edit60, "fontStyle",  "bold");
    obj.edit60:setFontColor("white");
    obj.edit60:setFontFamily("Cambria");
    obj.edit60:setFontSize(14);
    obj.edit60:setAlign("left");
    obj.edit60:setWidth(140);
    obj.edit60:setTransparent(true);

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout128);
    obj.layout129:setAlign("left");
    obj.layout129:setName("layout129");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout129);
    obj.edit61:setField("fldHabValor31");
    obj.edit61:setType("number");
    obj.edit61:setMin(0);
    obj.edit61:setMax(99);
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("#cdcdcd");
    obj.edit61:setFontFamily("Cambria");
    obj.edit61:setFontSize(14);
    obj.edit61:setTransparent(true);
    obj.edit61:setHeight(30);

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout117);
    obj.dataLink94:setField("fldHabValor31");
    obj.dataLink94:setDefaultValue("0");
    obj.dataLink94:setName("dataLink94");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout117);
    obj.dataLink95:setField("fldCBHab31");
    obj.dataLink95:setDefaultValue("N");
    obj.dataLink95:setName("dataLink95");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout117);
    obj.layout130:setName("layout130");
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(30);

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout130);
    obj.comboBox22:setField("fldCBHab34");
    obj.comboBox22:setItems({' ', '♞', '⨉'});
    obj.comboBox22:setValues({'N', 'C', 'X'});
    obj.comboBox22:setValue("N");
    obj.comboBox22:setTransparent(true);
    obj.comboBox22:setHint("Tipo de Habilidade");
    obj.comboBox22:setName("comboBox22");
    obj.comboBox22:setWidth(35);
    obj.comboBox22:setAlign("left");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout130);
    obj.edit62:setField("fldHab34");
    obj.edit62:setName("edit62");
    lfm_setPropAsString(obj.edit62, "fontStyle",  "bold");
    obj.edit62:setFontColor("white");
    obj.edit62:setFontFamily("Cambria");
    obj.edit62:setFontSize(14);
    obj.edit62:setAlign("left");
    obj.edit62:setWidth(140);
    obj.edit62:setTransparent(true);

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout130);
    obj.layout131:setAlign("left");
    obj.layout131:setName("layout131");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout131);
    obj.edit63:setField("fldHabValor34");
    obj.edit63:setType("number");
    obj.edit63:setMin(0);
    obj.edit63:setMax(99);
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("#cdcdcd");
    obj.edit63:setFontFamily("Cambria");
    obj.edit63:setFontSize(14);
    obj.edit63:setTransparent(true);
    obj.edit63:setHeight(30);

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout117);
    obj.dataLink96:setField("fldHabValor34");
    obj.dataLink96:setDefaultValue("0");
    obj.dataLink96:setName("dataLink96");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout117);
    obj.dataLink97:setField("fldCBHab34");
    obj.dataLink97:setDefaultValue("N");
    obj.dataLink97:setName("dataLink97");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout117);
    obj.layout132:setName("layout132");
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(30);

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout132);
    obj.comboBox23:setField("fldCBHab37");
    obj.comboBox23:setItems({' ', '♞', '⨉'});
    obj.comboBox23:setValues({'N', 'C', 'X'});
    obj.comboBox23:setValue("C");
    obj.comboBox23:setTransparent(true);
    obj.comboBox23:setHint("Tipo de Habilidade");
    obj.comboBox23:setName("comboBox23");
    obj.comboBox23:setWidth(35);
    obj.comboBox23:setAlign("left");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout132);
    obj.edit64:setField("fldHab37");
    obj.edit64:setName("edit64");
    lfm_setPropAsString(obj.edit64, "fontStyle",  "bold");
    obj.edit64:setFontColor("white");
    obj.edit64:setFontFamily("Cambria");
    obj.edit64:setFontSize(14);
    obj.edit64:setAlign("left");
    obj.edit64:setWidth(140);
    obj.edit64:setTransparent(true);

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout132);
    obj.layout133:setAlign("left");
    obj.layout133:setName("layout133");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout133);
    obj.edit65:setField("fldHabValor37");
    obj.edit65:setType("number");
    obj.edit65:setMin(0);
    obj.edit65:setMax(99);
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("#cdcdcd");
    obj.edit65:setFontFamily("Cambria");
    obj.edit65:setFontSize(14);
    obj.edit65:setTransparent(true);
    obj.edit65:setHeight(30);

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout117);
    obj.dataLink98:setField("fldHabValor37");
    obj.dataLink98:setDefaultValue("0");
    obj.dataLink98:setName("dataLink98");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout117);
    obj.dataLink99:setField("fldCBHab37");
    obj.dataLink99:setDefaultValue("C");
    obj.dataLink99:setName("dataLink99");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout117);
    obj.layout134:setName("layout134");
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(30);

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout134);
    obj.comboBox24:setField("fldCBHab40");
    obj.comboBox24:setItems({' ', '♞', '⨉'});
    obj.comboBox24:setValues({'N', 'C', 'X'});
    obj.comboBox24:setValue("N");
    obj.comboBox24:setTransparent(true);
    obj.comboBox24:setHint("Tipo de Habilidade");
    obj.comboBox24:setName("comboBox24");
    obj.comboBox24:setWidth(35);
    obj.comboBox24:setAlign("left");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout134);
    obj.edit66:setField("fldHab40");
    obj.edit66:setName("edit66");
    lfm_setPropAsString(obj.edit66, "fontStyle",  "bold");
    obj.edit66:setFontColor("white");
    obj.edit66:setFontFamily("Cambria");
    obj.edit66:setFontSize(14);
    obj.edit66:setAlign("left");
    obj.edit66:setWidth(140);
    obj.edit66:setTransparent(true);

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout134);
    obj.layout135:setAlign("left");
    obj.layout135:setName("layout135");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout135);
    obj.edit67:setField("fldHabValor40");
    obj.edit67:setType("number");
    obj.edit67:setMin(0);
    obj.edit67:setMax(99);
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("#cdcdcd");
    obj.edit67:setFontFamily("Cambria");
    obj.edit67:setFontSize(14);
    obj.edit67:setTransparent(true);
    obj.edit67:setHeight(30);

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout117);
    obj.dataLink100:setField("fldHabValor40");
    obj.dataLink100:setDefaultValue("0");
    obj.dataLink100:setName("dataLink100");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout117);
    obj.dataLink101:setField("fldCBHab40");
    obj.dataLink101:setDefaultValue("N");
    obj.dataLink101:setName("dataLink101");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout117);
    obj.layout136:setName("layout136");
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(30);

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout136);
    obj.comboBox25:setField("fldCBHab43");
    obj.comboBox25:setItems({' ', '♞', '⨉'});
    obj.comboBox25:setValues({'N', 'C', 'X'});
    obj.comboBox25:setValue("N");
    obj.comboBox25:setTransparent(true);
    obj.comboBox25:setHint("Tipo de Habilidade");
    obj.comboBox25:setName("comboBox25");
    obj.comboBox25:setWidth(35);
    obj.comboBox25:setAlign("left");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout136);
    obj.edit68:setField("fldHab43");
    obj.edit68:setName("edit68");
    lfm_setPropAsString(obj.edit68, "fontStyle",  "bold");
    obj.edit68:setFontColor("white");
    obj.edit68:setFontFamily("Cambria");
    obj.edit68:setFontSize(14);
    obj.edit68:setAlign("left");
    obj.edit68:setWidth(140);
    obj.edit68:setTransparent(true);

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout136);
    obj.layout137:setAlign("left");
    obj.layout137:setName("layout137");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout137);
    obj.edit69:setField("fldHabValor43");
    obj.edit69:setType("number");
    obj.edit69:setMin(0);
    obj.edit69:setMax(99);
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("#cdcdcd");
    obj.edit69:setFontFamily("Cambria");
    obj.edit69:setFontSize(14);
    obj.edit69:setTransparent(true);
    obj.edit69:setHeight(30);

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout117);
    obj.dataLink102:setField("fldHabValor43");
    obj.dataLink102:setDefaultValue("0");
    obj.dataLink102:setName("dataLink102");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout117);
    obj.dataLink103:setField("fldCBHab43");
    obj.dataLink103:setDefaultValue("N");
    obj.dataLink103:setName("dataLink103");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout116);
    obj.layout138:setName("layout138");
    obj.layout138:setWidth(209);
    obj.layout138:setAlign("left");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout138);
    obj.layout139:setName("layout139");
    obj.layout139:setAlign("top");
    obj.layout139:setHeight(30);

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout139);
    obj.comboBox26:setField("fldCBHab17");
    obj.comboBox26:setItems({' ', '♞', '⨉'});
    obj.comboBox26:setValues({'N', 'C', 'X'});
    obj.comboBox26:setValue("C");
    obj.comboBox26:setTransparent(true);
    obj.comboBox26:setHint("Tipo de Habilidade");
    obj.comboBox26:setName("comboBox26");
    obj.comboBox26:setWidth(35);
    obj.comboBox26:setAlign("left");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout139);
    obj.edit70:setField("fldHab17");
    obj.edit70:setName("edit70");
    lfm_setPropAsString(obj.edit70, "fontStyle",  "bold");
    obj.edit70:setFontColor("white");
    obj.edit70:setFontFamily("Cambria");
    obj.edit70:setFontSize(14);
    obj.edit70:setAlign("left");
    obj.edit70:setWidth(140);
    obj.edit70:setTransparent(true);

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout139);
    obj.layout140:setAlign("left");
    obj.layout140:setName("layout140");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout140);
    obj.edit71:setField("fldHabValor17");
    obj.edit71:setType("number");
    obj.edit71:setMin(0);
    obj.edit71:setMax(99);
    obj.edit71:setName("edit71");
    obj.edit71:setFontColor("#cdcdcd");
    obj.edit71:setFontFamily("Cambria");
    obj.edit71:setFontSize(14);
    obj.edit71:setTransparent(true);
    obj.edit71:setHeight(30);

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout138);
    obj.dataLink104:setField("fldHabValor17");
    obj.dataLink104:setDefaultValue("0");
    obj.dataLink104:setName("dataLink104");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout138);
    obj.dataLink105:setField("fldCBHab17");
    obj.dataLink105:setDefaultValue("C");
    obj.dataLink105:setName("dataLink105");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout138);
    obj.layout141:setName("layout141");
    obj.layout141:setAlign("top");
    obj.layout141:setHeight(30);

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout141);
    obj.comboBox27:setField("fldCBHab20");
    obj.comboBox27:setItems({' ', '♞', '⨉'});
    obj.comboBox27:setValues({'N', 'C', 'X'});
    obj.comboBox27:setValue("X");
    obj.comboBox27:setTransparent(true);
    obj.comboBox27:setHint("Tipo de Habilidade");
    obj.comboBox27:setName("comboBox27");
    obj.comboBox27:setWidth(35);
    obj.comboBox27:setAlign("left");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout141);
    obj.edit72:setField("fldHab20");
    obj.edit72:setName("edit72");
    lfm_setPropAsString(obj.edit72, "fontStyle",  "bold");
    obj.edit72:setFontColor("white");
    obj.edit72:setFontFamily("Cambria");
    obj.edit72:setFontSize(14);
    obj.edit72:setAlign("left");
    obj.edit72:setWidth(140);
    obj.edit72:setTransparent(true);

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setAlign("left");
    obj.layout142:setName("layout142");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout142);
    obj.edit73:setField("fldHabValor20");
    obj.edit73:setType("number");
    obj.edit73:setMin(0);
    obj.edit73:setMax(99);
    obj.edit73:setName("edit73");
    obj.edit73:setFontColor("#cdcdcd");
    obj.edit73:setFontFamily("Cambria");
    obj.edit73:setFontSize(14);
    obj.edit73:setTransparent(true);
    obj.edit73:setHeight(30);

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout138);
    obj.dataLink106:setField("fldHabValor20");
    obj.dataLink106:setDefaultValue("0");
    obj.dataLink106:setName("dataLink106");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout138);
    obj.dataLink107:setField("fldCBHab20");
    obj.dataLink107:setDefaultValue("X");
    obj.dataLink107:setName("dataLink107");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout138);
    obj.layout143:setName("layout143");
    obj.layout143:setAlign("top");
    obj.layout143:setHeight(30);

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout143);
    obj.comboBox28:setField("fldCBHab23");
    obj.comboBox28:setItems({' ', '♞', '⨉'});
    obj.comboBox28:setValues({'N', 'C', 'X'});
    obj.comboBox28:setValue("N");
    obj.comboBox28:setTransparent(true);
    obj.comboBox28:setHint("Tipo de Habilidade");
    obj.comboBox28:setName("comboBox28");
    obj.comboBox28:setWidth(35);
    obj.comboBox28:setAlign("left");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout143);
    obj.edit74:setField("fldHab23");
    obj.edit74:setName("edit74");
    lfm_setPropAsString(obj.edit74, "fontStyle",  "bold");
    obj.edit74:setFontColor("white");
    obj.edit74:setFontFamily("Cambria");
    obj.edit74:setFontSize(14);
    obj.edit74:setAlign("left");
    obj.edit74:setWidth(140);
    obj.edit74:setTransparent(true);

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout143);
    obj.layout144:setAlign("left");
    obj.layout144:setName("layout144");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout144);
    obj.edit75:setField("fldHabValor23");
    obj.edit75:setType("number");
    obj.edit75:setMin(0);
    obj.edit75:setMax(99);
    obj.edit75:setName("edit75");
    obj.edit75:setFontColor("#cdcdcd");
    obj.edit75:setFontFamily("Cambria");
    obj.edit75:setFontSize(14);
    obj.edit75:setTransparent(true);
    obj.edit75:setHeight(30);

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout138);
    obj.dataLink108:setField("fldHabValor23");
    obj.dataLink108:setDefaultValue("0");
    obj.dataLink108:setName("dataLink108");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout138);
    obj.dataLink109:setField("fldCBHab23");
    obj.dataLink109:setDefaultValue("N");
    obj.dataLink109:setName("dataLink109");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout138);
    obj.layout145:setName("layout145");
    obj.layout145:setAlign("top");
    obj.layout145:setHeight(30);

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout145);
    obj.comboBox29:setField("fldCBHab26");
    obj.comboBox29:setItems({' ', '♞', '⨉'});
    obj.comboBox29:setValues({'N', 'C', 'X'});
    obj.comboBox29:setValue("N");
    obj.comboBox29:setTransparent(true);
    obj.comboBox29:setHint("Tipo de Habilidade");
    obj.comboBox29:setName("comboBox29");
    obj.comboBox29:setWidth(35);
    obj.comboBox29:setAlign("left");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout145);
    obj.edit76:setField("fldHab26");
    obj.edit76:setName("edit76");
    lfm_setPropAsString(obj.edit76, "fontStyle",  "bold");
    obj.edit76:setFontColor("white");
    obj.edit76:setFontFamily("Cambria");
    obj.edit76:setFontSize(14);
    obj.edit76:setAlign("left");
    obj.edit76:setWidth(140);
    obj.edit76:setTransparent(true);

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout145);
    obj.layout146:setAlign("left");
    obj.layout146:setName("layout146");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout146);
    obj.edit77:setField("fldHabValor26");
    obj.edit77:setType("number");
    obj.edit77:setMin(0);
    obj.edit77:setMax(99);
    obj.edit77:setName("edit77");
    obj.edit77:setFontColor("#cdcdcd");
    obj.edit77:setFontFamily("Cambria");
    obj.edit77:setFontSize(14);
    obj.edit77:setTransparent(true);
    obj.edit77:setHeight(30);

    obj.dataLink110 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout138);
    obj.dataLink110:setField("fldHabValor26");
    obj.dataLink110:setDefaultValue("0");
    obj.dataLink110:setName("dataLink110");

    obj.dataLink111 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout138);
    obj.dataLink111:setField("fldCBHab26");
    obj.dataLink111:setDefaultValue("N");
    obj.dataLink111:setName("dataLink111");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout138);
    obj.layout147:setName("layout147");
    obj.layout147:setAlign("top");
    obj.layout147:setHeight(30);

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout147);
    obj.comboBox30:setField("fldCBHab29");
    obj.comboBox30:setItems({' ', '♞', '⨉'});
    obj.comboBox30:setValues({'N', 'C', 'X'});
    obj.comboBox30:setValue("N");
    obj.comboBox30:setTransparent(true);
    obj.comboBox30:setHint("Tipo de Habilidade");
    obj.comboBox30:setName("comboBox30");
    obj.comboBox30:setWidth(35);
    obj.comboBox30:setAlign("left");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout147);
    obj.edit78:setField("fldHab29");
    obj.edit78:setName("edit78");
    lfm_setPropAsString(obj.edit78, "fontStyle",  "bold");
    obj.edit78:setFontColor("white");
    obj.edit78:setFontFamily("Cambria");
    obj.edit78:setFontSize(14);
    obj.edit78:setAlign("left");
    obj.edit78:setWidth(140);
    obj.edit78:setTransparent(true);

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout147);
    obj.layout148:setAlign("left");
    obj.layout148:setName("layout148");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout148);
    obj.edit79:setField("fldHabValor29");
    obj.edit79:setType("number");
    obj.edit79:setMin(0);
    obj.edit79:setMax(99);
    obj.edit79:setName("edit79");
    obj.edit79:setFontColor("#cdcdcd");
    obj.edit79:setFontFamily("Cambria");
    obj.edit79:setFontSize(14);
    obj.edit79:setTransparent(true);
    obj.edit79:setHeight(30);

    obj.dataLink112 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout138);
    obj.dataLink112:setField("fldHabValor29");
    obj.dataLink112:setDefaultValue("0");
    obj.dataLink112:setName("dataLink112");

    obj.dataLink113 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout138);
    obj.dataLink113:setField("fldCBHab29");
    obj.dataLink113:setDefaultValue("N");
    obj.dataLink113:setName("dataLink113");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout138);
    obj.layout149:setName("layout149");
    obj.layout149:setAlign("top");
    obj.layout149:setHeight(30);

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout149);
    obj.comboBox31:setField("fldCBHab32");
    obj.comboBox31:setItems({' ', '♞', '⨉'});
    obj.comboBox31:setValues({'N', 'C', 'X'});
    obj.comboBox31:setValue("X");
    obj.comboBox31:setTransparent(true);
    obj.comboBox31:setHint("Tipo de Habilidade");
    obj.comboBox31:setName("comboBox31");
    obj.comboBox31:setWidth(35);
    obj.comboBox31:setAlign("left");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout149);
    obj.edit80:setField("fldHab32");
    obj.edit80:setName("edit80");
    lfm_setPropAsString(obj.edit80, "fontStyle",  "bold");
    obj.edit80:setFontColor("white");
    obj.edit80:setFontFamily("Cambria");
    obj.edit80:setFontSize(14);
    obj.edit80:setAlign("left");
    obj.edit80:setWidth(140);
    obj.edit80:setTransparent(true);

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout149);
    obj.layout150:setAlign("left");
    obj.layout150:setName("layout150");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout150);
    obj.edit81:setField("fldHabValor32");
    obj.edit81:setType("number");
    obj.edit81:setMin(0);
    obj.edit81:setMax(99);
    obj.edit81:setName("edit81");
    obj.edit81:setFontColor("#cdcdcd");
    obj.edit81:setFontFamily("Cambria");
    obj.edit81:setFontSize(14);
    obj.edit81:setTransparent(true);
    obj.edit81:setHeight(30);

    obj.dataLink114 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout138);
    obj.dataLink114:setField("fldHabValor32");
    obj.dataLink114:setDefaultValue("0");
    obj.dataLink114:setName("dataLink114");

    obj.dataLink115 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.layout138);
    obj.dataLink115:setField("fldCBHab32");
    obj.dataLink115:setDefaultValue("X");
    obj.dataLink115:setName("dataLink115");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout138);
    obj.layout151:setName("layout151");
    obj.layout151:setAlign("top");
    obj.layout151:setHeight(30);

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout151);
    obj.comboBox32:setField("fldCBHab35");
    obj.comboBox32:setItems({' ', '♞', '⨉'});
    obj.comboBox32:setValues({'N', 'C', 'X'});
    obj.comboBox32:setValue("X");
    obj.comboBox32:setTransparent(true);
    obj.comboBox32:setHint("Tipo de Habilidade");
    obj.comboBox32:setName("comboBox32");
    obj.comboBox32:setWidth(35);
    obj.comboBox32:setAlign("left");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout151);
    obj.edit82:setField("fldHab35");
    obj.edit82:setName("edit82");
    lfm_setPropAsString(obj.edit82, "fontStyle",  "bold");
    obj.edit82:setFontColor("white");
    obj.edit82:setFontFamily("Cambria");
    obj.edit82:setFontSize(14);
    obj.edit82:setAlign("left");
    obj.edit82:setWidth(140);
    obj.edit82:setTransparent(true);

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout151);
    obj.layout152:setAlign("left");
    obj.layout152:setName("layout152");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout152);
    obj.edit83:setField("fldHabValor35");
    obj.edit83:setType("number");
    obj.edit83:setMin(0);
    obj.edit83:setMax(99);
    obj.edit83:setName("edit83");
    obj.edit83:setFontColor("#cdcdcd");
    obj.edit83:setFontFamily("Cambria");
    obj.edit83:setFontSize(14);
    obj.edit83:setTransparent(true);
    obj.edit83:setHeight(30);

    obj.dataLink116 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout138);
    obj.dataLink116:setField("fldHabValor35");
    obj.dataLink116:setDefaultValue("0");
    obj.dataLink116:setName("dataLink116");

    obj.dataLink117 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout138);
    obj.dataLink117:setField("fldCBHab35");
    obj.dataLink117:setDefaultValue("X");
    obj.dataLink117:setName("dataLink117");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout138);
    obj.layout153:setName("layout153");
    obj.layout153:setAlign("top");
    obj.layout153:setHeight(30);

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout153);
    obj.comboBox33:setField("fldCBHab38");
    obj.comboBox33:setItems({' ', '♞', '⨉'});
    obj.comboBox33:setValues({'N', 'C', 'X'});
    obj.comboBox33:setValue("N");
    obj.comboBox33:setTransparent(true);
    obj.comboBox33:setHint("Tipo de Habilidade");
    obj.comboBox33:setName("comboBox33");
    obj.comboBox33:setWidth(35);
    obj.comboBox33:setAlign("left");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout153);
    obj.edit84:setField("fldHab38");
    obj.edit84:setName("edit84");
    lfm_setPropAsString(obj.edit84, "fontStyle",  "bold");
    obj.edit84:setFontColor("white");
    obj.edit84:setFontFamily("Cambria");
    obj.edit84:setFontSize(14);
    obj.edit84:setAlign("left");
    obj.edit84:setWidth(140);
    obj.edit84:setTransparent(true);

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout153);
    obj.layout154:setAlign("left");
    obj.layout154:setName("layout154");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout154);
    obj.edit85:setField("fldHabValor38");
    obj.edit85:setType("number");
    obj.edit85:setMin(0);
    obj.edit85:setMax(99);
    obj.edit85:setName("edit85");
    obj.edit85:setFontColor("#cdcdcd");
    obj.edit85:setFontFamily("Cambria");
    obj.edit85:setFontSize(14);
    obj.edit85:setTransparent(true);
    obj.edit85:setHeight(30);

    obj.dataLink118 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout138);
    obj.dataLink118:setField("fldHabValor38");
    obj.dataLink118:setDefaultValue("0");
    obj.dataLink118:setName("dataLink118");

    obj.dataLink119 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout138);
    obj.dataLink119:setField("fldCBHab38");
    obj.dataLink119:setDefaultValue("N");
    obj.dataLink119:setName("dataLink119");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout138);
    obj.layout155:setName("layout155");
    obj.layout155:setAlign("top");
    obj.layout155:setHeight(30);

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout155);
    obj.comboBox34:setField("fldCBHab41");
    obj.comboBox34:setItems({' ', '♞', '⨉'});
    obj.comboBox34:setValues({'N', 'C', 'X'});
    obj.comboBox34:setValue("N");
    obj.comboBox34:setTransparent(true);
    obj.comboBox34:setHint("Tipo de Habilidade");
    obj.comboBox34:setName("comboBox34");
    obj.comboBox34:setWidth(35);
    obj.comboBox34:setAlign("left");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout155);
    obj.edit86:setField("fldHab41");
    obj.edit86:setName("edit86");
    lfm_setPropAsString(obj.edit86, "fontStyle",  "bold");
    obj.edit86:setFontColor("white");
    obj.edit86:setFontFamily("Cambria");
    obj.edit86:setFontSize(14);
    obj.edit86:setAlign("left");
    obj.edit86:setWidth(140);
    obj.edit86:setTransparent(true);

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout155);
    obj.layout156:setAlign("left");
    obj.layout156:setName("layout156");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout156);
    obj.edit87:setField("fldHabValor41");
    obj.edit87:setType("number");
    obj.edit87:setMin(0);
    obj.edit87:setMax(99);
    obj.edit87:setName("edit87");
    obj.edit87:setFontColor("#cdcdcd");
    obj.edit87:setFontFamily("Cambria");
    obj.edit87:setFontSize(14);
    obj.edit87:setTransparent(true);
    obj.edit87:setHeight(30);

    obj.dataLink120 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout138);
    obj.dataLink120:setField("fldHabValor41");
    obj.dataLink120:setDefaultValue("0");
    obj.dataLink120:setName("dataLink120");

    obj.dataLink121 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout138);
    obj.dataLink121:setField("fldCBHab41");
    obj.dataLink121:setDefaultValue("N");
    obj.dataLink121:setName("dataLink121");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout138);
    obj.layout157:setName("layout157");
    obj.layout157:setAlign("top");
    obj.layout157:setHeight(30);

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout157);
    obj.comboBox35:setField("fldCBHab44");
    obj.comboBox35:setItems({' ', '♞', '⨉'});
    obj.comboBox35:setValues({'N', 'C', 'X'});
    obj.comboBox35:setValue("N");
    obj.comboBox35:setTransparent(true);
    obj.comboBox35:setHint("Tipo de Habilidade");
    obj.comboBox35:setName("comboBox35");
    obj.comboBox35:setWidth(35);
    obj.comboBox35:setAlign("left");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout157);
    obj.edit88:setField("fldHab44");
    obj.edit88:setName("edit88");
    lfm_setPropAsString(obj.edit88, "fontStyle",  "bold");
    obj.edit88:setFontColor("white");
    obj.edit88:setFontFamily("Cambria");
    obj.edit88:setFontSize(14);
    obj.edit88:setAlign("left");
    obj.edit88:setWidth(140);
    obj.edit88:setTransparent(true);

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout157);
    obj.layout158:setAlign("left");
    obj.layout158:setName("layout158");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout158);
    obj.edit89:setField("fldHabValor44");
    obj.edit89:setType("number");
    obj.edit89:setMin(0);
    obj.edit89:setMax(99);
    obj.edit89:setName("edit89");
    obj.edit89:setFontColor("#cdcdcd");
    obj.edit89:setFontFamily("Cambria");
    obj.edit89:setFontSize(14);
    obj.edit89:setTransparent(true);
    obj.edit89:setHeight(30);

    obj.dataLink122 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout138);
    obj.dataLink122:setField("fldHabValor44");
    obj.dataLink122:setDefaultValue("0");
    obj.dataLink122:setName("dataLink122");

    obj.dataLink123 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink123:setParent(obj.layout138);
    obj.dataLink123:setField("fldCBHab44");
    obj.dataLink123:setDefaultValue("N");
    obj.dataLink123:setName("dataLink123");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout116);
    obj.layout159:setName("layout159");
    obj.layout159:setWidth(209);
    obj.layout159:setAlign("left");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout159);
    obj.layout160:setName("layout160");
    obj.layout160:setAlign("top");
    obj.layout160:setHeight(30);

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout160);
    obj.comboBox36:setField("fldCBHab18");
    obj.comboBox36:setItems({' ', '♞', '⨉'});
    obj.comboBox36:setValues({'N', 'C', 'X'});
    obj.comboBox36:setValue("N");
    obj.comboBox36:setTransparent(true);
    obj.comboBox36:setHint("Tipo de Habilidade");
    obj.comboBox36:setName("comboBox36");
    obj.comboBox36:setWidth(35);
    obj.comboBox36:setAlign("left");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout160);
    obj.edit90:setField("fldHab18");
    obj.edit90:setName("edit90");
    lfm_setPropAsString(obj.edit90, "fontStyle",  "bold");
    obj.edit90:setFontColor("white");
    obj.edit90:setFontFamily("Cambria");
    obj.edit90:setFontSize(14);
    obj.edit90:setAlign("left");
    obj.edit90:setWidth(140);
    obj.edit90:setTransparent(true);

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout160);
    obj.layout161:setAlign("left");
    obj.layout161:setName("layout161");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout161);
    obj.edit91:setField("fldHabValor18");
    obj.edit91:setType("number");
    obj.edit91:setMin(0);
    obj.edit91:setMax(99);
    obj.edit91:setName("edit91");
    obj.edit91:setFontColor("#cdcdcd");
    obj.edit91:setFontFamily("Cambria");
    obj.edit91:setFontSize(14);
    obj.edit91:setTransparent(true);
    obj.edit91:setHeight(30);

    obj.dataLink124 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink124:setParent(obj.layout159);
    obj.dataLink124:setField("fldHabValor18");
    obj.dataLink124:setDefaultValue("0");
    obj.dataLink124:setName("dataLink124");

    obj.dataLink125 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink125:setParent(obj.layout159);
    obj.dataLink125:setField("fldCBHab18");
    obj.dataLink125:setDefaultValue("N");
    obj.dataLink125:setName("dataLink125");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout159);
    obj.layout162:setName("layout162");
    obj.layout162:setAlign("top");
    obj.layout162:setHeight(30);

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout162);
    obj.comboBox37:setField("fldCBHab21");
    obj.comboBox37:setItems({' ', '♞', '⨉'});
    obj.comboBox37:setValues({'N', 'C', 'X'});
    obj.comboBox37:setValue("N");
    obj.comboBox37:setTransparent(true);
    obj.comboBox37:setHint("Tipo de Habilidade");
    obj.comboBox37:setName("comboBox37");
    obj.comboBox37:setWidth(35);
    obj.comboBox37:setAlign("left");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout162);
    obj.edit92:setField("fldHab21");
    obj.edit92:setName("edit92");
    lfm_setPropAsString(obj.edit92, "fontStyle",  "bold");
    obj.edit92:setFontColor("white");
    obj.edit92:setFontFamily("Cambria");
    obj.edit92:setFontSize(14);
    obj.edit92:setAlign("left");
    obj.edit92:setWidth(140);
    obj.edit92:setTransparent(true);

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout162);
    obj.layout163:setAlign("left");
    obj.layout163:setName("layout163");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout163);
    obj.edit93:setField("fldHabValor21");
    obj.edit93:setType("number");
    obj.edit93:setMin(0);
    obj.edit93:setMax(99);
    obj.edit93:setName("edit93");
    obj.edit93:setFontColor("#cdcdcd");
    obj.edit93:setFontFamily("Cambria");
    obj.edit93:setFontSize(14);
    obj.edit93:setTransparent(true);
    obj.edit93:setHeight(30);

    obj.dataLink126 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink126:setParent(obj.layout159);
    obj.dataLink126:setField("fldHabValor21");
    obj.dataLink126:setDefaultValue("0");
    obj.dataLink126:setName("dataLink126");

    obj.dataLink127 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink127:setParent(obj.layout159);
    obj.dataLink127:setField("fldCBHab21");
    obj.dataLink127:setDefaultValue("N");
    obj.dataLink127:setName("dataLink127");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout159);
    obj.layout164:setName("layout164");
    obj.layout164:setAlign("top");
    obj.layout164:setHeight(30);

    obj.comboBox38 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout164);
    obj.comboBox38:setField("fldCBHab24");
    obj.comboBox38:setItems({' ', '♞', '⨉'});
    obj.comboBox38:setValues({'N', 'C', 'X'});
    obj.comboBox38:setValue("N");
    obj.comboBox38:setTransparent(true);
    obj.comboBox38:setHint("Tipo de Habilidade");
    obj.comboBox38:setName("comboBox38");
    obj.comboBox38:setWidth(35);
    obj.comboBox38:setAlign("left");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout164);
    obj.edit94:setField("fldHab24");
    obj.edit94:setName("edit94");
    lfm_setPropAsString(obj.edit94, "fontStyle",  "bold");
    obj.edit94:setFontColor("white");
    obj.edit94:setFontFamily("Cambria");
    obj.edit94:setFontSize(14);
    obj.edit94:setAlign("left");
    obj.edit94:setWidth(140);
    obj.edit94:setTransparent(true);

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout164);
    obj.layout165:setAlign("left");
    obj.layout165:setName("layout165");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout165);
    obj.edit95:setField("fldHabValor24");
    obj.edit95:setType("number");
    obj.edit95:setMin(0);
    obj.edit95:setMax(99);
    obj.edit95:setName("edit95");
    obj.edit95:setFontColor("#cdcdcd");
    obj.edit95:setFontFamily("Cambria");
    obj.edit95:setFontSize(14);
    obj.edit95:setTransparent(true);
    obj.edit95:setHeight(30);

    obj.dataLink128 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink128:setParent(obj.layout159);
    obj.dataLink128:setField("fldHabValor24");
    obj.dataLink128:setDefaultValue("0");
    obj.dataLink128:setName("dataLink128");

    obj.dataLink129 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink129:setParent(obj.layout159);
    obj.dataLink129:setField("fldCBHab24");
    obj.dataLink129:setDefaultValue("N");
    obj.dataLink129:setName("dataLink129");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout159);
    obj.layout166:setName("layout166");
    obj.layout166:setAlign("top");
    obj.layout166:setHeight(30);

    obj.comboBox39 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout166);
    obj.comboBox39:setField("fldCBHab27");
    obj.comboBox39:setItems({' ', '♞', '⨉'});
    obj.comboBox39:setValues({'N', 'C', 'X'});
    obj.comboBox39:setValue("N");
    obj.comboBox39:setTransparent(true);
    obj.comboBox39:setHint("Tipo de Habilidade");
    obj.comboBox39:setName("comboBox39");
    obj.comboBox39:setWidth(35);
    obj.comboBox39:setAlign("left");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout166);
    obj.edit96:setField("fldHab27");
    obj.edit96:setName("edit96");
    lfm_setPropAsString(obj.edit96, "fontStyle",  "bold");
    obj.edit96:setFontColor("white");
    obj.edit96:setFontFamily("Cambria");
    obj.edit96:setFontSize(14);
    obj.edit96:setAlign("left");
    obj.edit96:setWidth(140);
    obj.edit96:setTransparent(true);

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout166);
    obj.layout167:setAlign("left");
    obj.layout167:setName("layout167");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout167);
    obj.edit97:setField("fldHabValor27");
    obj.edit97:setType("number");
    obj.edit97:setMin(0);
    obj.edit97:setMax(99);
    obj.edit97:setName("edit97");
    obj.edit97:setFontColor("#cdcdcd");
    obj.edit97:setFontFamily("Cambria");
    obj.edit97:setFontSize(14);
    obj.edit97:setTransparent(true);
    obj.edit97:setHeight(30);

    obj.dataLink130 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink130:setParent(obj.layout159);
    obj.dataLink130:setField("fldHabValor27");
    obj.dataLink130:setDefaultValue("0");
    obj.dataLink130:setName("dataLink130");

    obj.dataLink131 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink131:setParent(obj.layout159);
    obj.dataLink131:setField("fldCBHab27");
    obj.dataLink131:setDefaultValue("N");
    obj.dataLink131:setName("dataLink131");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout159);
    obj.layout168:setName("layout168");
    obj.layout168:setAlign("top");
    obj.layout168:setHeight(30);

    obj.comboBox40 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout168);
    obj.comboBox40:setField("fldCBHab30");
    obj.comboBox40:setItems({' ', '♞', '⨉'});
    obj.comboBox40:setValues({'N', 'C', 'X'});
    obj.comboBox40:setValue("N");
    obj.comboBox40:setTransparent(true);
    obj.comboBox40:setHint("Tipo de Habilidade");
    obj.comboBox40:setName("comboBox40");
    obj.comboBox40:setWidth(35);
    obj.comboBox40:setAlign("left");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout168);
    obj.edit98:setField("fldHab30");
    obj.edit98:setName("edit98");
    lfm_setPropAsString(obj.edit98, "fontStyle",  "bold");
    obj.edit98:setFontColor("white");
    obj.edit98:setFontFamily("Cambria");
    obj.edit98:setFontSize(14);
    obj.edit98:setAlign("left");
    obj.edit98:setWidth(140);
    obj.edit98:setTransparent(true);

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout168);
    obj.layout169:setAlign("left");
    obj.layout169:setName("layout169");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout169);
    obj.edit99:setField("fldHabValor30");
    obj.edit99:setType("number");
    obj.edit99:setMin(0);
    obj.edit99:setMax(99);
    obj.edit99:setName("edit99");
    obj.edit99:setFontColor("#cdcdcd");
    obj.edit99:setFontFamily("Cambria");
    obj.edit99:setFontSize(14);
    obj.edit99:setTransparent(true);
    obj.edit99:setHeight(30);

    obj.dataLink132 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink132:setParent(obj.layout159);
    obj.dataLink132:setField("fldHabValor30");
    obj.dataLink132:setDefaultValue("0");
    obj.dataLink132:setName("dataLink132");

    obj.dataLink133 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink133:setParent(obj.layout159);
    obj.dataLink133:setField("fldCBHab30");
    obj.dataLink133:setDefaultValue("N");
    obj.dataLink133:setName("dataLink133");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout159);
    obj.layout170:setName("layout170");
    obj.layout170:setAlign("top");
    obj.layout170:setHeight(30);

    obj.comboBox41 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout170);
    obj.comboBox41:setField("fldCBHab33");
    obj.comboBox41:setItems({' ', '♞', '⨉'});
    obj.comboBox41:setValues({'N', 'C', 'X'});
    obj.comboBox41:setValue("N");
    obj.comboBox41:setTransparent(true);
    obj.comboBox41:setHint("Tipo de Habilidade");
    obj.comboBox41:setName("comboBox41");
    obj.comboBox41:setWidth(35);
    obj.comboBox41:setAlign("left");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout170);
    obj.edit100:setField("fldHab33");
    obj.edit100:setName("edit100");
    lfm_setPropAsString(obj.edit100, "fontStyle",  "bold");
    obj.edit100:setFontColor("white");
    obj.edit100:setFontFamily("Cambria");
    obj.edit100:setFontSize(14);
    obj.edit100:setAlign("left");
    obj.edit100:setWidth(140);
    obj.edit100:setTransparent(true);

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout170);
    obj.layout171:setAlign("left");
    obj.layout171:setName("layout171");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout171);
    obj.edit101:setField("fldHabValor33");
    obj.edit101:setType("number");
    obj.edit101:setMin(0);
    obj.edit101:setMax(99);
    obj.edit101:setName("edit101");
    obj.edit101:setFontColor("#cdcdcd");
    obj.edit101:setFontFamily("Cambria");
    obj.edit101:setFontSize(14);
    obj.edit101:setTransparent(true);
    obj.edit101:setHeight(30);

    obj.dataLink134 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink134:setParent(obj.layout159);
    obj.dataLink134:setField("fldHabValor33");
    obj.dataLink134:setDefaultValue("0");
    obj.dataLink134:setName("dataLink134");

    obj.dataLink135 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink135:setParent(obj.layout159);
    obj.dataLink135:setField("fldCBHab33");
    obj.dataLink135:setDefaultValue("N");
    obj.dataLink135:setName("dataLink135");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout159);
    obj.layout172:setName("layout172");
    obj.layout172:setAlign("top");
    obj.layout172:setHeight(30);

    obj.comboBox42 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout172);
    obj.comboBox42:setField("fldCBHab36");
    obj.comboBox42:setItems({' ', '♞', '⨉'});
    obj.comboBox42:setValues({'N', 'C', 'X'});
    obj.comboBox42:setValue("N");
    obj.comboBox42:setTransparent(true);
    obj.comboBox42:setHint("Tipo de Habilidade");
    obj.comboBox42:setName("comboBox42");
    obj.comboBox42:setWidth(35);
    obj.comboBox42:setAlign("left");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout172);
    obj.edit102:setField("fldHab36");
    obj.edit102:setName("edit102");
    lfm_setPropAsString(obj.edit102, "fontStyle",  "bold");
    obj.edit102:setFontColor("white");
    obj.edit102:setFontFamily("Cambria");
    obj.edit102:setFontSize(14);
    obj.edit102:setAlign("left");
    obj.edit102:setWidth(140);
    obj.edit102:setTransparent(true);

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout172);
    obj.layout173:setAlign("left");
    obj.layout173:setName("layout173");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout173);
    obj.edit103:setField("fldHabValor36");
    obj.edit103:setType("number");
    obj.edit103:setMin(0);
    obj.edit103:setMax(99);
    obj.edit103:setName("edit103");
    obj.edit103:setFontColor("#cdcdcd");
    obj.edit103:setFontFamily("Cambria");
    obj.edit103:setFontSize(14);
    obj.edit103:setTransparent(true);
    obj.edit103:setHeight(30);

    obj.dataLink136 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink136:setParent(obj.layout159);
    obj.dataLink136:setField("fldHabValor36");
    obj.dataLink136:setDefaultValue("0");
    obj.dataLink136:setName("dataLink136");

    obj.dataLink137 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink137:setParent(obj.layout159);
    obj.dataLink137:setField("fldCBHab36");
    obj.dataLink137:setDefaultValue("N");
    obj.dataLink137:setName("dataLink137");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout159);
    obj.layout174:setName("layout174");
    obj.layout174:setAlign("top");
    obj.layout174:setHeight(30);

    obj.comboBox43 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout174);
    obj.comboBox43:setField("fldCBHab39");
    obj.comboBox43:setItems({' ', '♞', '⨉'});
    obj.comboBox43:setValues({'N', 'C', 'X'});
    obj.comboBox43:setValue("N");
    obj.comboBox43:setTransparent(true);
    obj.comboBox43:setHint("Tipo de Habilidade");
    obj.comboBox43:setName("comboBox43");
    obj.comboBox43:setWidth(35);
    obj.comboBox43:setAlign("left");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout174);
    obj.edit104:setField("fldHab39");
    obj.edit104:setName("edit104");
    lfm_setPropAsString(obj.edit104, "fontStyle",  "bold");
    obj.edit104:setFontColor("white");
    obj.edit104:setFontFamily("Cambria");
    obj.edit104:setFontSize(14);
    obj.edit104:setAlign("left");
    obj.edit104:setWidth(140);
    obj.edit104:setTransparent(true);

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout174);
    obj.layout175:setAlign("left");
    obj.layout175:setName("layout175");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout175);
    obj.edit105:setField("fldHabValor39");
    obj.edit105:setType("number");
    obj.edit105:setMin(0);
    obj.edit105:setMax(99);
    obj.edit105:setName("edit105");
    obj.edit105:setFontColor("#cdcdcd");
    obj.edit105:setFontFamily("Cambria");
    obj.edit105:setFontSize(14);
    obj.edit105:setTransparent(true);
    obj.edit105:setHeight(30);

    obj.dataLink138 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink138:setParent(obj.layout159);
    obj.dataLink138:setField("fldHabValor39");
    obj.dataLink138:setDefaultValue("0");
    obj.dataLink138:setName("dataLink138");

    obj.dataLink139 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink139:setParent(obj.layout159);
    obj.dataLink139:setField("fldCBHab39");
    obj.dataLink139:setDefaultValue("N");
    obj.dataLink139:setName("dataLink139");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout159);
    obj.layout176:setName("layout176");
    obj.layout176:setAlign("top");
    obj.layout176:setHeight(30);

    obj.comboBox44 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout176);
    obj.comboBox44:setField("fldCBHab42");
    obj.comboBox44:setItems({' ', '♞', '⨉'});
    obj.comboBox44:setValues({'N', 'C', 'X'});
    obj.comboBox44:setValue("N");
    obj.comboBox44:setTransparent(true);
    obj.comboBox44:setHint("Tipo de Habilidade");
    obj.comboBox44:setName("comboBox44");
    obj.comboBox44:setWidth(35);
    obj.comboBox44:setAlign("left");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout176);
    obj.edit106:setField("fldHab42");
    obj.edit106:setName("edit106");
    lfm_setPropAsString(obj.edit106, "fontStyle",  "bold");
    obj.edit106:setFontColor("white");
    obj.edit106:setFontFamily("Cambria");
    obj.edit106:setFontSize(14);
    obj.edit106:setAlign("left");
    obj.edit106:setWidth(140);
    obj.edit106:setTransparent(true);

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout176);
    obj.layout177:setAlign("left");
    obj.layout177:setName("layout177");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout177);
    obj.edit107:setField("fldHabValor42");
    obj.edit107:setType("number");
    obj.edit107:setMin(0);
    obj.edit107:setMax(99);
    obj.edit107:setName("edit107");
    obj.edit107:setFontColor("#cdcdcd");
    obj.edit107:setFontFamily("Cambria");
    obj.edit107:setFontSize(14);
    obj.edit107:setTransparent(true);
    obj.edit107:setHeight(30);

    obj.dataLink140 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink140:setParent(obj.layout159);
    obj.dataLink140:setField("fldHabValor42");
    obj.dataLink140:setDefaultValue("0");
    obj.dataLink140:setName("dataLink140");

    obj.dataLink141 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink141:setParent(obj.layout159);
    obj.dataLink141:setField("fldCBHab42");
    obj.dataLink141:setDefaultValue("N");
    obj.dataLink141:setName("dataLink141");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.layout159);
    obj.layout178:setName("layout178");
    obj.layout178:setAlign("top");
    obj.layout178:setHeight(30);

    obj.comboBox45 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox45:setParent(obj.layout178);
    obj.comboBox45:setField("fldCBHab45");
    obj.comboBox45:setItems({' ', '♞', '⨉'});
    obj.comboBox45:setValues({'N', 'C', 'X'});
    obj.comboBox45:setValue("N");
    obj.comboBox45:setTransparent(true);
    obj.comboBox45:setHint("Tipo de Habilidade");
    obj.comboBox45:setName("comboBox45");
    obj.comboBox45:setWidth(35);
    obj.comboBox45:setAlign("left");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout178);
    obj.edit108:setField("fldHab45");
    obj.edit108:setName("edit108");
    lfm_setPropAsString(obj.edit108, "fontStyle",  "bold");
    obj.edit108:setFontColor("white");
    obj.edit108:setFontFamily("Cambria");
    obj.edit108:setFontSize(14);
    obj.edit108:setAlign("left");
    obj.edit108:setWidth(140);
    obj.edit108:setTransparent(true);

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.layout178);
    obj.layout179:setAlign("left");
    obj.layout179:setName("layout179");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout179);
    obj.edit109:setField("fldHabValor45");
    obj.edit109:setType("number");
    obj.edit109:setMin(0);
    obj.edit109:setMax(99);
    obj.edit109:setName("edit109");
    obj.edit109:setFontColor("#cdcdcd");
    obj.edit109:setFontFamily("Cambria");
    obj.edit109:setFontSize(14);
    obj.edit109:setTransparent(true);
    obj.edit109:setHeight(30);

    obj.dataLink142 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink142:setParent(obj.layout159);
    obj.dataLink142:setField("fldHabValor45");
    obj.dataLink142:setDefaultValue("0");
    obj.dataLink142:setName("dataLink142");

    obj.dataLink143 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink143:setParent(obj.layout159);
    obj.dataLink143:setField("fldCBHab45");
    obj.dataLink143:setDefaultValue("N");
    obj.dataLink143:setName("dataLink143");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle2);
    obj.layout180:setAlign("top");
    obj.layout180:setHeight(20);
    obj.layout180:setMargins({left = 40});
    obj.layout180:setName("layout180");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout180);
    obj.label37:setAlign("left");
    obj.label37:setWidth(180);
    obj.label37:setText("UPGRADES POR GLÓRIA");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setFontColor("#cdcdcd");
    obj.label37:setFontFamily("Palatino Linotype");
    obj.label37:setFontSize(14);
    obj.label37:setName("label37");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout180);
    obj.edit110:setWidth(470);
    obj.edit110:setField("fldUpgradesGlor");
    obj.edit110:setAlign("left");
    obj.edit110:setFontColor("#858585");
    obj.edit110:setName("edit110");
    obj.edit110:setFontFamily("Cambria");
    obj.edit110:setFontSize(14);
    obj.edit110:setHeight(30);
    obj.edit110:setTransparent(true);

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle2);
    obj.layout181:setAlign("top");
    obj.layout181:setHeight(20);
    obj.layout181:setMargins({left = 40});
    obj.layout181:setName("layout181");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout181);
    obj.label38:setAlign("left");
    obj.label38:setWidth(180);
    obj.label38:setText("UPGRADES DE INVERNO");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontColor("#cdcdcd");
    obj.label38:setFontFamily("Palatino Linotype");
    obj.label38:setFontSize(14);
    obj.label38:setName("label38");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout181);
    obj.edit111:setWidth(470);
    obj.edit111:setField("fldUpgradesInv");
    obj.edit111:setAlign("left");
    obj.edit111:setFontColor("#858585");
    obj.edit111:setName("edit111");
    obj.edit111:setFontFamily("Cambria");
    obj.edit111:setFontSize(14);
    obj.edit111:setHeight(30);
    obj.edit111:setTransparent(true);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Traços e Paixões");
    obj.tab2:setName("tab2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.tab2);
    obj.rectangle6:setPadding({top = 10});
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#272727");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle6);
    obj.layout182:setAlign("top");
    obj.layout182:setName("layout182");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout182);
    obj.label39:setAlign("left");
    obj.label39:setText("☙ TRAÇOS");
    obj.label39:setWidth(115);
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setFontColor("#0080ff");
    obj.label39:setFontFamily("Palatino Linotype");
    obj.label39:setFontSize(20);
    obj.label39:setName("label39");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.layout182);
    obj.layout183:setAlign("left");
    obj.layout183:setWidth(535);
    obj.layout183:setName("layout183");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout183);
    obj.rectangle7:setHeight(2);
    obj.rectangle7:setWidth(535);
    obj.rectangle7:setTop(25);
    obj.rectangle7:setColor("#0080ff");
    obj.rectangle7:setName("rectangle7");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle6);
    obj.layout184:setWidth(650);
    obj.layout184:setHeight(600);
    obj.layout184:setTop(70);
    obj.layout184:setName("layout184");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout184);
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("#272727");
    obj.rectangle8:setPadding({left=40});

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle8);
    obj.label40:setAlign("left");
    obj.label40:setWidth(228);
    obj.label40:setText("VIRTUDES");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setFontColor("#cdcdcd");
    obj.label40:setFontFamily("Palatino Linotype");
    obj.label40:setFontSize(14);
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle8);
    obj.label41:setAlign("left");
    obj.label41:setWidth(138);
    obj.label41:setText("VÍCIOS");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setFontColor("#cdcdcd");
    obj.label41:setFontFamily("Palatino Linotype");
    obj.label41:setFontSize(14);
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle8);
    obj.label42:setAlign("left");
    obj.label42:setWidth(422);
    obj.label42:setText("CUSTOMIZADOS");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setFontColor("#cdcdcd");
    obj.label42:setFontFamily("Palatino Linotype");
    obj.label42:setFontSize(14);
    obj.label42:setName("label42");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout184);
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setAlign("top");
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setPadding({left=40});

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle9);
    obj.layout185:setAlign("left");
    obj.layout185:setWidth(139);
    obj.layout185:setName("layout185");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout185);
    obj.imageCheckBox1:setField("fldChCastidade");
    obj.imageCheckBox1:setWidth(11);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox1:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox1:setMargins({right = 5});
    obj.imageCheckBox1:setHint("Traço Religioso");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.namCastidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namCastidade:setParent(obj.layout185);
    obj.namCastidade:setField("Castidade");
    obj.namCastidade:setName("namCastidade");
    obj.namCastidade:setAlign("none");
    obj.namCastidade:setTop(7);
    obj.namCastidade:setLeft(16);
    obj.namCastidade:setFontColor("#6f6f6f");
    obj.namCastidade:setFontFamily("Cambria");
    obj.namCastidade:setFontSize(14);

    obj.namCastidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCastidadeB:setParent(obj.layout185);
    obj.namCastidadeB:setField("CastidadeB");
    obj.namCastidadeB:setName("namCastidadeB");
    obj.namCastidadeB:setAlign("none");
    obj.namCastidadeB:setTop(7);
    obj.namCastidadeB:setLeft(16);
    lfm_setPropAsString(obj.namCastidadeB, "fontStyle",  "bold");
    obj.namCastidadeB:setFontColor("white");
    obj.namCastidadeB:setFontFamily("Cambria");
    obj.namCastidadeB:setFontSize(14);

    obj.dataLink144 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink144:setParent(obj.layout185);
    obj.dataLink144:setFields({'Castidade', 'CastidadeB'});
    obj.dataLink144:setDefaultValues({'Castidade', 'Castidade'});
    obj.dataLink144:setName("dataLink144");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle9);
    obj.layout186:setAlign("left");
    obj.layout186:setWidth(89);
    obj.layout186:setName("layout186");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout186);
    obj.edit112:setField("fldValCastidade");
    obj.edit112:setType("number");
    obj.edit112:setMin(0);
    obj.edit112:setMax(20);
    obj.edit112:setAlign("left");
    obj.edit112:setWidth(25);
    obj.edit112:setName("edit112");
    lfm_setPropAsString(obj.edit112, "fontStyle",  "bold");
    obj.edit112:setFontColor("white");
    obj.edit112:setFontFamily("Cambria");
    obj.edit112:setFontSize(14);
    obj.edit112:setTransparent(true);
    obj.edit112:setHeight(20);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout186);
    obj.label43:setText("/");
    obj.label43:setWidth(8);
    obj.label43:setName("label43");
    obj.label43:setFontColor("#6f6f6f");
    obj.label43:setFontFamily("Cambria");
    obj.label43:setFontSize(14);
    obj.label43:setAlign("left");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout186);
    obj.edit113:setField("fldValLuxuria");
    obj.edit113:setType("number");
    obj.edit113:setMin(0);
    obj.edit113:setMax(20);
    obj.edit113:setAlign("left");
    obj.edit113:setWidth(25);
    obj.edit113:setName("edit113");
    lfm_setPropAsString(obj.edit113, "fontStyle",  "bold");
    obj.edit113:setFontColor("white");
    obj.edit113:setFontFamily("Cambria");
    obj.edit113:setFontSize(14);
    obj.edit113:setTransparent(true);
    obj.edit113:setHeight(20);

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle9);
    obj.layout187:setAlign("left");
    obj.layout187:setWidth(422);
    obj.layout187:setName("layout187");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout187);
    obj.imageCheckBox2:setField("fldChLuxuria");
    obj.imageCheckBox2:setWidth(11);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox2:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox2:setMargins({right = 5});
    obj.imageCheckBox2:setHint("Traço Religioso");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.namLuxuria = GUI.fromHandle(_obj_newObject("label"));
    obj.namLuxuria:setParent(obj.layout187);
    obj.namLuxuria:setField("Luxuria");
    obj.namLuxuria:setName("namLuxuria");
    obj.namLuxuria:setAlign("none");
    obj.namLuxuria:setTop(7);
    obj.namLuxuria:setLeft(16);
    obj.namLuxuria:setFontColor("#6f6f6f");
    obj.namLuxuria:setFontFamily("Cambria");
    obj.namLuxuria:setFontSize(14);

    obj.namLuxuriaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namLuxuriaB:setParent(obj.layout187);
    obj.namLuxuriaB:setField("LuxuriaB");
    obj.namLuxuriaB:setName("namLuxuriaB");
    obj.namLuxuriaB:setAlign("none");
    obj.namLuxuriaB:setTop(7);
    obj.namLuxuriaB:setLeft(16);
    lfm_setPropAsString(obj.namLuxuriaB, "fontStyle",  "bold");
    obj.namLuxuriaB:setFontColor("white");
    obj.namLuxuriaB:setFontFamily("Cambria");
    obj.namLuxuriaB:setFontSize(14);

    obj.dataLink145 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink145:setParent(obj.layout187);
    obj.dataLink145:setFields({'Luxuria', 'LuxuriaB'});
    obj.dataLink145:setDefaultValues({'Luxúria', 'Luxúria'});
    obj.dataLink145:setName("dataLink145");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout187);
    obj.edit114:setWidth(246);
    obj.edit114:setText("—");
    obj.edit114:setAlign("left");
    obj.edit114:setFontColor("#858585");
    obj.edit114:setMargins({left=120});
    obj.edit114:setName("edit114");
    obj.edit114:setFontFamily("Cambria");
    obj.edit114:setFontSize(14);
    obj.edit114:setHeight(30);
    obj.edit114:setTransparent(true);

    obj.dataLink146 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink146:setParent(obj.layout184);
    obj.dataLink146:setField("fldValCastidade");
    obj.dataLink146:setDefaultValue("10");
    obj.dataLink146:setName("dataLink146");

    obj.dataLink147 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink147:setParent(obj.layout184);
    obj.dataLink147:setField("fldValLuxuria");
    obj.dataLink147:setDefaultValue("10");
    obj.dataLink147:setName("dataLink147");

    obj.dataLink148 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink148:setParent(obj.layout184);
    obj.dataLink148:setFields({'fldChCastidade', 'fldChLuxuria'});
    obj.dataLink148:setName("dataLink148");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout184);
    obj.rectangle10:setColor("#2E2E2E");
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setPadding({left=40});

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle10);
    obj.layout188:setAlign("left");
    obj.layout188:setWidth(139);
    obj.layout188:setName("layout188");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout188);
    obj.imageCheckBox3:setField("fldChEnergia");
    obj.imageCheckBox3:setWidth(11);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox3:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox3:setMargins({right = 5});
    obj.imageCheckBox3:setHint("Traço Religioso");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.namEnergia = GUI.fromHandle(_obj_newObject("label"));
    obj.namEnergia:setParent(obj.layout188);
    obj.namEnergia:setField("Energia");
    obj.namEnergia:setName("namEnergia");
    obj.namEnergia:setAlign("none");
    obj.namEnergia:setTop(7);
    obj.namEnergia:setLeft(16);
    obj.namEnergia:setFontColor("#6f6f6f");
    obj.namEnergia:setFontFamily("Cambria");
    obj.namEnergia:setFontSize(14);

    obj.namEnergiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEnergiaB:setParent(obj.layout188);
    obj.namEnergiaB:setField("EnergiaB");
    obj.namEnergiaB:setName("namEnergiaB");
    obj.namEnergiaB:setAlign("none");
    obj.namEnergiaB:setTop(7);
    obj.namEnergiaB:setLeft(16);
    lfm_setPropAsString(obj.namEnergiaB, "fontStyle",  "bold");
    obj.namEnergiaB:setFontColor("white");
    obj.namEnergiaB:setFontFamily("Cambria");
    obj.namEnergiaB:setFontSize(14);

    obj.dataLink149 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink149:setParent(obj.layout188);
    obj.dataLink149:setFields({'Energia', 'EnergiaB'});
    obj.dataLink149:setDefaultValues({'Energia ♞', 'Energia ♞'});
    obj.dataLink149:setName("dataLink149");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle10);
    obj.layout189:setAlign("left");
    obj.layout189:setWidth(89);
    obj.layout189:setName("layout189");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout189);
    obj.edit115:setField("fldValEnergia");
    obj.edit115:setType("number");
    obj.edit115:setMin(0);
    obj.edit115:setMax(20);
    obj.edit115:setAlign("left");
    obj.edit115:setWidth(25);
    obj.edit115:setName("edit115");
    lfm_setPropAsString(obj.edit115, "fontStyle",  "bold");
    obj.edit115:setFontColor("white");
    obj.edit115:setFontFamily("Cambria");
    obj.edit115:setFontSize(14);
    obj.edit115:setTransparent(true);
    obj.edit115:setHeight(20);

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout189);
    obj.label44:setText("/");
    obj.label44:setWidth(8);
    obj.label44:setName("label44");
    obj.label44:setFontColor("#6f6f6f");
    obj.label44:setFontFamily("Cambria");
    obj.label44:setFontSize(14);
    obj.label44:setAlign("left");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout189);
    obj.edit116:setField("fldValPreguica");
    obj.edit116:setType("number");
    obj.edit116:setMin(0);
    obj.edit116:setMax(20);
    obj.edit116:setAlign("left");
    obj.edit116:setWidth(25);
    obj.edit116:setName("edit116");
    lfm_setPropAsString(obj.edit116, "fontStyle",  "bold");
    obj.edit116:setFontColor("white");
    obj.edit116:setFontFamily("Cambria");
    obj.edit116:setFontSize(14);
    obj.edit116:setTransparent(true);
    obj.edit116:setHeight(20);

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle10);
    obj.layout190:setAlign("left");
    obj.layout190:setWidth(422);
    obj.layout190:setName("layout190");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout190);
    obj.imageCheckBox4:setField("fldChPreguica");
    obj.imageCheckBox4:setWidth(11);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox4:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox4:setMargins({right = 5});
    obj.imageCheckBox4:setHint("Traço Religioso");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.namPreguica = GUI.fromHandle(_obj_newObject("label"));
    obj.namPreguica:setParent(obj.layout190);
    obj.namPreguica:setField("Preguica");
    obj.namPreguica:setName("namPreguica");
    obj.namPreguica:setAlign("none");
    obj.namPreguica:setTop(7);
    obj.namPreguica:setLeft(16);
    obj.namPreguica:setFontColor("#6f6f6f");
    obj.namPreguica:setFontFamily("Cambria");
    obj.namPreguica:setFontSize(14);

    obj.namPreguicaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPreguicaB:setParent(obj.layout190);
    obj.namPreguicaB:setField("PreguicaB");
    obj.namPreguicaB:setName("namPreguicaB");
    obj.namPreguicaB:setAlign("none");
    obj.namPreguicaB:setTop(7);
    obj.namPreguicaB:setLeft(16);
    lfm_setPropAsString(obj.namPreguicaB, "fontStyle",  "bold");
    obj.namPreguicaB:setFontColor("white");
    obj.namPreguicaB:setFontFamily("Cambria");
    obj.namPreguicaB:setFontSize(14);

    obj.dataLink150 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink150:setParent(obj.layout190);
    obj.dataLink150:setFields({'Preguica', 'PreguicaB'});
    obj.dataLink150:setDefaultValues({'Preguiça', 'Preguiça'});
    obj.dataLink150:setName("dataLink150");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout190);
    obj.edit117:setWidth(246);
    obj.edit117:setText("—");
    obj.edit117:setAlign("left");
    obj.edit117:setFontColor("#858585");
    obj.edit117:setMargins({left=120});
    obj.edit117:setName("edit117");
    obj.edit117:setFontFamily("Cambria");
    obj.edit117:setFontSize(14);
    obj.edit117:setHeight(30);
    obj.edit117:setTransparent(true);

    obj.dataLink151 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink151:setParent(obj.layout184);
    obj.dataLink151:setField("fldValEnergia");
    obj.dataLink151:setDefaultValue("10");
    obj.dataLink151:setName("dataLink151");

    obj.dataLink152 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink152:setParent(obj.layout184);
    obj.dataLink152:setField("fldValPreguica");
    obj.dataLink152:setDefaultValue("10");
    obj.dataLink152:setName("dataLink152");

    obj.dataLink153 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink153:setParent(obj.layout184);
    obj.dataLink153:setFields({'fldChEnergia', 'fldChPreguica'});
    obj.dataLink153:setName("dataLink153");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout184);
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setPadding({left=40});

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.rectangle11);
    obj.layout191:setAlign("left");
    obj.layout191:setWidth(139);
    obj.layout191:setName("layout191");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout191);
    obj.imageCheckBox5:setField("fldChPerdao");
    obj.imageCheckBox5:setWidth(11);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox5:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox5:setMargins({right = 5});
    obj.imageCheckBox5:setHint("Traço Religioso");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.namPerdao = GUI.fromHandle(_obj_newObject("label"));
    obj.namPerdao:setParent(obj.layout191);
    obj.namPerdao:setField("Perdao");
    obj.namPerdao:setName("namPerdao");
    obj.namPerdao:setAlign("none");
    obj.namPerdao:setTop(7);
    obj.namPerdao:setLeft(16);
    obj.namPerdao:setFontColor("#6f6f6f");
    obj.namPerdao:setFontFamily("Cambria");
    obj.namPerdao:setFontSize(14);

    obj.namPerdaoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPerdaoB:setParent(obj.layout191);
    obj.namPerdaoB:setField("PerdaoB");
    obj.namPerdaoB:setName("namPerdaoB");
    obj.namPerdaoB:setAlign("none");
    obj.namPerdaoB:setTop(7);
    obj.namPerdaoB:setLeft(16);
    lfm_setPropAsString(obj.namPerdaoB, "fontStyle",  "bold");
    obj.namPerdaoB:setFontColor("white");
    obj.namPerdaoB:setFontFamily("Cambria");
    obj.namPerdaoB:setFontSize(14);

    obj.dataLink154 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink154:setParent(obj.layout191);
    obj.dataLink154:setFields({'Perdao', 'PerdaoB'});
    obj.dataLink154:setDefaultValues({'Perdão', 'Perdão'});
    obj.dataLink154:setName("dataLink154");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle11);
    obj.layout192:setAlign("left");
    obj.layout192:setWidth(89);
    obj.layout192:setName("layout192");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout192);
    obj.edit118:setField("fldValPerdao");
    obj.edit118:setType("number");
    obj.edit118:setMin(0);
    obj.edit118:setMax(20);
    obj.edit118:setAlign("left");
    obj.edit118:setWidth(25);
    obj.edit118:setName("edit118");
    lfm_setPropAsString(obj.edit118, "fontStyle",  "bold");
    obj.edit118:setFontColor("white");
    obj.edit118:setFontFamily("Cambria");
    obj.edit118:setFontSize(14);
    obj.edit118:setTransparent(true);
    obj.edit118:setHeight(20);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout192);
    obj.label45:setText("/");
    obj.label45:setWidth(8);
    obj.label45:setName("label45");
    obj.label45:setFontColor("#6f6f6f");
    obj.label45:setFontFamily("Cambria");
    obj.label45:setFontSize(14);
    obj.label45:setAlign("left");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout192);
    obj.edit119:setField("fldValVinganca");
    obj.edit119:setType("number");
    obj.edit119:setMin(0);
    obj.edit119:setMax(20);
    obj.edit119:setAlign("left");
    obj.edit119:setWidth(25);
    obj.edit119:setName("edit119");
    lfm_setPropAsString(obj.edit119, "fontStyle",  "bold");
    obj.edit119:setFontColor("white");
    obj.edit119:setFontFamily("Cambria");
    obj.edit119:setFontSize(14);
    obj.edit119:setTransparent(true);
    obj.edit119:setHeight(20);

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle11);
    obj.layout193:setAlign("left");
    obj.layout193:setWidth(422);
    obj.layout193:setName("layout193");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout193);
    obj.imageCheckBox6:setField("fldChVinganca");
    obj.imageCheckBox6:setWidth(11);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox6:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox6:setMargins({right = 5});
    obj.imageCheckBox6:setHint("Traço Religioso");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.namVinganca = GUI.fromHandle(_obj_newObject("label"));
    obj.namVinganca:setParent(obj.layout193);
    obj.namVinganca:setField("Vinganca");
    obj.namVinganca:setName("namVinganca");
    obj.namVinganca:setAlign("none");
    obj.namVinganca:setTop(7);
    obj.namVinganca:setLeft(16);
    obj.namVinganca:setFontColor("#6f6f6f");
    obj.namVinganca:setFontFamily("Cambria");
    obj.namVinganca:setFontSize(14);

    obj.namVingancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namVingancaB:setParent(obj.layout193);
    obj.namVingancaB:setField("VingancaB");
    obj.namVingancaB:setName("namVingancaB");
    obj.namVingancaB:setAlign("none");
    obj.namVingancaB:setTop(7);
    obj.namVingancaB:setLeft(16);
    lfm_setPropAsString(obj.namVingancaB, "fontStyle",  "bold");
    obj.namVingancaB:setFontColor("white");
    obj.namVingancaB:setFontFamily("Cambria");
    obj.namVingancaB:setFontSize(14);

    obj.dataLink155 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink155:setParent(obj.layout193);
    obj.dataLink155:setFields({'Vinganca', 'VingancaB'});
    obj.dataLink155:setDefaultValues({'Vingança', 'Vingança'});
    obj.dataLink155:setName("dataLink155");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout193);
    obj.edit120:setWidth(246);
    obj.edit120:setText("—");
    obj.edit120:setAlign("left");
    obj.edit120:setFontColor("#858585");
    obj.edit120:setMargins({left=120});
    obj.edit120:setName("edit120");
    obj.edit120:setFontFamily("Cambria");
    obj.edit120:setFontSize(14);
    obj.edit120:setHeight(30);
    obj.edit120:setTransparent(true);

    obj.dataLink156 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink156:setParent(obj.layout184);
    obj.dataLink156:setField("fldValPerdao");
    obj.dataLink156:setDefaultValue("10");
    obj.dataLink156:setName("dataLink156");

    obj.dataLink157 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink157:setParent(obj.layout184);
    obj.dataLink157:setField("fldValVinganca");
    obj.dataLink157:setDefaultValue("10");
    obj.dataLink157:setName("dataLink157");

    obj.dataLink158 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink158:setParent(obj.layout184);
    obj.dataLink158:setFields({'fldChPerdao', 'fldChVinganca'});
    obj.dataLink158:setName("dataLink158");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout184);
    obj.rectangle12:setColor("#2E2E2E");
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setPadding({left=40});

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle12);
    obj.layout194:setAlign("left");
    obj.layout194:setWidth(139);
    obj.layout194:setName("layout194");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout194);
    obj.imageCheckBox7:setField("fldChGenerosidade");
    obj.imageCheckBox7:setWidth(11);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox7:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox7:setMargins({right = 5});
    obj.imageCheckBox7:setHint("Traço Religioso");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.namGenerosidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namGenerosidade:setParent(obj.layout194);
    obj.namGenerosidade:setField("Generosidade");
    obj.namGenerosidade:setName("namGenerosidade");
    obj.namGenerosidade:setAlign("none");
    obj.namGenerosidade:setTop(7);
    obj.namGenerosidade:setLeft(16);
    obj.namGenerosidade:setFontColor("#6f6f6f");
    obj.namGenerosidade:setFontFamily("Cambria");
    obj.namGenerosidade:setFontSize(14);

    obj.namGenerosidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namGenerosidadeB:setParent(obj.layout194);
    obj.namGenerosidadeB:setField("GenerosidadeB");
    obj.namGenerosidadeB:setName("namGenerosidadeB");
    obj.namGenerosidadeB:setAlign("none");
    obj.namGenerosidadeB:setTop(7);
    obj.namGenerosidadeB:setLeft(16);
    lfm_setPropAsString(obj.namGenerosidadeB, "fontStyle",  "bold");
    obj.namGenerosidadeB:setFontColor("white");
    obj.namGenerosidadeB:setFontFamily("Cambria");
    obj.namGenerosidadeB:setFontSize(14);

    obj.dataLink159 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink159:setParent(obj.layout194);
    obj.dataLink159:setFields({'Generosidade', 'GenerosidadeB'});
    obj.dataLink159:setDefaultValues({'Generosidade ♞', 'Generosidade ♞'});
    obj.dataLink159:setName("dataLink159");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.rectangle12);
    obj.layout195:setAlign("left");
    obj.layout195:setWidth(89);
    obj.layout195:setName("layout195");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout195);
    obj.edit121:setField("fldValGenerosidade");
    obj.edit121:setType("number");
    obj.edit121:setMin(0);
    obj.edit121:setMax(20);
    obj.edit121:setAlign("left");
    obj.edit121:setWidth(25);
    obj.edit121:setName("edit121");
    lfm_setPropAsString(obj.edit121, "fontStyle",  "bold");
    obj.edit121:setFontColor("white");
    obj.edit121:setFontFamily("Cambria");
    obj.edit121:setFontSize(14);
    obj.edit121:setTransparent(true);
    obj.edit121:setHeight(20);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout195);
    obj.label46:setText("/");
    obj.label46:setWidth(8);
    obj.label46:setName("label46");
    obj.label46:setFontColor("#6f6f6f");
    obj.label46:setFontFamily("Cambria");
    obj.label46:setFontSize(14);
    obj.label46:setAlign("left");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout195);
    obj.edit122:setField("fldValEgoismo");
    obj.edit122:setType("number");
    obj.edit122:setMin(0);
    obj.edit122:setMax(20);
    obj.edit122:setAlign("left");
    obj.edit122:setWidth(25);
    obj.edit122:setName("edit122");
    lfm_setPropAsString(obj.edit122, "fontStyle",  "bold");
    obj.edit122:setFontColor("white");
    obj.edit122:setFontFamily("Cambria");
    obj.edit122:setFontSize(14);
    obj.edit122:setTransparent(true);
    obj.edit122:setHeight(20);

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.rectangle12);
    obj.layout196:setAlign("left");
    obj.layout196:setWidth(422);
    obj.layout196:setName("layout196");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout196);
    obj.imageCheckBox8:setField("fldChEgoismo");
    obj.imageCheckBox8:setWidth(11);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox8:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox8:setMargins({right = 5});
    obj.imageCheckBox8:setHint("Traço Religioso");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.namEgoismo = GUI.fromHandle(_obj_newObject("label"));
    obj.namEgoismo:setParent(obj.layout196);
    obj.namEgoismo:setField("Egoismo");
    obj.namEgoismo:setName("namEgoismo");
    obj.namEgoismo:setAlign("none");
    obj.namEgoismo:setTop(7);
    obj.namEgoismo:setLeft(16);
    obj.namEgoismo:setFontColor("#6f6f6f");
    obj.namEgoismo:setFontFamily("Cambria");
    obj.namEgoismo:setFontSize(14);

    obj.namEgoismoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEgoismoB:setParent(obj.layout196);
    obj.namEgoismoB:setField("EgoismoB");
    obj.namEgoismoB:setName("namEgoismoB");
    obj.namEgoismoB:setAlign("none");
    obj.namEgoismoB:setTop(7);
    obj.namEgoismoB:setLeft(16);
    lfm_setPropAsString(obj.namEgoismoB, "fontStyle",  "bold");
    obj.namEgoismoB:setFontColor("white");
    obj.namEgoismoB:setFontFamily("Cambria");
    obj.namEgoismoB:setFontSize(14);

    obj.dataLink160 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink160:setParent(obj.layout196);
    obj.dataLink160:setFields({'Egoismo', 'EgoismoB'});
    obj.dataLink160:setDefaultValues({'Egoísmo', 'Egoísmo'});
    obj.dataLink160:setName("dataLink160");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout196);
    obj.edit123:setWidth(246);
    obj.edit123:setText("—");
    obj.edit123:setAlign("left");
    obj.edit123:setFontColor("#858585");
    obj.edit123:setMargins({left=120});
    obj.edit123:setName("edit123");
    obj.edit123:setFontFamily("Cambria");
    obj.edit123:setFontSize(14);
    obj.edit123:setHeight(30);
    obj.edit123:setTransparent(true);

    obj.dataLink161 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink161:setParent(obj.layout184);
    obj.dataLink161:setField("fldValGenerosidade");
    obj.dataLink161:setDefaultValue("10");
    obj.dataLink161:setName("dataLink161");

    obj.dataLink162 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink162:setParent(obj.layout184);
    obj.dataLink162:setField("fldValEgoismo");
    obj.dataLink162:setDefaultValue("10");
    obj.dataLink162:setName("dataLink162");

    obj.dataLink163 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink163:setParent(obj.layout184);
    obj.dataLink163:setFields({'fldChGenerosidade', 'fldChEgoismo'});
    obj.dataLink163:setName("dataLink163");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout184);
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setPadding({left=40});

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.rectangle13);
    obj.layout197:setAlign("left");
    obj.layout197:setWidth(139);
    obj.layout197:setName("layout197");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout197);
    obj.imageCheckBox9:setField("fldChHonestidade");
    obj.imageCheckBox9:setWidth(11);
    obj.imageCheckBox9:setAlign("left");
    obj.imageCheckBox9:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox9:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox9:setMargins({right = 5});
    obj.imageCheckBox9:setHint("Traço Religioso");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.namHonestidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namHonestidade:setParent(obj.layout197);
    obj.namHonestidade:setField("Honestidade");
    obj.namHonestidade:setName("namHonestidade");
    obj.namHonestidade:setAlign("none");
    obj.namHonestidade:setTop(7);
    obj.namHonestidade:setLeft(16);
    obj.namHonestidade:setFontColor("#6f6f6f");
    obj.namHonestidade:setFontFamily("Cambria");
    obj.namHonestidade:setFontSize(14);

    obj.namHonestidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namHonestidadeB:setParent(obj.layout197);
    obj.namHonestidadeB:setField("HonestidadeB");
    obj.namHonestidadeB:setName("namHonestidadeB");
    obj.namHonestidadeB:setAlign("none");
    obj.namHonestidadeB:setTop(7);
    obj.namHonestidadeB:setLeft(16);
    lfm_setPropAsString(obj.namHonestidadeB, "fontStyle",  "bold");
    obj.namHonestidadeB:setFontColor("white");
    obj.namHonestidadeB:setFontFamily("Cambria");
    obj.namHonestidadeB:setFontSize(14);

    obj.dataLink164 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink164:setParent(obj.layout197);
    obj.dataLink164:setFields({'Honestidade', 'HonestidadeB'});
    obj.dataLink164:setDefaultValues({'Honestidade', 'Honestidade'});
    obj.dataLink164:setName("dataLink164");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.rectangle13);
    obj.layout198:setAlign("left");
    obj.layout198:setWidth(89);
    obj.layout198:setName("layout198");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout198);
    obj.edit124:setField("fldValHonestidade");
    obj.edit124:setType("number");
    obj.edit124:setMin(0);
    obj.edit124:setMax(20);
    obj.edit124:setAlign("left");
    obj.edit124:setWidth(25);
    obj.edit124:setName("edit124");
    lfm_setPropAsString(obj.edit124, "fontStyle",  "bold");
    obj.edit124:setFontColor("white");
    obj.edit124:setFontFamily("Cambria");
    obj.edit124:setFontSize(14);
    obj.edit124:setTransparent(true);
    obj.edit124:setHeight(20);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout198);
    obj.label47:setText("/");
    obj.label47:setWidth(8);
    obj.label47:setName("label47");
    obj.label47:setFontColor("#6f6f6f");
    obj.label47:setFontFamily("Cambria");
    obj.label47:setFontSize(14);
    obj.label47:setAlign("left");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout198);
    obj.edit125:setField("fldValMalicia");
    obj.edit125:setType("number");
    obj.edit125:setMin(0);
    obj.edit125:setMax(20);
    obj.edit125:setAlign("left");
    obj.edit125:setWidth(25);
    obj.edit125:setName("edit125");
    lfm_setPropAsString(obj.edit125, "fontStyle",  "bold");
    obj.edit125:setFontColor("white");
    obj.edit125:setFontFamily("Cambria");
    obj.edit125:setFontSize(14);
    obj.edit125:setTransparent(true);
    obj.edit125:setHeight(20);

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.rectangle13);
    obj.layout199:setAlign("left");
    obj.layout199:setWidth(422);
    obj.layout199:setName("layout199");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout199);
    obj.imageCheckBox10:setField("fldChMalicia");
    obj.imageCheckBox10:setWidth(11);
    obj.imageCheckBox10:setAlign("left");
    obj.imageCheckBox10:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox10:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox10:setMargins({right = 5});
    obj.imageCheckBox10:setHint("Traço Religioso");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.namMalicia = GUI.fromHandle(_obj_newObject("label"));
    obj.namMalicia:setParent(obj.layout199);
    obj.namMalicia:setField("Malicia");
    obj.namMalicia:setName("namMalicia");
    obj.namMalicia:setAlign("none");
    obj.namMalicia:setTop(7);
    obj.namMalicia:setLeft(16);
    obj.namMalicia:setFontColor("#6f6f6f");
    obj.namMalicia:setFontFamily("Cambria");
    obj.namMalicia:setFontSize(14);

    obj.namMaliciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namMaliciaB:setParent(obj.layout199);
    obj.namMaliciaB:setField("MaliciaB");
    obj.namMaliciaB:setName("namMaliciaB");
    obj.namMaliciaB:setAlign("none");
    obj.namMaliciaB:setTop(7);
    obj.namMaliciaB:setLeft(16);
    lfm_setPropAsString(obj.namMaliciaB, "fontStyle",  "bold");
    obj.namMaliciaB:setFontColor("white");
    obj.namMaliciaB:setFontFamily("Cambria");
    obj.namMaliciaB:setFontSize(14);

    obj.dataLink165 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink165:setParent(obj.layout199);
    obj.dataLink165:setFields({'Malicia', 'MaliciaB'});
    obj.dataLink165:setDefaultValues({'Malícia', 'Malícia'});
    obj.dataLink165:setName("dataLink165");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout199);
    obj.edit126:setWidth(246);
    obj.edit126:setText("—");
    obj.edit126:setAlign("left");
    obj.edit126:setFontColor("#858585");
    obj.edit126:setMargins({left=120});
    obj.edit126:setName("edit126");
    obj.edit126:setFontFamily("Cambria");
    obj.edit126:setFontSize(14);
    obj.edit126:setHeight(30);
    obj.edit126:setTransparent(true);

    obj.dataLink166 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink166:setParent(obj.layout184);
    obj.dataLink166:setField("fldValHonestidade");
    obj.dataLink166:setDefaultValue("10");
    obj.dataLink166:setName("dataLink166");

    obj.dataLink167 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink167:setParent(obj.layout184);
    obj.dataLink167:setField("fldValMalicia");
    obj.dataLink167:setDefaultValue("10");
    obj.dataLink167:setName("dataLink167");

    obj.dataLink168 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink168:setParent(obj.layout184);
    obj.dataLink168:setFields({'fldChHonestidade', 'fldChMalicia'});
    obj.dataLink168:setName("dataLink168");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout184);
    obj.rectangle14:setColor("#2E2E2E");
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setPadding({left=40});

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.rectangle14);
    obj.layout200:setAlign("left");
    obj.layout200:setWidth(139);
    obj.layout200:setName("layout200");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout200);
    obj.imageCheckBox11:setField("fldChJustica");
    obj.imageCheckBox11:setWidth(11);
    obj.imageCheckBox11:setAlign("left");
    obj.imageCheckBox11:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox11:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox11:setMargins({right = 5});
    obj.imageCheckBox11:setHint("Traço Religioso");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.namJustica = GUI.fromHandle(_obj_newObject("label"));
    obj.namJustica:setParent(obj.layout200);
    obj.namJustica:setField("Justica");
    obj.namJustica:setName("namJustica");
    obj.namJustica:setAlign("none");
    obj.namJustica:setTop(7);
    obj.namJustica:setLeft(16);
    obj.namJustica:setFontColor("#6f6f6f");
    obj.namJustica:setFontFamily("Cambria");
    obj.namJustica:setFontSize(14);

    obj.namJusticaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namJusticaB:setParent(obj.layout200);
    obj.namJusticaB:setField("JusticaB");
    obj.namJusticaB:setName("namJusticaB");
    obj.namJusticaB:setAlign("none");
    obj.namJusticaB:setTop(7);
    obj.namJusticaB:setLeft(16);
    lfm_setPropAsString(obj.namJusticaB, "fontStyle",  "bold");
    obj.namJusticaB:setFontColor("white");
    obj.namJusticaB:setFontFamily("Cambria");
    obj.namJusticaB:setFontSize(14);

    obj.dataLink169 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink169:setParent(obj.layout200);
    obj.dataLink169:setFields({'Justica', 'JusticaB'});
    obj.dataLink169:setDefaultValues({'Justiça ♞', 'Justiça ♞'});
    obj.dataLink169:setName("dataLink169");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.rectangle14);
    obj.layout201:setAlign("left");
    obj.layout201:setWidth(89);
    obj.layout201:setName("layout201");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout201);
    obj.edit127:setField("fldValJustica");
    obj.edit127:setType("number");
    obj.edit127:setMin(0);
    obj.edit127:setMax(20);
    obj.edit127:setAlign("left");
    obj.edit127:setWidth(25);
    obj.edit127:setName("edit127");
    lfm_setPropAsString(obj.edit127, "fontStyle",  "bold");
    obj.edit127:setFontColor("white");
    obj.edit127:setFontFamily("Cambria");
    obj.edit127:setFontSize(14);
    obj.edit127:setTransparent(true);
    obj.edit127:setHeight(20);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout201);
    obj.label48:setText("/");
    obj.label48:setWidth(8);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#6f6f6f");
    obj.label48:setFontFamily("Cambria");
    obj.label48:setFontSize(14);
    obj.label48:setAlign("left");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout201);
    obj.edit128:setField("fldValArbitrariedade");
    obj.edit128:setType("number");
    obj.edit128:setMin(0);
    obj.edit128:setMax(20);
    obj.edit128:setAlign("left");
    obj.edit128:setWidth(25);
    obj.edit128:setName("edit128");
    lfm_setPropAsString(obj.edit128, "fontStyle",  "bold");
    obj.edit128:setFontColor("white");
    obj.edit128:setFontFamily("Cambria");
    obj.edit128:setFontSize(14);
    obj.edit128:setTransparent(true);
    obj.edit128:setHeight(20);

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle14);
    obj.layout202:setAlign("left");
    obj.layout202:setWidth(422);
    obj.layout202:setName("layout202");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout202);
    obj.imageCheckBox12:setField("fldChArbitrariedade");
    obj.imageCheckBox12:setWidth(11);
    obj.imageCheckBox12:setAlign("left");
    obj.imageCheckBox12:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox12:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox12:setMargins({right = 5});
    obj.imageCheckBox12:setHint("Traço Religioso");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.namArbitrariedade = GUI.fromHandle(_obj_newObject("label"));
    obj.namArbitrariedade:setParent(obj.layout202);
    obj.namArbitrariedade:setField("Arbitrariedade");
    obj.namArbitrariedade:setName("namArbitrariedade");
    obj.namArbitrariedade:setAlign("none");
    obj.namArbitrariedade:setTop(7);
    obj.namArbitrariedade:setLeft(16);
    obj.namArbitrariedade:setFontColor("#6f6f6f");
    obj.namArbitrariedade:setFontFamily("Cambria");
    obj.namArbitrariedade:setFontSize(14);

    obj.namArbitrariedadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namArbitrariedadeB:setParent(obj.layout202);
    obj.namArbitrariedadeB:setField("ArbitrariedadeB");
    obj.namArbitrariedadeB:setName("namArbitrariedadeB");
    obj.namArbitrariedadeB:setAlign("none");
    obj.namArbitrariedadeB:setTop(7);
    obj.namArbitrariedadeB:setLeft(16);
    lfm_setPropAsString(obj.namArbitrariedadeB, "fontStyle",  "bold");
    obj.namArbitrariedadeB:setFontColor("white");
    obj.namArbitrariedadeB:setFontFamily("Cambria");
    obj.namArbitrariedadeB:setFontSize(14);

    obj.dataLink170 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink170:setParent(obj.layout202);
    obj.dataLink170:setFields({'Arbitrariedade', 'ArbitrariedadeB'});
    obj.dataLink170:setDefaultValues({'Arbitrariedade', 'Arbitrariedade'});
    obj.dataLink170:setName("dataLink170");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout202);
    obj.edit129:setWidth(246);
    obj.edit129:setText("—");
    obj.edit129:setAlign("left");
    obj.edit129:setFontColor("#858585");
    obj.edit129:setMargins({left=120});
    obj.edit129:setName("edit129");
    obj.edit129:setFontFamily("Cambria");
    obj.edit129:setFontSize(14);
    obj.edit129:setHeight(30);
    obj.edit129:setTransparent(true);

    obj.dataLink171 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink171:setParent(obj.layout184);
    obj.dataLink171:setField("fldValJustica");
    obj.dataLink171:setDefaultValue("10");
    obj.dataLink171:setName("dataLink171");

    obj.dataLink172 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink172:setParent(obj.layout184);
    obj.dataLink172:setField("fldValArbitrariedade");
    obj.dataLink172:setDefaultValue("10");
    obj.dataLink172:setName("dataLink172");

    obj.dataLink173 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink173:setParent(obj.layout184);
    obj.dataLink173:setFields({'fldChJustica', 'fldChArbitrariedade'});
    obj.dataLink173:setName("dataLink173");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout184);
    obj.rectangle15:setColor("transparent");
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setPadding({left=40});

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.rectangle15);
    obj.layout203:setAlign("left");
    obj.layout203:setWidth(139);
    obj.layout203:setName("layout203");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout203);
    obj.imageCheckBox13:setField("fldChMisericordia");
    obj.imageCheckBox13:setWidth(11);
    obj.imageCheckBox13:setAlign("left");
    obj.imageCheckBox13:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox13:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox13:setMargins({right = 5});
    obj.imageCheckBox13:setHint("Traço Religioso");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.namMisericordia = GUI.fromHandle(_obj_newObject("label"));
    obj.namMisericordia:setParent(obj.layout203);
    obj.namMisericordia:setField("Misericordia");
    obj.namMisericordia:setName("namMisericordia");
    obj.namMisericordia:setAlign("none");
    obj.namMisericordia:setTop(7);
    obj.namMisericordia:setLeft(16);
    obj.namMisericordia:setFontColor("#6f6f6f");
    obj.namMisericordia:setFontFamily("Cambria");
    obj.namMisericordia:setFontSize(14);

    obj.namMisericordiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namMisericordiaB:setParent(obj.layout203);
    obj.namMisericordiaB:setField("MisericordiaB");
    obj.namMisericordiaB:setName("namMisericordiaB");
    obj.namMisericordiaB:setAlign("none");
    obj.namMisericordiaB:setTop(7);
    obj.namMisericordiaB:setLeft(16);
    lfm_setPropAsString(obj.namMisericordiaB, "fontStyle",  "bold");
    obj.namMisericordiaB:setFontColor("white");
    obj.namMisericordiaB:setFontFamily("Cambria");
    obj.namMisericordiaB:setFontSize(14);

    obj.dataLink174 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink174:setParent(obj.layout203);
    obj.dataLink174:setFields({'Misericordia', 'MisericordiaB'});
    obj.dataLink174:setDefaultValues({'Misericórdia ♞', 'Misericórdia ♞'});
    obj.dataLink174:setName("dataLink174");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.rectangle15);
    obj.layout204:setAlign("left");
    obj.layout204:setWidth(89);
    obj.layout204:setName("layout204");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout204);
    obj.edit130:setField("fldValMisericordia");
    obj.edit130:setType("number");
    obj.edit130:setMin(0);
    obj.edit130:setMax(20);
    obj.edit130:setAlign("left");
    obj.edit130:setWidth(25);
    obj.edit130:setName("edit130");
    lfm_setPropAsString(obj.edit130, "fontStyle",  "bold");
    obj.edit130:setFontColor("white");
    obj.edit130:setFontFamily("Cambria");
    obj.edit130:setFontSize(14);
    obj.edit130:setTransparent(true);
    obj.edit130:setHeight(20);

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout204);
    obj.label49:setText("/");
    obj.label49:setWidth(8);
    obj.label49:setName("label49");
    obj.label49:setFontColor("#6f6f6f");
    obj.label49:setFontFamily("Cambria");
    obj.label49:setFontSize(14);
    obj.label49:setAlign("left");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout204);
    obj.edit131:setField("fldValCrueldade");
    obj.edit131:setType("number");
    obj.edit131:setMin(0);
    obj.edit131:setMax(20);
    obj.edit131:setAlign("left");
    obj.edit131:setWidth(25);
    obj.edit131:setName("edit131");
    lfm_setPropAsString(obj.edit131, "fontStyle",  "bold");
    obj.edit131:setFontColor("white");
    obj.edit131:setFontFamily("Cambria");
    obj.edit131:setFontSize(14);
    obj.edit131:setTransparent(true);
    obj.edit131:setHeight(20);

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.rectangle15);
    obj.layout205:setAlign("left");
    obj.layout205:setWidth(422);
    obj.layout205:setName("layout205");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout205);
    obj.imageCheckBox14:setField("fldChCrueldade");
    obj.imageCheckBox14:setWidth(11);
    obj.imageCheckBox14:setAlign("left");
    obj.imageCheckBox14:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox14:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox14:setMargins({right = 5});
    obj.imageCheckBox14:setHint("Traço Religioso");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.namCrueldade = GUI.fromHandle(_obj_newObject("label"));
    obj.namCrueldade:setParent(obj.layout205);
    obj.namCrueldade:setField("Crueldade");
    obj.namCrueldade:setName("namCrueldade");
    obj.namCrueldade:setAlign("none");
    obj.namCrueldade:setTop(7);
    obj.namCrueldade:setLeft(16);
    obj.namCrueldade:setFontColor("#6f6f6f");
    obj.namCrueldade:setFontFamily("Cambria");
    obj.namCrueldade:setFontSize(14);

    obj.namCrueldadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCrueldadeB:setParent(obj.layout205);
    obj.namCrueldadeB:setField("CrueldadeB");
    obj.namCrueldadeB:setName("namCrueldadeB");
    obj.namCrueldadeB:setAlign("none");
    obj.namCrueldadeB:setTop(7);
    obj.namCrueldadeB:setLeft(16);
    lfm_setPropAsString(obj.namCrueldadeB, "fontStyle",  "bold");
    obj.namCrueldadeB:setFontColor("white");
    obj.namCrueldadeB:setFontFamily("Cambria");
    obj.namCrueldadeB:setFontSize(14);

    obj.dataLink175 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink175:setParent(obj.layout205);
    obj.dataLink175:setFields({'Crueldade', 'CrueldadeB'});
    obj.dataLink175:setDefaultValues({'Crueldade', 'Crueldade'});
    obj.dataLink175:setName("dataLink175");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout205);
    obj.edit132:setWidth(246);
    obj.edit132:setText("—");
    obj.edit132:setAlign("left");
    obj.edit132:setFontColor("#858585");
    obj.edit132:setMargins({left=120});
    obj.edit132:setName("edit132");
    obj.edit132:setFontFamily("Cambria");
    obj.edit132:setFontSize(14);
    obj.edit132:setHeight(30);
    obj.edit132:setTransparent(true);

    obj.dataLink176 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink176:setParent(obj.layout184);
    obj.dataLink176:setField("fldValMisericordia");
    obj.dataLink176:setDefaultValue("10");
    obj.dataLink176:setName("dataLink176");

    obj.dataLink177 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink177:setParent(obj.layout184);
    obj.dataLink177:setField("fldValCrueldade");
    obj.dataLink177:setDefaultValue("10");
    obj.dataLink177:setName("dataLink177");

    obj.dataLink178 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink178:setParent(obj.layout184);
    obj.dataLink178:setFields({'fldChMisericordia', 'fldChCrueldade'});
    obj.dataLink178:setName("dataLink178");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout184);
    obj.rectangle16:setColor("#2E2E2E");
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setPadding({left=40});

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.rectangle16);
    obj.layout206:setAlign("left");
    obj.layout206:setWidth(139);
    obj.layout206:setName("layout206");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout206);
    obj.imageCheckBox15:setField("fldChModestia");
    obj.imageCheckBox15:setWidth(11);
    obj.imageCheckBox15:setAlign("left");
    obj.imageCheckBox15:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox15:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox15:setMargins({right = 5});
    obj.imageCheckBox15:setHint("Traço Religioso");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.namModestia = GUI.fromHandle(_obj_newObject("label"));
    obj.namModestia:setParent(obj.layout206);
    obj.namModestia:setField("Modestia");
    obj.namModestia:setName("namModestia");
    obj.namModestia:setAlign("none");
    obj.namModestia:setTop(7);
    obj.namModestia:setLeft(16);
    obj.namModestia:setFontColor("#6f6f6f");
    obj.namModestia:setFontFamily("Cambria");
    obj.namModestia:setFontSize(14);

    obj.namModestiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namModestiaB:setParent(obj.layout206);
    obj.namModestiaB:setField("ModestiaB");
    obj.namModestiaB:setName("namModestiaB");
    obj.namModestiaB:setAlign("none");
    obj.namModestiaB:setTop(7);
    obj.namModestiaB:setLeft(16);
    lfm_setPropAsString(obj.namModestiaB, "fontStyle",  "bold");
    obj.namModestiaB:setFontColor("white");
    obj.namModestiaB:setFontFamily("Cambria");
    obj.namModestiaB:setFontSize(14);

    obj.dataLink179 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink179:setParent(obj.layout206);
    obj.dataLink179:setFields({'Modestia', 'ModestiaB'});
    obj.dataLink179:setDefaultValues({'Modéstia ♞', 'Modéstia ♞'});
    obj.dataLink179:setName("dataLink179");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.rectangle16);
    obj.layout207:setAlign("left");
    obj.layout207:setWidth(89);
    obj.layout207:setName("layout207");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout207);
    obj.edit133:setField("fldValModestia");
    obj.edit133:setType("number");
    obj.edit133:setMin(0);
    obj.edit133:setMax(20);
    obj.edit133:setAlign("left");
    obj.edit133:setWidth(25);
    obj.edit133:setName("edit133");
    lfm_setPropAsString(obj.edit133, "fontStyle",  "bold");
    obj.edit133:setFontColor("white");
    obj.edit133:setFontFamily("Cambria");
    obj.edit133:setFontSize(14);
    obj.edit133:setTransparent(true);
    obj.edit133:setHeight(20);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout207);
    obj.label50:setText("/");
    obj.label50:setWidth(8);
    obj.label50:setName("label50");
    obj.label50:setFontColor("#6f6f6f");
    obj.label50:setFontFamily("Cambria");
    obj.label50:setFontSize(14);
    obj.label50:setAlign("left");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout207);
    obj.edit134:setField("fldValOrgulho");
    obj.edit134:setType("number");
    obj.edit134:setMin(0);
    obj.edit134:setMax(20);
    obj.edit134:setAlign("left");
    obj.edit134:setWidth(25);
    obj.edit134:setName("edit134");
    lfm_setPropAsString(obj.edit134, "fontStyle",  "bold");
    obj.edit134:setFontColor("white");
    obj.edit134:setFontFamily("Cambria");
    obj.edit134:setFontSize(14);
    obj.edit134:setTransparent(true);
    obj.edit134:setHeight(20);

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle16);
    obj.layout208:setAlign("left");
    obj.layout208:setWidth(422);
    obj.layout208:setName("layout208");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout208);
    obj.imageCheckBox16:setField("fldChOrgulho");
    obj.imageCheckBox16:setWidth(11);
    obj.imageCheckBox16:setAlign("left");
    obj.imageCheckBox16:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox16:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox16:setMargins({right = 5});
    obj.imageCheckBox16:setHint("Traço Religioso");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.namOrgulho = GUI.fromHandle(_obj_newObject("label"));
    obj.namOrgulho:setParent(obj.layout208);
    obj.namOrgulho:setField("Orgulho");
    obj.namOrgulho:setName("namOrgulho");
    obj.namOrgulho:setAlign("none");
    obj.namOrgulho:setTop(7);
    obj.namOrgulho:setLeft(16);
    obj.namOrgulho:setFontColor("#6f6f6f");
    obj.namOrgulho:setFontFamily("Cambria");
    obj.namOrgulho:setFontSize(14);

    obj.namOrgulhoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namOrgulhoB:setParent(obj.layout208);
    obj.namOrgulhoB:setField("OrgulhoB");
    obj.namOrgulhoB:setName("namOrgulhoB");
    obj.namOrgulhoB:setAlign("none");
    obj.namOrgulhoB:setTop(7);
    obj.namOrgulhoB:setLeft(16);
    lfm_setPropAsString(obj.namOrgulhoB, "fontStyle",  "bold");
    obj.namOrgulhoB:setFontColor("white");
    obj.namOrgulhoB:setFontFamily("Cambria");
    obj.namOrgulhoB:setFontSize(14);

    obj.dataLink180 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink180:setParent(obj.layout208);
    obj.dataLink180:setFields({'Orgulho', 'OrgulhoB'});
    obj.dataLink180:setDefaultValues({'Orgulho', 'Orgulho'});
    obj.dataLink180:setName("dataLink180");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout208);
    obj.edit135:setWidth(246);
    obj.edit135:setText("—");
    obj.edit135:setAlign("left");
    obj.edit135:setFontColor("#858585");
    obj.edit135:setMargins({left=120});
    obj.edit135:setName("edit135");
    obj.edit135:setFontFamily("Cambria");
    obj.edit135:setFontSize(14);
    obj.edit135:setHeight(30);
    obj.edit135:setTransparent(true);

    obj.dataLink181 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink181:setParent(obj.layout184);
    obj.dataLink181:setField("fldValModestia");
    obj.dataLink181:setDefaultValue("10");
    obj.dataLink181:setName("dataLink181");

    obj.dataLink182 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink182:setParent(obj.layout184);
    obj.dataLink182:setField("fldValOrgulho");
    obj.dataLink182:setDefaultValue("10");
    obj.dataLink182:setName("dataLink182");

    obj.dataLink183 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink183:setParent(obj.layout184);
    obj.dataLink183:setFields({'fldChModestia', 'fldChOrgulho'});
    obj.dataLink183:setName("dataLink183");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout184);
    obj.rectangle17:setColor("transparent");
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setPadding({left=40});

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.rectangle17);
    obj.layout209:setAlign("left");
    obj.layout209:setWidth(139);
    obj.layout209:setName("layout209");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout209);
    obj.imageCheckBox17:setField("fldChEspiritualidade");
    obj.imageCheckBox17:setWidth(11);
    obj.imageCheckBox17:setAlign("left");
    obj.imageCheckBox17:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox17:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox17:setMargins({right = 5});
    obj.imageCheckBox17:setHint("Traço Religioso");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.namEspiritualidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namEspiritualidade:setParent(obj.layout209);
    obj.namEspiritualidade:setField("Espiritualidade");
    obj.namEspiritualidade:setName("namEspiritualidade");
    obj.namEspiritualidade:setAlign("none");
    obj.namEspiritualidade:setTop(7);
    obj.namEspiritualidade:setLeft(16);
    obj.namEspiritualidade:setFontColor("#6f6f6f");
    obj.namEspiritualidade:setFontFamily("Cambria");
    obj.namEspiritualidade:setFontSize(14);

    obj.namEspiritualidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEspiritualidadeB:setParent(obj.layout209);
    obj.namEspiritualidadeB:setField("EspiritualidadeB");
    obj.namEspiritualidadeB:setName("namEspiritualidadeB");
    obj.namEspiritualidadeB:setAlign("none");
    obj.namEspiritualidadeB:setTop(7);
    obj.namEspiritualidadeB:setLeft(16);
    lfm_setPropAsString(obj.namEspiritualidadeB, "fontStyle",  "bold");
    obj.namEspiritualidadeB:setFontColor("white");
    obj.namEspiritualidadeB:setFontFamily("Cambria");
    obj.namEspiritualidadeB:setFontSize(14);

    obj.dataLink184 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink184:setParent(obj.layout209);
    obj.dataLink184:setFields({'Espiritualidade', 'EspiritualidadeB'});
    obj.dataLink184:setDefaultValues({'Espiritualidade', 'Espiritualidade'});
    obj.dataLink184:setName("dataLink184");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle17);
    obj.layout210:setAlign("left");
    obj.layout210:setWidth(89);
    obj.layout210:setName("layout210");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout210);
    obj.edit136:setField("fldValEspiritualidade");
    obj.edit136:setType("number");
    obj.edit136:setMin(0);
    obj.edit136:setMax(20);
    obj.edit136:setAlign("left");
    obj.edit136:setWidth(25);
    obj.edit136:setName("edit136");
    lfm_setPropAsString(obj.edit136, "fontStyle",  "bold");
    obj.edit136:setFontColor("white");
    obj.edit136:setFontFamily("Cambria");
    obj.edit136:setFontSize(14);
    obj.edit136:setTransparent(true);
    obj.edit136:setHeight(20);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout210);
    obj.label51:setText("/");
    obj.label51:setWidth(8);
    obj.label51:setName("label51");
    obj.label51:setFontColor("#6f6f6f");
    obj.label51:setFontFamily("Cambria");
    obj.label51:setFontSize(14);
    obj.label51:setAlign("left");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout210);
    obj.edit137:setField("fldValCinismo");
    obj.edit137:setType("number");
    obj.edit137:setMin(0);
    obj.edit137:setMax(20);
    obj.edit137:setAlign("left");
    obj.edit137:setWidth(25);
    obj.edit137:setName("edit137");
    lfm_setPropAsString(obj.edit137, "fontStyle",  "bold");
    obj.edit137:setFontColor("white");
    obj.edit137:setFontFamily("Cambria");
    obj.edit137:setFontSize(14);
    obj.edit137:setTransparent(true);
    obj.edit137:setHeight(20);

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.rectangle17);
    obj.layout211:setAlign("left");
    obj.layout211:setWidth(422);
    obj.layout211:setName("layout211");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout211);
    obj.imageCheckBox18:setField("fldChCinismo");
    obj.imageCheckBox18:setWidth(11);
    obj.imageCheckBox18:setAlign("left");
    obj.imageCheckBox18:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox18:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox18:setMargins({right = 5});
    obj.imageCheckBox18:setHint("Traço Religioso");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.namCinismo = GUI.fromHandle(_obj_newObject("label"));
    obj.namCinismo:setParent(obj.layout211);
    obj.namCinismo:setField("Cinismo");
    obj.namCinismo:setName("namCinismo");
    obj.namCinismo:setAlign("none");
    obj.namCinismo:setTop(7);
    obj.namCinismo:setLeft(16);
    obj.namCinismo:setFontColor("#6f6f6f");
    obj.namCinismo:setFontFamily("Cambria");
    obj.namCinismo:setFontSize(14);

    obj.namCinismoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCinismoB:setParent(obj.layout211);
    obj.namCinismoB:setField("CinismoB");
    obj.namCinismoB:setName("namCinismoB");
    obj.namCinismoB:setAlign("none");
    obj.namCinismoB:setTop(7);
    obj.namCinismoB:setLeft(16);
    lfm_setPropAsString(obj.namCinismoB, "fontStyle",  "bold");
    obj.namCinismoB:setFontColor("white");
    obj.namCinismoB:setFontFamily("Cambria");
    obj.namCinismoB:setFontSize(14);

    obj.dataLink185 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink185:setParent(obj.layout211);
    obj.dataLink185:setFields({'Cinismo', 'CinismoB'});
    obj.dataLink185:setDefaultValues({'Cinismo', 'Cinismo'});
    obj.dataLink185:setName("dataLink185");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout211);
    obj.edit138:setWidth(246);
    obj.edit138:setText("—");
    obj.edit138:setAlign("left");
    obj.edit138:setFontColor("#858585");
    obj.edit138:setMargins({left=120});
    obj.edit138:setName("edit138");
    obj.edit138:setFontFamily("Cambria");
    obj.edit138:setFontSize(14);
    obj.edit138:setHeight(30);
    obj.edit138:setTransparent(true);

    obj.dataLink186 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink186:setParent(obj.layout184);
    obj.dataLink186:setField("fldValEspiritualidade");
    obj.dataLink186:setDefaultValue("10");
    obj.dataLink186:setName("dataLink186");

    obj.dataLink187 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink187:setParent(obj.layout184);
    obj.dataLink187:setField("fldValCinismo");
    obj.dataLink187:setDefaultValue("10");
    obj.dataLink187:setName("dataLink187");

    obj.dataLink188 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink188:setParent(obj.layout184);
    obj.dataLink188:setFields({'fldChEspiritualidade', 'fldChCinismo'});
    obj.dataLink188:setName("dataLink188");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout184);
    obj.rectangle18:setColor("#2E2E2E");
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setPadding({left=40});

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle18);
    obj.layout212:setAlign("left");
    obj.layout212:setWidth(139);
    obj.layout212:setName("layout212");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout212);
    obj.imageCheckBox19:setField("fldChPrudencia");
    obj.imageCheckBox19:setWidth(11);
    obj.imageCheckBox19:setAlign("left");
    obj.imageCheckBox19:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox19:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox19:setMargins({right = 5});
    obj.imageCheckBox19:setHint("Traço Religioso");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.namPrudencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namPrudencia:setParent(obj.layout212);
    obj.namPrudencia:setField("Prudencia");
    obj.namPrudencia:setName("namPrudencia");
    obj.namPrudencia:setAlign("none");
    obj.namPrudencia:setTop(7);
    obj.namPrudencia:setLeft(16);
    obj.namPrudencia:setFontColor("#6f6f6f");
    obj.namPrudencia:setFontFamily("Cambria");
    obj.namPrudencia:setFontSize(14);

    obj.namPrudenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPrudenciaB:setParent(obj.layout212);
    obj.namPrudenciaB:setField("PrudenciaB");
    obj.namPrudenciaB:setName("namPrudenciaB");
    obj.namPrudenciaB:setAlign("none");
    obj.namPrudenciaB:setTop(7);
    obj.namPrudenciaB:setLeft(16);
    lfm_setPropAsString(obj.namPrudenciaB, "fontStyle",  "bold");
    obj.namPrudenciaB:setFontColor("white");
    obj.namPrudenciaB:setFontFamily("Cambria");
    obj.namPrudenciaB:setFontSize(14);

    obj.dataLink189 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink189:setParent(obj.layout212);
    obj.dataLink189:setFields({'Prudencia', 'PrudenciaB'});
    obj.dataLink189:setDefaultValues({'Prudência', 'Prudência'});
    obj.dataLink189:setName("dataLink189");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.rectangle18);
    obj.layout213:setAlign("left");
    obj.layout213:setWidth(89);
    obj.layout213:setName("layout213");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout213);
    obj.edit139:setField("fldValPrudencia");
    obj.edit139:setType("number");
    obj.edit139:setMin(0);
    obj.edit139:setMax(20);
    obj.edit139:setAlign("left");
    obj.edit139:setWidth(25);
    obj.edit139:setName("edit139");
    lfm_setPropAsString(obj.edit139, "fontStyle",  "bold");
    obj.edit139:setFontColor("white");
    obj.edit139:setFontFamily("Cambria");
    obj.edit139:setFontSize(14);
    obj.edit139:setTransparent(true);
    obj.edit139:setHeight(20);

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout213);
    obj.label52:setText("/");
    obj.label52:setWidth(8);
    obj.label52:setName("label52");
    obj.label52:setFontColor("#6f6f6f");
    obj.label52:setFontFamily("Cambria");
    obj.label52:setFontSize(14);
    obj.label52:setAlign("left");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout213);
    obj.edit140:setField("fldValImprudencia");
    obj.edit140:setType("number");
    obj.edit140:setMin(0);
    obj.edit140:setMax(20);
    obj.edit140:setAlign("left");
    obj.edit140:setWidth(25);
    obj.edit140:setName("edit140");
    lfm_setPropAsString(obj.edit140, "fontStyle",  "bold");
    obj.edit140:setFontColor("white");
    obj.edit140:setFontFamily("Cambria");
    obj.edit140:setFontSize(14);
    obj.edit140:setTransparent(true);
    obj.edit140:setHeight(20);

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle18);
    obj.layout214:setAlign("left");
    obj.layout214:setWidth(422);
    obj.layout214:setName("layout214");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout214);
    obj.imageCheckBox20:setField("fldChImprudencia");
    obj.imageCheckBox20:setWidth(11);
    obj.imageCheckBox20:setAlign("left");
    obj.imageCheckBox20:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox20:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox20:setMargins({right = 5});
    obj.imageCheckBox20:setHint("Traço Religioso");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.namImprudencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namImprudencia:setParent(obj.layout214);
    obj.namImprudencia:setField("Imprudencia");
    obj.namImprudencia:setName("namImprudencia");
    obj.namImprudencia:setAlign("none");
    obj.namImprudencia:setTop(7);
    obj.namImprudencia:setLeft(16);
    obj.namImprudencia:setFontColor("#6f6f6f");
    obj.namImprudencia:setFontFamily("Cambria");
    obj.namImprudencia:setFontSize(14);

    obj.namImprudenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namImprudenciaB:setParent(obj.layout214);
    obj.namImprudenciaB:setField("ImprudenciaB");
    obj.namImprudenciaB:setName("namImprudenciaB");
    obj.namImprudenciaB:setAlign("none");
    obj.namImprudenciaB:setTop(7);
    obj.namImprudenciaB:setLeft(16);
    lfm_setPropAsString(obj.namImprudenciaB, "fontStyle",  "bold");
    obj.namImprudenciaB:setFontColor("white");
    obj.namImprudenciaB:setFontFamily("Cambria");
    obj.namImprudenciaB:setFontSize(14);

    obj.dataLink190 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink190:setParent(obj.layout214);
    obj.dataLink190:setFields({'Imprudencia', 'ImprudenciaB'});
    obj.dataLink190:setDefaultValues({'Imprudência', 'Imprudência'});
    obj.dataLink190:setName("dataLink190");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout214);
    obj.edit141:setWidth(246);
    obj.edit141:setText("—");
    obj.edit141:setAlign("left");
    obj.edit141:setFontColor("#858585");
    obj.edit141:setMargins({left=120});
    obj.edit141:setName("edit141");
    obj.edit141:setFontFamily("Cambria");
    obj.edit141:setFontSize(14);
    obj.edit141:setHeight(30);
    obj.edit141:setTransparent(true);

    obj.dataLink191 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink191:setParent(obj.layout184);
    obj.dataLink191:setField("fldValPrudencia");
    obj.dataLink191:setDefaultValue("10");
    obj.dataLink191:setName("dataLink191");

    obj.dataLink192 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink192:setParent(obj.layout184);
    obj.dataLink192:setField("fldValImprudencia");
    obj.dataLink192:setDefaultValue("10");
    obj.dataLink192:setName("dataLink192");

    obj.dataLink193 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink193:setParent(obj.layout184);
    obj.dataLink193:setFields({'fldChPrudencia', 'fldChImprudencia'});
    obj.dataLink193:setName("dataLink193");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout184);
    obj.rectangle19:setColor("transparent");
    obj.rectangle19:setName("rectangle19");
    obj.rectangle19:setAlign("top");
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setPadding({left=40});

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.rectangle19);
    obj.layout215:setAlign("left");
    obj.layout215:setWidth(139);
    obj.layout215:setName("layout215");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout215);
    obj.imageCheckBox21:setField("fldChTemperanca");
    obj.imageCheckBox21:setWidth(11);
    obj.imageCheckBox21:setAlign("left");
    obj.imageCheckBox21:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox21:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox21:setMargins({right = 5});
    obj.imageCheckBox21:setHint("Traço Religioso");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.namTemperanca = GUI.fromHandle(_obj_newObject("label"));
    obj.namTemperanca:setParent(obj.layout215);
    obj.namTemperanca:setField("Temperanca");
    obj.namTemperanca:setName("namTemperanca");
    obj.namTemperanca:setAlign("none");
    obj.namTemperanca:setTop(7);
    obj.namTemperanca:setLeft(16);
    obj.namTemperanca:setFontColor("#6f6f6f");
    obj.namTemperanca:setFontFamily("Cambria");
    obj.namTemperanca:setFontSize(14);

    obj.namTemperancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namTemperancaB:setParent(obj.layout215);
    obj.namTemperancaB:setField("TemperancaB");
    obj.namTemperancaB:setName("namTemperancaB");
    obj.namTemperancaB:setAlign("none");
    obj.namTemperancaB:setTop(7);
    obj.namTemperancaB:setLeft(16);
    lfm_setPropAsString(obj.namTemperancaB, "fontStyle",  "bold");
    obj.namTemperancaB:setFontColor("white");
    obj.namTemperancaB:setFontFamily("Cambria");
    obj.namTemperancaB:setFontSize(14);

    obj.dataLink194 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink194:setParent(obj.layout215);
    obj.dataLink194:setFields({'Temperanca', 'TemperancaB'});
    obj.dataLink194:setDefaultValues({'Temperança', 'Temperança'});
    obj.dataLink194:setName("dataLink194");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle19);
    obj.layout216:setAlign("left");
    obj.layout216:setWidth(89);
    obj.layout216:setName("layout216");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout216);
    obj.edit142:setField("fldValTemperanca");
    obj.edit142:setType("number");
    obj.edit142:setMin(0);
    obj.edit142:setMax(20);
    obj.edit142:setAlign("left");
    obj.edit142:setWidth(25);
    obj.edit142:setName("edit142");
    lfm_setPropAsString(obj.edit142, "fontStyle",  "bold");
    obj.edit142:setFontColor("white");
    obj.edit142:setFontFamily("Cambria");
    obj.edit142:setFontSize(14);
    obj.edit142:setTransparent(true);
    obj.edit142:setHeight(20);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout216);
    obj.label53:setText("/");
    obj.label53:setWidth(8);
    obj.label53:setName("label53");
    obj.label53:setFontColor("#6f6f6f");
    obj.label53:setFontFamily("Cambria");
    obj.label53:setFontSize(14);
    obj.label53:setAlign("left");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout216);
    obj.edit143:setField("fldValIndulgencia");
    obj.edit143:setType("number");
    obj.edit143:setMin(0);
    obj.edit143:setMax(20);
    obj.edit143:setAlign("left");
    obj.edit143:setWidth(25);
    obj.edit143:setName("edit143");
    lfm_setPropAsString(obj.edit143, "fontStyle",  "bold");
    obj.edit143:setFontColor("white");
    obj.edit143:setFontFamily("Cambria");
    obj.edit143:setFontSize(14);
    obj.edit143:setTransparent(true);
    obj.edit143:setHeight(20);

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.rectangle19);
    obj.layout217:setAlign("left");
    obj.layout217:setWidth(422);
    obj.layout217:setName("layout217");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout217);
    obj.imageCheckBox22:setField("fldChIndulgencia");
    obj.imageCheckBox22:setWidth(11);
    obj.imageCheckBox22:setAlign("left");
    obj.imageCheckBox22:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox22:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox22:setMargins({right = 5});
    obj.imageCheckBox22:setHint("Traço Religioso");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.namIndulgencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namIndulgencia:setParent(obj.layout217);
    obj.namIndulgencia:setField("Indulgencia");
    obj.namIndulgencia:setName("namIndulgencia");
    obj.namIndulgencia:setAlign("none");
    obj.namIndulgencia:setTop(7);
    obj.namIndulgencia:setLeft(16);
    obj.namIndulgencia:setFontColor("#6f6f6f");
    obj.namIndulgencia:setFontFamily("Cambria");
    obj.namIndulgencia:setFontSize(14);

    obj.namIndulgenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namIndulgenciaB:setParent(obj.layout217);
    obj.namIndulgenciaB:setField("IndulgenciaB");
    obj.namIndulgenciaB:setName("namIndulgenciaB");
    obj.namIndulgenciaB:setAlign("none");
    obj.namIndulgenciaB:setTop(7);
    obj.namIndulgenciaB:setLeft(16);
    lfm_setPropAsString(obj.namIndulgenciaB, "fontStyle",  "bold");
    obj.namIndulgenciaB:setFontColor("white");
    obj.namIndulgenciaB:setFontFamily("Cambria");
    obj.namIndulgenciaB:setFontSize(14);

    obj.dataLink195 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink195:setParent(obj.layout217);
    obj.dataLink195:setFields({'Indulgencia', 'IndulgenciaB'});
    obj.dataLink195:setDefaultValues({'Indulgência', 'Indulgência'});
    obj.dataLink195:setName("dataLink195");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout217);
    obj.edit144:setWidth(246);
    obj.edit144:setText("—");
    obj.edit144:setAlign("left");
    obj.edit144:setFontColor("#858585");
    obj.edit144:setMargins({left=120});
    obj.edit144:setName("edit144");
    obj.edit144:setFontFamily("Cambria");
    obj.edit144:setFontSize(14);
    obj.edit144:setHeight(30);
    obj.edit144:setTransparent(true);

    obj.dataLink196 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink196:setParent(obj.layout184);
    obj.dataLink196:setField("fldValTemperanca");
    obj.dataLink196:setDefaultValue("10");
    obj.dataLink196:setName("dataLink196");

    obj.dataLink197 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink197:setParent(obj.layout184);
    obj.dataLink197:setField("fldValIndulgencia");
    obj.dataLink197:setDefaultValue("10");
    obj.dataLink197:setName("dataLink197");

    obj.dataLink198 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink198:setParent(obj.layout184);
    obj.dataLink198:setFields({'fldChTemperanca', 'fldChIndulgencia'});
    obj.dataLink198:setName("dataLink198");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout184);
    obj.rectangle20:setColor("#2E2E2E");
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setAlign("top");
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setPadding({left=40});

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle20);
    obj.layout218:setAlign("left");
    obj.layout218:setWidth(139);
    obj.layout218:setName("layout218");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout218);
    obj.imageCheckBox23:setField("fldChConfianca");
    obj.imageCheckBox23:setWidth(11);
    obj.imageCheckBox23:setAlign("left");
    obj.imageCheckBox23:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox23:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox23:setMargins({right = 5});
    obj.imageCheckBox23:setHint("Traço Religioso");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.namConfianca = GUI.fromHandle(_obj_newObject("label"));
    obj.namConfianca:setParent(obj.layout218);
    obj.namConfianca:setField("Confianca");
    obj.namConfianca:setName("namConfianca");
    obj.namConfianca:setAlign("none");
    obj.namConfianca:setTop(7);
    obj.namConfianca:setLeft(16);
    obj.namConfianca:setFontColor("#6f6f6f");
    obj.namConfianca:setFontFamily("Cambria");
    obj.namConfianca:setFontSize(14);

    obj.namConfiancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namConfiancaB:setParent(obj.layout218);
    obj.namConfiancaB:setField("ConfiancaB");
    obj.namConfiancaB:setName("namConfiancaB");
    obj.namConfiancaB:setAlign("none");
    obj.namConfiancaB:setTop(7);
    obj.namConfiancaB:setLeft(16);
    lfm_setPropAsString(obj.namConfiancaB, "fontStyle",  "bold");
    obj.namConfiancaB:setFontColor("white");
    obj.namConfiancaB:setFontFamily("Cambria");
    obj.namConfiancaB:setFontSize(14);

    obj.dataLink199 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink199:setParent(obj.layout218);
    obj.dataLink199:setFields({'Confianca', 'ConfiancaB'});
    obj.dataLink199:setDefaultValues({'Confiança', 'Confiança'});
    obj.dataLink199:setName("dataLink199");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.rectangle20);
    obj.layout219:setAlign("left");
    obj.layout219:setWidth(89);
    obj.layout219:setName("layout219");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout219);
    obj.edit145:setField("fldValConfianca");
    obj.edit145:setType("number");
    obj.edit145:setMin(0);
    obj.edit145:setMax(20);
    obj.edit145:setAlign("left");
    obj.edit145:setWidth(25);
    obj.edit145:setName("edit145");
    lfm_setPropAsString(obj.edit145, "fontStyle",  "bold");
    obj.edit145:setFontColor("white");
    obj.edit145:setFontFamily("Cambria");
    obj.edit145:setFontSize(14);
    obj.edit145:setTransparent(true);
    obj.edit145:setHeight(20);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout219);
    obj.label54:setText("/");
    obj.label54:setWidth(8);
    obj.label54:setName("label54");
    obj.label54:setFontColor("#6f6f6f");
    obj.label54:setFontFamily("Cambria");
    obj.label54:setFontSize(14);
    obj.label54:setAlign("left");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout219);
    obj.edit146:setField("fldValDesconfianca");
    obj.edit146:setType("number");
    obj.edit146:setMin(0);
    obj.edit146:setMax(20);
    obj.edit146:setAlign("left");
    obj.edit146:setWidth(25);
    obj.edit146:setName("edit146");
    lfm_setPropAsString(obj.edit146, "fontStyle",  "bold");
    obj.edit146:setFontColor("white");
    obj.edit146:setFontFamily("Cambria");
    obj.edit146:setFontSize(14);
    obj.edit146:setTransparent(true);
    obj.edit146:setHeight(20);

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle20);
    obj.layout220:setAlign("left");
    obj.layout220:setWidth(422);
    obj.layout220:setName("layout220");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout220);
    obj.imageCheckBox24:setField("fldChDesconfianca");
    obj.imageCheckBox24:setWidth(11);
    obj.imageCheckBox24:setAlign("left");
    obj.imageCheckBox24:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox24:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox24:setMargins({right = 5});
    obj.imageCheckBox24:setHint("Traço Religioso");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.namDesconfianca = GUI.fromHandle(_obj_newObject("label"));
    obj.namDesconfianca:setParent(obj.layout220);
    obj.namDesconfianca:setField("Desconfianca");
    obj.namDesconfianca:setName("namDesconfianca");
    obj.namDesconfianca:setAlign("none");
    obj.namDesconfianca:setTop(7);
    obj.namDesconfianca:setLeft(16);
    obj.namDesconfianca:setFontColor("#6f6f6f");
    obj.namDesconfianca:setFontFamily("Cambria");
    obj.namDesconfianca:setFontSize(14);

    obj.namDesconfiancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namDesconfiancaB:setParent(obj.layout220);
    obj.namDesconfiancaB:setField("DesconfiancaB");
    obj.namDesconfiancaB:setName("namDesconfiancaB");
    obj.namDesconfiancaB:setAlign("none");
    obj.namDesconfiancaB:setTop(7);
    obj.namDesconfiancaB:setLeft(16);
    lfm_setPropAsString(obj.namDesconfiancaB, "fontStyle",  "bold");
    obj.namDesconfiancaB:setFontColor("white");
    obj.namDesconfiancaB:setFontFamily("Cambria");
    obj.namDesconfiancaB:setFontSize(14);

    obj.dataLink200 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink200:setParent(obj.layout220);
    obj.dataLink200:setFields({'Desconfianca', 'DesconfiancaB'});
    obj.dataLink200:setDefaultValues({'Desconfiança', 'Desconfiança'});
    obj.dataLink200:setName("dataLink200");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout220);
    obj.edit147:setWidth(246);
    obj.edit147:setText("—");
    obj.edit147:setAlign("left");
    obj.edit147:setFontColor("#858585");
    obj.edit147:setMargins({left=120});
    obj.edit147:setName("edit147");
    obj.edit147:setFontFamily("Cambria");
    obj.edit147:setFontSize(14);
    obj.edit147:setHeight(30);
    obj.edit147:setTransparent(true);

    obj.dataLink201 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink201:setParent(obj.layout184);
    obj.dataLink201:setField("fldValConfianca");
    obj.dataLink201:setDefaultValue("10");
    obj.dataLink201:setName("dataLink201");

    obj.dataLink202 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink202:setParent(obj.layout184);
    obj.dataLink202:setField("fldValDesconfianca");
    obj.dataLink202:setDefaultValue("10");
    obj.dataLink202:setName("dataLink202");

    obj.dataLink203 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink203:setParent(obj.layout184);
    obj.dataLink203:setFields({'fldChConfianca', 'fldChDesconfianca'});
    obj.dataLink203:setName("dataLink203");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout184);
    obj.rectangle21:setColor("transparent");
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setAlign("top");
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setPadding({left=40});

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.rectangle21);
    obj.layout221:setAlign("left");
    obj.layout221:setWidth(139);
    obj.layout221:setName("layout221");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout221);
    obj.imageCheckBox25:setField("fldChCoragem");
    obj.imageCheckBox25:setWidth(11);
    obj.imageCheckBox25:setAlign("left");
    obj.imageCheckBox25:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox25:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox25:setMargins({right = 5});
    obj.imageCheckBox25:setHint("Traço Religioso");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.namCoragem = GUI.fromHandle(_obj_newObject("label"));
    obj.namCoragem:setParent(obj.layout221);
    obj.namCoragem:setField("Coragem");
    obj.namCoragem:setName("namCoragem");
    obj.namCoragem:setAlign("none");
    obj.namCoragem:setTop(7);
    obj.namCoragem:setLeft(16);
    obj.namCoragem:setFontColor("#6f6f6f");
    obj.namCoragem:setFontFamily("Cambria");
    obj.namCoragem:setFontSize(14);

    obj.namCoragemB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCoragemB:setParent(obj.layout221);
    obj.namCoragemB:setField("CoragemB");
    obj.namCoragemB:setName("namCoragemB");
    obj.namCoragemB:setAlign("none");
    obj.namCoragemB:setTop(7);
    obj.namCoragemB:setLeft(16);
    lfm_setPropAsString(obj.namCoragemB, "fontStyle",  "bold");
    obj.namCoragemB:setFontColor("white");
    obj.namCoragemB:setFontFamily("Cambria");
    obj.namCoragemB:setFontSize(14);

    obj.dataLink204 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink204:setParent(obj.layout221);
    obj.dataLink204:setFields({'Coragem', 'CoragemB'});
    obj.dataLink204:setDefaultValues({'Coragem ♞', 'Coragem ♞'});
    obj.dataLink204:setName("dataLink204");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.rectangle21);
    obj.layout222:setAlign("left");
    obj.layout222:setWidth(89);
    obj.layout222:setName("layout222");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout222);
    obj.edit148:setField("fldValCoragem");
    obj.edit148:setType("number");
    obj.edit148:setMin(0);
    obj.edit148:setMax(20);
    obj.edit148:setAlign("left");
    obj.edit148:setWidth(25);
    obj.edit148:setName("edit148");
    lfm_setPropAsString(obj.edit148, "fontStyle",  "bold");
    obj.edit148:setFontColor("white");
    obj.edit148:setFontFamily("Cambria");
    obj.edit148:setFontSize(14);
    obj.edit148:setTransparent(true);
    obj.edit148:setHeight(20);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout222);
    obj.label55:setText("/");
    obj.label55:setWidth(8);
    obj.label55:setName("label55");
    obj.label55:setFontColor("#6f6f6f");
    obj.label55:setFontFamily("Cambria");
    obj.label55:setFontSize(14);
    obj.label55:setAlign("left");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout222);
    obj.edit149:setField("fldValCovardia");
    obj.edit149:setType("number");
    obj.edit149:setMin(0);
    obj.edit149:setMax(20);
    obj.edit149:setAlign("left");
    obj.edit149:setWidth(25);
    obj.edit149:setName("edit149");
    lfm_setPropAsString(obj.edit149, "fontStyle",  "bold");
    obj.edit149:setFontColor("white");
    obj.edit149:setFontFamily("Cambria");
    obj.edit149:setFontSize(14);
    obj.edit149:setTransparent(true);
    obj.edit149:setHeight(20);

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.rectangle21);
    obj.layout223:setAlign("left");
    obj.layout223:setWidth(422);
    obj.layout223:setName("layout223");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout223);
    obj.imageCheckBox26:setField("fldChCovardia");
    obj.imageCheckBox26:setWidth(11);
    obj.imageCheckBox26:setAlign("left");
    obj.imageCheckBox26:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox26:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox26:setMargins({right = 5});
    obj.imageCheckBox26:setHint("Traço Religioso");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.namCovardia = GUI.fromHandle(_obj_newObject("label"));
    obj.namCovardia:setParent(obj.layout223);
    obj.namCovardia:setField("Covardia");
    obj.namCovardia:setName("namCovardia");
    obj.namCovardia:setAlign("none");
    obj.namCovardia:setTop(7);
    obj.namCovardia:setLeft(16);
    obj.namCovardia:setFontColor("#6f6f6f");
    obj.namCovardia:setFontFamily("Cambria");
    obj.namCovardia:setFontSize(14);

    obj.namCovardiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCovardiaB:setParent(obj.layout223);
    obj.namCovardiaB:setField("CovardiaB");
    obj.namCovardiaB:setName("namCovardiaB");
    obj.namCovardiaB:setAlign("none");
    obj.namCovardiaB:setTop(7);
    obj.namCovardiaB:setLeft(16);
    lfm_setPropAsString(obj.namCovardiaB, "fontStyle",  "bold");
    obj.namCovardiaB:setFontColor("white");
    obj.namCovardiaB:setFontFamily("Cambria");
    obj.namCovardiaB:setFontSize(14);

    obj.dataLink205 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink205:setParent(obj.layout223);
    obj.dataLink205:setFields({'Covardia', 'CovardiaB'});
    obj.dataLink205:setDefaultValues({'Covardia', 'Covardia'});
    obj.dataLink205:setName("dataLink205");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout223);
    obj.edit150:setWidth(246);
    obj.edit150:setText("—");
    obj.edit150:setAlign("left");
    obj.edit150:setFontColor("#858585");
    obj.edit150:setMargins({left=120});
    obj.edit150:setName("edit150");
    obj.edit150:setFontFamily("Cambria");
    obj.edit150:setFontSize(14);
    obj.edit150:setHeight(30);
    obj.edit150:setTransparent(true);

    obj.dataLink206 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink206:setParent(obj.layout184);
    obj.dataLink206:setField("fldValCoragem");
    obj.dataLink206:setDefaultValue("10");
    obj.dataLink206:setName("dataLink206");

    obj.dataLink207 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink207:setParent(obj.layout184);
    obj.dataLink207:setField("fldValCovardia");
    obj.dataLink207:setDefaultValue("10");
    obj.dataLink207:setName("dataLink207");

    obj.dataLink208 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink208:setParent(obj.layout184);
    obj.dataLink208:setFields({'fldChCoragem', 'fldChCovardia'});
    obj.dataLink208:setName("dataLink208");

    obj.layout224 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.rectangle6);
    obj.layout224:setAlign("top");
    obj.layout224:setMargins({left = 40, top = 455});
    obj.layout224:setHeight(90);
    obj.layout224:setName("layout224");

    obj.layout225 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.layout224);
    obj.layout225:setName("layout225");
    obj.layout225:setAlign("top");
    obj.layout225:setHeight(30);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout225);
    obj.label56:setText("Bônus Honrado:");
    obj.label56:setWidth(139);
    obj.label56:setHitTest(true);
    obj.label56:setHint("+3 de Armadura");
    obj.label56:setName("label56");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setFontColor("white");
    obj.label56:setFontFamily("Cambria");
    obj.label56:setFontSize(14);
    obj.label56:setAlign("left");

    obj.layout226 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.layout225);
    obj.layout226:setAlign("left");
    obj.layout226:setWidth(89);
    obj.layout226:setName("layout226");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout226);
    obj.label57:setField("fldSomaHonra");
    obj.label57:setAlign("left");
    obj.label57:setWidth(25);
    obj.label57:setName("label57");
    obj.label57:setFontColor("#6f6f6f");
    obj.label57:setFontFamily("Cambria");
    obj.label57:setFontSize(14);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout226);
    obj.label58:setText("/");
    obj.label58:setWidth(10);
    obj.label58:setName("label58");
    obj.label58:setFontColor("#6f6f6f");
    obj.label58:setFontFamily("Cambria");
    obj.label58:setFontSize(14);
    obj.label58:setAlign("left");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout226);
    obj.label59:setText("80");
    obj.label59:setAlign("left");
    obj.label59:setWidth(25);
    obj.label59:setName("label59");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setFontColor("white");
    obj.label59:setFontFamily("Cambria");
    obj.label59:setFontSize(14);

    obj.flagHonra = GUI.fromHandle(_obj_newObject("label"));
    obj.flagHonra:setParent(obj.layout225);
    obj.flagHonra:setTop(7);
    obj.flagHonra:setLeft(228);
    obj.flagHonra:setWidth(180);
    obj.flagHonra:setName("flagHonra");
    obj.flagHonra:setText("+100 GLÓRIA AO ANO");
    lfm_setPropAsString(obj.flagHonra, "fontStyle",  "bold");
    obj.flagHonra:setFontColor("#cdcdcd");
    obj.flagHonra:setFontFamily("Palatino Linotype");
    obj.flagHonra:setFontSize(14);
    obj.flagHonra:setVisible(false);

    obj.layout227 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.layout224);
    obj.layout227:setName("layout227");
    obj.layout227:setAlign("top");
    obj.layout227:setHeight(30);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout227);
    obj.label60:setText("Bônus Religioso:");
    obj.label60:setWidth(139);
    obj.label60:setHitTest(true);
    obj.label60:setHint("1 rerolagem por Aventura");
    obj.label60:setName("label60");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setFontColor("white");
    obj.label60:setFontFamily("Cambria");
    obj.label60:setFontSize(14);
    obj.label60:setAlign("left");

    obj.layout228 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.layout227);
    obj.layout228:setAlign("left");
    obj.layout228:setWidth(89);
    obj.layout228:setName("layout228");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout228);
    obj.label61:setField("fldSomaReligiao");
    obj.label61:setAlign("left");
    obj.label61:setWidth(25);
    obj.label61:setName("label61");
    obj.label61:setFontColor("#6f6f6f");
    obj.label61:setFontFamily("Cambria");
    obj.label61:setFontSize(14);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout228);
    obj.label62:setText("/");
    obj.label62:setWidth(10);
    obj.label62:setName("label62");
    obj.label62:setFontColor("#6f6f6f");
    obj.label62:setFontFamily("Cambria");
    obj.label62:setFontSize(14);
    obj.label62:setAlign("left");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout228);
    obj.label63:setText("80");
    obj.label63:setAlign("left");
    obj.label63:setWidth(25);
    obj.label63:setName("label63");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setFontColor("white");
    obj.label63:setFontFamily("Cambria");
    obj.label63:setFontSize(14);

    obj.flagReli = GUI.fromHandle(_obj_newObject("label"));
    obj.flagReli:setParent(obj.layout227);
    obj.flagReli:setTop(7);
    obj.flagReli:setLeft(228);
    obj.flagReli:setWidth(180);
    obj.flagReli:setName("flagReli");
    obj.flagReli:setText("+100 GLÓRIA AO ANO");
    lfm_setPropAsString(obj.flagReli, "fontStyle",  "bold");
    obj.flagReli:setFontColor("#cdcdcd");
    obj.flagReli:setFontFamily("Palatino Linotype");
    obj.flagReli:setFontSize(14);
    obj.flagReli:setVisible(false);

    obj.layout229 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.layout224);
    obj.layout229:setName("layout229");
    obj.layout229:setAlign("top");
    obj.layout229:setHeight(30);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout229);
    obj.label64:setText("Bônus Romântico:");
    obj.label64:setWidth(139);
    obj.label64:setHitTest(true);
    obj.label64:setHint("Bônus de Paixões dobrados");
    obj.label64:setName("label64");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setFontColor("white");
    obj.label64:setFontFamily("Cambria");
    obj.label64:setFontSize(14);
    obj.label64:setAlign("left");

    obj.layout230 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.layout229);
    obj.layout230:setAlign("left");
    obj.layout230:setWidth(89);
    obj.layout230:setName("layout230");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout230);
    obj.label65:setField("fldSomaRomance");
    obj.label65:setAlign("left");
    obj.label65:setWidth(25);
    obj.label65:setName("label65");
    obj.label65:setFontColor("#6f6f6f");
    obj.label65:setFontFamily("Cambria");
    obj.label65:setFontSize(14);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout230);
    obj.label66:setText("/");
    obj.label66:setWidth(10);
    obj.label66:setName("label66");
    obj.label66:setFontColor("#6f6f6f");
    obj.label66:setFontFamily("Cambria");
    obj.label66:setFontSize(14);
    obj.label66:setAlign("left");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout230);
    obj.label67:setText("04");
    obj.label67:setAlign("left");
    obj.label67:setWidth(25);
    obj.label67:setName("label67");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setFontColor("white");
    obj.label67:setFontFamily("Cambria");
    obj.label67:setFontSize(14);

    obj.flagRom = GUI.fromHandle(_obj_newObject("label"));
    obj.flagRom:setParent(obj.layout229);
    obj.flagRom:setTop(7);
    obj.flagRom:setLeft(228);
    obj.flagRom:setWidth(180);
    obj.flagRom:setName("flagRom");
    obj.flagRom:setText("+100 GLÓRIA AO ANO");
    lfm_setPropAsString(obj.flagRom, "fontStyle",  "bold");
    obj.flagRom:setFontColor("#cdcdcd");
    obj.flagRom:setFontFamily("Palatino Linotype");
    obj.flagRom:setFontSize(14);
    obj.flagRom:setVisible(false);

    obj.dataLink209 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink209:setParent(obj.layout224);
    obj.dataLink209:setFields({'fldSomaHonra', 'fldSomaReligiao', 'fldSomaRomance'});
    obj.dataLink209:setDefaultValues({'00', '00', '00'});
    obj.dataLink209:setName("dataLink209");

    obj.layout231 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.rectangle6);
    obj.layout231:setAlign("top");
    obj.layout231:setMargins({top=20});
    obj.layout231:setName("layout231");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout231);
    obj.label68:setAlign("left");
    obj.label68:setText("☙ PAIXÕES");
    obj.label68:setWidth(120);
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setFontColor("#0080ff");
    obj.label68:setFontFamily("Palatino Linotype");
    obj.label68:setFontSize(20);
    obj.label68:setName("label68");

    obj.layout232 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.layout231);
    obj.layout232:setAlign("left");
    obj.layout232:setWidth(535);
    obj.layout232:setName("layout232");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout232);
    obj.rectangle22:setHeight(2);
    obj.rectangle22:setWidth(530);
    obj.rectangle22:setTop(25);
    obj.rectangle22:setColor("#0080ff");
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle6);
    obj.rectangle23:setName("rectangle23");
    obj.rectangle23:setAlign("top");
    obj.rectangle23:setHeight(30);
    obj.rectangle23:setColor("#272727");
    obj.rectangle23:setPadding({left=40});

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle23);
    obj.label69:setAlign("left");
    obj.label69:setWidth(215);
    obj.label69:setText("PAIXÃO");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setFontColor("#cdcdcd");
    obj.label69:setFontFamily("Palatino Linotype");
    obj.label69:setFontSize(14);
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle23);
    obj.label70:setAlign("left");
    obj.label70:setWidth(80);
    obj.label70:setText("VALOR");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setFontColor("#cdcdcd");
    obj.label70:setFontFamily("Palatino Linotype");
    obj.label70:setFontSize(14);
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle23);
    obj.label71:setAlign("left");
    obj.label71:setWidth(215);
    obj.label71:setText("PAIXÃO");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setFontColor("#cdcdcd");
    obj.label71:setFontFamily("Palatino Linotype");
    obj.label71:setFontSize(14);
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle23);
    obj.label72:setAlign("left");
    obj.label72:setWidth(80);
    obj.label72:setText("VALOR");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setFontColor("#cdcdcd");
    obj.label72:setFontFamily("Palatino Linotype");
    obj.label72:setFontSize(14);
    obj.label72:setName("label72");

    obj.layout233 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.rectangle6);
    obj.layout233:setAlign("top");
    obj.layout233:setMargins({left = 40});
    obj.layout233:setHeight(600);
    obj.layout233:setName("layout233");

    obj.layout234 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.layout233);
    obj.layout234:setWidth(635);
    obj.layout234:setHeight(600);
    obj.layout234:setName("layout234");

    obj.layout235 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.layout234);
    obj.layout235:setAlign("left");
    obj.layout235:setWidth(635);
    obj.layout235:setName("layout235");

    obj.rclPaixoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPaixoes:setParent(obj.layout235);
    obj.rclPaixoes:setWidth(635);
    obj.rclPaixoes:setMinQt(4);
    obj.rclPaixoes:setLayout("verticalTiles");
    obj.rclPaixoes:setName("rclPaixoes");
    obj.rclPaixoes:setField("fldPaixoes");
    obj.rclPaixoes:setTemplateForm("paixoes");
    obj.rclPaixoes:setAutoHeight(true);

    obj.layout236 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.layout234);
    obj.layout236:setAlign("right");
    obj.layout236:setHeight(600);
    obj.layout236:setName("layout236");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout236);
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Nova Paixão");
    obj.button1:setName("button1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Equipamento");
    obj.tab3:setName("tab3");

    obj.frmEquipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamentos:setParent(obj.tab3);
    obj.frmEquipamentos:setName("frmEquipamentos");
    obj.frmEquipamentos:setAlign("client");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.frmEquipamentos);
    obj.rectangle24:setPadding({top = 10});
    obj.rectangle24:setName("rectangle24");
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#272727");

    obj.layout237 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.rectangle24);
    obj.layout237:setAlign("top");
    obj.layout237:setName("layout237");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout237);
    obj.label73:setAlign("left");
    obj.label73:setText("☙ EQUIPAMENTOS");
    obj.label73:setWidth(200);
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setFontColor("#0080ff");
    obj.label73:setFontFamily("Palatino Linotype");
    obj.label73:setFontSize(20);
    obj.label73:setName("label73");

    obj.layout238 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.layout237);
    obj.layout238:setAlign("left");
    obj.layout238:setWidth(450);
    obj.layout238:setName("layout238");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout238);
    obj.rectangle25:setHeight(2);
    obj.rectangle25:setWidth(535);
    obj.rectangle25:setTop(25);
    obj.rectangle25:setColor("#0080ff");
    obj.rectangle25:setName("rectangle25");

    obj.layout239 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.rectangle24);
    obj.layout239:setAlign("top");
    obj.layout239:setHeight(25);
    obj.layout239:setMargins({top = 10});
    obj.layout239:setName("layout239");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout239);
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setAlign("top");
    obj.rectangle26:setHeight(30);
    obj.rectangle26:setColor("#272727");
    obj.rectangle26:setPadding({left=40});

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle26);
    obj.label74:setAlign("left");
    obj.label74:setWidth(230);
    obj.label74:setText("ITEM");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setFontColor("#cdcdcd");
    obj.label74:setFontFamily("Palatino Linotype");
    obj.label74:setFontSize(14);
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle26);
    obj.label75:setAlign("left");
    obj.label75:setWidth(50);
    obj.label75:setText("QNT.");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setFontColor("#cdcdcd");
    obj.label75:setFontFamily("Palatino Linotype");
    obj.label75:setFontSize(14);
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle26);
    obj.label76:setAlign("left");
    obj.label76:setWidth(255);
    obj.label76:setText("STATUS");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setFontColor("#cdcdcd");
    obj.label76:setFontFamily("Palatino Linotype");
    obj.label76:setFontSize(14);
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle26);
    obj.label77:setAlign("left");
    obj.label77:setWidth(80);
    obj.label77:setText("VALOR");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setFontColor("#cdcdcd");
    obj.label77:setFontFamily("Palatino Linotype");
    obj.label77:setFontSize(14);
    obj.label77:setName("label77");

    obj.layout240 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.rectangle24);
    obj.layout240:setAlign("left");
    obj.layout240:setWidth(650);
    obj.layout240:setName("layout240");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.layout240);
    obj.rclEquips:setAlign("top");
    obj.rclEquips:setMinQt(4);
    obj.rclEquips:setLayout("vertical");
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setField("fldEquips");
    obj.rclEquips:setTemplateForm("equips");
    obj.rclEquips:setAutoHeight(true);

    obj.layout241 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.layout240);
    obj.layout241:setAlign("top");
    obj.layout241:setName("layout241");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout241);
    obj.button2:setLeft(625);
    obj.button2:setHeight(25);
    obj.button2:setTop(1);
    obj.button2:setText("🞦");
    obj.button2:setWidth(25);
    obj.button2:setHint("Novo Equipamento");
    obj.button2:setName("button2");

    obj.layout242 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.layout240);
    obj.layout242:setAlign("top");
    obj.layout242:setName("layout242");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout242);
    obj.label78:setAlign("left");
    obj.label78:setText("☙ ANIMAIS");
    obj.label78:setWidth(125);
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setFontColor("#0080ff");
    obj.label78:setFontFamily("Palatino Linotype");
    obj.label78:setFontSize(20);
    obj.label78:setName("label78");

    obj.layout243 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.layout242);
    obj.layout243:setAlign("left");
    obj.layout243:setWidth(525);
    obj.layout243:setName("layout243");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout243);
    obj.rectangle27:setHeight(2);
    obj.rectangle27:setWidth(535);
    obj.rectangle27:setTop(25);
    obj.rectangle27:setColor("#0080ff");
    obj.rectangle27:setName("rectangle27");

    obj.layout244 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.layout240);
    obj.layout244:setAlign("top");
    obj.layout244:setHeight(25);
    obj.layout244:setMargins({top = 10});
    obj.layout244:setName("layout244");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout244);
    obj.rectangle28:setName("rectangle28");
    obj.rectangle28:setAlign("top");
    obj.rectangle28:setHeight(30);
    obj.rectangle28:setColor("#272727");
    obj.rectangle28:setPadding({left=40});

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle28);
    obj.label79:setAlign("left");
    obj.label79:setWidth(230);
    obj.label79:setText("ANIMAL");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setFontColor("#cdcdcd");
    obj.label79:setFontFamily("Palatino Linotype");
    obj.label79:setFontSize(14);
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle28);
    obj.label80:setAlign("left");
    obj.label80:setWidth(50);
    obj.label80:setText("QNT.");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setFontColor("#cdcdcd");
    obj.label80:setFontFamily("Palatino Linotype");
    obj.label80:setFontSize(14);
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle28);
    obj.label81:setAlign("left");
    obj.label81:setWidth(255);
    obj.label81:setText("STATUS");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setFontColor("#cdcdcd");
    obj.label81:setFontFamily("Palatino Linotype");
    obj.label81:setFontSize(14);
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle28);
    obj.label82:setAlign("left");
    obj.label82:setWidth(80);
    obj.label82:setText("VALOR");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setFontColor("#cdcdcd");
    obj.label82:setFontFamily("Palatino Linotype");
    obj.label82:setFontSize(14);
    obj.label82:setName("label82");

    obj.rclHorses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHorses:setParent(obj.layout240);
    obj.rclHorses:setAlign("top");
    obj.rclHorses:setMinQt(4);
    obj.rclHorses:setLayout("vertical");
    obj.rclHorses:setName("rclHorses");
    obj.rclHorses:setField("fldHorses");
    obj.rclHorses:setTemplateForm("equips");
    obj.rclHorses:setAutoHeight(true);

    obj.layout245 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout245:setParent(obj.layout240);
    obj.layout245:setAlign("top");
    obj.layout245:setName("layout245");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout245);
    obj.button3:setLeft(625);
    obj.button3:setHeight(25);
    obj.button3:setTop(1);
    obj.button3:setText("🞦");
    obj.button3:setWidth(25);
    obj.button3:setHint("Novo Animal");
    obj.button3:setName("button3");

    obj.layout246 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout246:setParent(obj.layout240);
    obj.layout246:setAlign("top");
    obj.layout246:setName("layout246");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout246);
    obj.label83:setMargins({left=40});
    obj.label83:setAlign("left");
    obj.label83:setWidth(60);
    obj.label83:setText("LIBRAS:");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setFontColor("#cdcdcd");
    obj.label83:setFontFamily("Palatino Linotype");
    obj.label83:setFontSize(14);
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout246);
    obj.label84:setAlign("left");
    obj.label84:setWidth(10);
    obj.label84:setText("£");
    obj.label84:setFontColor("white");
    obj.label84:setFontFamily("Cambria");
    obj.label84:setFontSize(14);
    obj.label84:setName("label84");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout246);
    obj.edit151:setField("fldLibras");
    obj.edit151:setAlign("left");
    obj.edit151:setWidth(30);
    obj.edit151:setName("edit151");
    obj.edit151:setFontColor("#cdcdcd");
    obj.edit151:setFontFamily("Cambria");
    obj.edit151:setFontSize(14);
    obj.edit151:setHeight(30);
    obj.edit151:setTransparent(true);

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout246);
    obj.label85:setMargins({left=50});
    obj.label85:setAlign("left");
    obj.label85:setWidth(90);
    obj.label85:setText("DENÁRIOS:");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontColor("#cdcdcd");
    obj.label85:setFontFamily("Palatino Linotype");
    obj.label85:setFontSize(14);
    obj.label85:setName("label85");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout246);
    obj.edit152:setField("fldDenarios");
    obj.edit152:setAlign("left");
    obj.edit152:setWidth(30);
    obj.edit152:setName("edit152");
    obj.edit152:setFontColor("#cdcdcd");
    obj.edit152:setFontFamily("Cambria");
    obj.edit152:setFontSize(14);
    obj.edit152:setHeight(30);
    obj.edit152:setTransparent(true);

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout246);
    obj.label86:setAlign("left");
    obj.label86:setWidth(12);
    obj.label86:setText("d.");
    obj.label86:setFontColor("white");
    obj.label86:setFontFamily("Cambria");
    obj.label86:setFontSize(14);
    obj.label86:setName("label86");

    obj.dataLink210 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink210:setParent(obj.layout246);
    obj.dataLink210:setFields({'fldLibras', 'fldDenarios'});
    obj.dataLink210:setDefaultValues({'—', '—'});
    obj.dataLink210:setName("dataLink210");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("História");
    obj.tab4:setName("tab4");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.tab4);
    obj.rectangle29:setPadding({top = 10});
    obj.rectangle29:setName("rectangle29");
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("#272727");

    obj.layout247 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout247:setParent(obj.rectangle29);
    obj.layout247:setAlign("top");
    obj.layout247:setName("layout247");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout247);
    obj.label87:setAlign("left");
    obj.label87:setText("☙ APARÊNCIA");
    obj.label87:setWidth(150);
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setFontColor("#0080ff");
    obj.label87:setFontFamily("Palatino Linotype");
    obj.label87:setFontSize(20);
    obj.label87:setName("label87");

    obj.layout248 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout248:setParent(obj.layout247);
    obj.layout248:setAlign("left");
    obj.layout248:setWidth(500);
    obj.layout248:setMargins({right=20});
    obj.layout248:setName("layout248");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout248);
    obj.rectangle30:setHeight(2);
    obj.rectangle30:setWidth(535);
    obj.rectangle30:setTop(25);
    obj.rectangle30:setColor("#0080ff");
    obj.rectangle30:setName("rectangle30");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout247);
    obj.label88:setAlign("left");
    obj.label88:setText("☙ HISTÓRIA");
    obj.label88:setWidth(133);
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setFontColor("#0080ff");
    obj.label88:setFontFamily("Palatino Linotype");
    obj.label88:setFontSize(20);
    obj.label88:setName("label88");

    obj.layout249 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout249:setParent(obj.layout247);
    obj.layout249:setAlign("client");
    obj.layout249:setName("layout249");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout249);
    obj.rectangle31:setHeight(2);
    obj.rectangle31:setWidth(3000);
    obj.rectangle31:setTop(25);
    obj.rectangle31:setColor("#0080ff");
    obj.rectangle31:setName("rectangle31");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout247);
    obj.rectangle32:setAlign("right");
    obj.rectangle32:setWidth(10);
    obj.rectangle32:setColor("#272727");
    obj.rectangle32:setName("rectangle32");

    obj.layout250 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout250:setParent(obj.rectangle29);
    obj.layout250:setAlign("top");
    obj.layout250:setHeight(730);
    obj.layout250:setName("layout250");

    obj.layout251 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout251:setParent(obj.layout250);
    obj.layout251:setAlign("left");
    obj.layout251:setWidth(672);
    obj.layout251:setName("layout251");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.layout251);
    obj.image38:setTop(110);
    obj.image38:setLeft(155);
    obj.image38:setWidth(354);
    obj.image38:setHeight(580);
    obj.image38:setStyle("autoFit");
    obj.image38:setEditable(true);
    obj.image38:setField("fldFotoPJ");
    obj.image38:setHint("Alterar Aparência");
    obj.image38:setName("image38");

    obj.dataLink211 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink211:setParent(obj.layout251);
    obj.dataLink211:setField("fldFotoPJ");
    obj.dataLink211:setDefaultValue("/images/knight.png");
    obj.dataLink211:setName("dataLink211");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.layout251);
    obj.image39:setHeight(900);
    obj.image39:setWidth(670);
    obj.image39:setURL("/images/framec.png");
    obj.image39:setStyle("proportional");
    obj.image39:setName("image39");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout250);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setWidth(650);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "#cdcdcd");
    obj.richEdit1:setField("historia");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "false");
    obj.richEdit1:setName("richEdit1");

    obj.layout252 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout252:setParent(obj.rectangle29);
    obj.layout252:setAlign("top");
    obj.layout252:setName("layout252");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout252);
    obj.label89:setAlign("left");
    obj.label89:setText("☙ BACKGROUND");
    obj.label89:setWidth(185);
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setFontColor("#0080ff");
    obj.label89:setFontFamily("Palatino Linotype");
    obj.label89:setFontSize(20);
    obj.label89:setName("label89");

    obj.layout253 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout253:setParent(obj.layout252);
    obj.layout253:setAlign("client");
    obj.layout253:setName("layout253");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout253);
    obj.rectangle33:setHeight(2);
    obj.rectangle33:setWidth(3000);
    obj.rectangle33:setTop(25);
    obj.rectangle33:setColor("#0080ff");
    obj.rectangle33:setName("rectangle33");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout252);
    obj.rectangle34:setAlign("right");
    obj.rectangle34:setWidth(10);
    obj.rectangle34:setColor("#272727");
    obj.rectangle34:setName("rectangle34");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.rectangle29);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setWidth(650);
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "#cdcdcd");
    obj.richEdit2:setField("background");
    lfm_setPropAsString(obj.richEdit2, "showToolbar",  "false");
    obj.richEdit2:setName("richEdit2");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.tab5);
    obj.rectangle35:setPadding({top = 0});
    obj.rectangle35:setName("rectangle35");
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("#272727");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.rectangle35);
    obj.richEdit3:setAlign("client");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "#cdcdcd");
    obj.richEdit3:setField("anotacoes");
    obj.richEdit3:setName("richEdit3");

    obj._e_event0 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										sheet.fldTamanho = string.format("%02d", sheet.fldTamanho);
        end, obj);

    obj._e_event1 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										sheet.fldDestreza = string.format("%02d", sheet.fldDestreza);
        end, obj);

    obj._e_event2 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										sheet.fldForca = string.format("%02d", sheet.fldForca);
        end, obj);

    obj._e_event3 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										sheet.fldConstituicao = string.format("%02d", sheet.fldConstituicao);
        end, obj);

    obj._e_event4 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										sheet.fldAparencia = string.format("%02d", sheet.fldAparencia);
        end, obj);

    obj._e_event5 = obj.dataLink52:addEventListener("onChange",
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
            									sheet.fldInconsciente = math.floor((sheet.fldHP/4)+0.5);
        end, obj);

    obj._e_event6 = obj.dataLink53:addEventListener("onUserChange",
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

    obj._e_event7 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor01 = string.format("%02d", sheet.fldHabValor01);
        end, obj);

    obj._e_event8 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event9 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor04 = string.format("%02d", sheet.fldHabValor04);
        end, obj);

    obj._e_event10 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event11 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor07 = string.format("%02d", sheet.fldHabValor07);
        end, obj);

    obj._e_event12 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event13 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor10 = string.format("%02d", sheet.fldHabValor10);
        end, obj);

    obj._e_event14 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event15 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor13 = string.format("%02d", sheet.fldHabValor13);
        end, obj);

    obj._e_event16 = obj.dataLink63:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event17 = obj.dataLink64:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor02 = string.format("%02d", sheet.fldHabValor02);
        end, obj);

    obj._e_event18 = obj.dataLink65:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event19 = obj.dataLink66:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor05 = string.format("%02d", sheet.fldHabValor05);
        end, obj);

    obj._e_event20 = obj.dataLink67:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event21 = obj.dataLink68:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor08 = string.format("%02d", sheet.fldHabValor08);
        end, obj);

    obj._e_event22 = obj.dataLink69:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event23 = obj.dataLink70:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor11 = string.format("%02d", sheet.fldHabValor11);
        end, obj);

    obj._e_event24 = obj.dataLink71:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event25 = obj.dataLink72:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor14 = string.format("%02d", sheet.fldHabValor14);
        end, obj);

    obj._e_event26 = obj.dataLink73:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event27 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor03 = string.format("%02d", sheet.fldHabValor03);
        end, obj);

    obj._e_event28 = obj.dataLink75:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event29 = obj.dataLink76:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor06 = string.format("%02d", sheet.fldHabValor06);
        end, obj);

    obj._e_event30 = obj.dataLink77:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event31 = obj.dataLink78:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor09 = string.format("%02d", sheet.fldHabValor09);
        end, obj);

    obj._e_event32 = obj.dataLink79:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event33 = obj.dataLink80:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor12 = string.format("%02d", sheet.fldHabValor12);
        end, obj);

    obj._e_event34 = obj.dataLink81:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event35 = obj.dataLink82:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor15 = string.format("%02d", sheet.fldHabValor15);
        end, obj);

    obj._e_event36 = obj.dataLink83:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event37 = obj.dataLink84:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor16 = string.format("%02d", sheet.fldHabValor16);
        end, obj);

    obj._e_event38 = obj.dataLink85:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event39 = obj.dataLink86:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor19 = string.format("%02d", sheet.fldHabValor19);
        end, obj);

    obj._e_event40 = obj.dataLink87:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event41 = obj.dataLink88:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor22 = string.format("%02d", sheet.fldHabValor22);
        end, obj);

    obj._e_event42 = obj.dataLink89:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event43 = obj.dataLink90:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor25 = string.format("%02d", sheet.fldHabValor25);
        end, obj);

    obj._e_event44 = obj.dataLink91:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event45 = obj.dataLink92:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor28 = string.format("%02d", sheet.fldHabValor28);
        end, obj);

    obj._e_event46 = obj.dataLink93:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event47 = obj.dataLink94:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor31 = string.format("%02d", sheet.fldHabValor31);
        end, obj);

    obj._e_event48 = obj.dataLink95:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event49 = obj.dataLink96:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor34 = string.format("%02d", sheet.fldHabValor34);
        end, obj);

    obj._e_event50 = obj.dataLink97:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event51 = obj.dataLink98:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor37 = string.format("%02d", sheet.fldHabValor37);
        end, obj);

    obj._e_event52 = obj.dataLink99:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event53 = obj.dataLink100:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor40 = string.format("%02d", sheet.fldHabValor40);
        end, obj);

    obj._e_event54 = obj.dataLink101:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event55 = obj.dataLink102:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor43 = string.format("%02d", sheet.fldHabValor43);
        end, obj);

    obj._e_event56 = obj.dataLink103:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event57 = obj.dataLink104:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor17 = string.format("%02d", sheet.fldHabValor17);
        end, obj);

    obj._e_event58 = obj.dataLink105:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event59 = obj.dataLink106:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor20 = string.format("%02d", sheet.fldHabValor20);
        end, obj);

    obj._e_event60 = obj.dataLink107:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event61 = obj.dataLink108:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor23 = string.format("%02d", sheet.fldHabValor23);
        end, obj);

    obj._e_event62 = obj.dataLink109:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event63 = obj.dataLink110:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor26 = string.format("%02d", sheet.fldHabValor26);
        end, obj);

    obj._e_event64 = obj.dataLink111:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event65 = obj.dataLink112:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor29 = string.format("%02d", sheet.fldHabValor29);
        end, obj);

    obj._e_event66 = obj.dataLink113:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event67 = obj.dataLink114:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor32 = string.format("%02d", sheet.fldHabValor32);
        end, obj);

    obj._e_event68 = obj.dataLink115:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event69 = obj.dataLink116:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor35 = string.format("%02d", sheet.fldHabValor35);
        end, obj);

    obj._e_event70 = obj.dataLink117:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event71 = obj.dataLink118:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor38 = string.format("%02d", sheet.fldHabValor38);
        end, obj);

    obj._e_event72 = obj.dataLink119:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event73 = obj.dataLink120:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor41 = string.format("%02d", sheet.fldHabValor41);
        end, obj);

    obj._e_event74 = obj.dataLink121:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event75 = obj.dataLink122:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor44 = string.format("%02d", sheet.fldHabValor44);
        end, obj);

    obj._e_event76 = obj.dataLink123:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event77 = obj.dataLink124:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor18 = string.format("%02d", sheet.fldHabValor18);
        end, obj);

    obj._e_event78 = obj.dataLink125:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event79 = obj.dataLink126:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor21 = string.format("%02d", sheet.fldHabValor21);
        end, obj);

    obj._e_event80 = obj.dataLink127:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event81 = obj.dataLink128:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor24 = string.format("%02d", sheet.fldHabValor24);
        end, obj);

    obj._e_event82 = obj.dataLink129:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event83 = obj.dataLink130:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor27 = string.format("%02d", sheet.fldHabValor27);
        end, obj);

    obj._e_event84 = obj.dataLink131:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event85 = obj.dataLink132:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor30 = string.format("%02d", sheet.fldHabValor30);
        end, obj);

    obj._e_event86 = obj.dataLink133:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event87 = obj.dataLink134:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor33 = string.format("%02d", sheet.fldHabValor33);
        end, obj);

    obj._e_event88 = obj.dataLink135:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event89 = obj.dataLink136:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor36 = string.format("%02d", sheet.fldHabValor36);
        end, obj);

    obj._e_event90 = obj.dataLink137:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event91 = obj.dataLink138:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor39 = string.format("%02d", sheet.fldHabValor39);
        end, obj);

    obj._e_event92 = obj.dataLink139:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event93 = obj.dataLink140:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor42 = string.format("%02d", sheet.fldHabValor42);
        end, obj);

    obj._e_event94 = obj.dataLink141:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event95 = obj.dataLink142:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual(); 
            										sheet.fldHabValor45 = string.format("%02d", sheet.fldHabValor45);
        end, obj);

    obj._e_event96 = obj.dataLink143:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularGloriaAnual();
        end, obj);

    obj._e_event97 = obj.tab2:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; CalcularVirtude('');
        end, obj);

    obj._e_event98 = obj.dataLink146:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event99 = obj.dataLink147:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event100 = obj.dataLink148:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event101 = obj.dataLink151:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event102 = obj.dataLink152:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event103 = obj.dataLink153:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event104 = obj.dataLink156:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event105 = obj.dataLink157:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event106 = obj.dataLink158:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event107 = obj.dataLink161:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event108 = obj.dataLink162:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event109 = obj.dataLink163:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event110 = obj.dataLink166:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event111 = obj.dataLink167:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event112 = obj.dataLink168:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event113 = obj.dataLink171:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event114 = obj.dataLink172:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event115 = obj.dataLink173:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event116 = obj.dataLink176:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event117 = obj.dataLink177:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event118 = obj.dataLink178:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event119 = obj.dataLink181:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event120 = obj.dataLink182:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event121 = obj.dataLink183:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event122 = obj.dataLink186:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event123 = obj.dataLink187:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event124 = obj.dataLink188:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event125 = obj.dataLink191:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event126 = obj.dataLink192:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event127 = obj.dataLink193:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event128 = obj.dataLink196:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event129 = obj.dataLink197:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event130 = obj.dataLink198:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event131 = obj.dataLink201:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event132 = obj.dataLink202:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event133 = obj.dataLink203:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event134 = obj.dataLink206:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event135 = obj.dataLink207:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event136 = obj.dataLink208:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            										CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event137 = obj.rclPaixoes:addEventListener("onSelect",
        function (_)
            self.rclPaixoes:sort();
        end, obj);

    obj._e_event138 = obj.rclPaixoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomePX, nodeB.nomePX);
        end, obj);

    obj._e_event139 = obj.rclPaixoes:addEventListener("onSelect",
        function (_)
            ContabilizarPaixoes();
        end, obj);

    obj._e_event140 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclPaixoes:append();
        end, obj);

    obj._e_event141 = obj.rclEquips:addEventListener("onItemRemoved",
        function (_, node, form)
            self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event142 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclEquips:append(); self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event143 = obj.rclHorses:addEventListener("onItemRemoved",
        function (_, node, form)
            self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event144 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclHorses:append(); self.frmEquipamentos:needRepaint();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
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

        if self.dataLink142 ~= nil then self.dataLink142:destroy(); self.dataLink142 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.namMisericordiaB ~= nil then self.namMisericordiaB:destroy(); self.namMisericordiaB = nil; end;
        if self.dataLink206 ~= nil then self.dataLink206:destroy(); self.dataLink206 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.dataLink141 ~= nil then self.dataLink141:destroy(); self.dataLink141 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout247 ~= nil then self.layout247:destroy(); self.layout247 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink174 ~= nil then self.dataLink174:destroy(); self.dataLink174 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout249 ~= nil then self.layout249:destroy(); self.layout249 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.layout251 ~= nil then self.layout251:destroy(); self.layout251 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink186 ~= nil then self.dataLink186:destroy(); self.dataLink186 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.namCoragemB ~= nil then self.namCoragemB:destroy(); self.namCoragemB = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.FOR ~= nil then self.FOR:destroy(); self.FOR = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.dataLink188 ~= nil then self.dataLink188:destroy(); self.dataLink188 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.dataLink160 ~= nil then self.dataLink160:destroy(); self.dataLink160 = nil; end;
        if self.dataLink183 ~= nil then self.dataLink183:destroy(); self.dataLink183 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.dataLink172 ~= nil then self.dataLink172:destroy(); self.dataLink172 = nil; end;
        if self.dataLink208 ~= nil then self.dataLink208:destroy(); self.dataLink208 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink200 ~= nil then self.dataLink200:destroy(); self.dataLink200 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.layout248 ~= nil then self.layout248:destroy(); self.layout248 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout246 ~= nil then self.layout246:destroy(); self.layout246 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.namIndulgencia ~= nil then self.namIndulgencia:destroy(); self.namIndulgencia = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.dLUpgrades ~= nil then self.dLUpgrades:destroy(); self.dLUpgrades = nil; end;
        if self.namEnergia ~= nil then self.namEnergia:destroy(); self.namEnergia = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.dataLink201 ~= nil then self.dataLink201:destroy(); self.dataLink201 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink128 ~= nil then self.dataLink128:destroy(); self.dataLink128 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.dLDescCaracteristica ~= nil then self.dLDescCaracteristica:destroy(); self.dLDescCaracteristica = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.namCinismo ~= nil then self.namCinismo:destroy(); self.namCinismo = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink189 ~= nil then self.dataLink189:destroy(); self.dataLink189 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.dataLink173 ~= nil then self.dataLink173:destroy(); self.dataLink173 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.namImprudencia ~= nil then self.namImprudencia:destroy(); self.namImprudencia = nil; end;
        if self.rclHorses ~= nil then self.rclHorses:destroy(); self.rclHorses = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.dataLink161 ~= nil then self.dataLink161:destroy(); self.dataLink161 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink169 ~= nil then self.dataLink169:destroy(); self.dataLink169 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.dataLink155 ~= nil then self.dataLink155:destroy(); self.dataLink155 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.dataLink187 ~= nil then self.dataLink187:destroy(); self.dataLink187 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink209 ~= nil then self.dataLink209:destroy(); self.dataLink209 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.namPerdaoB ~= nil then self.namPerdaoB:destroy(); self.namPerdaoB = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.dataLink207 ~= nil then self.dataLink207:destroy(); self.dataLink207 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.namEspiritualidade ~= nil then self.namEspiritualidade:destroy(); self.namEspiritualidade = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.dataLink193 ~= nil then self.dataLink193:destroy(); self.dataLink193 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.namConfianca ~= nil then self.namConfianca:destroy(); self.namConfianca = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.dataLink133 ~= nil then self.dataLink133:destroy(); self.dataLink133 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.namMisericordia ~= nil then self.namMisericordia:destroy(); self.namMisericordia = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink199 ~= nil then self.dataLink199:destroy(); self.dataLink199 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.dataLink182 ~= nil then self.dataLink182:destroy(); self.dataLink182 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.CON ~= nil then self.CON:destroy(); self.CON = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flagRom ~= nil then self.flagRom:destroy(); self.flagRom = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout245 ~= nil then self.layout245:destroy(); self.layout245 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.namOrgulhoB ~= nil then self.namOrgulhoB:destroy(); self.namOrgulhoB = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.dataLink150 ~= nil then self.dataLink150:destroy(); self.dataLink150 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.dataLink123 ~= nil then self.dataLink123:destroy(); self.dataLink123 = nil; end;
        if self.comboBox45 ~= nil then self.comboBox45:destroy(); self.comboBox45 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.layout253 ~= nil then self.layout253:destroy(); self.layout253 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.namCrueldadeB ~= nil then self.namCrueldadeB:destroy(); self.namCrueldadeB = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink127 ~= nil then self.dataLink127:destroy(); self.dataLink127 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.dataLink166 ~= nil then self.dataLink166:destroy(); self.dataLink166 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.dataLink154 ~= nil then self.dataLink154:destroy(); self.dataLink154 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.dataLink181 ~= nil then self.dataLink181:destroy(); self.dataLink181 = nil; end;
        if self.dataLink135 ~= nil then self.dataLink135:destroy(); self.dataLink135 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.dataLink145 ~= nil then self.dataLink145:destroy(); self.dataLink145 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.namPreguica ~= nil then self.namPreguica:destroy(); self.namPreguica = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.DES ~= nil then self.DES:destroy(); self.DES = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink152 ~= nil then self.dataLink152:destroy(); self.dataLink152 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink171 ~= nil then self.dataLink171:destroy(); self.dataLink171 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dLDadosAdicionais ~= nil then self.dLDadosAdicionais:destroy(); self.dLDadosAdicionais = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.namPerdao ~= nil then self.namPerdao:destroy(); self.namPerdao = nil; end;
        if self.dLCabecalho ~= nil then self.dLCabecalho:destroy(); self.dLCabecalho = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.dataLink136 ~= nil then self.dataLink136:destroy(); self.dataLink136 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink184 ~= nil then self.dataLink184:destroy(); self.dataLink184 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.namHonestidade ~= nil then self.namHonestidade:destroy(); self.namHonestidade = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.namCastidadeB ~= nil then self.namCastidadeB:destroy(); self.namCastidadeB = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.dataLink164 ~= nil then self.dataLink164:destroy(); self.dataLink164 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.dataLink211 ~= nil then self.dataLink211:destroy(); self.dataLink211 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink144 ~= nil then self.dataLink144:destroy(); self.dataLink144 = nil; end;
        if self.namDesconfianca ~= nil then self.namDesconfianca:destroy(); self.namDesconfianca = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.namCinismoB ~= nil then self.namCinismoB:destroy(); self.namCinismoB = nil; end;
        if self.namPrudenciaB ~= nil then self.namPrudenciaB:destroy(); self.namPrudenciaB = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.dataLink170 ~= nil then self.dataLink170:destroy(); self.dataLink170 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.dataLink157 ~= nil then self.dataLink157:destroy(); self.dataLink157 = nil; end;
        if self.dataLink159 ~= nil then self.dataLink159:destroy(); self.dataLink159 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.namTemperancaB ~= nil then self.namTemperancaB:destroy(); self.namTemperancaB = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.namCovardiaB ~= nil then self.namCovardiaB:destroy(); self.namCovardiaB = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.namModestiaB ~= nil then self.namModestiaB:destroy(); self.namModestiaB = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.dataLink158 ~= nil then self.dataLink158:destroy(); self.dataLink158 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.namLuxuria ~= nil then self.namLuxuria:destroy(); self.namLuxuria = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.namConfiancaB ~= nil then self.namConfiancaB:destroy(); self.namConfiancaB = nil; end;
        if self.namImprudenciaB ~= nil then self.namImprudenciaB:destroy(); self.namImprudenciaB = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink205 ~= nil then self.dataLink205:destroy(); self.dataLink205 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.dataLink149 ~= nil then self.dataLink149:destroy(); self.dataLink149 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.dataLink185 ~= nil then self.dataLink185:destroy(); self.dataLink185 = nil; end;
        if self.dataLink210 ~= nil then self.dataLink210:destroy(); self.dataLink210 = nil; end;
        if self.namVingancaB ~= nil then self.namVingancaB:destroy(); self.namVingancaB = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.namSomaGloria ~= nil then self.namSomaGloria:destroy(); self.namSomaGloria = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.namDesconfiancaB ~= nil then self.namDesconfiancaB:destroy(); self.namDesconfiancaB = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.namHonestidadeB ~= nil then self.namHonestidadeB:destroy(); self.namHonestidadeB = nil; end;
        if self.dataLink179 ~= nil then self.dataLink179:destroy(); self.dataLink179 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.dataLink147 ~= nil then self.dataLink147:destroy(); self.dataLink147 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink196 ~= nil then self.dataLink196:destroy(); self.dataLink196 = nil; end;
        if self.dataLink202 ~= nil then self.dataLink202:destroy(); self.dataLink202 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout252 ~= nil then self.layout252:destroy(); self.layout252 = nil; end;
        if self.dataLink148 ~= nil then self.dataLink148:destroy(); self.dataLink148 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.namMalicia ~= nil then self.namMalicia:destroy(); self.namMalicia = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.dataLink165 ~= nil then self.dataLink165:destroy(); self.dataLink165 = nil; end;
        if self.namCoragem ~= nil then self.namCoragem:destroy(); self.namCoragem = nil; end;
        if self.TAM ~= nil then self.TAM:destroy(); self.TAM = nil; end;
        if self.flagReli ~= nil then self.flagReli:destroy(); self.flagReli = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.dataLink138 ~= nil then self.dataLink138:destroy(); self.dataLink138 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.dataLink153 ~= nil then self.dataLink153:destroy(); self.dataLink153 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.dataLink175 ~= nil then self.dataLink175:destroy(); self.dataLink175 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.dataLink151 ~= nil then self.dataLink151:destroy(); self.dataLink151 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.dataLink194 ~= nil then self.dataLink194:destroy(); self.dataLink194 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink167 ~= nil then self.dataLink167:destroy(); self.dataLink167 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.dataLink204 ~= nil then self.dataLink204:destroy(); self.dataLink204 = nil; end;
        if self.flagHonra ~= nil then self.flagHonra:destroy(); self.flagHonra = nil; end;
        if self.namArbitrariedadeB ~= nil then self.namArbitrariedadeB:destroy(); self.namArbitrariedadeB = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.namOrgulho ~= nil then self.namOrgulho:destroy(); self.namOrgulho = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.dataLink162 ~= nil then self.dataLink162:destroy(); self.dataLink162 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink163 ~= nil then self.dataLink163:destroy(); self.dataLink163 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.namEnergiaB ~= nil then self.namEnergiaB:destroy(); self.namEnergiaB = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.dataLink137 ~= nil then self.dataLink137:destroy(); self.dataLink137 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.namJusticaB ~= nil then self.namJusticaB:destroy(); self.namJusticaB = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.namPreguicaB ~= nil then self.namPreguicaB:destroy(); self.namPreguicaB = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink190 ~= nil then self.dataLink190:destroy(); self.dataLink190 = nil; end;
        if self.dataLink126 ~= nil then self.dataLink126:destroy(); self.dataLink126 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.dataLink203 ~= nil then self.dataLink203:destroy(); self.dataLink203 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.namEgoismoB ~= nil then self.namEgoismoB:destroy(); self.namEgoismoB = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink130 ~= nil then self.dataLink130:destroy(); self.dataLink130 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.dataLink131 ~= nil then self.dataLink131:destroy(); self.dataLink131 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink143 ~= nil then self.dataLink143:destroy(); self.dataLink143 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.namCastidade ~= nil then self.namCastidade:destroy(); self.namCastidade = nil; end;
        if self.dataLink195 ~= nil then self.dataLink195:destroy(); self.dataLink195 = nil; end;
        if self.layout250 ~= nil then self.layout250:destroy(); self.layout250 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.namGenerosidade ~= nil then self.namGenerosidade:destroy(); self.namGenerosidade = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.namModestia ~= nil then self.namModestia:destroy(); self.namModestia = nil; end;
        if self.namIndulgenciaB ~= nil then self.namIndulgenciaB:destroy(); self.namIndulgenciaB = nil; end;
        if self.dataLink134 ~= nil then self.dataLink134:destroy(); self.dataLink134 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.dataLink139 ~= nil then self.dataLink139:destroy(); self.dataLink139 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.dLDadosIniciais ~= nil then self.dLDadosIniciais:destroy(); self.dLDadosIniciais = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.frmEquipamentos ~= nil then self.frmEquipamentos:destroy(); self.frmEquipamentos = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.dataLink192 ~= nil then self.dataLink192:destroy(); self.dataLink192 = nil; end;
        if self.dLAtributosDerivados ~= nil then self.dLAtributosDerivados:destroy(); self.dLAtributosDerivados = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.namEspiritualidadeB ~= nil then self.namEspiritualidadeB:destroy(); self.namEspiritualidadeB = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink177 ~= nil then self.dataLink177:destroy(); self.dataLink177 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.dataLink191 ~= nil then self.dataLink191:destroy(); self.dataLink191 = nil; end;
        if self.dataLink198 ~= nil then self.dataLink198:destroy(); self.dataLink198 = nil; end;
        if self.rclPaixoes ~= nil then self.rclPaixoes:destroy(); self.rclPaixoes = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.APA ~= nil then self.APA:destroy(); self.APA = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.dataLink129 ~= nil then self.dataLink129:destroy(); self.dataLink129 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink156 ~= nil then self.dataLink156:destroy(); self.dataLink156 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.dataLink140 ~= nil then self.dataLink140:destroy(); self.dataLink140 = nil; end;
        if self.namMaliciaB ~= nil then self.namMaliciaB:destroy(); self.namMaliciaB = nil; end;
        if self.namGenerosidadeB ~= nil then self.namGenerosidadeB:destroy(); self.namGenerosidadeB = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.dataLink168 ~= nil then self.dataLink168:destroy(); self.dataLink168 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.namTemperanca ~= nil then self.namTemperanca:destroy(); self.namTemperanca = nil; end;
        if self.namLuxuriaB ~= nil then self.namLuxuriaB:destroy(); self.namLuxuriaB = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.dataLink197 ~= nil then self.dataLink197:destroy(); self.dataLink197 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink132 ~= nil then self.dataLink132:destroy(); self.dataLink132 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.namArbitrariedade ~= nil then self.namArbitrariedade:destroy(); self.namArbitrariedade = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.dataLink146 ~= nil then self.dataLink146:destroy(); self.dataLink146 = nil; end;
        if self.namPrudencia ~= nil then self.namPrudencia:destroy(); self.namPrudencia = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink125 ~= nil then self.dataLink125:destroy(); self.dataLink125 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.namJustica ~= nil then self.namJustica:destroy(); self.namJustica = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.dataLink176 ~= nil then self.dataLink176:destroy(); self.dataLink176 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.namCrueldade ~= nil then self.namCrueldade:destroy(); self.namCrueldade = nil; end;
        if self.namEgoismo ~= nil then self.namEgoismo:destroy(); self.namEgoismo = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink180 ~= nil then self.dataLink180:destroy(); self.dataLink180 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.dataLink124 ~= nil then self.dataLink124:destroy(); self.dataLink124 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.namCovardia ~= nil then self.namCovardia:destroy(); self.namCovardia = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.namVinganca ~= nil then self.namVinganca:destroy(); self.namVinganca = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink178 ~= nil then self.dataLink178:destroy(); self.dataLink178 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPendragon()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPendragon();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPendragon = {
    newEditor = newfrmPendragon, 
    new = newfrmPendragon, 
    name = "frmPendragon", 
    dataType = "thirteen.Pendragon", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Pendragon 5.2", 
    description=""};

frmPendragon = _frmPendragon;
Firecast.registrarForm(_frmPendragon);
Firecast.registrarDataType(_frmPendragon);

return _frmPendragon;
