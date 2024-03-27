common = {};

common.atributos = {
	forca			= 'Força',
	destreza		= 'Destreza',
	constituicao	= 'Constituição',
	inteligencia	= 'Inteligência',
	sabedoria		= 'Sabedoria',
	carisma			= 'Carisma'
};
common.atributos2 = {
	forca			= {'FOR', 'STR'},
	destreza		= {'DES', 'DEX'},
	constituicao	= {'CON', 'CON'},
	inteligencia	= {'INT', 'INT'},
	sabedoria		= {'SAB', 'WIS'},
	carisma			= {'CAR', 'CHA'}
};
common.pericias = {
	atletismo		= 'Atletismo',
	acrobacia		= 'Acrobacia',
	furtividade		= 'Furtividade',
	prestidigitacao	= 'Prestidigitação',
	arcanismo		= 'Arcanismo',
	historia		= 'História',
	investigacao	= 'Investigação',
	natureza		= 'Natureza',
	religiao		= 'Religião',
	adestrarAnimais	= 'Adestrar Animais',
	intuicao		= 'Intuição',
	medicina		= 'Medicina',
	percepcao		= 'Percepção',
	sobrevivencia	= 'Sobrevivência',
	atuacao			= 'Atuação',
	enganacao		= 'Enganação',
	intimidacao		= 'Intimidação',
	persuasao		= 'Persuasão'
};
common.armas_propriedades = {
	['Acuidade'] = [[Quando realizar um ataque com uma arma com a propriedade acuidade, você pode escolher usar seu modificador de Força ou de Destreza para realizar a jogada de ataque e de dano. ]] ..
		[[Você precisa usar o mesmo modificador para ambas as jogadas, ataque e dano.]],
	['Alcance'] = [[Essa arma adiciona 1,5 metro ao seu alcance quando você a usa para atacar. Essa propriedade também determina seu alcance ao realizar ataques de oportunidade com uma arma de alcance.]],
	['Arremesso'] = [[Essa arma adiciona 1,5 metro ao seu alcance quando você a usa para atacar. Essa propriedade também determina seu alcance ao realizar ataques de oportunidade com uma arma de alcance.]],
	['Distância'] = [[Uma arma que pode ser usada para realizar ataques à distância possui a distância mostrada entre parênteses após a propriedade munição ou arremesso. A distância lista dois números. ]] ..
		[[O primeiro é a distância normal da arma, o segundo indica a distância máxima da arma, ambos em metros. Quando atacar um alvo que está além da distância normal da arma, ]] ..
		[[você possui desvantagem na jogada de ataque. Você não pode atacar um alvo que esteja além da distância máxima da arma.]],
	['Duas Mãos'] = [[Essa arma requer as duas mãos para ser usada. Essa propriedade só é relevante quando você ataca com a arma, não enquanto apenas a segura.]],
	['Especial (Cimitarra Dupla)'] = [[Se você atacar com uma cimitarra dupla como parte da ação de ataque no seu turno, poderá usar uma ação bônus imediatamente depois para fazer um ataque corpo a corpo com ela. ]] ..
		[[Esse ataque causa 1d4 de dano cortante ao acertar, em vez de 2d4.]],
	['Especial (Lança de Montaria)'] = [[Você tem desvantagem quando usar a lança longa para atacar um alvo a até 1,5 metro de você. Além disso, uma lança longa requer as duas mãos para ser empunhada quando você não está em uma montaria.]],
	['Especial (Rede)'] = [[Uma criatura Grande ou menor atingida por uma rede fica impedida até se libertar. Uma rede não afeta criaturas que não possuam uma forma definida, ou criaturas Enormes ou maiores. ]] ..
		[[A criatura pode usar sua ação para realizar um teste de Força CD 10 para se libertar, ou outra criatura dentro do alcance que obtiver sucesso no teste pode fazer isso por ela. ]] ..
		[[Causar 5 de dano cortante à rede (CA 10) também liberta a criatura sem feri-la, encerrando o efeito e destruindo a rede. Quando você usa uma ação, ação bônus, ou reação para atacar com a rede, ]] ..
		[[você pode realizar apenas um ataque, independentemente do número de ataques que você possa realizar normalmente.]],
	['Leve'] = [[Uma arma leve é pequena e de fácil manuseio, tornando-a ideal para usar quando você está combatendo com duas armas.]],
	['Munição'] = [[Você pode usar uma arma que tenha a propriedade munição para realizar um ataque à distância, apenas se possuir munição para disparar a arma. Cada vez que você atacar com a arma, você gasta uma peça de munição. ]] ..
		[[Sacar a munição de uma aljava, bolsa, ou outro recipiente faz parte do ataque. No fim da batalha, você pode recuperar metade de sua munição gasta, se tiver um minuto para procurar pelo campo de batalha. ]] ..
		[[Recarregar uma arma de uma mão requer uma mão livre. ]],
	['Pesada'] = [[Criaturas pequenas têm desvantagem nas jogadas de ataque com estas armas. O tamanho e o peso de uma arma pesada tornam-na muito grande para ser empunhada eficientemente por criaturas Pequenas.]],
	['Recarga'] = [[Devido o tempo necessário para recarregar essa arma, você pode disparar apenas uma peça de munição da arma quando usa uma ação, ação bônus, ou reação para disparar, não importando quantos ataques você possua.]],
	['Versátil'] = [[Essa arma pode ser usada com uma ou duas mãos. Um valor de dano aparece entre parênteses com a propriedade – é o dano da arma quando usada com as duas mãos para efetuar ataques corpo-a-corpo.]],
	['Mágica'] = [[A arma é mágica.]],
	['Prateada'] = [[A arma é banhada em prata.]],
	['Crítico Maximizado'] = [[Essa arma usa a regra homebrew de maximizar o dano extra dos acertos críticos.]],
	['Misfire 1'] = [[Misfire 1.]],
	['Misfire 2'] = [[Misfire 2.]],
	['Misfire 3'] = [[Misfire 3.]],
	['Misfire 4'] = [[Misfire 4.]],
	['Misfire 5'] = [[Misfire 5.]],
};
common.ficha_propriedades = {
	checkBonus = {
		nome = 'Bonus para Testes',
		descricao = 'Bonus adicionado em todos os testes de habilidade (pode conter dados).',
		tipo = 'rolagem',
		default = '0',
	},
	saveBonus = {
		nome = 'Bonus para Saves',
		descricao = 'Bonus adicionado em todos os testes de resistência (pode conter dados).',
		tipo = 'rolagem',
		default = '0',
	},
	brutalCritical = {
		nome = 'Crítico Brutal',
		descricao = 'Habilidade de Meio-Orcs e Barbaros, adiciona um número adicional de dados quando faz um acerto crítico.',
		tipo = 'int',
		min = 1,
		default = 1,
	},
	improvedCritical = {
		nome = 'Crítico Melhorado',
		descricao = 'Menor rolagem no d20 para um ataque ser considerado um acerto crítico.',
		tipo = 'int',
		min = 1,
		max = 20,
		default = 19,
	},
	jackOfAllTrades = {
		nome = 'Versatilidade',
		descricao = 'Habilidade de Bardos, adiciona metade de seu bonus de proficiência em testes de habilidade nos quais você não é proficiente.',
		tipo = 'bool',
	},
	remarkableAthlete = {
		nome = 'Atletismo Extraordinário',
		descricao = 'Habilidade de Guerreiros Campeões, adiciona metade de seu bonus de proficiência em testes de habilidade de força, destreza e constituição, nos quais você não é proficiente.',
		tipo = 'bool',
	},
	prescience = {
		nome = 'Previsão',
		descricao = 'Habilidade de Psion, permite usar seu modificador de inteligência para testes de percepção e iniciativa, e fazer testes de resistência de inteligência ao invés de de destreza.',
		tipo = 'bool',
	},
	magicalLogician = {
		nome = '\'Magical Logician\'',
		descricao = 'Habilidade de magos \'Filósofos\', permite usar seu modificador de inteligência para testes de persuasão.',
		tipo = 'bool',
	},
	greatWeaponFighting = {
		nome = 'Combate com Armas Grandes',
		descricao = 'Estilo de combate que permite rerolar 1s e 2s em rolagems de dano.',
		tipo = 'bool',
	},
	reliableTalent = {
		nome = 'Talento Confiável',
		descricao = 'Habilidade de Ladinos, permite substituir o resultado de qualquer d20 em testes de habilidades que você é proficiênte por um 10.',
		tipo = 'bool',
	},
	imposing = {
		nome = 'Imponente',
		descricao = 'Habilidade da arvore de talentos de intimidação, permite usar seu modificador de força para testes de intimidação.',
		tipo = 'bool',
	},
	lucky = {
		nome = 'Sortudo',
		descricao = 'Habilidade de Halflings, permite rerolar 1s em d20s para ataques, testes de habilidade e testes de resistência.',
		tipo = 'bool',
		implementado = false,
	},
	elegance = {
		nome = 'Elegância',
		descricao = 'Habilidade de Discípulos, permite adicionar seu modificador de sabedoria para testes de carisma (atuação).',
		tipo = 'bool',
	},
	elvenAccuracy = {
		nome = 'Precisão Élfica',
		descricao = 'Talento racial de Elfos, permite rolar 3 d20s quanto faz um ataque —que não usa força— com vantagem.',
		tipo = 'bool',
	},
	maximizedCrit = {
		nome = 'Crítico Maximizado',
		descricao = 'Essa arma usa a regra homebrew de maximizar o dano extra dos acertos críticos.',
		tipo = 'bool',
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
		showMessage('Você não pode rolar dados por essa personagem.');
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
				Dialogs.choose("Qual o nível do espaço de magia?", choices,
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
				Dialogs.confirmYesNo("Deseja gastar esse espaço de magia?", function (selected)
					if selected then
						local gastos = tonumber(node.magias["espacosGastos" .. args.nivel]);
						local totais = tonumber(node.magias["espacosTotais" .. args.nivel]);
						if (gastos == nil) or (totais == nil) or (gastos >= totais) then
							showMessage("Você não tem espaços de magia desse nível disponiveis.");
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


				args.text = args.magia.ataque;

				if modo == 'vantagem' then
					args.rolls = 2;
					args.foo = math.max;
					args.text = args.text .. ' - Vantagem';
				elseif modo == 'desvantagem' then
					args.rolls = 2;
					args.foo = math.min;
					args.text = args.text .. ' - Desvantagem';
				else
					args.rolls = 1;
				end;

				args.acerto = common.interpreta(args.ficha, args.rolls .. 'd20 + ' .. node.magias.bonusAtaqueSTR);
			else
				args.ataque = 'nao';
			end;
		end;

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
		showMessage('Você não pode rolar dados por essa personagem.');
		return;
	end;

	-- Mensagem
	local texto = 'castou';
	if args.magia.nome then
		texto = texto .. ' "' .. args.magia.nome .. '"';
	else
		texto = texto .. ' uma magia'
	end;

	if args.gastaEspacoDeMagia == 'sim' then
		texto = texto .. ' com um espaço de magia de nível ' .. args.nivel;
		node.magias["espacosGastos" .. args.nivel] = tonumber(node.magias["espacosGastos" .. args.nivel]) + 1;
	end;
	chat:enviarAcao(texto);

	-- Teste de Resistência
	if args.resistencia ~= 'nao' then
		chat:enviarAcao('( Teste de resistência de ' .. args.resistencia .. ', CD ' .. args.resistenciaCD .. ' )');
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
				chat:enviarAcao('[§K4]( Acerto Crítico )');
			elseif modo ~= 'normal' then
				chat:enviarAcao('( Acerto = ' .. result .. ' )');
			end;
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
		Dialogs.choose("Qual o nível do espaço de magia?", choices, function(selected, selectedIndex, selectedText)
			if selected then
				args.nivelEspaco = tonumber(selectedText);
				return do_next();
			end;
		end, 1, true);

		return;
	elseif args.estado == 'perguntaEspacoGasta' then
		if args.magia.nivel == 0 then return do_next(); end;

		Dialogs.confirmYesNo("Deseja gastar esse espaço de magia?", function (selected)
			if selected then
				local nivelMagia = common.getNivelMagia(node, args.nivelEspaco) or {};
				local restantes = tonumber(nivelMagia.espacosAtuais);
				if not (restantes >= 1) then
					showMessage("Você não tem espaços de magia desse nível disponiveis.");
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

		Dialogs.confirmYesNo("Deseja gastar " .. args.magia.contadorUsos .. " '" .. args.magia.contadorNome .. "'?", function (selected)
			if selected then
				local atual = tonumber(contador.valCur);
				if not atual or args.magia.contadorUsos > atual then
					showMessage("Você não tem usos suficientes desse recurso.");
					return;
				end;
			end;
			args.gastaRecurso = selected;
			return do_next();
		end);

		return;
	elseif args.estado == 'conjuracao' then
		local text = 'conjurou ';
		if args.magia.nome then text = text .. args.magia.nome;
		else text = text .. 'uma magia';
		end;

		if args.nivelEspaco then text = text .. ' (Nível ' .. args.nivelEspaco .. ')'; end;

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
			args.ataque.text = args.ataque.text .. ' - Vantagem';
		elseif modo == 'desvantagem' then
			args.ataque.rolls = -2;
			args.ataque.text = args.ataque.text .. ' - Desvantagem';
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

		chat:enviarAcao('Teste de resistência de ' .. args.testeResistencia.atributo .. ', CD ' .. args.testeResistencia.valor);

		return do_next();
	elseif args.estado == 'rolaFormulasDano' then
		local danos = NDB.getChildNodes(args.magia.danos);

		if not danos or #danos == 0 then return do_next(); end;

		args.danoCount = args.danoCount or 1;

		if args.danoCount <= #danos then
			local dano = danos[args.danoCount];

			local text = '';
			if dano.tipoDano then text = 'Dano: ' .. dano.tipoDano; end;
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

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2;
		else args.rolls = 1;
		end;

		local prefix = args.field:gsub('%..*', '');
		local suffix = args.field:gsub('.*%.', '');
		if args.tipo == 'per' and prefix == 'resistencias' then args.tipo = 'res'; end;

		if args.tipo == 'attr' then
			args.rolagem = node.atributos['mod'..suffix];
			args.text = common.atributos[suffix];
			if common.fichaTemPropriedade(node, 'checkBonus') then args.rolagem = args.rolagem .. ' + ' .. common.fichaGetPropriedadeVal(node, 'checkBonus'); end;
		elseif args.tipo == 'per' then
			args.rolagem = node.pericias['bonus'..suffix];
			args.text = common.pericias[suffix];
			args.prof = node.pericias[suffix];
			if common.fichaTemPropriedade(node, 'checkBonus') then args.rolagem = args.rolagem .. ' + ' .. common.fichaGetPropriedadeVal(node, 'checkBonus'); end;
		elseif args.tipo == 'res' then
			args.rolagem = node.resistencias['bonus'..suffix];
			args.text = 'Resistência - ' .. common.atributos[suffix];
			args.prof = node.resistencias[suffix];
			if common.fichaTemPropriedade(node, 'saveBonus') then args.rolagem = args.rolagem .. ' + ' .. common.fichaGetPropriedadeVal(node, 'saveBonus'); end;
		else
			showMessage('Perícia inválida \'' .. args.field .. '\'.');
			return;
		end;

		args.rolagem = common.interpreta(node, args.rolls .. 'd20 + ' .. args.rolagem);
		if node.nome then args.text = args.text .. ' de ' .. node.nome; end;

		if modo == 'vantagem' then
			args.foo = math.max;
			args.text = args.text .. ' - Vantagem';
		elseif modo == 'desvantagem' then
			args.foo = math.min;
			args.text = args.text .. ' - Desvantagem';
		end;
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage('Você não pode rolar dados por essa personagem.');
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

		if d20 < 10 and args.tipo == 'per' and args.prof and common.fichaTemPropriedade(node, 'reliableTalent') then
			chat:enviarAcao('( Resultado = ' .. math.floor(result+10-d20) .. ' devido a \'' .. common.fichaGetPropriedade(node, 'reliableTalent').nome .. '\' )');
		elseif modo ~= 'normal' then
			chat:enviarAcao('( Resultado = ' .. result .. ' )');
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
		showMessage('Você não pode rolar dados por essa personagem.');
		return;
	else -- Munição
		if item.municao and item.municao ~= '' then
			local qtd = tonumber(item.qtMunicao);
			local contador = common.getContador(item, item.municao);
			if contador and qtd then
				if contador.valCur < qtd then
					showMessage('Você não tem cargas suficientes de \'' .. item.municao .. '\' para usar \'' .. item.nome .. '\'');
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
		elseif modo == 'vantagem' and common.fichaTemPropriedade(node, 'elvenAccuracy') then args.rolls = 3;
		elseif modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2;
		else args.rolls = 1;
		end;

		if not args.text then
			args.text = 'atacou';
			if item.nome then args.text = args.text .. ' com ' .. item.nome; end;
		end;

		if modo == 'vantagem' then
			args.foo = math.max;
			args.text = args.text .. ' - Vantagem';
		elseif modo == 'desvantagem' then
			args.foo = math.min;
			args.text = args.text .. ' - Desvantagem';
		elseif modo == 'dano' then
			args.text = args.text .. ' - Acerto automático';
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
				showMessage('Você não tem cargas suficientes de \'' .. opt.municao .. '\' para usar \'' .. opt.nome .. '\'');
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

			args.textAcerto = 'Acerto';
			if args.rolls == 3 then args.textAcerto = args.textAcerto .. ' - Precisão Élfica';
			elseif modo == 'vantagem' then args.textAcerto = args.textAcerto .. ' - Vantagem';
			elseif modo == 'desvantagem' then args.textAcerto = args.textAcerto .. ' - Desvantagem';
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

			if tipo == '' then args.textAcerto = 'Dano';
			else args.textsDano[tipo] = 'Dano (' .. tipo .. ')';
			end;
			if #nomes > 0 then args.textsDano[tipo] = args.textsDano[tipo] .. ' - (' .. (dano_rolls[tipo]['Padrão'] and 'Padrão, ' or '') .. table.concat(nomes, ', ') .. ')'; end;

			args.rollsDano[tipo] = common.interpreta(node, (dano_rolls[tipo]['Padrão'] or '0'));
			if #rolls > 0 then args.rollsDano[tipo] = common.interpreta(node, args.rollsDano[tipo] .. ' + ' .. table.concat(rolls, ' + ')); end;
		end;

		args.falhaCritica, args.acertoCritico = 1, tonumber(common.fichaGetPropriedadeVal(node, 'improvedCritical') or 20);
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
				text = text .. ' - [§K4]Acerto crítico';
				-- Critico Maximizado
				if common.armaTemPropriedade(item, 'Crítico Maximizado') or common.fichaTemPropriedade(item, 'maximizedCrit') then
					roll = roll:gsub('(%d*)d(%d+)', function(c1, c2) return c1 .. 'd' .. c2 .. '+' .. (tonumber(c1) or 1)*tonumber(c2); end);
				else
					roll = roll:gsub('(%d*)d(%d+)', function(c1, c2) return tostring(2*(tonumber(c1) or 1)) .. 'd' .. c2; end);
				end;
				-- Critico Brutal
				local critBrutal = common.fichaGetPropriedadeVal(item, 'brutalCritical');
				if critBrutal and (tipo == args.tipoDanoPadrao) then
					roll = roll:gsub('(%d+)d(%d+)', function(c1, c2) return math.floor(c1+critBrutal) .. 'd' .. c2; end, 1);
				end;
			end;
			if not Firecast.interpretarRolagem(roll).possuiAlgumDado then roll = '1d1-1 + ' .. roll; end;
			chat:rolarDados(roll, text, function(_roll)
				--- Combate com Armas Grandes
				if	common.armaTemPropriedade(item, 'Duas Mãos') and
					not common.armaTemPropriedade(item, 'Distância') and
					common.fichaTemPropriedade(item, 'greatWeaponFighting') and
					dano_rolls[tipo]['Padrão'] and
					true then
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
									if op.resultados[j] == 1 or op.resultados[j] == 2 then
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
							chat:rolarDados(novaRolagem, text .. ' - Rerolando 1s e 2s, devido a Combate com Armas Grandes', function() rolaDano(next(args.rollsDano), d20); end);
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
				chat:enviarAcao('( Acerto = ' .. result .. ' )');
			end;

			-- Falha Crítica
			if d20 <= args.falhaCritica then
				chat:enviarAcao('rolou uma falha crítica.');
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

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2;
		else args.rolls = 1;
		end;

		args.text = 'Iniciativa';
		if node.nome then args.text = args.text .. ' de ' .. node.nome; end;

		if modo == 'vantagem' then
			args.foo = math.max;
			args.text = args.text .. ' - Vantagem';
		elseif modo == 'desvantagem' then
			args.foo = math.min;
			args.text = args.text .. ' - Desvantagem';
		end;

		args.rolagem = common.interpreta(node, args.rolls .. 'd20 + ' .. (node.iniciativa or 'DEX'));
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage('Você não pode rolar dados por essa personagem.');
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
			chat:enviarAcao('( Resultado = ' .. result .. ' )');
		end;
	end);
end;
function common.deathSave(node, modo, args, chat)
	-- Checa argumentos
	if not node then return; end;
	node.testesContraMorte = node.testesContraMorte or {};

	if args == nil then
		args = {};

		if modo == 'vantagem' or modo == 'desvantagem' then args.rolls = 2;
		else args.rolls = 1;
		end;

		args.text = 'Teste contra morte';
		if node.nome then args.text = args.text .. ' de ' .. node.nome; end;

		if modo == 'vantagem' then
			args.foo = math.max;
			args.text = args.text .. ' - Vantagem';
		elseif modo == 'desvantagem' then
			args.foo = math.min;
			args.text = args.text .. ' - Desvantagem';
		end;

		args.rolagem = args.rolls .. 'd20';
		if common.fichaTemPropriedade(node, 'saveBonus') then args.rolagem = args.rolagem .. common.fichaGetPropriedadeVal(node, 'saveBonus'); end;
	end;

	if not chat then chat = common.getMesa(node).chat; end;

	-- Checa se pode rolar
	if not common.podeRolar(node) then
		showMessage('Você não pode rolar dados por essa personagem.');
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
			chat:enviarAcao("acordou.");
			reset();
		elseif s >= 3 then
			chat:enviarAcao("estabilizou.");
			chat:rolarDados("1d4", "Hora(s) inconsciente");
			reset();
		elseif f >= 3 then
			chat:enviarAcao("morreu com 3 falhas em teste de resistência contra morte.");
			reset();
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
	text = text or 'Deseja realmente apagar este item?';
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

	if common.ficha_propriedades[prop] == nil then showMessage('Propriedade \'' .. prop .. '\' inválida.'); return nil; end;
	if common.ficha_propriedades[prop].implementado == false then showMessage('Acessando propriedade \'' .. prop .. '\' não implementada.'); end;

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

function common.keyDown(node, event)
	if not node then
		showMessage('node = nil');
		return;
	end;
	node = common.getTopNode(node);
	node.keys = node.keys or {};

	node.keys[event.keyCode] = true;

	-- if not node.keys[event.keyCode] then
	-- 	common.getMesa(node).chat:enviarMensagem('keyDown ' .. event.keyCode);
	-- 	node.keys[event.keyCode] = true;
	-- end;
end;
function common.keyUp(node, event)
	if not node then
		showMessage('node = nil');
		return;
	end;
	node = common.getTopNode(node);
	node.keys = node.keys or {};

	node.keys[event.keyCode] = nil;

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

	local chat = common.getMesa(node);
	if useActiveChat then chat = chat.activeChat;
	else chat = chat.chat;
	end;

	if     node.keys[hk.vantagem]    then	foo(node, 'vantagem',    args, chat);
	elseif node.keys[hk.desvantagem] then	foo(node, 'desvantagem', args, chat);
	else									foo(node, 'normal',      args, chat);
	end;
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
