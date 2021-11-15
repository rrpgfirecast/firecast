require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTeP()
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
    obj:setName("frmTeP");
    obj:setAlign("client");


		function CalcularVirtude(a)
			-- TRATANDO VARIÁVEIS
			a = a or "";
			CalibrarVirtudes(a);
			
			-- CAPTANDO SOMA DE BÔNUS
			local SomaRom = CalcularRomance();
			local SomaReligiao = SomarVirtudes();
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
		
		function CalcularRomance()
			-- INICIALIZANDO VARIÁVEIS
			local node = NDB.getRoot(sheet);
			local somaRoman = 0;
			
			-- CHECANDO QUANTAS VIRTUDES ACIMA DE 15
			if(tonumber(sheet.fldValCastidade) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValEnergia) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValPerdao) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValGenerosidade) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValHonestidade) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValJustica) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValMisericordia) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValModestia) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValEspiritualidade) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValPrudencia) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValTemperanca) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValConfianca) > 15) then somaRoman = somaRoman + 1; end;
			if(tonumber(sheet.fldValCoragem) > 15) then somaRoman = somaRoman + 1; end;
			
			-- SOMANDO QUANTAS PAIXÕES ACIMA DE 15
			somaRoman = somaRoman + node.countRom;
			
			-- LIMITANDO NÚMERO DE VIRTUDES E PAIXÕES ACIMA DE 15 PARA 3
			if(somaRoman > 3) then somaRoman = 3; end;
			
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
				somaRoman = somaRoman + 1; 
			end;
			
			return somaRoman;
		end;
		
		function SomarVirtudes()
			-- INICIALIZANDO VARIÁVEIS
			local tbReligiao = {};
			local a = 0;
			
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
				a = a + tbReligiao[i];
			end;
			
			return a;
		end;
		
		function CalibrarVirtudes(a)	
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
		end;
		
		function ContabilizarPaixoes()
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
    obj.rectangle1:setPadding({top = 10});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("☙ TRAÇOS");
    obj.label1:setWidth(115);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("#0080ff");
    obj.label1:setFontFamily("Palatino Linotype");
    obj.label1:setFontSize(20);
    obj.label1:setName("label1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(535);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setHeight(2);
    obj.rectangle2:setWidth(535);
    obj.rectangle2:setTop(25);
    obj.rectangle2:setColor("#0080ff");
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setWidth(650);
    obj.layout3:setHeight(600);
    obj.layout3:setTop(70);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setName("rectangle3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle3);
    obj.label2:setAlign("left");
    obj.label2:setWidth(228);
    obj.label2:setText("VIRTUDES");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("#cdcdcd");
    obj.label2:setFontFamily("Palatino Linotype");
    obj.label2:setFontSize(14);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(138);
    obj.label3:setText("VÍCIOS");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("#cdcdcd");
    obj.label3:setFontFamily("Palatino Linotype");
    obj.label3:setFontSize(14);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle3);
    obj.label4:setAlign("left");
    obj.label4:setWidth(422);
    obj.label4:setText("CUSTOMIZADOS");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("#cdcdcd");
    obj.label4:setFontFamily("Palatino Linotype");
    obj.label4:setFontSize(14);
    obj.label4:setName("label4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setName("rectangle4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle4);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(139);
    obj.layout4:setName("layout4");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout4);
    obj.imageCheckBox1:setField("fldChCastidade");
    obj.imageCheckBox1:setWidth(11);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox1:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox1:setMargins({right = 5});
    obj.imageCheckBox1:setHint("Traço Religioso");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.namCastidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namCastidade:setParent(obj.layout4);
    obj.namCastidade:setField("Castidade");
    obj.namCastidade:setName("namCastidade");
    obj.namCastidade:setAlign("none");
    obj.namCastidade:setTop(7);
    obj.namCastidade:setLeft(16);

    obj.namCastidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCastidadeB:setParent(obj.layout4);
    obj.namCastidadeB:setField("CastidadeB");
    obj.namCastidadeB:setName("namCastidadeB");
    obj.namCastidadeB:setAlign("none");
    obj.namCastidadeB:setTop(7);
    obj.namCastidadeB:setLeft(16);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setFields({'Castidade', 'CastidadeB'});
    obj.dataLink1:setDefaultValues({'Castidade', 'Castidade'});
    obj.dataLink1:setName("dataLink1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle4);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(89);
    obj.layout5:setName("layout5");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setField("fldValCastidade");
    obj.edit1:setType("number");
    obj.edit1:setMin(0);
    obj.edit1:setMax(20);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(25);
    obj.edit1:setName("edit1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setText("/");
    obj.label5:setWidth(8);
    obj.label5:setName("label5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setField("fldValLuxuria");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(20);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(25);
    obj.edit2:setName("edit2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle4);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(422);
    obj.layout6:setName("layout6");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout6);
    obj.imageCheckBox2:setField("fldChLuxuria");
    obj.imageCheckBox2:setWidth(11);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox2:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox2:setMargins({right = 5});
    obj.imageCheckBox2:setHint("Traço Religioso");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.namLuxuria = GUI.fromHandle(_obj_newObject("label"));
    obj.namLuxuria:setParent(obj.layout6);
    obj.namLuxuria:setField("Luxuria");
    obj.namLuxuria:setName("namLuxuria");
    obj.namLuxuria:setAlign("none");
    obj.namLuxuria:setTop(7);
    obj.namLuxuria:setLeft(16);

    obj.namLuxuriaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namLuxuriaB:setParent(obj.layout6);
    obj.namLuxuriaB:setField("LuxuriaB");
    obj.namLuxuriaB:setName("namLuxuriaB");
    obj.namLuxuriaB:setAlign("none");
    obj.namLuxuriaB:setTop(7);
    obj.namLuxuriaB:setLeft(16);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout6);
    obj.dataLink2:setFields({'Luxuria', 'LuxuriaB'});
    obj.dataLink2:setDefaultValues({'Luxúria', 'Luxúria'});
    obj.dataLink2:setName("dataLink2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setWidth(246);
    obj.edit3:setText("—");
    obj.edit3:setAlign("left");
    obj.edit3:setFontColor("#858585");
    obj.edit3:setMargins({left=120});
    obj.edit3:setName("edit3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout3);
    obj.dataLink3:setField("fldValCastidade");
    obj.dataLink3:setDefaultValue("10");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout3);
    obj.dataLink4:setField("fldValLuxuria");
    obj.dataLink4:setDefaultValue("10");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout3);
    obj.dataLink5:setFields({'fldChCastidade', 'fldChLuxuria'});
    obj.dataLink5:setName("dataLink5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setColor("#2E2E2E");
    obj.rectangle5:setName("rectangle5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle5);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(139);
    obj.layout7:setName("layout7");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout7);
    obj.imageCheckBox3:setField("fldChEnergia");
    obj.imageCheckBox3:setWidth(11);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox3:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox3:setMargins({right = 5});
    obj.imageCheckBox3:setHint("Traço Religioso");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.namEnergia = GUI.fromHandle(_obj_newObject("label"));
    obj.namEnergia:setParent(obj.layout7);
    obj.namEnergia:setField("Energia");
    obj.namEnergia:setName("namEnergia");
    obj.namEnergia:setAlign("none");
    obj.namEnergia:setTop(7);
    obj.namEnergia:setLeft(16);

    obj.namEnergiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEnergiaB:setParent(obj.layout7);
    obj.namEnergiaB:setField("EnergiaB");
    obj.namEnergiaB:setName("namEnergiaB");
    obj.namEnergiaB:setAlign("none");
    obj.namEnergiaB:setTop(7);
    obj.namEnergiaB:setLeft(16);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout7);
    obj.dataLink6:setFields({'Energia', 'EnergiaB'});
    obj.dataLink6:setDefaultValues({'Energia ♞', 'Energia ♞'});
    obj.dataLink6:setName("dataLink6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle5);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(89);
    obj.layout8:setName("layout8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setField("fldValEnergia");
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(20);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(25);
    obj.edit4:setName("edit4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout8);
    obj.label6:setText("/");
    obj.label6:setWidth(8);
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setField("fldValPreguica");
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(20);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(25);
    obj.edit5:setName("edit5");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle5);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(422);
    obj.layout9:setName("layout9");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout9);
    obj.imageCheckBox4:setField("fldChPreguica");
    obj.imageCheckBox4:setWidth(11);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox4:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox4:setMargins({right = 5});
    obj.imageCheckBox4:setHint("Traço Religioso");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.namPreguica = GUI.fromHandle(_obj_newObject("label"));
    obj.namPreguica:setParent(obj.layout9);
    obj.namPreguica:setField("Preguica");
    obj.namPreguica:setName("namPreguica");
    obj.namPreguica:setAlign("none");
    obj.namPreguica:setTop(7);
    obj.namPreguica:setLeft(16);

    obj.namPreguicaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPreguicaB:setParent(obj.layout9);
    obj.namPreguicaB:setField("PreguicaB");
    obj.namPreguicaB:setName("namPreguicaB");
    obj.namPreguicaB:setAlign("none");
    obj.namPreguicaB:setTop(7);
    obj.namPreguicaB:setLeft(16);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout9);
    obj.dataLink7:setFields({'Preguica', 'PreguicaB'});
    obj.dataLink7:setDefaultValues({'Preguiça', 'Preguiça'});
    obj.dataLink7:setName("dataLink7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setWidth(246);
    obj.edit6:setText("—");
    obj.edit6:setAlign("left");
    obj.edit6:setFontColor("#858585");
    obj.edit6:setMargins({left=120});
    obj.edit6:setName("edit6");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout3);
    obj.dataLink8:setField("fldValEnergia");
    obj.dataLink8:setDefaultValue("10");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout3);
    obj.dataLink9:setField("fldValPreguica");
    obj.dataLink9:setDefaultValue("10");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout3);
    obj.dataLink10:setFields({'fldChEnergia', 'fldChPreguica'});
    obj.dataLink10:setName("dataLink10");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout3);
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setName("rectangle6");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle6);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(139);
    obj.layout10:setName("layout10");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout10);
    obj.imageCheckBox5:setField("fldChPerdao");
    obj.imageCheckBox5:setWidth(11);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox5:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox5:setMargins({right = 5});
    obj.imageCheckBox5:setHint("Traço Religioso");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.namPerdao = GUI.fromHandle(_obj_newObject("label"));
    obj.namPerdao:setParent(obj.layout10);
    obj.namPerdao:setField("Perdao");
    obj.namPerdao:setName("namPerdao");
    obj.namPerdao:setAlign("none");
    obj.namPerdao:setTop(7);
    obj.namPerdao:setLeft(16);

    obj.namPerdaoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPerdaoB:setParent(obj.layout10);
    obj.namPerdaoB:setField("PerdaoB");
    obj.namPerdaoB:setName("namPerdaoB");
    obj.namPerdaoB:setAlign("none");
    obj.namPerdaoB:setTop(7);
    obj.namPerdaoB:setLeft(16);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout10);
    obj.dataLink11:setFields({'Perdao', 'PerdaoB'});
    obj.dataLink11:setDefaultValues({'Perdão', 'Perdão'});
    obj.dataLink11:setName("dataLink11");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle6);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(89);
    obj.layout11:setName("layout11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout11);
    obj.edit7:setField("fldValPerdao");
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(20);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(25);
    obj.edit7:setName("edit7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout11);
    obj.label7:setText("/");
    obj.label7:setWidth(8);
    obj.label7:setName("label7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setField("fldValVinganca");
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(20);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(25);
    obj.edit8:setName("edit8");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle6);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(422);
    obj.layout12:setName("layout12");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout12);
    obj.imageCheckBox6:setField("fldChVinganca");
    obj.imageCheckBox6:setWidth(11);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox6:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox6:setMargins({right = 5});
    obj.imageCheckBox6:setHint("Traço Religioso");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.namVinganca = GUI.fromHandle(_obj_newObject("label"));
    obj.namVinganca:setParent(obj.layout12);
    obj.namVinganca:setField("Vinganca");
    obj.namVinganca:setName("namVinganca");
    obj.namVinganca:setAlign("none");
    obj.namVinganca:setTop(7);
    obj.namVinganca:setLeft(16);

    obj.namVingancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namVingancaB:setParent(obj.layout12);
    obj.namVingancaB:setField("VingancaB");
    obj.namVingancaB:setName("namVingancaB");
    obj.namVingancaB:setAlign("none");
    obj.namVingancaB:setTop(7);
    obj.namVingancaB:setLeft(16);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout12);
    obj.dataLink12:setFields({'Vinganca', 'VingancaB'});
    obj.dataLink12:setDefaultValues({'Vingança', 'Vingança'});
    obj.dataLink12:setName("dataLink12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setWidth(246);
    obj.edit9:setText("—");
    obj.edit9:setAlign("left");
    obj.edit9:setFontColor("#858585");
    obj.edit9:setMargins({left=120});
    obj.edit9:setName("edit9");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout3);
    obj.dataLink13:setField("fldValPerdao");
    obj.dataLink13:setDefaultValue("10");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout3);
    obj.dataLink14:setField("fldValVinganca");
    obj.dataLink14:setDefaultValue("10");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout3);
    obj.dataLink15:setFields({'fldChPerdao', 'fldChVinganca'});
    obj.dataLink15:setName("dataLink15");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setColor("#2E2E2E");
    obj.rectangle7:setName("rectangle7");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle7);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(139);
    obj.layout13:setName("layout13");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout13);
    obj.imageCheckBox7:setField("fldChGenerosidade");
    obj.imageCheckBox7:setWidth(11);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox7:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox7:setMargins({right = 5});
    obj.imageCheckBox7:setHint("Traço Religioso");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.namGenerosidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namGenerosidade:setParent(obj.layout13);
    obj.namGenerosidade:setField("Generosidade");
    obj.namGenerosidade:setName("namGenerosidade");
    obj.namGenerosidade:setAlign("none");
    obj.namGenerosidade:setTop(7);
    obj.namGenerosidade:setLeft(16);

    obj.namGenerosidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namGenerosidadeB:setParent(obj.layout13);
    obj.namGenerosidadeB:setField("GenerosidadeB");
    obj.namGenerosidadeB:setName("namGenerosidadeB");
    obj.namGenerosidadeB:setAlign("none");
    obj.namGenerosidadeB:setTop(7);
    obj.namGenerosidadeB:setLeft(16);

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout13);
    obj.dataLink16:setFields({'Generosidade', 'GenerosidadeB'});
    obj.dataLink16:setDefaultValues({'Generosidade ♞', 'Generosidade ♞'});
    obj.dataLink16:setName("dataLink16");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle7);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(89);
    obj.layout14:setName("layout14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10:setField("fldValGenerosidade");
    obj.edit10:setType("number");
    obj.edit10:setMin(0);
    obj.edit10:setMax(20);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(25);
    obj.edit10:setName("edit10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout14);
    obj.label8:setText("/");
    obj.label8:setWidth(8);
    obj.label8:setName("label8");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setField("fldValEgoismo");
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setMax(20);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(25);
    obj.edit11:setName("edit11");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle7);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(422);
    obj.layout15:setName("layout15");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout15);
    obj.imageCheckBox8:setField("fldChEgoismo");
    obj.imageCheckBox8:setWidth(11);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox8:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox8:setMargins({right = 5});
    obj.imageCheckBox8:setHint("Traço Religioso");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.namEgoismo = GUI.fromHandle(_obj_newObject("label"));
    obj.namEgoismo:setParent(obj.layout15);
    obj.namEgoismo:setField("Egoismo");
    obj.namEgoismo:setName("namEgoismo");
    obj.namEgoismo:setAlign("none");
    obj.namEgoismo:setTop(7);
    obj.namEgoismo:setLeft(16);

    obj.namEgoismoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEgoismoB:setParent(obj.layout15);
    obj.namEgoismoB:setField("EgoismoB");
    obj.namEgoismoB:setName("namEgoismoB");
    obj.namEgoismoB:setAlign("none");
    obj.namEgoismoB:setTop(7);
    obj.namEgoismoB:setLeft(16);

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout15);
    obj.dataLink17:setFields({'Egoismo', 'EgoismoB'});
    obj.dataLink17:setDefaultValues({'Egoísmo', 'Egoísmo'});
    obj.dataLink17:setName("dataLink17");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setWidth(246);
    obj.edit12:setText("—");
    obj.edit12:setAlign("left");
    obj.edit12:setFontColor("#858585");
    obj.edit12:setMargins({left=120});
    obj.edit12:setName("edit12");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout3);
    obj.dataLink18:setField("fldValGenerosidade");
    obj.dataLink18:setDefaultValue("10");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout3);
    obj.dataLink19:setField("fldValEgoismo");
    obj.dataLink19:setDefaultValue("10");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout3);
    obj.dataLink20:setFields({'fldChGenerosidade', 'fldChEgoismo'});
    obj.dataLink20:setName("dataLink20");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setName("rectangle8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle8);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(139);
    obj.layout16:setName("layout16");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout16);
    obj.imageCheckBox9:setField("fldChHonestidade");
    obj.imageCheckBox9:setWidth(11);
    obj.imageCheckBox9:setAlign("left");
    obj.imageCheckBox9:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox9:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox9:setMargins({right = 5});
    obj.imageCheckBox9:setHint("Traço Religioso");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.namHonestidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namHonestidade:setParent(obj.layout16);
    obj.namHonestidade:setField("Honestidade");
    obj.namHonestidade:setName("namHonestidade");
    obj.namHonestidade:setAlign("none");
    obj.namHonestidade:setTop(7);
    obj.namHonestidade:setLeft(16);

    obj.namHonestidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namHonestidadeB:setParent(obj.layout16);
    obj.namHonestidadeB:setField("HonestidadeB");
    obj.namHonestidadeB:setName("namHonestidadeB");
    obj.namHonestidadeB:setAlign("none");
    obj.namHonestidadeB:setTop(7);
    obj.namHonestidadeB:setLeft(16);

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout16);
    obj.dataLink21:setFields({'Honestidade', 'HonestidadeB'});
    obj.dataLink21:setDefaultValues({'Honestidade', 'Honestidade'});
    obj.dataLink21:setName("dataLink21");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle8);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(89);
    obj.layout17:setName("layout17");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout17);
    obj.edit13:setField("fldValHonestidade");
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setMax(20);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(25);
    obj.edit13:setName("edit13");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout17);
    obj.label9:setText("/");
    obj.label9:setWidth(8);
    obj.label9:setName("label9");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout17);
    obj.edit14:setField("fldValMalicia");
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setMax(20);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(25);
    obj.edit14:setName("edit14");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle8);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(422);
    obj.layout18:setName("layout18");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout18);
    obj.imageCheckBox10:setField("fldChMalicia");
    obj.imageCheckBox10:setWidth(11);
    obj.imageCheckBox10:setAlign("left");
    obj.imageCheckBox10:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox10:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox10:setMargins({right = 5});
    obj.imageCheckBox10:setHint("Traço Religioso");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.namMalicia = GUI.fromHandle(_obj_newObject("label"));
    obj.namMalicia:setParent(obj.layout18);
    obj.namMalicia:setField("Malicia");
    obj.namMalicia:setName("namMalicia");
    obj.namMalicia:setAlign("none");
    obj.namMalicia:setTop(7);
    obj.namMalicia:setLeft(16);

    obj.namMaliciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namMaliciaB:setParent(obj.layout18);
    obj.namMaliciaB:setField("MaliciaB");
    obj.namMaliciaB:setName("namMaliciaB");
    obj.namMaliciaB:setAlign("none");
    obj.namMaliciaB:setTop(7);
    obj.namMaliciaB:setLeft(16);

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout18);
    obj.dataLink22:setFields({'Malicia', 'MaliciaB'});
    obj.dataLink22:setDefaultValues({'Malícia', 'Malícia'});
    obj.dataLink22:setName("dataLink22");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout18);
    obj.edit15:setWidth(246);
    obj.edit15:setText("—");
    obj.edit15:setAlign("left");
    obj.edit15:setFontColor("#858585");
    obj.edit15:setMargins({left=120});
    obj.edit15:setName("edit15");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout3);
    obj.dataLink23:setField("fldValHonestidade");
    obj.dataLink23:setDefaultValue("10");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout3);
    obj.dataLink24:setField("fldValMalicia");
    obj.dataLink24:setDefaultValue("10");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout3);
    obj.dataLink25:setFields({'fldChHonestidade', 'fldChMalicia'});
    obj.dataLink25:setName("dataLink25");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setColor("#2E2E2E");
    obj.rectangle9:setName("rectangle9");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle9);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(139);
    obj.layout19:setName("layout19");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout19);
    obj.imageCheckBox11:setField("fldChJustica");
    obj.imageCheckBox11:setWidth(11);
    obj.imageCheckBox11:setAlign("left");
    obj.imageCheckBox11:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox11:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox11:setMargins({right = 5});
    obj.imageCheckBox11:setHint("Traço Religioso");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.namJustica = GUI.fromHandle(_obj_newObject("label"));
    obj.namJustica:setParent(obj.layout19);
    obj.namJustica:setField("Justica");
    obj.namJustica:setName("namJustica");
    obj.namJustica:setAlign("none");
    obj.namJustica:setTop(7);
    obj.namJustica:setLeft(16);

    obj.namJusticaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namJusticaB:setParent(obj.layout19);
    obj.namJusticaB:setField("JusticaB");
    obj.namJusticaB:setName("namJusticaB");
    obj.namJusticaB:setAlign("none");
    obj.namJusticaB:setTop(7);
    obj.namJusticaB:setLeft(16);

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout19);
    obj.dataLink26:setFields({'Justica', 'JusticaB'});
    obj.dataLink26:setDefaultValues({'Justiça ♞', 'Justiça ♞'});
    obj.dataLink26:setName("dataLink26");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle9);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(89);
    obj.layout20:setName("layout20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout20);
    obj.edit16:setField("fldValJustica");
    obj.edit16:setType("number");
    obj.edit16:setMin(0);
    obj.edit16:setMax(20);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(25);
    obj.edit16:setName("edit16");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout20);
    obj.label10:setText("/");
    obj.label10:setWidth(8);
    obj.label10:setName("label10");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout20);
    obj.edit17:setField("fldValArbitrariedade");
    obj.edit17:setType("number");
    obj.edit17:setMin(0);
    obj.edit17:setMax(20);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(25);
    obj.edit17:setName("edit17");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle9);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(422);
    obj.layout21:setName("layout21");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout21);
    obj.imageCheckBox12:setField("fldChArbitrariedade");
    obj.imageCheckBox12:setWidth(11);
    obj.imageCheckBox12:setAlign("left");
    obj.imageCheckBox12:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox12:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox12:setMargins({right = 5});
    obj.imageCheckBox12:setHint("Traço Religioso");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.namArbitrariedade = GUI.fromHandle(_obj_newObject("label"));
    obj.namArbitrariedade:setParent(obj.layout21);
    obj.namArbitrariedade:setField("Arbitrariedade");
    obj.namArbitrariedade:setName("namArbitrariedade");
    obj.namArbitrariedade:setAlign("none");
    obj.namArbitrariedade:setTop(7);
    obj.namArbitrariedade:setLeft(16);

    obj.namArbitrariedadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namArbitrariedadeB:setParent(obj.layout21);
    obj.namArbitrariedadeB:setField("ArbitrariedadeB");
    obj.namArbitrariedadeB:setName("namArbitrariedadeB");
    obj.namArbitrariedadeB:setAlign("none");
    obj.namArbitrariedadeB:setTop(7);
    obj.namArbitrariedadeB:setLeft(16);

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout21);
    obj.dataLink27:setFields({'Arbitrariedade', 'ArbitrariedadeB'});
    obj.dataLink27:setDefaultValues({'Arbitrariedade', 'Arbitrariedade'});
    obj.dataLink27:setName("dataLink27");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout21);
    obj.edit18:setWidth(246);
    obj.edit18:setText("—");
    obj.edit18:setAlign("left");
    obj.edit18:setFontColor("#858585");
    obj.edit18:setMargins({left=120});
    obj.edit18:setName("edit18");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout3);
    obj.dataLink28:setField("fldValJustica");
    obj.dataLink28:setDefaultValue("10");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout3);
    obj.dataLink29:setField("fldValArbitrariedade");
    obj.dataLink29:setDefaultValue("10");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout3);
    obj.dataLink30:setFields({'fldChJustica', 'fldChArbitrariedade'});
    obj.dataLink30:setName("dataLink30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setName("rectangle10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle10);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(139);
    obj.layout22:setName("layout22");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout22);
    obj.imageCheckBox13:setField("fldChMisericordia");
    obj.imageCheckBox13:setWidth(11);
    obj.imageCheckBox13:setAlign("left");
    obj.imageCheckBox13:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox13:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox13:setMargins({right = 5});
    obj.imageCheckBox13:setHint("Traço Religioso");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.namMisericordia = GUI.fromHandle(_obj_newObject("label"));
    obj.namMisericordia:setParent(obj.layout22);
    obj.namMisericordia:setField("Misericordia");
    obj.namMisericordia:setName("namMisericordia");
    obj.namMisericordia:setAlign("none");
    obj.namMisericordia:setTop(7);
    obj.namMisericordia:setLeft(16);

    obj.namMisericordiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namMisericordiaB:setParent(obj.layout22);
    obj.namMisericordiaB:setField("MisericordiaB");
    obj.namMisericordiaB:setName("namMisericordiaB");
    obj.namMisericordiaB:setAlign("none");
    obj.namMisericordiaB:setTop(7);
    obj.namMisericordiaB:setLeft(16);

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout22);
    obj.dataLink31:setFields({'Misericordia', 'MisericordiaB'});
    obj.dataLink31:setDefaultValues({'Misericórdia ♞', 'Misericórdia ♞'});
    obj.dataLink31:setName("dataLink31");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle10);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(89);
    obj.layout23:setName("layout23");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout23);
    obj.edit19:setField("fldValMisericordia");
    obj.edit19:setType("number");
    obj.edit19:setMin(0);
    obj.edit19:setMax(20);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(25);
    obj.edit19:setName("edit19");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout23);
    obj.label11:setText("/");
    obj.label11:setWidth(8);
    obj.label11:setName("label11");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout23);
    obj.edit20:setField("fldValCrueldade");
    obj.edit20:setType("number");
    obj.edit20:setMin(0);
    obj.edit20:setMax(20);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(25);
    obj.edit20:setName("edit20");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle10);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(422);
    obj.layout24:setName("layout24");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout24);
    obj.imageCheckBox14:setField("fldChCrueldade");
    obj.imageCheckBox14:setWidth(11);
    obj.imageCheckBox14:setAlign("left");
    obj.imageCheckBox14:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox14:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox14:setMargins({right = 5});
    obj.imageCheckBox14:setHint("Traço Religioso");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.namCrueldade = GUI.fromHandle(_obj_newObject("label"));
    obj.namCrueldade:setParent(obj.layout24);
    obj.namCrueldade:setField("Crueldade");
    obj.namCrueldade:setName("namCrueldade");
    obj.namCrueldade:setAlign("none");
    obj.namCrueldade:setTop(7);
    obj.namCrueldade:setLeft(16);

    obj.namCrueldadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCrueldadeB:setParent(obj.layout24);
    obj.namCrueldadeB:setField("CrueldadeB");
    obj.namCrueldadeB:setName("namCrueldadeB");
    obj.namCrueldadeB:setAlign("none");
    obj.namCrueldadeB:setTop(7);
    obj.namCrueldadeB:setLeft(16);

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout24);
    obj.dataLink32:setFields({'Crueldade', 'CrueldadeB'});
    obj.dataLink32:setDefaultValues({'Crueldade', 'Crueldade'});
    obj.dataLink32:setName("dataLink32");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout24);
    obj.edit21:setWidth(246);
    obj.edit21:setText("—");
    obj.edit21:setAlign("left");
    obj.edit21:setFontColor("#858585");
    obj.edit21:setMargins({left=120});
    obj.edit21:setName("edit21");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout3);
    obj.dataLink33:setField("fldValMisericordia");
    obj.dataLink33:setDefaultValue("10");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout3);
    obj.dataLink34:setField("fldValCrueldade");
    obj.dataLink34:setDefaultValue("10");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout3);
    obj.dataLink35:setFields({'fldChMisericordia', 'fldChCrueldade'});
    obj.dataLink35:setName("dataLink35");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setColor("#2E2E2E");
    obj.rectangle11:setName("rectangle11");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle11);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(139);
    obj.layout25:setName("layout25");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout25);
    obj.imageCheckBox15:setField("fldChModestia");
    obj.imageCheckBox15:setWidth(11);
    obj.imageCheckBox15:setAlign("left");
    obj.imageCheckBox15:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox15:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox15:setMargins({right = 5});
    obj.imageCheckBox15:setHint("Traço Religioso");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.namModestia = GUI.fromHandle(_obj_newObject("label"));
    obj.namModestia:setParent(obj.layout25);
    obj.namModestia:setField("Modestia");
    obj.namModestia:setName("namModestia");
    obj.namModestia:setAlign("none");
    obj.namModestia:setTop(7);
    obj.namModestia:setLeft(16);

    obj.namModestiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namModestiaB:setParent(obj.layout25);
    obj.namModestiaB:setField("ModestiaB");
    obj.namModestiaB:setName("namModestiaB");
    obj.namModestiaB:setAlign("none");
    obj.namModestiaB:setTop(7);
    obj.namModestiaB:setLeft(16);

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout25);
    obj.dataLink36:setFields({'Modestia', 'ModestiaB'});
    obj.dataLink36:setDefaultValues({'Modéstia ♞', 'Modéstia ♞'});
    obj.dataLink36:setName("dataLink36");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle11);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(89);
    obj.layout26:setName("layout26");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout26);
    obj.edit22:setField("fldValModestia");
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setMax(20);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(25);
    obj.edit22:setName("edit22");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout26);
    obj.label12:setText("/");
    obj.label12:setWidth(8);
    obj.label12:setName("label12");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout26);
    obj.edit23:setField("fldValOrgulho");
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setMax(20);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(25);
    obj.edit23:setName("edit23");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle11);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(422);
    obj.layout27:setName("layout27");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout27);
    obj.imageCheckBox16:setField("fldChOrgulho");
    obj.imageCheckBox16:setWidth(11);
    obj.imageCheckBox16:setAlign("left");
    obj.imageCheckBox16:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox16:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox16:setMargins({right = 5});
    obj.imageCheckBox16:setHint("Traço Religioso");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.namOrgulho = GUI.fromHandle(_obj_newObject("label"));
    obj.namOrgulho:setParent(obj.layout27);
    obj.namOrgulho:setField("Orgulho");
    obj.namOrgulho:setName("namOrgulho");
    obj.namOrgulho:setAlign("none");
    obj.namOrgulho:setTop(7);
    obj.namOrgulho:setLeft(16);

    obj.namOrgulhoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namOrgulhoB:setParent(obj.layout27);
    obj.namOrgulhoB:setField("OrgulhoB");
    obj.namOrgulhoB:setName("namOrgulhoB");
    obj.namOrgulhoB:setAlign("none");
    obj.namOrgulhoB:setTop(7);
    obj.namOrgulhoB:setLeft(16);

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout27);
    obj.dataLink37:setFields({'Orgulho', 'OrgulhoB'});
    obj.dataLink37:setDefaultValues({'Orgulho', 'Orgulho'});
    obj.dataLink37:setName("dataLink37");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout27);
    obj.edit24:setWidth(246);
    obj.edit24:setText("—");
    obj.edit24:setAlign("left");
    obj.edit24:setFontColor("#858585");
    obj.edit24:setMargins({left=120});
    obj.edit24:setName("edit24");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout3);
    obj.dataLink38:setField("fldValModestia");
    obj.dataLink38:setDefaultValue("10");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout3);
    obj.dataLink39:setField("fldValOrgulho");
    obj.dataLink39:setDefaultValue("10");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout3);
    obj.dataLink40:setFields({'fldChModestia', 'fldChOrgulho'});
    obj.dataLink40:setName("dataLink40");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setName("rectangle12");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle12);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(139);
    obj.layout28:setName("layout28");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout28);
    obj.imageCheckBox17:setField("fldChEspiritualidade");
    obj.imageCheckBox17:setWidth(11);
    obj.imageCheckBox17:setAlign("left");
    obj.imageCheckBox17:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox17:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox17:setMargins({right = 5});
    obj.imageCheckBox17:setHint("Traço Religioso");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.namEspiritualidade = GUI.fromHandle(_obj_newObject("label"));
    obj.namEspiritualidade:setParent(obj.layout28);
    obj.namEspiritualidade:setField("Espiritualidade");
    obj.namEspiritualidade:setName("namEspiritualidade");
    obj.namEspiritualidade:setAlign("none");
    obj.namEspiritualidade:setTop(7);
    obj.namEspiritualidade:setLeft(16);

    obj.namEspiritualidadeB = GUI.fromHandle(_obj_newObject("label"));
    obj.namEspiritualidadeB:setParent(obj.layout28);
    obj.namEspiritualidadeB:setField("EspiritualidadeB");
    obj.namEspiritualidadeB:setName("namEspiritualidadeB");
    obj.namEspiritualidadeB:setAlign("none");
    obj.namEspiritualidadeB:setTop(7);
    obj.namEspiritualidadeB:setLeft(16);

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout28);
    obj.dataLink41:setFields({'Espiritualidade', 'EspiritualidadeB'});
    obj.dataLink41:setDefaultValues({'Espiritualidade', 'Espiritualidade'});
    obj.dataLink41:setName("dataLink41");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle12);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(89);
    obj.layout29:setName("layout29");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout29);
    obj.edit25:setField("fldValEspiritualidade");
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setMax(20);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(25);
    obj.edit25:setName("edit25");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout29);
    obj.label13:setText("/");
    obj.label13:setWidth(8);
    obj.label13:setName("label13");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout29);
    obj.edit26:setField("fldValCinismo");
    obj.edit26:setType("number");
    obj.edit26:setMin(0);
    obj.edit26:setMax(20);
    obj.edit26:setAlign("left");
    obj.edit26:setWidth(25);
    obj.edit26:setName("edit26");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle12);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(422);
    obj.layout30:setName("layout30");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout30);
    obj.imageCheckBox18:setField("fldChCinismo");
    obj.imageCheckBox18:setWidth(11);
    obj.imageCheckBox18:setAlign("left");
    obj.imageCheckBox18:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox18:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox18:setMargins({right = 5});
    obj.imageCheckBox18:setHint("Traço Religioso");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.namCinismo = GUI.fromHandle(_obj_newObject("label"));
    obj.namCinismo:setParent(obj.layout30);
    obj.namCinismo:setField("Cinismo");
    obj.namCinismo:setName("namCinismo");
    obj.namCinismo:setAlign("none");
    obj.namCinismo:setTop(7);
    obj.namCinismo:setLeft(16);

    obj.namCinismoB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCinismoB:setParent(obj.layout30);
    obj.namCinismoB:setField("CinismoB");
    obj.namCinismoB:setName("namCinismoB");
    obj.namCinismoB:setAlign("none");
    obj.namCinismoB:setTop(7);
    obj.namCinismoB:setLeft(16);

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout30);
    obj.dataLink42:setFields({'Cinismo', 'CinismoB'});
    obj.dataLink42:setDefaultValues({'Cinismo', 'Cinismo'});
    obj.dataLink42:setName("dataLink42");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout30);
    obj.edit27:setWidth(246);
    obj.edit27:setText("—");
    obj.edit27:setAlign("left");
    obj.edit27:setFontColor("#858585");
    obj.edit27:setMargins({left=120});
    obj.edit27:setName("edit27");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout3);
    obj.dataLink43:setField("fldValEspiritualidade");
    obj.dataLink43:setDefaultValue("10");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout3);
    obj.dataLink44:setField("fldValCinismo");
    obj.dataLink44:setDefaultValue("10");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout3);
    obj.dataLink45:setFields({'fldChEspiritualidade', 'fldChCinismo'});
    obj.dataLink45:setName("dataLink45");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setColor("#2E2E2E");
    obj.rectangle13:setName("rectangle13");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle13);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(139);
    obj.layout31:setName("layout31");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout31);
    obj.imageCheckBox19:setField("fldChPrudencia");
    obj.imageCheckBox19:setWidth(11);
    obj.imageCheckBox19:setAlign("left");
    obj.imageCheckBox19:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox19:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox19:setMargins({right = 5});
    obj.imageCheckBox19:setHint("Traço Religioso");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.namPrudencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namPrudencia:setParent(obj.layout31);
    obj.namPrudencia:setField("Prudencia");
    obj.namPrudencia:setName("namPrudencia");
    obj.namPrudencia:setAlign("none");
    obj.namPrudencia:setTop(7);
    obj.namPrudencia:setLeft(16);

    obj.namPrudenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namPrudenciaB:setParent(obj.layout31);
    obj.namPrudenciaB:setField("PrudenciaB");
    obj.namPrudenciaB:setName("namPrudenciaB");
    obj.namPrudenciaB:setAlign("none");
    obj.namPrudenciaB:setTop(7);
    obj.namPrudenciaB:setLeft(16);

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout31);
    obj.dataLink46:setFields({'Prudencia', 'PrudenciaB'});
    obj.dataLink46:setDefaultValues({'Prudência', 'Prudência'});
    obj.dataLink46:setName("dataLink46");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle13);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(89);
    obj.layout32:setName("layout32");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout32);
    obj.edit28:setField("fldValPrudencia");
    obj.edit28:setType("number");
    obj.edit28:setMin(0);
    obj.edit28:setMax(20);
    obj.edit28:setAlign("left");
    obj.edit28:setWidth(25);
    obj.edit28:setName("edit28");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout32);
    obj.label14:setText("/");
    obj.label14:setWidth(8);
    obj.label14:setName("label14");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout32);
    obj.edit29:setField("fldValImprudencia");
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setMax(20);
    obj.edit29:setAlign("left");
    obj.edit29:setWidth(25);
    obj.edit29:setName("edit29");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle13);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(422);
    obj.layout33:setName("layout33");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout33);
    obj.imageCheckBox20:setField("fldChImprudencia");
    obj.imageCheckBox20:setWidth(11);
    obj.imageCheckBox20:setAlign("left");
    obj.imageCheckBox20:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox20:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox20:setMargins({right = 5});
    obj.imageCheckBox20:setHint("Traço Religioso");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.namImprudencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namImprudencia:setParent(obj.layout33);
    obj.namImprudencia:setField("Imprudencia");
    obj.namImprudencia:setName("namImprudencia");
    obj.namImprudencia:setAlign("none");
    obj.namImprudencia:setTop(7);
    obj.namImprudencia:setLeft(16);

    obj.namImprudenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namImprudenciaB:setParent(obj.layout33);
    obj.namImprudenciaB:setField("ImprudenciaB");
    obj.namImprudenciaB:setName("namImprudenciaB");
    obj.namImprudenciaB:setAlign("none");
    obj.namImprudenciaB:setTop(7);
    obj.namImprudenciaB:setLeft(16);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout33);
    obj.dataLink47:setFields({'Imprudencia', 'ImprudenciaB'});
    obj.dataLink47:setDefaultValues({'Imprudência', 'Imprudência'});
    obj.dataLink47:setName("dataLink47");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout33);
    obj.edit30:setWidth(246);
    obj.edit30:setText("—");
    obj.edit30:setAlign("left");
    obj.edit30:setFontColor("#858585");
    obj.edit30:setMargins({left=120});
    obj.edit30:setName("edit30");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout3);
    obj.dataLink48:setField("fldValPrudencia");
    obj.dataLink48:setDefaultValue("10");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout3);
    obj.dataLink49:setField("fldValImprudencia");
    obj.dataLink49:setDefaultValue("10");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout3);
    obj.dataLink50:setFields({'fldChPrudencia', 'fldChImprudencia'});
    obj.dataLink50:setName("dataLink50");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setName("rectangle14");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle14);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(139);
    obj.layout34:setName("layout34");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout34);
    obj.imageCheckBox21:setField("fldChTemperanca");
    obj.imageCheckBox21:setWidth(11);
    obj.imageCheckBox21:setAlign("left");
    obj.imageCheckBox21:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox21:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox21:setMargins({right = 5});
    obj.imageCheckBox21:setHint("Traço Religioso");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.namTemperanca = GUI.fromHandle(_obj_newObject("label"));
    obj.namTemperanca:setParent(obj.layout34);
    obj.namTemperanca:setField("Temperanca");
    obj.namTemperanca:setName("namTemperanca");
    obj.namTemperanca:setAlign("none");
    obj.namTemperanca:setTop(7);
    obj.namTemperanca:setLeft(16);

    obj.namTemperancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namTemperancaB:setParent(obj.layout34);
    obj.namTemperancaB:setField("TemperancaB");
    obj.namTemperancaB:setName("namTemperancaB");
    obj.namTemperancaB:setAlign("none");
    obj.namTemperancaB:setTop(7);
    obj.namTemperancaB:setLeft(16);

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout34);
    obj.dataLink51:setFields({'Temperanca', 'TemperancaB'});
    obj.dataLink51:setDefaultValues({'Temperança', 'Temperança'});
    obj.dataLink51:setName("dataLink51");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle14);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(89);
    obj.layout35:setName("layout35");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout35);
    obj.edit31:setField("fldValTemperanca");
    obj.edit31:setType("number");
    obj.edit31:setMin(0);
    obj.edit31:setMax(20);
    obj.edit31:setAlign("left");
    obj.edit31:setWidth(25);
    obj.edit31:setName("edit31");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout35);
    obj.label15:setText("/");
    obj.label15:setWidth(8);
    obj.label15:setName("label15");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout35);
    obj.edit32:setField("fldValIndulgencia");
    obj.edit32:setType("number");
    obj.edit32:setMin(0);
    obj.edit32:setMax(20);
    obj.edit32:setAlign("left");
    obj.edit32:setWidth(25);
    obj.edit32:setName("edit32");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle14);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(422);
    obj.layout36:setName("layout36");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout36);
    obj.imageCheckBox22:setField("fldChIndulgencia");
    obj.imageCheckBox22:setWidth(11);
    obj.imageCheckBox22:setAlign("left");
    obj.imageCheckBox22:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox22:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox22:setMargins({right = 5});
    obj.imageCheckBox22:setHint("Traço Religioso");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.namIndulgencia = GUI.fromHandle(_obj_newObject("label"));
    obj.namIndulgencia:setParent(obj.layout36);
    obj.namIndulgencia:setField("Indulgencia");
    obj.namIndulgencia:setName("namIndulgencia");
    obj.namIndulgencia:setAlign("none");
    obj.namIndulgencia:setTop(7);
    obj.namIndulgencia:setLeft(16);

    obj.namIndulgenciaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namIndulgenciaB:setParent(obj.layout36);
    obj.namIndulgenciaB:setField("IndulgenciaB");
    obj.namIndulgenciaB:setName("namIndulgenciaB");
    obj.namIndulgenciaB:setAlign("none");
    obj.namIndulgenciaB:setTop(7);
    obj.namIndulgenciaB:setLeft(16);

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout36);
    obj.dataLink52:setFields({'Indulgencia', 'IndulgenciaB'});
    obj.dataLink52:setDefaultValues({'Indulgência', 'Indulgência'});
    obj.dataLink52:setName("dataLink52");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout36);
    obj.edit33:setWidth(246);
    obj.edit33:setText("—");
    obj.edit33:setAlign("left");
    obj.edit33:setFontColor("#858585");
    obj.edit33:setMargins({left=120});
    obj.edit33:setName("edit33");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout3);
    obj.dataLink53:setField("fldValTemperanca");
    obj.dataLink53:setDefaultValue("10");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout3);
    obj.dataLink54:setField("fldValIndulgencia");
    obj.dataLink54:setDefaultValue("10");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout3);
    obj.dataLink55:setFields({'fldChTemperanca', 'fldChIndulgencia'});
    obj.dataLink55:setName("dataLink55");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setColor("#2E2E2E");
    obj.rectangle15:setName("rectangle15");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle15);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(139);
    obj.layout37:setName("layout37");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout37);
    obj.imageCheckBox23:setField("fldChConfianca");
    obj.imageCheckBox23:setWidth(11);
    obj.imageCheckBox23:setAlign("left");
    obj.imageCheckBox23:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox23:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox23:setMargins({right = 5});
    obj.imageCheckBox23:setHint("Traço Religioso");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.namConfianca = GUI.fromHandle(_obj_newObject("label"));
    obj.namConfianca:setParent(obj.layout37);
    obj.namConfianca:setField("Confianca");
    obj.namConfianca:setName("namConfianca");
    obj.namConfianca:setAlign("none");
    obj.namConfianca:setTop(7);
    obj.namConfianca:setLeft(16);

    obj.namConfiancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namConfiancaB:setParent(obj.layout37);
    obj.namConfiancaB:setField("ConfiancaB");
    obj.namConfiancaB:setName("namConfiancaB");
    obj.namConfiancaB:setAlign("none");
    obj.namConfiancaB:setTop(7);
    obj.namConfiancaB:setLeft(16);

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout37);
    obj.dataLink56:setFields({'Confianca', 'ConfiancaB'});
    obj.dataLink56:setDefaultValues({'Confiança', 'Confiança'});
    obj.dataLink56:setName("dataLink56");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle15);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(89);
    obj.layout38:setName("layout38");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout38);
    obj.edit34:setField("fldValConfianca");
    obj.edit34:setType("number");
    obj.edit34:setMin(0);
    obj.edit34:setMax(20);
    obj.edit34:setAlign("left");
    obj.edit34:setWidth(25);
    obj.edit34:setName("edit34");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout38);
    obj.label16:setText("/");
    obj.label16:setWidth(8);
    obj.label16:setName("label16");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout38);
    obj.edit35:setField("fldValDesconfianca");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setMax(20);
    obj.edit35:setAlign("left");
    obj.edit35:setWidth(25);
    obj.edit35:setName("edit35");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle15);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(422);
    obj.layout39:setName("layout39");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout39);
    obj.imageCheckBox24:setField("fldChDesconfianca");
    obj.imageCheckBox24:setWidth(11);
    obj.imageCheckBox24:setAlign("left");
    obj.imageCheckBox24:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox24:setImageUnchecked("/images/cross-off.png");
    obj.imageCheckBox24:setMargins({right = 5});
    obj.imageCheckBox24:setHint("Traço Religioso");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.namDesconfianca = GUI.fromHandle(_obj_newObject("label"));
    obj.namDesconfianca:setParent(obj.layout39);
    obj.namDesconfianca:setField("Desconfianca");
    obj.namDesconfianca:setName("namDesconfianca");
    obj.namDesconfianca:setAlign("none");
    obj.namDesconfianca:setTop(7);
    obj.namDesconfianca:setLeft(16);

    obj.namDesconfiancaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namDesconfiancaB:setParent(obj.layout39);
    obj.namDesconfiancaB:setField("DesconfiancaB");
    obj.namDesconfiancaB:setName("namDesconfiancaB");
    obj.namDesconfiancaB:setAlign("none");
    obj.namDesconfiancaB:setTop(7);
    obj.namDesconfiancaB:setLeft(16);

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout39);
    obj.dataLink57:setFields({'Desconfianca', 'DesconfiancaB'});
    obj.dataLink57:setDefaultValues({'Desconfiança', 'Desconfiança'});
    obj.dataLink57:setName("dataLink57");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout39);
    obj.edit36:setWidth(246);
    obj.edit36:setText("—");
    obj.edit36:setAlign("left");
    obj.edit36:setFontColor("#858585");
    obj.edit36:setMargins({left=120});
    obj.edit36:setName("edit36");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout3);
    obj.dataLink58:setField("fldValConfianca");
    obj.dataLink58:setDefaultValue("10");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout3);
    obj.dataLink59:setField("fldValDesconfianca");
    obj.dataLink59:setDefaultValue("10");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout3);
    obj.dataLink60:setFields({'fldChConfianca', 'fldChDesconfianca'});
    obj.dataLink60:setName("dataLink60");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setColor("transparent");
    obj.rectangle16:setName("rectangle16");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle16);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(139);
    obj.layout40:setName("layout40");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout40);
    obj.imageCheckBox25:setField("fldChCoragem");
    obj.imageCheckBox25:setWidth(11);
    obj.imageCheckBox25:setAlign("left");
    obj.imageCheckBox25:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox25:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox25:setMargins({right = 5});
    obj.imageCheckBox25:setHint("Traço Religioso");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.namCoragem = GUI.fromHandle(_obj_newObject("label"));
    obj.namCoragem:setParent(obj.layout40);
    obj.namCoragem:setField("Coragem");
    obj.namCoragem:setName("namCoragem");
    obj.namCoragem:setAlign("none");
    obj.namCoragem:setTop(7);
    obj.namCoragem:setLeft(16);

    obj.namCoragemB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCoragemB:setParent(obj.layout40);
    obj.namCoragemB:setField("CoragemB");
    obj.namCoragemB:setName("namCoragemB");
    obj.namCoragemB:setAlign("none");
    obj.namCoragemB:setTop(7);
    obj.namCoragemB:setLeft(16);

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout40);
    obj.dataLink61:setFields({'Coragem', 'CoragemB'});
    obj.dataLink61:setDefaultValues({'Coragem ♞', 'Coragem ♞'});
    obj.dataLink61:setName("dataLink61");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle16);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(89);
    obj.layout41:setName("layout41");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout41);
    obj.edit37:setField("fldValCoragem");
    obj.edit37:setType("number");
    obj.edit37:setMin(0);
    obj.edit37:setMax(20);
    obj.edit37:setAlign("left");
    obj.edit37:setWidth(25);
    obj.edit37:setName("edit37");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout41);
    obj.label17:setText("/");
    obj.label17:setWidth(8);
    obj.label17:setName("label17");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout41);
    obj.edit38:setField("fldValCovardia");
    obj.edit38:setType("number");
    obj.edit38:setMin(0);
    obj.edit38:setMax(20);
    obj.edit38:setAlign("left");
    obj.edit38:setWidth(25);
    obj.edit38:setName("edit38");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle16);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(422);
    obj.layout42:setName("layout42");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout42);
    obj.imageCheckBox26:setField("fldChCovardia");
    obj.imageCheckBox26:setWidth(11);
    obj.imageCheckBox26:setAlign("left");
    obj.imageCheckBox26:setImageChecked("/images/cross-on.png");
    obj.imageCheckBox26:setImageUnchecked("/images/cross-offd.png");
    obj.imageCheckBox26:setMargins({right = 5});
    obj.imageCheckBox26:setHint("Traço Religioso");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.namCovardia = GUI.fromHandle(_obj_newObject("label"));
    obj.namCovardia:setParent(obj.layout42);
    obj.namCovardia:setField("Covardia");
    obj.namCovardia:setName("namCovardia");
    obj.namCovardia:setAlign("none");
    obj.namCovardia:setTop(7);
    obj.namCovardia:setLeft(16);

    obj.namCovardiaB = GUI.fromHandle(_obj_newObject("label"));
    obj.namCovardiaB:setParent(obj.layout42);
    obj.namCovardiaB:setField("CovardiaB");
    obj.namCovardiaB:setName("namCovardiaB");
    obj.namCovardiaB:setAlign("none");
    obj.namCovardiaB:setTop(7);
    obj.namCovardiaB:setLeft(16);

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout42);
    obj.dataLink62:setFields({'Covardia', 'CovardiaB'});
    obj.dataLink62:setDefaultValues({'Covardia', 'Covardia'});
    obj.dataLink62:setName("dataLink62");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout42);
    obj.edit39:setWidth(246);
    obj.edit39:setText("—");
    obj.edit39:setAlign("left");
    obj.edit39:setFontColor("#858585");
    obj.edit39:setMargins({left=120});
    obj.edit39:setName("edit39");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout3);
    obj.dataLink63:setField("fldValCoragem");
    obj.dataLink63:setDefaultValue("10");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout3);
    obj.dataLink64:setField("fldValCovardia");
    obj.dataLink64:setDefaultValue("10");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout3);
    obj.dataLink65:setFields({'fldChCoragem', 'fldChCovardia'});
    obj.dataLink65:setName("dataLink65");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setAlign("top");
    obj.layout43:setMargins({left = 40, top = 455});
    obj.layout43:setHeight(90);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setName("layout44");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout44);
    obj.label18:setText("Bônus Honrado:");
    obj.label18:setWidth(139);
    obj.label18:setHitTest(true);
    obj.label18:setHint("+3 de Armadura");
    obj.label18:setName("label18");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(89);
    obj.layout45:setName("layout45");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout45);
    obj.label19:setField("fldSomaHonra");
    obj.label19:setAlign("left");
    obj.label19:setWidth(25);
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout45);
    obj.label20:setText("/");
    obj.label20:setWidth(10);
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout45);
    obj.label21:setText("80");
    obj.label21:setAlign("left");
    obj.label21:setWidth(25);
    obj.label21:setName("label21");

    obj.flagHonra = GUI.fromHandle(_obj_newObject("label"));
    obj.flagHonra:setParent(obj.layout44);
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

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout43);
    obj.layout46:setName("layout46");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout46);
    obj.label22:setText("Bônus Religioso:");
    obj.label22:setWidth(139);
    obj.label22:setHitTest(true);
    obj.label22:setHint("1 rerolagem por Aventura");
    obj.label22:setName("label22");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(89);
    obj.layout47:setName("layout47");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout47);
    obj.label23:setField("fldSomaReligiao");
    obj.label23:setAlign("left");
    obj.label23:setWidth(25);
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout47);
    obj.label24:setText("/");
    obj.label24:setWidth(10);
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout47);
    obj.label25:setText("80");
    obj.label25:setAlign("left");
    obj.label25:setWidth(25);
    obj.label25:setName("label25");

    obj.flagReli = GUI.fromHandle(_obj_newObject("label"));
    obj.flagReli:setParent(obj.layout46);
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

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setName("layout48");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout48);
    obj.label26:setText("Bônus Romântico:");
    obj.label26:setWidth(139);
    obj.label26:setHitTest(true);
    obj.label26:setHint("Bônus de Paixões dobrados");
    obj.label26:setName("label26");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(89);
    obj.layout49:setName("layout49");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout49);
    obj.label27:setField("fldSomaRomance");
    obj.label27:setAlign("left");
    obj.label27:setWidth(25);
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout49);
    obj.label28:setText("/");
    obj.label28:setWidth(10);
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout49);
    obj.label29:setText("04");
    obj.label29:setAlign("left");
    obj.label29:setWidth(25);
    obj.label29:setName("label29");

    obj.flagRom = GUI.fromHandle(_obj_newObject("label"));
    obj.flagRom:setParent(obj.layout48);
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

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout43);
    obj.dataLink66:setFields({'fldSomaHonra', 'fldSomaReligiao', 'fldSomaRomance'});
    obj.dataLink66:setDefaultValues({'00', '00', '00'});
    obj.dataLink66:setName("dataLink66");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setAlign("top");
    obj.layout50:setMargins({top=20});
    obj.layout50:setName("layout50");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout50);
    obj.label30:setAlign("left");
    obj.label30:setText("☙ PAIXÕES");
    obj.label30:setWidth(120);
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setFontColor("#0080ff");
    obj.label30:setFontFamily("Palatino Linotype");
    obj.label30:setFontSize(20);
    obj.label30:setName("label30");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(535);
    obj.layout51:setName("layout51");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout51);
    obj.rectangle17:setHeight(2);
    obj.rectangle17:setWidth(530);
    obj.rectangle17:setTop(25);
    obj.rectangle17:setColor("#0080ff");
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle1);
    obj.rectangle18:setName("rectangle18");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle18);
    obj.label31:setAlign("left");
    obj.label31:setWidth(215);
    obj.label31:setText("PAIXÃO");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setFontColor("#cdcdcd");
    obj.label31:setFontFamily("Palatino Linotype");
    obj.label31:setFontSize(14);
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle18);
    obj.label32:setAlign("left");
    obj.label32:setWidth(80);
    obj.label32:setText("VALOR");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setFontColor("#cdcdcd");
    obj.label32:setFontFamily("Palatino Linotype");
    obj.label32:setFontSize(14);
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle18);
    obj.label33:setAlign("left");
    obj.label33:setWidth(215);
    obj.label33:setText("PAIXÃO");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setFontColor("#cdcdcd");
    obj.label33:setFontFamily("Palatino Linotype");
    obj.label33:setFontSize(14);
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle18);
    obj.label34:setAlign("left");
    obj.label34:setWidth(80);
    obj.label34:setText("VALOR");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setFontColor("#cdcdcd");
    obj.label34:setFontFamily("Palatino Linotype");
    obj.label34:setFontSize(14);
    obj.label34:setName("label34");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setAlign("top");
    obj.layout52:setMargins({left = 40});
    obj.layout52:setHeight(600);
    obj.layout52:setName("layout52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setWidth(635);
    obj.layout53:setHeight(600);
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(635);
    obj.layout54:setName("layout54");

    obj.rclPaixoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPaixoes:setParent(obj.layout54);
    obj.rclPaixoes:setWidth(635);
    obj.rclPaixoes:setMinQt(4);
    obj.rclPaixoes:setLayout("verticalTiles");
    obj.rclPaixoes:setName("rclPaixoes");
    obj.rclPaixoes:setField("fldPaixoes");
    obj.rclPaixoes:setTemplateForm("paixoes");
    obj.rclPaixoes:setAutoHeight(true);

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout53);
    obj.layout55:setAlign("right");
    obj.layout55:setHeight(600);
    obj.layout55:setName("layout55");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout55);
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Nova Paixão");
    obj.button1:setName("button1");

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            if (sheet ~= nil) then CalcularVirtude('virtude'); end;
        end, obj);

    obj._e_event1 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event2 = obj.dataLink4:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event3 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event4 = obj.dataLink8:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event5 = obj.dataLink9:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event6 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event7 = obj.dataLink13:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event8 = obj.dataLink14:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event9 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event10 = obj.dataLink18:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event11 = obj.dataLink19:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event12 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event13 = obj.dataLink23:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event14 = obj.dataLink24:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event15 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event16 = obj.dataLink28:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event17 = obj.dataLink29:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event18 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event19 = obj.dataLink33:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event20 = obj.dataLink34:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event21 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event22 = obj.dataLink38:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event23 = obj.dataLink39:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event24 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event25 = obj.dataLink43:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event26 = obj.dataLink44:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event27 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event28 = obj.dataLink48:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event29 = obj.dataLink49:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event30 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event31 = obj.dataLink53:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event32 = obj.dataLink54:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event33 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event34 = obj.dataLink58:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event35 = obj.dataLink59:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event36 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event37 = obj.dataLink63:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("virtude"); CalcularGloriaAnual();
        end, obj);

    obj._e_event38 = obj.dataLink64:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude("vicio"); CalcularGloriaAnual();
        end, obj);

    obj._e_event39 = obj.dataLink65:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet == nil) then return; end;
            					CalcularVirtude(); CalcularGloriaAnual();
        end, obj);

    obj._e_event40 = obj.rclPaixoes:addEventListener("onSelect",
        function (_)
            self.rclPaixoes:sort();
        end, obj);

    obj._e_event41 = obj.rclPaixoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomePX, nodeB.nomePX);
        end, obj);

    obj._e_event42 = obj.rclPaixoes:addEventListener("onSelect",
        function (_)
            ContabilizarPaixoes();
        end, obj);

    obj._e_event43 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclPaixoes:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.namMisericordiaB ~= nil then self.namMisericordiaB:destroy(); self.namMisericordiaB = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flagRom ~= nil then self.flagRom:destroy(); self.flagRom = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.namVingancaB ~= nil then self.namVingancaB:destroy(); self.namVingancaB = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.namEgoismoB ~= nil then self.namEgoismoB:destroy(); self.namEgoismoB = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.namOrgulhoB ~= nil then self.namOrgulhoB:destroy(); self.namOrgulhoB = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.namDesconfiancaB ~= nil then self.namDesconfiancaB:destroy(); self.namDesconfiancaB = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.namCastidade ~= nil then self.namCastidade:destroy(); self.namCastidade = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.namHonestidadeB ~= nil then self.namHonestidadeB:destroy(); self.namHonestidadeB = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.namGenerosidade ~= nil then self.namGenerosidade:destroy(); self.namGenerosidade = nil; end;
        if self.namModestia ~= nil then self.namModestia:destroy(); self.namModestia = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.namIndulgenciaB ~= nil then self.namIndulgenciaB:destroy(); self.namIndulgenciaB = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.namCoragemB ~= nil then self.namCoragemB:destroy(); self.namCoragemB = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.namCrueldadeB ~= nil then self.namCrueldadeB:destroy(); self.namCrueldadeB = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.namEspiritualidadeB ~= nil then self.namEspiritualidadeB:destroy(); self.namEspiritualidadeB = nil; end;
        if self.namMalicia ~= nil then self.namMalicia:destroy(); self.namMalicia = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rclPaixoes ~= nil then self.rclPaixoes:destroy(); self.rclPaixoes = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.namPreguica ~= nil then self.namPreguica:destroy(); self.namPreguica = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.namCoragem ~= nil then self.namCoragem:destroy(); self.namCoragem = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flagReli ~= nil then self.flagReli:destroy(); self.flagReli = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.namIndulgencia ~= nil then self.namIndulgencia:destroy(); self.namIndulgencia = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.namMaliciaB ~= nil then self.namMaliciaB:destroy(); self.namMaliciaB = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.namGenerosidadeB ~= nil then self.namGenerosidadeB:destroy(); self.namGenerosidadeB = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.namTemperanca ~= nil then self.namTemperanca:destroy(); self.namTemperanca = nil; end;
        if self.namLuxuriaB ~= nil then self.namLuxuriaB:destroy(); self.namLuxuriaB = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.namPerdao ~= nil then self.namPerdao:destroy(); self.namPerdao = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.namEnergia ~= nil then self.namEnergia:destroy(); self.namEnergia = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.namHonestidade ~= nil then self.namHonestidade:destroy(); self.namHonestidade = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.namArbitrariedade ~= nil then self.namArbitrariedade:destroy(); self.namArbitrariedade = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.namCastidadeB ~= nil then self.namCastidadeB:destroy(); self.namCastidadeB = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.namCinismo ~= nil then self.namCinismo:destroy(); self.namCinismo = nil; end;
        if self.namPrudencia ~= nil then self.namPrudencia:destroy(); self.namPrudencia = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.flagHonra ~= nil then self.flagHonra:destroy(); self.flagHonra = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.namArbitrariedadeB ~= nil then self.namArbitrariedadeB:destroy(); self.namArbitrariedadeB = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.namJustica ~= nil then self.namJustica:destroy(); self.namJustica = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.namOrgulho ~= nil then self.namOrgulho:destroy(); self.namOrgulho = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.namDesconfianca ~= nil then self.namDesconfianca:destroy(); self.namDesconfianca = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.namCinismoB ~= nil then self.namCinismoB:destroy(); self.namCinismoB = nil; end;
        if self.namPrudenciaB ~= nil then self.namPrudenciaB:destroy(); self.namPrudenciaB = nil; end;
        if self.namImprudencia ~= nil then self.namImprudencia:destroy(); self.namImprudencia = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.namCrueldade ~= nil then self.namCrueldade:destroy(); self.namCrueldade = nil; end;
        if self.namEgoismo ~= nil then self.namEgoismo:destroy(); self.namEgoismo = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.namTemperancaB ~= nil then self.namTemperancaB:destroy(); self.namTemperancaB = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.namCovardiaB ~= nil then self.namCovardiaB:destroy(); self.namCovardiaB = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.namEnergiaB ~= nil then self.namEnergiaB:destroy(); self.namEnergiaB = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.namCovardia ~= nil then self.namCovardia:destroy(); self.namCovardia = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.namJusticaB ~= nil then self.namJusticaB:destroy(); self.namJusticaB = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.namModestiaB ~= nil then self.namModestiaB:destroy(); self.namModestiaB = nil; end;
        if self.namPerdaoB ~= nil then self.namPerdaoB:destroy(); self.namPerdaoB = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.namVinganca ~= nil then self.namVinganca:destroy(); self.namVinganca = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.namPreguicaB ~= nil then self.namPreguicaB:destroy(); self.namPreguicaB = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.namEspiritualidade ~= nil then self.namEspiritualidade:destroy(); self.namEspiritualidade = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.namConfianca ~= nil then self.namConfianca:destroy(); self.namConfianca = nil; end;
        if self.namLuxuria ~= nil then self.namLuxuria:destroy(); self.namLuxuria = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.namConfiancaB ~= nil then self.namConfiancaB:destroy(); self.namConfiancaB = nil; end;
        if self.namMisericordia ~= nil then self.namMisericordia:destroy(); self.namMisericordia = nil; end;
        if self.namImprudenciaB ~= nil then self.namImprudenciaB:destroy(); self.namImprudenciaB = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTeP()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTeP();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTeP = {
    newEditor = newfrmTeP, 
    new = newfrmTeP, 
    name = "frmTeP", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTeP = _frmTeP;
Firecast.registrarForm(_frmTeP);

return _frmTeP;
