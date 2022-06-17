require("scene.lua");
require("utils.lua");
require("rrpgScene_Globals.lua");
local Internet = require("internet.lua");
require("rrpgScene_Undo.dlua");
require('gui.lua');

	
-- Drag and Drop de Texto

local function strToProbableLink(str)	
	if type(str) ~= "string" then
		return nil;
	end;
	
	if string.match(str, "https?://.+") then
		local googleImage = string.match(str, ".+imgres%?imgurl=([^&]+)");
		
		if googleImage ~= nil then
			return Internet.httpDecode(googleImage);
		else
			return str;
		end;
	end;
end;
	
local function adicionarUmTokenDeUmURL(scene, url, x, y, drag, autoPlace)
	local token = nil;
	
	SC3UNDO_Capture(scene,
		function()
			token = scene.items:addToken();
			token:beginUpdate();				
			
			tryFinally(
				function()	
					token.image.url = url;
					token.snapToGrid = true;
					token.width = scene.grid.cellSize;
					token.height = scene.grid.cellSize;			
					local cx, cy = scene.viewport:screenToWorld(x, y);
					
					if autoPlace then
						cx, cy = UTIL_BomLugarCenter(scene, cx, cy);
					end;
					
					token:setCenter(cx, cy, true);
					
					if drag ~= nil then
						local per = drag:getData('character');
						
						if per ~= nil then
							token.ownerCharacter = per.codigoInterno;
						end;
						
						local jogador = drag:getData("player");
						
						if jogador ~= nil then
							token.ownerUserID = jogador.login;
						end;
					end;
					
					scene.items:clearSelection();	
					token.selected = true;		
				end,
				
				function()
					token:endUpdate();
				end);
		end);
		
	return token;
end;
	
local function verificarLinkEAdicionarToken(scene, pLink, x, y, drag, autoPlace)	
	return adicionarUmTokenDeUmURL(scene, pLink, x, y, drag, autoPlace);
end;

local function adicionarUmTokenDeUmSceneUnitClass(scene, suc, x, y)
	SC3UNDO_Capture(scene, 
			function()		
				local token = scene.items:addToken();
				token:beginUpdate();
				
				tryFinally(function()
							local tImg = token.image;
							tImg.url = suc.urlImg;
							tImg.width = suc.layoutTamX;
							tImg.height = suc.layoutTamY;
							tImg.x = 0.5 - suc.layoutCenterX * tImg.width;
							tImg.y = 0.5 - suc.layoutCenterY * tImg.height;
							--tImg.rotation = -suc.direcaoImg;
							
							--[[ nome do token direto da biblioteca ]]--
							token.name = suc.nome;							
							
							token.snapToGrid = suc.snapToGrid;
							token.width = suc.tamanhoX;
							token.height = suc.tamanhoY;
							token.facingMode = suc.facing;
							--token.rotation = suc.direcaoImg;
														
							
							local cx, cy = scene.viewport:screenToWorld(x, y);
							token:setCenter(cx, cy, true);		
						end,
						function()
							token:endUpdate();
						end);

				scene.items:clearSelection();	
				token.selected = true;
		end);
end;

local function adicionarUmTokenDeUmPersonagem(scene, personagem, x, y, autoPlace)
	local avatarUsar = personagem.avatar;
	local jogadorCtrl = personagem.dono;

	if (avatarUsar == nil or avatarUsar == "") and (jogadorCtrl ~= nil) then
		avatarUsar = jogadorCtrl.avatar;
	end;
	
	if avatarUsar == "" then
		avatarUsar = "urlInvalida";
	end;
	
	SC3UNDO_Capture(scene, 
		function()						
			local token = scene.items:addToken();
			token:beginUpdate();	
			
			tryFinally(function()
						local tImg = token.image;
						tImg.url = avatarUsar;
						token.snapToGrid = true;				
						token.ownerCharacter = personagem.codigoInterno;
						token.name = personagem.nome;
						token.width = scene.grid.cellSize;
						token.height = scene.grid.cellSize;
						
						local cx, cy = scene.viewport:screenToWorld(x, y);
						
						if autoPlace then
							cx, cy = UTIL_BomLugarCenter(scene, cx, cy);
						end;				
						
						token:setCenter(cx, cy, true);		
					end,
					function()
						token:endUpdate();
					end);

			scene.items:clearSelection();	
			token.selected = true;
		end);
end;
	
