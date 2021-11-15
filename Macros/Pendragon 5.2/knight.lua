--                                                            
--                                                            
--                                                            
--                                                            
--                                                            
--                    /@@@              ,,                    
--                  @@@@@@        ,@@@@@&@@@@.                
--                @@@@@@@@      @@&   *&@&@@%@                
--             ,@@@ %@@@@&    @@@@      @@@@#                 
--           @@@(   @%@%&    @@@@      @@@@@&@@%&%.           
--                  @@@@@           %@@&/  ,@@@@@@@@          
--                 (@&&%@          ,          &@@@&(&         
--                 #@@@@&        ,@#@         ,&@@*@#         
--                 @@@@@&      @@@@           @@@@@%          
--                .@@@@@.     @@@@@,         @@@#             
--                @@@@%@     ,@@&&@@@@@@@@@&&(                
--                @@@@@@        @&@@@@@@.                     
--               @@@@@@@*&@                                   
--               %@@%@@@@&                                    
--              %@@@&@                                        
--
--
--
--
-- MACRO [CRIAÇÃO DE PERSONAGEM - PENDRAGON] RRPG8 by thirteen
-- INICIANDO VARIÁVEIS
	-- DADOS
	local nomePJ = "";
	local culturaesc = "";
	local religiaoesc = "";
	local cultflag = "";
	local regflag = "";
	local cidDispflag = 0;
	local qualFilho = 0;
	local idadePJ = 21;
	local sexoPJ = "Homem";
	local TAM = 0;
	local DES = 0;
	local FOR = 0;
	local CON = 0;
	local APP = 0;
	local DF = 0;
	local dano = 0;
	local movimento = 0;
	local regen = 0;
	local hp = 0;
	local inconsciente = 0;
	local Castidade = 0;
	local Energia = 0;
	local Perdao = 0;
	local Generosidade = 0;
	local Honestidade = 0;
	local Justica = 0;
	local Misericordia = 0;
	local Modestia = 0;
	local Espiritualidade = 0;
	local Prudencia = 0;
	local Temperanca = 0;
	local Confianca = 0;
	local Coragem = 0;
	
	-- HABILIDADES DE ARMAS
	local habilidadeArmaF = "";
	local habilidadeNormF = "";
	local skAdaga = 0;
	local skArco = 0;
	local skBatalha = 0;
	local skBesta = 0;
	local skEquitacao = 0;
	local skEspadas = 0;
	local skLanca = 0;
	local skMachMart = 0;
	local skArremesso = 0;
	local skLancaMontada = 0;
	local skArmasPesadas = 0;
	local skLancas = 0;
	
	-- HABILIDADES NORMAIS		
	local skAtencao = 0;
	local skAdministracao = 0;
	local skReconhecimento = 0;
	local skCaca = 0;
	local skEerie = 0;
	local skAnimais = 0;
	local skTocar = 0;
	local skFolclore = 0;
	local skVadiagem = 0;
	local skEntretenimento = 0;
	local skCortesia = 0;
	local skIntriga = 0;
	local skOratoria = 0;
	local skLeitura = 0;
	local skMenestrel = 0;
	local skPSocorros = 0;
	local skCirurgia = 0;
	local skCompor = 0;
	local skReligiao = 0;
	local skRomance = 0;
	local skDireito = 0;
	local skEspreita = 0;
	local skMusica = 0;
	
	-- OUTROS
	local somaHonra = 0;
	local somaReli= 0;
	local somaRoman = 0;
	local flagCast = "";
	local flagEner = "";
	local flagPerd = "";
	local flagGene = "";
	local flagHone = "";
	local flagJust = "";
	local flagMise = "";
	local flagMode = "";
	local flagEspi = "";
	local flagPrud = "";
	local flagTemp = "";
	local flagConf = "";
	local flagCora = "";
	local flagLuxu = "";
	local flagPreg = "";
	local flagVing = "";
	local flagEgoi = "";
	local flagMali = "";
	local flagArbi = "";
	local flagCrue = "";
	local flagOrgu = "";
	local flagCini = "";
	local flagImpr = "";
	local flagIndu = "";
	local flagDesc = "";
	local flagCova = "";
	local rollOculto = false;
	local espacamento = "[§K1]‎\n‎‎";

-- TABELAS
local cidDisp = {};
local irmaosPJ = {};
local cidadeesc = {};
local nomes = {
		{"Bretão", "Homem", {"Addonwy", "Aeron", "Afan", "Aneirin", "Aeddan", "Amig", "Amlyn", "Athrwys", "Arddur", "Buddfannan", "Blaen", "Bledri", "Bradwen", "Bleddig", "Cadfannan", "Cadfael", "Cadwallon", "Cilydd", "Cynon", "Cynfan", "Cyfulch", "Cynrain", "Cunvelyn", "Caradoc", "Cibno", "Ceredig", "Cadlew", "Cynwal", "Clydno", "Cynhafal", "Dafydd", "Defi", "Dwyai", "Edar", "Edern", "Eiddef", "Erthgi", "Elad", "Eudaf", "Eiffin", "Gwefrfawr", "Gwegon", "Gwion", "Gwyn", "Gwarddur", "Gwern", "Gwyleged", "Gwrien", "Gwraid", "Gorthyn", "Gwaednerth", "Gwengad", "Brugyn", "Gwenabwy", "Gwrfelling", "Gwair", "Graid", "Geriant", "Gwanon", "Hyfaidd", "Hywel", "Ieuan", "Llywel", "Marchlew", "Moried", "Morien", "Madog", "Morial", "Mynyddog", "Merin", "Neilyn", "Nwython", "Nai", "Nerthaid", "Neddig", "Nidian", "Owain", "Padern", "Pedrog", "Ricerch", "Rhodri", "Rhufon", "Rhun", "Sawel", "Seriol", "Sywno", "Tathal", "Tathan", "Tudfwich", "Tyngyr", "Uren", "Uwain", "Ysgarran"}},
		{"Bretão", "Mulher", {"Adwen", "Annest", "Angarad", "Arianwen", "Briant", "Duddug", "Collwen", "Dwynwen", "Eleri", "Ffraid", "Glesig", "Glesni", "Gwen", "Heledd", "Indeg", "Leri", "Lleueu", "Lilo", "Melangell", "Meleri", "Nest", "Nia", "Tydfil"}},
		{"Irlandês", "Homem", {"Aed", "Aedan", "Aeducan", "Ailgel", "Ailill", "Airechtach", "Amalgaid", "Art", "Baetan", "Baeth", "Berach", "Berchan", "Brion", "Bruatur", "Carthach", "Cathal", "Cenn", "Cerball", "Colcu", "Comman", "Congal", "Cormace", "Daig", "Diarmait", "Donngal", "Dunchad", "Echen", "Elodach", "Eogan", "Fachtna", "Fedelmid", "Finnchad", "Flann", "Guaire", "Imchad", "Laegaire", "Lorccan", "Maine", "Murchad", "Nathi", "Ronan", "Russ", "Senach", "Tadc", "Tuathal", "Ultan"}},
		{"Irlandês", "Mulher", {"Bebinn", "Cron", "Derbail", "Dunlaith", "Eithne", "Finnguala", "Flann", "Gormlaith", "Grainne", "Lassar", "Mor", "Orlaith", "Sadb", "Sorcha", "Una"}},
		{"Picto", "Homem", {"Aenbecan", "Allcallorred", "Alpin", "Angus", "Breidei", "Breth", "Bridei", "Broichan", "Brude", "Buban", "Cailtarni", "Caltram", "Carvorst", "Castantin", "Cian", "Cimoiod", "Ciniath", "Cinioch", "Ciniod", "Crautreic", "Denbecan", "Deocillimon", "Deocilunon", "Deoord", "Deort", "Domech", "Domelch", "Drest", "Drosten", "Druisten", "Drust", "Drustagnos", "Eddarrnonn", "Elpin", "Eoganan", "Forcus", "Gailtram", "Galam", "Galan", "Galanan", "Gartnaich", "Gartnait", "Gartnaith", "Gede", "Gest", "Golistan", "Irb", "Llifiau", "Lutrin", "Maelchon", "Mailcon", "Melcon", "Morleo", "Nechtan", "Nehhton", "Oengus", "Onnist", "Onuis", "Onuist", "Oswiu", "Peithan", "Pidarnoin", "Talluorh", "Talorc", "Talorcan", "Talore", "Talorgen", "Tarain", "Taran", "Tharain", "Uid", "Uist", "Unen", "Unuist", "Uoret", "Uuroid", "Uvan", "Wid", "Wroid"}},
		{"Picto", "Mulher", {"Adwen", "Annest", "Angarad", "Arianwen", "Briant", "Duddug", "Collwen", "Dwynwen", "Eleri", "Ffraid", "Glesig", "Glesni", "Gwen", "Heledd", "Indeg", "Leri", "Lleueu", "Lilo", "Melangell", "Meleri", "Nest", "Nia", "Tydfil"}},
		{"Romano", "Homem", {"Albanus", "Agorix", "Arcavius", "Avitus", "Belletor", "Burcanius", "Caletus", "Caracturus", "Catianus", "Cunobarrus", "Cervidus", "Dagwaldus", "Decmus", "Donicus", "Dumnorix", "Egbutius", "Elvorix", "Galerus", "Gessius", "Ingenvirius", "Isatis", "Ivimarus", "Luonercus", "Litumarus", "Leddicus", "Lupinus", "Maccalus", "Macrinus", "Magunnus", "Marullinus", "Metunus", "Molacus", "Nemnogenus", "Nonius", "Novellius", "Olennius", "Pertacus", "Primanus", "Nertomarus", "Sarimarcus", "Sudrenus", "Tanicus", "Taurinus", "Trenus", "Vepgenus", "Vibennis", "Vitalinus", "Ulprus", "Voteporix"}},
		{"Romano", "Mulher", {"Albania", "Arcaviia", "Avitia", "Belletora", "Burcania", "Caletia", "Caracturia", "Catiania", "Cunobarria", "Cervidia", "Dagwaldia", "Decmia", "Donicia", "Egbutia", "Galeria", "Gessia", "Ingenviria", "Isatis", "Ivimaria", "Luonercia", "Litumaria", "Leddicia", "Lupinia", "Maccalia", "Macrinia", "Magunnia", "Marullinia", "Metunia", "Molacia", "Nemnogenia", "Nonia", "Novellia", "Olennia", "Pertacia", "Primania", "Nertomaria", "Sarimarcia", "Sudrenia", "Tanicia", "Taurinia", "Trenia", "Vepgenia", "Vitalinia", "Ulpria"}},
		{"Saxão", "Homem", {"Aelfric", "Aesewine", "Bassa", "Beorhtric", "Caedwalla", "Caewlin", "Centwine", "Cenwalch", "Cerdic", "Coelred", "Coelric", "Coelwulf", "Coenhelm", "Conerad", "Conewalch", "Coenwulf", "Cuthbert", "Cuthred", "Cuthwulf", "Cyneagils", "Cynewulf", "Cynric", "Eadbald", "Eadberht", "Eadric", "Eardwulf", "Edwin", "Edgert", "Ethilfrith", "Ethelheard", "Ethelred", "Ethelwulf", "Hengest", "Hlothere", "Horsa", "Ine", "Octa", "Oeric", "Osric", "Oswald", "Oswine", "Oswulf", "Oswy", "Peada", "Penda", "Sigebryht", "Wihtred", "Wulfhere"}},
		{"Saxão", "Mulher", {"Aelflaed", "Aelgifu", "Aethelred", "Burhred", "Cuthburh", "Cyneburh", "Eadgifu", "Eadgyth", "Eadhild", "Ealhred", "Eormenburh", "Hereswith", "Raedburh", "Sexburh", "Wihtburh"}},
		{"Aquitâneo", "Homem", {"Achila", "Agila", "Ardo", "Alaric", "Athanagild", "Braulio", "Bulgar", "Chindasuinth", "Chintila", "Cison", "Egica", "Ervig", "Euric", "Gundemar", "Hanna", "Heraus", "Hermenegild", "Hermenigild", "Ildefonsus", "Isidore", "Iudila", "Julian", "Leander", "Leovigild", "Liuva", "Reccared", "Recared", "Reccesuinth", "Receswinth", "Roderic", "Sembe", "Senius", "Sisbert", "Sisebut", "Sisenand", "Suinthila", "Suniefred", "Theoderic", "Theudisclus", "Thorismund", "Tulga", "Wamba", "Witteric", "Wittiza"}},
		{"Aquitâneo", "Mulher", {"Brunhilda", "Florentina", "Elaine", "Eleanor"}},
	};
local cidadesDet = {
		{"Bayonne (Cidade) [Ganis, Aquitaine]", "Roman/Roman Chr. Aquitainian/Arian Chr.", "Feudal 1"},
		{"Bedegraine [Logres]", "Cymric/British Chr.", "Feudal 3"},
		{"Bedegraine (Cidade)[Bedegraine, Logres]", "Cymric/British Chr.", "Feudal 3"},
		{"Benoit [Aquitaine]", "Aquitainian/Arian Chr.", "Feudal 1"},
		{"Benwick (Cidade) [Benoit, Aquitaine]", "Roman/Roman Chr. Aquitainian/Arian Chr.", "Feudal 1"},
		{"Bordeaux (Cidade) [Ganis, Aquitaine]", "Roman/Roman Chr. Aquitainian/Arian Chr.", "Urban 3"},
		{"Brecklands [Caerwent, Anglia Logres]", "Cymric/British Chr.", "Feudal 3"},
		{"Brigantia [Malahaut, Cumbria]", "Cymric/British Chr.", "Feudal 2"},
		{"Broadlands [Caerwent, Anglia; Logres]", "Roman/Roman Chr.", "Feudal 3"},
		{"Brun [Logres]", "Cymric/Pagan", "Feudal 1"},
		{"Caerwent (Cidade) [Escavalon, Cambria]", "Roman/Roman Chr.", "Urban 2"},
		{"Cambenet [Cumbria]", "Cymric/British Chr.", "Feudal 2"},
		{"Cambridge (Cidade) [Huntington, Logres]", "Cymric/British Chr.", "Urban 2"},
		{"Cameliard [Cambria]", "Cymric/British Chr. or Pagan", "Feudal 2"},
		{"Carduel (Cidade) [Cambenet, Cumbria]", "Cymric/British Chr.", "Urban 2"},
		{"Carlion (Cidade) [Escavalon, Cambria]", "Roman/Roman Chr.", "Urban 1"},
		{"Carmarthen (Cidade) [Estregales, Cambria]", "Cymric/British Chr.", "Urban 2"},
		{"Catterick, (Cidade) [Catterick, Cumbria]", "Cymric/British Chr.", "Urban 1"},
		{"Cheshire [Cambria]", "Cymric/ British Chr.", "Feudal 2"},
		{"Chichester (Cidade) [Hampshire, Logres]", "Cymric/British Chr.", "Urban 1"},
		{"Cirencester, (Cidade) [Clarence, Logres]", "Roman/Roman Chr.", "Urban 2"},
		{"City of Legions [Cheshire, Cambria]", "Cymric/British Chr.", "Urban 2"},
		{"Clarence [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Colchester (Cidade) [Caer Colun/Essex, Logres]", "Rom./Rom. Chr.", "Urban 2"},
		{"Dal Araide [Dal Riada, Ireland]", "Pict/Brit. Chr.", "Feudal 1"},
		{"Dal Riada [Galeholt]", "Irish/British Chr. or Pagan", "Feudal 1"},
		{"Deira [Malahaut/Cumbria]", "Saxon/Germanic Pagan", "Feudal 1"},
		{"Devon [Cornwall]", "Cymric/British Chr.", "Feudal 2"},
		{"Dorchester (Cidade) [Dorset, Logres]", "Roman/Roman Chr.", "Urban 2"},
		{"Dorset [Logres]", "Roman/Roman Chr.", "Feudal 2"},
		{"Dover (Cidade) [Kent, Logres]", "Saxon Cymric/British Chr.", "Feudal 2"},
		{"Dublin (Cidade) [Leinster, Ireland]", "Cymric/British Chr., Irish/British Chr. or Pagan", "Feudal 2"},
		{"Eburacum (Cidade) [Malahaut, Cumbria]", "Roman/Roman Chr.", "Urban 2"},
		{"Escavalon [Cambria]", "Cymric/British Chr., Cymric/Pagan", "Feudal 2"},
		{"Essex [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Estregales [Cambria]", "Irish/British Chr. or Pagan", "Feudal 2"},
		{"Exeter (Cidade) [Devon, Cornwall]", "Cymric/British Chr.", "Urban 2"},
		{"Ganis [Aquitaine]", "Aquitainian/Arian Chr.", "Feudal 1"},
		{"Glevum (Cidade) [Gloucester, Cambria]", "Roman/Roman Chr.", "Urban 1"},
		{"Gloucester [Cambria]", "Cymric/British Chr.", "Feudal 2"},
		{"Hampshire [Logres]", "Cymric/Mixed", "Feudal 3"},
		{"Hantonne (Cidade) [Hampshire, Logres]", "Cymric/Mixed", "Feudal 2"},
		{"Hertford [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Huntington [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Jagent [Logres]", "Pict/British Chr., Pict/Heathen", "Feudal 2"},
		{"Kent [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"La Rochelle (Cidade) [Benoit, Aquitaine]", "Roman/Roman Chr. Aquitainian/Arian Chr.", "Urban 1"},
		{"Lambor [Logres]", "Cymric/Pagan", "Feudal 2"},
		{"Leicester (Cidade) [Lambor, Logres]", "Cymric/British Chr.", "Urban 2"},
		{"Leinster [Ireland]", "Irish/British Chr. or Pagan", "Feudal 2"},
		{"Lincoln (Cidade) [Lindsey, Logres]", "Cymric/British Chr.", "Urban 2"},
		{"Lindsey [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Lonazep [Logres]", "Cymric/British Chr., Cymric/Pagan", "Feudal 2"},
		{"London (Cidade) [Thamesmouth, Logres]", "Roman/Roman Chr.", "Urban 3"},
		{"Lothian [North]", "Cymric/Pagan", "Feudal 1"},
		{"Maris [Cumbria]", "Cymric/Pagan", "Feudal 1"},
		{"Marlborough [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Nantes (Cidade) [Vannetais, Brittany]", "Roman/Roman Chr.", "Urban 2"},
		{"Nohaut [Cumbria]", "Saxon/Germanic Pagan", "Feudal 1"},
		{"Norwich (Cidade) [Anglia, Caerwent, Logres]", "Roman/Rom. Chr.", "Urban 3"},
		{"Oxford (Cidade) [Rydychan, Logres]", "Cymric/British Chr.", "Urban 2"},
		{"Pale [Ireland]", "Cymric/British Chr.", "Feudal 1"},
		{"Peterborough (Cidade) [Lonazep, Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Rennes (Cidade) [Vannetais, Brittany]", "Roman/Roman Chr.", "Urban 2"},
		{"Rheged [Cumbria]", "Cymric/Pagan", "Tribal 2"},
		{"Richmond [Cumbria]", "Cymric/British Chr.", "Feudal 2"},
		{"Ripon [Malahaut] [Cumbria]", "Cymric/British Chr.", "Feudal 2"},
		{"Roestoc [Cumbria]", "Cymric/Pagan", "Feudal 2"},
		{"Rydychan [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Sarum (Cidade) [Salisbury]", "Cymric/British Chr.", "Urban 2"},
		{"Salisbury [Logres]", "Cymric/British Chr., Cymric/ Pagan", "Feudal 2"},
		{"Silchester [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Silchester (Cidade) [Silchester, Logres]", "Roman/Roman Chr.", "Urban 2"},
		{"Sorestan [Lindsey, Logres]", "Saxon/Germanic Pagan", "Tribal 3"},
		{"St. Albans (Cidade) [Hertford, Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Stafford (Cidade) [Cameliard, Cambria]", "Cymric/British Chr.", "Urban 1"},
		{"Staines (Cidade) [Surrey, Logres]", "Cymric/British Chr.", "Urban 2"},
		{"Surrey [Logres]", "Saxon/British Chr. or Germanic Pagan", "Feudal 2"},
		{"Sussex [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Thamesmouth [Logres]", "Cymric/Roman Chr.", "Feudal 2"},
		{"Tintagel [Cornwall]", "Cymric/Mixed", "Feudal 1"},
		{"Trebes (Cidade) [Ganis, Aquitaine]", "Aquitainian/Arian Chr.", "Urban 2"},
		{"Tribruit [Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Vannes (Cidade) [Vannetais, Brittany]", "Roman/Roman Chr.", "Urban 2"},
		{"Vannetais [Cornwall, Brittany]", "Cymric/British Chr.", "Feudal 2"},
		{"Wandborough (Cidade) [Marlborough, Logres]", "Cymric/Brit. Chr.", "Feudal 2"},
		{"Warwick (Cidade) [Wuerensis, Logres]", "Cymric/British Chr.", "Feudal 2"},
		{"Wuerensis [Logres]", "Cymric/British Chr./Pagan", "Feudal 2"},
		{"Yarmouth [Caerwent, Anglia, Logres]", "British/Roman Chr.", "Feudal 3"}
	};

-- FUNÇÕES
function rolarG(a, b)
	local retorno;
		if(rollOculto == false) then
			retorno = rolar(a,b);
		else
			retorno = rolarLocal(a,b);
		end;
	return retorno;
end;

-- MENSAGEM DE BOAS VINDAS
local indiceRoll, textoRoll = choose("𝕭𝖊𝖒-𝖛𝖎𝖓𝖉𝖔 𝖆 𝕻𝖊𝖓𝖉𝖗𝖆𝖌𝖔𝖓\nVocê está pronto para gerar seu Cavaleiro?", {"𝐑𝐎𝐋𝐀𝐆𝐄𝐍𝐒 𝐄𝐗𝐏𝐎𝐒𝐓𝐀𝐒\nCuidado, você rolará 𝘮𝘶𝘪𝘵𝘰𝘴 dados.", "𝐑𝐎𝐋𝐀𝐆𝐄𝐍𝐒 𝐎𝐂𝐔𝐋𝐓𝐀𝐒\nVocê perde um pouco de feedback."});
if(indiceRoll == 2) then rollOculto = true; espacamento = ""; end;
enviar("****");
enviar("‎\n‎⚜️ [§K2]"..meuJogador.login .."[§B][§K14] começou a gerar um Cavaleiro.\n‎");

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

	-- DETERMINANDO QUAL CULTURA
	local indiceCult, textoCult = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖆 𝕮𝖚𝖑𝖙𝖚𝖗𝖆 𝖉𝖊 𝖘𝖊𝖚 𝖈𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", {"𝐁𝐑𝐄𝐓𝐀𝐎\nO povo comum, hábeis lutadores de lança.", "𝐈𝐑𝐋𝐀𝐍𝐃𝐄𝐒\nNumerosos e amigáveis, são ótimos músicos.", "𝐏𝐈𝐂𝐓𝐎\nHomens tribais que vivem nos bosques.", "𝐑𝐎𝐌𝐀𝐍𝐎\nEsnobes de classe alta, sabem ler latim. ", "𝐒𝐀𝐗𝐀𝐎\nPessoas grandes, lentas e pouco sofisticadas.", "𝐀𝐐𝐔𝐈𝐓𝐀𝐍𝐄𝐎\nArrogantes nobres continentais, poetas. "}, 1);
	
		if(indiceCult == 1) then
			culturaesc = "Bretão"; 
			cultflag = "Cymric";
			
		elseif(indiceCult == 2) then 
			culturaesc = "Irlandês"; 
			cultflag = "Irish";
			
		elseif(indiceCult == 3) then 
			culturaesc = "Picto"; 
			cultflag = "Pict";
			
		elseif(indiceCult == 4) then 
			culturaesc = "Romano"; 
			cultflag = "Roman";
			
		elseif(indiceCult == 5) then 
			culturaesc = "Saxão"; 
			cultflag = "Saxon";
			
		elseif(indiceCult == 6) then 
			culturaesc = "Aquitâneo"; 
			cultflag = "Aquitainian"; 
			
		end;
		
	-- FEEDBACK CULTURA
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] escolheu a Cultura:[§B] [§K1]" .. culturaesc .. ".\n‎");
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
	-- DETERMINANDO QUAL RELIGIÃO
	if(indiceCult == 1 or indiceCult == 2) then
		local indiceReg, textoReg = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖆 𝕽𝖊𝖑𝖎𝖌𝖎𝖆̃𝖔 𝖉𝖊 𝖘𝖊𝖚 𝖈𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", {"Cristão Bretão", "Pagão Bretão"}, 1);
		if(indiceReg==1) then 
			regflag = "British Chr."; 
		elseif(indiceReg==2) then 
			regflag = "Pagan"; 
		end;
		
		religiaoesc = textoReg;
		
	elseif(indiceCult == 3) then
		local indiceReg, textoReg = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖆 𝕽𝖊𝖑𝖎𝖌𝖎𝖆̃𝖔 𝖉𝖊 𝖘𝖊𝖚 𝖈𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", {"Cristão Bretão", "Pagão Picto"}, 1);
		if(indiceReg==1) then 
			regflag = "British Chr."; 
		elseif(indiceReg==2) then 
			regflag = "Heathen"; 
		end;
		
		religiaoesc = textoReg;
		
	elseif(indiceCult == 4) then
		religiaoesc = "Cristão Romano"; 
		regflag = "Roman Chr.";
		
	elseif(indiceCult == 5) then
		local indiceReg, textoReg = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖆 𝕽𝖊𝖑𝖎𝖌𝖎𝖆̃𝖔 𝖉𝖊 𝖘𝖊𝖚 𝖈𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", {"Pagão Germânico", "Cristão Bretão"}, 1);
		if(indiceReg==1) then 
			regflag = "Pagan"; 
		elseif(indiceReg==2) then 
			regflag = "British Chr."; 
		end;
		
		religiaoesc = textoReg;
		
	elseif(indiceCult == 6) then
		religiaoesc = "Cristão Ariano"; 
		regflag = "Arian Chr."; 
	
	end;
		
	-- FEEDBACK RELIGIÃO
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] escolheu a Religião:[§B] [§K1]" .. religiaoesc .. ".\n‎");
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	
		
	-- DETERMINANDO REGIÕES DISPONÍVEIS
	cidDisp[1] = "𝐑𝐀𝐍𝐃𝐎𝐌"; 
	cidDispflag = 1;
	
	for i = 1,89 do 
		if(string.match(cidadesDet[i][2], regflag) and string.match(cidadesDet[i][2], cultflag)) then
			cidDispflag = cidDispflag+1;
			cidDisp[cidDispflag] = cidadesDet[i][1];
			
		end;
	end;
	
	local indiceCid, textoCult = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖆 𝕽𝖊𝖌𝖎𝖆̃𝖔 𝖉𝖊 𝕺𝖗𝖎𝖌𝖊𝖒 𝖉𝖊 𝖘𝖊𝖚 𝕮𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", cidDisp, 1);
		if(indiceCid==1) then 
			indiceCid = (rolarG("1d" .. cidDispflag-1, "Rolando Região de Origem"))+1;
			
		end;
	
	cidadeesc[1] = cidDisp[indiceCid];
	
	-- ARMAZENANDO DADOS DA CIDADE OU REGIÃO ESCOLHIDAS
	for i = 1,89 do 
		if(cidadesDet[i][1] == cidadeesc[1]) then
			cidadeesc[2] = cidadesDet[i][2];
			cidadeesc[3] = cidadesDet[i][3];
				
		end;
	end;
		
	-- FEEDBACK REGIÃO
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] escolheu a Região de Origem:[§B] [§K1]" .. cidadeesc[1] .. ".\n‎");
		
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	
	
	-- DETERMINANDO ORDEM DE NASCIMENTO
	local indiceFilho, textoFilho = choose("𝖁𝖔𝖈𝖊̂ 𝖉𝖊𝖘𝖊𝖏𝖆 𝖘𝖊𝖗 𝖔 𝕳𝖊𝖗𝖉𝖊𝖎𝖗𝖔 𝖔𝖚 𝖗𝖔𝖑𝖆𝖗?", {"𝐑𝐀𝐍𝐃𝐎𝐌", "Herdeiro"}, 1);
	if(indiceFilho == 2) then 
		qualFilho = 1;
		
	elseif(indiceFilho == 1) then
		qualFilho = rolarG("1d6", "Rolando Ordem de Nascimento");
		
	end;
		
		-- IRMÃOS MAIS VELHOS
		local numIrmaosMV = 0;
		if(qualFilho > 1) then
			numIrmaosMV = qualFilho-1;
			if(rollOculto == false) then
			diferencaIdMV, rolagemIdade = rolar(numIrmaosMV.."d4", "Rolando Diferença de Idade de Irmãos mais Velhos");
			sexoMV, rolagemSexo = rolar(numIrmaosMV.."d2", "Rolando Gênero de Irmãos mais Velhos");
			else
			diferencaIdMV, rolagemIdade = rolarLocal(numIrmaosMV.."d4", "Rolando Diferença de Idade de Irmãos mais Velhos");
			sexoMV, rolagemSexo = rolarLocal(numIrmaosMV.."d2", "Rolando Gênero de Irmãos mais Velhos");
			end;
			local dadosSexoMV = {}; 
			local dadosIdadeMV = {};
			
			-- COLETAR RESULTADOS IDADE
			for i = 1, #rolagemIdade.ops, 1 do
				local op = rolagemIdade.ops[i];       

				if op.tipo == "dado" then
					for j = 1, #op.resultados, 1 do
						dadosIdadeMV[#dadosIdadeMV + 1] = op.resultados[j];
						
					end;
				end;
			end;
			
			-- COLETAR RESULTADOS GÊNERO
			for i = 1, #rolagemSexo.ops, 1 do
			local op = rolagemSexo.ops[i];       

				if op.tipo == "dado" then
					for j = 1, #op.resultados, 1 do
						dadosSexoMV[#dadosSexoMV + 1] = op.resultados[j];
						
					end;
				end;
			end;

			-- CALCULANDO DIFERENÇA DE IDADE ENTRE IRMÃOS MAIS VELHOS E O PJ
			local somaIdades = {};
			for i = 1, numIrmaosMV do
				local somaTotal = 0;
				for j = i, 1, -1 do
					somaTotal = somaTotal + dadosIdadeMV[j];
				
				end;
				somaIdades[i] = somaTotal;
			
			end;
		
			-- ARMAZENANDO SEXO E IDADE DOS IRMÃOS MAIS VELHOS
			for i = 1, numIrmaosMV do
				if(dadosSexoMV[i] == 2) then 
					qualFilho = qualFilho-1; 
					irmaosPJ[i] = {"Mulher", math.floor(somaIdades[(numIrmaosMV+1)-i] + idadePJ) .. " anos"};
					
				elseif(dadosSexoMV[i] == 1) then
					irmaosPJ[i] = {"Homem", math.floor(somaIdades[(numIrmaosMV+1)-i] + idadePJ) .. " anos"};
					
				end;
			end;
			-- IMPEDINDO CAVALEIRO DE SER O TERCEIRO FILHO (O TERCEIRO VAI PRA IGREJA)
			if(qualFilho > 2) then 
				qualFilho = qualFilho+1; 
				
			end;
			
		end; 
		
		-- IRMÃOS MAIS NOVOS (APENAS COM 3 IRMÃOS MAIS VELHOS OU MENOS)
		local numIrmaosMN = 0;
		if(numIrmaosMV<4) then
			numIrmaosMN = rolarG("1d4", "Rolando Número de Irmãos mais Novos")-1;
			
			if(numIrmaosMN > 0) then
				if(rollOculto == false) then
					diferencaIdMN, rolagemIdade2 = rolar(numIrmaosMN.."d4", "Rolando Diferença de Idade de Irmãos mais Novos");
					sexoMN, rolagemSexo2 = rolar(numIrmaosMN.."d2", "Rolando Gênero de Irmãos mais Novos");
				else
					diferencaIdMN, rolagemIdade2 = rolarLocal(numIrmaosMN.."d4", "Rolando Diferença de Idade de Irmãos mais Novos");
					sexoMN, rolagemSexo2 = rolarLocal(numIrmaosMN.."d2", "Rolando Gênero de Irmãos mais Novos");				
				end;
				local dadosSexoMN = {}; 
				local dadosIdadeMN = {};
				
				-- COLETAR RESULTADOS IDADE
				for i = 1, #rolagemIdade2.ops, 1 do
					local op = rolagemIdade2.ops[i]; 
					
					if op.tipo == "dado" then
						for j = 1, #op.resultados, 1 do
									dadosIdadeMN[#dadosIdadeMN + 1] = op.resultados[j];
									
						end;
					end;
				end;
				
				-- COLETAR RESULTADOS GÊNERO
				for i = 1, #rolagemSexo2.ops, 1 do
					local op = rolagemSexo2.ops[i];       

					if op.tipo == "dado" then
						for j = 1, #op.resultados, 1 do
									dadosSexoMN[#dadosSexoMN + 1] = op.resultados[j];
									
						end;
					end;
				end;
				
				-- CALCULANDO DIFERENÇA DE IDADE ENTRE IRMÃOS MAIS NOVOS E O PJ				
				local somaIdadesN = {};
				for i = 1, numIrmaosMN do
					local somaTotal = 0;
				
					for j = i, 1, -1 do
						somaTotal = somaTotal + dadosIdadeMN[j];
						
					end;
					somaIdadesN[i] = somaTotal;
					
				end;
				
				-- ARMAZENANDO SEXO E IDADE DOS IRMÃOS MAIS NOVOS
				for i = 1, numIrmaosMN do
					if(dadosSexoMN[i] == 2) then 
						irmaosPJ[numIrmaosMV+i] = {"Mulher", math.floor(idadePJ - somaIdadesN[i]) .. " anos"};
						
					elseif(dadosSexoMN[i] == 1) then
						irmaosPJ[numIrmaosMV+i] = {"Homem", math.floor(idadePJ - somaIdadesN[i]) .. " anos"};
						
					end;
				end;
			end;
		end;
		
	-- FEEDBACK ORDEM DE NASCIMENTO
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] se tornou o:[§B] [§K1]".. qualFilho .. "º filho homem.\n‎");	
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	
	
	-- DETERMINANDO CARGO DO PAI		
	local dadoPai = rolarG("1d20", "Rolando Cargo do Pai");
	local oficialPai = rolarG("1d20", "Rolando Título da Côrte do Pai (Caso necessário)");
	local Why = rolarG("1d20", "Rolando Explicação para se tornar Cavaleiro (Caso necessário)");
	local expliFlag = false;
	local cargoPai = "";
	local oficialFlag = false;
		
	--DETERMINANDO CARGO A PARTIR DE ROLAGEM E NÍVEL DE CIVILIZAÇÃO DA REGIÃO
	-- CARGOS TRIBAL 2
	if(cidadeesc[3] == "Tribal 2") then
		if(dadoPai>0 and dadoPai<8) then
			cargoPai = "Guerreiro";
			expliFlag = true;
			
		elseif(dadoPai>7 and dadoPai<14) then
			cargoPai = "Guerreiro Famoso";
			expliFlag = true;
			
		elseif(dadoPai>13 and dadoPai<16) then
			cargoPai = "Chefe de Clã";
			expliFlag = true;
			
		elseif(dadoPai>15 and dadoPai<18) then
			cargoPai = "Guarda-costas";
			expliFlag = true;
			
		elseif(dadoPai == 18) then
			cargoPai = "Copeiro";
			expliFlag = true;
			
		elseif(dadoPai == 19) then
			cargoPai = "Warlord";
			expliFlag = true;
			
		elseif(dadoPai == 20) then
			cargoPai = "Conselheiro";
			expliFlag = true;
			
		end;
	
	-- CARGOS TRIBAL 3	
	elseif(cidadeesc[3] == "Tribal 3") then
		if(dadoPai>0 and dadoPai<10) then
			cargoPai = "Guerreiro";
			expliFlag = true;
			
		elseif(dadoPai>9 and dadoPai<13) then
			cargoPai = "Cavaleiro";
			
		elseif(dadoPai == 13) then
			cargoPai = "Chefe de Clã";
			
		elseif(dadoPai>13 and dadoPai<16) then
			cargoPai = "Guarda-costas";
			
		elseif(dadoPai == 16) then
			cargoPai = "Copeiro";
			
		elseif(dadoPai == 17) then
			cargoPai = "Warlord";
			
		elseif(dadoPai == 18) then
			cargoPai = "Mestre dos Cavalos";
			
		elseif(dadoPai>18) then
			cargoPai = "Conselheiro";
			
		end;
		
	-- CARGOS URBANO 1
	elseif(cidadeesc[3] == "Urban 1") then
		if(dadoPai>0 and dadoPai<6) then
			cargoPai = "Vigia";
			expliFlag = true;
			
		elseif(dadoPai>5 and dadoPai<11) then
			cargoPai = "Líder de Milícia";
			expliFlag = true;
			
		elseif(dadoPai>10 and dadoPai<16) then
			cargoPai = "Man-at-arms";
			expliFlag = true;
			
		elseif(dadoPai>15 and dadoPai<19) then
			cargoPai = "Oficial Urbano, Engenheiro Chefe";
			
		elseif(dadoPai >18) then
			cargoPai = "Oficial Urbano, Comandante de Guarnição";
			
		end;
	
	-- CARGOS URBANO 2		
	elseif(cidadeesc[3] == "Urban 2") then
		if(dadoPai == 1) then
			cargoPai = "Vigia";
			expliFlag = true;
			
		elseif(dadoPai>1 and dadoPai<6) then
			cargoPai = "Líder de Milícia";
			expliFlag = true;
			
		elseif(dadoPai>5 and dadoPai<9) then
			cargoPai = "Man-at-arms";
			expliFlag = true;
			
		elseif(dadoPai>8 and dadoPai<11) then
			cargoPai = "Oficial Urbano, Engenheiro Chefe";
			
		elseif(dadoPai>10 and dadoPai<13) then
			cargoPai = "Oficial Urbano, Comandante de Guarnição";
			
		elseif(dadoPai >12) then
			cargoPai = "Equites de uma Família Aristocrata";
			
		end;
	
	-- CARGOS URBANO 3
	elseif(cidadeesc[3] == "Urban 3") then
		if(dadoPai>0 and dadoPai<3) then
			cargoPai = "Vigia";
			expliFlag = true;
			
		elseif(dadoPai>2 and dadoPai<6) then
			cargoPai = "Líder de Milícia";
			expliFlag = true;
			
		elseif(dadoPai>5 and dadoPai<9) then
			cargoPai = "Man-at-arms";
			expliFlag = true;
			
		elseif(dadoPai>8 and dadoPai<11) then
			cargoPai = "Oficial Urbano, Engenheiro Chefe";
			
		elseif(dadoPai>10 and dadoPai<13) then
			cargoPai = "Oficial Urbano, Comandante de Guarnição";
			
		elseif(dadoPai>12 and dadoPai<19) then
			cargoPai = "Equites de uma Família Aristocrata";
			
		elseif(dadoPai>18) then
			cargoPai = "Equites de Propriedade Livre";
			
		end;
	
	-- CARGOS FEUDAL 1		
	elseif(cidadeesc[3] == "Feudal 1") then
		if(dadoPai>0 and dadoPai<6) then
			cargoPai = "Esquire";
			expliFlag = true;
			
		elseif(dadoPai>5 and dadoPai<15) then
			cargoPai = "Cavaleiro Domiciliar";
			
		elseif(dadoPai>14 and dadoPai<19) then
			cargoPai = "Cavaleiro de Terras";
			
		elseif(dadoPai >18) then
			oficialFlag = true;
			if(oficialPai>0 and oficialPai<11) then
				cargoPai = "Cavaleiro e Castellan";
				
			elseif(oficialPai>0 and oficialPai<11) then
				cargoPai = "Cavaleiro e Butler";
				
			elseif(oficialPai>10 and oficialPai<13) then
				cargoPai = "Cavaleiro e Chamberlain";
				
			elseif(oficialPai>0 and oficialPai<11) then
				cargoPai = "Cavaleiro e Justiciar";
				
			elseif(oficialPai>0 and oficialPai<11) then
				cargoPai = "Cavaleiro e Marshall";
				
			elseif(oficialPai>0 and oficialPai<11) then
				cargoPai = "Cavaleiro e Senescal";
				
			end;
		end;
	
	-- CARGOS FEUDAL 2
	elseif(cidadeesc[3] == "Feudal 2") then
		if(dadoPai>0 and dadoPai<6) then
			cargoPai = "Esquire";
			expliFlag = true;
			
		elseif(dadoPai>5 and dadoPai<13) then
			cargoPai = "Cavaleiro Domiciliar";
			
		elseif(dadoPai>12 and dadoPai<19) then
			cargoPai = "Cavaleiro de Terras";
			
		elseif(dadoPai==19) then
			cargoPai = "Banneret";
			
		elseif(dadoPai == 20) then
			oficialFlag = true;
			if(oficialPai==1) then
				cargoPai = "Cavaleiro e Admiral";
				
			elseif(oficialPai>1 and oficialPai<11) then
				cargoPai = "Cavaleiro e Constable/Castellan";
				
			elseif(oficialPai==11) then
				cargoPai = "Cavaleiro e Butler";
				
			elseif(oficialPai==12) then		
				cargoPai = "Cavaleiro e Chamberlain";
					
			elseif(oficialPai==13) then
				cargoPai = "Cavaleiro e Chancellor";
				
			elseif(oficialPai==14) then
				cargoPai = "Cavaleiro e Forester";
				
			elseif(oficialPai==15) then
				cargoPai = "Cavaleiro e Justiciar";
				
			elseif(oficialPai==16) then
				cargoPai = "Cavaleiro e Marshall";
					
			elseif(oficialPai>16 and oficialPai<19) then
				cargoPai = "Cavaleiro e Senescal";
				
			elseif(oficialPai>18) then
				cargoPai = "Cavaleiro e Xerife";
					
			end;
		end;
			
	-- CARGOS FEUDAL 3
	elseif(cidadeesc[3] == "Feudal 3") then
		if(dadoPai>0 and dadoPai<9) then
			cargoPai = "Esquire";
			expliFlag = true;
			
		elseif(dadoPai>8 and dadoPai<13) then
			cargoPai = "Cavaleiro Domiciliar";
			
		elseif(dadoPai>12 and dadoPai<18) then
			cargoPai = "Cavaleiro de Terras";
			
		elseif(dadoPai>17 and dadoPai<20) then
			cargoPai = "Banneret";
			
		elseif(dadoPai == 20) then
			oficialFlag = true;
			if(oficialPai==1) then
				cargoPai = "Cavaleiro e Admiral";
			
			elseif(oficialPai>1 and oficialPai<4) then
				cargoPai = "Cavaleiro e Commissioner";
				
			elseif(oficialPai>3 and oficialPai<11) then
				cargoPai = "Cavaleiro e Constable/Castellan";
			
			elseif(oficialPai==11) then
				cargoPai = "Cavaleiro e Butler";
			
			elseif(oficialPai==12) then
				cargoPai = "Cavaleiro e Chamberlain";
			
			elseif(oficialPai==13) then
				cargoPai = "Cavaleiro e Chancellor";
			
			elseif(oficialPai==14) then
				cargoPai = "Cavaleiro e Forester";
			
			elseif(oficialPai==15) then
				cargoPai = "Cavaleiro e Justiciar";
			
			elseif(oficialPai==16) then
				cargoPai = "Cavaleiro e Marshall";
			
			elseif(oficialPai>16 and oficialPai<19) then
				cargoPai = "Cavaleiro e Senescal";
			
			elseif(oficialPai>18) then
				cargoPai = "Cavaleiro e Xerife";
			
			end;
		end;
	end;

	-- DETERMINANDO EXPLICAÇÃO PARA PJ SE TORNAR CAVALEIRO CASO O PAI NÃO SEJA ADEQUADO
	local explicacao = "";
	if(expliFlag == true) then
		if(Why>0 and Why<5) then
			explicacao = ", mas se tornou um cavaleiro em honra aos feitos militares do pai";
			
		elseif(Why>4 and Why<8) then
			explicacao = ", mas se tornou um cavaleiro graças a contribuição econômica de seu pai para um nobre";
			
		elseif(Why>7 and Why<12) then
			explicacao = ", mas sua mãe era nobre";
			
		elseif(Why>11 and Why<14) then
			explicacao = ", mas seu pai prestou um grande serviço a um nobre";
			
		elseif(Why>13 and Why<18) then
			explicacao = ", mas seu pai desempenhou seu dever extraordinariamente";
			
		elseif(Why==18) then
			explicacao = ", mas seu senhor precisa de mais cavaleiros para uma batalha";
			
		elseif(Why==19) then
			explicacao = ", mas seu pai [§T]de verdade[§T] era um cavaleiro";
			
		elseif(Why==20) then
			explicacao = ", mas um mago ou sacerdote profetizou [§T]“uma história fascinante”[§T] caso você se tornasse cavaleiro";
		
		end;
	end;
		
	-- FEEDBACK DA CLASSE DO PAI
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] é filho de um:[§B] [§K1]" .. cargoPai .. explicacao ..".\n‎");

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
	-- GLORIA
	local gloria = rolarG("6d6+150", "Rolando a sua Glória");
	if(cargoPai == "Banneret" or cargoPai == "Chefe de Clã") then
		local anosDoPai = rolarG("6d6", "Rolando quanto tempo seu pai ficou em seu último Cargo");
		gloria = gloria + 100 + (anosDoPai*10);	
		
	elseif(oficialFlag == true and cargoPai ~= "Cavaleiro e Commissioner") then
		local anosDoPai = rolarG("6d6", "Rolando quanto tempo seu pai ficou em seu último Cargo");
		gloria = gloria + 50 + (anosDoPai*10);
		
	elseif(cargoPai == "Oficial Urbano, Engenheiro Chefe" or cargoPai == "Oficial Urbano, Comandante de Guarnição") then
		local anosDoPai = rolarG("6d6", "Rolando quanto tempo seu pai ficou em seu último Cargo");
		gloria = gloria + 100 + (anosDoPai*20);
	
	elseif(cargoPai == "Cavaleiro e Commissioner") then 
		gloria =  gloria + 100; 
	
	end;

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
		-- CLASSE INICIAL
		local qualClasse = "";
		local modRiqueza = 0;
		
		--DETERMINANDO QUAL CLASSE DEPENDENDO DA ORDEM DE NASCIMENTO
		if(qualFilho == 1) then	
			if(cargoPai == "Banneret") then
				qualClasse = "Cavaleiro de Terras";	
				
			elseif(cargoPai == "Equites de uma Família Aristocrata") then
				qualClasse = "Equites de Propriedade Livre";
				local modRiqueza = 1;				
				
			elseif(cargoPai == "Equites de Propriedade Livre") then
				qualClasse = "Cavaleiro de Terras";	
				
			elseif(cargoPai == "Esquire") then
				qualClasse = "Cavaleiro Domiciliar";
				
			elseif(cargoPai == "Cavaleiro Domiciliar") then
				qualClasse = "Cavaleiro Domiciliar";
				
			elseif(cargoPai == "Cavaleiro de Terras") then
				qualClasse = "Cavaleiro de Terras";
				
			elseif(oficialFlag == true) then
				qualClasse = cargoPai;
				local modRiqueza = 1;
				
			end;
			
		elseif(qualFilho ==2) then
			if(cargoPai == "Banneret") then
				qualClasse = "Cavaleiro Domiciliar";
				
			elseif(cargoPai == "Equites de uma Família Aristocrata") then
				qualClasse = "Cavaleiro Domiciliar";
				
			elseif(cargoPai == "Equites de Propriedade Livre") then
				qualClasse = "Esquire";
				
				local modRiqueza = -1;
			elseif(cargoPai == "Esquire") then
				qualClasse = "Esquire";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Cavaleiro Domiciliar") then
				qualClasse = "Esquire";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Cavaleiro de Terras") then
				qualClasse = "Cavaleiro Domiciliar";
				
			elseif(oficialFlag == true) then
				qualClasse = cargoPai;
				
			end;
			
		elseif(qualFilho>2) then
			if(cargoPai == "Banneret") then
				qualClasse = "Cavaleiro Domiciliar";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Equites de uma Família Aristocrata") then
				qualClasse = "Cavaleiro Domiciliar";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Equites de Propriedade Livre") then
				qualClasse = "Esquire";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Esquire") then
				qualClasse = "Esquire";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Cavaleiro Domiciliar") then
				qualClasse = "Esquire";
				local modRiqueza = -1;
				
			elseif(cargoPai == "Cavaleiro de Terras") then
				qualClasse = "Cavaleiro Domiciliar";
				local modRiqueza = -1;
				
			elseif(oficialFlag == true) then
				qualClasse = cargoPai;
				local modRiqueza = -1;
				
			end;			
		end;
		
			-- DETERMINANDO QUAL CLASSE DEPENDENDO DA REGIÃO, SOBRESCREVENDO ALGUNS CASOS
			if(cidadeesc[3] == "Tribal 1" or cidadeesc[3] == "Tribal 2" or cidadeesc[3] == "Tribal 3") then
				 qualClasse = "Cavaleiro Domiciliar"; 
				 modRiqueza = 0;
				 
			elseif(cidadeesc[3] == "Urban 1" or cidadeesc[3] == "Urban 2" or cidadeesc[3] == "Urban 3") then
				if(cargoPai ~= "Equites de uma Família Aristocrata" and cargoPai ~= "Equites de Propriedade Livre") then 
					qualClasse = "Cavaleiro Domiciliar"; 
					modRiqueza = 0; 
					
				end;
				
			elseif(culturaesc == "Saxão") then
				if(cidadeesc[1] ~= "Surrey [Logres]") then qualClasse = "Cavaleiro Domiciliar"; 
					modRiqueza = 0; 
					
				end;
			end;
		
	-- FEEDBACK DA CLASSE DO JOGADOR
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] obteve como classe inicial:[§B] [§K1]" .. qualClasse .. ".\n‎");
		
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
		
	-- DETERMINANDO NíVEL DE RIQUEZA DA FAMÍLIA
	local dadoRiqueza = rolarG("1d20", "Rolando Nível de Riqueza da Família");
	local modRiquezaBruto = 0;
	local riquezaPJnum = 0;
	local riquezaPJ = "";
	
		-- APLICANDO MODIFICADORES ESPECÍFICOS
		if(oficialFlag == true) then 
			modRiquezaBruto = modRiquezaBruto+2; 
			
		end;
		
		if(cargoPai == "Banneret") then 
			modRiquezaBruto = modRiquezaBruto+2; 
			
		end;
		
		if(cargoPai == "Cavaleiro Domiciliar") then 
			modRiquezaBruto = modRiquezaBruto-3; 
		
		end;
		
		if(cidadeesc[3] == "Tribal 1" or cidadeesc[3] == "Tribal 2" or cidadeesc[3] == "Tribal 3") then 
			modRiquezaBruto = modRiquezaBruto-5; 
		
		end;
		
		if(cargoPai == "Equites de uma Família Aristocrata") then 
			modRiquezaBruto = modRiquezaBruto+3; 
			
		end;
		
		if(culturaesc == "Saxão") then 
			modRiquezaBruto = modRiquezaBruto-10; 
		end;
		
		-- DETERMINANDO NÍVEL DE RIQUEZA A PARTIR DE MODIFICADORES E LIMIARES
		if((dadoRiqueza+modRiquezaBruto)<7) then 
			riquezaPJnum = 1;
			
		elseif((dadoRiqueza+modRiquezaBruto)>6 and (dadoRiqueza+modRiquezaBruto)<17) then 
			riquezaPJnum = 2;
			
		elseif((dadoRiqueza+modRiquezaBruto)>16 and (dadoRiqueza+modRiquezaBruto)<22) then 
			riquezaPJnum = 3;
			
		elseif((dadoRiqueza+modRiquezaBruto)>21 and (dadoRiqueza+modRiquezaBruto)<25) then 
			riquezaPJnum = 4;
			
		elseif((dadoRiqueza+modRiquezaBruto)>24) then 
			riquezaPJnum = 5; 
			
		end;
		
		if((riquezaPJnum+modRiqueza) == 1 or (riquezaPJnum+modRiqueza) == 0) then 
			riquezaPJ = "Pobre";
			
		elseif((riquezaPJnum+modRiqueza) == 2) then 
			riquezaPJ = "Comum";
			
		elseif((riquezaPJnum+modRiqueza) == 3) then 
			riquezaPJ = "Rico";
			
		elseif((riquezaPJnum+modRiqueza) == 4) then 
			riquezaPJ = "Superlativo";
			
		elseif((riquezaPJnum+modRiqueza) == 5) then 
			riquezaPJ = "Espetacular"; 
			
		end;
		
	-- FEEDBACK DA RIQUEZA DO JOGADOR
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] obteve como Nível de Riqueza:[§B] [§K1]" .. riquezaPJ .. ".\n‎");
			
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
		
	-- DETERMINANDO TRAÇO DA FAMÍLIA
	local dadoTraco = rolarG("1d20", "Rolando Traço da Família");
	local tracoFamilia = "";
	local expliTraco = "";
		
	if(dadoTraco == 1) then 
		tracoFamilia = "Sentidos Aguçados [§K15](+5 Atenção)"; 
		skAtencao = 5; 
		skEspreita = 5;
		expliTraco = "Tradição de aplicação da lei / Assassinatos frequentes / Guerrilha";
		
	elseif(dadoTraco == 2) then 
		tracoFamilia = "Lobos e Raposas [§K15](+5 Caça)"; 
		skCaca = 5; 
		skEspreita = 5;
		expliTraco = "Núcleo da família vive em terras bastante rurais / Crianças mandadas para Gales / Guerrilha";
		
	elseif(dadoTraco == 3) then 
		tracoFamilia = "Adoram Festas [§K15](+5 Tocar)"; 
		skTocar = 5; 
		skMusica = 5;
		expliTraco = "Instrumento passado por gerações / História da família em uma música mnemônica";
	
	elseif(dadoTraco == 4) then 
		tracoFamilia = "Calorosos [§K15](+5 Entretenimento)"; 
		skEntretenimento = 5; 
		skRomance = 5;
		expliTraco = "Família por algum motivo sempre teve muitas mulheres / Ambiente que faz cavaleiros crescerem bem ajustados";
	
	elseif(dadoTraco == 5) then 
		tracoFamilia = "Colecionadores de Histórias [§K15](+5 Oratória)"; 
		skOratoria = 5;
		expliTraco = "Sangue romano / Sangue judeu / Parentes se metem em situações incríveis";
	
	elseif(dadoTraco == 6) then 
		tracoFamilia = "Mãos Firmes [§K15](+5 Primeiros Socorros)"; 
		skPSocorros = 5;
		expliTraco = "Filhos elevados de um médico romano ou judeu, partes da família ainda no negócio";
	
	elseif(dadoTraco == 7) then 
		tracoFamilia = "Planejadores Naturais [§K15](+5 Administração)"; 
		skAdministracao = 5;
		expliTraco = "Família passou fome / Abrigaram refugiados / Organizadores de tributos";
	
	elseif(dadoTraco == 8) then 
		tracoFamilia = "Assustadores [§K15](+5 Eerie)"; 
		skEerie = 5;
		expliTraco = "Pai ou avô se casou com uma seidkona ou volva / Maldição real ou imaginada sobre a família";
	
	elseif(dadoTraco == 9) then 
		tracoFamilia = "Próximos da Plebe [§K15](+5 Folclore)"; 
		skFolclore = 5; 
		skDireito = 5;
		expliTraco = "Família perdeu a fortuna / Recentemente tornaram-se cavaleiros / Bastardos / Mãe ou avó plebeia / Secretamente plebeus";
	
	elseif(dadoTraco == 10) then 
		tracoFamilia = "Ambiciosos [§K15](+5 Cortesia)"; 
		skCortesia = 5; 
		skRomance = 5; 
		skDireito = 5;
		expliTraco = "Ambiente rígido em casa / Muitos membros da família são mordomos";
	
	elseif(dadoTraco == 11) then 
		tracoFamilia = "Leitores [§K15](+5 Leitura)"; 
		skLeitura = 5;
		expliTraco = "Ligados a uma antiga biblioteca ou coleção de livros sobrevivente";
	
	elseif(dadoTraco == 12) then 
		tracoFamilia = "Maternais [§K15](+5 Cirurgia)"; 
		skCirurgia = 5;
		expliTraco = "Família abrigou refugiados / Freiras na família / Região especialmente violenta durante a Anarquia";
	
	elseif(dadoTraco == 13) then 
		tracoFamilia = "Pios [§K15](+5 Religião)"; 
		skReligiao = 5;
		expliTraco = "Passado de heresia / Passado combatendo heresia / Crianças mandadas para um monastério";
	
	elseif(dadoTraco == 14) then 
		tracoFamilia = "Nunca Esquecem um Rosto [§K15](+5 Reconhecimento)"; 
		skReconhecimento = 5;
		expliTraco = "Adoram festas / Membros da família são xerifes / Membros da família são arautos";
	
	elseif(dadoTraco == 15) then 
		tracoFamilia = "Bons com Animais [§K15](+5 Animais)"; 
		skAnimais = 5;
		expliTraco = "Todo mundo na família tem um animal de estimação";
	
	elseif(dadoTraco == 16) then 
		tracoFamilia = "Passado Complicado [§K15](+5 Vadiagem)"; 
		skVadiagem = 5;
		expliTraco = "Família perdeu sua fortuna / Família descende de bastardos / Família fez dinheiro com contrabando";
	
	elseif(dadoTraco == 17) then 
		tracoFamilia = "Dedutivos [§K15](+5 Intriga)"; 
		skRomance = 5; 
		skDireito = 5; 
		skIntriga = 5;
		expliTraco = "Tradição mercenária / Cortesãs na família / Feuds frequentes entre membros";
	
	elseif(dadoTraco == 18) then 
		tracoFamilia = "Refinados [§K15](+5 Menestrel)"; 
		skMenestrel = 5;
		expliTraco = "Sangue aquitâneo / Gostam de teatro";
	
	elseif(dadoTraco == 19) then 
		tracoFamilia = "Nascidos na Sela [§K15](+5 Equitação)"; 
		skEquitacao = 5;
		expliTraco = "Família passou a Anarquia saqueando";
	
	elseif(dadoTraco == 20) then 
		tracoFamilia = "Autoridade natural [§K15](+5 Batalha)"; 
		skBatalha = 5;
		expliTraco = "Muitos membros da família são comandantes";
		
	end;
			
	-- FEEDBACK DO TRAÇO DA FAMÍLIA
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] obteve como Traço de Família:[§B] [§K1]" .. tracoFamilia .."[§K14], ("..expliTraco.. ")[§K1].\n‎");

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	

	-- HABILIDADES
	if(culturaesc == "Bretão") then
		skAdaga = skAdaga + 5;
		skArco = skArco + 0;
		skBatalha = skBatalha + 10;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 10;
		skEspadas = skEspadas + 10;
		skLanca = skLanca + 0;
		skMachMart = skMachMart + 0;
		skArremesso = skArremesso + 0;
		skLancaMontada = skLancaMontada + 0;
		skArmasPesadas = skArmasPesadas + 0;
		skLancas = skLancas + 10;
		
		skAtencao = skAtencao + 7;
		skAdministracao = skAdministracao + 2;
		skReconhecimento = skReconhecimento + 3;
		skCaca = skCaca + 6;
		skEerie = skEerie + 1;
		skAnimais = skAnimais + 3;
		skTocar = skTocar + 4;
		skFolclore = skFolclore + 2;
		skVadiagem = skVadiagem + 0;
		skEntretenimento = skEntretenimento + 3;
		skCortesia = skCortesia + 5;
		skIntriga = skIntriga + 3;
		skOratoria = skOratoria + 5;
		skLeitura = skLeitura + 0;
		skMenestrel = skMenestrel + 2;
		skPSocorros = skPSocorros + 10;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 1;
		skReligiao = skReligiao + 2;
		skRomance = skRomance + 0;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
		
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lanças[§B][§K14]			"..string.format("%02d",skLancas).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso);
		habilidadeNormF = "[§K1]	[§B]Atenção[§B][§K14] ♞		"..string.format("%02d",skAtencao).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Caça[§B][§K14] ♞		"..string.format("%02d",skCaca).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Tocar[§B][§K14]			"..string.format("%02d",skTocar).."	[§K1][§B]Folclore[§B][§K14]		"..string.format("%02d",skFolclore).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Entretenimento[§B][§K14] ⨉	"..string.format("%02d",skEntretenimento).."	[§K1][§B]Cortesia[§B][§K14] ♞		"..string.format("%02d",skCortesia).."	[§K1][§B]Intriga[§B][§K14]			"..string.format("%02d",skIntriga).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."\n‎\n[§K1]	[§B]Compor[§B][§K14]		"..string.format("%02d",skCompor).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	elseif(culturaesc == "Saxão") then
		skAdaga = skAdaga + 1;
		skArco = skArco + 0;
		skBatalha = skBatalha + 5;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 5;
		skEspadas = skEspadas + 2;
		skLanca = skLanca + 4;
		skMachMart = skMachMart + 5;
		skArremesso = skArremesso + 5;
		skLancaMontada = skLancaMontada + 2;
		skArmasPesadas = skArmasPesadas + 10;
		skLancas = skLancas + 0;
		
		skAtencao = skAtencao + 8;
		skAdministracao = skAdministracao + 2;
		skReconhecimento = skReconhecimento + 4;
		skCaca = skCaca + 8;
		skEerie = skEerie + 2;
		skAnimais = skAnimais + 5;
		skTocar = skTocar + 3;
		skFolclore = skFolclore + 4;
		skVadiagem = skVadiagem + 2;
		skEntretenimento = skEntretenimento + 2;
		skCortesia = skCortesia + 5;
		skIntriga = skIntriga + 2;
		skOratoria = skOratoria + 3;
		skLeitura = skLeitura + 0;
		skMenestrel = skMenestrel + 3;
		skPSocorros = skPSocorros + 10;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 1;
		skReligiao = skReligiao + 2;
		skRomance = skRomance + 0;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
		
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lança[§B][§K14]			"..string.format("%02d",skLanca).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso).."\n‎\n[§K1]	[§B]Lança Montada[§B][§K14]	"..string.format("%02d",skLancaMontada).."	[§K1][§B]Armas Pesadas[§B][§K14]	"..string.format("%02d",skArmasPesadas);
		habilidadeNormF = "[§K1]	[§B]Atenção[§B][§K14] ♞		"..string.format("%02d",skAtencao).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Caça[§B][§K14] ♞		"..string.format("%02d",skCaca).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Tocar[§B][§K14]			"..string.format("%02d",skTocar).."	[§K1][§B]Folclore[§B][§K14]		"..string.format("%02d",skFolclore).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Entretenimento[§B][§K14] ⨉	"..string.format("%02d",skEntretenimento).."	[§K1][§B]Cortesia[§B][§K14] ♞		"..string.format("%02d",skCortesia).."	[§K1][§B]Intriga[§B][§K14]			"..string.format("%02d",skIntriga).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."\n‎\n[§K1]	[§B]Compor[§B][§K14]		"..string.format("%02d",skCompor).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	elseif(culturaesc == "Aquitâneo") then
		skAdaga = skAdaga + 2;
		skArco = skArco + 0;
		skBatalha = skBatalha + 10;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 10;
		skEspadas = skEspadas + 10;
		skLanca = skLanca + 2;
		skMachMart = skMachMart + 0;
		skArremesso = skArremesso + 1;
		skLancaMontada = skLancaMontada + 10;
		skArmasPesadas = skArmasPesadas + 0;
		skLancas = skLancas + 0;
		
		skAtencao = skAtencao + 5;
		skAdministracao = skAdministracao + 2;
		skReconhecimento = skReconhecimento + 2;
		skCaca = skCaca + 5;
		skEerie = skEerie + 2;
		skAnimais = skAnimais + 4;
		skTocar = skTocar + 2;
		skFolclore = skFolclore + 2;
		skVadiagem = skVadiagem + 2;
		skEntretenimento = skEntretenimento + 0;
		skCortesia = skCortesia + 0;
		skIntriga = skIntriga + 0;
		skOratoria = skOratoria + 5;
		skLeitura = skLeitura + 2;
		skMenestrel = skMenestrel + 3;
		skPSocorros = skPSocorros + 2;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 4;
		skReligiao = skReligiao + 2;
		skRomance = skRomance + 5;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
		
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lança[§B][§K14]			"..string.format("%02d",skLanca).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso).."\n‎\n[§K1]	[§B]Lança Montada[§B][§K14]	"..string.format("%02d",skLancaMontada);
		habilidadeNormF = "[§K1]	[§B]Atenção[§B][§K14] ♞		"..string.format("%02d",skAtencao).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Caça[§B][§K14] ♞		"..string.format("%02d",skCaca).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Tocar[§B][§K14]			"..string.format("%02d",skTocar).."	[§K1][§B]Folclore[§B][§K14]		"..string.format("%02d",skFolclore).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."	[§K1][§B]Romance[§B][§K14] ♞		"..string.format("%02d",skRomance).."\n‎\n[§K1]	[§B]Compor[§B][§K14]		"..string.format("%02d",skCompor).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	elseif(culturaesc == "Romano") then
		skAdaga = skAdaga + 0;
		skArco = skArco + 0;
		skBatalha = skBatalha + 0;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 0;
		skEspadas = skEspadas + 0;
		skLanca = skLanca + 0;
		skMachMart = skMachMart + 0;
		skArremesso = skArremesso + 0;
		skLancaMontada = skLancaMontada + 0;
		skArmasPesadas = skArmasPesadas + 0;
		skLancas = skLancas + 0;
		
		skAtencao = skAtencao + 0;
		skAdministracao = skAdministracao + 0;
		skReconhecimento = skReconhecimento + 0;
		skCaca = skCaca + 0;
		skEerie = skEerie + 0;
		skAnimais = skAnimais + 0;
		skTocar = skTocar + 0;
		skFolclore = skFolclore + 0;
		skVadiagem = skVadiagem + 0;
		skEntretenimento = skEntretenimento + 0;
		skCortesia = skCortesia + 0;
		skIntriga = skIntriga + 0;
		skOratoria = skOratoria + 0;
		skLeitura = skLeitura + 0;
		skMenestrel = skMenestrel + 0;
		skPSocorros = skPSocorros + 0;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 0;
		skReligiao = skReligiao + 0;
		skRomance = skRomance + 0;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
		
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lança[§B][§K14]			"..string.format("%02d",skLanca).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso).."\n‎\n[§K1]	[§B]Lança Montada[§B][§K14]	"..string.format("%02d",skLancaMontada);
		habilidadeNormF = "[§K1]	[§B]Atenção[§B][§K14] ♞		"..string.format("%02d",skAtencao).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Caça[§B][§K14] ♞		"..string.format("%02d",skCaca).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Tocar[§B][§K14]			"..string.format("%02d",skTocar).."	[§K1][§B]Entretenimento[§B][§K14] ⨉	"..string.format("%02d",skEntretenimento).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."	[§K1][§B]Direito[§B][§K14] ♞		"..string.format("%02d",skDireito).."\n‎\n[§K1]	[§B]Compor[§B][§K14]		"..string.format("%02d",skCompor).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	elseif(culturaesc == "Picto") then
		skAdaga = skAdaga + 0;
		skArco = skArco + 0;
		skBatalha = skBatalha + 0;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 0;
		skEspadas = skEspadas + 0;
		skLanca = skLanca + 0;
		skMachMart = skMachMart + 0;
		skArremesso = skArremesso + 0;
		skLancaMontada = skLancaMontada + 0;
		skArmasPesadas = skArmasPesadas + 0;
		skLancas = skLancas + 0;
			
		skAtencao = skAtencao + 0;
		skAdministracao = skAdministracao + 0;
		skReconhecimento = skReconhecimento + 0;
		skCaca = skCaca + 0;
		skEerie = skEerie + 0;
		skAnimais = skAnimais + 0;
		skTocar = skTocar + 0;
		skFolclore = skFolclore + 0;
		skVadiagem = skVadiagem + 0;
		skEntretenimento = skEntretenimento + 0;
		skCortesia = skCortesia + 0;
		skIntriga = skIntriga + 0;
		skOratoria = skOratoria + 0;
		skLeitura = skLeitura + 0;
		skMenestrel = skMenestrel + 0;
		skPSocorros = skPSocorros + 0;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 0;
		skReligiao = skReligiao + 0;
		skRomance = skRomance + 0;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
			
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lança[§B][§K14]			"..string.format("%02d",skLanca).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso).."\n‎\n[§K1]	[§B]Lança Montada[§B][§K14]	"..string.format("%02d",skLancaMontada);
		habilidadeNormF = "[§K1]	[§B]Espreita[§B][§K14] ♞		"..string.format("%02d",skEspreita).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Compor[§B][§K14]		"..string.format("%02d",skCompor).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Tocar[§B][§K14]			"..string.format("%02d",skTocar).."	[§K1][§B]Folclore[§B][§K14]		"..string.format("%02d",skFolclore).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Entretenimento[§B][§K14] ⨉	"..string.format("%02d",skEntretenimento).."	[§K1][§B]Cortesia[§B][§K14] ♞		"..string.format("%02d",skCortesia).."	[§K1][§B]Intriga[§B][§K14]			"..string.format("%02d",skIntriga).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	elseif(culturaesc == "Irlandês") then
		skAdaga = skAdaga + 0;
		skArco = skArco + 0;
		skBatalha = skBatalha + 0;
		skBesta = skBesta + 0;
		skEquitacao = skEquitacao + 0;
		skEspadas = skEspadas + 0;
		skLanca = skLanca + 0;
		skMachMart = skMachMart + 0;
		skArremesso = skArremesso + 0;
		skLancaMontada = skLancaMontada + 0;
		skArmasPesadas = skArmasPesadas + 0;
		skLancas = skLancas + 0;
			
		skAtencao = skAtencao + 0;
		skAdministracao = skAdministracao + 0;
		skReconhecimento = skReconhecimento + 0;
		skCaca = skCaca + 0;
		skEerie = skEerie + 0;
		skAnimais = skAnimais + 0;
		skTocar = skTocar + 0;
		skFolclore = skFolclore + 0;
		skVadiagem = skVadiagem + 0;
		skEntretenimento = skEntretenimento + 0;
		skCortesia = skCortesia + 0;
		skIntriga = skIntriga + 0;
		skOratoria = skOratoria + 0;
		skLeitura = skLeitura + 0;
		skMenestrel = skMenestrel + 0;
		skPSocorros = skPSocorros + 0;
		skCirurgia = skCirurgia + 0;
		skCompor = skCompor + 0;
		skReligiao = skReligiao + 0;
		skRomance = skRomance + 0;
		skDireito = skDireito + 0;
		skEspreita = skEspreita + 0;
		skMusica = skMusica + 0;
			
		habilidadeArmaF = "[§K1]	[§B]Adaga[§B][§K14]			"..string.format("%02d",skAdaga).."	[§K1][§B]Arco[§B][§K14]			"..string.format("%02d",skArco).."	[§K1][§B]Batalha[§B][§K14] ♞		"..string.format("%02d",skBatalha).."\n‎\n[§K1]	[§B]Besta[§B][§K14]			"..string.format("%02d",skBesta).."	[§K1][§B]Equitação[§B][§K14] ♞		"..string.format("%02d",skEquitacao).."	[§K1][§B]Espadas[§B][§K14] ♞		"..string.format("%02d",skEspadas).."\n‎\n[§K1]	[§B]Lança[§B][§K14]			"..string.format("%02d",skLanca).."	[§K1][§B]Machados/Martelos[§B][§K14]	"..string.format("%02d",skMachMart).."	[§K1][§B]Arremesso[§B][§K14]		"..string.format("%02d",skArremesso).."\n‎\n[§K1]	[§B]Lança Montada[§B][§K14]	"..string.format("%02d",skLancaMontada);
		habilidadeNormF = "[§K1]	[§B]Atenção[§B][§K14] ♞		"..string.format("%02d",skAtencao).."	[§K1][§B]Administração[§B][§K14]	"..string.format("%02d",skAdministracao).."	[§K1][§B]Reconhecimento[§B][§K14]	"..string.format("%02d",skReconhecimento).."\n‎\n[§K1]	[§B]Caça[§B][§K14] ♞		"..string.format("%02d",skCaca).."	[§K1][§B]Eerie[§B][§K14]			"..string.format("%02d",skEerie).."	[§K1][§B]Animais[§B][§K14]		"..string.format("%02d",skAnimais).."\n‎\n[§K1]	[§B]Música[§B][§K14]		"..string.format("%02d",skMusica).."	[§K1][§B]Folclore[§B][§K14]		"..string.format("%02d",skFolclore).."	[§K1][§B]Vadiagem[§B][§K14] ⨉		"..string.format("%02d",skVadiagem).."\n‎\n[§K1]	[§B]Entretenimento[§B][§K14] ⨉	"..string.format("%02d",skEntretenimento).."	[§K1][§B]Cortesia[§B][§K14] ♞		"..string.format("%02d",skCortesia).."	[§K1][§B]Intriga[§B][§K14]			"..string.format("%02d",skIntriga).."\n‎\n[§K1]	[§B]Oratória[§B][§K14]		"..string.format("%02d",skOratoria).."	[§K1][§B]Leitura[§B][§K14]			"..string.format("%02d",skLeitura).."	[§K1][§B]Menestrel[§B][§K14]		"..string.format("%02d",skMenestrel).."\n‎\n[§K1]	[§B]P. Socorros[§B][§K14] ♞		"..string.format("%02d",skPSocorros).."	[§K1][§B]Cirurgia[§B][§K14] ⨉		"..string.format("%02d",skCirurgia).."	[§K1][§B]Religião[§B][§K14]		"..string.format("%02d",skReligiao);
		
	end;
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
	-- EQUIPAMENTO
	local items = "";
	local animais = "";
		
	if(riquezaPJ == "Pobre") then
		items = "[§K1]	[§B]Cota de Malha				[§K14][§B]01		10 RD		180 d.\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]05		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]Charger					[§K14][§B]01		6d6 dmg.	£ 20\n[§K1]	[§B]Sumpter					[§K14][§B]01		3d6 dmg.	80 d.";
		
	elseif(riquezaPJ == "Comum") then
		items = "[§K1]	[§B]Cota de Malha Reforçada			[§K14][§B]01		12 RD		£ 5\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]05		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]Charger					[§K14][§B]01		6d6 dmg.	£ 20\n[§K1]	[§B]Rouncy					[§K14][§B]02		4d6 dmg.	200 d.\n[§K1]	[§B]Sumpter					[§K14][§B]01		3d6 dmg.	80 d.";
		
	elseif(riquezaPJ == "Rico") then
		items = "[§K1]	[§B]Cota de Placa Parcial				[§K14][§B]01		14 RD		£ 8\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]05		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]Charger Andaluz				[§K14][§B]01		7d6 dmg.	£ 20\n[§K1]	[§B]War Pony					[§K14][§B]01		5d6 dmg.	£ 8\n[§K1]	[§B]Rouncy					[§K14][§B]03		4d6 dmg.	200 d.\n[§K1]	[§B]Sumpter					[§K14][§B]02		3d6 dmg.	80 d.";
		
	elseif(riquezaPJ == "Superlativo") then
		items = "[§K1]	[§B]Cota de Placa Parcial				[§K14][§B]01		14 RD		£ 8\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Cota de Couro Fervido[§K14][§B] (Escudeiro)		01		08 RD		120 d.\n[§K1]	[§B]Escudo[§K14][§B] (Escudeiro)				01		06 RD		03 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]05		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]Destrier					[§K14][§B]01		8d6 dmg.	£ 32\n[§K1]	[§B]War Pony					[§K14][§B]01		5d6 dmg.	£ 8\n[§K1]	[§B]Rouncy					[§K14][§B]04		4d6 dmg.	200 d.\n[§K1]	[§B]Sumpter					[§K14][§B]02		3d6 dmg.	80 d.";
		
	elseif(riquezaPJ == "Espetacular") then
		items = "[§K1]	[§B]Cota de Placa Parcial				[§K14][§B]01		14 RD		£ 8\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Cota de Couro Fervido[§K14][§B] (Escudeiro)		01		08 RD		120 d.\n[§K1]	[§B]Escudo[§K14][§B] (Escudeiro)				01		06 RD		03 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]05		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]Destrier [§K14][§B](Treinado para Ataques)		01		8d6 dmg., +5 Arma £ 32\n[§K14]	     [§B]Caparison[§B]					01		—		24 d.\n[§K1]	[§B]War Pony					[§K14][§B]01		5d6 dmg.	£ 8\n[§K1]	[§B]Rouncy					[§K14][§B]05		4d6 dmg.	200 d.\n[§K1]	[§B]Sumpter					[§K14][§B]03		3d6 dmg.	80 d."; 
		
	end;
		
	if(qualClasse == "Esquire") then
		items = "[§K1]	[§B]Cota de Couro Fervido			[§K14][§B]01		08 RD		120 d.\n[§K1]	[§B]Escudo					[§K14][§B]01		06 RD		05 d.\n[§K1]	[§B]Espada					[§K14][§B]01		—		75 d.\n[§K1]	[§B]Lança						[§K14][§B]01		—		01 d.\n[§K1]	[§B]Adaga						[§K14][§B]01		—		05 d.";
		animais = "[§K1]	[§B]War Pony					[§K14][§B]01		5d6 dmg.	£ 8"; 
	
	end;

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
	-- HERANÇA
	local heranca = "";
	local indiceHer = rolarG("1d20", "Rolando sua Herança");
		
	if(culturaesc == "Bretão") then
		if(indiceHer==1) then heranca = "[§B]£30[§B] em moedas romanas";
		elseif(indiceHer==2) then heranca = "[§B]£" .. rolarG("3d6+15", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas romanas";
		elseif(indiceHer==3) then heranca = "[§B]£" .. rolarG("8d6", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas romanas";
		elseif(indiceHer==4) then heranca = "[§B]Gansa da Prosperidade:[§B] Não é exatamente gloriosa, mas bota tantos ovos que o feudo onde ela vive ganha £1 cada ano. Role 1d20 todo Inverno; num 1-3, ela morre; num 4-6 ela choca outra";
		elseif(indiceHer==5) then heranca = "[§B]Cinto Pesado:[§B] Sucesso automático em rolagens para se manter de pé";
		elseif(indiceHer==6) then heranca = "[§B]Gata Treinada:[§B] A melhor caçadora de ratos do condado. £1 renda anual ao feudo onde vive. Role 1d20 todo Inverno. Num 1-3, a gata morre; num 4-6 ela tem um filhote que vai crescer como sua mãe";
		elseif(indiceHer==7) then heranca = "[§B]Anel Sussurrante:[§B] Ao colocar esse anel, você sente seus ouvidos se abrirem para sons que não ouvia antes. +3 Atenção";
		elseif(indiceHer==8) then heranca = "[§B]Sela Real:[§B] A qualidade dessa sela é impressionante. Deve ter sido roubada de algum rei anos atrás. +4 em rolagens para permanecer no cavalo";
		elseif(indiceHer==9) then heranca = "[§B]Lança Abençoada:[§B] +2 Lanças quando usando essa arma, até que quebre; se as partes forem recuperadas, ela pode ser consertada sob o custo de £1";
		elseif(indiceHer==10) then heranca = "[§B]Espada de Bronze Antiga:[§B] +2 Espadas quando usada. Bronze é mais frágil que aço, então ela pode quebrar em combate como se não fosse uma espada. Pode ser consertada por £2";
		elseif(indiceHer==11) then 
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Escudo Maravilhoso:[§B] Preces em latim estão escritas por dentro desse escudo. Se sua Espiritualidade é 16 ou mais, você precisa sofrer 4 dano além do normal para receber um Ferimento Sério";
			else heranca = "[§B]Escudo Maravilhoso:[§B] Runas redondas estão escritas por dentro desse escudo. Se seu Cinismo é 16 ou mais, você precisa sofrer 4 dano além do normal para receber um Ferimento Sério"; end;
		elseif(indiceHer==12) then heranca = "[§B]Ferraduras Mágicas:[§B] +5 Movimento de seu cavalo. Uma falha em Equitação perde uma ferradura, e a mágica também. Encontrar a ferradura requer uma rolagem de Atenção no lugar onde foi perdida";
		elseif(indiceHer==13) then heranca = "[§B]Música de Marcha das Fadas:[§B] Veio a você em um sonho. Você não sabe ao certo o que as palavras significam, mas uma rolagem de Canto bem sucedida dá a todos amigos que a ouvirem +3 para Energia e Coragem";
		elseif(indiceHer==14) then heranca = "[§B]Túnica Bordada com Lágrimas:[§B] Coberta de bordados estranhamente transparentes e sempre um pouco úmidos. Se atingido com um Ferimento Sério, role Amor(Família). Sucesso reduzirá o dano de um Ferimento Sério para 1 ponto abaixo do necessário para um Ferimento Sério; num sucesso crítico, só metade do dano é recebido. Depois disso, role 1d20, onde 1 a 15 indica que a túnica foi arruinada";
		elseif(indiceHer==15) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Dedo de São Albans:[§B] +3 a Religião";
			else heranca = "[§B]Pêlos da Crina de Epona:[§B] +3 a Equitação"; end;
		elseif(indiceHer==16) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Dente de São Germanus:[§B] Role Amor(Deus). Sucesso faz qualquer pagão germânico presente rolar Coragem e fugir em uma falha; O usuário pode distribuir um total de 20 pontos entre seus oponentes que serão subtraídos da sua Coragem";
			else heranca = "[§B]Mecha do Cabelo de Gwydion:[§B] Dá um sucesso crítico a Temperança. Depois disso, role 1d20, onde 1 a 5 indica que foi arruinado. Pode ser usado 1 vez ao dia"; end;
		elseif(indiceHer==17) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Sangue de José da Arimatéia:[§B] Com um sucesso em Religião, o usuário pode fazer a porta de uma cela de prisão se abrir, ainda que ele não tenha a relíquia em sua presença";
			else heranca = "[§B]Mecha do Cabelo de Arianrhod:[§B] Dá um sucesso crítico automático para Luxúria. Depois disso, role 1d20, onde 1 a 5 indica que está arruinado. Pode ser usado 1 vez ao dia"; end;
		elseif(indiceHer==18) then heranca = "[§B]Cavalo de guerra forte, Charger:[§B]  7d6 dano";
		elseif(indiceHer==19) then heranca = "[§B]Cavalo de Guerra e Ambler[§B]";
		elseif(indiceHer==20) then heranca = "[§B]Destrier[§B]"; end;
		
	elseif(culturaesc == "Aquitâneo") then
		if(indiceHer==1) then heranca = "[§B]£20[§B] moedas romanas velhas";
		elseif(indiceHer==2) then heranca = "[§B]£" .. rolarG("3d6+10", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas com o perfil de Rei Alaric";
		elseif(indiceHer==3) then heranca = "[§B]£" .. rolarG("6d6", "Rolando seu Dinheiro de Herança") .. "[§B] em pedaços de ouro derretido que podem ou não ter vindo de Roma";
		elseif(indiceHer==4) then heranca = "[§B]Capacete Enfeitado com Prata:[§B] Decorado com enfeites no formato de cabeças de cavalo. +2 APP. Vale £10";
		elseif(indiceHer==5) then heranca = "[§B]Harpa Perfeitamente Afinada:[§B] Compacta, para quando você precisa de música aqui e agora. +3 para Tocar (Harpa)";
		elseif(indiceHer==6) then heranca = "[§B]Escudo de Lucius Varenus:[§B] Um grande escudo oval como os usados pelas últimas legiões, gravado com o Chi Rho por fora e “Lucius Varenus” por dentro. 10 pontos de proteção, -2 Montaria";
		elseif(indiceHer==7) then heranca = "[§B]Sela Berber:[§B] Sela feita pelo povo berber, que vive no deserto do outro lado do mediterrâneo. Extremamente confortável e feita para viagens longas. +4 para rolagens de se manter no cavalo";
		elseif(indiceHer==8) then heranca = "[§B]Capa Bordada com Púrpura:[§B] Funciona contra o frio da Aquitânia. Não funciona contra o frio da Bretanha, mas a cor e a qualidade são impressionantes. +2 APP, Vale £2, nunca deteriora";
		elseif(indiceHer==9) then heranca = "[§B]Cão Alaunt:[§B] Raça de cães de caça criada pelos vândalos. +3 Caça, sempre volta para casa mesmo que se perca. Role 1d20 a cada inverno. 01-03 o cachorro morre, 04-06 ele tem um filhote";
		elseif(indiceHer==10) then heranca = "[§B]Cão Molossus:[§B] Uma raça muito antiga, e forte. Criada pelos antigos gregos como um cão de guerra. Role 1d20 a cada inverno. 01-03 o cachorro morre, 04-06 ele tem um filhote.\n[§K14]	TAM 12, DES 20, FOR 13, CON 12; Move 7; Armadura 2; Inconsciente 6; Ferimento Sério 12; Knockdown 12; 24 HP; 3d6. Habilidades de Combate: Morder 15 (–1d6 vs. armaduras de metal)";
		elseif(indiceHer==11) then heranca = "[§B]Troilus e Criseide:[§B] Uma história secundária da Ilíada, expandida pelos aquitâneos em um romance triste. Precisa de um teste de Leitura para ser ativado. +3 Compor, +3 Oratória";
		elseif(indiceHer==12) then heranca = "[§B]Bíblia de Ulfilas:[§B] Uma tradução da bíblia para o Gótico feita por Wulfilas, um missionário ariano. Precisa de um teste de Leitura para ser ativado. +3 Religião, +3 Espiritualidade";
		elseif(indiceHer==13) then heranca = "[§B]Elmo Terrível:[§B] Um elmo de metal escuro decorado com uma crina de cabelo humano e com um dente encaixado entre os olhos, saqueado do corpo de um general huno. Quando ativado, a proteção dos ouvidos faz o usuário ouvir gritos na distância. Inimigos precisam fazer um teste de Coragem com -5, e fogem se falharem. Só funciona em inimigos humanos";
		elseif(indiceHer==14) then heranca = "[§B]Anel do Coração Puro:[§B] Um anel de prata delicado, no formato de uma guirlanda e claramente feminino. Com um sucesso em Honestidade, ele causa -5 para Desconfiança ou Vingança em outro personagem";
		elseif(indiceHer==15) then heranca = "[§B]Anel Enferrujado:[§B] Dizem ter sido encontrado entre as cinzas de um mausouléu romano. Tem a figura de um rosto, difícil de realmente entender por causa da ferrugem o cobrindo. Ele parece estar gritando de raiva. +2 Armadura, +5 Egoísmo";
		elseif(indiceHer==16) then heranca = "[§B]Perfume Raro:[§B] Um líquido levemente rosado com um cheiro estranho, mas muito bom e cheio de memórias nostálgicas. Mantido em uma garrafa redonda sem rótulo e passado desde os dias de sua avó... +3 Romance pelo resto do dia depois de usar";
		elseif(indiceHer==17) then heranca = "[§B]Cavalo de Guerra e Ambler Camargo[§B]";
		elseif(indiceHer==18) then heranca = "[§B]Cavalo de Guerra Andaluz[§B]";
		elseif(indiceHer==19) then heranca = "[§B]Cavalo de Guerra Andaluz[§B]";
		elseif(indiceHer==20) then heranca = "[§B]Destrier[§B]"; end;
		
	elseif(culturaesc == "Saxão") then
		if(indiceHer==1) then heranca = "[§B]£15[§B] em pedras preciosas";
		elseif(indiceHer==2) then heranca = "[§B]£" .. rolarG("3d6+5", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas romanas";
		elseif(indiceHer==3) then heranca = "[§B]£" .. rolarG("5d6", "Rolando seu Dinheiro de Herança") .. "[§B] em anéis de ouro";
		elseif(indiceHer==4) then heranca = "[§B]Capa de Penas de Corvo:[§B] Sempre fria. +1d6 dano, +2 HP. Requer uma rolagem de CON quando removida para não receber uma rolagem de Envelhecimento. Se vestida enquanto dormindo, ela se desintegra";
		elseif(indiceHer==5) then heranca = "[§B]Botas de pele de Veado:[§B] Fazem um som vagamente parecido com cascos ao correr. Precisam de um turno para ser ativadas. +4 Movimento";
		elseif(indiceHer==6) then heranca = "[§B]Cajado Mágico do Sono:[§B] Alguém atingido pelo cajado precisa rolar Energia ou cair no sono. Use Espada ou Machados quando batendo. Só um golpe por alvo é permitido";
		elseif(indiceHer==7) then heranca = "[§B]Galhada Mágica:[§B] Retirada de um veado branco há décadas. +3 Caça quando carregada";
		elseif(indiceHer==8) then heranca = "[§B]Cobertor que Grita:[§B] Acorda seu dono em caso de perigo. +5 Energia se for perigo iminente";
		elseif(indiceHer==9) then heranca = "[§B]Poção do Retorno Forçado:[§B] Traz alguém que devia morrer de volta à vida, com visões terríveis do mundo dos mortos. Recupera HP completamente, mas causa três rolagens de Envelhecimento";
		elseif(indiceHer==10) then heranca = "[§B]Cinto da Vitalidade:[§B] Os detalhes de fios de ouro parecem brilhar levemente no couro avermelhado. +3 Energia, +2 APP";
		elseif(indiceHer==11) then heranca = "[§B]Capacete Antigo:[§B] Aplicações de ouro parecem sugerir que foi feito para alguém rico, talvez séculos atrás. +1 armadura, +3 Atenção";
		elseif(indiceHer==12) then heranca = "[§B]Machado dos Anões:[§B] O metal do machado é quase preto, adornado por um grande círculo de runas. Precisa de uma rolagem de Amor(Família). 8 pontos de proteção";
		elseif(indiceHer==13) then heranca = "[§B]Grande Espada ou Grande Machado de Bifrost[§B] (escolha do jogador)[§B]:[§B] O metal dessa arma brilha levemente com as cores do arco-íris quando a luz o atinge do jeito certo. +1 Dano. Uma rolagem de Imprudência nega o -5 de lutar a pé contra oponentes montados. Essa rolagem só pode ser tentada uma vez por oponente";
		elseif(indiceHer==14) then heranca = "[§B]Marca da Lança:[§B] Uma mancha amadiçoada em sua pele. +2 a qualquer rolagem de combate, +4 Arbitrário, +4 Cruel";
		elseif(indiceHer==15) then heranca = "[§B]Marca do Martelo:[§B] Uma mancha abençoada em sua pele. +2 Energia, +2 de dano";
		elseif(indiceHer==16) then heranca = "[§B]Trompa de Chifre de Unicórnio:[§B] +5 Tocar (Trompa)";
		elseif(indiceHer==17) then heranca = "[§B]Cão de Guerra:[§B] Late constantemente e aterroriza cavalos, causando o inimigo a ter -5 Habilidade de Arma e Equitação. Role 1d20 todo Inverno; de 1 a 3 o cachorro morreu; de 4 a 5 ele teve um filhote";
		elseif(indiceHer==18) then heranca = "[§B]Unguento Inferior de Phol:[§B] Um remédio estranho, criado nas terras dos suecos no norte. Cura 1d3 + 3. Role 1d20. De 1 a 4, acaba";
		elseif(indiceHer==19) then heranca = "[§B]Unguento Superior de Phol:[§B] Um remédio bastante raro, criado nas terras dos suecos no norte. Cura 2d6+ 3. Role 1d20, De 1 a 10, acaba";
		elseif(indiceHer==20) then heranca = "[§B]Botas Excelentes:[§B] Os sapatos mais confortáveis que você já vestiu, e provavelmente os mais bonitos. +5 DES"; end;
	
	elseif(culturaesc == "Irlandês") then
		if(indiceHer==1) then heranca = "[§B]£20[§B] em pepitas de prata";
		elseif(indiceHer==2) then heranca = "[§B]£" .. rolarG("3d6+10", "Rolando seu Dinheiro de Herança") .. "[§B] em pepitas de ouro";
		elseif(indiceHer==3) then heranca = "[§B]£" .. rolarG("6d6", "Rolando seu Dinheiro de Herança") .. "[§B] em pedras preciosas";
		elseif(indiceHer==4) then heranca = "[§B]Escudo Reforçado:[§B] Filigranas de metal graciosas cobrem esse escudo redondo. 7 pontos de proteção";
		elseif(indiceHer==5) then heranca = "[§B]Harpa Real:[§B] Muito bem afinada. O artesanato é bonito o bastante para um rei. +1 Música, vale £2";
		elseif(indiceHer==6) then heranca = "[§B]Harpa de Finn:[§B] +2 de Música, +2 Cinismo, vale £8";
		elseif(indiceHer==7) then heranca = "[§B]Harpa dos Dagda:[§B] Roubada das fadas. +4 de Música, +4 Orgulho, vale £20";
		elseif(indiceHer==8) then heranca = "[§B]Cálice Mágico:[§B] Transforma uma bebida em “vinho maravilhoso” quando usado. +2 de Oratória após beber, até o próximo nascer ou pôr do sol. Pode ser usado uma vez por dia";
		elseif(indiceHer==9) then heranca = "[§B]Tocha de St. Brigit:[§B] Acende sob comando do dono, e só pode se apagar por ele ou pela sua morte";
		elseif(indiceHer==10) then heranca = "[§B]Pente de Aengus:[§B] Estranhamente... feminino. +2d6 APP pelo resto do dia quando usado para pentear o cabelo de um homem, até a meia noite. Só pode ser usado uma vez por dia";
		elseif(indiceHer==11) then heranca = "[§B]Corrente de Ogma:[§B] Uma corrente de ouro com pequenos pingentes em forma de cabeças humanas. +2 Oratória, +2 Tocar (Harpa) +4 Vingança";
		elseif(indiceHer==12) then heranca = "[§B]Capa de Pele Luxuosa:[§B] Feita com pele de lobo. Vale £2, nunca deteriora, +2 APP";
		elseif(indiceHer==13) then heranca = "[§B]Sela Fantástica:[§B] Feita para os cavalos pequenos usados em roubo de gado, mas funciona para cavaleiros também. +1 Equitação +1 a uma habilidade de arma enquanto montado";
		elseif(indiceHer==14) then heranca = "[§B]Espada de Família:[§B] Passada por gerações, ainda corta. Você sente olhos te julgando quando a saca. Uma rolagem bem sucedida de Amor(Família) dá +3 Espadas, mas em uma falha crítica a espada acerta o usuário";
		elseif(indiceHer==15) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Três cabelos de São Patrício, uma relíquia:[§B] Uma relíquia que odeia trabalhar. Só pode ser usado por um irlandês cristão, com uma rolagem bem sucedida de Espiritualidade e Honra. +2 para qualquer Habilidade. Só pode ser usada uma vez por dia, e se as duas rolagens errarem, Um dos cabelos é perdido";
			else heranca = "[§B]Bandagem de Dian Cecht:[§B] Só pode ser usado por irlandeses pagãos, requer uma rolagem de Honra. +5 a Primeiros Socorros"; end;
		elseif(indiceHer==16) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Sobrancelha de São Finnian:[§B] Requer uma rolagem de Honestidade. +5 Atenção até o próximo nascer ou pôr do sol";
			else heranca = "[§B]Dez Penas de Aengus:[§B] +1 APP cada quando usada no chapéu ou elmo de um irlandês pagão. Se usada o usuário precisa rolar Castidade. Em uma falha, uma delas é soprada para longe"; end;
		elseif(indiceHer==17) then
			if(religiaoesc=="Cristão Bretão") then heranca = "[§B]Unha de São Columba:[§B] Requer uma rolagem de Espiritualidade. +5 de Castidade";
			else heranca = "[§B]Carvão de Lugh:[§B] Sempre brilha levemente. Com uma rolagem de Justiça, ele explode em luz forte o bastante para ver até através de roupas, e continuará brilhando até o próximo pôr do sol"; end;
		elseif(indiceHer==18) then heranca = "[§B]Cavalo de Guerra e um Courser irlandês[§B]";
		elseif(indiceHer==19) then heranca = "[§B]Barb e um Ambler Camargo[§B]";
		elseif(indiceHer==20) then heranca = "[§B]Destrier[§B]"; end;

	elseif(culturaesc == "Romano") then
		if(indiceHer==1) then heranca = "[§B]£20[§B] em moedas romanas antigas";
		elseif(indiceHer==2) then heranca = "[§B]£" .. rolarG("3d6+10", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas romanas antigas";
		elseif(indiceHer==3) then heranca = "[§B]£" .. rolarG("6d6", "Rolando seu Dinheiro de Herança") .. "[§B] em moedas romanas antigas";
		elseif(indiceHer==4) then heranca = "[§B]Escudo de Horatio:[§B] Sempre dá proteção completa, independente da situação, mas o usuário recebe -5 DES";
		elseif(indiceHer==5) then heranca = "[§B]Livro de Asclepius:[§B] Requer uma rolagem bem sucedida em Leitura. +3 para Cirurgia";
		elseif(indiceHer==6) then heranca = "[§B]Institutos de Gaius:[§B] Requer uma rolagem bem sucedida de Ler. +3 Direito";
		elseif(indiceHer==7) then heranca = "[§B]Bracelete da Castidade:[§B] +3 Castidade, +2 APP; vale £2";
		elseif(indiceHer==8) then heranca = "[§B]Penacho para Capacete:[§B] +1 Armadura para qualquer elmo";
		elseif(indiceHer==9) then heranca = "[§B]Gládio de Titus Pullo:[§B] O balanço dessa arma é estranho mas ela com certeza machuca. Qual seria seu poder se tivesse sido terminada? -2 Espadas, 1d6+3 dano";
		elseif(indiceHer==10) then heranca = "[§B]Escudo Antigo:[§B] Um escudo retangular de legionário, dos velhos tempos. 8 pontos de proteção, -3 DES, -3 Equitação";
		elseif(indiceHer==11) then heranca = "[§B]Fórmula de Scribonius Largus:[§B] Feito à base de belladonas romanas e distribuído para soldados em outros tempos. Recupera 5 HP. Role 1d20 depois do uso. De 1 a 3, o remédio acabou";
		elseif(indiceHer==12) then heranca = "[§B]Fórmula de Caelius Aurelianus:[§B] Feito com sangue de cabra. Deus sabe como. Recupera 2d6 HP. Role 1d20 depois do uso. De 1 a 4, o remédio acabou";
		elseif(indiceHer==13) then heranca = "[§B]Fórmula de Galeno:[§B] Trouxe fama e fortuna a seu criador, há mais de duzentos anos. Automaticamente aplica Cirurgia ao paciente e o estabiliza. Role 1d20 depois do uso. De 1 a 5 o remédio acabou";
		elseif(indiceHer==14) then heranca = "[§B]A Fórmula Genial de Sextus Empiricus:[§B] Esse líquido milagroso recupera 3d6+10 HP. Role 1d20 depois do uso. De 1 a 10 o remédio acabou";
		elseif(indiceHer==15) then heranca = "[§B]Túnica Púrpura:[§B] Púrpura é cara, e usada para tingir togas. Por que foi usada para tingir isso? +1 armadura, uma rolagem de Coragem cancela o requerimento de Cirurgia de um Ferimento sério, mas o dano permanece";
		elseif(indiceHer==16) then heranca = "[§B]Osso de Rei Lucius:[§B] Uma rolagem bem sucedida de Lealdade(Suserano) dá +1 a qualquer traço. Pode ser usado só uma vez ao dia";
		elseif(indiceHer==17) then heranca = "[§B]Três Fios da Capa de São Jorge:[§B] +2 a Lealdade (Suserano), +2 Religiosidade, 1 ponto de armadura para cada fio. Após uma luta em que foram usados como armadura, role 1d20. De 1 a 5 um dos fios foi rompido";
		elseif(indiceHer==18) then heranca = "[§B]Cavalo de Guerra completamente negro, Charger:[§B]  7d6 dano";
		elseif(indiceHer==19) then heranca = "[§B]Cavalo de Guerra e Ambler Camargo[§B]";
		elseif(indiceHer==20) then heranca = "[§B]Destrier[§B]"; end;
		
	elseif(culturaesc == "Picto") then
		if(indiceHer==1) then heranca = "[§B]Saque antigo:[§B] Pratos e talheres romanos no valor de £15.";
		elseif(indiceHer==2) then heranca = "[§B]Saque antigo:[§B] Joias e broches derretidos no valor de £" .. rolarG("3d6+5", "Rolando seu Dinheiro de Herança");
		elseif(indiceHer==3) then heranca = "[§B]Saque antigo:[§B] Velhos castiçais de igreja no valor de £" .. rolarG("5d6", "Rolando seu Dinheiro de Herança");
		elseif(indiceHer==4) then heranca = "[§B]Tatuagem de Javali:[§B] Geométrica, feita em glasno azul-claro sobre seu peito. Os olhos do Javali são estranhmente vivos, e suas presas curvam sobre suas costelas. Um turno para ativar, e aí dá +2 Armadura";
		elseif(indiceHer==5) then heranca = "[§B]Tatuagem de Falcão:[§B] Geométrica, feita em glasno azul-claro sobre seu antebraço direito representando um falcão dando um ataque rasante. Um turno para ativar, e aí dá +3 Arremesso";
		elseif(indiceHer==6) then heranca = "[§B]Tatuagem de Cervo:[§B] Geométrica, feita em glasno azul-claro sobre suas pernas. A galhada do veado forma um padrão especialmente bonito. Precisa de um turno para ativar e aí dá +3 DES";
		elseif(indiceHer==7) then heranca = "[§B]Tatuagem de Águia:[§B] Uma tatuagem geométrica de uma asa de águia em cada lado do seu rosto, feita em glasno azul-claro. Um turno para ativar, e aí dá +3 Atenção";
		elseif(indiceHer==8) then heranca = "[§B]Tatuagem de Salmão:[§B] Geométrica, feita em glasno azul-claro sobre suas costas na forma de três salmões se torcendo em uma forma redonda. Um turno para ativar, e aí remove as penalidades de nadar com armadura e +5 Movimento na água";
		elseif(indiceHer==9) then heranca = "[§B]Tatuagem de Lince:[§B] Geométrica, feita em glasno azul-claro sobre um de seus ombros. O lince está sentado de frente, segurando duas taças em suas patas. Um turno para ativar, e aí +3 Entretenimento";
		elseif(indiceHer==10) then heranca = "[§B]Tatuagem de Cabra:[§B] Dois chifres geométricos tatuados nos lados de sua barriga em glasno azul-claro. Um turno para ativar, e aí reduz 5 pontos da Castidade do alvo";
		elseif(indiceHer==11) then heranca = "[§B]Bracelete Antigo da Serpente de Ouro:[§B] Uma serpente dourada enrolada ao redor do seu pulso, com olhos de vidro vermelho estranhamente humanos. Sucesso em Cinismo dá +2 Armadura, +2 Crueldade. Vale £5";
		elseif(indiceHer==12) then heranca = "[§B]Manto de Pele de Lontra:[§B] Várias peles de Lontra costuradas juntas, formando uma capa com um brilho oleoso. Não se deteriora, +3 APP";
		elseif(indiceHer==13) then heranca = "[§B]Machado de Pedra Lascada:[§B] O fio de pedra polida tem uma aparência mais bruta e cruel do que qualquer arma de metal. Causa +2 de dano, mas quebra depois que o usuário causa 20 pontos de dano; depois, o amuleto de “Pedra da Sorte” concede +1 de Armadura";
		elseif(indiceHer==14) then heranca = "[§B]Lágrima da Deusa do Sol:[§B] Uma coroa de flores amarelas que nunca secam, enfeitada com jóias pequenas que lembram gotas de orvalho. Lágrima Dourada da Deusa do Sol: +5 APP";
		elseif(indiceHer==15) then heranca = "[§B]Pônei de Guerra Treinado:[§B] Pode ser montado apenas pelo proprietário +5 Equitação para o proprietário";
		elseif(indiceHer==16) then heranca = "[§B]Highland Pony, Rouncy:[§B] Consegue atravessar Pântanos facilmente";
		elseif(indiceHer==17) then heranca = "[§B]Lança de Obsidiana:[§B] A ponta é feita de um vidro preto, extremamente afiado e resistente, que cresce do chão perto de vulcões. Dá para ver através dela se a colocar contra o sol - é cheia de runas escritas pelo lado de dentro do vidro. Dá +3 contra qualquer armadura (menos escudos), a lança causa um dano adicional de +3";
		elseif(indiceHer==18) then heranca = "[§B]Dardo da Sorte:[§B] Farpado, resistente, com um apito no final do cabo que faz um barulho característico quando você o atira. Concede +5 Arremesso a qualquer picto que o arremessar";
		elseif(indiceHer==19) then heranca = "[§B]Poção Primitiva:[§B] Feita com plantas venenosas que só crescem em cavernas no norte da Escócia. Concede + 2d6 de Cura. URole 1d20 depois do uso. De 1 a 07 a poção acabou";
		elseif(indiceHer==20) then heranca = "[§B]Corrente de Ferro Mágica:[§B] Uma corrente que pode ser enrolada ao redor de sua armadura, os elos são gravados com padrões curvos que fazem com que pareça que ela tenha crescido ao invés de ser forjada. Quando vestida, +3 Armadura, -3 DES"; end; 
	end;
	
	-- FEEDBACK DA HERANÇA
	enviar(espacamento .. "⚜️ [§K2]"..meuJogador.login .."[§B][§K14] obteve como Herança:[§B] [§K1]" .. heranca .. "[§K1].\n‎");
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
	-- ATRIBUTOS
	local indiceATR, textoATR = choose("𝕮𝖔𝖒𝖔 𝖖𝖚𝖊𝖗 𝖉𝖎𝖘𝖙𝖗𝖎𝖇𝖚𝖎𝖗 𝖘𝖊𝖚𝖘 𝕬𝖙𝖗𝖎𝖇𝖚𝖙𝖔𝖘?", {"𝐑𝐀𝐍𝐃𝐎𝐌", "𝐂𝐔𝐒𝐓𝐎𝐌", "𝐂𝐀𝐕𝐀𝐋𝐄𝐈𝐑𝐎 𝐂𝐎𝐌𝐔𝐌\nAtributos distribuídos igualmente.", "𝐂𝐎𝐑𝐓𝐄𝐒𝐀𝐎\nFoco Total em Intriga e Cortesia.", "𝐌𝐄𝐒𝐓𝐑𝐄 𝐃𝐄 𝐂𝐀𝐂̧𝐀\nFoco em Caça e Combate Letal.", "𝐆𝐔𝐄𝐑𝐑𝐄𝐈𝐑𝐎\nFoco Total em Luta e Combate Letal."}, 1);
	if(indiceATR==3) then 
		TAM = 13; DES = 12; FOR = 12; CON = 14; APP = 12; 
		
	elseif(indiceATR==4) then 
		TAM = 14; DES = 11; FOR = 11; CON = 11; APP = 16; 
		
	elseif(indiceATR==5) then 
		TAM = 14; DES = 13; FOR = 12; CON = 14; APP = 10; 
	
	elseif(indiceATR==6) then 
		TAM = 15; DES = 11; FOR = 14; CON = 18; APP = 8; 
	
	elseif(indiceATR==1) then
		TAM = rolarG("3d6+4", "Rolando seu Tamanho");
		DES = rolarG("3d6+1", "Rolando sua Destreza");
		FOR = rolarG("3d6+1", "Rolando sua Força");
		CON = rolarG("3d6+1", "Rolando sua Constituição");
		APP = rolarG("3d6+1", "Rolando sua Aparência");
		
	end;
	
	-- CALCULANDO ATRIBUTOS DERIVADOS
	dano = math.floor(((TAM+FOR)/6)+0.5);
	movimento = math.floor(((DES+FOR)/10)+0.5); 
	regen = math.floor(((CON+FOR)/10)+0.5); 
	hp = CON+TAM;
	inconsciente = math.floor((hp/4)+0.5);
	
	-- DEIXANDO DE CONTABILIZAR CARACTERÍSTICAS DISTINTIVAS CASO APARÊNCIA NÃO ESTEJA PREENCHIDA
	local APPflag = false;
	if(APP == 0) then 
		APPflag = true; 
		
	end;
	
	-- APLICANDO BÔNUS DE CULTURA
	if(culturaesc=="Aquitâneo") then 
		DES = DES + 1; CON = CON + 1; APP = APP + 1;
	
	elseif(culturaesc=="Bretão" or culturaesc=="Irlandês") then 
		CON = CON + 3;
	
	elseif(culturaesc=="Picto") then 
		TAM = TAM - 3; DES = DES + 3; APP = APP - 3;
		
	elseif(culturaesc=="Romano") then 
		DES = DES + 1; APP = APP + 2;
		
	elseif(culturaesc=="Saxão") then 
		TAM = TAM + 2; DES = DES - 2; FOR = FOR + 3; 
		
	end;
	
	-- DETERMINANDO NÚMERO DE CARACTERÍSTICAS DISTINTIVAS
	if(APP<7) then 
		DF = 3; 
		
	elseif(APP>6 and APP<10) then 
		DF = 2; 
		
	elseif(APP>9 and APP<13) then 
		DF = 1; 
		
	elseif(APP>12 and APP<17) then 
		DF = 2; 
		
	elseif(APP>16) then 
		DF = 3; 
	
	end;
	
	-- ZERANDO CARACTERÍSTICAS DISTINTIVAS CASO APARÊNCIA TENHA COMEÇADO VAZIA
	if(APPflag == true) then 
		DF = 0; 
		
	end;
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	
	
	--TRAÇOS
	local indiceTracos, textoTracos = choose("𝕮𝖔𝖒𝖔 𝖉𝖊𝖘𝖊𝖏𝖆 𝖈𝖆𝖑𝖈𝖚𝖑𝖆𝖗 𝖘𝖊𝖚𝖘 𝕿𝖗𝖆𝖈̧𝖔𝖘?", {"𝐑𝐀𝐍𝐃𝐎𝐌", "Pré-definidos pelo Sistema"}, 1);
	if(indiceTracos == 2) then
		--DETERMINANDO TRAÇOS PELA CULTURA E RELIGIÃO
		if(culturaesc == "Bretão" and religiaoesc == "Cristão Bretão") then
			Castidade = 13; 
			Energia = 13; 
			Perdao = 10; 
			Generosidade = 13; 
			Honestidade = 10; 
			Justica = 10; 
			Misericordia = 10; 
			Modestia = 13; 
			Espiritualidade = 10; 
			Prudencia = 10; 
			Temperanca = 13; 
			Confianca = 10; 
			Coragem = 15;
			
		elseif(culturaesc == "Bretão" and religiaoesc == "Pagão Bretão") then
			Castidade = 7; 
			Energia = 13; 
			Perdao = 10; 
			Generosidade = 13; 
			Honestidade = 13; 
			Justica = 10; 
			Misericordia = 10; 
			Modestia = 7; 
			Espiritualidade = 10; 
			Prudencia = 10; 
			Temperanca = 10; 
			Confianca = 10; 
			Coragem = 15;
			
		elseif(culturaesc == "Aquitâneo" and religiaoesc == "Cristão Ariano") then
			Castidade = 13; 
			Energia = 13; 
			Perdao = 12; 
			Generosidade = 10; 
			Honestidade = 13; 
			Justica = 13; 
			Misericordia = 13; 
			Modestia = 10; 
			Espiritualidade = 10; 
			Prudencia = 12; 
			Temperanca = 10; 
			Confianca = 10; 
			Coragem = 15;
			
		elseif(culturaesc == "Saxão" and religiaoesc == "Cristão Bretão") then
			Castidade = 10; 
			Energia = 11; 
			Perdao = 10; 
			Generosidade = 13; 
			Honestidade = 12; 
			Justica = 8; 
			Misericordia = 9; 
			Modestia = 7; 
			Espiritualidade = 7; 
			Prudencia = 7; 
			Temperanca = 7; 
			Confianca = 10; 
			Coragem = 16;
			
		elseif(culturaesc == "Saxão" and religiaoesc == "Pagão Germânico") then
			Castidade = 10; 
			Energia = 11; 
			Perdao = 10; 
			Generosidade = 13; 
			Honestidade = 12; 
			Justica = 8; 
			Misericordia = 9; 
			Modestia = 7; 
			Espiritualidade = 7; 
			Prudencia = 7; 
			Temperanca = 7; 
			Confianca = 10; 
			Coragem = 16;
			
		elseif(culturaesc == "Picto" and religiaoesc == "Cristão Bretão") then
			Castidade = 13; 
			Energia = 13; 
			Perdao = 10; 
			Generosidade = 13; 
			Honestidade = 10; 
			Justica = 10; 
			Misericordia = 9; 
			Modestia = 13; 
			Espiritualidade = 12; 
			Prudencia = 10; 
			Temperanca = 13; 
			Confianca = 8; 
			Coragem = 15;
			
		elseif(culturaesc == "Picto" and religiaoesc == "Pagão Picto") then
			Castidade = 10; 
			Energia = 10; 
			Perdao = 7; 
			Generosidade = 10; 
			Honestidade = 13; 
			Justica = 7; 
			Misericordia = 9; 
			Modestia = 7; 
			Espiritualidade = 9; 
			Prudencia = 10; 
			Temperanca = 10; 
			Confianca = 8; 
			Coragem = 15;
			
		elseif(culturaesc == "Irlandês" and religiaoesc == "Cristão Bretão") then
			Castidade = 13; 
			Energia = 13; 
			Perdao = 8; 
			Generosidade = 13; 
			Honestidade = 10; 
			Justica = 10; 
			Misericordia = 10; 
			Modestia = 13; 
			Espiritualidade = 10; 
			Prudencia = 9; 
			Temperanca = 11; 
			Confianca = 10; 
			Coragem = 15;
			
		elseif(culturaesc == "Irlandês" and religiaoesc == "Pagão Bretão") then
			Castidade = 7; 
			Energia = 13; 
			Perdao = 8; 
			Generosidade = 13; 
			Honestidade = 13; 
			Justica = 10; 
			Misericordia = 10; 
			Modestia = 7; 
			Espiritualidade = 10; 
			Prudencia = 9; 
			Temperanca = 8; 
			Confianca = 10; 
			Coragem = 15;
			
		elseif(culturaesc == "Romano" and religiaoesc == "Cristão Romano") then
			Castidade = 13; 
			Energia = 10; 
			Perdao = 13; 
			Generosidade = 10; 
			Honestidade = 8; 
			Justica = 10; 
			Misericordia = 13; 
			Modestia = 11; 
			Espiritualidade = 8; 
			Prudencia = 10; 
			Temperanca = 13; 
			Confianca = 7; 
			Coragem = 15;
			
		end;
	
	-- ROLANDO TRAÇOS ALEATORIAMENTE
	elseif(indiceTracos == 1) then
		Castidade = rolarG("3d6", "Rolando sua Castidade");
		Energia = rolarG("3d6", "Rolando sua Energia");
		Perdao = rolarG("3d6", "Rolando seu Perdão");
		Generosidade = rolarG("3d6", "Rolando sua Generosidade");
		Honestidade = rolarG("3d6", "Rolando sua Honestidade");
		Justica = rolarG("3d6", "Rolando sua Justiça");
		Misericordia = rolarG("3d6", "Rolando sua Misericórdia");
		Modestia = rolarG("3d6", "Rolando sua Modéstia");
		Espiritualidade = rolarG("3d6", "Rolando sua Espiritualidade");
		Prudencia = rolarG("3d6", "Rolando sua Prudência");
		Temperanca = rolarG("3d6", "Rolando sua Temperança");
		Confianca = rolarG("3d6", "Rolando sua Confiança");
		Coragem = rolarG("3d6", "Rolando sua Coragem");
		
	end;
	
	-- BÔNUS REGIONAIS
	if(string.match(cidadeesc[1], "Aquitaine")) then
		Perdao = Perdao - 2; 
		Modestia = Modestia - 2; 
		Confianca = Confianca + 2; 
		
	elseif(string.match(cidadeesc[1], "Brittany")) then
		Energia = Energia + 1; 
		Modestia = Modestia + 2; 
		Prudencia = Prudencia + 2; 
		Coragem = Coragem + 1;
		
	elseif(string.match(cidadeesc[1], "Cambria")) then
		Justica = Justica - 2; 
		Confianca = Confianca - 2; 
		Prudencia = Prudencia + 1; 
		Temperanca = Temperanca + 1;
		
	elseif(string.match(cidadeesc[1], "Cumbria")) then
		Espiritualidade = Espiritualidade + 2; 
		Honestidade = Honestidade + 1;
		
	elseif(string.match(cidadeesc[1], "Cornwall")) then
		Justica = Justica - 2; 
		Confianca = Confianca - 2; 
		Prudencia = Prudencia + 2;
		
	elseif(string.match(cidadeesc[1], "Ireland")) then
		Castidade = Castidade - 1; 
		Energia = Energia + 1; 
		Honestidade = Honestidade + 2; 
		Temperanca = Temperanca - 2;
		
	elseif(string.match(cidadeesc[1], "Logres")) then
		Energia = Energia + 1; 
		Perdao = Perdao + 1; 
		Honestidade = Honestidade + 1; 
		Justica = Justica + 1; 
		Confianca = Confianca + 1; 
		Coragem = Coragem + 1;
		
	end;
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━		
	
	-- PAIXÕES
	local paixoes = {};
	local indicePaixoes, textoPaixoes = choose("𝕮𝖔𝖒𝖔 𝖉𝖊𝖘𝖊𝖏𝖆 𝖈𝖆𝖑𝖈𝖚𝖑𝖆𝖗 𝖘𝖚𝖆𝖘 𝕻𝖆𝖎𝖝𝖔̃𝖊𝖘?", {"𝐑𝐀𝐍𝐃𝐎𝐌", "Pré-definidas pelo Sistema"}, 1);
	if(indicePaixoes == 2) then
		-- DETERMINANDO PAIXÕES ATRAVÉS DAS CULTURAS
		if(culturaesc == "Bretão") then
			paixoes = {
			{"Lealdade (Suserano)", 15},
			{"Amor (Família)", 15},
			{"Hospitalidade", 15},
			{"Honra", 15},			
			};
			
		elseif(culturaesc == "Irlandês") then
			local irSuserano = rolarG("1d6", "Rolando Lealdade adicional ao seu Suserano");
			local irFamilia = rolarG("1d6", "Rolando Amor adicional à sua Família");
			paixoes = {
			{"Lealdade (Suserano)", 10 + irSuserano},
			{"Amor (Família)", 15 + irFamilia},
			{"Hospitalidade", 15},
			{"Honra", 13},			
			};
			
		elseif(culturaesc == "Picto") then
			paixoes = {
			{"Lealdade (Líder do Clã)", 18},
			{"Amor (Família)", 16},
			{"Hospitalidade", 16},
			{"Honra", 10},			
			};
			
		elseif(culturaesc == "Romano") then
			local romCidade = rolarG("1d6", "Rolando Lealdade adicional à sua Cidade");
			paixoes = {
			{"Lealdade (Cidade)", 10 + romCidade},
			{"Amor (Família)", 15},
			{"Hospitalidade", 15},
			{"Honra", 15},			
			};
			
		elseif(culturaesc == "Saxão") then
			local saxSuserano = rolarG("1d6", "Rolando Lealdade adicional ao seu Suserano");
			paixoes = {
			{"Lealdade (Suserano)", 15 + saxSuserano},
			{"Amor (Família)", 15},
			{"Hospitalidade", 15},
			{"Honra", 12},			
			};
			
		elseif(culturaesc == "Aquitâneo") then
			paixoes = {
			{"Lealdade (Suserano)", 13},
			{"Amor (Família)", 15},
			{"Hospitalidade", 15},
			{"Honra", 17},			
			};
			
		end;
	
	elseif(indicePaixoes==1) then
		-- DETERMINANDO PAIXÕES ALEATORIAMENTE
		if(culturaesc == "Bretão" or culturaesc == "Irlandês" or culturaesc == "Saxão" or culturaesc == "Aquitâneo") then
			local ranSuserano = rolarG("3d6+4", "Rolando sua Lealdade ao seu Suserano");
			local ranFamilia = rolarG("3d6+4", "Rolando seu Amor por sua Família");
			local ranHospitalidade = rolarG("3d6+4", "Rolando sua Hospitalidade");
			local ranHonra = rolarG("3d6+4", "Rolando sua Honra");
			paixoes = {
			{"Lealdade (Suserano)", ranSuserano},
			{"Amor (Família)", ranFamilia},
			{"Hospitalidade", ranHospitalidade},
			{"Honra", ranHonra},			
			};
			
		elseif(culturaesc == "Picto") then
			local ranSuserano = rolarG("3d6+4", "Rolando sua Lealdade ao seu Líder de Clã");
			local ranFamilia = rolarG("3d6+4", "Rolando seu Amor por sua Família");
			local ranHospitalidade = rolarG("3d6+4", "Rolando sua Hospitalidade");
			local ranHonra = rolarG("3d6+4", "Rolando sua Honra");
			paixoes = {
			{"Lealdade (Líder do Clã)", ranSuserano},
			{"Amor (Família)", ranFamilia},
			{"Hospitalidade", ranHospitalidade},
			{"Honra", ranHonra},		
			};		
			
		elseif(culturaesc == "Romano") then
			local ranSuserano = rolarG("3d6+4", "Rolando sua Lealdade à sua Cidade");
			local ranFamilia = rolarG("3d6+4", "Rolando seu Amor por sua Família");
			local ranHospitalidade = rolarG("3d6+4", "Rolando sua Hospitalidade");
			local ranHonra = rolarG("3d6+4", "Rolando sua Honra");
			paixoes = {
			{"Lealdade (Cidade)", ranSuserano},
			{"Amor (Família)", ranFamilia},
			{"Hospitalidade", ranHospitalidade},
			{"Honra", ranHonra},		
			};
			
		end;
	end;
		
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━		
		
	-- CALCULANDO BÔNUS HONRADO E RELIGIOSO
	somaHonra = Energia + Generosidade + Justica + Misericordia + Modestia + Coragem;
	
	if(religiaoesc == "Cristão Bretão") then
		somaReli = Castidade + Energia + Generosidade + Modestia + Temperanca;
		flagCast = " 🕇"; 
		flagEner = "🕇"; 
		flagGene = "🕇"; 
		flagMode = "🕇"; 
		flagTemp  = " 🕇";
		
	elseif(religiaoesc == "Pagão Bretão") then
		somaReli = (20 - Castidade) + Energia + Generosidade + Honestidade + (20 - Modestia);
		flagLuxu = "⚝"; 
		flagEner = "⚝"; 
		flagGene = "⚝"; 
		flagHone = " ⚝"; 
		flagOrgu = "⚝";
		
	elseif(religiaoesc == "Cristão Ariano") then
		somaReli = Castidade + Honestidade + Justica + Misericordia + Temperanca;
		flagCast = " 🕇"; 
		flagHone = " 🕇"; 
		flagJust = "🕇"; 
		flagMise = "🕇"; 
		flagTemp = " 🕇";
		
	elseif(religiaoesc == "Pagão Germânico") then
		somaReli = Generosidade + (20 - Modestia) + (20 - Espiritualidade) + (20 - Prudencia) + (20 - Temperanca);
		flagGene = "⚝"; 
		flagOrgu = "⚝"; 
		flagCini = "⚝"; 
		flagImpr = "⚝"; 
		flagIndu = "⚝";
		
	elseif(religiaoesc == "Pagão Picto") then
		somaReli = (20 - Perdao) + Honestidade + (20 - Justica) + (20 - Modestia) + (20 - Espiritualidade);
		flagVing = "⚝"; 
		flagHone = " ⚝"; 
		flagArbi = "⚝"; 
		flagOrgu = "⚝"; 
		flagCini = "⚝";
		
	elseif(religiaoesc == "Cristão Romano") then
		somaReli = Castidade + Perdao + Misericordia + Modestia + Temperanca;
		flagCast = " 🕇"; 
		flagPerd = " 🕇"; 
		flagMise = "🕇"; 
		flagMode = "🕇"; 
		flagTemp = " 🕇";
		
	end;
	
	-- CALCULANDO BÔNUS ROMÂNTICO
	if(Castidade > 15) then 
	somaRoman = somaRoman + 1;
	
	elseif(Energia > 15) then 
	somaRoman = somaRoman + 1;
	
	elseif(Perdao > 15) then 
	somaRoman = somaRoman + 1;
	
	elseif(Generosidade > 15) then 
	somaRoman = somaRoman + 1;
	
	elseif(Honestidade > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Justica > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Misericordia > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Modestia > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Espiritualidade > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Prudencia > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Temperanca > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Confianca > 15) then 
		somaRoman = somaRoman + 1;
	
	elseif(Coragem > 15) then 
		somaRoman = somaRoman + 1; 
	
	end;
		
	for i = 1, 4 do
		if(paixoes[i][2] > 15) then 
			somaRoman = somaRoman + 1; 
			
		end;
	end;
		
	if(somaRoman>3) then 
		somaRoman = 3; 
	
	end;
	
	if(Castidade < 5 or Energia < 5 or Perdao < 5 or Generosidade < 5 or Honestidade < 5 or Justica < 5 or Misericordia < 5 or Modestia < 5 or Espiritualidade < 5 or Prudencia < 5 or Temperanca < 5 or Confianca < 5 or Coragem<5) then 
		somaRoman = somaRoman + 1; 
		
	end;

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
		
	-- NOME DO PERSONAGEM
	local nomeDisp = {"𝐑𝐀𝐍𝐃𝐎𝐌", "𝐂𝐔𝐒𝐓𝐎𝐌"};
	local nomeDispflag = 2;
	for i = 1, 12 do 
		if string.match(nomes[i][1], culturaesc) and string.match(nomes[i][2], sexoPJ) then
			for j = 1, #nomes[i][3] do
				nomeDispflag = nomeDispflag + 1;
				nomeDisp[nomeDispflag] = nomes[i][3][j];
				
			end;
		end;
	end;
	
	local indiceNome, textoNome = choose("𝕼𝖚𝖆𝖑 𝖘𝖊𝖗𝖆 𝖔 𝖓𝖔𝖒𝖊 𝖉𝖊 𝖘𝖊𝖚 𝕮𝖆𝖛𝖆𝖑𝖊𝖎𝖗𝖔?", nomeDisp, 1);
	if(indiceNome>2) then 
		nomePJ = textoNome;
		
	elseif(indiceNome == 2) then
		nomePJ = inputQuery("Nome do Cavaleiro");
		
	elseif(indiceNome == 1) then
		indiceNome = (rolarG("1d" .. nomeDispflag - 2, "Rolando Nome do Cavaleiro"))+2;
		nomePJ = nomeDisp[indiceNome];
		
	end;

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	
-- TRATAMENTO PARA IMPRESSÃO
local cidadeCortada,trash = cidadeesc[1]:match("(.+)%[(.+)")
local PictFlag = "";
local RicoFlag = "";
	if(culturaesc == "Picto") then 
		PictFlag = "	"; 
	end;
	if(riquezaPJ == "Rico") then 
		RicoFlag = "	"; 
	end;
	
	if(flagTemp == "") then 
		flagTemp = "	"; 
	end;
	
	if(flagHone == "") then 
		flagHone = "	"; 
	end;
	
	if(flagPerd == "") then 
		flagPerd = "	"; 
	end;
local textTracPaix1 = "[§K14]	[§B]TRAÇOS[§B]\n[§K1]	[§B]Castidade[§B][§K14]"..flagCast.."		"..string.format("%02d",Castidade).." / "..string.format("%02d",20-Castidade).."		[§K1][§B]Luxúria[§B][§K14] "..flagLuxu.."\n[§K1]	[§B]Energia[§B][§K14] ♞"..flagEner.."		"..string.format("%02d",Energia).." / "..string.format("%02d",20-Energia).."		[§K1][§B]Preguiça[§B][§K14] "..flagPreg.."\n[§K1]	[§B]Perdão[§B][§K14]"..flagPerd.."		"..string.format("%02d",Perdao).." / "..string.format("%02d",20-Perdao).." 	[§K1][§B]Vingança[§B][§K14] "..flagVing.."\n[§K1]	[§B]Generosidade[§B][§K14] ♞"..flagGene.."	"..string.format("%02d",Generosidade).." / "..string.format("%02d",20-Generosidade).."		[§K1][§B]Egoísmo[§B][§K14] "..flagEgoi.."\n[§K1]	[§B]Honestidade[§B][§K14]"..flagHone.." 	"..string.format("%02d",Honestidade).." / "..string.format("%02d",20-Honestidade).."		[§K1][§B]Malícia[§B][§K14] "..flagMali.."\n[§K1]	[§B]Justiça[§B][§K14] ♞"..flagJust.."		"..string.format("%02d",Justica).." / "..string.format("%02d",20-Justica).."		[§K1][§B]Arbitrariedade[§B][§K14] "..flagArbi.."\n[§K1]	[§B]Misericórdia[§B][§K14] ♞"..flagMise.."	"..string.format("%02d",Misericordia).." / "..string.format("%02d",20-Misericordia).."		[§K1][§B]Crueldade[§B][§K14] "..flagCrue.."\n";
local textTracPaix2 = "[§K1]	[§B]Modéstia[§B][§K14] ♞"..flagMode.."		"..string.format("%02d",Modestia).." / "..string.format("%02d",20-Modestia).."		[§K1][§B]Orgulho[§B][§K14] "..flagOrgu.."\n[§K1]	[§B]Espiritualidade[§B][§K14]"..flagEspi.."	"..string.format("%02d",Espiritualidade).." / "..string.format("%02d",20-Espiritualidade).."		[§K1][§B]Cinismo[§B][§K14] "..flagCini.."\n[§K1]	[§B]Prudência[§B][§K14]"..flagPrud.."		"..string.format("%02d",Prudencia).." / "..string.format("%02d",20-Prudencia).."		[§K1][§B]Imprudência[§B][§K14] "..flagImpr.."\n[§K1]	[§B]Temperança[§B][§K14]"..flagTemp.."	"..string.format("%02d",Temperanca).." / "..string.format("%02d",20-Temperanca).."		[§K1][§B]Indulgência[§B][§K14] "..flagIndu.."		[§K14][§B]Bônus Honrado[§B]: [§K14]"..string.format("%02d",somaHonra).."/80\n[§K1]	[§B]Confiança[§B][§K14]"..flagConf.." 		"..string.format("%02d",Confianca).." / "..string.format("%02d",20-Confianca).."		[§K1][§B]Desconfiança[§B][§K14] "..flagDesc.."		[§K14][§B]Bônus Religioso[§B]: [§K14]"..string.format("%02d",somaReli).."/80\n[§K1]	[§B]Coragem[§B][§K14] ♞"..flagCora.."		"..string.format("%02d",Coragem).." / "..string.format("%02d",20-Coragem).."		[§K1][§B]Covardia[§B][§K14] "..flagCova.."		[§K14][§B]Bônus Romântico[§B]: [§K14]"..string.format("%02d",somaRoman).."/04\n‎\n[§K14]	[§B]PAIXÕES[§B]";
local textPaixoes = "";	

	for i = 1, 4 do
		textPaixoes = textPaixoes .. "\n[§K1]	[§B]"..paixoes[i][1] ..":[§B] [§K14]".. string.format("%02d",paixoes[i][2]);
		
	end;
	
local textFamilia = "";
	if((numIrmaosMN+numIrmaosMV)>0) then
	textFamilia ="[§K1]	[§B]Irmãos[§B]";
		for i = 1, numIrmaosMN+numIrmaosMV do
			textFamilia = textFamilia .."\n[§K14]	"..irmaosPJ[i][1] ..", ".. irmaosPJ[i][2];
		end;
	elseif((numIrmaosMN+numIrmaosMV)==0) then
		textFamilia = textFamilia .."\n[§K14]	Sem irmãos.";
	end;
	
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
			
-- IMPRESSÃO FICHA
enviar("****");
enviar("⠀\n[§K14]	┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━༻❁༺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n⠀");
enviar("# [§K14]	🙞 [§K1]Sir "..nomePJ.." [§K14]🙜\n[§K14]	[§B]ᴊᴏɢᴀᴅᴏʀ﹕[§B] " .. meuJogador.login.."\n‎");
enviar("## [§K14]	𝕯𝖆𝖉𝖔𝖘\n[§K1]	[§B]Idade:[§B] [§K14]"..idadePJ.." anos		[§B][§K1]Filho nº:[§B] [§K14]0"..qualFilho.."			[§B][§K1]Terra Natal:[§B] [§K14]".. cidadeCortada.."\n[§K1]	[§B]Riqueza:[§B] [§K14]"..riquezaPJ .. RicoFlag .."		[§B][§K1]Cultura:[§B] [§K14]"..culturaesc.. PictFlag .."		[§B][§K1]Religião:[§B] [§K14]"..religiaoesc.."\n[§K1]	[§K1][§B]Classe Atual:[§B] [§K14]"..qualClasse.."\n[§K1]	[§B]Classe do Pai:[§B] [§K14]"..cargoPai.."\n[§K1]	[§B]Característica:[§B] [§K14]"..tracoFamilia.."\n[§K1]	[§B]Glória:[§B] [§K14]" .. string.format("%03d",gloria).."\n‎\n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
enviar("## [§K14]	𝕬𝖙𝖗𝖎𝖇𝖚𝖙𝖔𝖘");
enviar("## [§K14]	Tᴀᴍᴀɴʜᴏ	[§K1]"..string.format("%02d",TAM).."	[§K14]Dᴇsᴛʀᴇᴢᴀ		[§K1]"..string.format("%02d",DES).."	[§K14]Fᴏʀᴄ̧ᴀ		[§K1]"..string.format("%02d",FOR).."\n‎");
enviar("## [§K14]	Cᴏɴsᴛɪᴛᴜɪᴄ̧ᴀ̃ᴏ	[§K1]"..string.format("%02d",CON).."	[§K14]Aᴘᴀʀᴇ̂ɴᴄɪᴀ	[§K1]"..string.format("%02d",APP).."\n‎\n[§K1]	[§B]Dano[§B]: [§K14]"..dano.."d6			[§K1][§B]Regeneração[§B]: [§K14]"..string.format("%02d",regen).."\n[§K1]	[§B]Movimento[§B]: [§K14]"..string.format("%02d",movimento).."		[§K1][§B]HP[§B]: [§K14]"..string.format("%02d",hp).."/"..string.format("%02d",hp).."			[§K1][§B]Inconsciente[§B]: [§K14]"..string.format("%02d",inconsciente).."\n‎\n[§K1]	[§B]Características Distintivas[§B]: [§K14]"..DF.." características distintivas\n[§K1]	[§B]Ferimentos[§B]: [§K14]—\n‎\n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
enviar("## [§K14]	𝕳𝖆𝖇𝖎𝖑𝖎𝖉𝖆𝖉𝖊𝖘\n"..habilidadeArmaF .. "\n‎\n‎\n"..habilidadeNormF.."\n‎\n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
enviar("## [§K14]	𝕿𝖗𝖆𝖈̧𝖔𝖘 𝖊 𝕻𝖆𝖎𝖝𝖔̃𝖊𝖘\n"..textTracPaix1 .. textTracPaix2 .. textPaixoes.. "\n‎\n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
enviar("## [§K14]	𝕰𝖖𝖚𝖎𝖕𝖆𝖒𝖊𝖓𝖙𝖔\n[§K14]	[§B]ITEM						QNT.		STATUS	CUSTO[§B]\n" .. items .. "\n‎\n[§K14]	[§B]ANIMAL					QNT.		STATUS	CUSTO[§B]\n"..animais.."\n‎\n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
enviar("## [§K14]	𝕱𝖆𝖒𝖎𝖑𝖎𝖆\n"..textFamilia.."\n‎\n[§K14]	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━༻❁༺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛‎\n⠀");