require("scene.lua");
require("utils.lua");
require("rrpg.lua");


function UTIL_IsTokenMine(token)
	local currentUser = rrpg.getCurrentUser();
	
	if currentUser.login ~= "" and currentUser.login ~= nil and currentUser.isLogged then
		if string.lower(ownerUserID) == string.lower(currentUser.login) then
			return true;
		end;
		
		local mesa = rrpg.getMesaDe(token.scene);
		
		if mesa ~= nil then
			local personagem = mesa:findBibliotecaItem(token.ownerCharacter);		
			
			if (personagem ~= nil) and (string.lower(personagem.loginDono) == string.lower(currentUser.login)) then
				return true;
			end;			
		end;
	end;
	
	return false;
end;

function UTIL_BomLugarCenter(scene, x, y, layer)
	local yI, yJ = scene.grid:worldToCell(x, y);
	local dx, dy = scene.grid:cellToWorld(yI, yJ);
	local qtTentativas = 18;
	local incrementaJ = 1;
	local incrementaI = 0;	
						
	while (scene.items:itemAtPoint(dx, dy, layer) ~= nil) and (qtTentativas > 0) do
		-- Tem um item nesta posição. vamos mover um pouco pra esqquerda
		qtTentativas = qtTentativas - 1;
		local wi, wj = scene.grid:worldToCell(dx, dy);				
		wj = wj + incrementaJ;
		wi = wi + incrementaI;
		
		incrementaJ = (incrementaJ + 1) % 2;
		incrementaI = (incrementaI + 1) % 2;					
		
		dx, dy = scene.grid:cellToWorld(wi, wj);
	end;
	
	return dx, dy;
end;