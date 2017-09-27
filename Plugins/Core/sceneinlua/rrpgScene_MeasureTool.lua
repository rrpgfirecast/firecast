require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_TouchNav.lua");

local TOOLS_CATEGORY = "tools";
local MEASURE_LINE_COLOR = "CornflowerBlue";
local USED_CELLS_COLOR = "CornflowerBlue";	

local MODO_FILL_CELL = true;	
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local btn_Measure;	
		

		local listenerMouseDown;
		local listenerMouseMove;
		local listenerMouseUp;
		local listenerDrawer;
		local isMeasuring = false;
		
		local measures = {};
		local currMeasure = nil;
		
		local usedCells = nil;  -- used Cells consolidado
		
		local cMouseX = 0; 
		local cMouseY = 0;
		local isPanningRightButton = false;
					
		scene.viewport:setupToolCategory(TOOLS_CATEGORY, lang("scene.toolcategory.tools"), -6);
		
		local function doDrawUsedCells()
			local viewport = scene.viewport;
			viewport:prepareFill(USED_CELLS_COLOR);
			
			local function drawCell(i, j)
				viewport:fillACell(i, j, 0.25);
			end;
			
			if usedCells ~= nil then
				for i, v in pairs(usedCells) do
					for j, v2 in pairs(v) do
						drawCell(i, j);
					end;
				end;	
			end;
						
			if (currMeasure ~= nil) and (currMeasure.usedCells ~= nil) then
				local bCellsUsed = currMeasure.usedCells;
				
				for i, v in pairs(bCellsUsed) do
					for j, v2 in pairs(v) do
						if (usedCells == nil) or (usedCells[i] == nil) or (usedCells[i][j] == nil) then
							drawCell(i, j);
						end;
					end;
				end;		
			end;
		end;		
		
		local function calculatePath(m)		
			local opcoes = {diagonals=scene.grid.squareDiagonals, endOfGrid="continue"};
			
			if m.previous ~= nil then
				opcoes.continuationData = m.previous.continuationData;
			end;
		
			local found, distance, steps, continuationData = scene.grid:shortestPath(m.startI, m.startJ, m.endI, m.endJ, 
																					 opcoes);
																										
			found = found and (distance > 0);
			m.pathFound = found;
						
			if found then
				m.steps = steps;
				m.distance = distance;
				m.lines = {};
				m.cellSize = scene.grid.cellSize;
				m.continuationData = continuationData;
				m.usedCells = {};

				local pathStartX, pathStartY, pathEndX, pathEndY = nil, nil, nil, nil;
				local formatoAUsar;
				local totalDistancia = distance + (m.distanciaPreAcumulada or 0.0);
				
				if math.abs(math.floor(totalDistancia) - totalDistancia) > 0.001 then
					formatoAUsar = "%1.1f %s";
				else
					formatoAUsar = "%0.0f %s";
				end
								
				m.distanceStr = string.format(formatoAUsar, totalDistancia, 
											  tryLang("metric." .. scene.worldMetricName) or scene.worldMetricName);
				
				local startLineX, startLineY;
				local currLineX, currLineY;		
				local oldLine = nil;
								
				for i = 1, #steps, 1 do
					local s = steps[i];
					s.cx, s.cy = scene.grid:cellToWorld(s.i, s.j);	

					if pathStartX == nil then
						pathStartX = s.cx;
					end;
					
					if pathStartY == nil then
						pathStartY = s.cy;
					end;
					
					pathEndX = s.cx;
					pathEndY = s.cy;
														
					if MODO_FILL_CELL then
						-- Used Cells
						local iTable = m.usedCells[s.i];
						
						if iTable == nil then
							iTable = {};
							m.usedCells[s.i] = iTable;
						end;
						
						iTable[s.j] = true;
					else	
						-- Desenho de várias linhas
																		
						local newLine = {};
						local deveAddNewLine = true;		
									
						if oldLine ~= nil then
							newLine.sx = oldLine.ex;
							newLine.sy = oldLine.ey;												
						else
							newLine.sx = s.cx;
							newLine.sy = s.cy;
						end;
						
						newLine.ex = s.cx;
						newLine.ey = s.cy;										
						newLine.angle = math.floor((math.atan(-(newLine.ey - newLine.sy), newLine.ex - newLine.sx) * 180.0 / math.pi) + 0.5);						
						
						if (oldLine ~= nil) and (oldLine.angle == newLine.angle) then
							-- Mesmo angulo da linha anterior.. Vamos imendar.
							oldLine.ex = newLine.ex;
							oldLine.ey = newLine.ey;
							deveAddNewLine = false;
						end;
						
						if deveAddNewLine then
							oldLine = newLine;				
							m.lines[#m.lines + 1] = newLine;
						end;						
					end;										
				end;
				
				if MODO_FILL_CELL and (pathStartX ~= nil) and (pathStartY ~= nil) and (pathEndX ~= nil) and (pathEndY ~= nil) then
					local newLine = {};
					newLine.sx = pathStartX;
					newLine.sy = pathStartY;
					newLine.ex = pathEndX;
					newLine.ey = pathEndY;
					newLine.angle = math.floor((math.atan(-(newLine.ey - newLine.sy), newLine.ex - newLine.sx) * 180.0 / math.pi) + 0.5);					
					m.lines[#m.lines + 1] = newLine;					
				end;
				
				if #m.lines >= 1 then
					local ultLinha = m.lines[#m.lines];
					local cellSize = m.cellSize;
					ultLinha.rotMatrix = SceneLib.Math.newRotationMatrix(ultLinha.angle, ultLinha.ex, ultLinha.ey);
					ultLinha.seta1 = {};
					ultLinha.seta2 = {};
					
					local auxX = ultLinha.ex - cellSize * 0.35;
					local auxY = ultLinha.ey - cellSize * 0.18;
					ultLinha.seta1.x, ultLinha.seta1.y = SceneLib.Math.transformPoint(auxX, auxY, ultLinha.rotMatrix);
					
					auxX = ultLinha.ex - cellSize * 0.35;
					auxY = ultLinha.ey + cellSize * 0.18;
					ultLinha.seta2.x, ultLinha.seta2.y = SceneLib.Math.transformPoint(auxX, auxY, ultLinha.rotMatrix);					
				end;
			else
				m.steps = nil;
				m.distance = 0;
				m.lines = nil;
				m.continuationData = nil;
				m.usedCells = nil;
			end;
		end;
		
		local function drawAMeasure(m, vp, desenharFinal)
			if m.pathFound and (m.lines ~= nil) and (#m.lines >= 1) then
				vp:prepareDraw(MEASURE_LINE_COLOR, 3);
			
				for i = 1, #m.lines, 1 do
					local l = m.lines[i];
					local tsx, tsy = vp:worldToScreen(l.sx, l.sy);
					local tex, tey = vp:worldToScreen(l.ex, l.ey);
					vp:drawLine(tsx, tsy, tex, tey);
				end;
				
				if desenharFinal then
					local ultLine = m.lines[#m.lines];
					
					-- Desenhar cabeça da seta			
					local fx, fy = vp:worldToScreen(ultLine.ex, ultLine.ey);
					
					local auxX, auxY = vp:worldToScreen(ultLine.seta1.x, ultLine.seta1.y);
					vp:drawLine(fx, fy, auxX, auxY);
					
					auxX, auxY = vp:worldToScreen(ultLine.seta2.x, ultLine.seta2.y);
					vp:drawLine(fx, fy, auxX, auxY);		
					
					-- Desenhar o texto com a distância
					
					vp:prepareFont(18, nil, true);				
					local txt = m.distanceStr;
					local sx, sy = vp:textSize(txt);
					local px = fx - sx / 2;
					local py = fy - sy - 20;				
					vp:prepareFill("white");
					vp:fillRect(px - 2, py - 2 , px + sx + 4, py + sy + 4, 0.8);
					
					vp:prepareFill("black");				
					vp:fillText(px, py, txt);
				end
			end;
		end;
		
		local function doDraw()
			local vp = scene.viewport;
			
			if currMeasure ~= nil then
				if currMeasure.pathFound then
					for i = 1, #measures, 1 do
						drawAMeasure(measures[i], vp, false);
					end;
				
					drawAMeasure(currMeasure, vp, true);
				elseif #measures > 0 then
					for i = 1, #measures - 1, 1 do
						drawAMeasure(measures[i], vp, false);
					end;	

					drawAMeasure(measures[#measures], vp, true);					
				end;
			end;
			
			doDrawUsedCells();
		end;
		
		local function mouseDown(event)
			if event.button ~= "right" then			
				isMeasuring = true;
				isPanningRightButton = false;
				
				local emendarMedida = (event.ctrlKey or event.shiftKey) and (currMeasure ~= nil);
				
				if emendarMedida then
					if currMeasure.distance > 0 then
						measures[#measures + 1] = currMeasure;
					else
						emendarMedida = #measures > 0;
					end;
					
					-- emendar used cells
					
					if usedCells == nil then
						usedCells = {};
					end;
					
					if currMeasure.usedCells ~= nil then
						for i, v in pairs(currMeasure.usedCells) do
							for j, v2 in pairs(v) do
								local iTable = usedCells[i];
								
								if iTable == nil then
									iTable = {};
									usedCells[i] = iTable;
								end;
								
								iTable[j] = true;
							end;
						end;
					end;
				else
					measures = {};
					usedCells = nil;
				end;
				
				currMeasure = {};					
				local startX, startY = scene.viewport:screenToWorld(event.x, event.y);
											
				currMeasure.endI, currMeasure.endJ = scene.grid:worldToCell(startX, startY);
				
				if emendarMedida then
					local oldMeasure = measures[#measures];
					currMeasure.startI = oldMeasure.endI;
					currMeasure.startJ = oldMeasure.endJ;		
					currMeasure.distanciaPreAcumulada = oldMeasure.distanciaPreAcumulada + oldMeasure.distance;
					currMeasure.previous = oldMeasure;
				else
					currMeasure.startI = currMeasure.endI;
					currMeasure.startJ = currMeasure.endJ;			
					currMeasure.distanciaPreAcumulada = 0.0;
				end;
				
				currMeasure.steps = nil;
				currMeasure.pathFound = false;
				currMeasure.distance = 0;		
				
				if emendarMedida then
					calculatePath(currMeasure);
				end;
				
				scene.viewport:needRepaint();
			else
				isPanningRightButton = true;
				isMeasuring = false;
				INERTIAL_pointerDown(scene.viewport, event);
			end;
		end
		
		local function mouseMove(event)
			if isMeasuring then
				local endX, endY = scene.viewport:screenToWorld(event.x, event.y);
				local newEndI, newEndJ = scene.grid:worldToCell(endX, endY);		

				if (newEndI ~= currMeasure.endI) or (newEndJ ~= currMeasure.endJ) then
					currMeasure.endI = newEndI;
					currMeasure.endJ = newEndJ;
					calculatePath(currMeasure);
					scene.viewport:needRepaint();
				end;	
            elseif isPanningRightButton then
				INERTIAL_pointerMove(scene.viewport, event);				
			end;
			
			cMouseX = event.x;
			cMouseY = event.y;
		end;
		
		local function mouseUp(event)	
			if isPanningRightButton then
				INERTIAL_pointerUp(scene.viewport, event);			
			end;
		
			isMeasuring = false;	
			isPanningRightButton = false;
			scene.viewport:needRepaint();
		end;
		
		btn_Measure = 
			scene.viewport:addToolButton(TOOLS_CATEGORY, 
										lang("scene.menu.measureDistance"), 
										"/icos/measure.png",
										-5,
										{selectable=true},
									 
				function()
					-- Activated Measure
					listenerMouseDown = scene.viewport:listen("onMouseDown", mouseDown);
					listenerMouseMove = scene.viewport:listen("onMouseMove", mouseMove);
					listenerMouseUp = scene.viewport:listen("onMouseUp", mouseUp);
					listenerDrawer = scene.viewport:listen("onAfterDrawLayers", doDraw);
					scene.viewport.cursor = "cross";
					
					pathFound = false;
					pathDistance = nil;
					pathSteps = nil;	
					isMeasuring	= false;
					isPanningRightButton = false;
				
					scene.items:clearSelection();
					
					INERTIAL_Start(scene.viewport);
					TOUCH_NAV_Start(scene.viewport);					
				end,
				
				function ()
					-- Desativado
					scene.viewport.cursor = "default";
					scene.viewport:unlisten(listenerMouseDown);
					scene.viewport:unlisten(listenerMouseMove);
					scene.viewport:unlisten(listenerMouseUp);	
					scene.viewport:unlisten(listenerDrawer);

					measures = {};
					currMeasure = nil;
					
					isPanningRightButton = false;
					isMeasuring	= false;					
					scene.viewport:needRepaint();
					
					INERTIAL_Stop(scene.viewport);		
					TOUCH_NAV_Stop(scene.viewport);							
				end);								 
	end);	
