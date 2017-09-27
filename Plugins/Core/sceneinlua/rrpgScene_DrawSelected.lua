require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_Globals.lua");

--[[ Funções utilitárias para desenho de seleção dos itens  ]]	
	
local QUAD_TOP_LEFT = 1;
local QUAD_TOP_CENTER = 2;
local QUAD_TOP_RIGHT = 3;
local QUAD_CENTER_LEFT = 4;
local QUAD_CENTER_RIGHT = 5;
local QUAD_BOTTOM_LEFT = 6;
local QUAD_BOTTOM_CENTER = 7;
local QUAD_BOTTOM_RIGHT = 8;
local QUAD_ROTATION = 9;
local QUAD_ROTATION_ANGLE = 10;
local QUAD_SIZE = 11;
local QUAD_CENTERX = 12;
local QUAD_CENTERY = 13;

local QUAD_BARRINHA_1 = 14;
local QUAD_BARRINHA_2 = 15;
local QUAD_BARRINHA_3 = 16;


local QUADRECT_LEFT = 1;
local QUADRECT_TOP = 2;
local QUADRECT_RIGHT = 3;
local QUADRECT_BOTTOM = 4;
local QUADRECT_CX = 5;
local QUADRECT_CY = 6;

DS_QUAD_TOP_LEFT = QUAD_TOP_LEFT;
DS_QUAD_TOP_CENTER = QUAD_TOP_CENTER;
DS_QUAD_TOP_RIGHT = QUAD_TOP_RIGHT;
DS_QUAD_CENTER_LEFT = QUAD_CENTER_LEFT;
DS_QUAD_CENTER_RIGHT = QUAD_CENTER_RIGHT;
DS_QUAD_BOTTOM_LEFT = QUAD_BOTTOM_LEFT;
DS_QUAD_BOTTOM_CENTER = QUAD_BOTTOM_CENTER;
DS_QUAD_BOTTOM_RIGHT = QUAD_BOTTOM_RIGHT;
DS_QUAD_ROTATION = QUAD_ROTATION;
DS_QUAD_BARRINHA_1 = QUAD_BARRINHA_1;
DS_QUAD_BARRINHA_2 = QUAD_BARRINHA_2;
DS_QUAD_BARRINHA_3 = QUAD_BARRINHA_3;

DS_QUADS_MENUS = {};
DS_QUADS_MENUS[DS_QUAD_BARRINHA_1] = true;
DS_QUADS_MENUS[DS_QUAD_BARRINHA_2] = true;
DS_QUADS_MENUS[DS_QUAD_BARRINHA_3] = true;


DS_BASE_ANGLE = {};				 
DS_BASE_ANGLE[QUAD_TOP_LEFT] = 135;
DS_BASE_ANGLE[QUAD_TOP_CENTER] = 90;
DS_BASE_ANGLE[QUAD_TOP_RIGHT] = 45;
DS_BASE_ANGLE[QUAD_CENTER_LEFT] = 180;
DS_BASE_ANGLE[QUAD_CENTER_RIGHT] = 0;
DS_BASE_ANGLE[QUAD_BOTTOM_LEFT] = 225;
DS_BASE_ANGLE[QUAD_BOTTOM_CENTER] = 270;
DS_BASE_ANGLE[QUAD_BOTTOM_RIGHT] = 315;
DS_BASE_ANGLE[QUAD_ROTATION] = 0;

local ALL_QUADS = {QUAD_TOP_LEFT, QUAD_TOP_CENTER, QUAD_TOP_RIGHT, 
				   QUAD_CENTER_LEFT, QUAD_CENTER_RIGHT,
				   QUAD_BOTTOM_LEFT, QUAD_BOTTOM_CENTER, QUAD_BOTTOM_RIGHT,
				   QUAD_ROTATION};

local ALL_QUADS_NO_ROTATION = {QUAD_BARRINHA_1, QUAD_BARRINHA_2, QUAD_BARRINHA_3};
				   
local ALL_QUADS_AND_MENUS = {};

