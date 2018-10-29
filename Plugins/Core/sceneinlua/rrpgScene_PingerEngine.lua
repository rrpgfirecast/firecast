require("scene.lua");
require("utils.lua");
require("firecast.lua")


PING_NOTIFICATION_BROADCAST_MESSAGE = "sc3_ping_notify";
PING_TIMEOUT_START_PING = 700;
PING_TIMEOUT_CHANGE_IDEA = 700;

local PING_DEFAULT_THICK = 0.2;
local PING_TO_CONFIRM_THICK = PING_DEFAULT_THICK * 0.5;
local PING_DEFAULT_VELOCITY = 1.8;
local PING_TO_CONFIRM_VELOCITY = PING_DEFAULT_VELOCITY * 0.3;

local PING_ANIM_FRAMES_PER_SECOND = 50;

local PING_START_STEP = 0.2;
local PING_ANIM_DURATION = 3000;

local PING_ANIMATION_INTERVAL_FRAME = 1000 / PING_ANIM_FRAMES_PER_SECOND;

local PING_FADE_VELOCITY = 0.16;
local PING_START_OPACITY = 1.0;

local _pinger_id_generator = 0;

local function newSinglePing(scene, pinger, worldX, worldY, centralizeScreen, text)
	local ping = {};
	local animStep = PING_START_STEP;
	local animStepOpacity = PING_START_OPACITY;
	local animThick = PING_DEFAULT_THICK;
	local animVelocity = PING_DEFAULT_VELOCITY;	
	
	local timer_StartPing = nil;	
	local timer_ChangeIdea = nil;
	local timer_animationReachEnd = nil;
	local interval_Animation = nil;
	local viewport = scene.viewport;
	local listenerDrawer = nil;
	local confirmed = true;
	
	ping.onConfirm = nil;
	ping.worldX = worldX;
	ping.worldY = worldY;
	ping.centralizeScreen = centralizeScreen;
		
	function ping:stopAllTimers()
		if timer_StartPing ~= nil then
			clearTimeout(timer_StartPing);
			timer_StartPing = nil;
		end;
		
		if timer_ChangeIdea ~= nil then
			clearTimeout(timer_ChangeIdea);
			timer_ChangeIdea = nil;
		end;
		
		if interval_Animation ~= nil then
			clearInterval(interval_Animation);
			interval_Animation = nil;
		end;
		
		if timer_animationReachEnd ~= nil then
			clearTimeout(timer_animationReachEnd);
			timer_animationReachEnd = nil;
		end;
		
		ping:dettachDrawer();
	end;	
	
	function ping:beginBuildTimer()
		ping:stopAllTimers();
		confirmed = false;
		
		timer_StartPing = setTimeout(
			function()
				timer_StartPing = nil;
				ping:beginAnimation();
				animThick = PING_TO_CONFIRM_THICK;
				animVelocity = PING_TO_CONFIRM_VELOCITY;
				animStepOpacity = PING_START_OPACITY;
				confirmed = false;
					
				timer_ChangeIdea = setTimeout(
					function()
						timer_ChangeIdea = nil;
						-- ping confirmed						
						animThick = PING_DEFAULT_THICK;
						animVelocity = PING_DEFAULT_VELOCITY;
						ping:confirmBuildingPing();
						confirmed = true;
					end, PING_TIMEOUT_CHANGE_IDEA);
				
			end, PING_TIMEOUT_START_PING);
	end;
	
	function ping:buildAndSendPing()
		animStepOpacity = PING_START_OPACITY;
		confirmed = true;
		ping:stopAllTimers();
		ping:beginAnimation();
		ping:confirmBuildingPing();
	end;
	
	local function doDraw()
		local color = "CornflowerBlue";
		local screenScale = viewport.scale;
		local cellSize = scene.grid.cellSize;
		local screenThick = animThick * cellSize * screenScale;
		local sx, sy = viewport:worldToScreen(worldX, worldY);
		local viewportWidth, viewportHeight = viewport.width, viewport.height;
		
		local size = animStep * cellSize * screenScale;
		local sizeDiv2 = size / 2;			
			
		if (sx >= 0) and (sy >= 0) and (sx <= viewportWidth) and (sy <= viewportHeight) then
			-- Ping center is onScreen			
			-- animating border
			viewport:prepareDraw(color, screenThick);
			viewport:drawEllipse(sx - sizeDiv2, sy - sizeDiv2, sx + sizeDiv2, sy + sizeDiv2, animStepOpacity);
			
			-- center point
			local centerPointSizeDiv2 = screenThick / 2;
			viewport:prepareFill(color);
			viewport:fillEllipse(sx - centerPointSizeDiv2, sy - centerPointSizeDiv2, sx + centerPointSizeDiv2, sy + centerPointSizeDiv2);
									
			if text ~= nil and confirmed then
				-- text
				viewport:prepareFont(12, nil, true);
				
				local w, h = viewport:textSize(text);
				local wDiv2 = w / 2;
				local txtX = sx - wDiv2;
				local txtY = sy + centerPointSizeDiv2;
				local expandX = 8;
				
				viewport:prepareFill("white");
				viewport:fillRect(txtX - expandX, txtY, txtX + w + expandX * 2, txtY + h, 0.75);
				
				viewport:prepareFill("black");
				viewport:fillText(txtX, txtY, text, 1.0);
			end;
		else
			-- Ping center is outside of current scroll/zoom view
			-- Letz draw a little different
			local screenCenterX, screenCenterY = (viewportWidth / 2), (viewportHeight / 2);
			local angle = math.atan(sy - screenCenterY, sx - screenCenterX);
			local invAngle = angle - math.pi;
			local invSin, invCos = math.sin(invAngle), math.cos(invAngle);
			local BORDER_SIZE = 2 + screenThick;
			local intersects, newSX, newSY = _scene3_math_intersectingPointLineOnRect(BORDER_SIZE, BORDER_SIZE, viewportWidth - BORDER_SIZE, viewportHeight - BORDER_SIZE, screenCenterX, screenCenterY, angle);
			
			if not intersects then
				return;
			end;
			
			-- center point
			local centerPointSizeDiv2 = screenThick / 2;
			viewport:prepareFill(color);
			viewport:fillEllipse(newSX - centerPointSizeDiv2, newSY - centerPointSizeDiv2, newSX + centerPointSizeDiv2, newSY + centerPointSizeDiv2, animStepOpacity);			
			
			-- Arrow
			local arrowSize = 48;			
			local arrowThick = screenThick * 0.5;
			local ARROW_SPACE_HEAD = 10 + screenThick;
			local arrowHeadX, arrowHeadY = newSX + invCos * ARROW_SPACE_HEAD, newSY + invSin * ARROW_SPACE_HEAD;
			local arrowBaseX, arrowBaseY = arrowHeadX + invCos * arrowSize, arrowHeadY + invSin * arrowSize;
			local arrowAngleHeadLines = (30 * math.pi) / 180;
			local angleTemp;
			local sideSin, sideCos;
			local sideSize = arrowSize * 0.5;
			local borderSizeDiv2 = sizeDiv2 * 0.3;
			
			viewport:prepareDraw(color, arrowThick);
			
			-- arrow head
			viewport:drawLine(arrowBaseX, arrowBaseY, arrowHeadX, arrowHeadY, animStepOpacity);
			
			-- arrow side 1
			angleTemp = invAngle + arrowAngleHeadLines;			
			sideSin, sideCos = math.sin(angleTemp), math.cos(angleTemp);
			viewport:drawLine(arrowHeadX + sideCos * sideSize, arrowHeadY + sideSin * sideSize, arrowHeadX, arrowHeadY, animStepOpacity);
			
			-- arrow side 2
			angleTemp = invAngle - arrowAngleHeadLines;			
			sideSin, sideCos = math.sin(angleTemp), math.cos(angleTemp);
			viewport:drawLine(arrowHeadX + sideCos * sideSize, arrowHeadY + sideSin * sideSize, arrowHeadX, arrowHeadY, animStepOpacity);
			
			-- animating border
			viewport:drawEllipse(newSX - borderSizeDiv2, newSY - borderSizeDiv2, newSX + borderSizeDiv2, newSY + borderSizeDiv2, animStepOpacity);					
			
			if text ~= nil and confirmed then
				-- text
				viewport:prepareFont(12, nil, true);
				
				local w, h = viewport:textSize(text);
				local wDiv2 = w / 2;
				local txtX = newSX - wDiv2;
				local txtY = newSY + centerPointSizeDiv2;
				local expandX = 8;
				
				if txtX < expandX then
					txtX = expandX;
				elseif txtX > viewportWidth - w - expandX then	
					txtX = viewportWidth - w - expandX;
				end;
				
				if txtY < 0 then
					txtY = 0;
				elseif txtY > viewportHeight - h then	
					txtY = viewportHeight - h;
				end;				
						
				viewport:prepareFill("white");
				viewport:fillRect(txtX - expandX, txtY, txtX + w + expandX * 2, txtY + h, 0.75);
				
				viewport:prepareFill("black");
				viewport:fillText(txtX, txtY, text, 1.0);
			end;			
		end;
	end;
	
	function ping:attachDrawer()
		ping:dettachDrawer();
		listenerDrawer = viewport:listen("onAfterDrawLayers", doDraw);
	end;
	
	function ping:dettachDrawer()
		if listenerDrawer ~= nil then
			viewport:unlisten(listenerDrawer);
			listenerDrawer = nil;
		end;
	end;
	
	function ping:advanceAnimation()
		local factorAvance = PING_ANIMATION_INTERVAL_FRAME / 1000;
		animStep = animStep + (animVelocity * factorAvance);
	
		animStepOpacity = animStepOpacity - (factorAvance * PING_FADE_VELOCITY);
	
		viewport:needRepaint();
	end;
	
	function ping:animationReachedEnd()
		viewport:needRepaint();
	end;
	
	function ping:beginAnimation()
		animStep = PING_START_STEP;
	
		if interval_Animation ~= nil then
			clearInterval(interval_Animation);
			interval_Animation = nil;
		end;
		
		if timer_animationReachEnd ~= nil then
			clearTimeout(timer_animationReachEnd);
			timer_animationReachEnd = nil;
		end;

		ping:attachDrawer();
		viewport:needRepaint();
		
		interval_Animation = setInterval(
			function()
				ping:advanceAnimation();
			end, PING_ANIMATION_INTERVAL_FRAME);
			
		timer_animationReachEnd = setTimeout(
			function()
				timer_animationReachEnd = nil;
				
				if interval_Animation ~= nil then
					clearInterval(interval_Animation);
					interval_Animation = nil;
				end;
				
				ping:dettachDrawer();							
				ping:animationReachedEnd();
			end, PING_ANIM_DURATION);
	end;
	
	function ping:destroy()
		local repaint = listenerDrawer ~= nil;
		ping:stopAllTimers();
		ping:dettachDrawer();
		
		if repaint then
			viewport:needRepaint();
		end;
	end;
	
	function ping:confirmBuildingPing()
		if ping.onConfirm ~= nil then
			ping.onConfirm(ping);
		end;
	end;
	
	return ping;
