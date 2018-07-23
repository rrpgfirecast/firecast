require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSkills()
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
    obj:setName("frmSkills");
    obj:setAlign("client");


		local skills = {};
		skills[1] = {};
		skills[2] = {};
		skills[3] = {};
		skills[4] = {};
		skills[5] = {};
		skills[6] = {};
		skills[7] = {};
		skills[8] = {};
		skills[9] = {};
		skills[10] = {};
		skills[11] = {};
		skills[12] = {};
		skills[13] = {};
		skills[14] = {};
		skills[15] = {};
		skills[16] = {};
		skills[17] = {};
		skills[18] = {};
		skills[19] = {};
		skills[20] = {};
		skills[21] = {};
		skills[22] = {};
		skills[23] = {};
		skills[24] = {};
		skills[25] = {};
		skills[26] = {};
		skills[27] = {};
		skills[28] = {};
		skills[29] = {};
		skills[30] = {};
		skills[31] = {};
		skills[32] = {};
		skills[33] = {};
		skills[34] = {};
		skills[35] = {};
		skills[36] = {};
		skills[37] = {};
		skills[38] = {};
		skills[39] = {};
		skills[40] = {};
		skills[41] = {};
		skills[42] = {};
		skills[43] = {};
		skills[44] = {};
		skills[45] = {};
		skills[46] = {};
		skills[47] = {};
		skills[48] = {};
		skills[49] = {};
		skills[50] = {};
		skills[51] = {};
		skills[52] = {};
		skills[53] = {};
		skills[54] = {};
		skills[55] = {};
		skills[1].nome = "Abrir Fechaduras ";
		skills[1].chave = "2";
		skills[2].nome = "Acrobacia ";
		skills[2].chave = "2";
		skills[3].nome = "Adestrar Animais ";
		skills[3].chave = "6";
		skills[4].nome = "Arte da Fuga ";
		skills[4].chave = "2";
		skills[5].nome = "Atuação ";
		skills[5].chave = "6";
		skills[6].nome = "Avaliação ";
		skills[6].chave = "4";
		skills[7].nome = "Blefar ";
		skills[7].chave = "6";
		skills[8].nome = "Cavalgar ";
		skills[8].chave = "2";
		skills[9].nome = "Concentração ";
		skills[9].chave = "3";
		skills[10].nome = "Conhecimento Arcano ";
		skills[10].chave = "4";
		skills[11].nome = "Conhecimento Arte ";
		skills[11].chave = "4";
		skills[12].nome = "Conhecimento Atualidades ";
		skills[12].chave = "4";
		skills[13].nome = "Conhecimento Ciências Comportamentais ";
		skills[13].chave = "4";
		skills[14].nome = "Conhecimento Ciências Físicas ";
		skills[14].chave = "4";
		skills[15].nome = "Conhecimento Ciências Naturais ";
		skills[15].chave = "4";
		skills[16].nome = "Conhecimento Civil ";
		skills[16].chave = "4";
		skills[17].nome = "Conhecimento Cultura Popular ";
		skills[17].chave = "4";
		skills[18].nome = "Conhecimento Estratégia ";
		skills[18].chave = "4";
		skills[19].nome = "Conhecimento História ";
		skills[19].chave = "4";
		skills[20].nome = "Conhecimento Manha ";
		skills[20].chave = "4";
		skills[21].nome = "Conhecimento Negócios ";
		skills[21].chave = "4";
		skills[22].nome = "Conhecimento Tecnologia ";
		skills[22].chave = "4";
		skills[23].nome = "Conhecimento Teologia e Filosofia ";
		skills[23].chave = "4";
		skills[24].nome = "Cura ";
		skills[24].chave = "5";
		skills[25].nome = "Decifrar Escrita ";
		skills[25].chave = "4";
		skills[26].nome = "Demolição ";
		skills[26].chave = "4";
		skills[27].nome = "Diplomacia ";
		skills[27].chave = "6";
		skills[28].nome = "Disfarce ";
		skills[28].chave = "6";
		skills[29].nome = "Equilíbrio ";
		skills[29].chave = "2";
		skills[30].nome = "Escalar ";
		skills[30].chave = "1";
		skills[31].nome = "Esconder-se ";
		skills[31].chave = "2";
		skills[32].nome = "Falar Idioma ";
		skills[32].chave = "4";
		skills[33].nome = "Furtividade ";
		skills[33].chave = "2";
		skills[34].nome = "Identificar Magia ";
		skills[34].chave = "4";
		skills[35].nome = "Intimidar ";
		skills[35].chave = "6";
		skills[36].nome = "Investigar ";
		skills[36].chave = "4";
		skills[37].nome = "Jogos ";
		skills[37].chave = "5";
		skills[38].nome = "Natação ";
		skills[38].chave = "1";
		skills[39].nome = "Navegação ";
		skills[39].chave = "4";
		skills[40].nome = "Observar ";
		skills[40].chave = "5";
		skills[41].nome = "Obter Informações ";
		skills[41].chave = "6";
		skills[42].nome = "Ofícios ";
		skills[42].chave = "4";
		skills[43].nome = "Operar Mecanismo ";
		skills[43].chave = "4";
		skills[44].nome = "Ouvir ";
		skills[44].chave = "5";
		skills[45].nome = "Pesquisa ";
		skills[45].chave = "4";
		skills[46].nome = "Pilotar ";
		skills[46].chave = "2";
		skills[47].nome = "Prestidigitação ";
		skills[47].chave = "2";
		skills[48].nome = "Procurar ";
		skills[48].chave = "4";
		skills[49].nome = "Profissão ";
		skills[49].chave = "5";
		skills[50].nome = "Reparos ";
		skills[50].chave = "4";
		skills[51].nome = "Saltar ";
		skills[51].chave = "1";
		skills[52].nome = "Sentir Motivação ";
		skills[52].chave = "5";
		skills[53].nome = "Sobrevivência ";
		skills[53].chave = "5";
		skills[54].nome = "Usar Computador ";
		skills[54].chave = "4";
		skills[55].nome = "Usar Cordas ";
		skills[55].chave = "2";

		local function updateAtributes(num)
			local atr = "" .. num;
			local mod = 0;
			
			if num == 1 then
				mod = tonumber(sheet.mod_for) or 0;
			elseif num == 2 then
				mod = tonumber(sheet.mod_des) or 0;
			elseif num == 3 then
				mod = tonumber(sheet.mod_con) or 0;
			elseif num == 4 then
				mod = tonumber(sheet.mod_int) or 0;
			elseif num == 5 then
				mod = tonumber(sheet.mod_sab) or 0;
			elseif num == 6 then
				mod = tonumber(sheet.mod_car) or 0;
			end;

			local nodes = ndb.getChildNodes(sheet.listaDePericias); 
			for i=1, #nodes, 1 do
				if nodes[i].chave == atr then
					nodes[i].atributo = mod;
				end;
			end
		end;

		local function defaultSkills()
			local nodes = ndb.getChildNodes(sheet.listaDePericias); 
			for i=1, #nodes, 1 do
				ndb.deleteNode(nodes[i]);
			end

			for i=1, 55, 1 do
				local pericia = self.rclPericias:append();
				pericia.nome = skills[i].nome;
				pericia.chave = skills[i].chave;
			end;

			self.rclPericias:sort();
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(880);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(30);
    obj.button2:setTop(5);
    obj.button2:setWidth(50);
    obj.button2:setHeight(25);
    obj.button2:setText("Todas");
    obj.button2:setName("button2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(215);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Total");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(275);
    obj.label2:setTop(5);
    obj.label2:setWidth(40);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Mod");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(315);
    obj.label3:setTop(5);
    obj.label3:setWidth(40);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Grad");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(355);
    obj.label4:setTop(5);
    obj.label4:setWidth(40);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Outros");
    obj.label4:setFontSize(10);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(640);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Total");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(700);
    obj.label6:setTop(5);
    obj.label6:setWidth(40);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Mod");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(740);
    obj.label7:setTop(5);
    obj.label7:setWidth(40);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Grad");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(780);
    obj.label8:setTop(5);
    obj.label8:setWidth(40);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Outros");
    obj.label8:setFontSize(10);
    obj.label8:setName("label8");

    obj.rclPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle1);
    obj.rclPericias:setLeft(5);
    obj.rclPericias:setTop(30);
    obj.rclPericias:setWidth(870);
    obj.rclPericias:setHeight(565);
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaDePericias");
    obj.rclPericias:setTemplateForm("frmSkillListForm");
    obj.rclPericias:setLayout("verticalTiles");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(885);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(240);
    obj.rectangle2:setHeight(60);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(240);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Grupos de Perícias");
    obj.label9:setName("label9");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(230);
    obj.edit1:setHeight(25);
    obj.edit1:setField("pericias");
    obj.edit1:setName("edit1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclPericias:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            defaultSkills();
        end, obj);

    obj._e_event2 = obj.rclPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSkills()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSkills();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSkills = {
    newEditor = newfrmSkills, 
    new = newfrmSkills, 
    name = "frmSkills", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSkills = _frmSkills;
Firecast.registrarForm(_frmSkills);

return _frmSkills;
