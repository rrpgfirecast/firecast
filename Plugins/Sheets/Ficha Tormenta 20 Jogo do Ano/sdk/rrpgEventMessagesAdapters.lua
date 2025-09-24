local messaging = require("rrpgEventMessages.lua");
local rrpgWrappers = require("rrpgWrappers.lua");

-- Não faça require em rrpg.lua

local _basicChatCommandAdapter = {prepareFilters = 
		function(filters)
		
			if filters.room ~= nil then
				filters.mesaObjectID = filters.room.objectID;
				filters.room = nil;
				filters.mesa = nil;
			else								
				if filters.mesa ~= nil then
					filters.mesaObjectID = filters.mesa.objectID;
					filters.mesa = nil;
				else
					filters.mesaObjectID = nil;
				end;				
			end;			
			
			if filters.chat ~= nil then
				filters.chatObjectID = filters.chat.objectID;
				filters.chat = nil;
			else
				filters.chatObjectID = nil;
			end;
			
			if filters.player ~= nil then
				filters.jogadorObjectID = filters.player.objectID;
				filters.player = nil;
				filters.jogador = nil;
			else
				if filters.jogador ~= nil then
					filters.jogadorObjectID = filters.jogador.objectID;
					filters.jogador = nil;
				else
					filters.jogadorObjectID = nil;
				end;
			end;						
		end,
		
	 prepareMessage = 
		function(message)
			message.mesa = rrpgWrappers.contextObjectFromID(message.mesaObjectID);
			message.room = message.mesa;
			
			message.chat = rrpgWrappers.contextObjectFromID(message.chatObjectID);
			
			message.jogador = rrpgWrappers.contextObjectFromID(message.jogadorObjectID);
			message.player = message.jogador;
		end,		
	};

local _basicChatMessageAdapter = {prepareFilters = 
		function(filters)
			if filters.room ~= nil then
				filters.mesaObjectID = filters.room.objectID;
				filters.room = nil;
				filters.mesa = nil;
			else								
				if filters.mesa ~= nil then
					filters.mesaObjectID = filters.mesa.objectID;
					filters.mesa = nil;
				else
					filters.mesaObjectID = nil;
				end;				
			end;	
			
			if filters.chat ~= nil then
				filters.chatObjectID = filters.chat.objectID;
				filters.chat = nil;
			else
				filters.chatObjectID = nil;
			end;
			
			if filters.player ~= nil then
				filters.jogadorObjectID = filters.player.objectID;
				filters.player = nil;
				filters.jogador = nil;
			else
				if filters.jogador ~= nil then
					filters.jogadorObjectID = filters.jogador.objectID;
					filters.jogador = nil;
				else
					filters.jogadorObjectID = nil;
				end;
			end;
			
			if filters.pvtPlayer ~= nil then
				filters.jogadorPVTObjectID = filters.pvtPlayer.objectID;
				filters.pvtPlayer = nil;
				filters.jogadorPVT = nil;
			else
				if filters.jogadorPVT ~= nil then
					filters.jogadorPVTObjectID = filters.jogadorPVT.objectID;
					filters.jogadorPVT = nil;
				else
					filters.jogadorPVTObjectID = nil;
				end;
			end;								

			filters.rolagem = nil;
			filters.roll = nil;
		end,
		
	 prepareMessage = 
		function(message)
			message.mesa = rrpgWrappers.contextObjectFromID(message.mesaObjectID);
			message.room = message.mesa;
			
			message.chat = rrpgWrappers.contextObjectFromID(message.chatObjectID);
			
			message.jogador = rrpgWrappers.contextObjectFromID(message.jogadorObjectID);
			message.player = message.jogador;
			
			message.jogadorPVT = rrpgWrappers.contextObjectFromID(message.jogadorPVTObjectID);
			message.pvtPlayer = message.jogadorPVT;
			
			if message.rolagem64 ~= nil then
				message.rolagem = rrpg.loadRolagemFromBase64EncodedString(message.rolagem64);
				message.roll = message.rolagem;
				message.rolagem64 = nil;
			end;
		end,		
	};	
	
local __listChatCommandsAdapter = {
	prepareFilters = function(filters)
		_basicChatMessageAdapter.prepareFilters(filters);
	end,
		
	prepareMessage = 
		function(message)
			_basicChatMessageAdapter.prepareMessage(message);
		end,
		
	prepareResponse = function(response)
		local r = {};
		
		for k, v in pairs(response) do
			if type(v) == "table" then
				r[k] = v;
			end;
			
			response[k] = nil;
		end;

        local id = _rrpg_generateUniqueStrID();
		local qt = 0;
		
		for k, v in pairs(r) do
			qt = qt + 1;
			local str = "";
			local comando = v.command or v.comando;
			local tComando = type(comando);
			local comandoIdx = 1;
			
			if tComando == "string" then
				str = str .. "comando" .. comandoIdx .. "=" .. _util_encodeStringToHexUTF8(comando) .. "&";
				--comandoIdx = comandoIdx + 1;
			elseif tComando == "table" then
				for i = 1, #comando, 1 do
					str = str .. "comando" .. comandoIdx .. "=" .. _util_encodeStringToHexUTF8(comando[i]) .. "&";
					comandoIdx = comandoIdx + 1;				
				end;
			end;
			
			str = str .. "descricao=" .. _util_encodeStringToHexUTF8(v.description or v.descricao);
			response[id .. qt] = str;
		end;
	end;
};	

