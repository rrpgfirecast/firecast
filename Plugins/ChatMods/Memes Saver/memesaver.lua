require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("locale.lua");
require("internet.lua");

local config = ndb.load("config.xml");

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

memedb = ndb.load("memeData.xml");
if memedb.link==nil then
	memedb.link = {};
	memedb.link["rrpg"] = "http://blob.firecast.com.br/blobs/PGGSIDUU_468392/rrpg.png";
	memedb.link["firecast"] = "http://blob.firecast.com.br/blobs/PGGSIDUU_468392/rrpg.png";
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

rrpg.listen('HandleChatTextInput',
    function(message)
    	if string.match(message.texto, ":") then
		    local changed = false;
				
			local replacedText = string.gsub(message.texto, "%S+",
				function(originalMatchedWord)
					local token = originalMatchedWord;

					local dot1 = string.sub(token, 1, 1);
					local dot2 = string.sub(token, token:len(), token:len());

					local meme;

					if dot1==":" and dot2==":" then
						local tk = string.sub(token, 2, token:len()-1);
						meme = memedb.link[tk];
					end;

					if meme ~=nil then
						changed = true;
						return "[§I " .. meme .. "]";
					else
						return originalMatchedWord;							
					end;
				end);

			if changed then
				message.response = {newText = replacedText};
			end;
    	end;
        
    end);

-- Implementação dos comandos
rrpg.messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "savedmemes" then
			message.chat:escrever(lang("memes.savedMemes") .. ": ");

			local list = {};

			for k,v in pairs(memedb.link) do
		        if list[dump(v)] == nil then
		        	list[dump(v)] = " = :" .. k .. ":";
		        else
		        	list[dump(v)] = list[dump(v)] .. ", :" .. k .. ":";
		        end
		    end

		    local s = "";
			for k,v in pairs(list) do
				s = s .. '[§I '..k..']' .. dump(v) .. '\n';
			end

		    message.chat:escrever(s);

			message.response = {handled = true};
		elseif (message.comando == "addmeme") or (message.comando == "savememe") then

			local arg = {};
			local index = 0;
			for i in string.gmatch(message.parametro, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			if index < 2 then
				message.chat:escrever(lang("memes.addMeme.commandInstruction"));
				message.response = {handled = true};
				return;
			end;

			local text =  string.format(lang("memes.addMeme.successFeedback") .. ": ", arg[1]);
			
			for i=2, #arg, 1 do
				memedb.link[arg[i]] = arg[1];
				text = text .. arg[i];
				if i ~= #arg then
					text = text .. ", ";
				end;
			end;

			message.chat:escrever(text);

			message.response = {handled = true};
		elseif (message.comando == "removermeme") or (message.comando == "removememe") then

			local arg = {};
			local index = 0;
			for i in string.gmatch(message.parametro, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			if index < 1 then
				message.chat:escrever(lang("memes.removeMeme.commandInstruction"));
				message.response = {handled = true};
				return;
			end;

			local text = string.format(lang("memes.removeMeme.successFeedback") .. ": ", memedb.link[arg[1]]);
			
			for i=1, #arg, 1 do
				memedb.link[arg[i]] = nil;
				text = text .. arg[i];
				if i ~= #arg then
					text = text .. ", ";
				end;
			end;

			message.chat:escrever(text);

			message.response = {handled = true};
		elseif message.comando == "memeshare" then
			message.chat:escrever(lang("memes.savedMemes") .. ": ");

			local list = {};

			for k,v in pairs(memedb.link) do
		        if list[dump(v)] == nil then
		        	list[dump(v)] = k;
		        else
		        	list[dump(v)] = list[dump(v)] .. " " .. k;
		        end
		    end

			local s = "";
			for k,v in pairs(list) do
		        s = s .. '/addmeme '..k..' ' .. dump(v) .. '\n';
		    end

		    message.chat:escrever(s);
		    message.response = {handled = true};
		end
	end);

rrpg.messaging.listen("ListChatCommands",
        function(message)
                message.response = {
                					{comando="/savedmemes", descricao=lang("memes.savedMemes.commandDescription") .." v0.2"},
                                    {comando="/addmeme (or savememe) <link> <name list>", descricao=lang("memes.addMeme.commandDescription")},
                                    {comando="/removememe <name>", descricao=lang("memes.removeMeme.commandDescription")},
                                    {comando="/memeshare", descricao=lang("memes.memeShare.commandDescription")}
                                    };
        end);

internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/Memes%20Saver/output/Memes%20Saver.rpk?raw=true",
            function(stream, contentType)
                local info = rrpg.plugins.getRPKDetails(stream);
                config.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;

                local installed = rrpg.plugins.getInstalledPlugins();
                local myself;
                for i=1, #installed, 1 do
                    if installed[i].moduleId == info.moduleId then
                        myself = installed[i];
                        config.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                    end;
                end;

                if config.noUpdate==true then return end;
                if myself~= nil and isNewVersion(myself.version, info.version) then
                    Dialogs.choose("Há uma nova versão do Memes Saver (".. infor.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/Memes%20Saver/output/Memes%20Saver.rpk?raw=true');
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