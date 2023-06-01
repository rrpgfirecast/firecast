require("locale.lua");   

common = {};

common.atributos = {
	forca			= Locale.lang("DnD5e.spells.resistance.str"),
	destreza		= Locale.lang("DnD5e.spells.resistance.dex"),
	constituicao	= Locale.lang("DnD5e.spells.resistance.con"),
	inteligencia	= Locale.lang("DnD5e.spells.resistance.int"),
	sabedoria		= Locale.lang("DnD5e.spells.resistance.wis"),
	carisma			= Locale.lang("DnD5e.spells.resistance.cha")
};
common.atributos["Força"] = Locale.lang("DnD5e.spells.resistance.str")
common.atributos["Destreza"] = Locale.lang("DnD5e.spells.resistance.dex")
common.atributos["Constituição"] = Locale.lang("DnD5e.spells.resistance.con")
common.atributos["Inteligência"] = Locale.lang("DnD5e.spells.resistance.int")
common.atributos["Sabedoria"] = Locale.lang("DnD5e.spells.resistance.wis")
common.atributos["Carisma"] = Locale.lang("DnD5e.spells.resistance.cha")

common.atributos2 = {
	forca			= {'FOR', 'STR'},
	destreza		= {'DES', 'DEX'},
	constituicao	= {'CON', 'CON'},
	inteligencia	= {'INT', 'INT'},
	sabedoria		= {'SAB', 'WIS'},
	carisma			= {'CAR', 'CHA'}
};
common.pericias = {
	atletismo		= Locale.lang("DnD5e.skills.athletics"),
	acrobacia		= Locale.lang("DnD5e.skills.acrobatics"),
	furtividade		= Locale.lang("DnD5e.skills.stealth"),
	prestidigitacao	= Locale.lang("DnD5e.skills.sleighthand"),
	arcanismo		= Locale.lang("DnD5e.skills.arcana"),
	historia		= Locale.lang("DnD5e.skills.history"),
	investigacao	= Locale.lang("DnD5e.skills.investigation"),
	natureza		= Locale.lang("DnD5e.skills.nature"),
	religiao		= Locale.lang("DnD5e.skills.religion"),
	adestrarAnimais	= Locale.lang("DnD5e.skills.animalhandling"),
	intuicao		= Locale.lang("DnD5e.skills.insight"),
	medicina		= Locale.lang("DnD5e.skills.medicine"),
	percepcao		= Locale.lang("DnD5e.skills.perception"),
	sobrevivencia	= Locale.lang("DnD5e.skills.survival"),
	atuacao			= Locale.lang("DnD5e.skills.performance"),
	enganacao		= Locale.lang("DnD5e.skills.deception"),
	intimidacao		= Locale.lang("DnD5e.skills.intimidation"),
	persuasao		= Locale.lang("DnD5e.skills.persuasion")
};
common.armas_propriedades = {
	[Locale.lang("DnD5e.tab.equipment.property.finesse")] = Locale.lang("DnD5e.tab.equipment.property.finesseDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.reach")] = Locale.lang("DnD5e.tab.equipment.property.reachDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.throw")] = Locale.lang("DnD5e.tab.equipment.property.throwDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.ranged")] = Locale.lang("DnD5e.tab.equipment.property.rangedDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.th")] = Locale.lang("DnD5e.tab.equipment.property.thDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.specScimitar")] = Locale.lang("DnD5e.tab.equipment.property.specScimitarDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.specLance")] = Locale.lang("DnD5e.tab.equipment.property.specLanceDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.specNet")] = Locale.lang("DnD5e.tab.equipment.property.specNetDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.light")] = Locale.lang("DnD5e.tab.equipment.property.lightDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.ammo")] = Locale.lang("DnD5e.tab.equipment.property.ammoDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.heavy")] = Locale.lang("DnD5e.tab.equipment.property.heavyDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.reload")] = Locale.lang("DnD5e.tab.equipment.property.reloadDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.versatile")] = Locale.lang("DnD5e.tab.equipment.property.versatileDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.magic")] = Locale.lang("DnD5e.tab.equipment.property.magicDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.silver")] = Locale.lang("DnD5e.tab.equipment.property.silverDetails"),
	[Locale.lang("DnD5e.tab.equipment.property.misfire1")] = Locale.lang("DnD5e.tab.equipment.property.misfire1Details"),
	[Locale.lang("DnD5e.tab.equipment.property.misfire2")] = Locale.lang("DnD5e.tab.equipment.property.misfire2Details"),
	[Locale.lang("DnD5e.tab.equipment.property.misfire3")] = Locale.lang("DnD5e.tab.equipment.property.misfire3Details"),
	[Locale.lang("DnD5e.tab.equipment.property.misfire4")] = Locale.lang("DnD5e.tab.equipment.property.misfire4Details"),
	[Locale.lang("DnD5e.tab.equipment.property.misfire5")] = Locale.lang("DnD5e.tab.equipment.property.misfire5Details")
};
common.ficha_propriedades = {
	prescience = {
		nome = 'Previsão',
		descricao = 'Habilidade de Psion, permite usar seu modificador de inteligência para testes de percepção e iniciativa, e fazer testes de resistência de inteligência ao invés de de destreza.',
		tipo = 'bool',
	},
	lucky = {
		nome = 'Sortudo',
		descricao = 'Habilidade de Halflings, permite rerolar 1s em d20s para ataques, testes de habilidade e testes de resistência.',
		tipo = 'bool',
		implementado = false,
	}
};

function common.rolaD20(node, nRolagems, bonus, chat, texto, afterFunction)
	-- Checa argumentos
	if not node then return; end;
	nRolagems = nRolagems or 1;
	bonus = bonus or 0;
	chat = chat or common.getMesa(node).chat;
	texto = texto or "";

	-- Checa se pode rolar
	if not common.podeRolar(node) then -- Permissão
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	end;

	-- Monta a rolagem
	local func = math.max;
	if nRolagems < 0 then
		func = math.min;
		nRolagems = -nRolagems;
	end;
	local rolagem = common.interpreta(node, nRolagems .. 'd20 + ' .. bonus);

	-- Faz a rolagem
	chat:rolarDados(rolagem, texto, function(roll)
		if not roll then return; end;
		local total = roll.resultado;
		local d20 = roll.ops[1].resultados[1];

		if nRolagems ~= 1 then
			total = total - d20;
			for i=2, nRolagems, 1 do
				d20 = func(d20, roll.ops[1].resultados[i]);
				total = total - d20;
			end;
			total = total + d20;
		end;

		if afterFunction then
			afterFunction(total, d20);
		end;
	end);
