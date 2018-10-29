require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaTeste()
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
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setName("frmFichaTeste");
    obj:setTitle("Malditos Goblins");
    obj:setFormType("sheetTemplate");
    obj:setDataType("mg.mg.now");


	
	
	
	
	
	
	
	
	-- nome 
	local function nomefunc()
		local rolltemp1 = rrpg.interpretarRolagem("1d6");
		rolltemp1:rolarLocalmente();
		local rolltemp2 = rrpg.interpretarRolagem("1d6");
		rolltemp2:rolarLocalmente();
		local aaa = "aaa";
		local bbb = "bbb";
	
		if rolltemp1.resultado == 1 then
			aaa = "Sp";
		end;
		if rolltemp1.resultado == 2 then
			aaa = "Cr";
		end;
		if rolltemp1.resultado == 3 then
			aaa = "Bu";
		end;
		if rolltemp1.resultado == 4 then
			aaa = "Ut";
		end;
		if rolltemp1.resultado == 5 then
			aaa = "An";
		end;
		if rolltemp1.resultado == 6 then
			aaa = "Om";
		end;
	
		if rolltemp2.resultado == 1 then
			bbb = "or";
		end;
		if rolltemp2.resultado == 2 then
			bbb = "ut";
		end;
		if rolltemp2.resultado == 3 then
			bbb = "ar";
		end;
		if rolltemp2.resultado == 4 then
			bbb = "an";
		end;
		if rolltemp2.resultado == 5 then
			bbb = "ot";
		end;
		if rolltemp2.resultado == 6 then
			bbb = "ec";
		end;
		
		return aaa .. bbb;
	
	end;
	
	
	
	--atualizar o total dos atributos
	local function atualizartotalfunc(ATR,ATRMOD)
		if ATR == nil then ATR = 0; end;
		if ATRMOD == nil then ATRMOD = 0; end;
			
		return ATR + ATRMOD;
	end;
	
	
	
	local function nivelvoltarfunc()
	
		if sheet.nivel > 1 then
			sheet.nivel = sheet.nivel - 1;
		
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem(sheet.NOMEdoPERSONAGEM .. " voltou para o nível: " .. sheet.nivel .. "!");
			if sheet.nivel == 2 then
			
		end;
		
		if sheet.nivel == 1 then
			sheet.talento2 = "---";
		
		end;
		
		if sheet.nivel == 2 then
			sheet.talento3 = "---";
		
		end;

		if sheet.nivel > 2 then
			sheet.ATR5 = sheet.ATR5 - 1;
			sheet.ATRtot5 = sheet.ATRtot5 - 1;
		
		end;	
	
		
		
		
		end;
	
	
	
	end;
	
	
	
	
	
	-- subir de lv
	local function nivelfunc()
	
		if sheet.nivel ~= 0 then
			sheet.nivel = sheet.nivel + 1;
			
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem(sheet.NOMEdoPERSONAGEM .. " subiu de nível! Foi para o nível: " .. sheet.nivel .. "!");
			
			
			if sheet.nivel == 2 then
				if sheet.ocupacao == "Mercenário." then
					sheet.talento2 = "Ataque Brutal";
				end;
				if sheet.ocupacao == "Caçador." then
					sheet.talento2 = "Mira Certeira";
				end;
				if sheet.ocupacao == "Gatuno." then
					sheet.talento2 = "Armar Armadilhas";
				end;
				if sheet.ocupacao == "Líder." then
					sheet.talento2 = "Ataque Brutal";
				end;
				if sheet.ocupacao == "Piromaníaco." then
					sheet.talento2 = "Suicídio Explosivo";
				end;
				if sheet.ocupacao == "Xamã." then
					sheet.talento2 = "Cura";
				end;
			end;
		
			if sheet.nivel == 3 then
				if sheet.ocupacao == "Mercenário." then
					sheet.talento3 = "Ataque Fatal";
				end;
				if sheet.ocupacao == "Caçador." then
					sheet.talento3 = "Tiro Fatal";
				end;
				if sheet.ocupacao == "Gatuno." then
					sheet.talento3 = "Ataque Furtivo";
				end;
				if sheet.ocupacao == "Líder." then
					sheet.talento3 = "Ataque Fatal";
				end;
				if sheet.ocupacao == "Piromaníaco." then
					sheet.talento3 = "Imunidade";
				end;
				if sheet.ocupacao == "Xamã." then
					sheet.talento3 = "Petrificar";
				end;
			end;
			
			if sheet.nivel > 3 then
				sheet.ATR5 = sheet.ATR5 + 1;
				sheet.ATRtot5 = sheet.ATRtot5 + 1;
			end;
		end;
	end;
	
	
	
	
	
	-- HELP
	
	local function HELPfunc(menu, tipo )
		--caracteristica
		if menu == "caracteristica" then
		
			if tipo == "Insano" then
				sheet.HELPtext = "Insano: Você não tem controle de seus atos. Sempre que o mestre quiser, ele pode pedir um teste de Sorte (dificuldade 5). Se você falhar, o mestre poderá decidir um ato idiota para seu personagem fazer.";
			end;
			if tipo == "Fedorento" then
				sheet.HELPtext = "Fedorento: Você fede e ninguém gosta de ficar perto. Qualquer um que fique por mais de 1 minuto perto de você, poderá ficar nauseado e vomitar.";
			end;
			if tipo == "Cicatrizes" then
				sheet.HELPtext = "Cicatrizes: Você possui muitas cicatrizes de muitas batalhas. As fêmeas goblins nunca olharão para você.";
			end;
			if tipo == "Gordo" then
				sheet.HELPtext = "Gordo: Você é obeso e tem problemas em passar em buracos estreitos, se esconder e não consegue correr por muito tempo.";
			end;
			if tipo == "Fala Errado" then
				sheet.HELPtext = "Fala Errado: Você tem algum problema de comunicação (gagueira, língua presa, troca letras, etc) e isso irrita muito os seus companheiros.";
			end;
			if tipo == "Anomalia" then
				sheet.HELPtext = "Você possui uma anomalia genética (algo comum entre goblins): " .. sheet.aparencia ;
			end;		
		end;
		--equipamento
		if menu == "equipamento" then
			if tipo == "---" then
				sheet.HELPtext = "Nada.";
			end;
		
			if tipo == "2 Adagas" then
				sheet.HELPtext = "Adaga: dano 2. Esta arma pode ser arremessada como arma de distância.";
			end;
	
			if tipo == "Adaga" then
				sheet.HELPtext = "Adaga: dano 2. Esta arma pode ser arremessada como arma de distância.";
			end;
			
			if tipo == "Escudo" then
				sheet.HELPtext = "Escudo: Proteção 1.";
			end;
			
			if tipo == "Arco Simples" then
				sheet.HELPtext = "Arco Simples: distância; dano 2.";
			end;
			
			if tipo == "Arco Composto" then
				sheet.HELPtext = "Arco Composto: distância; dano 3.";
			end;
			
			if tipo == "4 Adagas" then
				sheet.HELPtext = "Adaga: dano 2. Esta arma pode ser arremessada como arma de distância.";
			end;
			
			if tipo == "Besta" then
				sheet.HELPtext = "Besta: distância; dano 3.";
			end;
			
			if tipo == "Elmo" then
				sheet.HELPtext = "Elmo: Proteção 1.";
			end;
			
			if tipo == "Espada" then
				sheet.HELPtext = "Espada: dano 3.";
			end;			
			
			if tipo == "Machado" then
				sheet.HELPtext = "Machado: dano 4.";
			end;			
			
			if tipo == "2 Machadinhas" then
				sheet.HELPtext = "Machadinha: dano 3. Esta arma pode ser arremessada como arma de distância.";
			end;			

			if tipo == "Espadona" then
				sheet.HELPtext = "Espadona: dano 5.";
			end;

			if tipo == "2 Espadas" then
				sheet.HELPtext = "Espada: dano 3.";
			end;

			if tipo == "Armadura" then
				sheet.HELPtext = "Armadura: Proteção 1.";
			end;

			if tipo == "Pistola" then
				sheet.HELPtext = "Pistola: distância; dano 4.";
			end;

			if tipo == "2 Pistolas" then
				sheet.HELPtext = "Pistola: distância; dano 4.";
			end;

			if tipo == "3 Galinhas Explosivas" then
				sheet.HELPtext = "Galinha Explosiva: distância; dano 4 em todos até 3m.";
			end;

			if tipo == "Barril de Pólvora" then
				sheet.HELPtext = "Barril de Pólvora: dano 5 em todos até 3m.";
			end;
			
			if tipo == "2 Galinhas Explosivas" then
				sheet.HELPtext = "Galinha Explosiva: distância; dano 4 em todos até 3m.";
			end;
			
			if tipo == "Canhão" then
				sheet.HELPtext = "Canhão: distância; dano 8; Carregar: 2 turnos.";
			end;
			if tipo == "Cajado" then
				sheet.HELPtext = "Cajado: dano 1.";
			end;
			
		end;
	
		--talentos
	
	
		if menu == "talento" then
			
			if tipo == "---" then
				sheet.HELPtext = "Nada.";
			end;
			
			--talentos nv1
			if tipo == "Mestre de Armas" then
				sheet.HELPtext = "Mestre de Armas: Você sempre rola +1 dado em todos os ataques que você fizer lutando com sua arma favorita ,Escolha uma.";
			end;
			if tipo == "Rastrear" then
				sheet.HELPtext = "Rastrear: Com um teste bem sucedido de Conhecimento ,dificuldade 3, você pode rastrear qualquer criatura.";
			end;
			if tipo == "Roubar" then
				sheet.HELPtext = "Roubar: Você pode roubar sem ser visto se vencer um teste resistido de Habilidade contra a vítima.";
			end;
			if tipo == "Grito de Guerra" then
				sheet.HELPtext = "Grito de Guerra: Uma vez ao dia você pode dar um grito que permitirá que todos seus aliados rolem 1 dado a mais para se esquivar até o final da batalha.";
			end;
			if tipo == "Resistência" then
				sheet.HELPtext = "Resistência: Você pode fazer um teste de Sorte ,dificuldade 5, quando receber dano de fogo ou explosão de fogo. Se vencer, você não recebe dano.";
			end;
			if tipo == "Raio de Energia" then
				sheet.HELPtext = "Raio de Energia: Você pode gastar pontos de magia para fazer ataques a distância. Cada ponto gasto causará um ponto de dano ,pode gastar mais para fazer ataque com mais dano.";
			end;
			
			--talentos nv2
			if tipo == "Ataque Brutal" then
				sheet.HELPtext = "Ataque Brutal: Uma vez ao dia você pode fazer um ataque brutal, que causa o dobro de dano na vítima.";
			end;
			if tipo == "Mira Certeira" then
				sheet.HELPtext = "Mira Certeira: Você ignora a proteção dos seus oponentes.";
			end;
			if tipo == "Armar Armadilhas" then
				sheet.HELPtext = "Armar Armadilhas: Você pode fazer uma armadilha em qualquer lugar se tiver alguns materiais. A pessoa terá que passar em um teste de Sorte ,dificuldade 5, para não cair na sua armadilha.";
			end;
			if tipo == "Suicídio Explosivo" then
				sheet.HELPtext = "Suicídio Explosivo: Usando sua arma, você pode se explodir e matar TODOS os que estiverem na área da explosão.";
			end;
			if tipo == "Cura" then
				sheet.HELPtext = "Cura: Você pode gastar seus pontos de magia para curar seus aliados. Cada ponto de magia recupera um ponto de vitalidade.";
			end;
			
			--talentos nv3
			if tipo == "Ataque Fatal" then
				sheet.HELPtext = "Ataque Fatal: Uma vez ao dia você pode fazer um ataque fatal. Se acertar, a vitima deverá vencer um teste de Sorte ,Dificuldade 5. Se ela falhar ela morrerá.";
			end;
			if tipo == "Tiro Fatal" then
				sheet.HELPtext = "Tiro Fatal: Uma vez ao dia você pode fazer um ataque à distância fatal. Se acertar, a vitima deverá vencer um teste de Sorte ,Dificuldade 5, ou morrerá imediatamente.";
			end;
			if tipo == "Ataque Furtivo" then
				sheet.HELPtext = "Ataque Furtivo: Se você não foi visto, você pode fazer um ataque furtivo. Se acertar, a vitima deverá fazer um teste de Sorte ,Dificuldade 5. Se ela falhar ela morrerá.";
			end;
			if tipo == "Imunidade" then
				sheet.HELPtext = "Imunidade: Você nunca recebe dano com fogo ou explosão.";
			end;
			if tipo == "Petrificar" then
				sheet.HELPtext = "Petrificar: Gastando 6 pontos de magia você pode paralisar qualquer criatura.";
			end;
		end;
	end;
	
	
	-- em caso de anomalia
	local function anomaliafunc()
		local rollanomalia = rrpg.interpretarRolagem("2d6");
		rollanomalia:rolarLocalmente();
		

		if rollanomalia.resultado == 2 then
			return "Manchas rosas";
		end;
		if rollanomalia.resultado == 3 then
			return "Manchas rosas";
		end;		
		if rollanomalia.resultado == 4 then
			return "Orelhas no sovaco";
		end;
		if rollanomalia.resultado == 5 then
			return "Corcunda";
		end;
		if rollanomalia.resultado == 6 then
			return "Braço extra atrofiado";
		end;
		if rollanomalia.resultado == 7 then
			local rollolhos = rrpg.interpretarRolagem("1d6");
			rollolhos:rolarLocalmente();
			return rollolhos.resultado .. " Olhos";
		end;
		if rollanomalia.resultado == 8 then
			return "Olhos Gigantes";	
		end;
		if rollanomalia.resultado == 9 then
			return "Mãos Gigantes";	
		end;		
		if rollanomalia.resultado == 10 then
			return "Duas Cabeças";	
		end;		
		if rollanomalia.resultado == 11 then
			return anomaliafunc() .. "/" .. anomaliafunc();	
		end;
		if rollanomalia.resultado == 12 then
			return anomaliafunc() .. "/" .. anomaliafunc();	
		end;		
	
	end;
	
	
	--criando aparencia
	local function aparenciafunc(roll2,roll3)
		local cor = "aaa";
		local car = "bbb";
		
		--cor
		if roll2 == 1 then
			sheet.ATR1 = sheet.ATR1 + 1
			sheet.ATR2 = sheet.ATR2 + 1
			cor = "Verde Claro";
		end;
		if roll2 == 2 then
			sheet.ATR1 = sheet.ATR1 + 1
			sheet.ATR4 = sheet.ATR4 + 1
			cor = "Verde";	
		end;
		if roll2 == 3 then
			sheet.ATR1 = sheet.ATR1 + 1
			sheet.ATR3 = sheet.ATR3 + 1
			cor = "Verde Escuro";
		end;
		if roll2 == 4 then
			sheet.ATR3 = sheet.ATR3 + 1
			sheet.ATR4 = sheet.ATR4 + 1
			cor = "Amarelo";
		end;
		if roll2 == 5 then
			sheet.ATR2 = sheet.ATR2 + 1
			sheet.ATR3 = sheet.ATR3 + 1
			cor = "Vermelho";
		end;
		if roll2 == 6 then
			sheet.ATR2 = sheet.ATR2 + 1
			sheet.ATR4 = sheet.ATR4 + 1
			cor = "Azul";
		end;
	
	
		--caracteristica
		if roll2 == 1 then
			car = "Insano";
			sheet.HELPcaracteristica = "Insano";
			end;
		if roll2 == 2 then
			car = "Fedorento";
			sheet.HELPcaracteristica = "Fedorento";
		end;
		if roll2 == 3 then
			car = "Cicatrizes";
			sheet.HELPcaracteristica = "Cicatrizes";
		end;
		if roll2 == 4 then
			car = "Gordo";
			sheet.HELPcaracteristica = "Gordo";
		end;
		if roll2 == 5 then
			car = "Fala Errado";
			sheet.HELPcaracteristica = "Fala Errado";
		end;
		if roll2 == 6 then
			car = "Anomalia: " .. anomaliafunc();
			sheet.HELPcaracteristica = "Anomalia";
		end;
	
	
		return cor .. " e " .. car .. ".";
	end;
	
	
	--equipamentos
	--equip leves
	local function EquipLevefunc(roll4)
		if roll4 == 1 then
			sheet.equipamento1 = "2 Adagas";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "2";
			sheet.ATR8 = "0";
		end;
		if roll4 == 2 then
			sheet.equipamento1 = "Adaga";
			sheet.equipamento2 = "Escudo";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "2";
			sheet.ATR8 = "1";
		end;
		if roll4 == 3 then
			sheet.equipamento1 = "Arco Simples";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "2";
			sheet.ATR8 = "0";
		end;
		if roll4 == 4 then
			sheet.equipamento1 = "Arco Composto";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "3";
			sheet.ATR8 = "0";
		end;
		if roll4 == 5 then
			sheet.equipamento1 = "4 Adagas";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "2";
			sheet.ATR8 = "0";
		end;
		if roll4 == 6 then
			sheet.equipamento1 = "Besta";
			sheet.equipamento2 = "Elmo";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "3";
			sheet.ATR8 = "1";
		end;
	end;
	-- equip pesados
	local function EquipPesadofunc(roll4)
		if roll4 == 1 then
			sheet.equipamento1 = "Espada";
			sheet.equipamento2 = "Escudo";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "3";
			sheet.ATR8 = "1";
		end;
		if roll4 == 2 then
			sheet.equipamento1 = "Machado";
			sheet.equipamento2 = "Elmo";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "4";
			sheet.ATR8 = "1";
		end;
		if roll4 == 3 then
			sheet.equipamento1 = "2 Machadinhas";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "3";
			sheet.ATR8 = "0";
		end;
		if roll4 == 4 then
			sheet.equipamento1 = "Espadona";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "5";
			sheet.ATR8 = "0";
		end;
		if roll4 == 5 then
			sheet.equipamento1 = "2 Espadas";
			sheet.equipamento2 = "Armadura";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "3";
			sheet.ATR8 = "1";
		end;
		if roll4 == 6 then
			sheet.equipamento1 = "Adaga";
			sheet.equipamento2 = "Espada";
			sheet.equipamento3 = "Armadura";
			sheet.ATR7 = "3";
			sheet.ATR8 = "1";
		end;	
	
	end;
	-- equip explosivos
	local function EquipExplosivofunc(roll4)
		if roll4 == 1 then
			sheet.equipamento1 = "Pistola";
			sheet.equipamento2 = "Elmo";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "4";
			sheet.ATR8 = "1";
		end;
		if roll4 == 2 then
			sheet.equipamento1 = "2 Pistolas";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "4";
			sheet.ATR8 = "0";
		end;
		if roll4 == 3 then
			sheet.equipamento1 = "3 Galinhas Explosivas";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "4";
			sheet.ATR8 = "0";
		end;
		if roll4 == 4 then
			sheet.equipamento1 = "Barril de Pólvora";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "5";
			sheet.ATR8 = "0";
		end;
		if roll4 == 5 then
			sheet.equipamento1 = "Pistola";
			sheet.equipamento2 = "2 Galinhas Explosivas";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "4";
			sheet.ATR8 = "0";
		end;
		if roll4 == 6 then
			sheet.equipamento1 = "Canhão";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "8";
			sheet.ATR8 = "0";
		end;
	
	end;
	
	
	
	
	
	
	--criando ocupação e equipamentos
	local function ocupacaofunc(roll1,roll4)
		sheet.talento2 = "---";
		sheet.talento3 = "---";
		if roll1 == 1 then
			sheet.ATR1 = sheet.ATR1 + 1;
			sheet.ATR3 = sheet.ATR3 + 1;
			EquipPesadofunc(roll4);
			sheet.talento1 = "Mestre de Armas";
			return "Mercenário.";
		end;
		if roll1 == 2 then
			sheet.ATR1 = sheet.ATR1 + 1;
			sheet.ATR4 = sheet.ATR4 + 1;
			EquipLevefunc(roll4);
			sheet.talento1 = "Rastrear";
			return "Caçador.";
		end;
		if roll1 == 3 then
			sheet.ATR3 = sheet.ATR3 + 1;
			sheet.ATR2 = sheet.ATR2 + 1;
			EquipLevefunc(roll4);
			sheet.talento1 = "Roubar"
			return "Gatuno.";
		end;
		if roll1 == 4 then
			sheet.ATR1 = sheet.ATR1 + 1;
			sheet.ATR2 = sheet.ATR2 + 1;
			EquipPesadofunc(roll4);
			sheet.talento1 = "Grito de Guerra"
			return "Líder.";
		end;
		if roll1 == 5 then
			sheet.ATR3 = sheet.ATR3 + 1;
			sheet.ATR4 = sheet.ATR4 + 1;
			EquipExplosivofunc(roll4);
			sheet.talento1 = "Resistência";
			return "Piromaníaco.";
		end;
		if roll1 == 6 then
			sheet.ATR2 = sheet.ATR2 + 1;
			sheet.ATR4 = sheet.ATR4 + 1;
			sheet.ATR6 = sheet.ATR6 + 8;
			sheet.equipamento1 = "Cajado";
			sheet.equipamento2 = "---";
			sheet.equipamento3 = "---";
			sheet.ATR7 = "1";
			sheet.ATR8 = "0";
			sheet.talento1 = "Raio de Energia";
			return "Xamã." ;
		end;
	
	
		
	
	end;
	
	
	--criando ficha
	local function main()
		if sheet.habilitadoficha == "HABILITADO" then
			
			--Básicos
			sheet.NOMEdoPERSONAGEM = nomefunc();
			sheet.nivel = 1
			sheet.ATR1 = 1
			sheet.ATR2 = 1
			sheet.ATR3 = 1
			sheet.ATR4 = 1
			sheet.ATR5 = 4
			sheet.ATR6 = 0
			sheet.ATR7 = 0
			sheet.ATR8 = 0
			sheet.ATRMOD1 = 0
			sheet.ATRMOD2 = 0
			sheet.ATRMOD3 = 0
			sheet.ATRMOD4 = 0
			sheet.ATRMOD5 = 0
			sheet.ATRMOD6 = 0
			sheet.CTRLCV4 = "Itens"
			sheet.CTRLCV5 = "História - Opcional"
			-- ocupaçao e aparência
			local rolltemp1 = rrpg.interpretarRolagem("1d6");
			rolltemp1:rolarLocalmente();
			local rolltemp2 = rrpg.interpretarRolagem("1d6");
			rolltemp2:rolarLocalmente();
			local rolltemp3 = rrpg.interpretarRolagem("1d6");
			rolltemp3:rolarLocalmente();
			local rolltemp4 = rrpg.interpretarRolagem("1d6");
			rolltemp4:rolarLocalmente();
			
			sheet.ocupacao = ocupacaofunc(rolltemp1.resultado,rolltemp4.resultado)
			sheet.aparencia = aparenciafunc(rolltemp2.resultado, rolltemp3.resultado)
			
			
			
			
			-- atualizando o total
			sheet.ATRtot1 = atualizartotalfunc(sheet.ATR1,sheet.ATRMOD1);
			sheet.ATRtot2 = atualizartotalfunc(sheet.ATR2,sheet.ATRMOD2);
			sheet.ATRtot3 = atualizartotalfunc(sheet.ATR3,sheet.ATRMOD3);
			sheet.ATRtot4 = atualizartotalfunc(sheet.ATR4,sheet.ATRMOD4);
			sheet.ATRtot5 = atualizartotalfunc(sheet.ATR5,sheet.ATRMOD5);
			sheet.ATRtot6 = atualizartotalfunc(sheet.ATR6,sheet.ATRMOD6);
			local chat = rrpg.getMesaDe(sheet).chat;
			
			chat:enviarMensagem( sheet.numerogoblin .. "° Goblin Criado!" );
			sheet.numerogoblin = sheet.numerogoblin + 1;
			sheet.habilitadoficha = "DESABILITADO";
			sheet.habilitadobool = false;
			
		end;	
		return;
	end;
	
	local function habilitadofunc()
	
		if sheet.habilitadobool == true then	
			sheet.habilitadoficha = "HABILITADO";
		else 
		
			sheet.habilitadoficha = "DESABILITADO";
		end;
	
	
	end;
	
	
	
	

	


    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(2000);
    obj.label1:setTop(2000);
    obj.label1:setFontColor("WhiteSmoke");
    obj.label1:setField("HELPcaracteristica");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(2000);
    obj.label2:setTop(2000);
    obj.label2:setFontColor("WhiteSmoke");
    obj.label2:setField("numerogoblin");
    obj.label2:setName("label2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'numerogoblin'});
    obj.dataLink1:setDefaultValues({'1'});
    obj.dataLink1:setName("dataLink1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setTop(10);
    obj.edit1:setText("Nome do goblin:");
    obj.edit1:setFontColor("black");
    obj.edit1:setWidth(150);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setHeight(28);
    obj.edit2:setTop(10);
    obj.edit2:setLeft(105);
    obj.edit2:setFontColor("black");
    obj.edit2:setWidth(200);
    obj.edit2:setTransparent(false);
    obj.edit2:setText("0");
    obj.edit2:setField("NOMEdoPERSONAGEM");
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'NOMEdoPERSONAGEM'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setReadOnly(true);
    obj.edit3:setTop(10);
    obj.edit3:setText("Nome do jogador: ");
    obj.edit3:setFontColor("black");
    obj.edit3:setWidth(120);
    obj.edit3:setLeft(305);
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setHeight(28);
    obj.edit4:setTop(10);
    obj.edit4:setLeft(425);
    obj.edit4:setFontColor("black");
    obj.edit4:setWidth(200);
    obj.edit4:setTransparent(false);
    obj.edit4:setField("NOMEdoJOGADOR");
    obj.edit4:setName("edit4");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'NOMEdoJOGADOR'});
    obj.dataLink3:setDefaultValues({'0'});
    obj.dataLink3:setName("dataLink3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(5);
    obj.label3:setTop(45);
    obj.label3:setText("Ocupação: ");
    obj.label3:setFontColor("black");
    obj.label3:setWidth(150);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setTop(45);
    obj.label4:setLeft(70);
    obj.label4:setFontColor("black");
    obj.label4:setWidth(200);
    obj.label4:setText("0");
    obj.label4:setField("ocupacao");
    obj.label4:setName("label4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'ocupacao'});
    obj.dataLink4:setDefaultValues({'0'});
    obj.dataLink4:setName("dataLink4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("?");
    obj.button1:setWidth(18);
    obj.button1:setHeight(18);
    obj.button1:setLeft(160);
    obj.button1:setTop(47);
    obj.button1:setName("button1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setTop(45);
    obj.label5:setText("Aparência: ");
    obj.label5:setFontColor("black");
    obj.label5:setWidth(120);
    obj.label5:setLeft(180);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setTop(45);
    obj.label6:setLeft(245);
    obj.label6:setFontColor("black");
    obj.label6:setWidth(400);
    obj.label6:setField("aparencia");
    obj.label6:setName("label6");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'aparencia'});
    obj.dataLink5:setDefaultValues({'0'});
    obj.dataLink5:setName("dataLink5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(005);
    obj.label7:setTop(75);
    obj.label7:setWidth(200);
    obj.label7:setFontColor("black");
    obj.label7:setText("Nível:");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setLeft(110);
    obj.label8:setTop(75);
    obj.label8:setWidth(200);
    obj.label8:setFontColor("black");
    obj.label8:setText("0");
    obj.label8:setField("nivel");
    obj.label8:setName("label8");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'nivel'});
    obj.dataLink6:setDefaultValues({'0'});
    obj.dataLink6:setName("dataLink6");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setText("Criar Globin");
    obj.button2:setLeft(300);
    obj.button2:setTop(73);
    obj.button2:setFontColor("red");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setTop(73);
    obj.label9:setLeft(420);
    obj.label9:setFontColor("black");
    obj.label9:setWidth(120);
    obj.label9:setField("habilitadoficha");
    obj.label9:setName("label9");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'habilitadoficha'});
    obj.dataLink7:setDefaultValues({'HABILITADO'});
    obj.dataLink7:setName("dataLink7");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setText("Subir de Nível");
    obj.button3:setLeft(140);
    obj.button3:setTop(73);
    obj.button3:setWidth(100);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setText("Voltar");
    obj.button4:setLeft(241);
    obj.button4:setTop(73);
    obj.button4:setWidth(50);
    obj.button4:setName("button4");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setLeft(405);
    obj.checkBox1:setTop(73);
    obj.checkBox1:setText("");
    obj.checkBox1:setField("habilitadobool");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'habilitadobool'});
    obj.dataLink8:setDefaultValues({'true'});
    obj.dataLink8:setName("dataLink8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setLeft(005);
    obj.label10:setTop(105);
    obj.label10:setWidth(200);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontColor("black");
    obj.label10:setText("Atributo");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setLeft(110);
    obj.label11:setTop(105);
    obj.label11:setWidth(200);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontColor("black");
    obj.label11:setText("Básico");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj);
    obj.label12:setLeft(160);
    obj.label12:setTop(105);
    obj.label12:setWidth(200);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setFontColor("black");
    obj.label12:setText("Mod");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj);
    obj.label13:setLeft(210);
    obj.label13:setTop(105);
    obj.label13:setWidth(200);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontColor("black");
    obj.label13:setText("Total");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj);
    obj.label14:setLeft(300);
    obj.label14:setTop(105);
    obj.label14:setWidth(150);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setFontColor("black");
    obj.label14:setText("Equipamentos");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj);
    obj.label15:setLeft(470);
    obj.label15:setTop(105);
    obj.label15:setWidth(150);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setFontColor("black");
    obj.label15:setText("Talentos");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj);
    obj.label16:setLeft(005);
    obj.label16:setTop(135);
    obj.label16:setWidth(200);
    obj.label16:setFontColor("black");
    obj.label16:setText("Combate:");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj);
    obj.label17:setLeft(110);
    obj.label17:setTop(135);
    obj.label17:setWidth(200);
    obj.label17:setFontColor("black");
    obj.label17:setText("0");
    obj.label17:setField("ATR1");
    obj.label17:setName("label17");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'ATR1'});
    obj.dataLink9:setDefaultValues({'0'});
    obj.dataLink9:setName("dataLink9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj);
    obj.label18:setLeft(005);
    obj.label18:setTop(165);
    obj.label18:setWidth(200);
    obj.label18:setFontColor("black");
    obj.label18:setText("Conhecimento:");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj);
    obj.label19:setLeft(110);
    obj.label19:setTop(165);
    obj.label19:setWidth(200);
    obj.label19:setFontColor("black");
    obj.label19:setText("0");
    obj.label19:setField("ATR2");
    obj.label19:setName("label19");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'ATR2'});
    obj.dataLink10:setDefaultValues({'0'});
    obj.dataLink10:setName("dataLink10");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj);
    obj.label20:setLeft(005);
    obj.label20:setTop(195);
    obj.label20:setWidth(200);
    obj.label20:setFontColor("black");
    obj.label20:setText("Habilidade:");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj);
    obj.label21:setLeft(110);
    obj.label21:setTop(195);
    obj.label21:setWidth(200);
    obj.label21:setFontColor("black");
    obj.label21:setText("0");
    obj.label21:setField("ATR3");
    obj.label21:setName("label21");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'ATR3'});
    obj.dataLink11:setDefaultValues({'0'});
    obj.dataLink11:setName("dataLink11");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj);
    obj.label22:setLeft(005);
    obj.label22:setTop(225);
    obj.label22:setWidth(200);
    obj.label22:setFontColor("black");
    obj.label22:setText("Sorte:");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj);
    obj.label23:setLeft(110);
    obj.label23:setTop(225);
    obj.label23:setWidth(200);
    obj.label23:setFontColor("black");
    obj.label23:setText("0");
    obj.label23:setField("ATR4");
    obj.label23:setName("label23");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'ATR4'});
    obj.dataLink12:setDefaultValues({'0'});
    obj.dataLink12:setName("dataLink12");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj);
    obj.label24:setLeft(005);
    obj.label24:setTop(255);
    obj.label24:setWidth(200);
    obj.label24:setFontColor("black");
    obj.label24:setText("Vitalidade:");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj);
    obj.label25:setLeft(110);
    obj.label25:setTop(255);
    obj.label25:setWidth(200);
    obj.label25:setFontColor("black");
    obj.label25:setText("0");
    obj.label25:setField("ATR5");
    obj.label25:setName("label25");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setFields({'ATR5'});
    obj.dataLink13:setDefaultValues({'0'});
    obj.dataLink13:setName("dataLink13");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj);
    obj.label26:setLeft(005);
    obj.label26:setTop(285);
    obj.label26:setWidth(200);
    obj.label26:setFontColor("black");
    obj.label26:setText("Pontos de magia:");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj);
    obj.label27:setLeft(110);
    obj.label27:setTop(285);
    obj.label27:setWidth(200);
    obj.label27:setFontColor("black");
    obj.label27:setText("0");
    obj.label27:setField("ATR6");
    obj.label27:setName("label27");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setFields({'ATR6'});
    obj.dataLink14:setDefaultValues({'0'});
    obj.dataLink14:setName("dataLink14");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj);
    obj.label28:setLeft(005);
    obj.label28:setTop(315);
    obj.label28:setWidth(200);
    obj.label28:setFontColor("black");
    obj.label28:setText("Dano:");
    obj.label28:setName("label28");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(105);
    obj.edit5:setTop(310);
    obj.edit5:setWidth(45);
    obj.edit5:setFontColor("black");
    obj.edit5:setHeight(28);
    obj.edit5:setText("0");
    obj.edit5:setField("ATR7");
    obj.edit5:setName("edit5");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setFields({'ATR7'});
    obj.dataLink15:setDefaultValues({'0'});
    obj.dataLink15:setName("dataLink15");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj);
    obj.label29:setLeft(005);
    obj.label29:setTop(345);
    obj.label29:setWidth(200);
    obj.label29:setFontColor("black");
    obj.label29:setText("Proteção:");
    obj.label29:setName("label29");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(105);
    obj.edit6:setTop(340);
    obj.edit6:setWidth(45);
    obj.edit6:setFontColor("black");
    obj.edit6:setHeight(28);
    obj.edit6:setText("0");
    obj.edit6:setField("ATR8");
    obj.edit6:setName("edit6");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setFields({'ATR8'});
    obj.dataLink16:setDefaultValues({'0'});
    obj.dataLink16:setName("dataLink16");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(155);
    obj.edit7:setTop(130);
    obj.edit7:setWidth(45);
    obj.edit7:setType("number");
    obj.edit7:setHeight(28);
    obj.edit7:setFontColor("black");
    obj.edit7:setText("0");
    obj.edit7:setField("ATRMOD1");
    obj.edit7:setName("edit7");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj);
    obj.dataLink17:setFields({'ATRMOD1'});
    obj.dataLink17:setDefaultValues({'0'});
    obj.dataLink17:setName("dataLink17");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(155);
    obj.edit8:setTop(160);
    obj.edit8:setWidth(45);
    obj.edit8:setType("number");
    obj.edit8:setHeight(28);
    obj.edit8:setFontColor("black");
    obj.edit8:setText("0");
    obj.edit8:setField("ATRMOD2");
    obj.edit8:setName("edit8");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj);
    obj.dataLink18:setFields({'ATRMOD2'});
    obj.dataLink18:setDefaultValues({'0'});
    obj.dataLink18:setName("dataLink18");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj);
    obj.edit9:setLeft(155);
    obj.edit9:setTop(190);
    obj.edit9:setWidth(45);
    obj.edit9:setType("number");
    obj.edit9:setHeight(28);
    obj.edit9:setFontColor("black");
    obj.edit9:setText("0");
    obj.edit9:setField("ATRMOD3");
    obj.edit9:setName("edit9");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj);
    obj.dataLink19:setFields({'ATRMOD3'});
    obj.dataLink19:setDefaultValues({'0'});
    obj.dataLink19:setName("dataLink19");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj);
    obj.edit10:setLeft(155);
    obj.edit10:setTop(220);
    obj.edit10:setWidth(45);
    obj.edit10:setType("number");
    obj.edit10:setHeight(28);
    obj.edit10:setFontColor("black");
    obj.edit10:setText("0");
    obj.edit10:setField("ATRMOD4");
    obj.edit10:setName("edit10");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj);
    obj.dataLink20:setFields({'ATRMOD4'});
    obj.dataLink20:setDefaultValues({'0'});
    obj.dataLink20:setName("dataLink20");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj);
    obj.edit11:setLeft(155);
    obj.edit11:setTop(250);
    obj.edit11:setWidth(45);
    obj.edit11:setType("number");
    obj.edit11:setHeight(28);
    obj.edit11:setFontColor("black");
    obj.edit11:setText("0");
    obj.edit11:setField("ATRMOD5");
    obj.edit11:setName("edit11");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj);
    obj.dataLink21:setFields({'ATRMOD5'});
    obj.dataLink21:setDefaultValues({'0'});
    obj.dataLink21:setName("dataLink21");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj);
    obj.edit12:setLeft(155);
    obj.edit12:setTop(280);
    obj.edit12:setWidth(45);
    obj.edit12:setType("number");
    obj.edit12:setHeight(28);
    obj.edit12:setFontColor("black");
    obj.edit12:setText("0");
    obj.edit12:setField("ATRMOD6");
    obj.edit12:setName("edit12");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj);
    obj.dataLink22:setFields({'ATRMOD6'});
    obj.dataLink22:setDefaultValues({'0'});
    obj.dataLink22:setName("dataLink22");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj);
    obj.label30:setLeft(210);
    obj.label30:setTop(135);
    obj.label30:setWidth(200);
    obj.label30:setFontColor("black");
    obj.label30:setText("0");
    obj.label30:setField("ATRtot1");
    obj.label30:setName("label30");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj);
    obj.dataLink23:setFields({'ATRtot1'});
    obj.dataLink23:setDefaultValues({'0'});
    obj.dataLink23:setName("dataLink23");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj);
    obj.label31:setLeft(210);
    obj.label31:setTop(165);
    obj.label31:setWidth(200);
    obj.label31:setFontColor("black");
    obj.label31:setText("0");
    obj.label31:setField("ATRtot2");
    obj.label31:setName("label31");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj);
    obj.dataLink24:setFields({'ATRtot2'});
    obj.dataLink24:setDefaultValues({'0'});
    obj.dataLink24:setName("dataLink24");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj);
    obj.label32:setLeft(210);
    obj.label32:setTop(195);
    obj.label32:setWidth(200);
    obj.label32:setFontColor("black");
    obj.label32:setText("0");
    obj.label32:setField("ATRtot3");
    obj.label32:setName("label32");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj);
    obj.dataLink25:setFields({'ATRtot3'});
    obj.dataLink25:setDefaultValues({'0'});
    obj.dataLink25:setName("dataLink25");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj);
    obj.label33:setLeft(210);
    obj.label33:setTop(225);
    obj.label33:setWidth(200);
    obj.label33:setFontColor("black");
    obj.label33:setText("0");
    obj.label33:setField("ATRtot4");
    obj.label33:setName("label33");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj);
    obj.dataLink26:setFields({'ATRtot4'});
    obj.dataLink26:setDefaultValues({'0'});
    obj.dataLink26:setName("dataLink26");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj);
    obj.label34:setLeft(210);
    obj.label34:setTop(255);
    obj.label34:setWidth(200);
    obj.label34:setFontColor("black");
    obj.label34:setText("0");
    obj.label34:setField("ATRtot5");
    obj.label34:setName("label34");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj);
    obj.dataLink27:setFields({'ATRtot5'});
    obj.dataLink27:setDefaultValues({'0'});
    obj.dataLink27:setName("dataLink27");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj);
    obj.label35:setLeft(210);
    obj.label35:setTop(285);
    obj.label35:setWidth(200);
    obj.label35:setFontColor("black");
    obj.label35:setText("0");
    obj.label35:setField("ATRtot6");
    obj.label35:setName("label35");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj);
    obj.dataLink28:setFields({'ATRtot6'});
    obj.dataLink28:setDefaultValues({'0'});
    obj.dataLink28:setName("dataLink28");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj);
    obj.label36:setLeft(300);
    obj.label36:setTop(135);
    obj.label36:setWidth(150);
    obj.label36:setFontColor("black");
    obj.label36:setText("---");
    obj.label36:setField("equipamento1");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj);
    obj.label37:setLeft(300);
    obj.label37:setTop(165);
    obj.label37:setWidth(150);
    obj.label37:setFontColor("black");
    obj.label37:setText("---");
    obj.label37:setField("equipamento2");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj);
    obj.label38:setLeft(300);
    obj.label38:setTop(195);
    obj.label38:setWidth(150);
    obj.label38:setFontColor("black");
    obj.label38:setText("---");
    obj.label38:setField("equipamento3");
    obj.label38:setName("label38");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setLeft(280);
    obj.button5:setTop(135);
    obj.button5:setText("?");
    obj.button5:setWidth(18);
    obj.button5:setHeight(18);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setLeft(280);
    obj.button6:setTop(165);
    obj.button6:setText("?");
    obj.button6:setWidth(18);
    obj.button6:setHeight(18);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setLeft(280);
    obj.button7:setTop(195);
    obj.button7:setText("?");
    obj.button7:setWidth(18);
    obj.button7:setHeight(18);
    obj.button7:setName("button7");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj);
    obj.label39:setLeft(470);
    obj.label39:setTop(135);
    obj.label39:setWidth(150);
    obj.label39:setFontColor("black");
    obj.label39:setText("---");
    obj.label39:setField("talento1");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj);
    obj.label40:setLeft(470);
    obj.label40:setTop(165);
    obj.label40:setWidth(150);
    obj.label40:setFontColor("black");
    obj.label40:setText("---");
    obj.label40:setField("talento2");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj);
    obj.label41:setLeft(470);
    obj.label41:setTop(195);
    obj.label41:setWidth(150);
    obj.label41:setFontColor("black");
    obj.label41:setText("---");
    obj.label41:setField("talento3");
    obj.label41:setName("label41");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj);
    obj.button8:setLeft(450);
    obj.button8:setTop(135);
    obj.button8:setText("?");
    obj.button8:setWidth(18);
    obj.button8:setHeight(18);
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj);
    obj.button9:setLeft(450);
    obj.button9:setTop(165);
    obj.button9:setText("?");
    obj.button9:setWidth(18);
    obj.button9:setHeight(18);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj);
    obj.button10:setLeft(450);
    obj.button10:setTop(195);
    obj.button10:setText("?");
    obj.button10:setWidth(18);
    obj.button10:setHeight(18);
    obj.button10:setName("button10");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj);
    obj.label42:setFontSize(13);
    obj.label42:setFontColor("black");
    obj.label42:setLeft(280);
    obj.label42:setTop(225);
    obj.label42:setWidth(400);
    obj.label42:setHeight(150);
    obj.label42:setVertTextAlign("leading");
    obj.label42:setText("0");
    obj.label42:setField("HELPtext");
    obj.label42:setName("label42");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj);
    obj.textEditor1:setLeft(700);
    obj.textEditor1:setTop(000);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(140);
    obj.textEditor1:setText("");
    obj.textEditor1:setField("CTRLCV1");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj);
    obj.dataLink29:setFields({'CTRLCV1'});
    obj.dataLink29:setDefaultValues({'Anotações'});
    obj.dataLink29:setName("dataLink29");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj);
    obj.textEditor2:setLeft(700);
    obj.textEditor2:setTop(150);
    obj.textEditor2:setWidth(200);
    obj.textEditor2:setHeight(140);
    obj.textEditor2:setText("");
    obj.textEditor2:setField("CTRLCV2");
    obj.textEditor2:setName("textEditor2");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj);
    obj.dataLink30:setFields({'CTRLCV2'});
    obj.dataLink30:setDefaultValues({'Anotações'});
    obj.dataLink30:setName("dataLink30");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj);
    obj.textEditor3:setLeft(700);
    obj.textEditor3:setTop(300);
    obj.textEditor3:setWidth(200);
    obj.textEditor3:setHeight(140);
    obj.textEditor3:setText("");
    obj.textEditor3:setField("CTRLCV3");
    obj.textEditor3:setName("textEditor3");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj);
    obj.dataLink31:setFields({'CTRLCV3'});
    obj.dataLink31:setDefaultValues({'Anotações'});
    obj.dataLink31:setName("dataLink31");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj);
    obj.textEditor4:setLeft(000);
    obj.textEditor4:setTop(450);
    obj.textEditor4:setWidth(440);
    obj.textEditor4:setHeight(200);
    obj.textEditor4:setText("");
    obj.textEditor4:setField("CTRLCV4");
    obj.textEditor4:setName("textEditor4");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj);
    obj.dataLink32:setFields({'CTRLCV4'});
    obj.dataLink32:setDefaultValues({'Itens'});
    obj.dataLink32:setName("dataLink32");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj);
    obj.textEditor5:setLeft(460);
    obj.textEditor5:setTop(450);
    obj.textEditor5:setWidth(440);
    obj.textEditor5:setHeight(200);
    obj.textEditor5:setText("");
    obj.textEditor5:setField("CTRLCV5");
    obj.textEditor5:setName("textEditor5");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj);
    obj.dataLink33:setFields({'CTRLCV5'});
    obj.dataLink33:setDefaultValues({'História - Opcional'});
    obj.dataLink33:setName("dataLink33");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj);
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setLeft(10);
    obj.label43:setTop(660);
    obj.label43:setText("Ficha criada por Yiotoo. (Fábio Lofredo Cesar) v1.2");
    obj.label43:setFontColor("black");
    obj.label43:setWidth(400);
    obj.label43:setName("label43");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            HELPfunc( 'caracteristica', sheet.HELPcaracteristica );
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            main();
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            nivelfunc();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            nivelvoltarfunc();
        end, obj);

    obj._e_event4 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            habilitadofunc();
        end, obj);

    obj._e_event5 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot1 = atualizartotalfunc(sheet.ATR1,sheet.ATRMOD1);
        end, obj);

    obj._e_event6 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot2 = atualizartotalfunc(sheet.ATR2,sheet.ATRMOD2);
        end, obj);

    obj._e_event7 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot3 = atualizartotalfunc(sheet.ATR3,sheet.ATRMOD3);
        end, obj);

    obj._e_event8 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot4 = atualizartotalfunc(sheet.ATR4,sheet.ATRMOD4);
        end, obj);

    obj._e_event9 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot5 = atualizartotalfunc(sheet.ATR5,sheet.ATRMOD5);
        end, obj);

    obj._e_event10 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ATRtot6 = atualizartotalfunc(sheet.ATR6,sheet.ATRMOD6);
        end, obj);

    obj._e_event11 = obj.button5:addEventListener("onClick",
        function (_)
            HELPfunc( 'equipamento', sheet.equipamento1 );
        end, obj);

    obj._e_event12 = obj.button6:addEventListener("onClick",
        function (_)
            HELPfunc( 'equipamento', sheet.equipamento2 );
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            HELPfunc( 'equipamento', sheet.equipamento3 );
        end, obj);

    obj._e_event14 = obj.button8:addEventListener("onClick",
        function (_)
            HELPfunc( 'talento', sheet.talento1 );
        end, obj);

    obj._e_event15 = obj.button9:addEventListener("onClick",
        function (_)
            HELPfunc( 'talento', sheet.talento2 );
        end, obj);

    obj._e_event16 = obj.button10:addEventListener("onClick",
        function (_)
            HELPfunc( 'talento', sheet.talento3 );
        end, obj);

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaTeste()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaTeste();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaTeste = {
    newEditor = newfrmFichaTeste, 
    new = newfrmFichaTeste, 
    name = "frmFichaTeste", 
    dataType = "mg.mg.now", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Malditos Goblins", 
    description=""};

frmFichaTeste = _frmFichaTeste;
Firecast.registrarForm(_frmFichaTeste);
Firecast.registrarDataType(_frmFichaTeste);

return _frmFichaTeste;
