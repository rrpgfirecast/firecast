require("internet.lua");
require("dialogs.lua");
require("json.lua");
require("rrpgUtil.lua");
require('ndb.lua');

local downloads = NDB.load("5etools-data.xml");
local transl = {
	action		= { 'Ação',			'Ações'},
	bonus		= { 'Ação Bônus',	'Ações Bônus'},
	reaction	= { 'Reação',		'Reações'},
	turn		= { 'Turno',		'Turnos'},
	round		= { 'Rodada',		'Rodadas'},
	minute		= { 'Minuto',		'Minutos'},
	hour		= { 'Hora',			'Horas'},
	day			= { 'Dia',			'Dias'},
	week		= { 'Semana',		'Semanas'},
	year		= { 'Ano',			'Anos'},
	special		= 'Especial',
	point		= 'Ponto',
	line		= 'Linha',
	cube		= 'Cubo',
	cone		= 'Cone',
	radius		= 'Raio',
	sphere		= 'Esfera',
	hemisphere	= 'Hemisfério',
	cylinder	= 'Cilindro',
	self		= 'Pessoal',
	touch		= 'Toque',
	unlimited	= 'Ilimitado',
	plane		= 'Plano',
	sight		= 'Visual',
	strength	= 'forca',
	dexterity	= 'destreza',
	consitution	= 'constituicao',
	intelligence ='inteligencia',
	wisdom		= 'sabedoria',
	charisma	= 'carisma'
};
local schoolsOfMagic = {
	A = 'Abjuração',
	V = 'Evocação',
	E = 'Encantamento',
	I = 'Ilusão',
	D = 'Adivinhação',
	N = 'Necromância',
	T = 'Transmutação',
	C = 'Conjuração',
	P = 'Psiônica'
}


dload = {};

local function filtra_magia(spell, nivel, classe, nome)
	if nivel and nivel ~= '' and nivel ~= 'Todos' and nivel ~= 'Qualquer' then
		local filtroNivel = tonumber(spell.level) == tonumber(nivel);
		if not filtroNivel then return false; end;
	end;
	if classe and classe ~= '' and classe ~= 'Todas' and classe ~= 'Qualquer' then
		local filtroClasse = false;
		for _,class in ipairs(spell.classes.fromClassList        or {}) do if class.name == classe then filtroClasse = true; break; end; end;
		for _,class in ipairs(spell.classes.fromClassListVariant or {}) do if class.name == classe then filtroClasse = true; break; end; end;
		if not filtroClasse then return false; end;
	end;
	if nome and nome ~= '' and nome ~= 'Todas' and nome ~= 'Qualquer' then
		local filtroNome = spell.name == nome;
		if not filtroNome then return false; end;
	end;
	return true;
end;
local function concatEntry(entry, level)
	if not level then level = ''; end;

	if not entry then return level;
	elseif type(entry) == 'string'	then return level..entry;
	elseif entry.type  == 'list'	then
		if entry.name then return level..entry.name .. '\n' .. concatEntry(entry.items, level..'\t'); end;
		return concatEntry(entry.items, level);
	elseif entry.type  == 'entries'	then
		if entry.name then return level..entry.name .. '\n' .. concatEntry(entry.entries, level..'\t'); end;
		return concatEntry(entry.entries, level);
	elseif entry.type  == 'table'	then
		local text = level .. entry.caption;
		text = text .. '\n\t' .. level .. table.concat(entry.colLabels, '\t|\t');
		for _,row in ipairs(entry.rows) do
			for i=1,#row do row[i] = concatEntry(row[i]); end;
			text = text .. '\n\t' .. level .. table.concat(row, '\t|\t');
		end;
		return text;
	elseif entry.type  == 'cell'	then
		if not entry.roll then return level; end;
		if entry.roll.exact ~= nil then return level..entry.roll.exact; end;
		return level..(entry.roll.min or '?')..'-'..(entry.roll.max or '?');
	else
		for i=1,#entry do entry[i] = concatEntry(entry[i], level); end;
		return table.concat(entry, '\n');
	end;
