require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_paixoes()
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
    obj:setName("paixoes");
    obj:setAlign("top");
    obj:setHeight(25);
    obj:setWidth(292);
    obj:setMargins({bottom=2});


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
			local SomaHonra = (tonumber(sheet.fldValEnergia) or 0) + (tonumber(sheet.fldValGenerosidade) or 0) + (tonumber(sheet.fldValJustica) or 0);
			SomaHonra = SomaHonra + (tonumber(sheet.fldValMisericordia) or 0) + (tonumber(sheet.fldValModestia) or 0) + (tonumber(sheet.fldValCoragem) or 0);
			
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
			
			-- CAPTANDO SOMA DE BÔNUS
			local SomaRom = 0;
			
			-- CHECANDO QUANTAS VIRTUDES ACIMA DE 15
			if((tonumber(sheet.fldValCastidade) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValEnergia) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValPerdao) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValGenerosidade) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValHonestidade) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValJustica) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValMisericordia) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValModestia) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValEspiritualidade) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValPrudencia) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValTemperanca) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValConfianca) or 0) > 15) then SomaRom = SomaRom + 1; end;
			if((tonumber(sheet.fldValCoragem) or 0) > 15) then SomaRom = SomaRom + 1; end;
			
			-- SOMANDO QUANTAS PAIXÕES ACIMA DE 15
			SomaRom = SomaRom + node.countRom;
			
			-- LIMITANDO NÚMERO DE VIRTUDES E PAIXÕES ACIMA DE 15 PARA 3
			if(SomaRom > 3) then SomaRom = 3; end;
			
			-- CHECANDO SE ALGUM VÍCIO ACIMA DE 15
			if((tonumber(sheet.fldValCastidade) or 0) < 5
			or (tonumber(sheet.fldValEnergia) or 0) < 5 
			or (tonumber(sheet.fldValPerdao) or 0) < 5 
			or (tonumber(sheet.fldValGenerosidade) or 0) < 5 
			or (tonumber(sheet.fldValHonestidade) or 0) < 5 
			or (tonumber(sheet.fldValJustica) or 0) < 5 
			or (tonumber(sheet.fldValMisericordia) or 0) < 5 
			or (tonumber(sheet.fldValModestia) or 0) < 5 
			or (tonumber(sheet.fldValEspiritualidade) or 0) < 5 
			or (tonumber(sheet.fldValPrudencia) or 0) < 5 
			or (tonumber(sheet.fldValTemperanca) or 0) < 5 
			or (tonumber(sheet.fldValConfianca) or 0) < 5 
			or (tonumber(sheet.fldValCoragem) or 0) < 5) then 
				SomaRom = SomaRom + 1; 
			end;
			
			if(SomaHonra > 79) then
				SomaBonus = SomaBonus + 100;
			end;
			if(SomaReligiao > 79) then
				SomaBonus = SomaBonus + 100;
			end;
			if(SomaRom > 3) then
				SomaBonus = SomaBonus + 100;
			end;
			
			-- SOMANDO BONUS DIVERSOS
			SomaBonus = SomaBonus + (tonumber(node.countSum) or 0);
			
			-- APLICANDO VALOR AO CAMPO
			sheet.fldSomaGloria = "+ " .. tostring(math.floor(SomaHabs + SomaVirts + SomaBonus));
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
		
	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("nomePX");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setFontSize(14);
    obj.edit1:setHeight(25);
    obj.edit1:setWidth(217);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("nomePX");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("left");
    obj.edit2:setField("valorPX");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("white");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setFontSize(14);
    obj.edit2:setHeight(25);
    obj.edit2:setWidth(26);
    obj.edit2:setTransparent(true);
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(99);
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("valorPX");
    obj.dataLink2:setDefaultValue("0");
    obj.dataLink2:setName("dataLink2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setText("🞭");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setHint("Apagar Paixão");
    obj.button1:setName("button1");

    obj._e_event0 = obj.edit2:addEventListener("onExit",
        function (_)
            if(sheet==nil) then return; end; CalcularGloriaAnual();
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet==nil) then return; end; 
            					ContabilizarPaixoes();
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet); if(sheet==nil) then return; end; CalcularGloriaAnual();
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newpaixoes()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_paixoes();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _paixoes = {
    newEditor = newpaixoes, 
    new = newpaixoes, 
    name = "paixoes", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

paixoes = _paixoes;
Firecast.registrarForm(_paixoes);

return _paixoes;
