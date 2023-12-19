local rrpg = require("rrpg.lua");
local rrpgObjs = require("rrpgObjs.lua");
require("rrpgUtil");
local messaging = rrpg.messaging;

local requests = rrpgObjs.objectFromHandle(_obj_newObject("TRRPGLuaRequests"));
rrpgObjs.registerHandle(requests.handle, requests);

local sessionLostMessage = "A conexão com o servidor foi perdida";

local function execCallback(callbackFunction, ...)
	if type(callbackFunction) == "function" then
			setTimeout(
				function(...)
					callbackFunction(...);
				end, 50, ...);
	end;
end;

function requests.criarItensNaBiblioteca(mesa, itens, successCallback, failureCallback)
	local pacote = itens;
		
	if mesa == nil then
		error("Parâmetro mesa não informado");
	end;
		
	if #itens == 0 then
		execCallback(failureCallback, "Não foi especificado itens para a criação");
		return;		
	end;
	
	for i = 1, #itens, 1 do
		local it = itens[i];
		
		if (type(it.itemPai) == "table") then
			it.itemPai = it.itemPai.codigoInterno;			
		end;
		
		if type(it.dono) == "table" then
			it.dono = it.dono.codigoInterno;
		end;
	end;
	
	if type(mesa) == "table" then
		mesa = mesa.codigoInterno;
	end;
	
	local r, r2 = _obj_invokeEx(requests.handle, "ExCriarItensNaBiblioteca", mesa, pacote);
	
	if r then
		local l1 = messaging.listenOnce("ServerResponse_CriarItemBiblioteca",
					function(msg)
						if msg.r then
							execCallback(successCallback);
						else
							execCallback(failureCallback, msg.msg);
						end;
					end, {requestId=r2});
					
		local l2 = messaging.listenOnce("SessionLost",
					function()
						execCallback(failureCallback, sessionLostMessage);
					end);
		
		messaging.groupOnceListeners(l1, l2);
	else
		execCallback(failureCallback, r2);
	end;
end;

function requests.criarPersonagem(itemPai, nome, dataType, visivelATodos, dono, successCallback, failureCallback)

	if itemPai == nil then
		error("Parâmetro itemPai não informado");
	end;

	local itens = {{tipoItem="personagem", itemPai=itemPai, nome=nome, sistema=dataType, dono=dono, visivel=visivelATodos}};
	return requests.criarItensNaBiblioteca(itemPai.mesa, itens, successCallback, failureCallback);
end;

rrpg.requests = requests;
rrpg.Requests = requests;
return requests;