local objs = require("rrpgObjs.lua");
local SharedObjects = require("rrpgSharedObjects.lua");
local rrpgWrappers = {};
local localStrongRefContextoObjects = {};	
local Locale = require("locale.lua");
local Async = require("async.lua");
local Utils = require('utils.lua');

local SHARED_OBJECT_TYPE = "rrpgObject";

--[ Anti Flood System ]--						

local function newTimedJobQueue(interval)
	local o = {};
	o.interval = interval;
	
	o.timer = objs.newTimer(interval, 
		function()
	
			-- Pesquisar novo job
			local achouJob = false;
			local jobEncontrado = nil;
			local idJobEncontrado = nil;
			
			while (not achouJob) and (o.ultimoJobExecutado < o.gerador) do
				o.ultimoJobExecutado = o.ultimoJobExecutado + 1;
				local jobObject = o.jobs[o.ultimoJobExecutado];	
				
				if jobObject ~= nil then
					achouJob = true;
					jobEncontrado = jobObject;
					idJobEncontrado = o.ultimoJobExecutado;
				end;
			end;				
			
			if achouJob and (jobEncontrado ~= nil) then
				o.jobs[idJobEncontrado] = nil;
				
				if jobEncontrado.parameters ~= nil then
					jobEncontrado.callback(table.unpack(jobEncontrado.parameters));
				else
					jobEncontrado.callback();
				end;
			else
				o.readyForJob = true;
				o.timer.enabled = false;				
			end;
	
		end);	
		
	o.timer.enabled = false;
	
	function o:addJob(callback, ...)
		if o.readyForJob then
			o.readyForJob = false;
			o.timer.enabled = true;
			callback(...);
		else
			o.gerador = o.gerador + 1;
			local idJob = o.gerador;
			local jobObject = {};
			jobObject.callback = callback;
			jobObject.parameters = table.pack(...);
			o.jobs[idJob] = jobObject;
		end;
	end;
	
	function o:addAsyncJob(callback, ...)	
		local promise, resolution = Async.Promise.toResolve();
		assert((promise ~= nil) and (resolution ~= nil));
								
		o:addJob(
			function(...)
				assert(resolution ~= nil);
				
				local function protectedCallback(...)
					local ret = table.pack(pcall(callback, ...));
					
					if ret[1] then
						return table.unpack(ret, 2);
					else
						return Async.Promise.failed(ret[2]);
					end;
				end;
				
				Async.execute(protectedCallback, ...):thenResolve(resolution);
			end, ...);
		
		return promise;
	end;
	
	function o:clear()
		o.timer.enabled = false;
		o.gerador = 0;
		o.ultimoJobExecutado = 0;
		o.jobs = {};
		o.readyForJob = true;
	end;
	
	o:clear();
	return o;
end;

local __serverRequestQueue = newTimedJobQueue(250);
rrpgWrappers.__serverRequestQueue = __serverRequestQueue;

local function initWrappedObjectFromHandle(handle)
	local wObj = objs.objectFromHandle(handle); 
	
	if (wObj.props == nil) then
		wObj.props = {};
	end;
	
	function wObj:getObjectID() return _obj_getProp(self.handle, "ContextoObjectID"); end;
	function wObj:getObjectType() return _obj_getProp(self.handle, "WrappedObjectType"); end;
	function wObj:getIsObjectAlive() return _obj_getProp(self.handle, "IsObjectAlive"); end;
	function wObj:isType(typeName) return _rrpg_IsWrapperOfType(self.handle, typeName); end;
	
	function wObj:getShareID() return {objectType=SHARED_OBJECT_TYPE, objectID=tostring(self:getObjectID())} end;
	
	wObj.props["objectType"] = {getter = "getObjectType", tipo = "string"};
	wObj.props["isObjectAlive"] = {getter = "getIsObjectAlive", tipo = "bool"};
	wObj.props["objectID"] = {getter = "getObjectID", tipo = "int"};
	return wObj;
end;

--[ OBJETO MESA ]--