end;
local function feetToMeters(feets)
	local meters = 1.5 * ((tonumber(feets) or 0) // 5);
	if math.floor(2 * meters) == 2 * math.floor(meters) then
		meters = math.floor(meters);
	end;
	return meters;
end;
local function translDistance(distance)
	if not distance then return; end;
	if distance.type == 'feet' then
		return {
			type = 'Metros',
			amount = feetToMeters(distance.amount)
		};
	end;
	return {
		type = transl[distance.type] or distance.type,
		amount = distance.amount
	};
end;
local function resetaMagia(magia)
	magia.nome = "NOME";
	magia.descricao = "";
	magia.nivel = "0";
	magia.escolaDeMagia = "";
	magia.componentesV = false;
	magia.componentesS = false;
	magia.componentesM = false;
	magia.componentesConcentracao = false;
	magia.componentesRitual = false;
	magia.componentesMaterial = "";
	magia.componentesMConsumido = false;
	magia.tempoConjuracaoValor = "";
	magia.tempoConjuracaoUnidade = "";
	magia.condicaoAtivacao = "";
	magia.alvoValor = "";
	magia.alvoUnidade = "";
	magia.alvoTipo = "";
	magia.alcanceCurto = "";
	magia.alcanceLongo = "";
	magia.alcanceUnidade = "";
	magia.duracaoValor = "";
	magia.duracaoUnidade = "";
	magia.contadorUsos = "";
	magia.contadorUsosTotal = "-";
	magia.contadorNome = "";
	magia.ataqueTipo = "Sem Ataque";
	magia.cdResistenciaAtributo = "";
end;


function dload.data(node, path, callback, baseUrl)
	baseUrl = baseUrl or 'https://raw.githubusercontent.com/TheGiddyLimit/TheGiddyLimit.github.io/master/data/';
	local url = baseUrl .. path;

	path = path:gsub("%.","|");

	if(downloads == nil) then downloads = {}; end;
	if(downloads[path] ~= nil) then
		if callback ~= nil then callback(node, downloads[path]); end;
	else
		Internet.download(url,
			function(stream, dataType)
				local raw_data = {};
				stream:read(raw_data, stream.size);
				downloads[path] = Utils.binaryDecode(raw_data, "utf8");

				if callback ~= nil then callback(node, downloads[path]); end;
			end
		);
	end;
end;

function dload.new_spell(form, baseName)
	local target = form["rcl" .. baseName]:append();
	target.nivel = tonumber(baseName:sub(19)) - 1;
	return target;
end;
function dload.imp_spell(form, baseName)
	local node = common.getTopNode(form.sheet);
	local nivel = tonumber(baseName:sub(19)) - 1;
	dload.data(node, "spells/index.json", function(_, sourcesData)
		sourcesData = json.parse(sourcesData);

		local sourceNames = {};
		for name,path in pairs(sourcesData) do table.insert(sourceNames, name); end;

		table.sort(sourceNames);

		local sourcePaths = {};
		for _,path in ipairs(sourceNames) do table.insert(sourcePaths, sourcesData[path]); end;

		local default = nil;
		for i=1,#sourceNames do if sourceNames[i] == 'PHB' then default = i; end; end;

		Dialogs.choose("Qual a fonte da magia?", sourceNames, function(selectedSo, selectedIndexSo, selectedTextSo)
			if not selectedSo then return; end;
			local source = sourcePaths[selectedIndexSo];

			dload.data(node, "spells/" .. source, function(_, spellsData)
				spellsData = json.parse(spellsData);
				if spellsData.spell == nil then showMessage('Nenhuma magia encontrada nessa fonte.'); return; end;

				local class_names, classes = {}, {};
				for _,spell in ipairs(spellsData.spell) do
					if filtra_magia(spell, nivel) then
						for _,class in ipairs(spell.classes.fromClassList or {}) do
							if not classes[class.name] then
								classes[class.name] = true;
								table.insert(class_names, class.name);
							end;
						end;
						for _,class in ipairs(spell.classes.fromClassListVariant or {}) do
							if not classes[class.name] then
								classes[class.name] = true;
								table.insert(class_names, class.name);
							end;
						end;
					end;
				end;
				table.sort(class_names); table.insert(class_names, 1, 'Todas');
				if #class_names == 1 then showMessage('Nenhuma magia desse nível encontrada nessa fonte.'); return; end;

				default = nil;
				if classes[node.magias and node.magias.classeConjuradora or ''] then for i=1,#class_names do if class_names[i] == node.magias.classeConjuradora then default = i; break; end; end; end;

				Dialogs.choose("Qual classe?", class_names, function(selectedCl, selectedIndexCl, selectedTextCl)
					if not selectedCl then return; end;
					local classe = selectedTextCl;

					local spell_names = {};
					for _,spell in ipairs(spellsData.spell) do if filtra_magia(spell, nivel, classe) then table.insert(spell_names, spell.name); end; end;
					table.sort(spell_names); table.insert(spell_names, 1, 'Todas');
					if #spell_names == 1 then showMessage('Nenhuma magia desse nível e classe encontrada nessa fonte.'); return; end;

					Dialogs.choose("Qual magia?", spell_names, function(selectedSp, selectedIndexSp, selectedTextSp)
						if not selectedSp then return; end;

						for _,spell in ipairs(spellsData.spell) do if filtra_magia(spell, nivel, classe, selectedTextSp) then
							local target = dload.new_spell(form, baseName);
							-- Nome
							target.nome = spell.name;
							if spell.duration[1].concentration then target.nome = target.nome .. ' (C)'; end;
							if spell.meta and spell.meta.ritual then target.nome = target.nome .. ' (R)'; end;
							-- Tempo de formulação
							target.tempoDeFormulacao = (spell.time[1].number or '?') .. ' ' .. (transl[spell.time[1].unit][(spell.time[1].number > 1) and 2 or 1] or '?');
							if spell.time[1].condition then target.tempoDeFormulacao = target.tempoDeFormulacao .. ', ' .. spell.time[1].condition; end;
							-- Alcance
							if spell.range.distance and spell.range.distance.type == 'feet' then spell.range.distance.amount = math.floor(1.5 * (spell.range.distance.amount // 5)); end;
							if spell.range.type == 'point' then
								if     spell.range.distance.type == 'feet'	then target.alcance = spell.range.distance.amount .. ' metros';
								elseif spell.range.distance.type == 'miles'	then target.alcance = spell.range.distance.amount .. ' milhas';
								else target.alcance = transl[spell.range.distance.type];
								end;
							elseif spell.range.type == 'special' then target.alcance = 'Especial';
							else target.alcance = 'Pessoal (' .. transl[spell.range.type] .. ' de ' .. spell.range.distance.amount .. ((spell.range.distance.type == 'feet') and ' metros)' or ' milhas)');
							end;
							-- Componentes
							if spell.components.v then target.componentes = 'V'; end;
							if spell.components.s then target.componentes = (target.componentes and (target.componentes .. ', ') or '') .. 'S'; end;
							if spell.components.m then target.componentes = (target.componentes and (target.componentes .. ', ') or '') .. 'M (' .. (spell.components.m.text or spell.components.m) .. ')'; end;
							-- Duração
							if     spell.duration[1].type == 'instant'		then target.duracao = 'Instantânea';
							elseif spell.duration[1].type == 'permanent'	then
								if     spell.ends == 'dispel'  then target.duracao = 'Até ser dissipada';
								elseif spell.ends == 'trigger' then target.duracao = 'Até ser ativada';
								elseif spell.ends == 'discharge' then target.duracao = 'Até ser descarregada';
								else target.duracao = 'Permanente';
								end;
							elseif spell.duration[1].type == 'special'		then target.duracao = 'Especial';
							elseif spell.duration[1].type == 'timed'		then
								if spell.duration[1].concentration then
									target.duracao = 'Conc. até ' .. spell.duration[1].duration.amount;
								else target.duracao = spell.duration[1].duration.amount;
								end;
								target.duracao = target.duracao .. ' ' .. (transl[spell.duration[1].duration.type][(spell.duration[1].duration.amount > 1) and 2 or 1] or '?');
							end;
							if #spell.duration > 1 then showMessage('Magia ' .. target.nome .. ' tem #spell.duration > 1'); end;
							-- Descrição
							target.descricao = concatEntry(spell.entries) .. '\n' .. concatEntry(spell.entriesHigherLevel);
							-- Outros
							target.savingThrow = spell.savingThrow;
							target.scalingLevelDice = spell.scalingLevelDice;
							target.spellAttack = spell.spellAttack;
							target.concentration = spell.concentration;
							target.ritual = spell.meta and spell.meta.ritual or nil;
							target.school = spell.school;
						end; end;
					end);
				end, default);
			end);
		end, default);
	end);
end;


function dload.getSourceNames(form, _type, callback)
	local node = common.getTopNode(form.sheet);

	dload.data(node, _type.."/index.json", function(_, sourcesData)
		sourcesData = json.parse(sourcesData);

		local sourceNames = {};
		for name,path in pairs(sourcesData) do table.insert(sourceNames, name); end;

		table.sort(sourceNames);

		if callback then callback(sourceNames); end;
	end);
end;
function dload.getSourcePath(form, _type, name, callback)
	local node = common.getTopNode(form.sheet);

	dload.data(node, _type.."/index.json", function(_, sourcesData)
		sourcesData = json.parse(sourcesData);

		if callback then callback(sourcesData[name]); end;
	end);
end;

function dload.spellGetClasses(form, source, level, callback)
	local node = common.getTopNode(form.sheet);

	source = source or "spells-phb.json";
	dload.data(node, "spells/"..source, function(_, spellsData)
		spellsData = json.parse(spellsData);

		if not spellsData.spell then
			if callback then callback({'Qualquer'}); end;
			return;
		end;

		local class_names, classes = {}, {};
		for _,spell in ipairs(spellsData.spell) do
			if filtra_magia(spell, level) then
				for _,class in ipairs(spell.classes.fromClassList or {}) do
					if not classes[class.name] then
						classes[class.name] = true;
						table.insert(class_names, class.name);
					end;
				end;
				for _,class in ipairs(spell.classes.fromClassListVariant or {}) do
					if not classes[class.name] then
						classes[class.name] = true;
						table.insert(class_names, class.name);
					end;
				end;
			end;
		end;
		table.sort(class_names); table.insert(class_names, 1, 'Qualquer');

		if callback then callback(class_names); end;
	end);
end;
function dload.spellGetNames(form, source, level, class, callback)
	local node = common.getTopNode(form.sheet);

	source = source or "spells-phb.json";
	level = level or "Qualquer";
	class = class or "Qualquer";

	dload.data(node, "spells/"..source, function(_, spellsData)
		spellsData = json.parse(spellsData);

		if not spellsData.spell then if callback then callback({''}); end; return; end;

		local spell_names = {''};
		for _,spell in ipairs(spellsData.spell) do
			if filtra_magia(spell, level, class) then
				table.insert(spell_names, spell.name);
			end;
		end;
		table.sort(spell_names);

		if callback then callback(spell_names); end;
	end);
end;
function dload.spellImport(form, source, name, magia)
	local node = common.getTopNode(form.sheet);
	magia = magia or form.sheet;

	resetaMagia(magia);

	source = source or "spells-phb.json";

	dload.data(node, "spells/foundry.json", function(_, foundryData) dload.data(node, "spells/"..source, function(_, spellsData)
		foundryData = json.parse(foundryData);
		spellsData = json.parse(spellsData);

		local spell5et;
		local spellFoundry;

		for _,spell in ipairs(spellsData.spell) do if spell.name == name then spell5et = spell; end; end;
		for _,spell in ipairs(foundryData.spell) do if spell.name == name then spellFoundry = spell; end; end;

		-- Descrição
			-- magia.icone = ??
			magia.nome = spell5et.name;
			magia.descricao = concatEntry(spell5et.entries) .. '\n' .. concatEntry(spell5et.entriesHigherLevel);
		-- Detalhes
			-- Detalhes da Magia
				magia.nivel = spell5et.level;
				magia.escolaDeMagia = schoolsOfMagic[spell5et.school] or spell5et.school;

				if spell5et.components then
					magia.componentesV = spell5et.components.v;
					magia.componentesS = spell5et.components.s;
					magia.componentesM = spell5et.components.m;
					if spell5et.components.m then magia.componentesMaterial = spell5et.components.m.text or spell5et.components.m; end;
				end;
				magia.componentesConcentracao = spell5et.duration and spell5et.duration[1] and spell5et.duration[1].concentration;
				magia.componentesRitual = spell5et.meta and spell5et.meta.ritual;
			-- Detalhes de Conjuração
				if spell5et.time and spell5et.time[1] then
					local time = spell5et.time[1];
					magia.tempoConjuracaoValor = time.number;
					magia.tempoConjuracaoUnidade = transl[time.unit][1];
					magia.condicaoAtivacao = time.condition;
				end;
				if spell5et.range then
					if spell5et.range.type == 'point' then
						local range = translDistance(spell5et.range.distance);
						magia.alcanceCurto = range.amount;
						magia.alcanceUnidade = range.type;
					elseif spell5et.range.type == 'special' then
						magia.alcanceUnidade = 'Especial';
					else
						magia.alcanceUnidade = 'Pessoal';

						local range = translDistance(spell5et.range.distance);
						magia.alvoValor = range.amount;
						magia.alvoUnidade = range.type;
						magia.alvoTipo = transl[spell5et.range.type] or spell5et.range.type;
					end;
				end;
				if spellFoundry then
					local range = translDistance({
						type = spellFoundry.units,
						amount = spellFoundry.value
					});
					magia.alvoValor = range.amount;
					magia.alvoUnidade = range.type;
					magia.alvoTipo = transl[spellFoundry.type] or spellFoundry.type;
				end;
				if spell5et.duration and spell5et.duration[1] then
					local duracao = spell5et.duration[1];

					if     duracao.type == 'instant'	then magia.duracaoUnidade = 'Instantânea';
					elseif duracao.type == 'permanent'	then magia.duracaoUnidade = 'Permanente';
					elseif duracao.type == 'special'	then magia.duracaoUnidade = 'Especial';
					else
						if duracao.duration then
							magia.duracaoValor = duracao.duration.amount;
							magia.duracaoUnidade = transl[duracao.duration.type][(duracao.duration.amount > 1) and 2 or 1] or duracao.duration.type;
						end;
					end;
				end;
			-- Efeitos da Magia
				if spell5et.spellAttack and spell5et.spellAttack[1] then
					if spell5et.spellAttack[1] == 'M' then magia.ataqueTipo = 'Ataque de Magia Corpo-a-Corpo';
					elseif spell5et.spellAttack[1] == 'R' then magia.ataqueTipo = 'Ataque de Magia a Distância';
					end;
				end;
				if spell5et.savingThrow and spell5et.savingThrow[1] then
					magia.cdResistenciaAtributo = transl[spell5et.savingThrow[1]] or spell5et.savingThrow[1];
				end;
	end); end);
end;

local function filtra_monster(monster, tipo, tamanho, nome)
	if tipo and tipo ~= 'Qualquer' then
		local filtroTipo = not monster.type or monster.type == tipo or monster.type.type == tipo;
		if not filtroTipo then return false; end;
	end;
	if tamanho and tamanho ~= 'Qualquer' then
		local filtroTamanho = monster.size == tamanho;
		if not filtroTamanho then return false; end;
	end;
	if nome then
		local filtroNome = monster.name == nome;
		if not filtroNome then return false; end;
	end;
	return true;
end;
function dload.polymorph(form, reversable, text)
	local node = common.getTopNode(form.sheet);
	dload.data(node, "bestiary/index.json", function(_, sourcesData)
		sourcesData = json.parse(sourcesData);

		local sourceNames = {};
		for name,path in pairs(sourcesData) do table.insert(sourceNames, name); end;

		table.sort(sourceNames);

		local sourcePaths = {};
		for _,path in ipairs(sourceNames) do table.insert(sourcePaths, sourcesData[path]); end;

		local default = nil;
		for i=1,#sourceNames do if sourceNames[i] == 'MM' then default = i; end; end;

		Dialogs.choose("Qual a fonte do monstro?", sourceNames, function(selectedSo, selectedIndexSo, selectedTextSo)
			if not selectedSo then return; end;
			local source = sourcePaths[selectedIndexSo];

			dload.data(node, "bestiary/" .. source, function(_, bestiaryData)
				bestiaryData = json.parse(bestiaryData);
				if bestiaryData.monster == nil then showMessage('Nenhuma criatura encontrada nessa fonte.'); return; end;

				local type_names, types = {}, {};
				for _,monster in ipairs(bestiaryData.monster) do
					local tipo = monster.type and (monster.type.type or monster.type);
					if tipo and not types[tipo] then
						types[tipo] = true;
						table.insert(type_names, tipo);
					end;
				end;
				table.sort(type_names); table.insert(type_names, 1, 'Qualquer');

				default = nil;
				if types.beast then for i=1,#type_names do if type_names[i] == 'beast' then default = i; break; end; end; end;

				Dialogs.choose("Qual tipo?", type_names, function(selectedTi, selectedIndexTi, selectedTextTi)
					if not selectedTi then return; end;
					local tipo = selectedTextTi;

					Dialogs.choose("Qual tamanho?", {'Qualquer', 'Miúdo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso'}, function(selectedSz, selectedIndexSz, selectedTextSz)
						if not selectedSz then return; end;

						local tamanhos = {'Qualquer', 'T', 'S', 'M', 'L', 'H', 'G'};
						local tamanho = tamanhos[selectedIndexSz];

						local monster_names = {};
						for _,monster in ipairs(bestiaryData.monster) do if filtra_monster(monster, tipo, tamanho) then table.insert(monster_names, monster.name); end; end;
						table.sort(monster_names);

						Dialogs.choose("Qual monstro?", monster_names, function(selectedMo, selectedIndexMo, selectedTextMo)
							if not selectedMo then return; end;
							for _,monster in ipairs(bestiaryData.monster) do if filtra_monster(monster, tipo, tamanho, selectedTextMo) then
								local function transform()
									if node.polymorph.old then
										showMessage('Já está transformado, não pode sobre-escrever');
									else
										node.polymorph.old = {};
										node.nome = node.nome or '';
										local changes = {
											nome = node.nome .. ' → ' .. monster.name,
											atributos = {},
											DadosDeVidaTotal = monster.hp.formula,
										};
										-- Atributos
										for eng,ptbr in pairs({
											str='forca',
											dex='destreza',
											con='constituicao',
											int='inteligencia',
											wis='sabedoria',
											cha='carisma',
										}) do if node.polymorph.config.atributos[eng] then changes.atributos[ptbr] = monster[eng]; end; end;
										-- CA
										if type(monster.ac[1]) == 'number' then changes.CA = monster.ac[1];
										else changes.CA = monster.ac[1].ac;
										end;
										if node.polymorph.config.token then
											node.polymorph.oldToken = '';
										end;
										-- Pontos de Vida
										if node.polymorph.config.pv == 'Rolar' then
											common.getMesa(node).activeChat:rolarDados(monster.hp.formula, 'Vida de ' .. monster.name, function(rolado)
												changes.PV    = rolado.resultado;
												changes.PVmax = rolado.resultado;
												common.deepCopy(changes, node, node.polymorph.old);
											end);
										else
											if node.polymorph.config.pv == 'Média' then
												changes.PV    = monster.hp.average;
												changes.PVmax = monster.hp.average;
											elseif node.polymorph.config.pv == 'Animus' then
												if monster.cr ~= '0' then
													node.PVtemporario = math.max(tonumber(node.PVtemporario), 5*(tonumber(monster.cr) or 1) + node.atributos.modinteligencia);
												end;
											end;
											common.deepCopy(changes, node, node.polymorph.old);
										end;
									end;
								end;
								if not reversable then
									Dialogs.confirmYesNo('Você tem certeza que deseja ' .. (text or 'se transformar') .. ' em um ' .. monster.name, function(confirmado) if confirmado then
										transform();
									end; end);
								else transform();
								end;
							end; end;
						end, 1);
					end, 1);
				end, default);
			end);
		end, default);
	end);
end;
function dload.unpolymorph(form)
	local node = common.getTopNode(form.sheet);
	if not node.polymorph.old then showMessage('Não está transformado');
	else
		common.deepCopy(node.polymorph.old, node, nil);
		node.polymorph.old = nil;
	end;
end;
