require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_DrawSelected.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_UserDrawingDetails.lua");
require("rrpgScene_PingerEngine.lua");

	
--[[   PLUGIN para movimentação de itens  ]]--	
	
local MOVSEL_INDEFINIDO = nil;	
local MOVSEL_MOVER = 1;
local MOVSEL_SELECAORETANGULAR = 2;
local MOVSEL_CLICK_OPCOES = 3;
local MOVSEL_PAN = 4;
local MOVSEL_RESIZE = 5;
local MOVSEL_ROTATE = 6;
local MOVSEL_DBL_CLICK = 7;
local MOVSEL_EXEC_MENU = 8;
local MOVSEL_PAN_OR_SELECT = 9;
local MOVSEL_MOVE_OR_UNSELECT = 10;
	
local THRESHOLD_START_MOVMENT = 5;	


	
SceneLib.registerPlugin(
	function (scene, attachment)			
		require("/rrpgScene_Clipboard.dlua");
		require("/rrpgScene_Undo.dlua");		
		local VK = require("vkCodes.dlua");		
	
		-- Variáveis para armazenar informações sobre o "arrastar" dos itens
		local objMouseDown = nil;  -- Qual objeto está sendo arrastado		
		local isMouseDown = false;
		local transaction = scene:newTransaction();
		local vkEscape = 27;
		local vkDelete = 46;	
		
		
		-- rect selection			
		local rectSelectionSX, rectSelectionSY; -- Start X e Start Y do rect Selection, em coordenadas de mundo
		local rectSelectionEX, rectSelectionEY; -- EndX e End Y do rect Selection,  em coordenadas de mundo
		local rectSelectionPainterListener = nil;
		
		local tipoSelMov = MOVSEL_INDEFINIDO; 
		local mouseDownMoveu = false;
		local mouseDownX = nil;		
		local mouseDownY = nil;
		local mouseDownOnAlreadySelected = false;
		local mouseDownSizeRotateOp = nil;		
		
		-- Informações do OnMouseHover de qual objeto e qual sentido/funcionalidade de redimensionamento/rotação está focado
		local objSizeRotate = nil;
		local objIdQuadSizeRotate = nil;
		local sizeRotateCursor = nil;
		
		local localFrmTokenMenu = nil;
		local localFrmSceneMenu = nil;
		local localFrmGraphicItemMenu= nil;
		
		local objsMoving = nil; -- Tabela contendo informações de cada item sendo movimentado
		local objsMovingTrackPath = false;
		local requiredMovPathUnit = false;	
		local __informandoValorBarra = false;
		
		local pinger = NEW_PingerEngine(scene);

		local currentHover = nil; -- token/graphic item com isHover true
		
		local function processarCurrentHover(event)
			local wx, wy = scene.viewport:screenToWorld(event.x, event.y);		
			local objHover = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
		
			if objHover ~= currentHover then
				if currentHover ~= nil then
					currentHover.isHover = false;
					currentHover = nil;
				end;
				
				currentHover = objHover;
				
				if currentHover ~= nil then
					currentHover.isHover = true;
				end;
			end;		
		end;
		
		local function paintRectSelection()
			local vp = scene.viewport;
			local ssx, ssy = vp:worldToScreen(rectSelectionSX, rectSelectionSY);
			local sex, sey = vp:worldToScreen(rectSelectionEX, rectSelectionEY);
			vp:prepareFill("CornflowerBlue");
			vp:fillRect(ssx, ssy, sex, sey, 0.6);
		end;
		
		local function cancelarMovementTrack()
			if objsMoving ~= nil then
				for k, v in pairs(objsMoving) do
					if v.track ~= nil then
						v.track:endTrack();
					end;
				end;
			end;
		end;
	
		local function doInTransaction(callback)
			scene:pushTransaction(transaction);
			
			tryFinally(callback,
				function()
					scene:popTransaction();
				end);
		end;
	
		local function executarMenuInLocoBarrinha(objeto, idxBarrinha)
		
			if __informandoValorBarra then
				return;
			end;
		
			local currValue = objeto["barValue" .. idxBarrinha];
			
			__informandoValorBarra = true;
			
			Dialogs.inputQuery(LANG("scene.digiteUmValor"), lang("scene.valor"),
							   currValue,							
							   function (valorInformado)
								 __informandoValorBarra = false;
								 
								 SC3UNDO_Capture(scene, 
									function()
										local novoValor = valorInformado;
										local oldValor = objeto["barValue" .. idxBarrinha];
										local valorInformadoAsNumber = tonumber(valorInformado);										
									
										if type(valorInformado) == "string" and valorInformadoAsNumber ~= nil then	
											local operador = string.sub(valorInformado, 1, 1);					
											
											if (operador == "+") or (operador == "-") then
												novoValor = oldValor + valorInformadoAsNumber;																							
											end;
										end;
									
										objeto["barValue" .. idxBarrinha] = novoValor;
									end);
									
									scene.viewport:needRepaint();									
							   end, 
							   function ()
								 __informandoValorBarra = false;
							   end, true);
		end;
	
		local function executarMenuInLoco(objeto, idMenu)
			DRAWSELECTED_EnableInLocoMenu(scene, true);			
			
			if idMenu == DS_QUAD_BARRINHA_1 then
				executarMenuInLocoBarrinha(objeto, 1);
			elseif idMenu == DS_QUAD_BARRINHA_2 then
				executarMenuInLocoBarrinha(objeto, 2);
			elseif idMenu == DS_QUAD_BARRINHA_3 then
				executarMenuInLocoBarrinha(objeto, 3);
			end;
		end;
	
		local function keyDown_SelectMove(event)
			if (event.keyCode == vkEscape) and (objMouseDown ~= nil)  then
				-- Cancelar o movimento atual
				transaction:rollback();
				objMouseDown = nil;	
				isMouseDown = false;				
				event.keyCode = 0;
				event.key = "";
				cancelarMovementTrack();
			elseif (event.keyCode == vkDelete) then
				local sel = scene.items.selection;
				
				if #sel > 0 then
					local msg;
					
					if #sel == 1 then
						msg = LANG("scene.ask.deleteOneItem");
					else
						msg = string.format(LANG("scene.ask.deleteMultiItem"), #sel);						
					end;
					
					Dialogs.confirmYesNo(msg, 
						function(confirmado)
							if confirmado then
								SC3UNDO_Capture(scene,
									function()
										for i = 1, #sel, 1 do
											sel[i]:delete();
										end;
									end)															
							end;
						end);
				end;
			elseif (event.keyCode == VK.vkC) and event.ctrlOrCmdKey then
				SC3CLIPBOARD_Copy(scene.items.selection);
				event.keyCode = 0;
				event.key = "";
			elseif (event.keyCode == VK.vkV) and event.ctrlOrCmdKey then
				local pivo = nil;
				
				if mouseDownX ~= nil and mouseDownY ~= nil then
					pivo = {x = mouseDownX, y = mouseDownY};
					pivo.x, pivo.y = scene.viewport:screenToWorld(pivo.x, pivo.y);
				end;
								
				SC3CLIPBOARD_Paste(scene, pivo);
				event.keyCode = 0;
				event.key = "";	
			elseif (event.keyCode == VK.vkZ) and event.ctrlOrCmdKey then
				SC3UNDO_Undo(scene);
				event.keyCode = 0;
				event.key = "";	
			end;
		end;
		
		--local oldRoundAngleOfQuad = nil;
		
		local function processMousePos_ResizeRotation(event)
			-- Verificar cursor
			
			local expansion = nil;
			
			if event.isTouch then
				local wx, wy = scene.viewport:screenToWorld(event.x, event.y);			
				-- Descobrir qual item se encontra neste ponto
				local objetoNaPosicao = scene.items:itemAtPoint(wx, wy, scene.workingLayer);		
				
				if objetoNaPosicao == nil then
					expansion = 15;
				else
					expansion = 2;
				end;
			end;
			
			local item, idQuad, _, angleOfQuad = DRAWSELECTED_HitTest(scene, event.x, event.y, expansion);
							
			if item ~= nil then
				local cursor = "default";				
				local roundAngleOfQuad = math.tointeger(math.floor((angleOfQuad / 45) + 0.5) * 45);

				if DS_QUADS_MENUS[idQuad] ~= nil then
					cursor = "handpoint";
				elseif (idQuad == DS_QUAD_ROTATION) then
					cursor = "cross";	
				elseif (roundAngleOfQuad == 135) or (roundAngleOfQuad == 315) then
					cursor = "sizeNWSE";
				elseif (roundAngleOfQuad == 90) or (roundAngleOfQuad == 270) then
					cursor = "sizeNS";
				elseif (roundAngleOfQuad == 45) or (roundAngleOfQuad == 225) then
					cursor = "sizeNESW";						
				elseif (roundAngleOfQuad == 0) or (roundAngleOfQuad == 180) or (roundAngleOfQuad == 360) then	
					cursor = "sizeWE";
				end;
				
				sizeRotateCursor = cursor;
				scene.viewport.cursor = cursor;
			else
				scene.viewport.cursor = "default";
			end;
			
			objSizeRotate = item;
			objIdQuadSizeRotate = idQuad;		
		end;
		
		local function mouseDown_SelectMove(event)		
			if isMouseDown then
				return;
			end;
		
			isMouseDown = true;					
			mouseDownMoveu = false;
			mouseDownX = event.x;
			mouseDownY = event.y;
			
			local _lastMouseDown = rawget(scene, "_lastMouseDown");
					
			if _lastMouseDown == nil then
				_lastMouseDown = {};
				rawset(scene, "_lastMouseDown", _lastMouseDown);
			end;
			
			_lastMouseDown.x, _lastMouseDown.y = scene.viewport:screenToWorld(mouseDownX, mouseDownY);
			
			mouseDownOnAlreadySelected = false;
			tipoSelMov = MOVSEL_INDEFINIDO;
					
			-- Converter para métrica de mundo a posição do clique
			local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
			
			-- Descobrir qual item se encontra neste ponto
			objMouseDown = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
						
			if objMouseDown == nil then
				processMousePos_ResizeRotation(event);
			else
				scene.viewport.cursor = "default";
			end;
			
			DRAWSELECTED_EnableInLocoMenu(scene, false);
			processarCurrentHover(event);
													
			pinger:resetMyPing();
						
			if event.button == "left" then					
				if not event.isTouch then
					if event.altKey then
						pinger:makePingAt(wx, wy, event.shiftKey);
					else
						pinger:startTimerToBuildMyPing(wx, wy, event.shiftKey);
					end;
				end;
			
				if objSizeRotate ~= nil and objIdQuadSizeRotate ~= nil then
					-- Cursor está em cima de um quadradinho de redimensionamento ou rotação de tokens				
					objMouseDown = objSizeRotate;
					mouseDownSizeRotateOp = objIdQuadSizeRotate;
					
					if DS_QUADS_MENUS[objIdQuadSizeRotate] ~= nil and objSizeRotate.objectType == "token"  then
						tipoSelMov = MOVSEL_EXEC_MENU;
						DRAWSELECTED_EnableInLocoMenu(scene, true);	
					elseif objIdQuadSizeRotate == DS_QUAD_ROTATION then
						tipoSelMov = MOVSEL_ROTATE; -- Em cima de um quadradinho de rotacionamento
					else	
						tipoSelMov = MOVSEL_RESIZE;
					end;			
				elseif objMouseDown ~= nil then	
					-- Existe um item nesta posição.	
					
					if event.isTouch and not event.ctrlOrCmdKey and not event.shiftKey  then
						-- Preferir PAN do que selecionar
						
						if objMouseDown.selected then
							tipoSelMov = MOVSEL_MOVE_OR_UNSELECT;
						else
							tipoSelMov = MOVSEL_PAN_OR_SELECT;
						end;
					else				
						if not event.ctrlOrCmdKey and not event.shiftKey then
							if not objMouseDown.selected then
								scene.items:clearSelection();
								objMouseDown.selected = true;
								
								if objMouseDown.objectType == "token" then
									DRAWSELECTED_EnableInLocoMenu(scene, true);							
								end;
							else
								mouseDownOnAlreadySelected = true;
							end;
						end;
						
						tipoSelMov = MOVSEL_MOVER;
					end;
				elseif event.isTouch then
					tipoSelMov = MOVSEL_PAN;				
					scene.items:clearSelection();				
					INERTIAL_pointerDown(scene.viewport, event);
				else												
					if not event.shiftKey and not event.ctrlOrCmdKey then
						scene.items:clearSelection();
					end;	

					if event.button == "right" then
						tipoSelMov = MOVSEL_CLICK_OPCOES;
					else
						tipoSelMov = MOVSEL_SELECAORETANGULAR;
					end;
				end;
			elseif event.button == "right" then
				tipoSelMov = MOVSEL_CLICK_OPCOES; -- Posteriormente pode virar MOVSEL_PAN
				
				if objMouseDown ~= nil then	
					-- Existe um item nesta posição.	
					
					if not event.ctrlOrCmdKey and not event.shiftKey then
						if not objMouseDown.selected then
							scene.items:clearSelection();
							objMouseDown.selected = true;
						else
							mouseDownOnAlreadySelected = true;
						end;
					end;	
				end;	
			end;
		end
		
		local function mouseDblClick_SelectMove(event)				
			pinger:resetMyPing();
			
			tipoSelMov = MOVSEL_DBL_CLICK;
					
			-- Converter para métrica de mundo a posição do clique
			local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
			
			-- Descobrir qual item se encontra neste ponto
			local objDblClick = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
			
			if (objDblClick ~= nil) then
				if (objDblClick.objectType == "token") then
					setTimeout(
						function()
							local selecao = {objDblClick};
							local frm = GUI.newForm("frmTokenProps");
							frm:prepareForShow(selecao, scene);									  
							frm:show();
						end, 1);
				elseif objDblClick.objectType == "userDrawing" then
					local textOp = nil;
					local canvas = objDblClick.canvas;
					
					for i = 1, canvas.opCount, 1 do
						local op = canvas:getOp(i - 1);
						
						if op.objectType == "opText" then
							textOp = op;
							break;
						end;
					end;
					
					if textOp ~= nil then
						-- Editar o texto de um user drawing
						Dialogs.inputQuery('Texto', 'Digite o texto', textOp.text, 
							function(texto)
								SC3UNDO_Capture(scene,
									function()
										textOp.text = texto;
									end);								
							end);
					end;
				end;							
			end;
		end;		
		
			
			local function iniciarMOVER(event)
				if not requiredMovPathUnit then
					require("rrpgScene_MovementPath.dlua");
				end;
			
				cancelarMovementTrack();
			
				if (event.ctrlOrCmdKey or event.shiftKey) and (objMouseDown ~= nil) then
					objMouseDown.selected = true;
				end;
				
				local wx, wy = scene.viewport:screenToWorld(event.x, event.y);				

				objsMoving = {};
				objsMovingTrackPath = false;
				
				for k, v in pairs(scene.items.selection) do
					local objMovendo = v;				
					local info = {};					
					local centerX, centerY = objMovendo:getCenter(false);
					info.startX = objMovendo.x;
					info.startY = objMovendo.y;
					info.selecaoX = wx - centerX;  --  Em que ponto do item o usuário clicou (em relação ao centro do item)
					info.selecaoY = wy - centerY;				
						
					if not objsMovingTrackPath and (v.layer == "tokens") then
						objsMovingTrackPath = true;
					end;						

					if objsMovingTrackPath and (objMovendo.objectType == "token") then
						info.track = MOVETRACK_newMoveTrack(scene, objMovendo);
						info.track:startPaint();
					end;
					
					objsMoving[v] = info;					
				end;
			end;
			
			local function iniciarSELECAO_RETANGULAR(event)
				if not event.shiftKey and not event.ctrlOrCmdKey then
					scene.items:clearSelection();
				end;
																
				rectSelectionSX, rectSelectionSY = scene.viewport:screenToWorld(mouseDownX, mouseDownY);
				rectSelectionEX, rectSelectionEY = scene.viewport:screenToWorld(event.x, event.y);				 
				
				if rectSelectionPainterListener == nil then
					rectSelectionPainterListener = scene.viewport:listen("onAfterDrawLayers", paintRectSelection);
				end;
								
			end;
					local __resizeInfos = nil; -- Tabela contendo informações sobre redimensionamento de cada item selecionado
					
			local function iniciarREDIMENSIONAMENTO(event)							

				__resizeInfos = {};
				local startWx, startWy = scene.viewport:screenToWorld(mouseDownX, mouseDownY);
				
				for k, v in pairs(scene.items.selection) do
					local objResizing = v;	

					if v.objectType ~= "token" or scene.isGM then
						local info = {};
						info.startX = objResizing.x;
						info.startY = objResizing.y;
						info.startWidth = objResizing.width;
						info.startHeight = objResizing.height;
						
						info.centerX = objResizing.x + objResizing.width / 2;
						info.centerY = objResizing.y + objResizing.height / 2;
						info.startWx, info.startWy = SceneLib.Math.rotatePoint(startWx, startWy, -objResizing.rotation, 0, 0);									
						info.op = mouseDownSizeRotateOp;
						info.startBounds = {};
						info.startBounds.left, info.startBounds.top, info.startBounds.right, info.startBounds.bottom = objResizing:getBounds();
						info.startBounds.width =  info.startBounds.right -  info.startBounds.left;
						info.startBounds.height =  info.startBounds.bottom -  info.startBounds.top;
						info.rotation = objResizing.rotation;
						
						info.endBounds = {};					
						info.endBounds.left = info.startBounds.left;
						info.endBounds.top = info.startBounds.top;
						info.endBounds.right = info.startBounds.right;
						info.endBounds.bottom = info.startBounds.bottom;
						
						if info.startBounds.height ~= 0 then
							info.startBounds.aspect = info.startBounds.width / info.startBounds.height;
						else	
							info.startBounds.aspect = 1.0;
						end;
					
						__resizeInfos[v] = info;
					end;
				end;	
				 
				scene.viewport.cursor = sizeRotateCursor or "default";
			end;
			
			local function processarREDIMENSIONAMENTO(event)			
				if __resizeInfos == nil then
					return;
				end;
				
				local _endWx, _endWy = scene.viewport:screenToWorld(event.x, event.y);
				
				-- Dados do objeto principal
				local objResizing = objMouseDown;				
				local info = __resizeInfos[objResizing]; 
				
				if info == nil then
					info = __resizeInfos[1];					
					
					if info == nil then
						return;
					end;
				end;
				
				local endWx, endWy = SceneLib.Math.rotatePoint(_endWx, _endWy, -info.rotation, 0, 0);
				local difX = endWx - info.startWx;					
				local difY = endWy - info.startWy;				
				
				-- Para cada objeto sendo redimensionado
				
				for k, v in pairs(__resizeInfos) do
					objResizing = k;				
					info = v;
										
					local newLeft = info.startBounds.left;
					local newTop = info.startBounds.top;
					local newRight = info.startBounds.right;
					local newBottom = info.startBounds.bottom;					
					local aspect = info.startBounds.aspect;	
					local oldCenterX = newLeft + (newRight - newLeft) / 2;
					local oldCenterY = newTop + (newBottom - newTop) / 2;

					if aspect == 0 then
						aspect = 1.0;
					end;
									
					local difForCalcAspect = (difX + difY) * 0.5;		

					local difXComAspecto;
					local difYComAspecto;
					
					if aspect >= 1 then
						difXComAspecto = difForCalcAspect;
						difYComAspecto = difForCalcAspect / aspect;
					else
						difYComAspecto = difForCalcAspect;
						difXComAspecto = difForCalcAspect * aspect;
					end;
					
					local invDifForCalcAspect = (difX - difY) * 0.5;	
					local invDifXComAspecto;
					local invDifYComAspecto;
					
					if aspect <= 1 then
						invDifXComAspecto = invDifForCalcAspect * aspect;
						invDifYComAspecto = invDifForCalcAspect;
					else
						invDifXComAspecto = invDifForCalcAspect;
						invDifYComAspecto = invDifForCalcAspect / aspect;
					end;
	
					if info.op == DS_QUAD_BOTTOM_RIGHT then
						newRight = newRight + difXComAspecto;
						newBottom = newBottom + difYComAspecto;			
					elseif info.op == DS_QUAD_TOP_LEFT then
						newLeft = newLeft + difXComAspecto;
						newTop = newTop + difYComAspecto;	
					elseif info.op == DS_QUAD_TOP_CENTER then
						newTop = newTop + difY;
					elseif info.op == DS_QUAD_TOP_RIGHT then
						newRight = newRight + invDifXComAspecto;
						newTop = newTop - invDifYComAspecto;
					elseif info.op == DS_QUAD_BOTTOM_LEFT then
						newLeft = newLeft + invDifXComAspecto;
						newBottom = newBottom - invDifYComAspecto;
					elseif info.op == DS_QUAD_CENTER_LEFT then
						newLeft = newLeft + difX;						
					elseif info.op == DS_QUAD_CENTER_RIGHT then						
						newRight = newRight + difX;											
					elseif info.op == DS_QUAD_BOTTOM_CENTER then						
						newBottom = newBottom + difY;						
					end;			                                                                         																
					
					local newWidth = (newRight - newLeft);
					local newHeight = (newBottom - newTop);
					
					local newCenterX = newLeft + newWidth / 2;
					local newCenterY = newTop + newHeight / 2;										

					local deltaCenterX = newCenterX - oldCenterX;
					local deltaCenterY = newCenterY - oldCenterY;									
					local deltaRotatedCenterX, deltaRotatedCenterY = SceneLib.Math.rotatePoint(deltaCenterX, deltaCenterY, info.rotation, 0, 0);		
					local novoCentroX = oldCenterX + deltaRotatedCenterX;
					local novoCentroY = oldCenterY + deltaRotatedCenterY;
					local novoX = novoCentroX - newWidth / 2;
					local novoY = novoCentroY - newHeight / 2;

					doInTransaction(
						function()
							objResizing:setBounds(novoX, novoY, novoX + newWidth, novoY + newHeight);
						end);
							
					info.endBounds.left = novoX;
					info.endBounds.top = novoY;
					info.endBounds.right = novoX + newWidth;
					info.endBounds.bottom = novoY + newHeight;					
				end;
			end;
						
						local function roundCellSize(size)
							local parteInteira = math.floor(size);

							if parteInteira >= 2 then
								return math.floor(size + 0.5);
							else
								local parteFracionaria = size - parteInteira;
								parteFracionaria = math.floor(parteFracionaria * 2 + 0.5) / 2; 
								local newSize = parteInteira + parteFracionaria;
								
								if newSize >= 0.5 then
									return newSize;
								else
									return 0.5;								
								end;							
							end;
						end;
						
			local function finalizarREDIMENSIONAMENTO(event)							

				if __resizeInfos ~= nil then	
					local ctrlZStuff = {};
				
					for k, v in pairs(__resizeInfos) do
						local objResizing = k;				
						local undoItem = {};
						
						if objResizing.snapToGrid then
							-- Agarrar ao grid
						
							local width = roundCellSize(objResizing.width / scene.grid.cellSize) * scene.grid.cellSize;
							local height = roundCellSize(objResizing.height / scene.grid.cellSize) * scene.grid.cellSize;
							local growingW = width - objResizing.width;
							local growingH = height - objResizing.height;
							local rotatedGrowingW, rotatedGrowingH = SceneLib.Math.rotatePoint(growingW, growingH, objResizing.rotation, 0, 0);										
										
							doInTransaction(
								function()
									objResizing:beginUpdate();
									
									tryFinally(
										function()
											objResizing.width = width;
											objResizing.height = height;
											objResizing.x = objResizing.x - rotatedGrowingW / 2;
											objResizing.y = objResizing.y - rotatedGrowingH / 2;							
											local cx, cy = objResizing:getCenter();							
											local newCellI, newCellJ = scene.grid:worldToCell(cx, cy);
											local centerWX, centerWY = scene.grid:cellToWorld(newCellI, newCellJ);							
											objResizing:setCenter(centerWX, centerWY);
										end,
										
										function()										
											objResizing:endUpdate();									
										end);
								end);
						end;
						
						undoItem.facade = SC3UNDO_GetFacade(objResizing);
						undoItem.x = v.startX;
						undoItem.y = v.startY;
						undoItem.width = v.startWidth;
						undoItem.height = v.startHeight;
						ctrlZStuff[#ctrlZStuff + 1] = undoItem;
					end;								
				
					SC3UNDO_AddNDBUndoData(scene, transaction:createUndoData());
					transaction:commit();	
					scene:sendDelayedUpdates();						
				end;		

				__resizeInfos = nil;
			end;							
			
				local function getAngleBetweenPoints(x1, y1, x2, y2)
					local angle = math.atan(-(y1 - y2), x1 - x2) * 180 / math.pi;
					
					if angle >= 0 then
						angle = angle - math.floor(angle / 360) * 360;
					else
						angle = 360 + (angle - math.ceil(angle / 360) * 360);
					end;	
					
					return angle;
				end;
			
				local __rotateInfos = nil;
			
			local function iniciarROTACAO(event)			
				__rotateInfos = {};
				local startWx, startWy = scene.viewport:screenToWorld(mouseDownX, mouseDownY);
				
				for k, v in pairs(scene.items.selection) do
					local objRotating = v;				
					local info = {};
					info.startRotation = objRotating.rotation;
					info.centerX = objRotating.x + objRotating.width / 2;
					info.centerY = objRotating.y + objRotating.height / 2;
					info.rotation = objRotating.rotation;
					info.startDifX = startWx - info.centerX;
					info.startDifY = startWy - info.centerY;
					info.startMouseAngle = getAngleBetweenPoints(0, 0, info.startDifX, info.startDifY);
									
					__rotateInfos[v] = info;
				end;	
				 
				scene.viewport.cursor = "cross";
			end;
			
			local function processarROTACAO(event)
				if __rotateInfos == nil then
					return;
				end;
				
				local endWx, endWy = scene.viewport:screenToWorld(event.x, event.y);
				
				-- Dados do objeto principal
				local objRotating = objMouseDown;				
				local info = __rotateInfos[objRotating]; 
				local difX = endWx - info.centerX;					
				local difY = endWy - info.centerY;	
				local currentMouseAngle = getAngleBetweenPoints(0, 0, difX, difY);
				local deltaAngle = currentMouseAngle - info.startMouseAngle;
				
				-- Para cada objeto sendo redimensionado
				
				for k, v in pairs(__rotateInfos) do
					objRotating = k;				
					info = v;

					doInTransaction(
						function()
							local newAngle = info.rotation + deltaAngle;
							
							if newAngle >= 0 then
								newAngle = newAngle - math.floor(newAngle / 360) * 360;
							else
								newAngle = 360 + (newAngle - math.ceil(newAngle / 360) * 360);
							end;										
							
							objRotating.rotation = newAngle;	
						end);
				end;
			end;
			
			local function finalizarROTACAO(event)	
				if __rotateInfos ~= nil then								
					local ctrlZStuff = {};
				
					for k, v in pairs(__rotateInfos) do
						local objRotating = k;				
						local info = v;
						
						if objRotating.snapToGrid then
							-- Agarrar ao grid		

							doInTransaction(
								function()
									local grausAArredondar = 15;
									objRotating.rotation = math.floor((objRotating.rotation / grausAArredondar) + 0.5) * grausAArredondar;								
								end)					
						end;
						
						local undoItem = {};
						undoItem.facade = SC3UNDO_GetFacade(objRotating);
						undoItem.rotation = info.startRotation;
						ctrlZStuff[#ctrlZStuff + 1] = undoItem;
					end;								
				
					SC3UNDO_AddNDBUndoData(scene, transaction:createUndoData());				
					transaction:commit();
					scene:sendDelayedUpdates();	
				end;		

				__rotateInfos = nil;
			end;
			
			local function processarMOVER(event)
				if objMouseDown ~= nil then
					-- Mouse moveu e existe um item selecionado
					-- Converter a posição clicada para métrica de mundo
					local originalWx, originalWy = scene.viewport:screenToWorld(event.x, event.y);
					local rastrearColisaoParede = scene.fogOfWar.enabled and not scene.isViewingAsGM;
					--local rastrearColisaoParede = scene.fogOfWar.enabled;
										
					for k, v in pairs(objsMoving) do
						local objMovendo = k;
						local wx = originalWx;
						local wy = originalWy;
										
								
						-- Calcular o novo centro do item
						local centerX, centerY; -- = objMovendo:getCenter(false);
						centerX = wx - v.selecaoX;
						centerY = wy - v.selecaoY;	
						
						--[[if objMovendo.snapToGrid then
							-- Movimento agarrado ao grid
							-- Arredondar a posição do mouse para o centro de uma célula mais
							-- próxima.
							local newCellI, newCellJ = scene.grid:worldToCell(centerX, centerY);
							centerX, centerY = scene.grid:cellToWorld(newCellI, newCellJ);
						end;]]--						
						
						local rastrearColisaoNeste = rastrearColisaoParede and objMovendo.objectType == "token";

						if rastrearColisaoNeste then
							local oldCX, oldCY = objMovendo.x + objMovendo.width / 2, objMovendo.y + objMovendo.height / 2;
							local raio = math.min(objMovendo.width, objMovendo.height) * 0.5 * 0.3;
																				
							objMovendo:beginUpdate();
							
							tryFinally(
								function()
									doInTransaction(
										function()
											objMovendo:setCenter(centerX, centerY);	
											
											if objMovendo.snapToGrid then
												objMovendo:doSnapToGrid();									
											end;										
											
											local newCX, newCY = objMovendo.x + objMovendo.width / 2, objMovendo.y + objMovendo.height / 2;
											local direcaoX, direcaoY = newCX - oldCX, newCY - oldCY;	
											
											local colide, cXColisao, cYColisao = scene.fogOfWar:testCircleMovementCollisionVsOpaqueAreas(oldCX, oldCY, raio, direcaoX, direcaoY);
											
											if colide then
												local dX, dY = cXColisao - oldCX,  cYColisao - oldCY;
												local distance = math.sqrt(dX * dX + dY * dY);	

												if distance > 0 then
													dX = dX / distance;
													dY = dY / distance;
												end;
												
												distance = math.max(distance - raio, 0);
												local mCX = oldCX + dX * distance;
												local mCY = oldCY + dY * distance;
							
												objMovendo:setCenter(mCX, mCY, false);	
											end;	
										end);	
								end, 
								function()
									objMovendo:endUpdate();
								end);																				
						else
						-- Setar o novo centro do item. Gravar na transação local.					
							doInTransaction(
								function()
									objMovendo:setCenter(centerX, centerY, false);	
									
									if objMovendo.snapToGrid then
										objMovendo:doSnapToGrid();									
									end;
								end);												
						end;

						if objsMovingTrackPath and (v.track ~= nil) then
							v.track:trackNewPosition(rastrearColisaoNeste);
						end;
					end;
				end			
			end;
			
			local function processarSELECAO_RETANGULAR(event)
				rectSelectionEX, rectSelectionEY = scene.viewport:screenToWorld(event.x, event.y);
				scene.viewport:needRepaint();
			end;
			
			local function finalizarMOVER(event)
				if not mouseDownMoveu then
								
					if event.ctrlOrCmdKey or event.shiftKey then
						-- Permutar seleção
						
						if objMouseDown ~= nil then
							objMouseDown.selected = not objMouseDown.selected;
						end;
					elseif mouseDownOnAlreadySelected then
						-- Selecionar um item
						scene.items:clearSelection();
						
						if objMouseDown ~= nil then
							objMouseDown.selected = true;
						end;
					else
						if objMouseDown ~= nil and objMouseDown.objectType == "token" then
							DRAWSELECTED_EnableInLocoMenu(scene, true);
						end;
					end;
				else
					-- Finalizar movimentação de itens do scene
					if objsMoving ~= nil then	
					
						if objMouseDown ~= nil and objMouseDown.objectType == "token" then
							DRAWSELECTED_EnableInLocoMenu(scene, true);
						end;						
						
						doInTransaction(
							function()
								for k, v in pairs(objsMoving) do											
									if v.track ~= nil then								
										MOVHIST_AddTrackHistory(k, v.track);														
										v.track:endTrack();
										v.track = nil;
									end;
								end;							
							end);
						
						SC3UNDO_AddNDBUndoData(scene, transaction:createUndoData());						
						transaction:commit();		
						scene:sendDelayedUpdates();						
					end;				
				end;	

				objsMoving = nil;
			end;
			
			local function finalizarSELECAO_RETANGULAR(event)
				rectSelectionEX, rectSelectionEY = scene.viewport:screenToWorld(event.x, event.y);

				local itensNoRect = scene.items:enumInRect({left=rectSelectionSX, top=rectSelectionSY,
															right=rectSelectionEX, bottom=rectSelectionEY},
														   scene.workingLayer);
											
				local oldSelection = scene.items.selection;
				local oldSelectionMap = {};
				
				for i = 1, #oldSelection, 1 do 
					oldSelectionMap[oldSelection[i]] = true;
				end;
											
				if not event.shiftKey and not event.ctrlOrCmdKey then
					scene.items:clearSelection();
				end;
				
				local deveAtivarInLocoMenu = false;
				
				for k, v in pairs(itensNoRect) do
					if oldSelectionMap[v] == nil then
						deveAtivarInLocoMenu = true;
					end
					
					v.selected = true;					
				end;										
				
				if deveAtivarInLocoMenu then
					DRAWSELECTED_EnableInLocoMenu(scene, true);				
				end;
			end;		
			
			local function executarMENU(event)
				local frm;
				local itemAtPoint = nil;
				local selection = scene.items.selection;
				
				if event ~= nil then
					local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
					itemAtPoint = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
					
					if (selection == nil or #selection == 0) and itemAtPoint ~= nil then
						selection = {itemAtPoint};
					end;
				else
					for k, v in pairs(selection) do
						itemAtPoint = v;
						
						if itemAtPoint ~= nil then
							break;
						end;											
					end;
				end;
				
				
				if itemAtPoint ~= nil then
					-- Menu de Tokens ou de user drawing

					local uniqueType = itemAtPoint.objectType;
					
					for i = 1, #selection, 1 do
						local o = selection[i];
						
						if uniqueType ~= nil and uniqueType ~= o.objectType then
							uniqueType = nil;
						end;
					end;
							
					if uniqueType == "token" then
						-- Apresentar menu de Tokens
						
						if localFrmTokenMenu == nil then			
							local GUI = require("gui.lua");
							frm = GUI.newForm("frmTokenMenu");
							frm.placement = "mouse";
							localFrmTokenMenu = frm;
						else
							frm = localFrmTokenMenu;
						end;
					else
						-- Apresentar menu de graphic item genérico
						
						if localFrmGraphicItemMenu == nil then			
							local GUI = require("gui.lua");
							frm = GUI.newForm("frmGraphicItemMenu");
							frm.placement = "mouse";
							localFrmGraphicItemMenu = frm;
						else
							frm = localFrmGraphicItemMenu;
						end;					
					end;
				else
					-- Menu do Scene	
					if localFrmSceneMenu == nil then			
						local GUI = require("gui.lua");
						frm = GUI.newForm("frmSceneMenu");
						frm.placement = "mouse";
						localFrmSceneMenu = frm;
					else
						frm = localFrmSceneMenu;
					end;					
				end;
								
				if (frm ~= nil) then
					frm:prepareForShow(selection, scene);				
					frm:show();
				end;
			end;				
			
		local function mouseMove_SelectMove(event)			
			processarCurrentHover(event);
			
			if tipoSelMov ~= MOVSEL_DBL_CLICK then								
				if isMouseDown then			
					if (tipoSelMov == MOVSEL_PAN)  then
					
						-- Realizar panning				
						INERTIAL_pointerMove(scene.viewport, event);
					else					
						if not mouseDownMoveu then										
							if (math.abs(mouseDownX - event.x) > THRESHOLD_START_MOVMENT) or
							   (math.abs(mouseDownY - event.y) > THRESHOLD_START_MOVMENT) then					   
								pinger:resetMyPing();
								mouseDownMoveu = true;								
								MOVHIST_SetDrawEnabled(scene, "selMoveProcessing", false);
								
								if transaction ~= nil then
									transaction:rollback();
								end;
								
								DRAWSELECTED_EnableInLocoMenu(scene, false);
								
								transaction = scene:newTransaction();
								
								-- Preprocessar alguns tipoSelMov
								
								if tipoSelMov == MOVSEL_PAN_OR_SELECT then
									tipoSelMov = MOVSEL_PAN;
									scene.items:clearSelection();									
									INERTIAL_pointerDown(scene.viewport, event);
								elseif tipoSelMov == MOVSEL_MOVE_OR_UNSELECT then
									tipoSelMov = MOVSEL_MOVER;
								end;								
								
								if tipoSelMov == MOVSEL_MOVER then																		
									event.x = mouseDownX;
									event.y = mouseDownY;											
									iniciarMOVER(event);									
								elseif tipoSelMov == MOVSEL_SELECAORETANGULAR then
									iniciarSELECAO_RETANGULAR(event);
								elseif tipoSelMov == MOVSEL_RESIZE then
									iniciarREDIMENSIONAMENTO(event);
								elseif tipoSelMov == MOVSEL_ROTATE then
									iniciarROTACAO(event);
								elseif tipoSelMov == MOVSEL_CLICK_OPCOES then
									-- Era para descobrir opções, mas agora é para fazer pan pois moveu d+
									tipoSelMov = MOVSEL_PAN;
									INERTIAL_pointerDown(scene.viewport, event);	
									scene.viewport.cursor = "size";								
								end;
							end;
						else
							if tipoSelMov == MOVSEL_MOVER then
								processarMOVER(event);
							elseif tipoSelMov == MOVSEL_SELECAORETANGULAR then
								processarSELECAO_RETANGULAR(event);
							elseif tipoSelMov == MOVSEL_RESIZE then
								processarREDIMENSIONAMENTO(event);
							elseif tipoSelMov == MOVSEL_ROTATE then
								processarROTACAO(event);
							end
						end;
					end;
				else
					processMousePos_ResizeRotation(event);
				end;
			end;
		end;				
		
		-- Manipular o evento onMouseUp para parar de arrastar o item
		local function mouseUp_SelectMove (event)
			processarCurrentHover(event);
			pinger:resetMyPing();
		
			if isMouseDown then			
				isMouseDown = false;
				
				if tipoSelMov == MOVSEL_MOVER then
					finalizarMOVER(event);
				elseif (tipoSelMov == MOVSEL_SELECAORETANGULAR) and mouseDownMoveu then
					finalizarSELECAO_RETANGULAR(event);					
				elseif (tipoSelMov == MOVSEL_RESIZE) and mouseDownMoveu then
					finalizarREDIMENSIONAMENTO(event);
				elseif (tipoSelMov == MOVSEL_ROTATE) and mouseDownMoveu then
					finalizarROTACAO(event);
				elseif (tipoSelMov == MOVSEL_CLICK_OPCOES) then
					if (event.ctrlOrCmdKey or event.shiftKey) and (objMouseDown ~= nil) then
						objMouseDown.selected = true;
					end;				
				
					executarMENU(event);
				elseif (tipoSelMov == MOVSEL_EXEC_MENU) and  (objIdQuadSizeRotate ~= nil) and (objSizeRotate ~= nil) then
					executarMenuInLoco(objSizeRotate, objIdQuadSizeRotate);
				elseif tipoSelMov == MOVSEL_PAN_OR_SELECT then
					-- Se chegou ate aqui e ainda está em MOVSEL_PAN_OR_SELECT, é porque o usuário
					-- Não mexeu e quer selecionar ao invés de pan
					
					if objMouseDown ~= nil then
						scene.items:clearSelection();
						objMouseDown.selected = true;
						
						if objMouseDown.objectType == "token" then
							DRAWSELECTED_EnableInLocoMenu(scene, true);							
						end;						
					end;
				elseif tipoSelMov == MOVSEL_MOVE_OR_UNSELECT then
					-- Se chegou ate aqui e ainda está em MOVSEL_MOVE_OR_UNSELECT, é porque o usuário
					-- Não mexeu e quer tirar a seleção de um item.	

					if objMouseDown ~= nil then
						objMouseDown.selected = false;
						
						if objMouseDown.objectType == "token" then
							DRAWSELECTED_EnableInLocoMenu(scene, false);							
						end;
					end;
				end;
			end;	
									
			
			if rectSelectionPainterListener ~= nil then
				scene.viewport:unlisten(rectSelectionPainterListener);
				rectSelectionPainterListener = nil;				
				scene.viewport:needRepaint();
			end;			
			
			if (tipoSelMov == MOVSEL_PAN) then
				INERTIAL_pointerUp(scene.viewport, event);
			end;
			
			tipoSelMov = MOVSEL_INDEFINIDO;
			objMouseDown = nil;
			
			MOVHIST_SetDrawEnabled(scene, "selMoveProcessing", nil);	
				
			if transaction ~= nil then
				transaction:rollback();
			end;
		end;		

		local function longTap_SelectMove(x, y)
			executarMENU({x=x, y=y});
			return true;
		end;

		local listenerMouseDown;
		local listenerMouseMove;
		local listenerMouseUp;
		local listenerMouseDblClick;
		local listenerKeyDown;
		local listenerLongTap;
		
		scene.viewport:setupToolCategory("pointer", lang("scene.pointerClass"), -10);
		scene.viewport:addToolButton("pointer", 
									 lang("scene.arrowCursor"),		                             
									 "/icos/mousePointer.png",
									 -5,
									 {selectable=true, defaultOfCategory=true},
									 
			function()
				-- Activated Select/Move
				listenerMouseDown = scene.viewport:listen("onMouseDown", mouseDown_SelectMove);
				listenerMouseMove = scene.viewport:listen("onMouseMove", mouseMove_SelectMove);
				listenerMouseUp = scene.viewport:listen("onMouseUp", mouseUp_SelectMove);
				listenerKeyDown = scene.viewport:listen("onKeyDown", keyDown_SelectMove);
				listenerLongTap = scene.viewport:listen("onGestureLongTap", longTap_SelectMove);
				listenerMouseDblClick = scene.viewport:listen("onMouseDblClick", mouseDblClick_SelectMove);
				scene.viewport.cursor = "default";
				
				INERTIAL_Start(scene.viewport);
				TOUCH_NAV_Start(scene.viewport);
				
				MOVHIST_ToolEnable(scene, true);
			end,
			
			function()
				-- Deactivated Select/Move
				scene.viewport.cursor = "default";
				scene.viewport:unlisten(listenerMouseDown);
				scene.viewport:unlisten(listenerMouseMove);
				scene.viewport:unlisten(listenerMouseUp);		
				scene.viewport:unlisten(listenerKeyDown);		
				scene.viewport:unlisten(listenerLongTap);			
				scene.viewport:unlisten(listenerMouseDblClick);			
 
				INERTIAL_Stop(scene.viewport);		
				TOUCH_NAV_Stop(scene.viewport);		
				tipoSelMov = MOVSEL_INDEFINIDO;
				
				if currentHover ~= nil then
					currentHover.isHover = false;
					currentHover = nil;
				end;
				
				MOVHIST_ToolEnable(scene, false);
				DRAWSELECTED_EnableInLocoMenu(scene, false);
			end);				
		
	end);	