local function initMesaWrappedObjectFromHandle(handle)
	local wObj = initWrappedObjectFromHandle(handle); 
	local mesa = wObj;

	function mesa:getActiveChat()
		local objMesa = rrpgWrappers.objectFromID(_obj_getProp(self.handle, "ActiveChatObjectID")); 
		
		if objMesa == nil then
			return mesa:getChat();
		else
			return objMesa;
		end;
	end;
    
	function mesa:getAudioPlayer()
		local cachedPlayer = rawget(self, "__cachedAudioPlayer");

		if cachedPlayer == nil then
			local audioLib = require("audioCore.dlua");
		
			if self.isObjectAlive then				
				local audioPlayerHandle = _obj_invokeEx(self.handle, 'CreateRoomAudioPlayer');		

				if audioPlayerHandle ~= nil then
					cachedPlayer = audioLib._audioPlayerWrapperFromHandle(audioPlayerHandle);
				else
					cachedPlayer = audioLib._newNullAudioPlayerWrapper("Failed to initialize room audio player");
				end;
			else
				cachedPlayer = audioLib._newNullAudioPlayerWrapper("Not in room");
			end;
					
			assert(cachedPlayer ~= nil);			
			rawset(self, "__cachedAudioPlayer", cachedPlayer);
		end;

		return cachedPlayer;	
	end;
	
	function mesa:getChat() 
		local objMesa = rrpgWrappers.objectFromID(_obj_getProp(self.handle, "ChatObjectID")); 
		
		if objMesa == nil then
			return rrpgWrappers.NullChatWrapper;  -- ao invés de retornar NULL, vamos retorna um objeto que não faz nada.
		else
			return objMesa;
		end;
	end;
	
    function mesa:getJogadores()
    	local hs =  _obj_getProp(self.handle, "JogadoresObjectIDs");
    	local jogadores = {};
    	local idx = 1;
    	
    	for p, v in pairs(hs) do
    		jogadores[idx] = rrpgWrappers.contextObjectFromID(v);
    		idx = idx + 1;
    	end
    	   	
    	return jogadores;
    end	
	
	function mesa:findBibliotecaItem(codigoInterno) return rrpgWrappers.objectFromID(_obj_invoke(self.handle, "TryFindBibliotecaItem", codigoInterno)); end;	
	
    function mesa:findJogador(loginOuCodigoInterno) 
		if type(loginOuCodigoInterno) == "string" then		
			return rrpgWrappers.objectFromID(_obj_invoke(self.handle, "TryFindJogadorByLogin", loginOuCodigoInterno)); 
		elseif type(loginOuCodigoInterno) == "number" then
			return rrpgWrappers.objectFromID(_obj_invoke(self.handle, "TryFindJogadorById", loginOuCodigoInterno)); 		
		else
			return nil;
		end;
	end;
		
    function mesa:getNome() return _obj_getProp(self.handle, "Nome"); end;
    function mesa:getDescricao() return _obj_getProp(self.handle, "Descricao"); end;    
    function mesa:getMsgStatus() return _obj_getProp(self.handle, "MsgStatus"); end;    	
	function mesa:getSite() return _obj_getProp(self.handle, "Site"); end;  
    function mesa:getLogotipo() return _obj_getProp(self.handle, "Logotipo"); end;    	
	function mesa:getSistema() return _obj_getProp(self.handle, "Sistema"); end;
    function mesa:getMsgBoasVindas() return _obj_getProp(self.handle, "MsgBoasVindas"); end;    
    function mesa:getCodigoInterno() return math.tointeger(_obj_getProp(self.handle, "CodigoInterno")); end;    
    function mesa:getIsRestrito18Anos() return _obj_getProp(self.handle, "IsRestrito18Anos"); end;  	
	function mesa:getHaVagas() return _obj_getProp(self.handle, "HaVagas"); end;  		
    function mesa:getIsModerada() return _obj_getProp(self.handle, "IsModerada"); end;   
    function mesa:getMeuJogador() return rrpgWrappers.contextObjectFromID(_obj_getProp(self.handle, "MeuJogadorObjectID")); end;
	function mesa:getBiblioteca() return rrpgWrappers.contextObjectFromID(_obj_getProp(self.handle, "BibliotecaObjectID")); end;	
	function mesa:getPodeTablesDock() return _obj_getProp(self.handle, "PodeTablesDock"); end; 
    	
	function mesa:requestSetModerada(moderada) 
		moderada = Locale.autoEval(moderada);
		__serverRequestQueue:addJob(function () _obj_invokeNoEval(self.handle, "RequestSetModerada", not (not moderada));	end); 
	end;
	
	function mesa:abrirNDBDeMesa(nome, callback, opcoes)
		local ndbBib = require("ndb.lua");
				
		if type(opcoes) ~= "table" then
			opcoes = {};
		else	
			opcoes = Utils.cloneTable(opcoes, true);
		end;				
		
		opcoes.criar = not not opcoes.criar;
		
		local ndbHandle = _obj_invokeEx(self.handle, 'AbrirNDBDeMesa', tostring(nome) or "", opcoes.criar);
		local ndbObj = nil;
		local rootNode = nil;
		
		if ndbHandle ~= nil then
			ndbObj = ndbBib.openNodeDatabaseFromHandle(ndbHandle); 										
		end;
		
		if ndbObj ~= nil then
			rootNode = ndbBib.getRoot(ndbObj);
		end;				
		
		if rootNode ~= nil then
			local jaNotificou = false;
			local jaNotificouEmCarregamento = false;
			local listenerProvider = nil;
			local listenerLoaded = nil;
			
			local function checkState()
				if not jaNotificou then
					local state = ndbBib.getState(rootNode);
				
					if state == "open" then
						jaNotificou = true;
						
						if callback ~= nil then
							setTimeout(callback, 1, rootNode);
							end;
					elseif state == "closed" then
						jaNotificou = true;
						
						if callback ~= nil then
							setTimeout(callback, 1, nil);
						end;	
					else
						if (not jaNotificouEmCarregamento) and (not jaNotificou) then
							jaNotificouEmCarregamento = true;
							
							if opcoes.callbackDeCarga ~= nil then
								opcoes.callbackDeCarga(rootNode);
							end;
						end;
					end;
					
					if jaNotificou and (ndbObj ~= nil) then
						ndbObj:removeEventListener(listenerProvider);
						ndbObj:removeEventListener(listenerLoaded);
						--ndbObj = nil;
					end;						
				end;						
			end;
					
			listenerProvider = ndbObj:addEventListener("OnProviderStateChange", checkState);
			listenerLoaded = ndbObj:addEventListener("OnLoaded", checkState);
					
			checkState();
		elseif callback ~= nil then
			setTimeout(callback, 1, nil);		
		end;
	end;
	
	function mesa:asyncOpenRoomNDB(name, options)		
		options = options or {};			
	
		local promise, resolution = Async.Promise.pending();
				
		local adaptedOptions = {};				
		adaptedOptions.criar = options.create;
		
		if options.skipLoad then
			adaptedOptions.callbackDeCarga = 
				function(loadingNode)
					resolution:setSuccess(loadingNode);
				end;
		end;
		
		self:abrirNDBDeMesa(name, 
			function(loadedNode)
				if loadedNode ~= nil then
					resolution:setSuccess(loadedNode);
				else	
					resolution:setFailure("Could not load room nodedatabase");
				end;
			end, 
			adaptedOptions);
				
		return promise;
	end;
	
	function mesa:asyncOpenUserRoomNDB(name, options)
		return __serverRequestQueue:addAsyncJob(
			function ()
				return Async.Promise.wrap(_obj_invokeEx(self.handle, "AsyncOpenUserRoomNDB", name, options));			
			end);	
	end;
	
	function mesa:getFirecastURI()
		return _obj_invokeEx(self.handle, "GetFirecastURI");
	end;
	
	function mesa:asyncOpenPVT(login, params) 		
		local promiseHandle = _obj_invokeEx(self.handle, "AsyncOpenPVT", login, params);
		return Async.Promise.wrap(promiseHandle);
	end;		

	function mesa:asyncCreateGroupPVT(logins, params) 		
		local clonedLogins = Utils.cloneTable(logins);
		local clonedParams = Utils.cloneTable(params);
	
		return __serverRequestQueue:addAsyncJob(
			function ()
				local promiseHandle = _obj_invokeEx(self.handle, "AsyncCreateGroupPVT", clonedLogins, clonedParams);
				return Async.Promise.wrap(promiseHandle);				
			end);	
	end;	
	
	function mesa:getChats()
		return _obj_invokeEx(self.handle, "GetChats");
	end;
				
	wObj.props["activeChat"] = {getter="getActiveChat", tipo="table"};					
	wObj.props["audioPlayer"] = {getter="getAudioPlayer", tipo="table"};				
	wObj.props["nome"] = {getter = "getNome", tipo = "string"};
	wObj.props["descricao"] = {getter = "getDescricao", tipo = "string"};
	wObj.props["msgStatus"] = {getter = "getMsgStatus", tipo = "string"};	
	wObj.props["site"] = {getter = "getSite", tipo = "string"};
	wObj.props["logotipo"] = {getter = "getLogotipo", tipo = "string"};	
	wObj.props["sistema"] = {getter = "getSistema", tipo = "string"};	
	wObj.props["msgBoasVindas"] = {getter = "getMsgBoasVindas", tipo = "string"};	
	wObj.props["codigoInterno"] = {getter = "getCodigoInterno", tipo = "int"};	
	wObj.props["firecastURI"] = {getter = "getFirecastURI", tipo = "string"};	
	wObj.props["isRestrito18Anos"] = {getter = "getIsRestrito18Anos", tipo = "bool"};	
	wObj.props["haVagas"] = {getter = "getHaVagas", tipo = "bool"};		
	wObj.props["isModerada"] = {getter = "getIsModerada", tipo = "bool"};	
	wObj.props["podeTablesDock"] = {getter = "getPodeTablesDock", tipo = "bool"};
	wObj.props["jogadores"] = {getter = "getJogadores", tipo = "table"};	
	wObj.props["meuJogador"] = {getter = "getMeuJogador", tipo = "table"};	
	wObj.props["biblioteca"] = {getter = "getBiblioteca", tipo = "table"};	
	wObj.props["chat"] = {getter="getChat", tipo="table"};
	
	wObj.props["library"] = wObj.props["biblioteca"];	
	wObj.props["me"] = wObj.props["meuJogador"];	
	
	return wObj;
