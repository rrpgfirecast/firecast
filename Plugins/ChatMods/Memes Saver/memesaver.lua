require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("locale.lua");
require("internet.lua");

local config = NDB.load("config.xml");

local function isNewVersion(installed, downloaded)
    local installedVersion = {};
    local installedIndex = 0;
    for i in string.gmatch(installed, "[^%.]+") do
        installedIndex = installedIndex +1;
        installedVersion[installedIndex] = i;
    end

    local downloadedVersion = {};
    local downloadedIndex = 0;
    for i in string.gmatch(downloaded, "[^%.]+") do
        downloadedIndex = downloadedIndex +1;
        downloadedVersion[downloadedIndex] = i;
    end

    for i=1, math.min(installedIndex, downloadedIndex), 1 do 
        if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
            return false;
        elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
            return true;
        end;
    end;

    if downloadedIndex > installedIndex then
        return true;
    else
        return false;
    end;
end;

memedb = NDB.load("memeData.xml");
-- Criando lista padrão de memes. 
if memedb.link==nil then
	memedb.link = {};
	memedb.link["rrpg"] = "http://blob.firecast.com.br/blobs/PGGSIDUU_468392/Firecast.png";
	memedb.link["firecast"] = "http://blob.firecast.com.br/blobs/PGGSIDUU_468392/Firecast.png";
	memedb.link["aliens"] = "http://blob.firecast.com.br/blobs/KDDLSAAE_468484/aliens.png";
	memedb.link["badass"] = "http://blob.firecast.com.br/blobs/WJLVQFUH_468487/badass.png";
	memedb.link["cage"] = "http://blob.firecast.com.br/blobs/IREQBACR_468489/cage.jpg";
	memedb.link["cena"] = "http://blob.firecast.com.br/blobs/FNRCUUBM_468495/cena.png";
	memedb.link["aceito"] = "http://blob.firecast.com.br/blobs/EIQTLCQE_468497/challenge.png";
	memedb.link["quase"] = "http://blob.firecast.com.br/blobs/OCHIQSGK_468515/close.png";
	memedb.link["erou"] = "http://blob.firecast.com.br/blobs/CSCQKDDN_468483/erou.png";
	memedb.link["facepalm"] = "http://blob.firecast.com.br/blobs/PDTUVVQQ_468491/facepalm.png";
	memedb.link["gtfo"] = "http://blob.firecast.com.br/blobs/VWUQCGFU_468517/gtfo.png";
	memedb.link["harold"] = "http://blob.firecast.com.br/blobs/UUKGORSD_468501/harold.png";
	memedb.link["impossibru"] = "http://blob.firecast.com.br/blobs/VAMNFCAL_468507/impossibru.jpg";
	memedb.link["kappa"] = "http://blob.firecast.com.br/blobs/ATGQVIMR_165515.png";
	memedb.link["lied"] = "http://blob.firecast.com.br/blobs/LQGFFRHO_468503/lied.png";
	memedb.link["nerd"] = "http://blob.firecast.com.br/blobs/IQNTMUPG_468505/nerd.jpg";
	memedb.link["pepe"] = "http://blob.firecast.com.br/blobs/QCIUGTFP_468493/pepe.png";
	memedb.link["pcmr"] = "http://blob.firecast.com.br/blobs/NESHEREB_468509/pcmr.png";
	memedb.link["steam"] = "http://blob.firecast.com.br/blobs/NGUJLUEJ_468511/steam.png";
	memedb.link["yeah"] = "http://blob.firecast.com.br/blobs/PJSREAWF_468513/yeah.png";
end;

function getConfigWindow(mesa)
	local cfgForm = GUI.newForm("listPopup");
	memedb.load = true;
	cfgForm:setNodeObject(memedb);
	cfgForm.title = "Meme Saver - " .. mesa.nome;
	popup = cfgForm;
	
	return cfgForm;
end

-- Percorre a tabela de nodes, vendo os filhos. 
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

