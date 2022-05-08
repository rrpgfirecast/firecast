require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmWeaponConfig()
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
    obj:setName("frmWeaponConfig");
    obj:setWidth(1110);
    obj:setHeight(280);
    obj:setTheme("dark");
    obj:setMargins({top=1, bottom=1});


		local function updateAll()
			if sheet == nil then
				return;
			end;
			local num = (tonumber(sheet.weaponType) or 1);
			sheet.num = sheet.weaponType;
			local node = NDB.getRoot(sheet);
			local nodes = NDB.getChildNodes(node.campoDasArmas); 
			sheet.weapon = nodes[num];

			if sheet.weapon== nil then
				return;
			end;

			local auto = sheet.weapon.batismo or sheet.weapon.nome or sheet.weapon.arma or "Arma";
			local nomeAtaque = sheet.weapon.batismo or sheet.weapon.nome or sheet.weapon.arma or "Arma";
    		local bba = tonumber(node.bba) or 0;
    		local acertos = {};

            -- Adicionando bônus de melhoria ou de qualidade Obra-Prima ao acerto
    		local pen = tonumber(sheet.weapon.qualidade) or 0;
            if Utils.compareStringPtBr(sheet.weapon.qualidade, "Obra-Prima")==0 or Utils.compareStringPtBr(sheet.weapon.qualidade, "OP")==0 or Utils.compareStringPtBr(sheet.weapon.qualidade, "ObraPrima")==0  then
    			pen = 1;
    		end;
    		pen = pen + (tonumber(node.buffAtaque) or 0);
            pen = pen + (tonumber(node.tamanhoCa) or 0);

    		-- Pegando o valor dos atributos
            local forc = tonumber(node.efetModFor) or 0;
            local des = tonumber(node.efetModDes) or 0;
            local con = tonumber(node.efetModCon) or 0;
            local int = tonumber(node.efetModInt) or 0;
            local sab  = tonumber(node.efetModSab) or 0;
            local car = tonumber(node.efetModCar) or 0;

            if sheet.useStr then pen = pen + forc end;
            if sheet.useDex then pen = pen + des end;
            if sheet.useCon then pen = pen + con end;
            if sheet.useInt then pen = pen + int end;
            if sheet.useSab then pen = pen + sab end;
            if sheet.useCar then pen = pen + car end;

            -- Calculando a quantidade de ataques e seus acertos
    		acertos[1] = bba;
    		local i = 2;
    		if sheet.velocidade then
    			acertos[2] = bba;
    			i = i + 1;
    		end;
    		if sheet.tiroRapidoAprimorado then
    			acertos[i] = bba;
    			i = i + 1;
    		elseif sheet.tiroRapido then
    			acertos[i] = bba;
    			i = i + 1;
    			pen = pen - 2;
    		end;
    		if sheet.rajada then
    			local qtd = tonumber(sheet.rajadaQtd) or 0;
    			local pnl = math.abs(tonumber(sheet.rajadaPen) or 0);
    			for j=1, qtd, 1 do
    				acertos[i] = bba;
    				i = i + 1;
    			end;
    			pen = pen - pnl;
    		end;
            if sheet.flanquear then
                pen = pen + 2;
            end;

            local limite = 4;
            if sheet.limite then
                limite = tonumber(sheet.limiteQtd) or 4;
            end;
    		if bba-5 > 0 and limite>1 then
    			acertos[i] = bba -5;
    			i = i + 1;
    		end;
    		if bba-10 > 0 and limite>2 then
    			acertos[i] = bba -10;
    			i = i + 1;
    		end;
    		if bba-15 > 0 and limite>3 then
    			acertos[i] = bba -15;
    			i = i + 1;
    		end;

    		if sheet.combate2armasLeve then
    			pen = pen - 2;
    		elseif sheet.combate2armas then
    			pen = pen -4;
    		end;
    		if sheet.talentos then
    			pen = pen + (tonumber(sheet.talentosAtaq) or 0);
    		end;
    		if sheet.outros then
    			pen = pen + (tonumber(sheet.outrosAtaq) or 0);
    		end;
            if sheet.outros1 then
                pen = pen + (tonumber(sheet.outros1Ataq) or 0);
            end;
            if sheet.outros2 then
                pen = pen + (tonumber(sheet.outros2Ataq) or 0);
            end;
            if sheet.outros3 then
                pen = pen + (tonumber(sheet.outros3Ataq) or 0);
            end;
            if sheet.outros4 then
                pen = pen + (tonumber(sheet.outros4Ataq) or 0);
            end;
    		if sheet.itens then
    			pen = pen + (tonumber(sheet.itensAtaq) or 0);
    		end;
    		if sheet.magias then
    			pen = pen + (tonumber(sheet.magiasAtaq) or 0);
    		end;
    		if sheet.extra then
    			pen = pen + (tonumber(sheet.extraAtaq) or 0);
    		end;
    		if sheet.tamanho then
    			pen = pen + (tonumber(sheet.tamanhoPen) or 0);
    		end;
    		if sheet.ataquePoderoso then
    			pen = pen - math.abs(tonumber(sheet.ataquePoderosoPen) or 0);
    		end;
    		if sheet.especializacaoCombate then
    			pen = pen - math.abs(tonumber(sheet.especializacaoCombatePen) or 0);
    		end;
    		if sheet.alcance then
    			pen = pen - math.abs(tonumber(sheet.alcancePen) or 0);
    		end;

            local multMunicao = 0;
    		if sheet.tiroMultiplo then
    			acertos = {};
    			acertos[1] = bba;
    			pen = pen-2;
    			local qtd = tonumber(sheet.tiroMultiploQtd) or 1;
                multMunicao = qtd;
    			pen = pen - (qtd * 2);
    		end;

    		if sheet.ataqueMultiplo then
                acertos = {};
                local qtd = tonumber(sheet.ataqueMultiploQtd) or 1;
                for j=1, qtd, 1 do
                    acertos[j] = bba;
                end;
                pen = pen - math.abs(tonumber(sheet.ataqueMultiploPen) or 0);
            end;

    		auto = auto .. " ";
    		for j=1, #acertos, 1 do
    			acertos[j] = acertos[j] + pen;
    			auto = auto .. "+" .. acertos[j];
    			if j ~= #acertos then
    				auto = auto .. "/";
    			end;
    		end;

    		-- Calculando o dano
    		local dado = sheet.weapon.dano or "1d1";
    		if sheet.tamanho and sheet.tamanhoDado~="Dado" then
    			dado = sheet.tamanhoDado or "1d1";
    		end;

    		-- Melhoria da arma
    		local apr = tonumber(sheet.weapon.qualidade) or 0;
    		if apr ~= 0 then
    			dado = dado .. "+" .. apr;
    		end;

    		-- Adicionando bonus de atributos

            local multStr = tonumber(sheet.multStr) or 0;
            local multDex = tonumber(sheet.multDex) or 0;
            local multCon = tonumber(sheet.multCon) or 0;
            local multInt = tonumber(sheet.multInt) or 0;
            local multSab = tonumber(sheet.multSab) or 0;
            local multCar = tonumber(sheet.multCar) or 0;

            if multStr > 0 then
                if sheet.composto then
                    -- aplique os limites de dano por força em armas compostas
                    local limit = tonumber(sheet.compostoLim) or 0;
                    dado = dado .. "+" .. math.min(math.floor(forc*multStr), limit);
                    -- se o bonus de força for menor que o minimo para a arma aplique a penalidade
                    if forc < limit then
                        pen = pen - 2;
                    end;
                else
                    dado = dado .. "+" .. math.floor(forc*multStr)
                end;
            end
            if multDex > 0 then dado = dado .. "+" .. math.floor(des*multDex) end
            if multCon > 0 then dado = dado .. "+" .. math.floor(con*multCon) end
            if multInt > 0 then dado = dado .. "+" .. math.floor(int*multInt) end
            if multSab > 0 then dado = dado .. "+" .. math.floor(sab*multSab) end
            if multCar > 0 then dado = dado .. "+" .. math.floor(car*multCar) end

    		local tiros = dado;
    		-- Dano que não se aplica a tiros multiplos
    		if sheet.ataquePoderoso then
    			local dmg = math.abs(tonumber(sheet.ataquePoderosoPen) or 0);

                dmg = dmg * multStr;

    			dado = dado .. "+" .. dmg;
    		end;

    		local crit = dado;
    		-- Dano que não é necessariamente aplicado a criticos, mas se aplica a tiros multiplos
    		if sheet.talentos then
    			if sheet.talentosDano ~= "Dano" then
    				dado = dado .. (sheet.talentosDano or "");
    				tiros = tiros .. (sheet.talentosDano or "");
    			end;
    			if sheet.talentosCrit~="Crit" then
    				crit = crit .. (sheet.talentosCrit or "");
    			end;
    		end;
    		if sheet.itens then
    			if sheet.itensDano ~= "Dano" then
    				dado = dado .. (sheet.itensDano or "");
    				tiros = tiros .. (sheet.itensDano or "");
    			end;
    			if sheet.itensCrit~="Crit" then
    				crit = crit .. (sheet.itensCrit or "");
    			end;
    		end;
    		if sheet.magias then
    			if sheet.magiasDano ~= "Dano" then
    				dado = dado .. (sheet.magiasDano or "");
    				tiros = tiros .. (sheet.magiasDano or "");
    			end;
    			if sheet.magiasCrit~="Crit" then
    				crit = crit .. (sheet.magiasCrit or "");
    			end;
    		end;
    		if sheet.extra then
    			if sheet.extraDano ~= "Dano" then
    				dado = dado .. (sheet.extraDano or "");
    				tiros = tiros .. (sheet.extraDano or "");
    			end;
    			if sheet.extraCrit~="Crit" then
    				crit = crit .. (sheet.extraCrit or "");
    			end;
    		end;
    		if sheet.outros then
    			if sheet.outrosDano ~= "Dano" then
    				dado = dado .. (sheet.outrosDano or "");
    				tiros = tiros .. (sheet.outrosDano or "");
    			end;
    			if sheet.outrosCrit~="Crit" then
    				crit = crit .. (sheet.outrosCrit or "");
    			end;
    		end;
            if sheet.outros1 then
                if sheet.outros1Dano ~= "Dano" then
                    dado = dado .. (sheet.outros1Dano or "");
                    tiros = tiros .. (sheet.outros1Dano or "");
                end;
                if sheet.outros1Crit~="Crit" then
                    crit = crit .. (sheet.outros1Crit or "");
                end;
            end;
            if sheet.outros2 then
                if sheet.outros2Dano ~= "Dano" then
                    dado = dado .. (sheet.outros2Dano or "");
                    tiros = tiros .. (sheet.outros2Dano or "");
                end;
                if sheet.outros2Crit~="Crit" then
                    crit = crit .. (sheet.outros2Crit or "");
                end;
            end;
            if sheet.outros3 then
                if sheet.outros3Dano ~= "Dano" then
                    dado = dado .. (sheet.outros3Dano or "");
                    tiros = tiros .. (sheet.outros3Dano or "");
                end;
                if sheet.outros3Crit~="Crit" then
                    crit = crit .. (sheet.outros3Crit or "");
                end;
            end;
            if sheet.outros4 then
                if sheet.outros4Dano ~= "Dano" then
                    dado = dado .. (sheet.outros4Dano or "");
                    tiros = tiros .. (sheet.outros4Dano or "");
                end;
                if sheet.outros4Crit~="Crit" then
                    crit = crit .. (sheet.outros4Crit or "");
                end;
            end;
    		if node.buffDano~= nil then
    			dado = dado .. node.buffDano;
    			tiros = tiros .. node.buffDano;
    		end;
    		if node.buffDanoCritico~=nil then
    			crit = crit .. node.buffDanoCritico;
    		end;

    		--Dano que não é aplicado a criticos
    		local precisao = "";
    		local extraCrit = "";
    		if sheet.energia then
    			dado = dado .. (sheet.energiaDano or "");
    			precisao = precisao .. (sheet.energiaDano or "");
    			if sheet.energiaCrit~="Crit" then
    				extraCrit = (sheet.energiaCrit or "");
    			end;
    		end;
    		if sheet.furtivo then
    			dado = dado .. (sheet.furtivoDano or "");
    			precisao = precisao .. (sheet.furtivoDano or "");
    		end;

    		if sheet.tiroMultiplo then
    			local qtd = tonumber(sheet.tiroMultiploQtd) or 1;
    			local flecha = tiros;
    			tiros = tiros .. precisao;
    			for j=1, qtd, 1 do
    				tiros = tiros .. "+" .. flecha;
	    		end;
	    		dado = tiros;
    		end;

    		auto = auto .. " (" .. dado .. ", ";

    		-- Calculando a chance de critico

    		local decisivo = 20;
    		if sheet.weapon.decisivo~= nil then
    			decisivo = tonumber(string.sub(sheet.weapon.decisivo, 1, 2));
    		end;
    		auto = auto .. (sheet.weapon.decisivo or 20) .. "/";

    		--Calculando multiplicador e dano extra por critico
    		local mod = sheet.weapon.multiplicador or "2";
    		mod = string.gsub(mod, "x", "");
            mod = string.gsub(mod, "X", "");
    		local multiplicador = tonumber(mod) or 2;
    		auto = auto .. "x" .. multiplicador .. " [";

    		local extra = crit;
    		crit = "";
    		for j=2, multiplicador, 1 do
    			crit = crit .. "+" .. extra;
    		end;
    		if extraCrit~="" then
    			crit = crit .. extraCrit;
    		end;
    		auto = auto .. crit .. "]) ";

    		-- Calculando Alcance
    		if sheet.weapon.alcance ~= nil then
    			local mod = sheet.weapon.alcance;
    			mod = string.gsub(mod, "m", "");
    			mod = string.gsub(mod, "M", "");
    			local alcance = tonumber(mod);
    			if alcance ~= nil then
    				if sheet.alcance then
    					alcance = alcance * (tonumber(sheet.alcanceMult) or 1);
    				end;
    				auto = auto .. alcance .. "m";
    			end;
    		end;

    		sheet.auto = auto;
    		sheet.nomeAtaque = nomeAtaque;

    		sheet.acertos = acertos;
    		sheet.numAtaques = #acertos;
            sheet.multMunicao = multMunicao;
    		sheet.dado = dado;
    		sheet.crit = crit;
    		sheet.decisivo = decisivo;
		end;
	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.default = GUI.fromHandle(_obj_newObject("layout"));
    obj.default:setParent(obj.rectangle1);
    obj.default:setAlign("client");
    obj.default:setName("default");
    obj.default:setMargins({top=4, bottom=4, left=5, right=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.default);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.weaponType = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.weaponType:setParent(obj.layout1);
    obj.weaponType:setAlign("left");
    obj.weaponType:setWidth(200);
    obj.weaponType:setName("weaponType");
    obj.weaponType:setField("weaponType");
    obj.weaponType:setFontColor("white");

    obj.auto = GUI.fromHandle(_obj_newObject("layout"));
    obj.auto:setParent(obj.layout1);
    obj.auto:setAlign("client");
    obj.auto:setName("auto");
    obj.auto:setVisible(true);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.auto);
    obj.label1:setAlign("client");
    obj.label1:setField("auto");
    obj.label1:setText("Escolha uma Arma");
    obj.label1:setName("label1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.default);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(230);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout3);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setWidth(150);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("Furtivo");
    obj.checkBox1:setField("furtivo");
    obj.checkBox1:setHint("Adicione aqui o seu valor de ataque furtivo no formato +xd6, sendo x a quantidade de dados extras. ");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(150);
    obj.edit1:setWidth(40);
    obj.edit1:setHeight(25);
    obj.edit1:setField("furtivoDano");
    obj.edit1:setName("edit1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout3);
    obj.dataLink1:setField("furtivoDano");
    obj.dataLink1:setDefaultValue("Dano");
    obj.dataLink1:setName("dataLink1");


                local num = tonumber(1);
            


    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout4);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setWidth(150);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Ataque Poderoso");
    obj.checkBox2:setField("ataquePoderoso");
    obj.checkBox2:setHint("Coloque aqui a penalidade do seu ataque poderoso. Esse valor será multiplicado e adicionado ao seu dano de acordo com as regras do talento. ");
    obj.checkBox2:setName("checkBox2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setLeft(150);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(25);
    obj.edit2:setField("ataquePoderosoPen");
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setField("ataquePoderosoPen");
    obj.dataLink2:setDefaultValue("Pen");
    obj.dataLink2:setName("dataLink2");


                local num = tonumber(1);
            


    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout5);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setWidth(150);
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setText("Espec. em Combate");
    obj.checkBox3:setField("especializacaoCombate");
    obj.checkBox3:setHint("");
    obj.checkBox3:setName("checkBox3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setLeft(150);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("especializacaoCombatePen");
    obj.edit3:setName("edit3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setField("especializacaoCombatePen");
    obj.dataLink3:setDefaultValue("Pen");
    obj.dataLink3:setName("dataLink3");


                local num = tonumber(1);
            


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout6);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setWidth(150);
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setText("Tiro Multiplo");
    obj.checkBox4:setField("tiroMultiplo");
    obj.checkBox4:setHint("");
    obj.checkBox4:setName("checkBox4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setLeft(150);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("tiroMultiploQtd");
    obj.edit4:setName("edit4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout6);
    obj.dataLink4:setField("tiroMultiploQtd");
    obj.dataLink4:setDefaultValue("Qtd");
    obj.dataLink4:setName("dataLink4");


                local num = tonumber(1);
            


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout7);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setWidth(150);
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setText("Composto");
    obj.checkBox5:setField("composto");
    obj.checkBox5:setHint("");
    obj.checkBox5:setName("checkBox5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setLeft(150);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("compostoLim");
    obj.edit5:setName("edit5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout7);
    obj.dataLink5:setField("compostoLim");
    obj.dataLink5:setDefaultValue("Lim");
    obj.dataLink5:setName("dataLink5");


                local num = tonumber(1);
            


    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout8);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setWidth(150);
    obj.checkBox6:setHeight(25);
    obj.checkBox6:setText("Limite");
    obj.checkBox6:setField("limite");
    obj.checkBox6:setHint("");
    obj.checkBox6:setName("checkBox6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setLeft(150);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(25);
    obj.edit6:setField("limiteQtd");
    obj.edit6:setName("edit6");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout8);
    obj.dataLink6:setField("limiteQtd");
    obj.dataLink6:setDefaultValue("Qtd");
    obj.dataLink6:setName("dataLink6");


                local num = tonumber(1);
            


    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout9);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setWidth(150);
    obj.checkBox7:setHeight(25);
    obj.checkBox7:setText("Ataque Multiplo");
    obj.checkBox7:setField("ataqueMultiplo");
    obj.checkBox7:setHint("Coloque aqui quantos ataques naturais são feitos com essa arma. Adicione também as penalidades por ataques primarios ou secundarios.");
    obj.checkBox7:setName("checkBox7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(150);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("ataqueMultiploQtd");
    obj.edit7:setName("edit7");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout9);
    obj.dataLink7:setField("ataqueMultiploQtd");
    obj.dataLink7:setDefaultValue("Qtd");
    obj.dataLink7:setName("dataLink7");


                local num = tonumber(2);
            


    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(190);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("ataqueMultiploPen");
    obj.edit8:setName("edit8");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout9);
    obj.dataLink8:setField("ataqueMultiploPen");
    obj.dataLink8:setDefaultValue("Pen");
    obj.dataLink8:setName("dataLink8");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout10);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setWidth(150);
    obj.checkBox8:setHeight(25);
    obj.checkBox8:setText("Alcance");
    obj.checkBox8:setField("alcance");
    obj.checkBox8:setHint("");
    obj.checkBox8:setName("checkBox8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(150);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("alcanceMult");
    obj.edit9:setName("edit9");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout10);
    obj.dataLink9:setField("alcanceMult");
    obj.dataLink9:setDefaultValue("Mult");
    obj.dataLink9:setName("dataLink9");


                local num = tonumber(2);
            


    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setLeft(190);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("alcancePen");
    obj.edit10:setName("edit10");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout10);
    obj.dataLink10:setField("alcancePen");
    obj.dataLink10:setDefaultValue("Pen");
    obj.dataLink10:setName("dataLink10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout11);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setWidth(150);
    obj.checkBox9:setHeight(25);
    obj.checkBox9:setText("Rajada de Golpes");
    obj.checkBox9:setField("rajada");
    obj.checkBox9:setHint("");
    obj.checkBox9:setName("checkBox9");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setLeft(150);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("rajadaQtd");
    obj.edit11:setName("edit11");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout11);
    obj.dataLink11:setField("rajadaQtd");
    obj.dataLink11:setDefaultValue("Qtd");
    obj.dataLink11:setName("dataLink11");


                local num = tonumber(2);
            


    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout11);
    obj.edit12:setLeft(190);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(25);
    obj.edit12:setField("rajadaPen");
    obj.edit12:setName("edit12");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout11);
    obj.dataLink12:setField("rajadaPen");
    obj.dataLink12:setDefaultValue("Pen");
    obj.dataLink12:setName("dataLink12");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout12);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setWidth(150);
    obj.checkBox10:setHeight(25);
    obj.checkBox10:setText("Tamanho");
    obj.checkBox10:setField("tamanho");
    obj.checkBox10:setHint("");
    obj.checkBox10:setName("checkBox10");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setLeft(150);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("tamanhoDado");
    obj.edit13:setName("edit13");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout12);
    obj.dataLink13:setField("tamanhoDado");
    obj.dataLink13:setDefaultValue("Dado");
    obj.dataLink13:setName("dataLink13");


                local num = tonumber(2);
            


    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout12);
    obj.edit14:setLeft(190);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("tamanhoPen");
    obj.edit14:setName("edit14");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout12);
    obj.dataLink14:setField("tamanhoPen");
    obj.dataLink14:setDefaultValue("Pen");
    obj.dataLink14:setName("dataLink14");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.default);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(270);
    obj.layout13:setMargins({right=5});
    obj.layout13:setName("layout13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout14);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setWidth(150);
    obj.checkBox11:setHeight(25);
    obj.checkBox11:setText("Dano por Energia");
    obj.checkBox11:setField("energia");
    obj.checkBox11:setHint("");
    obj.checkBox11:setName("checkBox11");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setLeft(150);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("energiaDano");
    obj.edit15:setName("edit15");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout14);
    obj.dataLink15:setField("energiaDano");
    obj.dataLink15:setDefaultValue("Dano");
    obj.dataLink15:setName("dataLink15");


                local num = tonumber(2);
            


    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setLeft(190);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(25);
    obj.edit16:setField("energiaCrit");
    obj.edit16:setName("edit16");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout14);
    obj.dataLink16:setField("energiaCrit");
    obj.dataLink16:setDefaultValue("Crit");
    obj.dataLink16:setName("dataLink16");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout15);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setWidth(150);
    obj.checkBox12:setHeight(25);
    obj.checkBox12:setText("Talentos");
    obj.checkBox12:setField("talentos");
    obj.checkBox12:setHint("");
    obj.checkBox12:setName("checkBox12");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setLeft(150);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setField("talentosDano");
    obj.edit17:setName("edit17");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout15);
    obj.dataLink17:setField("talentosDano");
    obj.dataLink17:setDefaultValue("Dano");
    obj.dataLink17:setName("dataLink17");


                local num = tonumber(3);
            


    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setLeft(190);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setField("talentosCrit");
    obj.edit18:setName("edit18");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout15);
    obj.dataLink18:setField("talentosCrit");
    obj.dataLink18:setDefaultValue("Crit");
    obj.dataLink18:setName("dataLink18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setLeft(230);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setField("talentosAtaq");
    obj.edit19:setName("edit19");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout15);
    obj.dataLink19:setField("talentosAtaq");
    obj.dataLink19:setDefaultValue("Ataq");
    obj.dataLink19:setName("dataLink19");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout16);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setWidth(150);
    obj.checkBox13:setHeight(25);
    obj.checkBox13:setText("Itens");
    obj.checkBox13:setField("itens");
    obj.checkBox13:setHint("");
    obj.checkBox13:setName("checkBox13");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setLeft(150);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setField("itensDano");
    obj.edit20:setName("edit20");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout16);
    obj.dataLink20:setField("itensDano");
    obj.dataLink20:setDefaultValue("Dano");
    obj.dataLink20:setName("dataLink20");


                local num = tonumber(3);
            


    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setLeft(190);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(25);
    obj.edit21:setField("itensCrit");
    obj.edit21:setName("edit21");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout16);
    obj.dataLink21:setField("itensCrit");
    obj.dataLink21:setDefaultValue("Crit");
    obj.dataLink21:setName("dataLink21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout16);
    obj.edit22:setLeft(230);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(25);
    obj.edit22:setField("itensAtaq");
    obj.edit22:setName("edit22");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout16);
    obj.dataLink22:setField("itensAtaq");
    obj.dataLink22:setDefaultValue("Ataq");
    obj.dataLink22:setName("dataLink22");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout13);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout17);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setWidth(150);
    obj.checkBox14:setHeight(25);
    obj.checkBox14:setText("Magias");
    obj.checkBox14:setField("magias");
    obj.checkBox14:setHint("");
    obj.checkBox14:setName("checkBox14");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setLeft(150);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setField("magiasDano");
    obj.edit23:setName("edit23");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout17);
    obj.dataLink23:setField("magiasDano");
    obj.dataLink23:setDefaultValue("Dano");
    obj.dataLink23:setName("dataLink23");


                local num = tonumber(3);
            


    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout17);
    obj.edit24:setLeft(190);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(25);
    obj.edit24:setField("magiasCrit");
    obj.edit24:setName("edit24");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout17);
    obj.dataLink24:setField("magiasCrit");
    obj.dataLink24:setDefaultValue("Crit");
    obj.dataLink24:setName("dataLink24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout17);
    obj.edit25:setLeft(230);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setField("magiasAtaq");
    obj.edit25:setName("edit25");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout17);
    obj.dataLink25:setField("magiasAtaq");
    obj.dataLink25:setDefaultValue("Ataq");
    obj.dataLink25:setName("dataLink25");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout13);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout18);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setWidth(15);
    obj.checkBox15:setHeight(25);
    obj.checkBox15:setField("extra");
    obj.checkBox15:setHint("");
    obj.checkBox15:setName("checkBox15");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout18);
    obj.edit26:setLeft(20);
    obj.edit26:setWidth(125);
    obj.edit26:setHeight(25);
    obj.edit26:setField("extraName)");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout18);
    obj.edit27:setLeft(150);
    obj.edit27:setWidth(40);
    obj.edit27:setHeight(25);
    obj.edit27:setField("extraDano");
    obj.edit27:setName("edit27");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout18);
    obj.dataLink26:setField("extraDano");
    obj.dataLink26:setDefaultValue("Dano");
    obj.dataLink26:setName("dataLink26");


                local num = tonumber(3);
            


    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout18);
    obj.edit28:setLeft(190);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setField("extraCrit");
    obj.edit28:setName("edit28");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout18);
    obj.dataLink27:setField("extraCrit");
    obj.dataLink27:setDefaultValue("Crit");
    obj.dataLink27:setName("dataLink27");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout18);
    obj.edit29:setLeft(230);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("extraAtaq");
    obj.edit29:setName("edit29");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout18);
    obj.dataLink28:setField("extraAtaq");
    obj.dataLink28:setDefaultValue("Ataq");
    obj.dataLink28:setName("dataLink28");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout13);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout19);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setWidth(15);
    obj.checkBox16:setHeight(25);
    obj.checkBox16:setField("outros");
    obj.checkBox16:setHint("");
    obj.checkBox16:setName("checkBox16");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout19);
    obj.edit30:setLeft(20);
    obj.edit30:setWidth(125);
    obj.edit30:setHeight(25);
    obj.edit30:setField("outrosName)");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout19);
    obj.edit31:setLeft(150);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(25);
    obj.edit31:setField("outrosDano");
    obj.edit31:setName("edit31");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout19);
    obj.dataLink29:setField("outrosDano");
    obj.dataLink29:setDefaultValue("Dano");
    obj.dataLink29:setName("dataLink29");


                local num = tonumber(3);
            


    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout19);
    obj.edit32:setLeft(190);
    obj.edit32:setWidth(40);
    obj.edit32:setHeight(25);
    obj.edit32:setField("outrosCrit");
    obj.edit32:setName("edit32");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout19);
    obj.dataLink30:setField("outrosCrit");
    obj.dataLink30:setDefaultValue("Crit");
    obj.dataLink30:setName("dataLink30");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout19);
    obj.edit33:setLeft(230);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("outrosAtaq");
    obj.edit33:setName("edit33");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout19);
    obj.dataLink31:setField("outrosAtaq");
    obj.dataLink31:setDefaultValue("Ataq");
    obj.dataLink31:setName("dataLink31");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout13);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout20);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setWidth(15);
    obj.checkBox17:setHeight(25);
    obj.checkBox17:setField("outros1");
    obj.checkBox17:setHint("");
    obj.checkBox17:setName("checkBox17");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout20);
    obj.edit34:setLeft(20);
    obj.edit34:setWidth(125);
    obj.edit34:setHeight(25);
    obj.edit34:setField("outros1Name)");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout20);
    obj.edit35:setLeft(150);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(25);
    obj.edit35:setField("outros1Dano");
    obj.edit35:setName("edit35");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout20);
    obj.dataLink32:setField("outros1Dano");
    obj.dataLink32:setDefaultValue("Dano");
    obj.dataLink32:setName("dataLink32");


                local num = tonumber(3);
            


    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout20);
    obj.edit36:setLeft(190);
    obj.edit36:setWidth(40);
    obj.edit36:setHeight(25);
    obj.edit36:setField("outros1Crit");
    obj.edit36:setName("edit36");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout20);
    obj.dataLink33:setField("outros1Crit");
    obj.dataLink33:setDefaultValue("Crit");
    obj.dataLink33:setName("dataLink33");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout20);
    obj.edit37:setLeft(230);
    obj.edit37:setWidth(40);
    obj.edit37:setHeight(25);
    obj.edit37:setField("outros1Ataq");
    obj.edit37:setName("edit37");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout20);
    obj.dataLink34:setField("outros1Ataq");
    obj.dataLink34:setDefaultValue("Ataq");
    obj.dataLink34:setName("dataLink34");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout13);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout21);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setWidth(15);
    obj.checkBox18:setHeight(25);
    obj.checkBox18:setField("outros2");
    obj.checkBox18:setHint("");
    obj.checkBox18:setName("checkBox18");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout21);
    obj.edit38:setLeft(20);
    obj.edit38:setWidth(125);
    obj.edit38:setHeight(25);
    obj.edit38:setField("outros2Name)");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout21);
    obj.edit39:setLeft(150);
    obj.edit39:setWidth(40);
    obj.edit39:setHeight(25);
    obj.edit39:setField("outros2Dano");
    obj.edit39:setName("edit39");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout21);
    obj.dataLink35:setField("outros2Dano");
    obj.dataLink35:setDefaultValue("Dano");
    obj.dataLink35:setName("dataLink35");


                local num = tonumber(3);
            


    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout21);
    obj.edit40:setLeft(190);
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(25);
    obj.edit40:setField("outros2Crit");
    obj.edit40:setName("edit40");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout21);
    obj.dataLink36:setField("outros2Crit");
    obj.dataLink36:setDefaultValue("Crit");
    obj.dataLink36:setName("dataLink36");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout21);
    obj.edit41:setLeft(230);
    obj.edit41:setWidth(40);
    obj.edit41:setHeight(25);
    obj.edit41:setField("outros2Ataq");
    obj.edit41:setName("edit41");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout21);
    obj.dataLink37:setField("outros2Ataq");
    obj.dataLink37:setDefaultValue("Ataq");
    obj.dataLink37:setName("dataLink37");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout13);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout22);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setWidth(15);
    obj.checkBox19:setHeight(25);
    obj.checkBox19:setField("outros3");
    obj.checkBox19:setHint("");
    obj.checkBox19:setName("checkBox19");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout22);
    obj.edit42:setLeft(20);
    obj.edit42:setWidth(125);
    obj.edit42:setHeight(25);
    obj.edit42:setField("outros3Name)");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout22);
    obj.edit43:setLeft(150);
    obj.edit43:setWidth(40);
    obj.edit43:setHeight(25);
    obj.edit43:setField("outros3Dano");
    obj.edit43:setName("edit43");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout22);
    obj.dataLink38:setField("outros3Dano");
    obj.dataLink38:setDefaultValue("Dano");
    obj.dataLink38:setName("dataLink38");


                local num = tonumber(3);
            


    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout22);
    obj.edit44:setLeft(190);
    obj.edit44:setWidth(40);
    obj.edit44:setHeight(25);
    obj.edit44:setField("outros3Crit");
    obj.edit44:setName("edit44");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout22);
    obj.dataLink39:setField("outros3Crit");
    obj.dataLink39:setDefaultValue("Crit");
    obj.dataLink39:setName("dataLink39");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout22);
    obj.edit45:setLeft(230);
    obj.edit45:setWidth(40);
    obj.edit45:setHeight(25);
    obj.edit45:setField("outros3Ataq");
    obj.edit45:setName("edit45");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout22);
    obj.dataLink40:setField("outros3Ataq");
    obj.dataLink40:setDefaultValue("Ataq");
    obj.dataLink40:setName("dataLink40");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout13);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout23);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setWidth(15);
    obj.checkBox20:setHeight(25);
    obj.checkBox20:setField("outros4");
    obj.checkBox20:setHint("");
    obj.checkBox20:setName("checkBox20");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout23);
    obj.edit46:setLeft(20);
    obj.edit46:setWidth(125);
    obj.edit46:setHeight(25);
    obj.edit46:setField("outros4Name)");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout23);
    obj.edit47:setLeft(150);
    obj.edit47:setWidth(40);
    obj.edit47:setHeight(25);
    obj.edit47:setField("outros4Dano");
    obj.edit47:setName("edit47");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout23);
    obj.dataLink41:setField("outros4Dano");
    obj.dataLink41:setDefaultValue("Dano");
    obj.dataLink41:setName("dataLink41");


                local num = tonumber(3);
            


    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout23);
    obj.edit48:setLeft(190);
    obj.edit48:setWidth(40);
    obj.edit48:setHeight(25);
    obj.edit48:setField("outros4Crit");
    obj.edit48:setName("edit48");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout23);
    obj.dataLink42:setField("outros4Crit");
    obj.dataLink42:setDefaultValue("Crit");
    obj.dataLink42:setName("dataLink42");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout23);
    obj.edit49:setLeft(230);
    obj.edit49:setWidth(40);
    obj.edit49:setHeight(25);
    obj.edit49:setField("outros4Ataq");
    obj.edit49:setName("edit49");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout23);
    obj.dataLink43:setField("outros4Ataq");
    obj.dataLink43:setDefaultValue("Ataq");
    obj.dataLink43:setName("dataLink43");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.default);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(150);
    obj.layout24:setMargins({right=5});
    obj.layout24:setName("layout24");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout24);
    obj.checkBox21:setAlign("top");
    obj.checkBox21:setHeight(25);
    obj.checkBox21:setText("Duas Armas");
    obj.checkBox21:setField("combate2armas");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout24);
    obj.checkBox22:setAlign("top");
    obj.checkBox22:setHeight(25);
    obj.checkBox22:setText("Duas Armas Leves");
    obj.checkBox22:setField("combate2armasLeve");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout24);
    obj.checkBox23:setAlign("top");
    obj.checkBox23:setHeight(25);
    obj.checkBox23:setText("Velocidade");
    obj.checkBox23:setField("velocidade");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout24);
    obj.checkBox24:setAlign("top");
    obj.checkBox24:setHeight(25);
    obj.checkBox24:setText("Tiro Rapido");
    obj.checkBox24:setField("tiroRapido");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout24);
    obj.checkBox25:setAlign("top");
    obj.checkBox25:setHeight(25);
    obj.checkBox25:setText("Tiro Rapido Apr.");
    obj.checkBox25:setField("tiroRapidoAprimorado");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout24);
    obj.checkBox26:setAlign("top");
    obj.checkBox26:setHeight(25);
    obj.checkBox26:setText("Flanquear");
    obj.checkBox26:setField("flanquear");
    obj.checkBox26:setName("checkBox26");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout25);
    obj.label2:setLeft(20);
    obj.label2:setWidth(80);
    obj.label2:setHeight(25);
    obj.label2:setText("Munição");
    obj.label2:setHint("Vão ser consumidas automaticamente durante ataques. Se acabarem um aviso vai exibir no chat, mas não vai impedir novos ataques de serem feitos.");
    obj.label2:setName("label2");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout25);
    obj.edit50:setLeft(100);
    obj.edit50:setWidth(40);
    obj.edit50:setHeight(25);
    obj.edit50:setField("municao");
    obj.edit50:setName("edit50");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout24);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout26);
    obj.label3:setLeft(20);
    obj.label3:setWidth(80);
    obj.label3:setHeight(25);
    obj.label3:setText("Confirmação");
    obj.label3:setHint("Bônus para confirmar sucessos decisivos.");
    obj.label3:setName("label3");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout26);
    obj.edit51:setLeft(100);
    obj.edit51:setWidth(40);
    obj.edit51:setHeight(25);
    obj.edit51:setField("confirmacaoAtaq");
    obj.edit51:setName("edit51");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.default);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(150);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout28);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setWidth(100);
    obj.checkBox27:setText("Força");
    obj.checkBox27:setField("useStr");
    obj.checkBox27:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox27:setName("checkBox27");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout28);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setField("multStr");
    obj.comboBox1:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox1:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout28);
    obj.dataLink44:setField("multStr");
    obj.dataLink44:setDefaultValue("0");
    obj.dataLink44:setName("dataLink44");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout29);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setWidth(100);
    obj.checkBox28:setText("Destreza");
    obj.checkBox28:setField("useDex");
    obj.checkBox28:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox28:setName("checkBox28");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout29);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setWidth(50);
    obj.comboBox2:setField("multDex");
    obj.comboBox2:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox2:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox2:setName("comboBox2");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout29);
    obj.dataLink45:setField("multDex");
    obj.dataLink45:setDefaultValue("0");
    obj.dataLink45:setName("dataLink45");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout30);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(100);
    obj.checkBox29:setText("Constituição");
    obj.checkBox29:setField("useCon");
    obj.checkBox29:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox29:setName("checkBox29");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout30);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setWidth(50);
    obj.comboBox3:setField("multCon");
    obj.comboBox3:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox3:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox3:setName("comboBox3");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout30);
    obj.dataLink46:setField("multCon");
    obj.dataLink46:setDefaultValue("0");
    obj.dataLink46:setName("dataLink46");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout31);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setWidth(100);
    obj.checkBox30:setText("Inteligência");
    obj.checkBox30:setField("useInt");
    obj.checkBox30:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox30:setName("checkBox30");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout31);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setWidth(50);
    obj.comboBox4:setField("multInt");
    obj.comboBox4:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox4:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout31);
    obj.dataLink47:setField("multInt");
    obj.dataLink47:setDefaultValue("0");
    obj.dataLink47:setName("dataLink47");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout32);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setWidth(100);
    obj.checkBox31:setText("Sabedoria");
    obj.checkBox31:setField("useSab");
    obj.checkBox31:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox31:setName("checkBox31");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout32);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setWidth(50);
    obj.comboBox5:setField("multSab");
    obj.comboBox5:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox5:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox5:setName("comboBox5");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout32);
    obj.dataLink48:setField("multSab");
    obj.dataLink48:setDefaultValue("0");
    obj.dataLink48:setName("dataLink48");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout27);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout33);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setWidth(100);
    obj.checkBox32:setText("Carisma");
    obj.checkBox32:setField("useCar");
    obj.checkBox32:setHint("Marque se o modificador desse atributo entra no ataque.");
    obj.checkBox32:setName("checkBox32");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout33);
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setWidth(50);
    obj.comboBox6:setField("multCar");
    obj.comboBox6:setItems({'0', '0.5', '1', '1.5', '2'});
    obj.comboBox6:setHint("Quantas vezes esse atributo é aplicado ao dano.");
    obj.comboBox6:setName("comboBox6");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout33);
    obj.dataLink49:setField("multCar");
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setName("dataLink49");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.default);
    obj.layout34:setAlign("client");
    obj.layout34:setName("layout34");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout34);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("detalhes");
    obj.textEditor1:setName("textEditor1");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.default);
    obj.layout35:setAlign("right");
    obj.layout35:setWidth(100);
    obj.layout35:setName("layout35");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout35);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(100);
    obj.button1:setHeight(25);
    obj.button1:setText("Ataque");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout35);
    obj.button2:setLeft(0);
    obj.button2:setTop(25);
    obj.button2:setWidth(100);
    obj.button2:setHeight(25);
    obj.button2:setText("Dano");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout35);
    obj.button3:setLeft(0);
    obj.button3:setTop(50);
    obj.button3:setWidth(100);
    obj.button3:setHeight(25);
    obj.button3:setText("Decisivo");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout35);
    obj.button4:setLeft(0);
    obj.button4:setTop(75);
    obj.button4:setWidth(100);
    obj.button4:setHeight(25);
    obj.button4:setText("Info");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout35);
    obj.button5:setLeft(0);
    obj.button5:setTop(100);
    obj.button5:setWidth(100);
    obj.button5:setHeight(25);
    obj.button5:setText("Exibir");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout35);
    obj.button6:setLeft(0);
    obj.button6:setTop(125);
    obj.button6:setWidth(100);
    obj.button6:setHeight(25);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout35);
    obj.button7:setLeft(0);
    obj.button7:setTop(150);
    obj.button7:setWidth(100);
    obj.button7:setHeight(25);
    obj.button7:setText("Apagar");
    obj.button7:setName("button7");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.default);
    obj.dataLink50:setFields({'furtivo', 'ataquePoderoso', 'especializacaoCombate', 'tiroMultiplo', 'ataqueMultiplo', 'alcance', 'composto', 'limite', 'energia', 'rajada', 'tamanho', 'talentos', 'itens', 'magias', 'extra', 'outros', 'outros1', 'outros2', 'outros3', 'outros4', 'combate2armas', 'combate2armasLeve', 'velocidade', 'tiroRapido', 'tiroRapidoAprimorado', 'flanquear','atualizar','useStr', 'multStr', 'useDex', 'multDex', 'useCon', 'multCon', 'useInt', 'multInt', 'useSab', 'multSab', 'useCar', 'multCar'});
    obj.dataLink50:setName("dataLink50");

    obj._e_event0 = obj.weaponType:addEventListener("onChange",
        function (_)
            updateAll();
        end, obj);

    obj._e_event1 = obj.weaponType:addEventListener("onMouseDown",
        function (_, event)
            local node = NDB.getRoot(sheet);
            						local nodes = NDB.getChildNodes(node.campoDasArmas); 
            						local selected = sheet.weaponType;
            						local items = {};
            						local values = {};
            						for i=1, #nodes, 1 do
            							items[i] = nodes[i].batismo or nodes[i].arma or nodes[i].nome or "Arma";
            							values[i] = "" .. i;
            						end
            						self.weaponType.items = items;
            						self.weaponType.values = values;
            						sheet.weaponType = selected;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            	                    updateAll();
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						if sheet.acertos[1] ~= nil then
            							
            							if sheet.municao~= nil then
            								local municao = tonumber(sheet.municao) or 0;
            								if municao == 0 then
            									mesaDoPersonagem.activeChat:enviarMensagem("Esta arma está sem munição.");
            								else
            									sheet.municao = municao - 1;
            								end;
            							end;
            
            							local rolagem = Firecast.interpretarRolagem("1d20+" .. sheet.acertos[1]);
            							local armamento = sheet.nomeAtaque or "arma";
            							local personagem = NDB.getRoot(sheet).nome or "personagem";
            
            							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque padrão com " .. armamento .. " de " .. personagem);
            						end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            	                    updateAll();
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						if sheet.dado ~= nil then
            							local rolagem = Firecast.interpretarRolagem(sheet.dado);
            							local armamento = sheet.nomeAtaque or "arma";
            							local personagem = NDB.getRoot(sheet).nome or "personagem";
            
            							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano do ataque com " .. armamento .. " de " .. personagem);
            						end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            	                    updateAll();
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						if sheet.crit ~= nil then
            							local rolagem = Firecast.interpretarRolagem(sheet.crit);
            							local armamento = sheet.nomeAtaque or "arma";
            							local personagem = NDB.getRoot(sheet).nome or "personagem";
            
            							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo do ataque com " .. armamento .. " de " .. personagem);
            						end;
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popArma");
            
            						if pop ~= nil then
            							pop:setNodeObject(sheet.weapon);
            							pop:showPopupEx("bottomCenter", self);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de arma para exibir");
            						end;
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            	                    updateAll();
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						if sheet.auto ~= nil then
            							local mensagem = sheet.auto or "";
            							mesaDoPersonagem.activeChat:enviarMensagem(mensagem);
            						end;
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            updateAll();
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar essa arma?",
            							function (confirmado)
            								if confirmado then
            									NDB.deleteNode(sheet);
            								end;
            						end);
        end, obj);

    obj._e_event9 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateAll();
        end, obj);

    function obj:_releaseEvents()
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
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.default ~= nil then self.default:destroy(); self.default = nil; end;
        if self.auto ~= nil then self.auto:destroy(); self.auto = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.weaponType ~= nil then self.weaponType:destroy(); self.weaponType = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmWeaponConfig()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmWeaponConfig();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmWeaponConfig = {
    newEditor = newfrmWeaponConfig, 
    new = newfrmWeaponConfig, 
    name = "frmWeaponConfig", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmWeaponConfig = _frmWeaponConfig;
Firecast.registrarForm(_frmWeaponConfig);

return _frmWeaponConfig;
