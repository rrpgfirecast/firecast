require("scene.lua");
require("utils.lua");

SceneLib.registerPlugin(
	function (scene, attachment)
		local btn_sceneGenerator;
		local frmInserior = nil;
		local timeoutClearFrmGenerator = nil;
		local lastFrm;

		local function openPopUP(form)	
			if not scene.isGM then
				showMessage(lang("scene.inseridor.alert.gm.only"));
				return;
			end;

			if timeoutClearFrmGenerator ~= nil then
				clearTimeout(timeoutClearFrmGenerator);						
				timeoutClearFrmGenerator = nil;
			end;	

			local frm;					

			if frmInserior == nil or lastFrm ~= form then	
				lastFrm = form;			
				frm = gui.newForm(form);
				local node = ndb.load("inseridor.xml");
				frm:setNodeObject(node);
			else
				frm = frmInserior;
			end
			
			if (not frm.isShowing) then
				frm:prepareForShow(scene);									  				    
				frm:show();
			end;
			
			frmInserior = frm;
			
			timeoutClearFrmGenerator = setTimeout(
				function()
					frmInserior = nil;
				end, 5 * 60 * 1000);  -- 5 minutos			
		end;

		scene.viewport:setupToolCategory("Inseridor", lang("scene.inseridor.name"), -8);
		
		scene.viewport:addToolButton("Inseridor", 
		        lang("scene.inseridor.library"), 
				 "/icos/token.png",
				 -5,
				 {},
				 function()
					openPopUP("frmInseriorFireDrive");
				 end);

		scene.viewport:addToolButton("Inseridor", 
		        lang("scene.magic.title"), 
				 "/icos/magic.png",
				 -5,
				 {},
				 function()
					openPopUP("frmMagicTokens");
				 end);
		
		scene.viewport:addToolButton("Inseridor", 
		        lang("scene.inseridor.pc"), 
				 "/icos/pc.png",
				 -5,
				 {},
				 function()
					dialogs.openFile(lang("scene.inseridor.instruction"), "image/*", false,
				        function(arquivos)
				                local arq = arquivos[1];

				                fireDrive.createDirectory("/uploads");
				                fireDrive.upload("/uploads/" .. arq.name, arq.stream,
				                	function(fditem)
				                		local token = scene.items:addToken("tokens");

										local _lastMouseDown = rawget(scene, "_lastMouseDown");
									
										if _lastMouseDown ~= nil then
											token.x = _lastMouseDown.x;
											token.y = _lastMouseDown.y;
										else
											token.x = scene.worldWidth / 2;
											token.y = scene.worldHeight / 2;		
										end;

										token.image.url = fditem.url;
										token.name = fditem.name;
										token.selected = true;
				                	end);          
				        end);
				 end);

		scene.viewport:addToolButton("Inseridor", 
		        lang("scene.inseridor.www"), 
				 "/icos/www.png",
				 -5,
				 {},
				 function()
					Dialogs.selectImageURL("", 
				        function(url)
				            local token = scene.items:addToken("tokens");

							local _lastMouseDown = rawget(scene, "_lastMouseDown");
							
							if _lastMouseDown ~= nil then
								token.x = _lastMouseDown.x;
								token.y = _lastMouseDown.y;
							else
								token.x = scene.worldWidth / 2;
								token.y = scene.worldHeight / 2;		
							end;

							token.image.url = url;
							token.selected = true;   
				        end);
				 end);

		scene.viewport:addToolButton("Inseridor", 
		        lang("scene.inseridor.players"), 
				 "/icos/player.png",
				 -5,
				 {},
				 function()
					local mesa = rrpg.getMesaDe(scene);
					local usuarios = mesa.jogadores;
					local ctrl = 0;
					for i=1, #usuarios, 1 do
						if usuarios[i].isJogador then
							local jogador = usuarios[i];
							local per = jogador.personagemPrincipal;
							local size = scene.grid.cellSize;

							local token = scene.items:addToken("tokens");

							local _lastMouseDown = rawget(scene, "_lastMouseDown");
							
							if _lastMouseDown ~= nil then
								token.x = _lastMouseDown.x + (ctrl * size);
								token.y = _lastMouseDown.y;
							else
								token.x = scene.worldWidth / 2 + (ctrl * size);
								token.y = scene.worldHeight / 2;		
							end;

							token.image.url = jogador.avatar;
							token.name = utils.removerFmtChat(jogador.nick, true);
							token.ownerCharacter = per;
							token.ownerUserID = jogador.login;

							ctrl = ctrl +1;
						end;
					end;
					if ctrl < 1 then
						showMessage(lang("scene.inseridor.noplayers"));
					end;
				 end);	
	end);