end;
function common.rolaMagia(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;
	modo = modo or 'normal';
	args = args or {};
	chat = chat or common.getMesa(node).chat;


	-- Inicializa variaveis
	if not args.init then

		if args.magia == nil then return end;

		if args.nivel == nil then
			args.magia.nivel = tonumber(args.magia.nivel or 0) or 0;
			if args.magia.nivel == 0 then
				args.nivel = 0;
			else
				local choices = {};
				for i=args.magia.nivel,9,1 do table.insert(choices, ''..i); end;
				Dialogs.choose(Locale.lang("Dnd5e.messages.spellSlot"), choices,
					function(selected, selectedIndex, selectedText)
						if selected then
							args.nivel = tonumber(selectedText);
							common.rolaMagia(node, modo, args, chat);
						end;
					end
				);
				return;
			end;
		end;

		if args.gastaEspacoDeMagia == nil then
			if args.nivel == 0 then
				args.gastaEspacoDeMagia = 'nao';
			else
				Dialogs.confirmYesNo(Locale.lang("Dnd5e.messages.spellCast"), function (selected)
					if selected then
						local gastos = tonumber(node.magias["espacosGastos" .. args.nivel]);
						local totais = tonumber(node.magias["espacosTotais" .. args.nivel]);
						if (gastos == nil) or (totais == nil) or (gastos >= totais) then
							showMessage(Locale.lang("Dnd5e.messages.noSpellSlot"));
							return;
						end;
						args.gastaEspacoDeMagia = 'sim';
					else
						args.gastaEspacoDeMagia = 'nao';
					end;
					common.rolaMagia(node, modo, args, chat);
				end);
				return;
			end;
		end;

		if args.ataque == nil then
			if args.magia.ataque == 'Ataque Corpo-a-Corpo' or args.magia.ataque == 'Ataque a Distância' then
				args.ataque = 'sim';

				if args.magia.ataque == 'Ataque Corpo-a-Corpo' then
					args.text = Locale.lang("Dnd5e.messages.melee")
				else
					args.text = Locale.lang("Dnd5e.messages.ranged")
				end

				if modo == 'vantagem' then
					args.rolls = 2;
					args.foo = math.max;
					args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
				elseif modo == 'desvantagem' then
					args.rolls = 2;
					args.foo = math.min;
					args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
				elseif modo == 'vantagem2' then
					args.rolls = 3;
					args.foo = math.min;
					args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
				elseif modo == 'desvantagem2' then
					args.rolls = 3;
					args.foo = math.min;
					args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
				else
					args.rolls = 1;
				end;

				args.acerto = common.interpreta(args.ficha, args.rolls .. 'd20 + ' .. (node.magias.bonusAtaqueSTR or 0));
			else
				args.ataque = 'nao';
			end;
		end;

		if args.dano == nil then
			if args.magia.damageType ~= 'Sem dano' then
				args.dano = "sim"
				args.danoRolagem = common.interpreta(node, args.magia.damageValue);
			else
				args.dano = "nao"
			end
		end

		if args.resistencia == nil then
			if args.magia.resistencia and common.hasValue({'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'}, args.magia.resistencia) then
				args.resistencia = args.magia.resistencia;
				args.resistenciaCD = node.magias.cdDaMagia;
			else
				args.resistencia = 'nao';
			end;
		end;

		args.init = true;
	end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	end;

	-- Mensagem
	local texto = Locale.lang("Dnd5e.messages.cast");
	if args.magia.nome then
		texto = texto .. ' "' .. args.magia.nome .. '"';
	else
		texto = texto .. Locale.lang("Dnd5e.messages._oneSpell")
	end;

	if args.gastaEspacoDeMagia == 'sim' then
		texto = texto .. Locale.lang("Dnd5e.messages.oneSpellSlot") .. args.nivel;
		node.magias["espacosGastos" .. args.nivel] = tonumber(node.magias["espacosGastos" .. args.nivel]) + 1;
	end;
	chat:enviarAcao(texto);

	-- Teste de Resistência
	if args.resistencia ~= 'nao' then
		chat:enviarAcao(Locale.lang("Dnd5e.messages.saveType") .. common.atributos[args.resistencia] .. ', CD ' .. args.resistenciaCD .. ' )');
	end;

	-- Acerto
	if args.ataque ~= 'nao' then
		chat:rolarDados(args.acerto, args.text, function(roll)
			if not roll then return; end;
			local result = roll.resultado;
			local d20 = roll.ops[1].resultados[1];

			if modo ~= 'normal' then
				result = result - roll.ops[1].resultados[1];
				for i=2,args.rolls do
					d20 = args.foo(d20, roll.ops[1].resultados[i]);
					result = result - roll.ops[1].resultados[i];
				end;
				result = result + d20;
			end;

			result = math.floor(result);
			d20 = math.floor(d20);

			if d20 == 20 then
				chat:enviarAcao(Locale.lang("Dnd5e.messages.critical"));
			elseif modo ~= 'normal' then
				chat:enviarAcao(Locale.lang("Dnd5e.messages.hit") .. result .. ' )');
			end;

			if args.dano ~= "nao" then
				chat:rolarDados(args.danoRolagem, Locale.lang("DnD5e.spells.damage"))
			end
		end);
	end;
end;
function common.rolaMagia2(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;
	if not (args and args.magia) then return; end;
	modo = modo or 'normal';
	chat = chat or common.getMesa(node).chat;
	args.estado = args.estado or 'inicial';

	function do_next()
		local order = {
			'inicial',
			'perguntaEspacoNivel',
			'perguntaEspacoGasta',
			'perguntaRecursoGasta',
			'conjuracao',
			'preparaAtaque',
			'rolaAtaque',
			'preparaTesteResistencia',
			'rolaTesteResistencia',
			'rolaFormulasDano',
			'rolaFormulas',
			'msgFlavor',
			'end'
		};
		for i=1,(#order-1) do
			if args.estado == order[i] then
				args.estado = order[i+1];
				return common.rolaMagia2(node, modo, args, chat);
			end;
		end;
	end;

	-- Verifica estado
	if args.estado == 'inicial' then return do_next();
	elseif args.estado == 'perguntaEspacoNivel' then
		if args.magia.nivel == 0 then return do_next(); end;

		local choices = {};
		for i=args.magia.nivel,9,1 do table.insert(choices, floor(i)); end;
		Dialogs.choose(Locale.lang("Dnd5e.messages.spellSlot"), choices, function(selected, selectedIndex, selectedText)
			if selected then
				args.nivelEspaco = tonumber(selectedText);
				return do_next();
			end;
		end, 1, true);

		return;
	elseif args.estado == 'perguntaEspacoGasta' then
		if args.magia.nivel == 0 then return do_next(); end;

		Dialogs.confirmYesNo(Locale.lang("Dnd5e.messages.spellSlot"), function (selected)
			if selected then
				local nivelMagia = common.getNivelMagia(node, args.nivelEspaco) or {};
				local restantes = tonumber(nivelMagia.espacosAtuais);
				if not (restantes >= 1) then
					showMessage(Locale.lang("Dnd5e.messages.noSpellSlot"));
					return;
				end;
			end;
			args.gastaEspaco = selected;
			return do_next();
		end);

		return;
	elseif args.estado == 'perguntaRecursoGasta' then
		local contador = common.getContador(node, args.magia.contadorNome);

		if not contador then return do_next(); end;

		Dialogs.confirmYesNo(Locale.lang("Dnd5e.messages.spend") .. args.magia.contadorUsos .. " '" .. args.magia.contadorNome .. "'?", function (selected)
			if selected then
				local atual = tonumber(contador.valCur);
				if not atual or args.magia.contadorUsos > atual then
					showMessage(Locale.lang("Dnd5e.messages.noResources"));
					return;
				end;
			end;
			args.gastaRecurso = selected;
			return do_next();
		end);

		return;
	elseif args.estado == 'conjuracao' then
		local text = Locale.lang("Dnd5e.messages.cast_");
		if args.magia.nome then text = text .. args.magia.nome;
		else text = text .. Locale.lang("Dnd5e.messages.oneSpell");
		end;

		if args.nivelEspaco then text = text .. Locale.lang("Dnd5e.messages._level_") .. args.nivelEspaco .. ')'; end;

		chat:enviarAcao(text);

		if args.gastaEspaco then
			local nivelMagia = common.getNivelMagia(node, args.nivelEspaco);
			nivelMagia.espacosAtuais = nivelMagia.espacosAtuais - 1;
		end;
		if args.gastaRecurso then
			local contador = common.getContador(node, args.magia.contadorNome);
			contador.valCur = contador.valCur - args.magia.contadorUsos;
		end;

		return do_next();
	elseif args.estado == 'preparaAtaque' then
		if args.magia.ataqueTipo == 'Sem Ataque' then return do_next(); end;

		args.ataque = {};

		args.ataque.text = args.magia.ataqueTipo;

		if modo == 'vantagem' then
			args.ataque.rolls = 2;
			args.ataque.text = args.ataque.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem' then
			args.ataque.rolls = -2;
			args.ataque.text = args.ataque.text .. Locale.lang("Dnd5e.messages.disadvantage");
		elseif modo == 'vantagem2' then
			args.ataque.rolls = 3;
			args.ataque.text = args.ataque.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem2' then
			args.ataque.rolls = -3;
			args.ataque.text = args.ataque.text .. Locale.lang("Dnd5e.messages.disadvantage");
		else
			args.ataque.rolls = 1;
		end;

		args.ataque.attr = args.magia.ataqueAtributo;
		if args.ataque.attr == 'Conjuração' then args.ataque.attr = node.magias.habilidadeDeConjuracao; end;

		args.ataque.attrBonus = common.getAttrBonus(node, args.ataque.attr);

		args.ataque.profBonus = tonumber(node.bonusProficiencia) or 0;

		args.ataque.spellBonus = args.magia.ataqueBonus or 0;

		args.ataque.bonus = common.interpreta(node, args.ataque.attrBonus .. ' + ' .. args.ataque.profBonus .. ' + ' .. args.ataque.spellBonus, {NIVELMAGIA = args.nivelEspaco});

		return do_next();
	elseif args.estado == 'rolaAtaque' then
		if not args.ataque then return do_next(); end;

		return common.rolaD20(node, args.ataque.rolls, args.ataque.bonus, chat, args.ataque.text, function(total, d20)
			args.ataque.resultado = {total, d20};
			return do_next();
		end);
	elseif args.estado == 'preparaTesteResistencia' then
		if args.magia.cdResistenciaAtributo == '' or not args.magia.cdResistenciaAtributo then return do_next(); end;

		args.testeResistencia = {
			atributo = common.atributos[args.magia.cdResistenciaAtributo] or '?',
			valor =  args.magia.cdResistenciaValor
		};

		return do_next();
	elseif args.estado == 'rolaTesteResistencia' then
		if not args.testeResistencia then return do_next(); end;

		chat:enviarAcao(Locale.lang("Dnd5e.messages.saveKind") .. args.testeResistencia.atributo .. ', CD ' .. args.testeResistencia.valor);

		return do_next();
	elseif args.estado == 'rolaFormulasDano' then
		local danos = NDB.getChildNodes(args.magia.danos);

		if not danos or #danos == 0 then return do_next(); end;

		args.danoCount = args.danoCount or 1;

		if args.danoCount <= #danos then
			local dano = danos[args.danoCount];

			local text = '';
			if dano.tipoDano then text = Locale.lang("Dnd5e.messages.damage") .. dano.tipoDano; end;
			if dano.tipoDano and dano.contexto then text = text .. ' '; end;
			if dano.contexto then text =  text .. dano.contexto; end;

			local formula = common.interpreta(node, dano.formula, {NIVELMAGIA = args.nivelEspaco});

			return chat:rolarDados(formula, text, function(roll)
				args.danoCount = args.danoCount + 1;
				return do_next();
			end);
		end;
		do_next();
	elseif args.estado == 'rolaFormulas' then
		local formulas = NDB.getChildNodes(args.magia.formulas);

		if not formulas or #formulas == 0 then return do_next(); end;

		args.formulaCount = args.formulaCount or 1;

		if args.formulaCount <= #formulas then
			local formula = formulas[args.formulaCount];

			local text = formula.contexto or '';
			local aformula = common.interpreta(node, formula.formula, {NIVELMAGIA = args.nivelEspaco});

			return chat:rolarDados(aformula, text, function(roll)
				args.formulaCount = args.formulaCount + 1;
				return do_next();
			end);
		end;
		do_next();
	elseif args.estado == 'msgFlavor' then
		if not args.magia.mensagem then return do_next(); end;

		chat:enviarAcao(args.magia.mensagem);

		return do_next();
	-- elseif args.estado == '' then
		-- if  then return do_next(); end;
		-- return do_next();
	elseif args.estado == 'end' then
		return;
	end;
end;
function common.rolaPericia(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;

	if args == nil then return;
	elseif not args.init then
		args.init = true;

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2
		elseif modo == 'vantagem2' or modo == 'desvantagem2' then args.rolls = 3
		else args.rolls = 1;
		end;

		local prefix = args.field:gsub('%..*', '');
		local suffix = args.field:gsub('.*%.', '');
		if args.tipo == 'per' and prefix == 'resistencias' then args.tipo = 'res'; end;

		if args.tipo == 'attr' then
			args.rolagem = node.atributos['mod'..suffix];
			args.text = common.atributos[suffix];
			if node.bonusHabilidades then 
				args.rolagem = args.rolagem .. ' + ' .. (tonumber(node.bonusHabilidades) or 0);
			end;
		elseif args.tipo == 'per' then
			args.rolagem = node.pericias['bonus'..suffix];
			args.text = common.pericias[suffix];
			args.prof = node.pericias[suffix];
			args.minRoll = node.pericias['bonus'..suffix..'strMinRoll'];
		elseif args.tipo == 'res' then
			args.rolagem = node.resistencias['bonus'..suffix];
			args.text = Locale.lang("Dnd5e.messages.save") .. common.atributos[suffix];
			args.prof = node.resistencias[suffix];
			args.minRoll = node.resistencias['bonus'..suffix..'strMinRoll'];
		else
			showMessage(Locale.lang("Dnd5e.messages.invalidSKill") .. args.field .. '\'.');
			return;
		end;

		args.rolagem = common.interpreta(node, args.rolls .. 'd20 + ' .. args.rolagem);
		if node.nome then args.text = args.text .. Locale.lang("Dnd5e.messages.of") .. node.nome; end;

		if modo == 'vantagem' or modo == 'vantagem2' then
			args.foo = math.max;
			args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem' or modo == 'desvantagem2' then
			args.foo = math.min;
			args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
		end;
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	end;

	-- Rolagem
	chat:rolarDados(args.rolagem, args.text, function(roll)
		if not roll then return; end;
		local result = roll.resultado;
		local d20 = roll.ops[1].resultados[1];

		if modo ~= 'normal' then
			result = result - roll.ops[1].resultados[1];
			for i=2,args.rolls do
				d20 = args.foo(d20, roll.ops[1].resultados[i]);
				result = result - roll.ops[1].resultados[i];
			end;
			result = result + d20;
		end;

		result = math.floor(result);
		d20 = math.floor(d20);
		local minRoll = tonumber(args.minRoll) or 1

		if d20 < minRoll then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.result") .. math.floor(result+minRoll-d20).. ", " .. Locale.lang("Dnd5e.messages.atrCaptionOpt2") .. ": " .. minRoll .. ")");
		elseif modo ~= 'normal' then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.result") .. result .. ' )');
		end;
	end);
end;
function common.rolaAtaque(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;

	if args == nil then return; end;

	local item = args.item;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then -- Permissão
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	else -- Munição
		if item.municao and item.municao ~= '' then
			local qtd = tonumber(item.qtMunicao);
			local contador = common.getContador(item, item.municao);
			if contador and qtd then
				if contador.valCur < qtd then
					showMessage(Locale.lang("Dnd5e.messages.noCharges") .. item.municao .. Locale.lang("Dnd5e.messages.toUse") .. item.nome .. '\'');
					return;
				else
					contador.valCur = contador.valCur - qtd;
				end;
			end;
		end;
	end;

	-- Checa argumentos
	local dano_rolls;
	if not args.init then
		args.init = true;

		item.tipo = item.tipo or '';

		if item.ataque == '—' or item.ataque == '-' then args.rolls = 0; modo = 'dano';
		elseif modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2
		elseif modo == 'vantagem2' or modo == 'desvantagem2' then args.rolls = 3
		else args.rolls = 1;
		end;

		if not args.text then
			args.text = Locale.lang("Dnd5e.messages.attacked");
			if item.nome then args.text = args.text .. ' com ' .. item.nome; end;
		end;

		if modo == 'vantagem' or modo == 'vantagem2' then
			args.foo = math.max;
			args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem' or modo == 'desvantagem2' then
			args.foo = math.min;
			args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
		elseif modo == 'dano' then
			args.text = args.text .. Locale.lang("Dnd5e.messages.autoHit");
		end;

		local acerto_rolls = {};
		if modo ~= 'dano' then acerto_rolls['Padrão'] = args.rolls .. 'd20 + ' .. (item.ataque or '0'); end;
		dano_rolls = {};
		if item.dano and item.dano ~= '' then dano_rolls[item.tipo or ''] = { ['Padrão'] = item.dano }; end;
		args.tipoDanoPadrao = dano_rolls['Padrão'];

		-- Opções de ataque
		local function optAttUseAmmo(opt)
			if not opt.municao or opt.municao == '' then return true; end;

			local qtd = tonumber(opt.qtMunicao);
			local contador = common.getContador(node, opt.municao);

			if contador.valCur < qtd then
				showMessage(Locale.lang("Dnd5e.messages.noCharges") .. opt.municao .. Locale.lang("Dnd5e.messages.toUse") .. opt.nome .. '\'');
				return false;
			end;

			contador.valCur = contador.valCur - qtd;
			return true;
		end;
		-- Percorre as opções
		if item.optsAttack then
			local optsAttack = NDB.getChildNodes(item.optsAttack);
			local optsAtivas = {};
			for i=1,#optsAttack do
				local optAttack = optsAttack[i];
				if optAttack.habilitado and optAttUseAmmo(optAttack) then
					if optAttack.nome ~= '-' and optAttack.nome ~= '—' and optAttack.nome ~= 'Padrão' then table.insert(optsAtivas, optAttack.nome); end;
					if modo ~= 'dano' then
						if optAttack.ataque and optAttack.ataque ~= '' then
							if not acerto_rolls[optAttack.nome] then acerto_rolls[optAttack.nome] = optAttack.ataque;
							else acerto_rolls[optAttack.nome] = acerto_rolls[optAttack.nome] .. ' + ' .. optAttack.ataque;
							end;
						end;
					end;
					local tipo = optAttack.tipo or item.tipo or '';
					if optAttack.dano and optAttack.dano ~= '' then
						if not dano_rolls[tipo] then dano_rolls[tipo] = {}; end;
						if not dano_rolls[tipo][optAttack.nome] then dano_rolls[tipo][optAttack.nome] = optAttack.dano;
						else dano_rolls[tipo][optAttack.nome] = dano_rolls[tipo][optAttack.nome] .. ' + ' .. optAttack.dano;
						end;
					end;
				end;
			end;
			if #optsAtivas > 0 then args.text = args.text .. ' (' .. table.concat(optsAtivas, ', ') .. ')'; end;
		end;
		-- Ajusta o acerto
		if modo ~= 'dano' then
			local nomes = {};
			local rolls = {};
			for nome,roll in pairs(acerto_rolls) do
				if nome ~= 'Padrão' and nome ~= '-' and nome ~= '—' then table.insert(nomes, nome); end;
				if nome ~= 'Padrão' then table.insert(rolls, roll); end;
			end;

			args.textAcerto = Locale.lang("Dnd5e.messages.hit2");
			if args.rolls == 3 then args.textAcerto = args.textAcerto .. Locale.lang("Dnd5e.messages.elvenPrecision");
			elseif modo == 'vantagem' or modo == 'vantagem2' then args.textAcerto = args.textAcerto .. Locale.lang("Dnd5e.messages.advantage");
			elseif modo == 'desvantagem' or modo == 'desvantagem2' then args.textAcerto = args.textAcerto .. Locale.lang("Dnd5e.messages.disadvantage");
			end;
			if #nomes > 0 then args.textAcerto = args.textAcerto .. ' - (' .. (acerto_rolls['Padrão'] and 'Padrão, ' or '') .. table.concat(nomes, ', ') .. ')'; end;

			args.rollAcerto = common.interpreta(node, acerto_rolls['Padrão']);
			if #rolls > 0 then args.rollAcerto = common.interpreta(node, args.rollAcerto .. ' + ' .. table.concat(rolls, ' + ')); end;
		end;
		-- Ajusta os danos
		args.rollsDano = {};
		args.textsDano = {};
		for tipo in pairs(dano_rolls) do
			local nomes, rolls = {}, {};
			for nome, roll in pairs(dano_rolls[tipo]) do
				if nome ~= 'Padrão' and nome ~= '-' and nome ~= '—' then table.insert(nomes, nome); end;
				if nome ~= 'Padrão' then table.insert(rolls, roll); end;
			end;

			if tipo == '' then args.textAcerto = Locale.lang("Dnd5e.messages.damage2");
			else args.textsDano[tipo] = Locale.lang("Dnd5e.messages.damage3") .. tipo .. ')';
			end;
			if #nomes > 0 then args.textsDano[tipo] = args.textsDano[tipo] .. ' - (' .. (dano_rolls[tipo]['Padrão'] and 'Padrão, ' or '') .. table.concat(nomes, ', ') .. ')'; end;

			args.rollsDano[tipo] = common.interpreta(node, (dano_rolls[tipo]['Padrão'] or '0'));
			if #rolls > 0 then args.rollsDano[tipo] = common.interpreta(node, args.rollsDano[tipo] .. ' + ' .. table.concat(rolls, ' + ')); end;
		end;

		args.falhaCritica, args.acertoCritico = 1, (tonumber(NDB.getRoot(item).critChance) or 20);
		for i=1,5 do if common.armaTemPropriedade(node, 'Misfire ' .. i) then args.falhaCritica = i; end; end;
	end;

	-- Função de rolar dano
	local function rolaDano(tipo, d20)
		if not tipo then return; end;

		local roll = args.rollsDano[tipo];
		local text = args.textsDano[tipo];
		args.rollsDano[tipo] = nil;
		args.textsDano[tipo] = nil;

		if roll then
			if d20 and d20 >= args.acertoCritico then
				text = (text or "") .. ' - ' .. Locale.lang("Dnd5e.messages.critical");
				-- Critico Maximizado
				if common.armaTemPropriedade(item, 'Crítico Maximizado') or common.fichaTemPropriedade(item, 'maximizedCrit') then
					roll = roll:gsub('(%d*)d(%d+)', function(c1, c2) return c1 .. 'd' .. c2 .. '+' .. (tonumber(c1) or 1)*tonumber(c2); end);
				else
					roll = roll:gsub('(%d*)d(%d+)', function(c1, c2) return tostring(2*(tonumber(c1) or 1)) .. 'd' .. c2; end);
				end;
				-- Critico Brutal
				local critBrutal = NDB.getRoot(item).critDamage;
				if critBrutal then
					roll = roll:gsub('(%d+)d(%d+)', function(c1, c2) return math.floor(c1+critBrutal) .. 'd' .. c2; end, 1);
				end;
			end;
			if not Firecast.interpretarRolagem(roll).possuiAlgumDado then roll = '1d1-1 + ' .. roll; end;
			chat:rolarDados(roll, text, function(_roll)
				--- Combate com Armas Grandes
				local minRoll = (tonumber(NDB.getRoot(item).damageReroll) or 0)
				if	common.armaTemPropriedade(item, 'Duas Mãos') and
					not common.armaTemPropriedade(item, 'Distância') and
					minRoll > 0 and
					dano_rolls[tipo]['Padrão'] then
						local rolls = dano_rolls[tipo]['Padrão'];
						rolls = common.interpreta(node, rolls);
						rolls = Firecast.interpretarRolagem(rolls); -- Só rerola os dados da arma

						local novaRolagem;
						local dadosPraRerolar = {};
						local soma = _roll.resultado;
						for i=1,#rolls.ops do
							local op = _roll.ops[i];
							if op.tipo == 'dado' then
								for j=1,#op.resultados do
									if op.resultados[j] <= minRoll then
										soma = soma - op.resultados[j];
										dadosPraRerolar[op.face] = (dadosPraRerolar[op.face] or 0) + 1;
									end;
								end;
							end;
						end;
						for face,quant in pairs(dadosPraRerolar) do
							if novaRolagem then novaRolagem = novaRolagem:concatenar(Firecast.interpretarRolagem(quant..'d'..face));
							else novaRolagem = Firecast.interpretarRolagem(quant..'d'..face);
							end;
						end;
						if novaRolagem then
							if soma ~= 0 then novaRolagem = novaRolagem:concatenar(Firecast.interpretarRolagem(soma)); end;
							chat:rolarDados(novaRolagem, text .. Locale.lang("Dnd5e.messages.bigWeapons") .. minRoll, function() rolaDano(next(args.rollsDano), d20); end);
						else
							rolaDano(next(args.rollsDano), d20);
						end;
				else
					rolaDano(next(args.rollsDano), d20);
				end;
			end);
		else
			rolaDano(next(args.rollsDano), d20);
		end;
	end;

	-- Comeca rolagem
	chat:enviarAcao(args.text);

	if modo ~= 'dano' then -- Completo
		chat:rolarDados(args.rollAcerto, args.textAcerto, function(roll)
			if not roll then return; end;
			local result = roll.resultado;
			local d20 = roll.ops[1].resultados[1];

			if modo ~= 'normal' then
				result = result - roll.ops[1].resultados[1];
				for i=2,args.rolls do
					d20 = args.foo(d20, roll.ops[1].resultados[i]);
					result = result - roll.ops[1].resultados[i];
				end;
				result = result + d20;
			end;

			result = math.floor(result);
			d20 = math.floor(d20);

			if modo ~= 'normal' then
				chat:enviarAcao(Locale.lang("Dnd5e.messages.hit") .. result .. ' )');
			end;

			-- Falha Crítica
			if d20 <= args.falhaCritica then
				chat:enviarAcao(Locale.lang("Dnd5e.messages.fail"));
				return;
			end;

			-- Rola danos
			rolaDano(item.tipo or '', d20);
		end);
	else -- Só dano
		-- Rola danos
		rolaDano(item.tipo or '');
	end;
end;
function common.rolaIniciativa(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;

	if args == nil then
		args = {};

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2
		elseif modo == 'vantagem2' or modo == 'desvantagem2' then args.rolls = 3
		else args.rolls = 1;
		end;

		args.text = Locale.lang("Dnd5e.messages.init");
		if node.nome then args.text = args.text .. Locale.lang("Dnd5e.messages.of") .. node.nome; end;

		if modo == 'vantagem' or modo == 'vantagem2' then
			args.foo = math.max;
			args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem' or modo == 'desvantagem2' then
			args.foo = math.min;
			args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
		end;

		args.rolagem = common.interpreta(node, args.rolls .. 'd20 + ' .. (node.iniciativa or 'DEX'));
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	end;

	-- Comeca rolagem
	chat:rolarDados(args.rolagem, args.text, function(roll)
		if not roll then return; end;
		local result = roll.resultado;

		if modo ~= 'normal' then
			local d20 = roll.ops[1].resultados[1];
			result = result - roll.ops[1].resultados[1];
			for i=2,args.rolls do
				d20 = args.foo(d20, roll.ops[1].resultados[i]);
				result = result - roll.ops[1].resultados[i];
			end;
			result = result + d20;
		end;

		result = math.floor(result);

		if modo ~= 'normal' then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.result") .. result .. ' )');
		end;
	end);
end;
function common.deathSave(node, modo, args, chat)
	-- Checa argumentos
	if not node then return end
	if (tonumber(node.pv) or 0) > 0 then return end
	node.testesContraMorte = node.testesContraMorte or {};

	if args == nil then
		args = {};

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2
		elseif modo == 'vantagem2' or modo == 'desvantagem2' then args.rolls = 3
		else args.rolls = 1;
		end;

		args.text = Locale.lang("Dnd5e.messages.deathSave");
		if node.nome then args.text = args.text .. Locale.lang("Dnd5e.messages.of") .. node.nome; end;

		if modo == 'vantagem' or modo == 'vantagem2' then
			args.foo = math.max;
			args.text = args.text .. Locale.lang("Dnd5e.messages.advantage");
		elseif modo == 'desvantagem' or modo == 'desvantagem2' then
			args.foo = math.min;
			args.text = args.text .. Locale.lang("Dnd5e.messages.disadvantage");
		end;

		args.rolagem = args.rolls .. 'd20';
		if common.fichaTemPropriedade(node, 'saveBonus') then args.rolagem = args.rolagem .. common.fichaGetPropriedadeVal(node, 'saveBonus'); end;
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage(Locale.lang("Dnd5e.messages.deniedRoll"));
		return;
	end;

	-- Comeca rolagem
	chat:rolarDados(args.rolagem, args.text, function(roll)
		if not roll then return; end;
		local result = roll.resultado;
		local d20 = roll.ops[1].resultados[1];
		node.pv = tonumber(node.pv);

		if modo ~= 'normal' then
			result = result - roll.ops[1].resultados[1];
			for i=2,args.rolls do
				d20 = args.foo(d20, roll.ops[1].resultados[i]);
				result = result - roll.ops[1].resultados[i];
			end;
			result = result + d20;
		end;

		result = math.floor(result);
		d20 = math.floor(d20);

		-- Resultados
		local s,f = 0,0;
		for i=0,2 do
			if node.testesContraMorte['s'..i] then s = s + 1; end;
			if node.testesContraMorte['f'..i] then f = f + 1; end;
		end;

		if d20 == 20 then
			node.pv = 1;
		elseif result >= 10 then
			node.testesContraMorte['s'..s] = true;
			s = s + 1;
		elseif d20 > 1 then
			node.testesContraMorte['f'..f] = true;
			f = f + 1;
		else
			for i=1,2 do
				if f < 3 then
					node.testesContraMorte['f'..f] = true;
					f = f + 1;
				end;
			end;
		end;

		function reset()
			for i=0,2 do
				node.testesContraMorte['s'..i] = false;
				node.testesContraMorte['f'..i] = false;
			end;
		end;

		if node.pv > 0 then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.awake"));
			reset();
		elseif s >= 3 then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.stable"));
			chat:rolarDados("1d4", Locale.lang("Dnd5e.messages.uncounscious"));
			reset();
		elseif f >= 3 then
			chat:enviarAcao(Locale.lang("Dnd5e.messages.died"));
		end;
	end);
end;

function common.interpreta(node, text, subsTable)
	if text then
		text = text:gsub('%s', '');
		local function recursiveInterpret(val, sumAndSubtract)
			val = val:gsub('(%b())', function(v)
				if #v == 2 then return ''; end;
				return recursiveInterpret(v:sub(2,-2), true);
			end);

			for key,value in pairs(subsTable or {}) do
				val = val:gsub(key, tonumber(value) or 0);
			end;
			if node then
				local ficha = common.getTopNode(node);
				if ficha.atributos then
					for key,vals in pairs(common.atributos2) do
						val = val:gsub(vals[1], ficha.atributos['mod'..key] or 0);
						val = val:gsub(vals[2], ficha.atributos['mod'..key] or 0);
					end;
				end;
				val = val:gsub('PROF', math.floor(ficha.bonusProficiencia or 0))
			end;
			repeat val,_ = val:gsub('(%d+)([%*%/])(%d*)', function(val1, op, val2)
				if op == '*' then	return math.floor(tonumber(val1) * tonumber(val2));
				else				return math.floor(tonumber(val1) / tonumber(val2));
				end;
			end, 1) until _ == 0;
			if sumAndSubtract then repeat val,_ = val:gsub('(%d+)([%+%-])(%d+)', function(val1, op, val2)
				if op == '+' then	return math.floor(tonumber(val1) + tonumber(val2));
				else				return math.floor(tonumber(val1) - tonumber(val2));
				end;
			end, 1) until _ == 0; end;

			return val;
		end;

		text = recursiveInterpret(text, false);

		text = text:gsub('([%+%-][%+%-]+)', function(capture)
			local count = select(2, capture:gsub('%-', ''));
			if count % 2 == 0 then return '+'; end;
			return '-';
		end);
		text = text:gsub('%+0', '');
		text = text:gsub('^0%+','');
	end;
	return text;
end;

function common.getTopNode(node)
	if node then return NDB.getRoot(node); end;
	return nil;
end;
function common.getMesa(node)
	return Firecast.getRoomOf(node);
end;
function common.getPersonagem(node)
	return Firecast.getPersonagemDe(node);
end;
function common.getJogador(node)
	return common.getPersonagem(node).dono;
end;
function common.getContador(node, name)
	local contadores = NDB.getChildNodes(common.getTopNode(node).contadores);
	for i=1,#contadores do
		if contadores[i].name == name then return contadores[i]; end;
	end;
	return nil;
end;
function common.getNomeContadores(node, tab)
	local ficha = common.getTopNode(node);
	local contadores = NDB.getChildNodes(ficha.contadores);
	for i=1,#contadores do table.insert(tab, contadores[i].name); end;
	return tab;
end;

function common.isMyChar(node)
	return common.getMesa(node).meuJogador == common.getJogador(node);
end;
function common.isMainChar(node)
	local personagem = common.getPersonagem(node);
	if personagem == nil then return nil; end;
	if personagem.dono == nil then return false; end;
	return personagem.dono.personagemPrincipal == Firecast.getBibliotecaItemDe(personagem).codigoInterno;
end;
function common.podeRolar(node)
	if not node then return nil; end;
	node = common.getTopNode(node);

	local mesa = common.getMesa(node);
	if not mesa then return nil; end;

	local meuJogador = mesa.meuJogador;
	if not meuJogador then return nil; end;

	return common.isMyChar(node) or meuJogador.isMestre;
end;

function common.concat(tab, sep)
	if sep == nil then sep = ' '; end;
	local str = '';
	if tab then
		local arr = {};
		for key,val in pairs(tab) do
			table.insert(arr, key);
		end;
		table.sort(arr);
		if #arr ~= 0 then str = arr[1]; end;
		for i=2,#arr do str = str .. sep .. arr[i]; end;
	end;
	return str;
end;
function common.hasValue(array, value)
	if not array then return false; end;
	for i=1,#array,1 do
		if array[i] == value then return true; end;
	end;
	return false;
end;

function common.askForDelete(node, text)
	text = text or Locale.lang("Dnd5e.messages.delete");
	Dialogs.confirmYesNo(text, function(confirmado) if confirmado then NDB.deleteNode(node); end; end);
end;

function common.armaTemPropriedade(node, prop)
	if not node then return nil; end;
	if not node.tabPropriedades then node.tabPropriedades = {}; end;
	return node.tabPropriedades[prop];
end;
function common.fichaTemPropriedade(node, prop)
	if not node then return nil; end;
	node = common.getTopNode(node);
	if not node then return nil; end;

	if common.ficha_propriedades[prop] == nil then 
		--showMessage('Propriedade \'' .. prop .. '\' inválida.'); 
		return nil; 
	end;
	--if common.ficha_propriedades[prop].implementado == false then 
		--showMessage('Acessando propriedade \'' .. prop .. '\' não implementada.'); 
	--end;

	if not node.propriedades then node.propriedades = {}; end;

	return node.propriedades[prop];
end;
function common.fichaGetPropriedade(node, prop)
	if common.fichaTemPropriedade(node, prop) == nil then return nil; end;
	node = common.getTopNode(node);

	local propriedades = NDB.getChildNodes(node.propriedades.rcl);
	for i=1,#propriedades do
		if propriedades[i].id == prop then return propriedades[i]; end;
	end;
	showMessage('Propriedade \'' .. prop .. '\' marcada como ' .. tostring(common.fichaTemPropriedade(node, prop)) .. ' e não encontrada.');
	return nil;
end;
function common.fichaGetPropriedadeVal(node, prop)
	if not common.fichaTemPropriedade(node, prop) then return nil; end;
	local propriedade = common.fichaGetPropriedade(node, prop);
	if propriedade.tipo == 'bool' then return true; end;
	return propriedade.val;
end;
function common.fichaTemEspecializacao(node, pericia)
	if (not node) or (not pericia) then return nil; end;
	node = common.getTopNode(node);
	if not node then return nil; end;

	if common.pericias[pericia] == nil then
		if not common.atributos[pericia] then showMessage('Acessando perícia inválida \'' .. pericia .. '\'.'); end;
		return nil;
	end;

	if not node.macroExpertise then node.macroExpertise = {}; end;

	node.macroExpertise[pericia] = node.macroExpertise[pericia] or false;

	return node.macroExpertise[pericia];
end;
function common.fichaSetEspecializacao(node, pericia, val)
	if (not node) or (not pericia) then return; end;
	node = common.getTopNode(node);
	if not node then return; end;

	if common.pericias[pericia] == nil then
		if not common.atributos[pericia] then showMessage('Acessando perícia inválida \'' .. pericia .. '\'.'); end;
		return;
	end;

	if not node.macroExpertise then node.macroExpertise = {}; end;

	node.macroExpertise[pericia] = val or false;
end;

function common.calculaBonus(node, tipo, attr, pericia)
	local valor = 0;
	local hints = {};

	node.atributos = node.atributos or {};

	do -- Modificador atributo
		local bonus = tonumber(node.atributos['mod'..attr] or '0');
		local hint = common.atributos[attr];
		do -- Propriedades
			local props = {
				prescience = {
					{'resistencia', 'destreza',		nil,			'inteligencia',	'subst'},
					{'pericia',		'sabedoria',	'percepcao',	'inteligencia',	'subst'},
				},
				magicalLogician = {
					{'pericia',		'carisma',		'persuasao',	'inteligencia',	'subst'},
				},
				imposing = {
					{'pericia',		'carisma',		'intimidacao',	'forca',		'subst'},
				},
				elegance = {
					{'pericia',		'carisma',		'atuacao',		'sabedoria',	'add'},
				},
			};
			for prop,v in pairs(props) do for i=1,#v do val = v[i];
				if common.fichaTemPropriedade(node, prop) and tipo==val[1] and attr==val[2] and pericia==val[3] then
					local modNovo = tonumber(node.atributos['mod'..val[4]] or '0');
					local hintNova = common.atributos[val[4]] .. ' (' .. common.ficha_propriedades[prop].nome .. ')';
					if val[5] == 'subst' then
						if modNovo > bonus then
							bonus = modNovo;
							hint = hintNova;
						end;
					elseif val[5] == 'add' then
						valor = valor + modNovo;
						table.insert(hints, hintNova .. ' [' .. modNovo .. ']');
					end;
				end;
			end; end;
		end;

		table.insert(hints, hint .. ' [' .. bonus .. ']');
		valor = valor + bonus;
	end;

	do -- Proficiência
		local temProf, temExp, temVers;

		if tipo == 'resistencia' then
			node.resistencias = node.resistencias or {};
			node.resistencias.attr = node.resistencias.attr or false;
			temProf = node.resistencias[attr];
		elseif tipo == 'pericia' then
			node.pericias = node.pericias or {};
			node.pericias.pericia = node.pericias.pericia or false;
			temProf = node.pericias[pericia];
			temExp = common.fichaTemEspecializacao(node, pericia);
			if common.fichaTemPropriedade(node, 'jackOfAllTrades') then temVers = 'jackOfAllTrades';
			elseif common.fichaTemPropriedade(node, 'remarkableAthlete') and (attr == 'forca' or attr == 'destreza' or attr == 'constituicao') then temVers = 'remarkableAthlete';
			else temVers = false;
			end;
		end;

		local bonus = tonumber(node.bonusProficiencia or '0');
		local hint = '';

		if temProf then
			if temExp then
				bonus = bonus * 2;
				hint = 'Especialização';
			else
				hint = 'Proficiência';
			end;
		elseif temVers == 'jackOfAllTrades' then
			bonus = bonus // 2;
			hint = common.fichaGetPropriedade(node, temVers).nome;
		elseif temVers == 'remarkableAthlete' then
			bonus = (bonus+1) // 2;
			hint = common.fichaGetPropriedade(node, temVers).nome;
		else
			bonus = 0;
		end;
		if bonus ~= 0 then
			table.insert(hints, hint .. ' [' .. bonus .. ']');
			valor = valor + bonus;
		end;
	end;

	do -- Bônus geral
		local bonus;
		if tipo == 'resistencia' then bonus = 'saveBonus';
		else bonus = 'checkBonus';
		end;
		if common.fichaTemPropriedade(node, bonus) then
			table.insert(hints, common.ficha_propriedades[bonus].nome .. ' [' .. (common.fichaGetPropriedadeVal(node, bonus) or '0') .. ']');
		end;
	end;

	return valor, table.concat(hints, ' + ');
end;

function common.deepCopy(src, dest, backup)
	for key in pairs(src) do
		if type(src[key]) == 'table' then
			if backup then backup[key] = backup[key] or {}; end;
			if dest then dest[key] = dest[key] or {}; end;
			common.deepCopy(src[key], dest and dest[key], backup and backup[key]);
		else
			if backup then backup[key] = dest[key]; end;
			if dest then dest[key] = src[key]; end;
		end;
	end;
end;
function common.deepCompare(left, right)
	if type(left) ~= type(right) then return false;
	elseif type(left) == 'table' then
		local keys = {};
		for key in pairs(left)  do keys[key] = (keys[key] or 0) + 1 end;
		for key in pairs(right) do keys[key] = (keys[key] or 0) + 1 end;

		for key in pairs(keys)  do if (keys[key] ~= 2) or (not common.deepCompare(left[key], right[key])) then return false; end; end;
	else return left == right;
	end;
	return true;
end;

function common.keyDown(node, event, element)
	if not node then
		showMessage('node = nil');
		return;
	end;
	node = common.getTopNode(node);
	node.keys = node.keys or {};

	node.keys[event.keyCode] = true;

	if element then
		hk = hk or { vantagem = 16, desvantagem = 17 };
		if node.keys[hk.vantagem] then
			element.fontColor = "Green"
		elseif node.keys[hk.desvantagem] then
			element.fontColor = "Red"
		end;
	end

	-- if not node.keys[event.keyCode] then
	-- 	common.getMesa(node).chat:enviarMensagem('keyDown ' .. event.keyCode);
	-- 	node.keys[event.keyCode] = true;
	-- end;
end;
function common.keyUp(node, event, element)
	if not node then
		showMessage('node = nil');
		return;
	end;
	node = common.getTopNode(node);
	node.keys = node.keys or {};

	node.keys[event.keyCode] = nil;

	if element then
		element.fontColor = "White"
	end

	-- if node.keys[event.keyCode] then
	-- 	common.getMesa(node).chat:enviarMensagem('keyUp ' .. event.keyCode);
	-- 	node.keys[event.keyCode] = nil;
	-- end;
end;
function common.onClick(node, foo, args, hk, useActiveChat)
	if not node then return; end;
	node = common.getTopNode(node);
	node.keys = node.keys or {};
	hk = hk or { vantagem = 16, desvantagem = 17 };

	local chat = common.getMesa(node).activeChat;
	local options = {LANG("Dnd5e.messages.normal")}
	if not useActiveChat then
		options = {LANG("Dnd5e.messages.normal"),LANG("Dnd5e.messages.adv"),LANG("Dnd5e.messages.dis"),LANG("Dnd5e.messages.adv2"),LANG("Dnd5e.messages.dis2")}
	end;

	Dialogs.choose(LANG("Dnd5e.messages.kind"), options,
               function(selected, selectedIndex, selectedText)
               		if useActiveChat then
               			if     node.keys[hk.vantagem]    then	foo(node, 'vantagem',    args, chat);
						elseif node.keys[hk.desvantagem] then	foo(node, 'desvantagem', args, chat);
						else									foo(node, 'normal',      args, chat);
						end;
               		elseif selected then
               			if     selectedIndex==2    	then	foo(node, 'vantagem',    args, chat)
						elseif selectedIndex==3    	then	foo(node, 'desvantagem', args, chat)
						elseif selectedIndex==4    	then	foo(node, 'vantagem2', args, chat)
						elseif selectedIndex==5    	then	foo(node, 'desvantagem2', args, chat)
						else								foo(node, 'normal',      args, chat)
						end;
                  	end
               end,
               1, true)
end;

function common.getAttrBonus(node, attr)
	if not node then return; end;
	node = common.getTopNode(node);

	for key, val in pairs(common.atributos2) do
		if attr == key or attr == val[1] or attr == val[2] or attr:upper() == val[1] or attr:upper() == val[2] then
			return node.atributos['mod' .. common.toCapitalCase(key)];
		end;
	end;
end;

function common.toCapitalCase(text)
	return ((text or ''):gsub("^%l", string.upper));
end;

function common.eventFunc(ficha, modo, args, chat)
	if args.contexto == 'rolaMagia' then
		common.rolaMagia2(ficha, modo, { magia=args.node, estado='inicial' }, chat);
	elseif args.contexto == 'editaMagia' then
		ficha.magias.selecionada = args.node.id;
	elseif args.contexto == 'apagaMagia' then
		common.askForDelete(args.node);
	elseif args.contexto == 'criaMagia' then
		local node = args.form.rclMagias:append();
		ficha.magias.count = (ficha.magias.count or 0) + 1;
		node.id = ficha.magias.count;
	end;
end;

function common.getNivelMagia(ficha, nivel)
	if not ficha then return; end;
	ficha = common.getTopNode(ficha);
	nivel = (nivel or 0);

	if nivel == 0 then nivel = 'Truques';
	else nivel = nivel .. 'º Nível';
	end;

	local nodes = NDB.getChildNodes(ficha.magias.niveis);
	for i=1,#nodes do
		if nodes[i].nome == nivel then return nodes[i]; end;
	end;
end;
