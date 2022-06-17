require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("rrpgScene_UserDrawingDetails.lua");

--[[   PLUGIN para fazer user drawings ]]--	
	
SceneLib.registerPlugin(
	function (scene, attachment)	
		require("rrpgScene_ShapesMaker.dlua");
		
		local shapeMaker = nil;
		local modo = nil;
		
		local selecao = {};		
		local qtSelecaoUserDrawings = 0;
		local qtSelecaoOutros = 0;
		local exibindoUserDrawingDetailsForSelection = false;		
		
		local viewport = scene.viewport;
		local defStrokeColor = "Black";
		local defFillColor = "None";		
		local defSnapToGrid = false;
		
		local function adicionarComPath(maker, pathData, minX, minY, maxX, maxY)
			local _, aStroke, aFill;
			_, _, _, aStroke = colorToRGBA(maker.strokeColor);
			_, _, _, aFill = colorToRGBA(maker.fillColor);
			
			if aFill < 0.5 and aStroke < 0.5 then
				return;
			end;
		
			SC3UNDO_Capture(scene,
				function()
					local ud = scene.items:addUserDrawing();
					ud:markAsMyDrawing();
					local path = ud.canvas:addPath();
										
					local largura = (maxX - minX);
					local altura = (maxY - minY);	
				
					if altura < maker.strokeSize then
						altura = maker.strokeSize;
					end;
					
					if largura < maker.strokeSize then
						largura = maker.strokeSize;
					end;
					
					local aspectXFactor;
					local aspectYFactor;
					
					if largura > altura then
						aspectXFactor = 1.0;					
						aspectYFactor = largura / altura;
					else
						aspectXFactor = altura / largura;		
						aspectYFactor = 1.0;						
					end;		

					local avgWorldSizeAfterFactor = (largura * aspectXFactor + altura * aspectYFactor) / 2;
					local strokeSizeAfterFactor = maker.strokeSize / avgWorldSizeAfterFactor;					
							
					path.x = -(aspectXFactor - 1) / 2;
					path.y = -(aspectYFactor - 1) / 2;											
					path.width = aspectXFactor;						
					path.height = aspectYFactor;						
															
					path.strokeSize = strokeSizeAfterFactor;
					path.strokeSizeMetric = "canvasMetric";
					path.strokeCap = "round";
					path.strokeJoin = "round";
					path.color = maker.fillColor;
					path.strokeColor = maker.strokeColor;
					path.data = pathData;															
																			
					ud.x = minX;
					ud.y = minY;
					ud.width = largura;
					ud.height = altura;
					ud.snapToGrid = maker.snapToGrid;	
				end);		
		end;
		
		local function adicionarPoligono(maker, pol)
			local pData = nil;
			local minX, maxX, minY, maxY = nil, nil, nil, nil;
			local scale = viewport.scale;
				
						
			for i = 1, #pol, 1 do
				local p = pol[i];
				local x, y = p.x * scale, p.y * scale;
				
				if minX == nil or x < minX then
					minX = x;
				end;
				
				if maxX == nil or x > maxX then
					maxX = x;
				end;
				
				if minY == nil or y < minY then
					minY = y;
				end;
				
				if maxY == nil or y > maxY then
					maxY = y;
				end;

				if pData == nil then
					pData = "M" .. x .. " " .. y;
				else
					pData = pData .. "L" .. x .. " " .. y;
				end;						
			end;		
		
			if modo == SHAPE_RECTANGLE then
				pData = pData .. 'Z';
			end;
			
			adicionarComPath(maker, pData, minX / scale, minY / scale, maxX / scale, maxY / scale);
		end;
				
		local function adicionarEllipse(maker, x, y, x2, y2)
			local pData;
			local minX = math.min(x, x2);
			local maxX = math.max(x, x2);
			local minY = math.min(y, y2);
			local maxY = math.max(y, y2);
			local raioX = maxX - minX;
			local raioY = maxY - minY;
							
							
			pData = string.format("M%3.3f,0a%3.3f,%3.3f 0 1,0 %3.3f,0a%3.3f,%3.3f 0 1,0 %3.3f,0Z",
								  -raioX, 
								  raioX, raioY,
								  2 * raioX,
								  raioX, raioY,
								  - 2* raioX);
						
			adicionarComPath(maker, pData, minX, minY, maxX, maxY);
		end;	

		local function adicionarTexto(maker, x, y, texto)
			local r, g, b, aStroke;
			r, g, b, aStroke = colorToRGBA(maker.strokeColor);
			local cor = maker.strokeColor; 
			
			if aStroke < 0.8 then
				cor = RGBAToColor(r, g, b, 1);
			end;
		
			SC3UNDO_Capture(scene,
				function()
					local ud = scene.items:addUserDrawing();
					ud:markAsMyDrawing();
					local txt = ud.canvas:addText();									
						
					txt.text = texto;
					txt.color = cor;
					txt.horzTextAlign = "center";
					txt.vertTextAlign = "center";		
								
					local aspecto = txt.aspect;
					local altura = scene.grid.cellSize;
					local largura = altura * aspecto;
								
					ud.x = x;
					ud.y = y;
					ud.width = largura;
					ud.height = altura;
					ud.snapToGrid = maker.snapToGrid;									
				end);			
		end;
		
		local function shapeMakerStop()
			local pol = shapeMaker:getPolygon();
			
			if pol ~= nil then
				adicionarPoligono(shapeMaker, pol);
			else
				local x, y, x2, y2 = shapeMaker:getEllipse();		
				
				if x2 ~= nil then
					adicionarEllipse(shapeMaker, x, y, x2, y2);
				elseif shapeMaker.shape == SHAPE_TEXT_POINT then
					local x3, y3 = shapeMaker:getPoint();
					
					Dialogs.inputQuery('@@userDrawing.textObject.prompt.title', '@@userDrawing.textObject.promptText', '', 
						function(texto)
							adicionarTexto(shapeMaker, x3, y3, texto);						
						end);
				end;
			end;
		end;
		
		local function limparTodosUserDrawings(dosJogadores)
			local drawings = {};
			local currLayer = scene.workingLayer;
			
			for i = 1, #scene.items, 1 do
				local item = scene.items[i];
				
				if dosJogadores then
					if (item ~= nil) and (item.objectType == "userDrawing") and (item.ownerUserID ~= "") and (item.ownerUserID ~= scene.currentUserID) then
						drawings[#drawings + 1]	= item;
					end;				
				else
					if (item ~= nil) and (item.objectType == "userDrawing") and (item.layer == currLayer) then
						drawings[#drawings + 1]	= item;
					end;
				end;
			end;
		
			if #drawings > 0 then
				SC3UNDO_Capture(scene,
					function()
						for i = 1, #drawings, 1 do
							drawings[i]:delete();
						end;
					end);
			end;
			
			scene.viewport:needRepaint();
		end;
		
		local function anexar(modoAnexar)
			modo = modoAnexar;
		
			if shapeMaker ~= nil then
				shapeMaker:abort();
				shapeMaker = nil;
			end;		
			
			shapeMaker = SHAPEMaker_New(scene, modo);
			shapeMaker.autoDraw = true;			
			shapeMaker.onStop = shapeMakerStop;
			shapeMaker.fillColor = defFillColor;
			shapeMaker.strokeColor = defStrokeColor;
			shapeMaker.snapToGrid = defSnapToGrid;
			shapeMaker:start();
			
			SC3UNDO_AtivarUndoHotKey(scene, true);
			scene.items:clearSelection();
			
			UserDrawingDetails_Show(scene,
				{strokeColor = shapeMaker.strokeColor,
				 fillColor = shapeMaker.fillColor,	
				 snapToGrid = shapeMaker.snapToGrid,
				 onChange = function(data)						
								shapeMaker.strokeColor = data.strokeColor;
								shapeMaker.fillColor = data.fillColor;
								shapeMaker.snapToGrid = data.snapToGrid;
								
								defFillColor = data.fillColor;
								defStrokeColor = data.strokeColor;
								defSnapToGrid = data.snapToGrid;
							end});
		end;
		
		local function desanexar()
			if shapeMaker ~= nil then
				shapeMaker:abort();
				shapeMaker = nil;
			end;
			
			SC3UNDO_AtivarUndoHotKey(scene, false);
			UserDrawingDetails_Close(scene);
		end;	
				
		local function getUserDrawingOp(item, opType)
			local canvas = item.canvas;
			
			for i = 1, canvas.opCount, 1 do
				local op = canvas:getOp(i - 1);
				
				if (op ~= nil) and (op.objectType == opType) and (op.name == "") then
					return op;
				end;
			end;
			
			return nil;
		end;
				
		local function getStrokeColorAndFillColorOfSelection()
			for k, v in pairs(selecao) do	
				local pathOp = getUserDrawingOp(k, "opPath");
				
				if pathOp ~= nil then
					return pathOp.strokeColor, pathOp.color, k.snapToGrid;
				else			
					local textOp = getUserDrawingOp(k, "opText");
					
					if textOp ~= nil then
						return textOp.color, "None", k.snapToGrid;
					end;				
				end;
			end;
			
			return "Black", "None", false;
		end;
			
		local transactionForColorChange = nil;
			
		local function applyUserDrawingDetailsColorForSelection(strokeColor, fillColor, snapToGrid)
			local _, aStroke, aFill;
			_, _, _, aStroke = colorToRGBA(strokeColor);
			_, _, _, aFill = colorToRGBA(fillColor);
			
			if aFill < 0.5 and aStroke < 0.5 then
				return;
			end;		
		
			for k, v in pairs(selecao) do												
				scene:pushTransaction(transactionForColorChange);
				
				tryFinally(
					function()
						k.snapToGrid = snapToGrid;
						local pathOp = getUserDrawingOp(k, "opPath");						
						
						if pathOp ~= nil then	
							pathOp.color = fillColor;
							pathOp.strokeColor = strokeColor;
						else
							local textOp = getUserDrawingOp(k, "opText");
							
							if textOp ~= nil and aStroke >= 0.5 then
								textOp.color = strokeColor;								
							end;						
						end;
					end,
					
					function()
						scene:popTransaction();
					end);			
			end;
			
			if transactionForColorChange.__applyChangeTimeout == nil then
				transactionForColorChange.__applyChangeTimeout = setTimeout(
											function()
												transactionForColorChange.__applyChangeTimeout = nil;
												SC3UNDO_AddNDBUndoData(scene, transactionForColorChange:createUndoData());
												transactionForColorChange:commit();												
											end, 1000);
			end;
		end;
			
		local function verificarMenuUserDrawingDetailsForSelected()
			local deveExibir = (qtSelecaoUserDrawings > 0) and (qtSelecaoOutros <= 0);
			
			if deveExibir and not exibindoUserDrawingDetailsForSelection then	
				exibindoUserDrawingDetailsForSelection = true;
				
				local options = {};
				options.strokeColor, options.fillColor, options.snapToGrid = getStrokeColorAndFillColorOfSelection();
				
				if transactionForColorChange == nil then
					transactionForColorChange = scene:newTransaction();
				end;
				
				options.onChange = function (data)
									  applyUserDrawingDetailsColorForSelection(data.strokeColor, data.fillColor, data.snapToGrid);  	
									  defFillColor = data.fillColor;
									  defStrokeColor = data.strokeColor;
								      defSnapToGrid = data.snapToGrid;
								   end;
								   
				UserDrawingDetails_Show(scene, options);								   
				
			elseif not deveExibir and exibindoUserDrawingDetailsForSelection then
				exibindoUserDrawingDetailsForSelection = false;
				UserDrawingDetails_Close(scene);
			end;
		end;
					
		local function addedToSelecao(item)		
			if selecao[item] == nil then
				if item.objectType == "userDrawing" then
					qtSelecaoUserDrawings = qtSelecaoUserDrawings + 1;
				else
					qtSelecaoOutros = qtSelecaoOutros + 1;
				end;
			
				selecao[item] = true;
				verificarMenuUserDrawingDetailsForSelected();
			end;		
		end;
					
		for k, v in pairs(scene.items.selection) do
			addedToSelecao(v);
		end;				
				
		scene.items:listen("onItemSelected",
			function(item)
				addedToSelecao(item);
			end);
			
		scene.items:listen("onItemDeselected",
			function(item)	
				if selecao[item] ~= nil then
					if item.objectType == "userDrawing" then
						qtSelecaoUserDrawings = qtSelecaoUserDrawings - 1;
					else
						qtSelecaoOutros = qtSelecaoOutros - 1;
					end;
				
					selecao[item] = nil;
					verificarMenuUserDrawingDetailsForSelected();		
				end;				
			end);			
	
		scene.viewport:setupToolCategory("userDrawing", lang("userDrawing.categoryTitle"), -9);
		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.freeHand"), 
									 "/icos/freehand.png",
									 0,
									 {selectable=true},
									 
			function()
				anexar(SHAPE_FREE_HAND);
			end, desanexar);		

			
		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.rectangle"), 
									 "/icos/rectangle.png",
									 1,
									 {selectable=true},
									 
			function()
				anexar(SHAPE_RECTANGLE);
			end, desanexar);	
			
			
		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.circle"), 
									 "/icos/circle.png",
									 2,
									 {selectable=true},
									 
			function()
				anexar(SHAPE_ELLIPSE);
			end, desanexar);		

		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.polygon"), 
									 "/icos/polygon.png",
									 3,
									 {selectable=true},
									 
			function()
				anexar(SHAPE_POLYGON);
			end, desanexar);	
			
		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.text"), 
									 "/icos/text.png",
									 4,
									 {selectable=true},
									 
			function()
				anexar(SHAPE_TEXT_POINT);
			end, desanexar);			
			
			
		scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.clearDrawings"), 
									 "/icos/eraser.png",
									 10,
									 {dontFocus=true},
									 
			function()
				limparTodosUserDrawings(false);
			end);	

			scene.viewport:addToolButton("userDrawing", 
		                             lang("userDrawing.clearDrawings.players"), 
									 "/icos/eraserPlayer.png",
									 11,
									 {dontFocus=true},
									 
			function()
				limparTodosUserDrawings(true);
			end);		
	end);	