Firecast.listen('HandleChatTextInput',
    function(message)
    	-- Se tiver algum ":" na mensagem veja se é um meme salvo
    	if string.match(message.texto, ":") then
    		local text = "";

    		-- Crie um array com cada palavra da frase separada por espaço
			local arg = {};
			local index = 0;
			for i in string.gmatch(message.texto, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			-- Para cada palavra na frase veja
			local changed = false;
			for i=1, #arg, 1 do
				local token = Utils.removerFmtChat(arg[i]);

				local dot1 = string.sub(token, 1, 1);
				local dot2 = string.sub(token, token:len(), token:len());

				local meme;

				-- Se a palavra termina e começa em ":" veja se existe um url associado a palavra e salve o url
				if dot1==":" and dot2==":" then
					local tk = string.sub(token, 2, token:len()-1);
					meme = memedb.link[tk];
				end;

				-- Se existe um url associado faça a troca da palavra por ele e marque que você alterou algo. 
				if meme ~=nil then
					changed = true;
					arg[i] = "[§I " .. meme .. "]";
				end;
				text = text .. arg[i] .. " ";
			end;
			-- Se algo foi alterado envie esse texto alterado no lugar. 
			if changed then
				message.response = {newText = text};
			end;
    	end;
        
    end);

-- Implementação dos comandos
Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		-- Exibe todos memes salvos. 
		if message.comando == "memesaver" then
			local cfgForm = getConfigWindow(message.mesa);

			if (cfgForm) then
				cfgForm:show();
			end;

			message.response = {handled = true};
		elseif message.comando == "savedmemes" then
			message.chat:escrever(lang("memes.savedMemes") .. ": ");

			local list = {};
			-- concatena palavras associadas ao mesmo url
			for k,v in pairs(memedb.link) do
		        if list[dump(v)] == nil then
		        	list[dump(v)] = " = :" .. k .. ":";
		        else
		        	list[dump(v)] = list[dump(v)] .. ", :" .. k .. ":";
		        end
		    end

		    -- Envia no chat as imagens e suas palvras associadas.
		    local s = "";
			for k,v in pairs(list) do
				s = s .. '[§I '..k..']' .. dump(v) .. '\n';
			end

		    message.chat:escrever(s);

			message.response = {handled = true};

		-- Quando quando quiser adicionar um nobo item a lista
		elseif (message.comando == "addmeme") or (message.comando == "savememe") then

			-- Quebra os parametros nos espaços
			local arg = {};
			local index = 0;
			for i in string.gmatch(message.parametro, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			-- Caso o comando tenha recibido parametros insuficientes, da instruções de uso
			if index < 2 then
				message.chat:escrever(lang("memes.addMeme.commandInstruction"));
				message.response = {handled = true};
				return;
			end;

			-- Pega o texto de feedback de sucesso e adiciona o url a ele
			local text =  string.format(lang("memes.addMeme.successFeedback") .. ": ", arg[1]);
			
			-- salva o url para cada nome passado nos parametros
			for i=2, #arg, 1 do
				memedb.link[arg[i]] = arg[1];
				text = text .. arg[i];
				if i ~= #arg then
					text = text .. ", ";
				end;
			end;

			-- Da a mensagem de sucesso
			message.chat:escrever(text);

			message.response = {handled = true};
		-- Trata o comando de remoção de meme
		elseif (message.comando == "removermeme") or (message.comando == "removememe") then

			-- Quebra os parametros nos espaços
			local arg = {};
			local index = 0;
			for i in string.gmatch(message.parametro, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			-- Caso o comando tenha recibido parametros insuficientes, da instruções de uso
			if index < 1 then
				message.chat:escrever(lang("memes.removeMeme.commandInstruction"));
				message.response = {handled = true};
				return;
			end;

			-- Pega o texto de feedback de sucesso e adiciona o url a ele
			local text = string.format(lang("memes.removeMeme.successFeedback") .. ": ", memedb.link[arg[1]]);
			
			-- remove o link associado as palavras
			for i=1, #arg, 1 do
				memedb.link[arg[i]] = nil;
				text = text .. arg[i];
				if i ~= #arg then
					text = text .. ", ";
				end;
			end;

			message.chat:escrever(text);

			message.response = {handled = true};
		-- Exibe os memes salvos num formato util para compartilha-los
		elseif message.comando == "memeshare" then
			message.chat:escrever(lang("memes.savedMemes") .. ": ");

			local list = {};

			-- concatena palavras associadas ao mesmo url
			for k,v in pairs(memedb.link) do
		        if list[dump(v)] == nil then
		        	list[dump(v)] = k;
		        else
		        	list[dump(v)] = list[dump(v)] .. " " .. k;
		        end
		    end

		    -- Exibe a lista ja com o comando para add os memes. Passe essa lista a um colega para ele copiar seus memes
			local s = "";
			for k,v in pairs(list) do
		        s = s .. '/addmeme '..k..' ' .. dump(v) .. '\n';
		    end

		    message.chat:escrever(s);
		    message.response = {handled = true};
		end
	end);

Firecast.Messaging.listen("ListChatCommands",
        function(message)
                message.response = {
                					{comando="/savedmemes", descricao=lang("memes.savedMemes.commandDescription") .." v0.2"},
                                    {comando="/addmeme (or savememe) <link> <name list>", descricao=lang("memes.addMeme.commandDescription")},
                                    {comando="/removememe <name>", descricao=lang("memes.removeMeme.commandDescription")},
                                    {comando="/memeshare", descricao=lang("memes.memeShare.commandDescription")}
                                    };
        end);

Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/Memes%20Saver/output/Memes%20Saver.rpk?raw=true",
            function(stream, contentType)
                local info = Firecast.Plugins.getRPKDetails(stream);
                config.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;

                local installed = Firecast.Plugins.getInstalledPlugins();
                local myself;
                for i=1, #installed, 1 do
                    if installed[i].moduleId == info.moduleId then
                        myself = installed[i];
                        config.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                    end;
                end;

                if config.noUpdate==true then return end;
                if myself~= nil and isNewVersion(myself.version, info.version) then
                    Dialogs.choose("Há uma nova versão do Memes Saver (".. info.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/Memes%20Saver/output/Memes%20Saver.rpk?raw=true');
                            elseif selected and selectedIndex == 3 then
                                config.noUpdate = true;
                            end;
                        end);
                end;
            end,       
            function (errorMsg)
                --showMessage(errorMsg);
            end,       
            function (downloaded, total)
                -- esta função será chamada constantemente.
                -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
            end);