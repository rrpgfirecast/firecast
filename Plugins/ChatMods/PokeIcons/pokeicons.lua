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

local pokeTable = {};
-- fill table with :x:, :0x: and :00x: varieties
for i=1, 9 do
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end
for i=1, 9 do
	pokeTable["0"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end
for i=1, 9 do
	pokeTable["00"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end

-- fill table with :xx: and :0xx: varieties
for i=10, 99 do
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
end
for i=10, 99 do
	pokeTable["0"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
end

-- fill table with :xxx: varieties
for i=100, 898 do
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. i .. ".png]";
end

-- fill table with -m [mega] varieties
local varieties = {"003", "009","065", "094", "115", "127", "130", "142", "181", "212", "214", "229", "248", "257", "282", "303", "306", "308", "310", "354", "359", "380", "381", "445", "448", "460", "015", "018", "080", "208", "254", "260", "302", "319", "323", "334", "362", "373", "376", "384", "428", "475", "531", "719", "800"}
local var = "-m"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"03","09", "65", "94", "15", "18", "80"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end
local varieties = {"3", "9"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. varieties[i]..var .. ".png]";
end
-- fill table with -mx [mega-x] varieties
local varieties = {"006", "150"}
local var = "-mx"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
pokeTable["6-mx"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-mx.png]";
pokeTable["06-mx"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-mx.png]";
-- fill table with -my [mega-y] varieties
local varieties = {"006", "150"}
local var = "-my"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
pokeTable["6-my"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-my.png]";
pokeTable["06-my"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-my.png]";

-- fill table with -gi [gigantamax] varieties
local varieties = {"003", "006", "009", "012","025","052","068","094","099", "131", "133", "143", "569", "809", "812", "815", "818", "823", "826", "834", "839", "841", "842", "844", "849", "851", "858", "861", "869", "879", "884", "892"}
local var = "-gi"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"03", "06","09", "12", "25", "52", "68", "94", "99"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end
local varieties = {"3", "6", "9"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. varieties[i]..var .. ".png]";
end

-- fill table with -rgi [gigantamax urshifu for now] varieties
local varieties = {"892"}
local var = "-rgi"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end

-- fill table with -a [alolan] varieties
local varieties = {"019", "020", "026", "027", "028", "037", "038", "050", "051", "052", "053", "074", "075", "076", "088", "089", "103", "105"}
local var = "-a"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"19", "20", "26", "27", "28", "37", "38", "50", "51", "52", "53", "74", "75", "76", "88", "89"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end

-- fill table with -g [galarian] varieties
local varieties = {"052", "077", "078", "079", "080", "083", "110", "122", "144", "145", "146", "199", "222", "263", "264", "554", "562", "618"}
local var = "-g"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"52", "77", "78", "79", "80", "83"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end


-- fill table with -s [therian] varieties
local varieties = {"641","642","645"}
local var = "-s"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end

-- deoxys forms -a,-d,-s
local varieties = {"-a","-d","-s"}
local var = "386"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- burmy forms -n,-t,-s
local varieties = {"-n","-t","-s"}
local var = "412"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Wormadam forms -t,-c
local varieties = {"-t","-c"}
local var = "413"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Rotom forms -s,-f,-h,-m,-w,-dex,-phone,-rotomi
local varieties = {"-s","-f","-h","-m","-w","-dex","-phone","-rotomi"}
local var = "479"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Giratina forms -o
local varieties = {"-o"}
local var = "487"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Shaymin forms -s
local varieties = {"-s"}
local var = "492"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Shaymin forms -b
local varieties = {"-b"}
local var = "550"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Darmanitan forms -d,-g,-gz
local varieties = {"-d","-g","-gz"}
local var = "555"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Deerling forms -s,-a,-w
local varieties = {"-s","-a","-w"}
local var = "585"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Sawsbuck forms -s,-a,-w
local varieties = {"-s","-a","-w"}
local var = "586"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Kyurem forms -b,-w
local varieties = {"-b","-w"}
local var = "646"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Keldeo forms -r
local varieties = {"-r"}
local var = "647"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Meloetta forms -p
local varieties = {"-p"}
local var = "648"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Greninja forms -a
local varieties = {"-a"}
local var = "658"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Aegislash forms -b
local varieties = {"-b"}
local var = "681"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Zygarde forms -c, -10, -core
local varieties = {"-c", "-10", "-core"}
local var = "718"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end
-- Zygarde form cell
pokeTable["718-cell"] = "[§I https://www.serebii.net/sunmoon/cellsmall.png]";

-- Hoopa forms -u
local varieties = {"-u"}
local var = "720"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Oricorio forms -p, -pau, -sore
local varieties = {"-p", "-pau", "-s"}
local var = "741"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Lycanroc forms -m, -d
local varieties = {"-m", "-d"}
local var = "745"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Wishiwashi forms -s
local varieties = {"-s"}
local var = "746"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Minior forms -b,-g,-i,-o,-r,-v,-y
local varieties = {"-b","-g","-i","-o","-r","-v","-y"}
local var = "774"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Necrozma forms -dm,-dw
local varieties = {"-dm","-dw"}
local var = "800"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Eiscue forms -n
local varieties = {"-n"}
local var = "875"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Zacian forms -c
local varieties = {"-c"}
local var = "888"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Zamazenta forms -c
local varieties = {"-c"}
local var = "889"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Calyrex forms -i, -s
local varieties = {"-i", "-s"}
local var = "898"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Unown forms -b, -c, -d, -e, -f, -g, -h, -i, -j, -k, -l, -m, -n, -o, -p, -q, -r, -s, -t, -u, -v, -w, -x, -y, -z, -qm, -em
local varieties = {"-b", "-c", "-d", "-e", "-f", "-g", "-h", "-i", "-j", "-k", "-l", "-m", "-n", "-o", "-p", "-q", "-r", "-s", "-t", "-u", "-v", "-w", "-x", "-y", "-z", "-qm", "-em"}
local var = "201"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end
-- Unown a
pokeTable["201-a"] = "[§I http://www.serebii.net/pokedex-bw/icon/201.png]]";

-- Castform forms -s, -r, -i
local varieties = {"-s", "-r", "-i"}
local var = "351"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Cherrim forms -s
local varieties = {"-s"}
local var = "421"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Shellos forms -e
local varieties = {"-e"}
local var = "422"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Gastrodon forms -e
local varieties = {"-e"}
local var = "423"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Vivillon forms -p,-t,-c,-g,-e,-i,-mo,-ma,-a,-h,-s,-r,-mon,-sa,-su,-o,-j,-f,-pb
local varieties = {"-p","-t","-c","-g","-e","-i","-mo","-ma","-a","-h","-s","-r","-mon","-sa","-su","-o","-j","-f","-pb"}
local var = "666"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Flabébé forms -y, -o, -b, -w
local varieties = {"-y", "-o", "-b", "-w"}
local var = "669"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Flotte forms -y, -o, -b, -w
local varieties = {"-y", "-o", "-b", "-w"}
local var = "670"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Florges forms -y, -o, -b, -w
local varieties = {"-y", "-o", "-b", "-w"}
local var = "671"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Furfrou forms -h, -s, -d, -de, -m, -da, -l, -k, -p
local varieties = {"-h", "-s", "-d", "-de", "-m", "-da", "-l", "-k", "-p"}
local var = "676"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Cramorant forms -gu, -go
local varieties = {"-gu", "-go"}
local var = "845"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Morpeko forms -h
local varieties = {"-h"}
local var = "877"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Xerneas forms -n
local varieties = {"-n"}
local var = "716"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Pikachu forms -o, -h, -s, -u, -k, -a, -p, -w, -b, -c, -l, -phd, -ps, -r
local varieties = {"-o", "-h", "-s", "-u", "-k", "-a", "-p", "-w", "-b", "-c", "-l", "-phd", "-ps", "-r"}
local var = "25"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. var..varieties[i] .. ".png]";
end
local var = "025"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Percorre a tabela de nodes, vendo os filhos. 
local function dump(o)
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

local function StartsWith(Text,Start)
   return string.sub(Text,1,string.len(Start))==Start
end

local function FindPokeCode(code)
	local s = "";
	for k,v in pairs(pokeTable) do
		if StartsWith(k, code) then
			s = s .. '['..k..'] = ' .. v .. ','
		end
	end

	return s;
end

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

				local param = token:sub(2);
				param = param:sub(1, -2);

				local link = nil;

				if dot1==":" and dot2==":" then
					link = pokeTable[param];
				end;

				if link ~=nil then
					changed = true;
					arg[i] = link;
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
			if message.parametro == nil or message.parametro == "" then
				message.chat:escrever("Passe um numero entre 1 e 898 como parametro.");
			else
				message.chat:enviarMensagem("Todas variantes de " .. message.parametro .. ": ");
				message.chat:enviarMensagem(FindPokeCode(message.parametro));
			end;

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