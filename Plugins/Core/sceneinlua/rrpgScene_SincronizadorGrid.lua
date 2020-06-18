require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("rrpgScene_UserDrawingDetails.lua");

--[[   PLUGIN para fazer user drawings ]]--	

local SETTINGS_CATEGORY = "settings";
local QT_AMOSTRAS = 4;
local PRECISAO = 1.0 / 200.0;
local PRECISAO_CELULA = 1 / 10.0;
local GERACOES_ALGORITMO_GENETICO = 30;
local TAMANHO_MAXIMO_POPULACAO = 100;

local function calcularDimensaoAlgoritmoGenetico(amostras, campo1, campo2)
	local delimitadores = {};	
	local individuos = {};
	local populacaoAtual = {};

	local function testarIndividuo(valor)
		local h = individuos[valor];
		
		if h ~= nil then
			return h;
		end;
		
		h = {};
		h.valor = valor;			
		
		local pontos = 0.0;
		
		if valor > 0 then
			for i = 1, #delimitadores, 1 do
				for j = i + 1, #delimitadores, 1 do
					local distancia = math.abs(delimitadores[j] - delimitadores[i]);
					
					if distancia > PRECISAO then
						local qtCelulas = distancia / valor; 									
						local qtCelulasInteiroMaisPerto = math.floor(qtCelulas + 0.5);										
						local difParaNumeroInteiroMaixProximo = math.abs(qtCelulasInteiroMaisPerto - qtCelulas);
						
						assert(difParaNumeroInteiroMaixProximo >= 0.0);
						assert(difParaNumeroInteiroMaixProximo <= 1.0);
						
						local fator = (1 - difParaNumeroInteiroMaixProximo);
						pontos = pontos + fator * fator;
					end;
				end;
			end;
		end;		
												
		h.pontos = pontos;
		individuos[valor] = h;
		return h;						
	end;	
	
	local function ordenarPopulacaoAtual()
		table.sort(populacaoAtual,
			function (a, b)
				return a.pontos > b.pontos;
			end)
	end;
	
	local function prepararParaExecucao()		
		for i = 1, #amostras, 1 do	
			delimitadores[#delimitadores + 1] = amostras[i][campo1];
			delimitadores[#delimitadores + 1] = amostras[i][campo2];			
		end;
	end;

	local function inicializarPopulacaoInicial()
		for i = 1, #amostras, 1 do			
			populacaoAtual[#populacaoAtual + 1] = testarIndividuo(math.abs(amostras[i][campo2] - amostras[i][campo1]));			
		end;	
	end;		

	local function gerarNovaPopulacao()
		local novaPopulacao = {};
		
		for i = 1, #populacaoAtual, 1 do
			for j = 1 + 1, #populacaoAtual, 1 do
				local resultadoDoCruzamento = (populacaoAtual[i].valor + populacaoAtual[j].valor) / 2; 

				if math.random(1, 100) <= 50 then
					-- Mutação genética
					local valorMutante = math.abs(resultadoDoCruzamento * (math.random(1, 100) / 100.0));
					
					if math.random(1, 2) == 1 then
						resultadoDoCruzamento = resultadoDoCruzamento + valorMutante;
					else
						resultadoDoCruzamento = resultadoDoCruzamento - valorMutante;
					end;
				end;
				
				if resultadoDoCruzamento >= PRECISAO then
					novaPopulacao[#novaPopulacao + 1] = testarIndividuo(resultadoDoCruzamento);
				end;				
	
				if #novaPopulacao > TAMANHO_MAXIMO_POPULACAO then
					break;
				end;				
			end;
			
			if #novaPopulacao > TAMANHO_MAXIMO_POPULACAO then
				break;
			end;			
		end;
		
		-- Aceitar os melhores individuos da última geração
		
		for i = 1, math.min(#populacaoAtual, 3) do
			novaPopulacao[#novaPopulacao + 1] = populacaoAtual[i] ;
		end;
		
		return novaPopulacao;
	end;
										
	prepararParaExecucao();

	inicializarPopulacaoInicial();
	ordenarPopulacaoAtual();
	
	local geracaoAtual = 0;
	
	while geracaoAtual < GERACOES_ALGORITMO_GENETICO do
		geracaoAtual = geracaoAtual + 1;
		
		local novaPopulacao = gerarNovaPopulacao();
		populacaoAtual = novaPopulacao;
		
		ordenarPopulacaoAtual();
	end;

	assert(#populacaoAtual > 0);
	return populacaoAtual[1].valor;	
end;

local function calcularOffsetAlgoritmoGenetico(amostras, campo1, campo2, oldWorldSize, newWorldSize,
				                               cellCount)
	local delimitadores = {};	
	local individuos = {};
	local populacaoAtual = {};
	local scale = newWorldSize / oldWorldSize;
	local newCellSize = newWorldSize / cellCount;

	local function testarIndividuo(valor)
		local h = individuos[valor];
		
		if h ~= nil then
			return h;
		end;
		
		h = {};
		h.valor = valor;			
		
		local pontos = 0.0;
		
		for i = 1, #delimitadores, 1 do
			local distancia = math.abs(delimitadores[i] - valor);
			
			local qtCelulas = distancia / newCellSize; 									
			local qtCelulasInteiroMaisPerto = math.floor(qtCelulas + 0.5);										
			local difParaNumeroInteiroMaixProximo = math.abs(qtCelulasInteiroMaisPerto - qtCelulas);
			
			assert(difParaNumeroInteiroMaixProximo >= 0.0);
			assert(difParaNumeroInteiroMaixProximo <= 1.0);
			
			local fator = (1 - difParaNumeroInteiroMaixProximo);
			pontos = pontos + fator * fator;
		end;				
												
		h.pontos = pontos;
		individuos[valor] = h;
		return h;						
	end;	
	
	local function ordenarPopulacaoAtual()
		table.sort(populacaoAtual,
			function (a, b)
				return a.pontos > b.pontos;
			end)
	end;
	
	local function prepararParaExecucao()		
		for i = 1, #amostras, 1 do	
			delimitadores[#delimitadores + 1] = amostras[i][campo1] * scale;
			delimitadores[#delimitadores + 1] = amostras[i][campo2] * scale;			
		end;
	end;

	local function inicializarPopulacaoInicial()	
		local MAX_LOOP = 100;	
		populacaoAtual[#populacaoAtual + 1] = testarIndividuo(0);
	
		for i = 1, MAX_LOOP, 1 do
			local factor = (i * 1.0) / (MAX_LOOP + 1.0);
			populacaoAtual[#populacaoAtual + 1] = testarIndividuo(factor * newCellSize);
			populacaoAtual[#populacaoAtual + 1] = testarIndividuo(-factor * newCellSize);			
		end;	
	end;		

	local function gerarNovaPopulacao()
		local novaPopulacao = {};
		
		for i = 1, #populacaoAtual, 1 do
			for j = 1 + 1, #populacaoAtual, 1 do
				local resultadoDoCruzamento = (populacaoAtual[i].valor + populacaoAtual[j].valor) / 2; 

				if math.random(1, 100) <= 50 then
					-- Mutação genética
					local valorMutante = math.abs(resultadoDoCruzamento * (math.random(1, 100) / 100.0));
					
					if math.random(1, 2) == 1 then
						resultadoDoCruzamento = resultadoDoCruzamento + valorMutante;
					else
						resultadoDoCruzamento = resultadoDoCruzamento - valorMutante;
					end;
				end;
				
				if resultadoDoCruzamento >= PRECISAO then
					novaPopulacao[#novaPopulacao + 1] = testarIndividuo(resultadoDoCruzamento);
				end;				
	
				if #novaPopulacao > TAMANHO_MAXIMO_POPULACAO then
					break;
				end;				
			end;
			
			if #novaPopulacao > TAMANHO_MAXIMO_POPULACAO then
				break;
			end;			
		end;
		
		-- Aceitar os melhores individuos da última geração
		
		for i = 1, math.min(#populacaoAtual, 3) do
			novaPopulacao[#novaPopulacao + 1] = populacaoAtual[i] ;
		end;
		
		return novaPopulacao;
	end;
										
	prepararParaExecucao();

	inicializarPopulacaoInicial();
	ordenarPopulacaoAtual();
	
	local geracaoAtual = 0;
	
	while geracaoAtual < GERACOES_ALGORITMO_GENETICO do
		geracaoAtual = geracaoAtual + 1;
		
		local novaPopulacao = gerarNovaPopulacao();
		populacaoAtual = novaPopulacao;
		
		ordenarPopulacaoAtual();
	end;

	assert(#populacaoAtual > 0);
	return populacaoAtual[1].valor;											   
end;											   

	
SceneLib.registerPlugin(
	function (scene, attachment)	
		require("rrpgScene_ShapesMaker.dlua");			
	
		scene.viewport:setupToolCategory(SETTINGS_CATEGORY, lang("scene.toolcategory.settings"), -2);
		
		local installed = false;
		local btn_viewAsPlayer;	
		local possuiaGridAntes = nil;
		local shapeMaker = nil;
		local realCellWidth = nil
		local realCellHeight = nil;			
		local amostras = {}; 
		local frmInstrucao = nil;
				
		local processarAmostras = nil;
				
		local function updateGridSizes()
			realCellWidth = scene.grid.cellSize;
			realCellHeight = scene.grid.cellSize;
		end;
		
		updateGridSizes();		
		
		local function pararDesenhoGrid()		
			amostras[#amostras + 1] = shapeMaker:getWorldBounds();
			
			if #amostras >= QT_AMOSTRAS then
				processarAmostras();				
			end;			
		end;		
		
		processarAmostras = function()
			assert(amostras ~= nil);
			assert(#amostras > 0);
			
			updateGridSizes();
				
			local larguraCelula = calcularDimensaoAlgoritmoGenetico(amostras, "left", "right");
			local alturaCelula = calcularDimensaoAlgoritmoGenetico(amostras, "top", "bottom");			
												
			local novaQtCelulasX = math.floor((scene.worldWidth / larguraCelula) / PRECISAO_CELULA + 0.5) * PRECISAO_CELULA
			local novaQtCelulasY = math.floor((scene.worldHeight / alturaCelula) / PRECISAO_CELULA + 0.5) * PRECISAO_CELULA
			
			novaQtCelulasX = math.max(math.min(novaQtCelulasX, 500), PRECISAO_CELULA);
			novaQtCelulasY = math.max(math.min(novaQtCelulasY, 500), PRECISAO_CELULA);			
			
			local novaLarguraGrid = novaQtCelulasX * realCellWidth;
			local novaAlturaGrid = novaQtCelulasY * realCellHeight;
						
			local novoOffsetX = calcularOffsetAlgoritmoGenetico(amostras, "left", "right", 
															    scene.worldWidth, novaLarguraGrid, 
															    novaQtCelulasX);
															
			local novoOffsetY = calcularOffsetAlgoritmoGenetico(amostras, "top", "bottom", 
						   									    scene.worldHeight, novaAlturaGrid, 
															     novaQtCelulasY);															
			
						
			SC3UNDO_Capture(scene, 
				function()						
					scene.worldWidth = novaLarguraGrid;
					scene.worldHeight = novaAlturaGrid;	
					scene.grid.offsetX = novoOffsetX;
					scene.grid.offsetY = novoOffsetY;
					scene.grid.drawGrid = true;
				end);
							
			possuiaGridAntes = true;
			amostras = {};
		end;
		
		
		
		local function createShapeMaker()
			assert(shapeMaker == nil);
						
			shapeMaker = SHAPEMaker_New(scene, SHAPE_RECTANGLE);
			shapeMaker.autoDraw = true;			
			shapeMaker.onStop = pararDesenhoGrid;
			shapeMaker.fillColor = "#FF000030";
			shapeMaker.strokeColor = "null"
			--shapeMaker.strokeColor = "#FF000040";
			shapeMaker.snapToGrid = false;
			shapeMaker.strokeSize = 0.05 * scene.grid.cellSize; 
			shapeMaker:start();			
		end;
				
			local function installTools()			
				btn_viewAsPlayer = scene.viewport:addToolButton(SETTINGS_CATEGORY, 
											 lang("scene.Synchronize.menu"), 
											 "/icos/Synchronize.png",
											 10,
											 {selectable=true, defaultOfCategory=false},			
					function()
						possuiaGridAntes = scene.grid.drawGrid;
						scene.grid.drawGrid = false;
						
						if frmInstrucao == nil then
							frmInstrucao = GUI.newForm("frmSynchronizeGrid");
						end;
						
						scene.viewport:showForm(frmInstrucao, {placement="topLeft"});
						createShapeMaker();
						amostras = {}				
					end, 
					
					function()
						--[[ Em construção ]]-- 
						scene.grid.drawGrid = possuiaGridAntes;				
						
						amostras = {}

						if frmInstrucao ~= nil then
							scene.viewport:closeForm(frmInstrucao);
						end;
						
						if shapeMaker ~= nil then
							shapeMaker:abort();
							shapeMaker = nil;
						end;	
					end,

										function()
											scene.isViewingAsGM = not scene.isViewingAsGM;
										end);						

		end;

	local function uninstallTools()
			scene.viewport:removeToolButton(btn_viewAsPlayer);
		end;
		
		local function captureGMStateChanged()
			if scene.isGM and not installed then
				installed = true;			
				installTools();
			elseif not scene.isGM and installed then
				installed = false;
				uninstallTools();
				scene.viewport:closeForm(frmInstrucao);
			end;
			
			if installed then
				scene.viewport:checkToolButton(btn_viewAsPlayer, not scene.isViewingAsGM);
			end;
		end;
		
		scene:listen("onGMStateChange", captureGMStateChanged);
		captureGMStateChanged();

	
		
	end);			