for i = 1, #ALL_QUADS, 1 do
	ALL_QUADS_AND_MENUS[#ALL_QUADS_AND_MENUS + 1] = ALL_QUADS[i];
end;	

for i = 1, #ALL_QUADS_NO_ROTATION, 1 do
	ALL_QUADS_AND_MENUS[#ALL_QUADS_AND_MENUS + 1] = ALL_QUADS_NO_ROTATION[i];
end;					   
				   
local QUADS_COLOR = "CornflowerBlue";
local QUADS_OPACITY = 0.85;

local IN_LOCO_DISPLAY_SIZE = 45; -- pixels
local IN_LOCO_SPACING = 12;
	
local function __setQuadInfo(tabela, quadName, x, y, sizeToUse)	
	local r = tabela[quadName];
	
	if r == nil then
		r = {};
		tabela[quadName] = r;
	end;
	
	local size = sizeToUse or tabela[QUAD_SIZE];
	r[QUADRECT_LEFT] = x;
	r[QUADRECT_TOP] = y;
	r[QUADRECT_RIGHT] = x + size;
	r[QUADRECT_BOTTOM] = y + size;
	r[QUADRECT_CX] = x + size * 0.5;
	r[QUADRECT_CY] = y + size * 0.5;
end;
	
local function __transformQuadScreenToWorld(tabela, quadName, viewport)	
	local r = tabela[quadName];
	
	if r ~= nil then
		r[QUADRECT_LEFT], r[QUADRECT_TOP] = viewport:screenToWorld(r[QUADRECT_LEFT], r[QUADRECT_TOP]);
		r[QUADRECT_RIGHT], r[QUADRECT_BOTTOM] = viewport:screenToWorld(r[QUADRECT_RIGHT], r[QUADRECT_BOTTOM]);
		r[QUADRECT_CX], r[QUADRECT_CY] = viewport:screenToWorld(r[QUADRECT_CX], r[QUADRECT_CY]);
	end;
end;
	
function DRAWSELECTED_CalcWPosOfQuadsBox(boxLeft, boxTop, boxRight, boxBottom, rotation, quadSize, tabela, viewport)	
	local t;
	
	if tabela == nil then
		t = {};
	else
		t = tabela;
	end;
		
	t[QUAD_SIZE] = quadSize;
	t[QUAD_ROTATION_ANGLE] = rotation;
			
	local r;	
	local boxWidth = boxRight - boxLeft;
	local boxHeight = boxBottom - boxTop;
	local boxWidthDiv2 = boxWidth / 2;
	local boxHeightDiv2 = boxHeight / 2;	
	local quadSizeDiv2 = (quadSize / 2);
	
	t[QUAD_CENTERX] = boxLeft + boxWidthDiv2;
	t[QUAD_CENTERY] = boxTop + boxHeightDiv2;
	
	local xCenterX = boxLeft + boxWidthDiv2 - quadSizeDiv2;
	local xRightX = boxRight - quadSizeDiv2;
	local xBoxLeftQuad = boxLeft - quadSizeDiv2;
	local xBoxTopQuad = boxTop - quadSizeDiv2;
	
	__setQuadInfo(t, QUAD_TOP_LEFT, xBoxLeftQuad, xBoxTopQuad);
	__setQuadInfo(t, QUAD_TOP_CENTER, xCenterX, xBoxTopQuad);
	__setQuadInfo(t, QUAD_TOP_RIGHT, xRightX, xBoxTopQuad);	
	
	local xCenterY = xBoxTopQuad + quadSizeDiv2 + boxHeightDiv2 - quadSizeDiv2;
	__setQuadInfo(t, QUAD_CENTER_LEFT, xBoxLeftQuad, xCenterY);		
	__setQuadInfo(t, QUAD_CENTER_RIGHT, xRightX, xCenterY);	
	
	local xBottomY = boxBottom - quadSizeDiv2;
	__setQuadInfo(t, QUAD_BOTTOM_LEFT, xBoxLeftQuad, xBottomY);		
	__setQuadInfo(t, QUAD_BOTTOM_CENTER, xCenterX, xBottomY);			
	__setQuadInfo(t, QUAD_BOTTOM_RIGHT, xRightX, xBottomY);				
	
	__setQuadInfo(t, QUAD_ROTATION, xRightX + quadSizeDiv2 + quadSize * 3, xCenterY);	

	-- Em métrica de tela
	
	local itemDisplaySize = ((boxWidth + boxHeight) / 2) * viewport.scale;
	local itemDisplayCX, itemDisplayCY = viewport:worldToScreen(boxLeft + boxWidthDiv2, xCenterY);
		
	local barrinhasY = itemDisplayCY - itemDisplaySize - IN_LOCO_DISPLAY_SIZE * 1.5;
	local totalBarrinhasWidth = 3 * IN_LOCO_DISPLAY_SIZE + 2 * IN_LOCO_SPACING;
	local barrinhasX = itemDisplayCX - totalBarrinhasWidth / 2;
	
	__setQuadInfo(t, QUAD_BARRINHA_1, barrinhasX, barrinhasY, IN_LOCO_DISPLAY_SIZE);
									  
	barrinhasX	= barrinhasX + IN_LOCO_DISPLAY_SIZE + IN_LOCO_SPACING; 
									  
	__setQuadInfo(t, QUAD_BARRINHA_2, barrinhasX, barrinhasY, IN_LOCO_DISPLAY_SIZE);									  
									  
	barrinhasX	= barrinhasX + IN_LOCO_DISPLAY_SIZE + IN_LOCO_SPACING;									  
									  
	__setQuadInfo(t, QUAD_BARRINHA_3, barrinhasX, barrinhasY, IN_LOCO_DISPLAY_SIZE);									  									  
	
	__transformQuadScreenToWorld(t, QUAD_BARRINHA_1, viewport);
	__transformQuadScreenToWorld(t, QUAD_BARRINHA_2, viewport);
	__transformQuadScreenToWorld(t, QUAD_BARRINHA_3, viewport);
	return t;
end;	
	
function DRAWSELECTED_CalcWPosOfQuadsDaSelecao(item, scene, tabela)	
	local l, t, r, b, rotation = item:getBounds();
	return DRAWSELECTED_CalcWPosOfQuadsBox(l, t, r, b, rotation, 0.2 * scene.grid.cellSize, tabela, scene.viewport);
end;

local function __DRAWSELECTED_DrawSingleQuad(aQuad, viewport)
	local sLeft, sTop = viewport:worldToScreen(aQuad[QUADRECT_LEFT], aQuad[QUADRECT_TOP]);
	local sRight, sBottom = viewport:worldToScreen(aQuad[QUADRECT_RIGHT], aQuad[QUADRECT_BOTTOM]);

	viewport:fillRect(sLeft, sTop, sRight, sBottom, QUADS_OPACITY);
end;

local function __DRAWSELECTED_DrawSingleQuadScreenCords(aQuad, viewport)
	if aQuad == nil then
		return;
	end;

	local sLeft, sTop = aQuad[QUADRECT_LEFT], aQuad[QUADRECT_TOP];
	local sRight, sBottom = aQuad[QUADRECT_RIGHT], aQuad[QUADRECT_BOTTOM];

	viewport:fillRect(sLeft, sTop, sRight, sBottom, QUADS_OPACITY);
end;

function DRAWSELECTED_DrawQuads(quads, viewport)	
	viewport:prepareFill(QUADS_COLOR);

	for i = 1, #ALL_QUADS, 1 do
		__DRAWSELECTED_DrawSingleQuad(quads[ALL_QUADS[i]], viewport);
	end;
end;

local ATRIBUTOS_BAR_COLORS = {"barColor1", "barColor2", "barColor3"};
local ATRIBUTOS_BAR_VALUES = {"barValue1", "barValue2", "barValue3"};
local MARGEM_BORDA_MENOR = 5;
local MARGEM_COR = 5;
local MARGE_TEXTO_BARRINHA = 1 + 3;

local function DRAWSELECTED_DrawBarrinhaMenuInLoco(aQuad, viewport, token, idxBarrinha)
	local barColor = token[ATRIBUTOS_BAR_COLORS[idxBarrinha]];
	
	viewport:prepareFill(barColor);	
	
	local sLeft, sTop = viewport:worldToScreen(aQuad[QUADRECT_LEFT], aQuad[QUADRECT_TOP]);
	local sRight, sBottom = viewport:worldToScreen(aQuad[QUADRECT_RIGHT], aQuad[QUADRECT_BOTTOM]);
	
	viewport:prepareFill("white");		
	viewport:prepareDraw("silver", 1);	
	viewport:fillRect(sLeft, sTop, sRight, sBottom, 1.0);	
	viewport:drawRect(sLeft, sTop, sRight, sBottom, 0.6);		
	
	sLeft = sLeft + MARGEM_BORDA_MENOR;
	sTop = sTop + MARGEM_BORDA_MENOR;
	sRight = sRight - MARGEM_BORDA_MENOR;
	sBottom = sBottom - MARGEM_BORDA_MENOR;

	
	viewport:prepareFill("black");		
	viewport:prepareDraw(barColor, MARGEM_COR);
	viewport:fillRect(sLeft, sTop, sRight, sBottom, 1.0);
	viewport:drawRect(sLeft, sTop, sRight, sBottom, 1.0);
	
	viewport:prepareFill("white");
	
	local txt = token[ATRIBUTOS_BAR_VALUES[idxBarrinha]];	
	
	viewport:fillTextFit(sLeft + MARGE_TEXTO_BARRINHA, 
						 sTop + MARGE_TEXTO_BARRINHA, 
						 sRight - MARGE_TEXTO_BARRINHA, 
						 sBottom - MARGE_TEXTO_BARRINHA, txt);
end;

function DRAWSELECTED_DrawMenuInLoco(quads, viewport, token)	
	viewport:prepareFill(QUADS_COLOR);

	viewport:prepareFont(12);
	DRAWSELECTED_DrawBarrinhaMenuInLoco(quads[QUAD_BARRINHA_1], viewport, token, 1);
	DRAWSELECTED_DrawBarrinhaMenuInLoco(quads[QUAD_BARRINHA_2], viewport, token, 2);
	DRAWSELECTED_DrawBarrinhaMenuInLoco(quads[QUAD_BARRINHA_3], viewport, token, 3);
end;
	
local _DS_Scenes = {};	 -- Objetos DrawSelected por Scenes
setmetatable(_DS_Scenes, {__mode="k"}); -- Chaves são WeakReferences

function DRAWSELECTED_StartMouseTracking(scene)
	local tabelaExterna = _DS_Scenes[scene];
	
	if tabelaExterna ~= nil then
		tabelaExterna.trackMouse = true;
	end;
end;	

function DRAWSELECTED_EndMouseTracking(scene)
	local tabelaExterna = _DS_Scenes[scene];
	
	if tabelaExterna ~= nil then
		tabelaExterna.trackMouse = false;
	end;
end;

local function __DRAWSELECTED_isPointInQuad(aQuad, x, y, expansion)
	local deuHitTest = (x >= aQuad[QUADRECT_LEFT] - expansion) and (x <= aQuad[QUADRECT_RIGHT] + expansion) and
	       (y >= aQuad[QUADRECT_TOP] - expansion) and (y <= aQuad[QUADRECT_BOTTOM] + expansion);
		   
	if deuHitTest then
		local QLEFT = aQuad[QUADRECT_LEFT] - expansion;
		local QTOP = aQuad[QUADRECT_TOP] - expansion;
		local QW = (aQuad[QUADRECT_RIGHT] + expansion) - QLEFT;
		local QH = (aQuad[QUADRECT_BOTTOM] + expansion) - QTOP;
		local difX = x - (QLEFT + QW / 2);
		local difY = y - (QTOP + QH / 2);
		return true, difX * difX + difY * difY;
	else
		return false, nil;
	end
end;

local function __DRAWSELECTED_isPointInQuadNoExpansion(aQuad, x, y)
	return (x >= aQuad[QUADRECT_LEFT]) and (x <= aQuad[QUADRECT_RIGHT]) and
	       (y >= aQuad[QUADRECT_TOP]) and (y <= aQuad[QUADRECT_BOTTOM]);
end;


function DRAWSELECTED_HitTest(scene, screenX, screenY, expansion)
	local tabelaExterna = _DS_Scenes[scene];
	
	if tabelaExterna == nil then
		return nil;
	end;
	
	local selecao, qtSelecionado = tabelaExterna.getSelecao();
	local viewport = scene.viewport;
	local wx, wy = viewport:screenToWorld(screenX, screenY);
	
	if expansion ~= nil then
		-- busca pelo quad de menor distância que der hittest
		expansion = (tonumber(expansion) or 0) / viewport.scale;
		local menorDISTANCIA = nil;
		local menorK = nil;
		local menorQUAD = nil;
		local menorIDQUAD = nil;
		local menorANGLE = nil;				
		
		for k, v in pairs(selecao) do
			if v.quads ~= nil then	
				local tx, ty = SceneLib.Math.rotatePoint(wx, wy, -v.quads[QUAD_ROTATION_ANGLE], v.quads[QUAD_CENTERX], v.quads[QUAD_CENTERY]);
				
				for i = 1, #ALL_QUADS, 1 do
					local aQuad = v.quads[ALL_QUADS[i]];										
					local deuHitTest, distancia = __DRAWSELECTED_isPointInQuad(aQuad, tx, ty, expansion);
									
					if deuHitTest then									
						if (menorDISTANCIA == nil) or (distancia < menorDISTANCIA) then												
							local angle = v.quads[QUAD_ROTATION_ANGLE] + DS_BASE_ANGLE[ALL_QUADS[i]];;
							
							if angle >= 0 then
								angle = angle - math.floor(angle / 360) * 360;
							else
								angle = 360 + (angle - math.ceil(angle / 360) * 360);
							end;							
											
							menorDISTANCIA = distancia;
							menorK = k;
							menorQUAD = ALL_QUADS[i];
							menorIDQUAD = aQuad;
							menorANGLE = angle;																	
						end;
					end;
				end;	

				if tabelaExterna.getExibindoMenuInLoco() then
					-- verificar os sem rotações
					for i = 1, #ALL_QUADS_NO_ROTATION, 1 do
						local aQuad = v.quads[ALL_QUADS_NO_ROTATION[i]];										
						local deuHitTest, distancia = __DRAWSELECTED_isPointInQuad(aQuad, wx, wy, expansion);
										
						if deuHitTest then									
							if (menorDISTANCIA == nil) or (distancia < menorDISTANCIA) then												
								local angle = 0;																
								menorDISTANCIA = distancia;
								menorK = k;
								menorQUAD = ALL_QUADS_NO_ROTATION[i];
								menorIDQUAD = aQuad;
								menorANGLE = angle;																	
							end;
						end;
					end;	
				end;				
			end;
		end;		
		
		return menorK, menorQUAD, menorIDQUAD, menorANGLE;		
	else				
		-- Busca simples pelo primeiro quad que der hittest
		for k, v in pairs(selecao) do
			if v.quads ~= nil then		
				local tx, ty = SceneLib.Math.rotatePoint(wx, wy, -v.quads[QUAD_ROTATION_ANGLE], v.quads[QUAD_CENTERX], v.quads[QUAD_CENTERY]);
				
				for i = 1, #ALL_QUADS, 1 do
					local aQuad = v.quads[ALL_QUADS[i]];
									
					if __DRAWSELECTED_isPointInQuadNoExpansion(aQuad, tx, ty) then									
						local angle = v.quads[QUAD_ROTATION_ANGLE] + DS_BASE_ANGLE[ALL_QUADS[i]];;
						
						if angle >= 0 then
							angle = angle - math.floor(angle / 360) * 360;
						else
							angle = 360 + (angle - math.ceil(angle / 360) * 360);
						end;					
												
						return k, ALL_QUADS[i], aQuad, angle;
					end;
				end;	

				if tabelaExterna.getExibindoMenuInLoco() then					
					-- verificar os sem rotações
					
					for i = 1, #ALL_QUADS_NO_ROTATION, 1 do
						local aQuad = v.quads[ALL_QUADS_NO_ROTATION[i]];
										
						if __DRAWSELECTED_isPointInQuadNoExpansion(aQuad, wx, wy) then									
							local angle = 0;															
							return k, ALL_QUADS_NO_ROTATION[i], aQuad, angle;
						end;
					end;
				end;				
			end;
		end;
	end;
end;
	
local function desenharCellsDoItem(scene, item, viewport)	
	local cells = item:getCellsOccupied();
	local grid = scene.grid;
	local size = grid.cellSize * 0.20;
	
	viewport:prepareFill("black");
	
	for i = 1, #cells, 1 do
		local cell = cells[i];
		local cx, cy = grid:cellToWorld(cell.i, cell.j);
		local l, t = viewport:worldToScreen(cx - size, cy - size);
		local r, b = viewport:worldToScreen(cx + size, cy + size);
		viewport:fillRect(l, t, r, b);
	end;
end;
	
function DRAWSELECTED_EnableInLocoMenu(scene, enable)	
	local tabelaExterna = _DS_Scenes[scene];
	
	if tabelaExterna == nil then
		return;
	end;
	
	tabelaExterna.enableInLocoMenu(enable);
end;
		
--[[   PLUGIN para desenhar a seleção dos itens  ]]--	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local qtSelecionado = 0;
		local selecao = {};
		local tabelaExterna = {};
		tabelaExterna.trackMouse = false;
		local exibindoMenuInLoco = false;
		local inLocoMenuEnabled = false;
		local canViewMenuOfToken = false;
		
		local listenerDrawerSelection = nil;
	
		local function verificarMenuInLocoParaSelecao()
			canViewMenuOfToken = false;

			if qtSelecionado == 1 then
				local oToken = nil;
				
				for k, v in pairs(selecao) do
					oToken = k;
				end;
				
				if oToken.layer == "tokens" and oToken.objectType == "token" then
					if (scene.isGM) or (UTIL_IsTokenMine(oToken)) then
						canViewMenuOfToken = true;
					end;
				end;
			end;
		end;
	
		local function drawSelection()
			local viewport = scene.viewport;	
			
			viewport:prepareDraw(QUADS_COLOR, 1);
			
			for k, v in pairs(selecao)	do
				local left, top, right, bottom, angle = k:getBounds();
				local leftScreen, topScreen = viewport:worldToScreen(left, top);
				local rightScreen, bottomScreen = viewport:worldToScreen(right, bottom);				
				
				v.quads = DRAWSELECTED_CalcWPosOfQuadsDaSelecao(k, scene, v.quads);

				viewport:pushRotationTransform(k.rotation, leftScreen + (rightScreen - leftScreen) / 2,
												topScreen + (bottomScreen - topScreen) / 2);
				viewport:drawRect(leftScreen, topScreen, rightScreen, bottomScreen, QUADS_OPACITY);
				
				local sx, sy = viewport:worldToScreen(v.quads[QUAD_CENTER_RIGHT][QUADRECT_CX], v.quads[QUAD_CENTER_RIGHT][QUADRECT_CY]);
				local ex, ey = viewport:worldToScreen(v.quads[QUAD_ROTATION][QUADRECT_CX], v.quads[QUAD_ROTATION][QUADRECT_CY]);
				viewport:drawLine(math.floor(sx), math.floor(sy), math.floor(ex), math.floor(ey), QUADS_OPACITY);
		
				DRAWSELECTED_DrawQuads(v.quads, viewport);	
							
				viewport:popTransform();				
				
				exibindoMenuInLoco = (qtSelecionado == 1) and inLocoMenuEnabled and canViewMenuOfToken;
				
				if exibindoMenuInLoco then
					DRAWSELECTED_DrawMenuInLoco(v.quads, viewport, k);						
				end;				
			end;
		end;
			
		for k, v in pairs(scene.items.selection) do
			selecao[v] = {};
			qtSelecionado = qtSelecionado + 1;
		end;
	
		if qtSelecionado > 0 then
			if listenerDrawerSelection == nil then
				listenerDrawerSelection = scene.viewport:listen("onAfterDrawLayers", drawSelection);
			end;
			
			scene.viewport:needRepaint();
		end;
		
		tabelaExterna.getSelecao = function () 
										return selecao, qtSelecionado;
								   end;
								   
		tabelaExterna.getExibindoMenuInLoco = function ()
											return exibindoMenuInLoco;
										end;	
										
		tabelaExterna.enableInLocoMenu = function(enable)
											if enable ~= inLocoMenuEnabled then
												inLocoMenuEnabled = enable;
												
												if qtSelecionado == 1 then
													scene.viewport:needRepaint();
												end;
											end;
										 end;
		
		_DS_Scenes[scene] = tabelaExterna;
	
		scene.items:listen("onItemSelected",
			function(item)
				if selecao[item] == nil then
					qtSelecionado = qtSelecionado + 1;
					selecao[item] = {};
					
					verificarMenuInLocoParaSelecao();
					
					if listenerDrawerSelection == nil then
						listenerDrawerSelection = scene.viewport:listen("onAfterDrawLayers", drawSelection);
					end;
					
					scene.viewport:needRepaint();
				end;
			end);
			
		scene.items:listen("onItemDeselected",
			function(item)	
				if selecao[item] ~= nil then
					qtSelecionado = qtSelecionado - 1;
					selecao[item] = nil;
					
					verificarMenuInLocoParaSelecao();
					
					if (qtSelecionado <= 0) and (listenerDrawerSelection ~= nil) then
						scene.viewport:unlisten(listenerDrawerSelection);
						listenerDrawerSelection = nil;
					end;
					
					scene.viewport:needRepaint();
				end;				
			end);			
	end);	