end;
		
--[ OBJETO JOGADOR ]--
		
local function initJogadorWrappedObjectFromHandle(handle)
	local wObj = initWrappedObjectFromHandle(handle); 
	local jogador = wObj;
		
	function jogador:getMesa() return rrpgWrappers.objectFromID(_obj_getProp(self.handle, "MesaID")); end;
	function jogador:getNick() return _obj_getProp(self.handle, "Nick"); end;
	function jogador:getLogin()	return _obj_getProp(self.handle, "Login"); end;		
	function jogador:getAvatar() return _obj_getProp(self.handle, "Avatar"); end;	
	function jogador:getCapa() return _obj_getProp(self.handle, "Capa"); end;	
	function jogador:getIsGold() return _obj_getProp(self.handle, "IsGold"); end;	
	function jogador:getIsGoldPlus() return _obj_getProp(self.handle, "IsGoldPlus"); end;
	function jogador:getIsRuby() return _obj_getProp(self.handle, "IsRuby"); end;	
	function jogador:getIsAusente() return _obj_getProp(self.handle, "IsAusente"); end;	
	function jogador:getIsCnxDormente() return _obj_getProp(self.handle, "IsCnxDormente"); end;
	function jogador:getIsSessaoMobile() return _obj_getProp(self.handle, "IsSessaoMobile"); end;
	function jogador:getIsJuggernaut() return _obj_getProp(self.handle, "IsJuggernaut"); end;
	function jogador:getIsMestre() return _obj_getProp(self.handle, "IsMestre"); end;	
	function jogador:getIsJogador() return _obj_getProp(self.handle, "IsJogador"); end;
	function jogador:getIsEspectador() return _obj_getProp(self.handle, "IsEspectador"); end;
	function jogador:getIsMudo() return _obj_getProp(self.handle, "IsMudo"); end;
	function jogador:getIsCego() return _obj_getProp(self.handle, "IsCego"); end;
	function jogador:getHaveVoice() return _obj_getProp(self.handle, "HaveVoice"); end;
	function jogador:getCodigoInterno() return _obj_getProp(self.handle, "CodigoInterno"); end;
	
	function jogador:__innerRequestSetMode(modo, ativar)
		modo, ativar = Locale.autoEval(modo, ativar);
	
		__serverRequestQueue:addJob(function()
				_obj_invokeNoEval(self.handle, "RequestSetMode", modo, not (not ativar));	
			end);
	end;
	
	function jogador:requestSetCego(cego) self:__innerRequestSetMode("cego", cego); end;	
	function jogador:requestSetMudo(mudo) self:__innerRequestSetMode("mudo", mudo); end;
	function jogador:requestSetVoz(voz) self:__innerRequestSetMode("voz", voz); end;
	function jogador:requestSetJogador(isJogador) self:__innerRequestSetMode("jogador", isJogador); end;
	function jogador:requestKick() __serverRequestQueue:addJob(function() _obj_invoke(self.handle, "RequestKick", ""); end); end;	
	function jogador:getBarValue(index) return _obj_invokeEx(self.handle, "LuaGetBarValue", index); end;
	
	function jogador:requestSetBarValue(index, currentValue, maxValue) 
		index, currentValue, maxValue = Locale.autoEval(index, currentValue, maxValue); 
		
		__serverRequestQueue:addJob(
			function() 
				_obj_invokeExNoEval(self.handle, "LuaRequestSetBarValue", index, currentValue, maxValue); 
			end); 
	end;
	
	function jogador:getEditableLine(index) return _obj_invokeEx(self.handle, "LuaGetEditableLine", index); end;
	function jogador:requestSetEditableLine(index, text) index, text = Locale.autoEval(index, text); __serverRequestQueue:addJob(function() _obj_invokeExNoEval(self.handle, "LuaRequestSetEditableLine", index, text); end); end;	
		
	wObj.props["mesa"] = {getter = "getMesa", tipo = "table"};
	wObj.props["nick"] = {getter = "getNick", tipo = "string"};
	wObj.props["login"] = {getter = "getLogin", tipo = "string"};
	wObj.props["avatar"] = {getter = "getAvatar", tipo = "string"};	
	wObj.props["isGold"] = {getter = "getIsGold", tipo = "bool"};	
	wObj.props["isGoldPlus"] = {getter = "getIsGoldPlus", tipo = "bool"};	
	wObj.props["isRuby"] = {getter = "getIsRuby", tipo = "bool"};	
	wObj.props["isAusente"] = {getter = "getIsAusente", tipo = "bool"};	
	wObj.props["isCnxDormente"] = {getter = "getIsCnxDormente", tipo = "bool"};	
	wObj.props["isSessaoMobile"] = {getter = "getIsSessaoMobile", tipo = "bool"};
	wObj.props["isJuggernaut"] = {getter = "getIsJuggernaut", tipo = "bool"};
	wObj.props["isMestre"] = {getter = "getIsMestre", tipo = "bool"};
	wObj.props["isJogador"] = {getter = "getIsJogador", tipo = "bool"};
	wObj.props["isEspectador"] = {getter = "getIsEspectador", tipo = "bool"};
	wObj.props["isMudo"] = {getter = "getIsMudo", tipo = "bool"};
	wObj.props["isCego"] = {getter = "getIsCego", tipo = "bool"};
	wObj.props["haveVoice"] = {getter = "getHaveVoice", tipo = "bool"};
	wObj.props["haveVoz"] = {getter = "getHaveVoice", tipo = "bool"};
	wObj.props["codigoInterno"] = {getter = "getCodigoInterno", tipo = "int"};
	wObj.props["personagemPrincipal"] = {readProp="PersonagemPrincipal", tipo = "int"};
	wObj.props["id"] = {readProp="ID", tipo = "int"};
	
	return wObj;
