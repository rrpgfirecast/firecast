require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister2Aar_svg()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmFichaRPGmeister2Aar_svg");
    obj:setWidth(1110);
    obj:setHeight(280);
    obj:setTheme("dark");
    obj:setMargins({top=1, bottom=1});


		local function updateAll()

            if debug then
                rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Ataque com Arma.");
                index = index + 1;
            end;
			if sheet == nil then
				return;
			end;
			local num = (tonumber(sheet.weaponType) or 1);
			sheet.num = sheet.weaponType;
			local node = ndb.getRoot(sheet);
			local nodes = ndb.getChildNodes(node.campoDasArmas); 
			sheet.weapon = nodes[num];

			if sheet.weapon== nil then
				return;
			end;

			local auto = sheet.weapon.batismo or sheet.weapon.nome or sheet.weapon.arma or "Arma";
			local nomeAtaque = sheet.weapon.batismo or sheet.weapon.nome or sheet.weapon.arma or "Arma";
    		local bba = tonumber(node.bba) or 0;
    		local acertos = {};
    		local pen = tonumber(sheet.weapon.qualidade) or 0;
    		if sheet.weapon.qualidade=="Obra-Prima" or sheet.weapon.qualidade=="OP" or sheet.weapon.qualidade=="obra-prima" or sheet.weapon.qualidade=="op" or sheet.weapon.qualidade=="Obra-prima" or sheet.weapon.qualidade=="Op" then
    			pen = 1;
    		end;
    		pen = pen + (tonumber(node.buffAtaque) or 0);
            pen = pen + (tonumber(node.tamanhoCa) or 0);

    		-- Pegando o valor dos atributos
    		local forc = tonumber(node.efetModFor) or 0;
    		local des = tonumber(node.efetModDes) or 0;
            local sab  = tonumber(node.efetModSab) or 0;
    		local int = tonumber(node.efetModInt) or 0;

            if sheet.zen then
                des = math.max(des, sab);
            end;

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

            local limite = tonumber(sheet.limiteQtd) or 4;
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

    		if sheet.forma=="1" then
    			pen = pen + forc;
    		else
    			pen = pen + des;
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
    			if sheet.ataqueMultiploApr and sheet.empunhadura=="4" then
    				pen = pen -2;
    			elseif sheet.empunhadura=="4" then
    				pen = pen -5;
    			end;
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

    		-- Adicionando bonus de força
    		if sheet.forma=="2" then
    			if sheet.composto then
    				dado = dado .. "+" .. math.min(forc, (tonumber(sheet.compostoLim) or 0));
                    if forc < tonumber(sheet.compostoLim) then
                        pen = pen - 2;
                    end;
    			end;
    		elseif sheet.empunhadura=="2" and sheet.ambidestria then
    			dado = dado .. "+" .. (forc*2);
    		elseif sheet.empunhadura=="2" or sheet.mao=="2" then
    			dado = dado .. "+" .. math.floor(forc*1.5);
    		elseif sheet.mao=="0" then
    			dado = dado .. "+" .. forc;
    		else
    			dado = dado .. "+" .. math.floor(forc*0.5);
    		end;

    		local tiros = dado;
    		-- Dano que não se aplica a tiros multiplos
    		if sheet.ataquePoderoso then
    			local dmg = math.abs(tonumber(sheet.ataquePoderosoPen) or 0);
    			if sheet.empunhadura=="2" then
    				dmg = dmg * 2;
    			end;
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
    		if sheet.perspicaz then
    			dado = dado .. "+" .. int;
    			precisao = precisao .. "+" .. int;
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
    		local multiplicador = tonumber(mod);
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
	


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.default = gui.fromHandle(_obj_newObject("layout"));
    obj.default:setParent(obj);
    obj.default:setLeft(2);
    obj.default:setTop(2);
    obj.default:setWidth(1105);
    obj.default:setHeight(300);
    obj.default:setName("default");

    obj.weaponType = gui.fromHandle(_obj_newObject("comboBox"));
    obj.weaponType:setParent(obj.default);
    obj.weaponType:setLeft(0);
    obj.weaponType:setTop(0);
    obj.weaponType:setWidth(200);
    obj.weaponType:setHeight(25);
    obj.weaponType:setName("weaponType");
    obj.weaponType:setField("weaponType");
    obj.weaponType:setFontColor("white");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.default);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(25);
    obj.layout1:setWidth(270);
    obj.layout1:setHeight(250);
    obj.layout1:setName("layout1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout1);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(150);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("Furtivo");
    obj.checkBox1:setField("furtivo");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(150);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(40);
    obj.edit1:setHeight(25);
    obj.edit1:setField("furtivoDano");
    obj.edit1:setName("edit1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("furtivoDano");
    obj.dataLink1:setDefaultValue("Dano");
    obj.dataLink1:setName("dataLink1");


			local num = tonumber(1);
		


    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout1);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(25);
    obj.checkBox2:setWidth(150);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Ataque Poderoso");
    obj.checkBox2:setField("ataquePoderoso");
    obj.checkBox2:setName("checkBox2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(25);
    obj.edit2:setField("ataquePoderosoPen");
    obj.edit2:setName("edit2");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("ataquePoderosoPen");
    obj.dataLink2:setDefaultValue("Pen");
    obj.dataLink2:setName("dataLink2");


			local num = tonumber(1);
		


    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout1);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(50);
    obj.checkBox3:setWidth(150);
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setText("Espec. em Combate");
    obj.checkBox3:setField("especializacaoCombate");
    obj.checkBox3:setName("checkBox3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(150);
    obj.edit3:setTop(50);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("especializacaoCombatePen");
    obj.edit3:setName("edit3");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setField("especializacaoCombatePen");
    obj.dataLink3:setDefaultValue("Pen");
    obj.dataLink3:setName("dataLink3");


			local num = tonumber(1);
		


    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout1);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(75);
    obj.checkBox4:setWidth(150);
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setText("Tiro Multiplo");
    obj.checkBox4:setField("tiroMultiplo");
    obj.checkBox4:setName("checkBox4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(150);
    obj.edit4:setTop(75);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("tiroMultiploQtd");
    obj.edit4:setName("edit4");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setField("tiroMultiploQtd");
    obj.dataLink4:setDefaultValue("Qtd");
    obj.dataLink4:setName("dataLink4");


			local num = tonumber(1);
		


    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout1);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(100);
    obj.checkBox5:setWidth(150);
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setText("Ataque Multiplo");
    obj.checkBox5:setField("ataqueMultiplo");
    obj.checkBox5:setName("checkBox5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(150);
    obj.edit5:setTop(100);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ataqueMultiploQtd");
    obj.edit5:setName("edit5");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout1);
    obj.dataLink5:setField("ataqueMultiploQtd");
    obj.dataLink5:setDefaultValue("Qtd");
    obj.dataLink5:setName("dataLink5");


			local num = tonumber(1);
		


    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout1);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(125);
    obj.checkBox6:setWidth(150);
    obj.checkBox6:setHeight(25);
    obj.checkBox6:setText("Composto");
    obj.checkBox6:setField("composto");
    obj.checkBox6:setName("checkBox6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setLeft(150);
    obj.edit6:setTop(125);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(25);
    obj.edit6:setField("compostoLim");
    obj.edit6:setName("edit6");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout1);
    obj.dataLink6:setField("compostoLim");
    obj.dataLink6:setDefaultValue("Lim");
    obj.dataLink6:setName("dataLink6");


			local num = tonumber(1);
		


    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout1);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(150);
    obj.checkBox7:setWidth(150);
    obj.checkBox7:setHeight(25);
    obj.checkBox7:setText("Limite");
    obj.checkBox7:setField("limite");
    obj.checkBox7:setName("checkBox7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setLeft(150);
    obj.edit7:setTop(150);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("limiteQtd");
    obj.edit7:setName("edit7");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout1);
    obj.dataLink7:setField("limiteQtd");
    obj.dataLink7:setDefaultValue("Qtd");
    obj.dataLink7:setName("dataLink7");


			local num = tonumber(1);
		


    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout1);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(175);
    obj.checkBox8:setWidth(150);
    obj.checkBox8:setHeight(25);
    obj.checkBox8:setText("Alcance");
    obj.checkBox8:setField("alcance");
    obj.checkBox8:setName("checkBox8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setLeft(150);
    obj.edit8:setTop(175);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("alcanceMult");
    obj.edit8:setName("edit8");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout1);
    obj.dataLink8:setField("alcanceMult");
    obj.dataLink8:setDefaultValue("Mult");
    obj.dataLink8:setName("dataLink8");


			local num = tonumber(2);
		


    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setLeft(190);
    obj.edit9:setTop(175);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("alcancePen");
    obj.edit9:setName("edit9");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout1);
    obj.dataLink9:setField("alcancePen");
    obj.dataLink9:setDefaultValue("Pen");
    obj.dataLink9:setName("dataLink9");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.default);
    obj.layout2:setLeft(270);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(270);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout2);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(150);
    obj.checkBox9:setHeight(25);
    obj.checkBox9:setText("Rajada de Golpes");
    obj.checkBox9:setField("rajada");
    obj.checkBox9:setName("checkBox9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setLeft(150);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("rajadaQtd");
    obj.edit10:setName("edit10");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout2);
    obj.dataLink10:setField("rajadaQtd");
    obj.dataLink10:setDefaultValue("Qtd");
    obj.dataLink10:setName("dataLink10");


			local num = tonumber(2);
		


    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setLeft(190);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("rajadaPen");
    obj.edit11:setName("edit11");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout2);
    obj.dataLink11:setField("rajadaPen");
    obj.dataLink11:setDefaultValue("Pen");
    obj.dataLink11:setName("dataLink11");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout2);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(25);
    obj.checkBox10:setWidth(150);
    obj.checkBox10:setHeight(25);
    obj.checkBox10:setText("Tamanho");
    obj.checkBox10:setField("tamanho");
    obj.checkBox10:setName("checkBox10");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setLeft(150);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(25);
    obj.edit12:setField("tamanhoDado");
    obj.edit12:setName("edit12");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout2);
    obj.dataLink12:setField("tamanhoDado");
    obj.dataLink12:setDefaultValue("Dado");
    obj.dataLink12:setName("dataLink12");


			local num = tonumber(2);
		


    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(190);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("tamanhoPen");
    obj.edit13:setName("edit13");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout2);
    obj.dataLink13:setField("tamanhoPen");
    obj.dataLink13:setDefaultValue("Pen");
    obj.dataLink13:setName("dataLink13");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout2);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(50);
    obj.checkBox11:setWidth(150);
    obj.checkBox11:setHeight(25);
    obj.checkBox11:setText("Dano por Energia");
    obj.checkBox11:setField("energia");
    obj.checkBox11:setName("checkBox11");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(150);
    obj.edit14:setTop(50);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("energiaDano");
    obj.edit14:setName("edit14");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout2);
    obj.dataLink14:setField("energiaDano");
    obj.dataLink14:setDefaultValue("Dano");
    obj.dataLink14:setName("dataLink14");


			local num = tonumber(2);
		


    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setLeft(190);
    obj.edit15:setTop(50);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("energiaCrit");
    obj.edit15:setName("edit15");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout2);
    obj.dataLink15:setField("energiaCrit");
    obj.dataLink15:setDefaultValue("Crit");
    obj.dataLink15:setName("dataLink15");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout2);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(75);
    obj.checkBox12:setWidth(150);
    obj.checkBox12:setHeight(25);
    obj.checkBox12:setText("Talentos");
    obj.checkBox12:setField("talentos");
    obj.checkBox12:setName("checkBox12");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setLeft(150);
    obj.edit16:setTop(75);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(25);
    obj.edit16:setField("talentosDano");
    obj.edit16:setName("edit16");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout2);
    obj.dataLink16:setField("talentosDano");
    obj.dataLink16:setDefaultValue("Dano");
    obj.dataLink16:setName("dataLink16");


			local num = tonumber(3);
		


    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setLeft(190);
    obj.edit17:setTop(75);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setField("talentosCrit");
    obj.edit17:setName("edit17");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout2);
    obj.dataLink17:setField("talentosCrit");
    obj.dataLink17:setDefaultValue("Crit");
    obj.dataLink17:setName("dataLink17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout2);
    obj.edit18:setLeft(230);
    obj.edit18:setTop(75);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setField("talentosAtaq");
    obj.edit18:setName("edit18");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout2);
    obj.dataLink18:setField("talentosAtaq");
    obj.dataLink18:setDefaultValue("Ataq");
    obj.dataLink18:setName("dataLink18");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout2);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(100);
    obj.checkBox13:setWidth(150);
    obj.checkBox13:setHeight(25);
    obj.checkBox13:setText("Itens");
    obj.checkBox13:setField("itens");
    obj.checkBox13:setName("checkBox13");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout2);
    obj.edit19:setLeft(150);
    obj.edit19:setTop(100);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setField("itensDano");
    obj.edit19:setName("edit19");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout2);
    obj.dataLink19:setField("itensDano");
    obj.dataLink19:setDefaultValue("Dano");
    obj.dataLink19:setName("dataLink19");


			local num = tonumber(3);
		


    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout2);
    obj.edit20:setLeft(190);
    obj.edit20:setTop(100);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setField("itensCrit");
    obj.edit20:setName("edit20");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout2);
    obj.dataLink20:setField("itensCrit");
    obj.dataLink20:setDefaultValue("Crit");
    obj.dataLink20:setName("dataLink20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout2);
    obj.edit21:setLeft(230);
    obj.edit21:setTop(100);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(25);
    obj.edit21:setField("itensAtaq");
    obj.edit21:setName("edit21");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout2);
    obj.dataLink21:setField("itensAtaq");
    obj.dataLink21:setDefaultValue("Ataq");
    obj.dataLink21:setName("dataLink21");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout2);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(125);
    obj.checkBox14:setWidth(150);
    obj.checkBox14:setHeight(25);
    obj.checkBox14:setText("Magias");
    obj.checkBox14:setField("magias");
    obj.checkBox14:setName("checkBox14");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout2);
    obj.edit22:setLeft(150);
    obj.edit22:setTop(125);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(25);
    obj.edit22:setField("magiasDano");
    obj.edit22:setName("edit22");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout2);
    obj.dataLink22:setField("magiasDano");
    obj.dataLink22:setDefaultValue("Dano");
    obj.dataLink22:setName("dataLink22");


			local num = tonumber(3);
		


    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout2);
    obj.edit23:setLeft(190);
    obj.edit23:setTop(125);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setField("magiasCrit");
    obj.edit23:setName("edit23");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout2);
    obj.dataLink23:setField("magiasCrit");
    obj.dataLink23:setDefaultValue("Crit");
    obj.dataLink23:setName("dataLink23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout2);
    obj.edit24:setLeft(230);
    obj.edit24:setTop(125);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(25);
    obj.edit24:setField("magiasAtaq");
    obj.edit24:setName("edit24");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout2);
    obj.dataLink24:setField("magiasAtaq");
    obj.dataLink24:setDefaultValue("Ataq");
    obj.dataLink24:setName("dataLink24");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout2);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(150);
    obj.checkBox15:setWidth(150);
    obj.checkBox15:setHeight(25);
    obj.checkBox15:setText("Extra");
    obj.checkBox15:setField("extra");
    obj.checkBox15:setName("checkBox15");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout2);
    obj.edit25:setLeft(150);
    obj.edit25:setTop(150);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setField("extraDano");
    obj.edit25:setName("edit25");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout2);
    obj.dataLink25:setField("extraDano");
    obj.dataLink25:setDefaultValue("Dano");
    obj.dataLink25:setName("dataLink25");


			local num = tonumber(3);
		


    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout2);
    obj.edit26:setLeft(190);
    obj.edit26:setTop(150);
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(25);
    obj.edit26:setField("extraCrit");
    obj.edit26:setName("edit26");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout2);
    obj.dataLink26:setField("extraCrit");
    obj.dataLink26:setDefaultValue("Crit");
    obj.dataLink26:setName("dataLink26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout2);
    obj.edit27:setLeft(230);
    obj.edit27:setTop(150);
    obj.edit27:setWidth(40);
    obj.edit27:setHeight(25);
    obj.edit27:setField("extraAtaq");
    obj.edit27:setName("edit27");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout2);
    obj.dataLink27:setField("extraAtaq");
    obj.dataLink27:setDefaultValue("Ataq");
    obj.dataLink27:setName("dataLink27");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout2);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(175);
    obj.checkBox16:setWidth(150);
    obj.checkBox16:setHeight(25);
    obj.checkBox16:setText("Outros");
    obj.checkBox16:setField("outros");
    obj.checkBox16:setName("checkBox16");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout2);
    obj.edit28:setLeft(150);
    obj.edit28:setTop(175);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setField("outrosDano");
    obj.edit28:setName("edit28");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout2);
    obj.dataLink28:setField("outrosDano");
    obj.dataLink28:setDefaultValue("Dano");
    obj.dataLink28:setName("dataLink28");


			local num = tonumber(3);
		


    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout2);
    obj.edit29:setLeft(190);
    obj.edit29:setTop(175);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("outrosCrit");
    obj.edit29:setName("edit29");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout2);
    obj.dataLink29:setField("outrosCrit");
    obj.dataLink29:setDefaultValue("Crit");
    obj.dataLink29:setName("dataLink29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout2);
    obj.edit30:setLeft(230);
    obj.edit30:setTop(175);
    obj.edit30:setWidth(40);
    obj.edit30:setHeight(25);
    obj.edit30:setField("outrosAtaq");
    obj.edit30:setName("edit30");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout2);
    obj.dataLink30:setField("outrosAtaq");
    obj.dataLink30:setDefaultValue("Ataq");
    obj.dataLink30:setName("dataLink30");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.default);
    obj.layout3:setLeft(570);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(150);
    obj.layout3:setHeight(250);
    obj.layout3:setName("layout3");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout3);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(150);
    obj.checkBox17:setHeight(25);
    obj.checkBox17:setText("Ambidestria");
    obj.checkBox17:setField("ambidestria");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout3);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(25);
    obj.checkBox18:setWidth(150);
    obj.checkBox18:setHeight(25);
    obj.checkBox18:setText("Duas Armas");
    obj.checkBox18:setField("combate2armas");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout3);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(50);
    obj.checkBox19:setWidth(150);
    obj.checkBox19:setHeight(25);
    obj.checkBox19:setText("Duas Armas Leves");
    obj.checkBox19:setField("combate2armasLeve");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout3);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(75);
    obj.checkBox20:setWidth(150);
    obj.checkBox20:setHeight(25);
    obj.checkBox20:setText("Velocidade");
    obj.checkBox20:setField("velocidade");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout3);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(100);
    obj.checkBox21:setWidth(150);
    obj.checkBox21:setHeight(25);
    obj.checkBox21:setText("Tiro Rapido");
    obj.checkBox21:setField("tiroRapido");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout3);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(125);
    obj.checkBox22:setWidth(150);
    obj.checkBox22:setHeight(25);
    obj.checkBox22:setText("Tiro Rapido Apr.");
    obj.checkBox22:setField("tiroRapidoAprimorado");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout3);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(150);
    obj.checkBox23:setWidth(150);
    obj.checkBox23:setHeight(25);
    obj.checkBox23:setText("Golpe Perspicaz");
    obj.checkBox23:setField("perspicaz");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout3);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(175);
    obj.checkBox24:setWidth(150);
    obj.checkBox24:setHeight(25);
    obj.checkBox24:setText("Ataque Multiplo Apr");
    obj.checkBox24:setField("ataqueMultiploApr");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout3);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(200);
    obj.checkBox25:setWidth(150);
    obj.checkBox25:setHeight(25);
    obj.checkBox25:setText("Arquearia Zen");
    obj.checkBox25:setField("zen");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout3);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(225);
    obj.checkBox26:setWidth(150);
    obj.checkBox26:setHeight(25);
    obj.checkBox26:setText("Flanquear");
    obj.checkBox26:setField("flanquear");
    obj.checkBox26:setName("checkBox26");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.default);
    obj.layout4:setLeft(720);
    obj.layout4:setTop(25);
    obj.layout4:setWidth(225);
    obj.layout4:setHeight(250);
    obj.layout4:setName("layout4");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout4);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(75);
    obj.label1:setHeight(25);
    obj.label1:setText("Forma");
    obj.label1:setName("label1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setLeft(75);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("forma");
    obj.comboBox1:setItems({'Corpo-a-Corpo', 'Distancia', 'Arremesso', 'Acuidade'});
    obj.comboBox1:setValues({'1', '2', '3', '4'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setLeft(0);
    obj.label2:setTop(25);
    obj.label2:setWidth(75);
    obj.label2:setHeight(25);
    obj.label2:setText("Empunhadura");
    obj.label2:setFontSize(11);
    obj.label2:setName("label2");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout4);
    obj.comboBox2:setLeft(75);
    obj.comboBox2:setTop(25);
    obj.comboBox2:setWidth(150);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("empunhadura");
    obj.comboBox2:setItems({'Leve', 'Uma Mão', 'Duas Mãos', 'Natural: Primario', 'Natural: Secundario'});
    obj.comboBox2:setValues({'0', '1', '2', '3', '4'});
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(50);
    obj.label3:setWidth(75);
    obj.label3:setHeight(25);
    obj.label3:setText("Mão");
    obj.label3:setName("label3");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setLeft(75);
    obj.comboBox3:setTop(50);
    obj.comboBox3:setWidth(150);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("mao");
    obj.comboBox3:setItems({'Habil', 'Inabil', 'Natural: Principal'});
    obj.comboBox3:setValues({'0', '1', '2'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(0);
    obj.label4:setTop(75);
    obj.label4:setWidth(75);
    obj.label4:setHeight(25);
    obj.label4:setText("Munição");
    obj.label4:setName("label4");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setLeft(75);
    obj.edit31:setTop(75);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("municao");
    obj.edit31:setName("edit31");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout4);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(100);
    obj.textEditor1:setWidth(225);
    obj.textEditor1:setHeight(150);
    obj.textEditor1:setField("detalhes");
    obj.textEditor1:setName("textEditor1");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.default);
    obj.layout5:setLeft(950);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(100);
    obj.layout5:setHeight(225);
    obj.layout5:setName("layout5");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout5);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(100);
    obj.button1:setHeight(25);
    obj.button1:setText("Ataque");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout5);
    obj.button2:setLeft(0);
    obj.button2:setTop(25);
    obj.button2:setWidth(100);
    obj.button2:setHeight(25);
    obj.button2:setText("Dano");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout5);
    obj.button3:setLeft(0);
    obj.button3:setTop(50);
    obj.button3:setWidth(100);
    obj.button3:setHeight(25);
    obj.button3:setText("Decisivo");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout5);
    obj.button4:setLeft(0);
    obj.button4:setTop(75);
    obj.button4:setWidth(100);
    obj.button4:setHeight(25);
    obj.button4:setText("Info");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout5);
    obj.button5:setLeft(0);
    obj.button5:setTop(100);
    obj.button5:setWidth(100);
    obj.button5:setHeight(25);
    obj.button5:setText("Exibir");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout5);
    obj.button6:setLeft(0);
    obj.button6:setTop(125);
    obj.button6:setWidth(100);
    obj.button6:setHeight(25);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout5);
    obj.button7:setLeft(0);
    obj.button7:setTop(150);
    obj.button7:setWidth(100);
    obj.button7:setHeight(25);
    obj.button7:setText("Apagar");
    obj.button7:setName("button7");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.default);
    obj.dataLink31:setFields({'furtivo', 'ataquePoderoso', 'especializacaoCombate', 'tiroMultiplo', 'ataqueMultiplo', 'alcance', 'composto', 'limite', 'energia', 'rajada', 'tamanho', 'talentos', 'itens', 'magias', 'extra', 'outros', 'ambidestria', 'combate2armas', 'combate2armasLeve', 'velocidade', 'tiroRapido', 'tiroRapidoAprimorado', 'perspicaz', 'ataqueMultiploApr', 'forma', 'empunhadura', 'mao', 'zen', 'flanquear'});
    obj.dataLink31:setName("dataLink31");

    obj.auto = gui.fromHandle(_obj_newObject("layout"));
    obj.auto:setParent(obj);
    obj.auto:setLeft(2);
    obj.auto:setTop(2);
    obj.auto:setWidth(1105);
    obj.auto:setHeight(300);
    obj.auto:setName("auto");
    obj.auto:setVisible(true);

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.auto);
    obj.label5:setLeft(205);
    obj.label5:setWidth(900);
    obj.label5:setField("auto");
    obj.label5:setText("Escolha uma Arma");
    obj.label5:setName("label5");

    obj._e_event0 = obj.weaponType:addEventListener("onChange",
        function (self)
            updateAll();
        end, obj);

    obj._e_event1 = obj.weaponType:addEventListener("onMouseDown",
        function (self, event)
            local node = ndb.getRoot(sheet);
            				local nodes = ndb.getChildNodes(node.campoDasArmas); 
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
        function (self)
            if sheet == nil then
            						return;
            					end;
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					if sheet.acertos[1] ~= nil then
            						
            						if sheet.municao~= nil then
            							local municao = tonumber(sheet.municao) or 0;
            							if municao == 0 then
            								mesaDoPersonagem.activeChat:enviarMensagem("Esta arma está sem munição.");
            							else
            								sheet.municao = municao - 1;
            							end;
            						end;
            
            						local rolagem = rrpg.interpretarRolagem("1d20+" .. sheet.acertos[1]);
            						local armamento = sheet.nomeAtaque or "arma";
            						local personagem = ndb.getRoot(sheet).nome or "personagem";
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque padrão com " .. armamento .. " de " .. personagem);
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet == nil then
            						return;
            					end;
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					if sheet.dado ~= nil then
            						local rolagem = rrpg.interpretarRolagem(sheet.dado);
            						local armamento = sheet.nomeAtaque or "arma";
            						local personagem = ndb.getRoot(sheet).nome or "personagem";
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano do ataque com " .. armamento .. " de " .. personagem);
            					end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            if sheet == nil then
            						return;
            					end;
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					if sheet.crit ~= nil then
            						local rolagem = rrpg.interpretarRolagem(sheet.crit);
            						local armamento = sheet.nomeAtaque or "arma";
            						local personagem = ndb.getRoot(sheet).nome or "personagem";
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo do ataque com " .. armamento .. " de " .. personagem);
            					end;
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popArma");
            
            					if pop ~= nil then
            						pop:setNodeObject(sheet.weapon);
            						pop:showPopupEx("bottomCenter", self);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de arma para exibir");
            					end;
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (self)
            if sheet == nil then
            						return;
            					end;
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					if sheet.auto ~= nil then
            						local mensagem = sheet.auto or "";
            						mesaDoPersonagem.activeChat:enviarMensagem(mensagem);
            					end;
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (self)
            updateAll();
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa arma?",
            						function (confirmado)
            							if confirmado then
            								ndb.deleteNode(sheet);
            							end;
            					end);
        end, obj);

    obj._e_event9 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.default ~= nil then self.default:destroy(); self.default = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.auto ~= nil then self.auto:destroy(); self.auto = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.weaponType ~= nil then self.weaponType:destroy(); self.weaponType = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister2Aar_svg = {
    newEditor = newfrmFichaRPGmeister2Aar_svg, 
    new = newfrmFichaRPGmeister2Aar_svg, 
    name = "frmFichaRPGmeister2Aar_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister2Aar_svg = _frmFichaRPGmeister2Aar_svg;
rrpg.registrarForm(_frmFichaRPGmeister2Aar_svg);

return _frmFichaRPGmeister2Aar_svg;