local _mesaJoinPartAdapter = {prepareFilters = 
		function(filters)
			if filters.room ~= nil then
				filters.mesaObjectID = filters.room.objectID;
				filters.room = nil;
				filters.mesa = nil;
			else								
				if filters.mesa ~= nil then
					filters.mesaObjectID = filters.mesa.objectID;
					filters.mesa = nil;
				else
					filters.mesaObjectID = nil;
				end;				
			end;	
						
			if filters.player ~= nil then
				filters.jogadorObjectID = filters.player.objectID;
				filters.player = nil;
				filters.jogador = nil;
			else
				if filters.jogador ~= nil then
					filters.jogadorObjectID = filters.jogador.objectID;
					filters.jogador = nil;
				else
					filters.jogadorObjectID = nil;
				end;
			end;
			
			if filters.me ~= nil then
				filters.eu = filters.me;
				filters.me = nil;
			end;
			
			if filters.isKick ~= nil then
				filters.ehKick = filters.isKick;
				filters.isKick = nil;
			end;
			
			if filters.text ~= nil then
				filters.mensagem = filters.text;
				filters.text = nil;
			end;
			
			if filters.responsible ~= nil then
				filters.responsavelObjectID = filters.responsible.objectID;
				filters.responsible = nil;
				filters.responsavel = nil;
			else
				if filters.responsavel ~= nil then
					filters.responsavelObjectID = filters.responsavel.objectID;
					filters.responsavel = nil;
				end;
			end;
		end,
		
	 prepareMessage = 
		function(message)
			message.me = message.eu;		
			message.isKick = message.ehKick;
			message.text = message.mensagem;
		
			message.mesa = rrpgWrappers.contextObjectFromID(message.mesaObjectID);	
			message.room = message.mesa;		
			
			message.jogador = rrpgWrappers.contextObjectFromID(message.jogadorObjectID);
			message.player = message.jogador;
			
			if message.responsavelObjectID ~= nil then
				message.responsavel = rrpgWrappers.contextObjectFromID(message.responsavelObjectID);
				message.responsible = message.responsavel;
			end;	
		end,		
	};

local _mesaMsgAdapter = {prepareFilters = 
		function(filters)
			if filters.room ~= nil then
				filters.mesaObjectID = filters.room.objectID;
				filters.room = nil;
				filters.mesa = nil;
			else								
				if filters.mesa ~= nil then
					filters.mesaObjectID = filters.mesa.objectID;
					filters.mesa = nil;
				else
					filters.mesaObjectID = nil;
				end;				
			end;
		end,
		
	 prepareMessage = 
		function(message)
			message.mesa = rrpgWrappers.contextObjectFromID(message.mesaObjectID);			
			message.room = message.mesa;
		end,		
	};
	
messaging.addMessageAdapter("ChatMessage", _basicChatMessageAdapter);	
messaging.addMessageAdapter("HandleChatTextInput", _basicChatMessageAdapter);	
messaging.addMessageAdapter("HandleChatCommand", _basicChatCommandAdapter);
messaging.addMessageAdapter("ListChatCommands", __listChatCommandsAdapter);	
messaging.addMessageAdapter("MesaJoined", _mesaJoinPartAdapter);	
messaging.addMessageAdapter("MesaParted", _mesaJoinPartAdapter);	
messaging.addMessageAdapter("TablesDockClosedByUser", _mesaMsgAdapter);	
messaging.addMessageAdapter("TablesDockPosChanged", _mesaMsgAdapter);	

-- Mensagens do Scene 3

local _SceneWrappers = nil;	
	
local _sceneMsgAdapter = {prepareFilters = 
		function(filters)
			if filters.scene ~= nil then
				filters.sceneObjectID = filters.scene.objectID;
				filters.scene = nil;
			else
				filters.sceneObjectID = nil;
			end;
		end,
		
	 prepareMessage = 
		function(message)
			if _SceneWrappers == nil then
				_SceneWrappers = require("sceneWrappers.dlua");
			end;
		
			message.scene = _SceneWrappers.objectFromID(message.sceneObjectID);			
		end,		
	};	
	
	
messaging.addMessageAdapter("SC3SceneLoaded", _sceneMsgAdapter);		
messaging.addMessageAdapter("SC3SceneUnloaded", _sceneMsgAdapter);		
	