end;		
	
--[ OBJETO BIBLIOTECA ITEM ]--			
		
local function initBibliotecaItemWrappedObjectFromHandle(handle)
	local wObj = initWrappedObjectFromHandle(handle); 
	local bibItem = wObj;
	
	function bibItem:getFilhos() 
    	local hs = _obj_getProp(self.handle, "FilhosObjectIDs");
    	local filhos = {};
    	local idx = 1;
    	
    	for p, v in pairs(hs) do
    		filhos[idx] = rrpgWrappers.objectFromID(v);
    		idx = idx + 1;
    	end
    	   	
    	return filhos;	
	end;
	
	function bibItem:__asyncCreateBibItem(bibItemType, params)
		assert(type(params) == "table");
				
		local innerPromise = __serverRequestQueue:addAsyncJob(
			function ()
				return Async.Promise.wrap(_obj_invokeEx(self.handle, "AsyncCreateBibItemObjectID", bibItemType, params));			
			end);			
			
		return Async.Promise.toHandle(innerPromise,
			function (newObjectID)
				local newObj = rrpgWrappers.contextObjectFromID(newObjectID);
				
				if newObj ~= nil then
					return newObj;
				else	
					error("Could not find the new created library item");
				end;
			end);
	end;
	
	function bibItem:asyncCreateChar(charParams)
		if type(charParams) ~= "table" then
			error("charParams must be a table");
		end;
		
		if charParams.name == nil then
			error("Required field: charParams.name");
		end;
		
		if charParams.name == nil then
			error("Required field: charParams.dataType");
		end;		
		
		return bibItem:__asyncCreateBibItem('character', charParams);
	end;
	
	function bibItem:asyncCreateDir(dirParams)
		if type(dirParams) ~= "table" then
			error("dirParams must be a table");
		end;
		
		if dirParams.name == nil then
			error("Required field: dirParams.name");
		end;
		
		return bibItem:__asyncCreateBibItem('directory', dirParams);
	end;	
	
	function bibItem:asyncCreateScene3(gridParams)
		if type(gridParams) ~= "table" then
			error("gridParams must be a table");
		end;
		
		if gridParams.name == nil then
			error("Required field: gridParams.name");
		end;
		
		return bibItem:__asyncCreateBibItem('scene3', gridParams);
	end;		

	function bibItem:asyncDelete()	
		return __serverRequestQueue:addAsyncJob(
			function ()
				return Async.Promise.wrap(_obj_invokeEx(bibItem.handle, "AsyncDelete"));			
			end);			
	end;		

	function bibItem:asyncMoveTo(newParent)			
		if type(newParent) ~= 'table' then
			error('Parameter "newParent" must be an object');
		end;	
	
		return __serverRequestQueue:addAsyncJob(
			function ()
				return Async.Promise.wrap(_obj_invokeEx(bibItem.handle, "AsyncMoveTo", newParent.objectID));			
			end);	
	end;

	function bibItem:asyncUpdate(changes)
		if type(changes) ~= 'table' then
			error('Parameter "changes" must be a table');
		end;	
		
		return __serverRequestQueue:addAsyncJob(
			function ()
				return Async.Promise.wrap(_obj_invokeEx(bibItem.handle, "AsyncUpdate", changes));			
			end);	
	end;		
	
	function bibItem:getFirecastURI()
		return _obj_invokeEx(self.handle, "GetFirecastURI");
	end;
	
	function bibItem:getMesa() return rrpgWrappers.objectFromID(_obj_getProp(self.handle, "MesaObjectID")); end;
	function bibItem:getNome() return _obj_getProp(self.handle, "Nome"); end;
	function bibItem:getPai() return rrpgWrappers.objectFromID(_obj_getProp(self.handle, "ItemMaeObjectID")); end;
	function bibItem:getDono() return rrpgWrappers.objectFromID(_obj_getProp(self.handle, "JogadorOwnerObjectID")); end;		
	function bibItem:getLoginDono() return _obj_getProp(self.handle, "LoginDono"); end;			
	function bibItem:getCriador() return rrpgWrappers.objectFromID(_obj_getProp(self.handle, "JogadorCriadorObjectID")); end;		
	function bibItem:getLoginCriador() return _obj_getProp(self.handle, "LoginCriador"); end;				
	function bibItem:getVisivel() return _obj_getProp(self.handle, "Visivel"); end;	
	function bibItem:getVisivelRecursivamente() return _obj_getProp(self.handle, "VisivelNaHierarquia"); end;		
	function bibItem:getTipo() return _obj_getProp(self.handle, "Tipo"); end;			
	function bibItem:getCodigoInterno() return _obj_getProp(self.handle, "CodigoInterno"); end;	
	
	wObj.props["mesa"] = {getter = "getMesa", tipo = "table"};	
	wObj.props["filhos"] = {getter = "getFilhos", tipo = "table"};
	wObj.props["pai"] = {getter = "getPai", tipo = "table"};
	wObj.props["nome"] = {getter = "getNome", tipo = "string"};
	wObj.props["dono"] = {getter = "getDono", tipo = "table"};
	wObj.props["loginDono"] = {getter = "getLoginDono", tipo = "string"};	
	wObj.props["criador"] = {getter = "getCriador", tipo = "table"};	
	wObj.props["loginCriador"] = {getter = "getLoginCriador", tipo = "string"};		
	wObj.props["visivel"] = {getter = "getVisivel", tipo = "bool"};	
	wObj.props["visivelRecursivamente"] = {getter = "getVisivelRecursivo", tipo = "bool"};		
	wObj.props["tipo"] = {getter = "getTipo", tipo = "string"};		
	wObj.props["codigoInterno"] = {getter = "getCodigoInterno", tipo = "int"};	
	
	wObj.props["room"] = wObj.props["mesa"];	
	wObj.props["parent"] = wObj.props["pai"];
	wObj.props["name"] = wObj.props["nome"];	
	wObj.props["children"] = wObj.props["filhos"];
	wObj.props["firecastURI"] = {getter = "getFirecastURI", tipo = "string"};	
	wObj.props["ownerLogin"] = wObj.props["loginDono"];	
	wObj.props["creatorLogin"] = wObj.props["loginCriador"];
	wObj.props["creator"] = wObj.props["criador"];
	wObj.props["owner"] = wObj.props["dono"];
	wObj.props["visible"] = wObj.props["visivel"];	
	wObj.props["recursiveVisible"] = wObj.props["visivelRecursivamente"];		
	return wObj;
