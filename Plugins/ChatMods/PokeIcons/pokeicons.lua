require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
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

Firecast.listen('HandleChatTextInput',
    function(message)
    	if string.match(message.texto, ":") then
    		local text = "";

			local arg = {};
			local index = 0;
			for i in string.gmatch(message.texto, "%S+") do
				index = index + 1;
				arg[index] = i;
			end;

			local changed = false;
			for i=1, #arg, 1 do
				local token = arg[i];

				local dot1 = string.sub(token, 1, 1);
				local dot2 = string.sub(token, token:len(), token:len());

				local num;
				local rest = "";
				

				if dot1==":" and dot2==":" then
					num = string.sub(token, 2, 4);
					num = tonumber(num);
					rest = string.sub(token, 5, token:len()-1);

					if num ==nil then
						num = string.sub(token, 2, 3);
						num = tonumber(num);
						rest = string.sub(token, 4, token:len()-1);
					end;
					if num ==nil then
						num = string.sub(token, 2, 2);
						num = tonumber(num);
						rest = string.sub(token, 3, token:len()-1);
					end;
				end;

				if num ~=nil then
					if num>=1 and num <=807 then
						if num<10 then
							num = "00" .. num .. rest;
						elseif num<100 then
							num = "0" .. num .. rest;
						else
							num = "" .. num .. rest;
						end;
						changed = true;
						arg[i] = "[§I http://www.serebii.net/pokedex-sm/icon/" .. num .. ".png]";
					end;
				end;
				text = text.. arg[i] .. " " ;
			end;
			if changed then
				message.response = {newText = text};
			end;
    	end;    
    end);

-- Implementação dos comandos
Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "unown" then
			if message.parametro ~= nil and message.parametro ~= "" then
				local text = "";
				local length = string.len(message.parametro);
				local input = string.lower(message.parametro);

				for i=1, length, 1 do
					local letter = string.sub(input, i, i);

					if letter == 'a' then
						text = text .. "[§I http://www.serebii.net/pokedex-bw/icon/201.png]";
					elseif letter == '?' then
						text = text .. "[§I http://www.serebii.net/pokedex-sm/icon/201-qm.png]";
					elseif letter == '!' then
						text = text .. "[§I http://www.serebii.net/pokedex-sm/icon/201-em.png]";
					elseif letter >= 'b' and letter <= 'z' then
						text = text .. "[§I http://www.serebii.net/pokedex-sm/icon/201-" .. letter .. ".png]";
					else
						text = text .. "[§I http://firecast.blob.core.windows.net/blobs/HKJSWOFE_393972.png]";
					end;
				end;

				message.chat:enviarMensagem(text);
			else
				message.chat:escrever("Use: /unown <frase>");
				message.chat:escrever("Cada letra vai ser trocada por um unown");
			end;
			message.response = {handled = true};
		elseif message.comando == "pokecode" then
			message.chat:escrever("Cada numero entre 1 e 802 entre ':' vai ser substituido por um pokemon.");
			message.chat:escrever("Seguir o numero com -m -mx ou -my permite exibir mega evoluções.");
			message.chat:escrever("Seguir o numero com -a permite exibir Alolan Forms.");
			message.chat:escrever("Alguns pokémons tem codigos adicionais que podem ser colocados após seus numeros para exibir suas formas alternativas.");
			message.chat:escrever("Pikachu 25 -a -b -c -f -h -k -l -o -phd -ps -r -s -u");
			message.chat:escrever("Unown 201 -[b:z] -qm -em");
			message.chat:escrever("Castform 351 -s -r -i");
			message.chat:escrever("Deoxys 386 a d s");
			message.chat:escrever("Burmy 412 -s -t");
			message.chat:escrever("Wordmadam 413 -s -t");
			message.chat:escrever("Cherrim 421 -s");
			message.chat:escrever("Shellos 422 e");
			message.chat:escrever("Fastrodon 423 e");
			message.chat:escrever("Rotom 479 s f h m w");
			message.chat:escrever("Giratina 487 o");
			message.chat:escrever("Shaymin 492 s");
			message.chat:escrever("Basculin 550 b");
			message.chat:escrever("Darmanitan 555 b");
			message.chat:escrever("Deerling 585 -s -a -w");
			message.chat:escrever("Thornadus 641 -s");
			message.chat:escrever("Thundurus 642 -s");
			message.chat:escrever("Landorus 645 -s");
			message.chat:escrever("Kyurem 646 -b -w");
			message.chat:escrever("Keldeo 647 -r");
			message.chat:escrever("Meloetta 648 -p");
			message.chat:escrever("Greninja 658 -a");
			message.chat:escrever("Vivillon 666 -a -c -e -f -g -h -i -j -ma -mo -mon -o -p -pb -r -s -sa -su -t");
			message.chat:escrever("Flabebe 669 -b -o -w -y");
			message.chat:escrever("Floette 670 -b -o -w -y");
			message.chat:escrever("Florges 671 -b -o -w -y");
			message.chat:escrever("Furfrou 676 -h -s -d -da -de -k -l -m -p");
			message.chat:escrever("Aegislash 681 -b");
			message.chat:escrever("Xernes 716 -n");
			message.chat:escrever("Zygarde 718 -10 -c");
			message.chat:escrever("Hoopa 720 -u");
			message.chat:escrever("Oricorio 741 -p -pau -s");
			message.chat:escrever("Lycanroc 745 -m");
			message.chat:escrever("Wishiwashi 746 -s");
			message.chat:escrever("Minior 774 -g -i -o -r -v -y -b");

			message.response = {handled = true};
		end
	end);

Firecast.Messaging.listen("ListChatCommands",
        function(message)
            message.response = {{comando="/unown <Texto>", descricao="Troca o texto por unown para cada letra. "},
                                {comando="/pokecode", descricao="Exibe codigos para usar memes de Pokémon. v0.5"}};
        end);

-- auto-update
Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/PokeIcons/output/PokeIcons.rpk?raw=true",
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
                    Dialogs.choose("Há uma nova versão do PokéIcons (".. info.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/PokeIcons/output/PokeIcons.rpk?raw=true');
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