require("scene.lua");
require("utils.lua");
require("rrpgScene_Globals.lua");
local Internet = require("internet.lua");
require("rrpgScene_Undo.dlua");

	
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
	
local function adicionarUmTokenDeUmURL(scene, url, x, y, drag)
	SC3UNDO_Capture(scene,
		function()
			local token = scene.items:addToken();
			token:beginUpdate();	
			
			
			tryFinally(
				function()	
					token.image.url = url;
					token.snapToGrid = true;
					token.width = scene.grid.cellSize;
					token.height = scene.grid.cellSize;			
					local cx, cy = scene.viewport:screenToWorld(x, y);
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
end;
	
local function verificarLinkEAdicionarToken(scene, pLink, x, y, drag)	
	adicionarUmTokenDeUmURL(scene, pLink, x, y, drag);
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
	local mesa = rrpg.getMesaDe(jogador);
	
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
	
---------- Ferramentas de Drag n Drop	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local btn_tokensLayer;	
		local btn_objectsLayer;	
		local btn_bkgLayer;	
			
				
		local function doStartDrop(drop, x, y, drag)			
			drop:addAction("characters",
				function (value, x, y, drag)
					for i = 1, #value, 1 do
						adicionarUmTokenDeUmPersonagem(scene, value[i], x, y, #value > 1);
					end;
				end);					
			
			drop:addAction("character",
				function (value, x, y, drag)
					adicionarUmTokenDeUmPersonagem(scene, value, x, y);
				end);			
			
			drop:addAction("sceneUnitClass", 
							function(value, x, y, drag)								
								adicionarUmTokenDeUmSceneUnitClass(scene, value, x, y);
							end);
									
			drop:addAction("players",
				function (value, x, y, drag)
					for i = 1, #value, 1 do
						adicionarUmTokenDeUmJogador(scene, value[i], x, y, #value > 1);
					end;
				end);																	
									
			drop:addAction("player",
				function (value, x, y, drag)
					adicionarUmTokenDeUmJogador(scene, value, x, y);
				end);		
									
			drop:addAction("imageURL", 
							function(value, x, y, drag)								
								verificarLinkEAdicionarToken(scene, value, x, y, drag);
							end);
			
			
			local pLink = strToProbableLink(drag:getData("text"));
			
			if pLink ~= nil then			
				drop:addAction("text",
					function(value, x, y, drag)
						local pLink = strToProbableLink(value);
						verificarLinkEAdicionarToken(scene, pLink, x, y, drag);						
					end);
			end;		
		end;
				
		scene.viewport:listen("onStartDrop", doStartDrop);
	end);	