end;		
		
--[ OBJETO PERSONAGEM ]--			

local __PersonagemWrappedObjectProps = {};

for i = 0, 3 do
	local barIndex = i;
	
	__PersonagemWrappedObjectProps["bar" .. tostring(i) .. "Val"] = {tipo = "int", getter = function (personagem)										
																								return _obj_invokeEx(personagem.handle, "GetBarVal", barIndex)											
																						    end};	
																						  
	__PersonagemWrappedObjectProps["bar" .. tostring(i) .. "Max"] = {tipo = "int", getter = function (personagem)
																								return _obj_invokeEx(personagem.handle, "GetBarMax", barIndex)	
																						    end};
end;

for i = 0, 1 do
	local edtLineIndex = i;
	
	__PersonagemWrappedObjectProps["edtLine" .. tostring(i)] = {tipo = "string", getter = function (personagem)
																								return _obj_invokeEx(personagem.handle, "GetEdtLine", edtLineIndex)	
																						    end};			
end;	
		
local function initBibPersonagemWrappedObjectFromHandle(handle)
	local wObj = initBibliotecaItemWrappedObjectFromHandle(handle); 
	local bibItem = wObj;
	
	function bibItem:getDataType() return _obj_getProp(self.handle, "DataType"); end;
	function bibItem:getEscritaBloqueada() return _obj_getProp(self.handle, "EscritaBloqueada"); end;	
	
	function bibItem:loadSheetNDB(callback, params)
		params = params or {};
	
		local ndbBib = require("ndb.lua");
		local ndbHandle = _obj_invokeEx(self.handle, 'GetOrCreateSheetNDB');
		
		local function scheduleFailReturn()
			if callback ~= nil then
				setTimeout(callback, 1, nil);
			end;
		end;
		
		if ndbHandle == nil then
			scheduleFailReturn();		
			return;
		end;
		
		local ndbObj = nil;
		local rootNode = nil;
		
		if ndbHandle ~= nil then
			ndbObj = ndbBib.openNodeDatabaseFromHandle(ndbHandle); 										
		end;
		
		if ndbObj ~= nil then
			rootNode = ndbBib.getRoot(ndbObj);
		end;	

		if rootNode == nil then
			scheduleFailReturn();		
			return;		
		end;	
		
		local state = ndbBib.getState(rootNode);
		
		if (state == "open") or 
   		   ((state == "opening") and (params.skipLoad)) then
			-- Already loaded
			if callback ~= nil then
				callback(rootNode);
			end;
			
			return;
		end;

		-- Not loaded yet, letz monitor
		
		local jaNotificou = false;
		local listenerProvider = nil;
		local listenerLoaded = nil;
		
		local function checkState()
			if not jaNotificou then
				state = ndbBib.getState(rootNode);
			
				if state == "open" then
					jaNotificou = true;
					
					if callback ~= nil then
						setTimeout(callback, 1, rootNode);
					end;
				elseif state == "closed" then
					jaNotificou = true;					
					scheduleFailReturn();
				end;
				
				if jaNotificou then
					ndbObj:removeEventListener(listenerProvider);
					ndbObj:removeEventListener(listenerLoaded);
				end;						
			end;						
		end;
				
		listenerProvider = ndbObj:addEventListener("OnProviderStateChange", checkState);
		listenerLoaded = ndbObj:addEventListener("OnLoaded", checkState);
				
		checkState();		
	end;
	
	function bibItem:asyncOpenNDB(options)
		options = options or {};
		local promise, resolution = Async.Promise.pending();
		
		self:loadSheetNDB(
			function (loadedNDB)
				if loadedNDB ~= nil then
					resolution:setSuccess(loadedNDB);
				else
					resolution:setFailure("Could not load character nodedatabase");
				end;
			end, options);
		
		return promise;
	end;
	
	wObj.props["dataType"] = {getter = "getDataType", tipo = "string"};	
	wObj.props["escritaBloqueada"] = {getter = "getEscritaBloqueada", tipo = "bool"};
	wObj.props["avatar"] = {readProp="Avatar", tipo = "string"};
	
	for k, v in pairs(__PersonagemWrappedObjectProps) do
		wObj.props[k] = v;
	end;	

	wObj.props["editionBlocked"] = wObj.props["escritaBloqueada"];	
	return wObj;