end;

function NEW_PingerEngine(scene)
	local pinger = {};
	local buildingPing = nil;	
	local mesa = Firecast.getMesaDe(scene);
	local intervalScroll = nil;
	local timeoutStopScroll = nil;
	local myPingerID = _rrpg_generateUniqueStrID() .. tostring(_pinger_id_generator);	
	_pinger_id_generator = _pinger_id_generator + 1;	
	
	function pinger:resetMyPing()
		if buildingPing ~= nil then
			local ping = buildingPing;
			buildingPing = nil;			
			ping:destroy();
		end;		
	end;
	
	function pinger:canSendPing()
		if mesa ~= nil then
			local meuJ = mesa.meuJogador;
			
			if meuJ ~= nil then
				if meuJ.isEspectador then
					return false;
				end;
			end;
		end;
		
		return true;
	end;
	
	function pinger:canCentralizeScreen()
		if mesa ~= nil then
			local meuJ = mesa.meuJogador;
			
			if meuJ ~= nil then
				if meuJ.isMestre or meuJ.isJuggernaut or meuJ.isJogador then
					return true;
				else
					return false;
				end;
			end;
		end;
		
		return true;	
	end;
	
	function pinger:canSaveCentralizeScreen()
		if mesa ~= nil then
			local meuJ = mesa.meuJogador;
			
			if meuJ ~= nil then
				if meuJ.isMestre then
					return true;
				else
					return false;
				end;
			else
				return false;
			end;
		end;
		
		return true;	
	end;
		
	
	function pinger:getMyLogin()
		if mesa ~= nil then
			local jogador = mesa.meuJogador;
			
			if jogador ~= nil then
				return jogador.login;
			end;
		end;
		
		local cUser = Firecast.getCurrentUser();
		
		if cUser ~= nil and cUser.isLogged then
			return cUser.login;
		end;
	end;
	
	function pinger:startTimerToBuildMyPing(worldX, worldY, centralizeScreen)
		pinger:resetMyPing(); -- reset if any
		
		if not pinger:canSendPing() then
			return 
		end;
		
		if not pinger:canCentralizeScreen() then
			centralizeScreen  = false;
		end;		
		
		local ping = newSinglePing(scene, pinger, worldX, worldY, centralizeScreen, pinger:getMyLogin());		
		buildingPing = ping;	

		ping:beginBuildTimer();		
		
		ping.onConfirm = function()
			pinger:confirmSendAndProcessPing(ping);
		end;
	end;
	
	function pinger:makePingAt(worldX, worldY, centralizeScreen)
		pinger:resetMyPing(); -- reset if any
		
		if not pinger:canSendPing() then
			return 
		end;		
		
		if not pinger:canCentralizeScreen() then
			centralizeScreen  = false;
		end;
		
		local ping = newSinglePing(scene, pinger, worldX, worldY, centralizeScreen, pinger:getMyLogin());		
		buildingPing = ping;	
		
		ping.onConfirm = function()
			pinger:confirmSendAndProcessPing(ping);
		end;			
		
		ping:buildAndSendPing();	
	end;
		
	function pinger:centralizeAnim_doScrollAndZoomStep(worldX, worldY, viewportScale)
		local viewport = scene.viewport;		
		local currentScale = viewport.scale;				

		if currentScale <= 0 then
			currentScale = 1;
		end;	
		
		local viewportWidthAsWorld = viewport.width / currentScale;
		local viewportHeightAsWorld = viewport.height / currentScale;
				
		local currentMustCenterX, currentMustCenterY = viewport.worldX + (viewportWidthAsWorld / 2), viewport.worldY + (viewportHeightAsWorld / 2);		
		
		local difX = worldX - currentMustCenterX;
		local difY = worldY - currentMustCenterY;
		local difScale = viewportScale - currentScale;
		local timeToScroll = 0.800;
		local intervalAnimScroll = 1000 / PING_ANIM_FRAMES_PER_SECOND;
		local velocityX = difX / timeToScroll; 	
		local velocityY = difY / timeToScroll;
		local velocityScale = difScale / timeToScroll; 
		local intervalAnimFactor = (intervalAnimScroll / 1000);

		if timeoutStopScroll ~= nil then
			clearTimeout(timeoutStopScroll);
			timeoutStopScroll = nil;
		end;
		
		if intervalScroll ~= nil then		
			clearInterval(intervalScroll);
			intervalScroll = nil;
		end;
		
		local function setScaleAndCenterAt(newScale, newCenterX, newCenterY)
			viewport.scale = newScale;				
			
			viewportWidthAsWorld = viewport.width / viewport.scale;
			viewportHeightAsWorld = viewport.height / viewport.scale;
			
			local desiredWorldX = newCenterX - (viewportWidthAsWorld / 2);
			local desiredWorldY = newCenterY - (viewportHeightAsWorld / 2);					
			viewport.worldX = desiredWorldX;
			viewport.worldY = desiredWorldY;
		end;
								
		intervalScroll = setInterval(
			function()
				currentMustCenterX = currentMustCenterX + (intervalAnimFactor * velocityX);
				currentMustCenterY = currentMustCenterY + (intervalAnimFactor * velocityY);
				currentScale = currentScale + (intervalAnimFactor * velocityScale);
				setScaleAndCenterAt(currentScale, currentMustCenterX, currentMustCenterY);
			end, intervalAnimScroll);
			
		timeoutStopScroll = setTimeout(
			function()
				clearInterval(intervalScroll);
				intervalScroll = nil;
				timeoutStopScroll = nil;
				setScaleAndCenterAt(viewportScale, worldX, worldY);
			end, timeToScroll * 1000);	
	end;	
	
	function pinger:doCentralizeScreen(worldX, worldY, viewportScale)
		local viewport = scene.viewport;
	
		if type(viewportScale) ~= "number" then
			viewportScale = viewport.scale;
		end;	
		
		pinger:centralizeAnim_doScrollAndZoomStep(worldX, worldY, viewportScale);
	end;
	
	function pinger:doCentralizeScreenBasedOnLastPingCentralize()
		-- centralize screen based on last centralize-ping made by master
		local ud = scene.userData;
		local viewport = scene.viewport;
		
		if ud == nil or viewport == nil then
			return;
		end;
		
		local lastCentralize = ud.lastCentralize;
		
		if lastCentralize == nil then
			return;
		end;		
		
		local wWidth, wHeight = lastCentralize.viewportWorldWidth, lastCentralize.viewportWorldHeight;
		local viewportScaleToUse = lastCentralize.viewportScale;
		local wx, wy = lastCentralize.worldX, lastCentralize.worldY; 
		
		if type(wWidth) == "number" and type(wHeight) == "number" and wWidth > 0 and wHeight > 0 then
			-- recalculate viewportScale 
			local myScaleToWidth = viewport.width / wWidth; 
			local myScaleToHeight = viewport.height / wHeight;
			viewportScaleToUse = (myScaleToWidth + myScaleToHeight) / 2;
		end;
	
		if (type(wx) == "number") and (type(wy) == "number") and type(viewportScaleToUse) == "number" then	
			pinger:doCentralizeScreen(wx, wy, viewportScaleToUse);
		end;		
	end;
	
	function pinger:reproducePingAt(worldX, worldY, centralizeScreen, text)
		local repPing = newSinglePing(scene, pinger, worldX, worldY, centralizeScreen, text);	 
		repPing:beginAnimation();
	end;
	
	function pinger:confirmSendAndProcessPing(ping)
		local viewport = scene.viewport;
		buildingPing = nil;
		
		local msg = {};
		msg.type = "ping";
		msg.worldX = ping.worldX;
		msg.worldY = ping.worldY;
		msg.centralizeScreen = ping.centralizeScreen;
		msg.pingerID = myPingerID;
		
		if ping.centralizeScreen then
			msg.viewportScale = scene.viewport.scale;
			
			if msg.viewportScale > 0 then
				msg.viewportWorldWidth = viewport.width / msg.viewportScale;
				msg.viewportWorldHeight = viewport.height / msg.viewportScale;
			end;
			
			pinger:doCentralizeScreen(msg.worldX, msg.worldY, msg.viewportScale);
		end;
		
		scene:broadcastMessage(PING_NOTIFICATION_BROADCAST_MESSAGE, msg, true);
		
		if ping.centralizeScreen and pinger:canSaveCentralizeScreen() then
			-- Save for new scenes connections to centralize to this point
			local ud = scene.userData;
			
			if ud ~= nil then
				local lastCentralize = ud.lastCentralize;
				
				if lastCentralize == nil then
					ud.lastCentralize = {};
					lastCentralize = ud.lastCentralize;
				end;
				
				if lastCentralize ~= nil then
					lastCentralize.viewportWorldWidth = msg.viewportWorldWidth;
					lastCentralize.viewportWorldHeight = msg.viewportWorldHeight;
					lastCentralize.viewportScale = msg.viewportScale;
					lastCentralize.worldX = msg.worldX;
					lastCentralize.worldY = msg.worldY;
				end;
			end;
		end;
	end;	
	
	function pinger:processIncomingPingMessage(sender, msg)
		local viewport = scene.viewport;
	
		if (type(msg) ~= "table") or (msg.type ~= "ping") then
			return;
		end;
		
		local wx, wy = msg.worldX, msg.worldY;
		
		if (type(wx) ~= "number") or (type(wy) ~= "number") then
			return;
		end;	
			
		if msg.pingerID == myPingerID then
			-- ignore my own Pinger ID
			-- Need to loopback so secondary scenes windows will receive the message
			return;
		end;
			
		local text = nil;
			
		if mesa ~= nil then
			local jogador = mesa:findJogador(sender);
			
			if jogador ~= nil then
				text = jogador.login;
				
				if jogador.isEspectador then
					return; -- skip this message
				end;
			end;
		end;		
			
		if text == nil and sender ~= nil and sender ~= "" then
			text = sender;
		end;
			
		pinger:reproducePingAt(wx, wy, msg.centralizeScreen, text);
		
		if msg.centralizeScreen then
			local wWidth, wHeight = msg.viewportWorldWidth, msg.viewportWorldHeight;
			
			if type(wWidth) == "number" and type(wHeight) == "number" and wWidth > 0 and wHeight > 0 then
				-- recalculate viewportScale 
				local myScaleToWidth = viewport.width / wWidth; 
				local myScaleToHeight = viewport.height / wHeight;
				msg.viewportScale = (myScaleToWidth + myScaleToHeight) / 2;
			end;
		
			pinger:doCentralizeScreen(wx, wy, msg.viewportScale)
		end;
	end;
	
	pinger.pingBroadcastListener = scene:newBroadcastListener(PING_NOTIFICATION_BROADCAST_MESSAGE,
									function(sender, messageId, message)
										pinger:processIncomingPingMessage(sender, message);
									end);	
									
									
	setTimeout(
		function()
			-- centralize screen based on last centralize-ping made by master
			if not scene.isObjectAlive then
				return;
			end;
			
			pinger:doCentralizeScreenBasedOnLastPingCentralize();
		end, 50);
	
	return pinger;
end;