local function adicionarUmTokenDeUmJogador(scene, jogador, x, y, autoPlace)
	local avatarUsar = jogador.avatar;
	local personagem = nil;
	local mesa = Firecast.getMesaDe(jogador);
	
	if mesa ~= nil then
		personagem = mesa:findBibliotecaItem(jogador.personagemPrincipal);
	end;
	
	if (personagem ~= nil) and (personagem.avatar ~= "") then
		avatarUsar = personagem.avatar;
	end;	
	
	SC3UNDO_Capture(scene, 
				function()				
					local token = scene.items:addToken();
					token:beginUpdate();	
					
					tryFinally(function()
								local tImg = token.image;
								tImg.url = avatarUsar;
								token.snapToGrid = true;	

								if personagem ~= nil then
									token.ownerCharacter = personagem.codigoInterno;
									token.name = personagem.nome;
								else
									token.ownerUserID = jogador.login;
									token.name = jogador.nick;
								end;			
								
								token.width = scene.grid.cellSize;
								token.height = scene.grid.cellSize;				
								
								local cx, cy = scene.viewport:screenToWorld(x, y);
								
								if autoPlace then
									cx, cy = UTIL_BomLugarCenter(scene, cx, cy);
								end;
								
								token:setCenter(cx, cy, true);		
							end,
							function()
								token:endUpdate();
							end);

					scene.items:clearSelection();	
					token.selected = true;
				end);
end;	
		
local function adicionarUmTokenDeUmImageFile(scene, imageFile, x, y, autoPlace)
	local fireDrive = require("fireDrive.lua");
	local token = adicionarUmTokenDeUmURL(scene, 'plugin://BR.COM.RRPG.SCENE3_IN_LUA/images/loadingAnim.gif', x, y, nil, autoPlace);
	
	fireDrive.quickUpload(imageFile.name, imageFile.mimeType, imageFile.stream,
		function(fdItem)
			if token.isObjectAlive then
				token.image.url = fdItem.url;			
				scene:sendDelayedUpdates();					
			end			
		end,
		
		function(currentBytes, maxBytes)
		end,
		
		function (failureReason)
			if token.isObjectAlive then
				token:delete();
			end;
		
			GUI.toast('@@scene.image.upload.errorPrefix ' .. failureReason);
		end	
	);
end;		
	
---------- Ferramentas de Drag n Drop	

function SC3DRAGNDROP_FillDropData(scene, drop, screenX, screenY, drag)
	drop:addAction("imageFiles", 
		function (value, rx, ry, rdrag)
			for i = 1, #value, 1 do
				adicionarUmTokenDeUmImageFile(scene, value[i], rx, ry, #value > 1);
			end;
		end);		

	drop:addAction("imageFile", 
		function (value, rx, ry, rdrag)
			adicionarUmTokenDeUmImageFile(scene, value, rx, ry);
		end);			

	drop:addAction("characters",
		function (value, rx, ry, rdrag)
			for i = 1, #value, 1 do
				adicionarUmTokenDeUmPersonagem(scene, value[i], rx, ry, #value > 1);
			end;
		end);					
	
	drop:addAction("character",
		function (value, rx, ry, rdrag)
			adicionarUmTokenDeUmPersonagem(scene, value, rx, ry);
		end);			
	
	drop:addAction("sceneUnitClass", 
					function(value, rx, ry, rdrag)								
						adicionarUmTokenDeUmSceneUnitClass(scene, value, rx, ry);
					end);
							
	drop:addAction("players",
		function (value, rx, ry, rdrag)
			for i = 1, #value, 1 do
				adicionarUmTokenDeUmJogador(scene, value[i], rx, ry, #value > 1);
			end;
		end);																	
							
	drop:addAction("player",
		function (value, rx, ry, rdrag)
			adicionarUmTokenDeUmJogador(scene, value, rx, ry);
		end);		
							
	drop:addAction("imageURL", 
					function(value, rx, ry, rdrag)								
						verificarLinkEAdicionarToken(scene, value, rx, ry, rdrag);
					end);
		
	local pLink = strToProbableLink(drag:getData("text"));
	
	if pLink ~= nil then			
		drop:addAction("text",
			function(value, rx, ry, rdrag)
				local rpLink = strToProbableLink(value);
				verificarLinkEAdicionarToken(scene, rpLink, rx, ry, rdrag);						
			end);
	end;	
end;
	
SceneLib.registerPlugin(
	function (scene, attachment)									
		scene.viewport:listen("onStartDrop", 
			function (drop, x, y, drag)
				SC3DRAGNDROP_FillDropData(scene, drop, x, y, drag);
			end);
	end);	