end;			

--[ OBJETO SceneUnitClass ]--			
		
local function initBibSceneUnitClassWrappedObjectFromHandle(handle)
	local wObj = initBibliotecaItemWrappedObjectFromHandle(handle); 
	
	wObj.props["tamanhoX"] = {readProp = "TamanhoX", tipo = "double"};	
	wObj.props["tamanhoY"] = {readProp = "TamanhoY", tipo = "double"};	
	wObj.props["camada"] = {readProp = "Camada", tipo = "enum", values={"tokens", "objects", "background"}};	
	wObj.props["descricao"] = {readProp = "Descricao", tipo = "string"};	
	wObj.props["urlImg"] = {readProp = "URLImg", tipo = "string"};	
	wObj.props["facing"] = {readProp = "Facing", tipo = "enum", values={"rotate", "drawArrow"}};	
	wObj.props["snapToGrid"] = {readProp = "SnapToGrid", tipo = "bool"};	
	wObj.props["direcaoImg"] = {readProp = "DirecaoImg", tipo = "double"};	
	wObj.props["layoutCenterX"] = {readProp = "LayoutCenterX", tipo = "double"};	
	wObj.props["layoutCenterY"] = {readProp = "LayoutCenterY", tipo = "double"};	
	wObj.props["layoutTamX"] = {readProp = "LayoutTamX", tipo = "double"};	
	wObj.props["layoutTamY"] = {readProp = "LayoutTamY", tipo = "double"};	
	
	return wObj;
end;			
				
				
--[ OBJETO CHAT ]--				

local function _setupCallbackTrapForUniqueRoll(idOfRoll, callbackFunction)
	local trabTable = {};

	trabTable.listenerId = rrpg.messaging.listenOnce("InternalRollCallbackReceive",
		function(msg)
			clearTimeout(trabTable.timeoutId);
			trabTable.timeoutId = nil;
						
			if type(callbackFunction) == "function" then
				local rolagemObject = rrpg.loadRolagemFromBase64EncodedString(msg.rollBase64 or "");				
				callbackFunction(rolagemObject);
			end;
		end, {id=idOfRoll});
		
	trabTable.timeoutId = setTimeout(
						    function()
								rrpg.messaging.unlisten(trabTable.listenerId);
								trabTable.listenerId = nil;
							end, 120000);
end;

local _NULL_FUNCTION = function() end;
local _NULL_ARRAY_FUNCTION = function() return {}; end;
local _NULL_PROMISE_FUNCTION = function() Async.Promise.failed("Chat is not alive"); end;

rrpgWrappers.NullChatWrapper = {enviarMensagem = _NULL_FUNCTION, 
								rolarDados = _NULL_FUNCTION,
								enviarAcao = _NULL_FUNCTION,
								enviarRisada = _NULL_FUNCTION,
								enviarMensagemNPC = _NULL_FUNCTION,
								enviarNarracao = _NULL_FUNCTION,
								setImpersonation = _NULL_FUNCTION,
								readLogRecs = _NULL_ARRAY_FUNCTION,
								asyncQueryLogRecs = _NULL_PROMISE_FUNCTION,
								asyncSendLaugh = _NULL_PROMISE_FUNCTION,
								asyncSendAction = _NULL_PROMISE_FUNCTION,
								asyncSendStd = _NULL_PROMISE_FUNCTION,
								asyncInvite = _NULL_PROMISE_FUNCTION,
								participants = {},
								medium = {kind="undefined"}
								};
								
