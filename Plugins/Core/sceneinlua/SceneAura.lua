require("scene.lua");


AURA_NAME = "aura"  

local function fazNada()
	SceneLib.registerPlugin(

		function (scene, attachment)           
		 

			-- Manipular o evento OnMouseDown do Viewport

			scene.viewport.onMouseDown = function(event)

				-- Usuário clicou no Scene

				-- Transformar as coordenadas de tela em métrica de mundo

				local worldX, worldY = scene.viewport:screenToWorld(event.x, event.y);

			   

				-- Localizar o item que o usuário clicou

				local item = scene.items:itemAtPoint(worldX, worldY);

			   

				if item ~= nil then

					-- Encontrou um item na posição clicada.                            

					-- Localizar uma operação gráfica neste item com o nosso nome

					local opGrafica = item.canvas:findByName(AURA_NAME);
									


					if opGrafica == nil then			

						--[[ A operação gráfica da minha marca ainda não

							existe neste token/item. Vamos criar ]]
							
						if FormaAura == "URL" then	
						
						opGrafica = item.canvas:addBitmap();
						
						opGrafica.url = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Location_dot_dark_red.svg/1200px-Location_dot_dark_red.svg.png";
											
						else 
						
						opGrafica = item.canvas:addPath();
						
						opGrafica.data = "M 10 10 H 90 V 90 H 10 L 10 10";		

						opGrafica.color = "red"
						
						end;	


						opGrafica.name = AURA_NAME;  

						opGrafica.userData.MultiplicadorH = nil;	

						opGrafica.userData.MultiplicadorW = nil;							

						opGrafica.userData.PossuiAura = nil;
						
						opGrafica.userData.FormaAura = nil;  		
						
						opGrafica.width = nil;
						
						opGrafica.height = nil;

						opGrafica.x = -(opGrafica.width)/2;
						
						opGrafica.y = -(opGrafica.height)/2;
						
						opGrafica.xOrigin = 0.5;
						
						opGrafica.yOrigin = 0.5;
						
						opGrafica.z = 10;                      

						opGrafica.outOfOrderMode = "beforeOwnerLayer"; 
						
						opGrafica.opacity = 0.5;  
						

											
					else

					end;

				end;           

			end;

				   

		end);
	
end
