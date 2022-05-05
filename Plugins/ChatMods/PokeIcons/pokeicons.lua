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
local numToName = {};
local nameToNum = {};

pokeTable["god"] = "[§I https://www.serebii.net/pokedex-swsh/icon/399.png]";

local nameTable = {"Bulbasaur","Ivysaur","Venusaur","Charmander","Charmeleon","Charizard","Squirtle","Wartortle","Blastoise"};
-- fill table with :x:, :0x: and :00x: varieties
for i=1, 9 do
	numToName[""..i] = nameTable[i]
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end
for i=1, 9 do
	numToName["0"..i] = nameTable[i]
	pokeTable["0"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end
for i=1, 9 do
	numToName["00"..i] = nameTable[i]
	nameToNum[nameTable[i]] = "00" .. i
	nameToNum[string.lower(nameTable[i])] = "00" .. i
	pokeTable["00"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/00" .. i .. ".png]";
end

-- fill table with :xx: and :0xx: varieties
nameTable = {"Caterpie","Metapod","Butterfree","Weedle","Kakuna","Beedrill","Pidgey","Pidgeotto","Pidgeot","Rattata","Raticate","Spearow","Fearow","Ekans","Arbok","Pikachu","Raichu","Sandshrew","Sandslash","Nidoran♀","Nidorina","Nidoqueen","Nidoran♂","Nidorino","Nidoking","Clefairy","Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff","Zubat","Golbat","Oddish","Gloom","Vileplume","Paras","Parasect","Venonat","Venomoth","Diglett","Dugtrio","Meowth","Persian","Psyduck","Golduck","Mankey","Primeape","Growlithe","Arcanine","Poliwag","Poliwhirl","Poliwrath","Abra","Kadabra","Alakazam","Machop","Machoke","Machamp","Bellsprout","Weepinbell","Victreebel","Tentacool","Tentacruel","Geodude","Graveler","Golem","Ponyta","Rapidash","Slowpoke","Slowbro","Magnemite","Magneton","Farfetch'd","Doduo","Dodrio","Seel","Dewgong","Grimer","Muk","Shellder","Cloyster","Gastly","Haunter","Gengar","Onix","Drowzee","Hypno","Krabby","Kingler"};
for i=10, 99 do
	numToName[""..i] = nameTable[i-9]
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
	pokeTable[nameTable[i-9]] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
	pokeTable[string.lower(nameTable[i-9])] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
end
for i=10, 99 do
	numToName["0"..i] = nameTable[i-9]
	nameToNum[nameTable[i-9]] = "0" .. i
	nameToNum[string.lower(nameTable[i-9])] = "0" .. i
	pokeTable["0"..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. i .. ".png]";
end

-- fill table with :xxx: varieties
nameTable = {"Voltorb","Electrode","Exeggcute","Exeggutor","Cubone","Marowak","Hitmonlee","Hitmonchan","Lickitung","Koffing","Weezing","Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan","Horsea","Seadra","Goldeen","Seaking","Staryu","Starmie","Mr. Mime","Scyther","Jynx","Electabuzz","Magmar","Pinsir","Tauros","Magikarp","Gyarados","Lapras","Ditto","Eevee","Vaporeon","Jolteon","Flareon","Porygon","Omanyte","Omastar","Kabuto","Kabutops","Aerodactyl","Snorlax","Articuno","Zapdos","Moltres","Dratini","Dragonair","Dragonite","Mewtwo","Mew","Chikorita","Bayleef","Meganium","Cyndaquil","Quilava","Typhlosion","Totodile","Croconaw","Feraligatr","Sentret","Furret","Hoothoot","Noctowl","Ledyba","Ledian","Spinarak","Ariados","Crobat","Chinchou","Lanturn","Pichu","Cleffa","Igglybuff","Togepi","Togetic","Natu","Xatu","Mareep","Flaaffy","Ampharos","Bellossom","Marill","Azumarill","Sudowoodo","Politoed","Hoppip","Skiploom","Jumpluff","Aipom","Sunkern","Sunflora","Yanma","Wooper","Quagsire","Espeon","Umbreon","Murkrow","Slowking","Misdreavus","Unown","Wobbuffet","Girafarig","Pineco","Forretress","Dunsparce","Gligar","Steelix","Snubbull","Granbull","Qwilfish","Scizor","Shuckle","Heracross","Sneasel","Teddiursa","Ursaring","Slugma","Magcargo","Swinub","Piloswine","Corsola","Remoraid","Octillery","Delibird","Mantine","Skarmory","Houndour","Houndoom","Kingdra","Phanpy","Donphan","Porygon2","Stantler","Smeargle","Tyrogue","Hitmontop","Smoochum","Elekid","Magby","Miltank","Blissey","Raikou","Entei","Suicune","Larvitar","Pupitar","Tyranitar","Lugia","Ho-Oh","Celebi","Treecko","Grovyle","Sceptile","Torchic","Combusken","Blaziken","Mudkip","Marshtomp","Swampert","Poochyena","Mightyena","Zigzagoon","Linoone","Wurmple","Silcoon","Beautifly","Cascoon","Dustox","Lotad","Lombre","Ludicolo","Seedot","Nuzleaf","Shiftry","Taillow","Swellow","Wingull","Pelipper","Ralts","Kirlia","Gardevoir","Surskit","Masquerain","Shroomish","Breloom","Slakoth","Vigoroth","Slaking","Nincada","Ninjask","Shedinja","Whismur","Loudred","Exploud","Makuhita","Hariyama","Azurill","Nosepass","Skitty","Delcatty","Sableye","Mawile","Aron","Lairon","Aggron","Meditite","Medicham","Electrike","Manectric","Plusle","Minun","Volbeat","Illumise","Roselia","Gulpin","Swalot","Carvanha","Sharpedo","Wailmer","Wailord","Numel","Camerupt","Torkoal","Spoink","Grumpig","Spinda","Trapinch","Vibrava","Flygon","Cacnea","Cacturne","Swablu","Altaria","Zangoose","Seviper","Lunatone","Solrock","Barboach","Whiscash","Corphish","Crawdaunt","Baltoy","Claydol","Lileep","Cradily","Anorith","Armaldo","Feebas","Milotic","Castform","Kecleon","Shuppet","Banette","Duskull","Dusclops","Tropius","Chimecho","Absol","Wynaut","Snorunt","Glalie","Spheal","Sealeo","Walrein","Clamperl","Huntail","Gorebyss","Relicanth","Luvdisc","Bagon","Shelgon","Salamence","Beldum","Metang","Metagross","Regirock","Regice","Registeel","Latias","Latios","Kyogre","Groudon","Rayquaza","Jirachi","Deoxys","Turtwig","Grotle","Torterra","Chimchar","Monferno","Infernape","Piplup","Prinplup","Empoleon","Starly","Staravia","Staraptor","Bidoof","Bibarel","Kricketot","Kricketune","Shinx","Luxio","Luxray","Budew","Roserade","Cranidos","Rampardos","Shieldon","Bastiodon","Burmy","Wormadam","Mothim","Combee","Vespiquen","Pachirisu","Buizel","Floatzel","Cherubi","Cherrim","Shellos","Gastrodon","Ambipom","Drifloon","Drifblim","Buneary","Lopunny","Mismagius","Honchkrow","Glameow","Purugly","Chingling","Stunky","Skuntank","Bronzor","Bronzong","Bonsly","Mime Jr.","Happiny","Chatot","Spiritomb","Gible","Gabite","Garchomp","Munchlax","Riolu","Lucario","Hippopotas","Hippowdon","Skorupi","Drapion","Croagunk","Toxicroak","Carnivine","Finneon","Lumineon","Mantyke","Snover","Abomasnow","Weavile","Magnezone","Lickilicky","Rhyperior","Tangrowth","Electivire","Magmortar","Togekiss","Yanmega","Leafeon","Glaceon","Gliscor","Mamoswine","Porygon-Z","Gallade","Probopass","Dusknoir","Froslass","Rotom","Uxie","Mesprit","Azelf","Dialga","Palkia","Heatran","Regigigas","Giratina","Cresselia","Phione","Manaphy","Darkrai","Shaymin","Arceus","Victini","Snivy","Servine","Serperior","Tepig","Pignite","Emboar","Oshawott","Dewott","Samurott","Patrat","Watchog","Lillipup","Herdier","Stoutland","Purrloin","Liepard","Pansage","Simisage","Pansear","Simisear","Panpour","Simipour","Munna","Musharna","Pidove","Tranquill","Unfezant","Blitzle","Zebstrika","Roggenrola","Boldore","Gigalith","Woobat","Swoobat","Drilbur","Excadrill","Audino","Timburr","Gurdurr","Conkeldurr","Tympole","Palpitoad","Seismitoad","Throh","Sawk","Sewaddle","Swadloon","Leavanny","Venipede","Whirlipede","Scolipede","Cottonee","Whimsicott","Petilil","Lilligant","Basculin","Sandile","Krokorok","Krookodile","Darumaka","Darmanitan","Maractus","Dwebble","Crustle","Scraggy","Scrafty","Sigilyph","Yamask","Cofagrigus","Tirtouga","Carracosta","Archen","Archeops","Trubbish","Garbodor","Zorua","Zoroark","Minccino","Cinccino","Gothita","Gothorita","Gothitelle","Solosis","Duosion","Reuniclus","Ducklett","Swanna","Vanillite","Vanillish","Vanilluxe","Deerling","Sawsbuck","Emolga","Karrablast","Escavalier","Foongus","Amoonguss","Frillish","Jellicent","Alomomola","Joltik","Galvantula","Ferroseed","Ferrothorn","Klink","Klang","Klinklang","Tynamo","Eelektrik","Eelektross","Elgyem","Beheeyem","Litwick","Lampent","Chandelure","Axew","Fraxure","Haxorus","Cubchoo","Beartic","Cryogonal","Shelmet","Accelgor","Stunfisk","Mienfoo","Mienshao","Druddigon","Golett","Golurk","Pawniard","Bisharp","Bouffalant","Rufflet","Braviary","Vullaby","Mandibuzz","Heatmor","Durant","Deino","Zweilous","Hydreigon","Larvesta","Volcarona","Cobalion","Terrakion","Virizion","Tornadus","Thundurus","Reshiram","Zekrom","Landorus","Kyurem","Keldeo","Meloetta","Genesect","Chespin","Quilladin","Chesnaught","Fennekin","Braixen","Delphox","Froakie","Frogadier","Greninja","Bunnelby","Diggersby","Fletchling","Fletchinder","Talonflame","Scatterbug","Spewpa","Vivillon","Litleo","Pyroar","Flabébé","Floette","Florges","Skiddo","Gogoat","Pancham","Pangoro","Furfrou","Espurr","Meowstic","Honedge","Doublade","Aegislash","Spritzee","Aromatisse","Swirlix","Slurpuff","Inkay","Malamar","Binacle","Barbaracle","Skrelp","Dragalge","Clauncher","Clawitzer","Helioptile","Heliolisk","Tyrunt","Tyrantrum","Amaura","Aurorus","Sylveon","Hawlucha","Dedenne","Carbink","Goomy","Sliggoo","Goodra","Klefki","Phantump","Trevenant","Pumpkaboo","Gourgeist","Bergmite","Avalugg","Noibat","Noivern","Xerneas","Yveltal","Zygarde","Diancie","Hoopa","Volcanion","Rowlet","Dartrix","Decidueye","Litten","Torracat","Incineroar","Popplio","Brionne","Primarina","Pikipek","Trumbeak","Toucannon","Yungoos","Gumshoos","Grubbin","Charjabug","Vikavolt","Crabrawler","Crabominable","Oricorio","Cutiefly","Ribombee","Rockruff","Lycanroc","Wishiwashi","Mareanie","Toxapex","Mudbray","Mudsdale","Dewpider","Araquanid","Fomantis","Lurantis","Morelull","Shiinotic","Salandit","Salazzle","Stufful","Bewear","Bounsweet","Steenee","Tsareena","Comfey","Oranguru","Passimian","Wimpod","Golisopod","Sandygast","Palossand","Pyukumuku","Type: Null","Silvally","Minior","Komala","Turtonator","Togedemaru","Mimikyu","Bruxish","Drampa","Dhelmise","Jangmo-o","Hakamo-o","Kommo-o","Tapu Koko","Tapu Lele","Tapu Bulu","Tapu Fini","Cosmog","Cosmoem","Solgaleo","Lunala","Nihilego","Buzzwole","Pheromosa","Xurkitree","Celesteela","Kartana","Guzzlord","Necrozma","Magearna","Marshadow","Poipole","Naganadel","Stakataka","Blacephalon","Zeraora","Meltan","Melmetal","Grookey","Thwackey","Rillaboom","Scorbunny","Raboot","Cinderace","Sobble","Drizzile","Inteleon","Skwovet","Greedent","Rookidee","Corvisquire","Corviknight","Blipbug","Dottler","Orbeetle","Nickit","Thievul","Gossifleur","Eldegoss","Wooloo","Dubwool","Chewtle","Drednaw","Yamper","Boltund","Rolycoly","Carkol","Coalossal","Applin","Flapple","Appletun","Silicobra","Sandaconda","Cramorant","Arrokuda","Barraskewda","Toxel","Toxtricity","Sizzlipede","Centiskorch","Clobbopus","Grapploct","Sinistea","Polteageist","Hatenna","Hattrem","Hatterene","Impidimp","Morgrem","Grimmsnarl","Obstagoon","Perrserker","Cursola","Sirfetch'd","Mr. Rime","Runerigus","Milcery","Alcremie","Falinks","Pincurchin","Snom","Frosmoth","Stonjourner","Eiscue","Indeedee","Morpeko","Cufant","Copperajah","Dracozolt","Arctozolt","Dracovish","Arctovish","Duraludon","Dreepy","Drakloak","Dragapult","Zacian","Zamazenta","Eternatus","Kubfu","Urshifu","Zarude","Regieleki","Regidrago","Glastrier","Spectrier","Calyrex","Wyrdeer","Kleavor","Ursaluna","Basculegion","Sneasler","Overqwil","Enamorus"};
for i=100, 905 do
	numToName[""..i] = nameTable[i-99]
	nameToNum[nameTable[i-99]] = "" .. i
	nameToNum[string.lower(nameTable[i-99])] = "" .. i
	pokeTable[""..i] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. i .. ".png]";
	pokeTable[nameTable[i-99]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. i .. ".png]";
	pokeTable[string.lower(nameTable[i-99])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. i .. ".png]";
end

-- fill table with -m [mega] varieties
local varieties = {"003", "009","065", "094", "115", "127", "130", "142", "181", "212", "214", "229", "248", "257", "282", "303", "306", "308", "310", "354", "359", "380", "381", "445", "448", "460", "015", "018", "080", "208", "254", "260", "302", "319", "323", "334", "362", "373", "376", "384", "428", "475", "531", "719", "800", "384"}
nameTable = {"Mega-Venusaur","Mega-Blastoise","Mega-Alakazam","Mega-Gengar","Mega-Kangaskhan","Mega-Pinsir","Mega-Gyarados","Mega-Aerodactyl","Mega-Ampharos","Mega-Scizor","Mega-Heracross","Mega-Houndoom","Mega-Tyranitar","Mega-Blaziken","Mega-Gardevoir","Mega-Mawile","Mega-Aggron","Mega-Medicham","Mega-Manectric","Mega-Banette","Mega-Absol","Mega-Latias","Mega-Latios","Mega-Garchomp","Mega-Lucario","Mega-Abomasnow","Mega-Beedrill","Mega-Pidgeot","Mega-Slowbro","Mega-Steelix","Mega-Sceptile","Mega-Swampert","Mega-Sableye","Mega-Sharpedo","Mega-Camerupt","Mega-Altaria","Mega-Glalie","Mega-Salamence","Mega-Metagross","Mega-Rayquaz","Mega-Lopunny","Mega-Gallade","Mega-Audino","Mega-Diancie","Ultra-Necrozma", "Mega-Rayquaza"}
local var = "-m"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
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
nameTable = {"Mega-Charizard-X","Mega-Mewtwo-X"};
local var = "-mx"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
pokeTable["6-mx"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-mx.png]";
pokeTable["06-mx"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-mx.png]";
-- fill table with -my [mega-y] varieties
local varieties = {"006", "150"}
nameTable = {"Mega-Charizard-Y","Mega-Mewtwo-Y"};
local var = "-my"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
pokeTable["6-my"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-my.png]";
pokeTable["06-my"] = "[§I http://www.serebii.net/pokedex-swsh/icon/006-my.png]";

-- fill table with -gi [gigantamax] varieties
local varieties = {"003", "006", "009", "012","025","052","068","094","099", "131", "133", "143", "569", "809", "812", "815", "818", "823", "826", "834", "839", "841", "842", "844", "849", "851", "858", "861", "869", "879", "884", "892"}
nameTable = {"Venusaur-Gigantamax", "Charizard-Gigantamax", "Blastoise-Gigantamax", "Butterfree-Gigantamax", "Pikachu-Gigantamax", "Meowth-Gigantamax", "Machamp-Gigantamax", "Gengar-Gigantamax", "Kingler-Gigantamax", "Lapras-Gigantamax", "Eevee-Gigantamax", "Snorlax-Gigantamax", "Garbodor-Gigantamax", "Melmetal-Gigantamax", "Rillaboom-Gigantamax", "Cinderace-Gigantamax", "Inteleon-Gigantamax", "Corviknight-Gigantamax", "Orbeetle-Gigantamax", "Drednaw-Gigantamax", "Coalossal-Gigantamax", "Flapple-Gigantamax", "Appletun-Gigantamax", "Sandaconda-Gigantamax", "Toxtricity-Gigantamax", "Centiskorch-Gigantamax", "Hatterene-Gigantamax", "Grimmsnarl-Gigantamax", "Alcremie-Gigantamax", "Copperajah-Gigantamax", "Duraludon-Gigantamax", "Urshifu-Gigantamax"}
local var = "-gi"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
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
nameTable = {"Rattata-Alolan","Raticate-Alolan","Raichu-Alolan","Sandshrew-Alolan","Sandslash-Alolan","Vulpix-Alolan","Ninetales-Alolan","Diglett-Alolan","Dugtrio-Alolan","Meowth-Alolan","Persian-Alolan","Geodude-Alolan","Graveler-Alolan","Golem-Alolan","Grimer-Alolan","Muk-Alolan","Exeggutor-Alolan","Marowak-Alolan"}
local var = "-a"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"19", "20", "26", "27", "28", "37", "38", "50", "51", "52", "53", "74", "75", "76", "88", "89"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end

-- fill table with -g [galarian] varieties
local varieties = {"052", "077", "078", "079", "080", "083", "110", "122", "144", "145", "146", "199", "222", "263", "264", "554", "562", "618"}
nameTable = {"Meowth-Galarian","Ponyta-Galarian","Rapidash-Galarian","Slowpoke-Galarian","Slowbro-Galarian","Farfetch'd-Galarian","Weezing-Galarian","Mr. Mime-Galarian","Articuno-Galarian","Zapdos-Galarian","Moltres-Galarian","Slowking-Galarian","Corsola-Galarian","Zigzagoon-Galarian","Linoone-Galarian","Darumaka-Galarian","Darmanitan-Galarian","Darmanitan-Galarian","Yamask-Galarian","Stunfisk-Galarian"}
local var = "-g"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"52", "77", "78", "79", "80", "83"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end

-- fill table with -h [hisuian] varieties
local varieties = {"058","059","100","101","157","211","215","503","549","570","571","628","705","706","713","724"}
nameTable = {"Growlithe-Hisuian","Arcanine-Hisuian","Voltorb-Hisuian","Electrode-Hisuian","Typhlosion-Hisuian","Qwilfish-Hisuian","Sneasel-Hisuian","Samurott-Hisuian","Lilligant-Hisuian","Zorua-Hisuian","Zoroark-Hisuian","Braviary-Hisuian","Sliggoo-Hisuian","Goodra-Hisuian","Avalugg-Hisuian","Decidueye-Hisuian"}
local var = "-h"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end
local varieties = {"58", "59"}
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/0" .. varieties[i]..var .. ".png]";
end


-- fill table with -s [therian] varieties
local varieties = {"641","642","645","905"}
nameTable = {"Tornadus-Therian","Thundurus-Therian","Landorus-Therian","Enamorus-Therian"}
local var = "-s"
for i=1, #varieties do
	pokeTable[varieties[i]..var] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. varieties[i]..var .. ".png]";
end

-- deoxys forms -a,-d,-s
local varieties = {"-a","-d","-s"}
nameTable = {"Deoxys-Attack","Deoxys-Defense","Deoxys-Speed"}
local var = "386"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var .. varieties[i] .. ".png]";
	pokeTable[nameTable[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var .. varieties[i] .. ".png]";
	pokeTable[string.lower(nameTable[i])] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var .. varieties[i] .. ".png]";
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

-- Dialga forms -o
local varieties = {"-o"}
local var = "483"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Palkia forms -o
local varieties = {"-o"}
local var = "484"
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

-- Basculin forms -b, -w
local varieties = {"-b","-w"}
local var = "550"
for i=1, #varieties do
	pokeTable[var..varieties[i]] = "[§I http://www.serebii.net/pokedex-swsh/icon/" .. var..varieties[i] .. ".png]";
end

-- Basculegion forms -f
local varieties = {"-f"}
local var = "902"
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

local function Contains(Text,Pattern)
   return string.find(string.lower(Text), string.lower(Pattern))~=nil
end

local function FindAlt(code)
	local aux = tonumber(code)
	local ret = nil

	if aux == nil then
		ret = nameToNum[code]
	else
		ret = numToName[code]
	end
	return ret
end

local function FindPokeCode(code)
	local s = "";
	for k,v in pairs(pokeTable) do
		if Contains(k, code) then
			s = s .. '['..k..'] = ' .. v .. ','
		end
	end
	local alt = FindAlt(code)
	if alt ~= nil then
		for k,v in pairs(pokeTable) do
			if Contains(k, alt) then
				s = s .. '['..k..'] = ' .. v .. ','
			end
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

				-- Param will have the value between : and :
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
				message.chat:escrever("Passe um numero entre 1 e 905 como parametro.");
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
                                {comando="/pokecode", descricao="Exibe codigos para usar memes de Pokémon. v0.8"}};
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