local function initBaseChatWrappedObjectFromHandle(handle)
	local wObj = initWrappedObjectFromHandle(handle); 
	local wChat = wObj;
	
	function wChat:_getTimedJobQueue()
		local queue = rawget(self, "_timedJobQueue");
		
		if queue == nil then
			queue = newTimedJobQueue(250);
			rawset(self, "_timedJobQueue", queue);
		end;
		
		return queue;
	end;
	
	function wChat:_getLongTimedJobQueue()
		local queue = rawget(self, "_longTimedJobQueue");
		
		if queue == nil then
			queue = newTimedJobQueue(1000);
			rawset(self, "_longTimedJobQueue", queue);
		end;
		
		return queue;
	end;	
	
	function wChat:escrever(texto, quebrarLinha, permitirSmileys) 
		if quebrarLinha == nil then
			quebrarLinha = true;
		end;
	
		if permitirSmileys == nil then
			permitirSmileys = true;
		end;
			
		if texto ~= nil then
			return _obj_invokeEx(self.handle, "Escrever", tostring(texto), quebrarLinha, permitirSmileys);
		end;
	end;
	
	function wChat:enviarMensagem(msg, callback) 
		msg = Locale.autoEval(tostring(msg));
		
		if msg ~= nil then	
			local queue = self:_getTimedJobQueue()
	
	        function queuedSendTheMessage()
				if self.handle ~= nil then							
					_obj_invokeNoEval(wChat.handle, "EnviarMensagem", msg);
					
					if type(callback) == 'function' then
						callback();
					end;
				end;
			end;
	        
			queue:addJob(queuedSendTheMessage);		
		end;
	end;
	
	function wChat:enviarMensagemNPC(npc, msg, callback) 
		npc, msg = Locale.autoEval(npc, msg);
	
		if msg ~= nil and npc ~= nil then	
			local queue = self:_getTimedJobQueue()
		
			queue:addJob(function()		
					if self.handle ~= nil then							
						_obj_invokeNoEval(wChat.handle, "EnviarMensagemNPC", tostring(npc), tostring(msg));
						
						if type(callback) == 'function' then
							callback();
						end;
					end;
				end);		
		end;
	end;	
	
	function wChat:enviarNarracao(msg, callback) 
		msg = Locale.autoEval(msg);
	
		if msg ~= nil then	
			local queue = self:_getTimedJobQueue()
		
			queue:addJob(function()		
					if self.handle ~= nil then							
						_obj_invokeNoEval(wChat.handle, "EnviarNarracao", tostring(msg));
						
						if type(callback) == 'function' then
							callback();
						end;
					end;
				end);		
		end;
	end;	
	
	function wChat:enviarAcao(acao, callback) 
		acao = Locale.autoEval(acao);
	
		if acao ~= nil then	
			local queue = self:_getTimedJobQueue()
		
			queue:addJob(function()		
					if self.handle ~= nil then							
						_obj_invokeNoEval(wChat.handle, "EnviarAcao", tostring(acao));
						
						if type(callback) == 'function' then
							callback();
						end;
					end;
				end);		
		end;
	end;	
	
	function wChat:enviarRisada(callback) 
		local queue = self:_getTimedJobQueue()
	
		queue:addJob(function()		
				if self.handle ~= nil then							
					_obj_invoke(wChat.handle, "EnviarRisada");
					
					if type(callback) == 'function' then
						callback();
					end;
				end;
			end);		
	end;		
	
	function wChat:rolarDados(rolagem, msg, callbackFunction) 
		local rolAsStr;
		msg = Locale.autoEval(msg);
		
		if type(rolagem) == "string" then
			rolAsStr = Locale.autoEval(rolagem);
		elseif (type(rolagem) == "table") and (rolagem.getAsString ~= nil) then
			rolAsStr = rolagem:getAsString();		
		else
			rolAsStr = nil;
		end;
		
		if rolAsStr ~= nil then
			local queue = self:_getTimedJobQueue()
			--local queue = __serverRequestQueue;
			
			if type(callbackFunction) == "function" then
				local idUnicaRolagem = _rrpg_generateUniqueMessageIDForMe();
				_setupCallbackTrapForUniqueRoll(idUnicaRolagem, callbackFunction);	

				queue:addJob(
					function ()
						if self.handle ~= nil then
							return _obj_invokeNoEval(self.handle, "EnviarRolagemEx", rolAsStr, msg, idUnicaRolagem);
						end;
					end);	
			else
				queue:addJob(
					function ()
						if self.handle ~= nil then
							return _obj_invokeNoEval(self.handle, "EnviarRolagem", rolAsStr, msg);
						end;
					end);								
			end;
		end;
	end;	
	
	function wChat:getRoom()
		local selfHandle = rawget(self, "handle");
		
		if selfHandle ~= nil then
			mesaObjectID = _rrpg_tryGetMesaObjectIDRelatedToHandle(selfHandle);		
			
			if (mesaObjectID ~= nil) then
				mesaObjectID = tonumber(mesaObjectID);
			end;
			
			if mesaObjectID ~= nil then
				return rrpgWrappers.contextObjectFromID(mesaObjectID);
			end;
		end;			
	end;
			
	function wChat:__asyncSendEx(msgDesc, params) 	
		local finalMsgDesc = Utils.cloneTable(params) or {};
		
		for k, v in pairs(msgDesc) do
			finalMsgDesc[k] = v;
		end;
				
		local queue = self:_getTimedJobQueue()
		
		return queue:addAsyncJob(
			function()
				return Async.Promise.wrap(_obj_invokeEx(self.handle, "AsyncSendEx", finalMsgDesc));
			end);	
	end;
			
	function wChat:asyncSendStd(content, params) 						
		return self:__asyncSendEx({msgType="standard", content=content}, params);
	end;
	
	function wChat:asyncSendAction(content, params) 						
		return self:__asyncSendEx({msgType="action", content=content}, params);
	end;
	
	function wChat:asyncSendLaugh(params) 						
		return self:__asyncSendEx({msgType="laugh"}, params);
	end;	
	
	function wChat:asyncRoll(expression, message, params) 			
		local expressionAsStr;

		if type(expression) == "string" then
			expressionAsStr = Locale.autoEval(expression);
		elseif (type(expression) == "table") and (expression.getAsString ~= nil) then
			expressionAsStr = expression:getAsString();		
		else
			expressionAsStr = nil;
		end;
	
		local sendPromise = self:__asyncSendEx({msgType="dice", expression=expressionAsStr, content=message}, params);
		
		return sendPromise:thenDo(
			function(logRec)				
				local roll = logRec.msg.roll;
				assert(roll ~= nil);
				
				return roll.resultado, roll, logRec;
			end);		
	end;		
	
	function wChat:readLogRecs() 
		return _obj_invokeEx(self.handle, "ReadValidLogRecs");
	end;
	
	function wChat:getImpersonation() 
		return _obj_invokeEx(self.handle, "GetUIImpersonation");
	end;	
	
	function wChat:setImpersonation(impersonation)
		return _obj_invokeEx(self.handle, "SetUIImpersonation", impersonation);
	end;
	
	function wChat:getTalemarkOptions()
		return _obj_invokeEx(self.handle, "GetTalemarkOptions");
	end;	
	
	function wChat:setTalemarkOptions(options)
		return _obj_invokeEx(self.handle, "SetTalemarkOptions", options);
	end;		
		
	function wChat:getMedium()
		return _obj_invokeEx(self.handle, "GetMedium");
	end;		
	
	function wChat:getParticipants() 
		return _obj_invokeEx(self.handle, "GetParticipants");
	end;
	
	function wChat:asyncQueryLogRecs(params) 		
		params = Utils.cloneTable(params or {});
		
		local queue = self:_getLongTimedJobQueue()
		
		return queue:addAsyncJob(
			function()
				return Async.Promise.wrap(_obj_invokeEx(self.handle, "AsyncQueryLogRecsFromServer", params));
			end);	
	end;		
	
	function wChat:writeEx(text, talemarkOptions) 		
		return _obj_invokeEx(self.handle, "WriteEx", text, talemarkOptions);	
	end;	
				
	function wChat:asyncInvite(logins)
		local clonedLogins = Utils.cloneTable(logins);
	
		return __serverRequestQueue:addAsyncJob(
			function ()
				local promiseHandle = _obj_invokeEx(self.handle, "AsyncInvite", clonedLogins);
				return Async.Promise.wrap(promiseHandle);				
			end);
	end;
				
	wChat.props["room"] = {getter = "getRoom", tipo = "table"};	
	wChat.props["impersonation"] = {getter = "getImpersonation", setter = "setImpersonation", tipo = "table"};	
	wChat.props["talemarkOptions"] = {getter = "getTalemarkOptions", setter="setTalemarkOptions", tipo = "table"};	
	wChat.props["medium"] = {getter = "getMedium", tipo = "table" };
	wChat.props["participants"] = {getter = "getParticipants", tipo = "table" };	
		
	-- aliases
	wChat.write = wChat.escrever;
	
	return wObj;
end;
		
function rrpgWrappers.contextObjectFromID(objectID)
	local ctxObj = localStrongRefContextoObjects[objectID];
	
	if ctxObj ~= nil then
		return ctxObj;
	end;
	
	local objWrapperHandle;	
	objWrapperHandle = _rrpg_GetOrCreateObjectWrapperForObjectID(objectID);
	
	if objWrapperHandle == nil then
		return nil;
	end;
	
	ctxObj = objs.tryFindFromHandle(objWrapperHandle);
	
	if ctxObj ~= nil then
		if _rrpg_IsObjectIDAlive(objectID) then	
			localStrongRefContextoObjects[objectID] = ctxObj;
		end;
		
		return ctxObj;
	end;
		
	
	if _rrpg_IsWrapperOfType(objWrapperHandle, "mesa") then
		ctxObj = initMesaWrappedObjectFromHandle(objWrapperHandle); 
	elseif _rrpg_IsWrapperOfType(objWrapperHandle, "jogador") then
		ctxObj = initJogadorWrappedObjectFromHandle(objWrapperHandle); 
	elseif _rrpg_IsWrapperOfType(objWrapperHandle, "personagem") then		
		ctxObj = initBibPersonagemWrappedObjectFromHandle(objWrapperHandle); 	
	elseif _rrpg_IsWrapperOfType(objWrapperHandle, "sceneUnitClass") then		
		ctxObj = initBibSceneUnitClassWrappedObjectFromHandle(objWrapperHandle); 			
	elseif _rrpg_IsWrapperOfType(objWrapperHandle, "bibliotecaItem") then  -- Deve ser o ultimo dos IFs dos Wrappers dos tipos de item de biblioteca
		ctxObj = initBibliotecaItemWrappedObjectFromHandle(objWrapperHandle); 		
	elseif _rrpg_IsWrapperOfType(objWrapperHandle, "chatBase") then  -- Deve ser o ultimo dos IFs dos Wrappers dos tipos de CHAT
		ctxObj = initBaseChatWrappedObjectFromHandle(objWrapperHandle); 		
	else
		ctxObj = initWrappedObjectFromHandle(objWrapperHandle);
	end;
	
	objs.registerHandle(objWrapperHandle, ctxObj);
	
	if _rrpg_IsObjectIDAlive(objectID) then
		localStrongRefContextoObjects[objectID] = ctxObj;	
	end;
	
	return ctxObj;
end;		

function rrpgWrappers.objectFromID(objectID)
	return rrpgWrappers.contextObjectFromID(objectID);
end;

function _INTERNAL_EVE_OnWrappedObjectWasDestroyed(objectID)					
	localStrongRefContextoObjects[objectID] = nil;  -- Permitir o Garbage Collector coletar este objeto
end;

function _INTERNAL_AUX_ContextObjectFromID(objectID)
	return rrpgWrappers.contextObjectFromID(objectID);
end;

function _INTERNAL_AUX_NullChatWrapper()
	return rrpgWrappers.NullChatWrapper;
end;

SharedObjects.registerUnpacker(SHARED_OBJECT_TYPE,
	function (sid)
		local objectIdN = tonumber(sid.objectID);
		
		if objectIdN ~= nil then
			return rrpgWrappers.contextObjectFromID(objectIdN);
		else
			return nil;
		end;
	end);

return rrpgWrappers;