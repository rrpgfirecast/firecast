require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("ndb.lua");
require("internet.lua");
require("locale.lua");   

dealerDB = NDB.load("dealer.xml");

if (dealerDB.rooms == nil) then
	dealerDB.rooms = {};
end;

-- FUNCTIONS
local function initializeRoom(mesa)
	if dealerDB.rooms[mesa.codigoInterno] == nil then
		dealerDB.rooms[mesa.codigoInterno] = {};
		dealerDB.rooms[mesa.codigoInterno].players = {};
		dealerDB.rooms[mesa.codigoInterno].numCards = 0;
		dealerDB.rooms[mesa.codigoInterno].hands = {};
		dealerDB.rooms[mesa.codigoInterno].deck = {};
		dealerDB.rooms[mesa.codigoInterno].deckURL = {};
		dealerDB.rooms[mesa.codigoInterno].discard = {};
		dealerDB.rooms[mesa.codigoInterno].numDiscard = 0;
		dealerDB.rooms[mesa.codigoInterno].log = "";
	end;
end

local function tryTranslate(text)
	local trans = Locale.tryLang(text);
	if trans == nil then trans = text end;
	return trans;
end

local function checkCommand(arg, text)
	return arg==text or arg == tryTranslate(text);
end

local function send(chat,text)
	chat:enviarMensagemNPC("Dealer", tryTranslate(text));
end

local function logText(dealer, text, user)
	dealer.log = (dealer.log or "") .. "\n" .. tryTranslate(text) .. " <" .. (user or "user") .. ">"
end

local function write(chat,text)
	chat:escrever(tryTranslate(text));
end

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

local function showDeck(deck, num, chat, urls)
	local text = "Cards: ";
	for i=1,num,1 do
		text = text .. (deck[i] or "UnamedCard") .. " ";
	end
	text = text .. "\n";
	for i=1,num,1 do
		if urls[deck[i]] ~= nil then
			text = text .. "[§I " .. (urls[deck[i]] or "UnamedCard") .. "] ";
		end;
	end
	send(chat, text);
	return text;
end

local function findId(deck, num, card)
	local id = 0;
	for i=1,num,1 do
		if deck[i] == card then
			id = i;
		end;
	end
	return id;
end

local function sendIdToEnd(deck, num, id)
	local aux = deck[id];
	deck[id] = deck[num];
	deck[num] = aux;
end

local function shuffle(tbl, num)
  for i = num, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

local function getConfigWindow(mesa)
	initializeRoom(mesa);

	local cfgForm = GUI.newForm("dealerPopup");
	cfgForm:setNodeObject(dealerDB.rooms[mesa.codigoInterno]);
	cfgForm.title = "Dealer - " .. mesa.nome;
	popup = cfgForm;
	
	return cfgForm;
end

-- LISTENER
Firecast.Messaging.listen("ChatMessage",
	function (message)
		if message.mesa == nil then return end;
		initializeRoom(message.mesa);

		local txt =  Utils.removerFmtChat(message.texto, true);
		local arg = {};
		local numArgs = 0;
		for substring in txt:gmatch("%S+") do
   			table.insert(arg, substring)
   			numArgs = numArgs+1;
		end

		local dealer = dealerDB.rooms[message.mesa.codigoInterno];

		if arg[1]=="dealer" and dealer.botEnabled then
			local isMestre = message.jogador.isMestre;
			local isJogador = message.jogador.isJogador;
			local login = message.jogador.login;
			local activeChat = message.chat;
			if dealer.deckURL == nil then dealer.deckURL = {} end;

			if checkCommand(arg[2], "help") then
				send(activeChat,"All Dealer Commands");
				send(activeChat,"All comands will begin with dealer.");
				send(activeChat,"Players, send all your commands in private chat to your GM.");
				send(activeChat,"> /dealer - Shows config window.");
				send(activeChat,"> /dealerOn - Turns the dealer bot on (in this room only).");
				send(activeChat,"> /dealerOff - Turns the dealer bot off (in this room only).");
				send(activeChat,"> dealer help - shows commands");
				send(activeChat,"> dealer showAll - show all hands, deck and discard [GM only]");
				send(activeChat,"> dealer start tarot <cards> - initiates the deck with tarot cards plus card list separated by space");
				send(activeChat,"> dealer start french <cards> - initiates the deck with the standard 52 plus card list separated by space");
				send(activeChat,"> dealer start uno <cards> - initiates the deck with 108 uno cards plus card list separated by space");
				send(activeChat,"> dealer start custom <cards> - initiates the deck with card list separated by space");
				send(activeChat,"> dealer draw - add 1 random card to your hand");
				send(activeChat,"> dealer draw <number> - add number random cards to your hand");
				send(activeChat,"> dealer hand - show your hand on active chat");
				send(activeChat,"> dealer discard <card> - discard the card you named");
				send(activeChat,"> dealer return <card> - put the card you named back to the deck and shuffles it");
				send(activeChat,"> dealer give <card> <login> - gives a card you named to the player");
				send(activeChat,"> dealer deck - says number of cards remaning in deck and [GM only] lists them");
				send(activeChat,"> dealer discarded - says number of cards discarded and lists them");
				send(activeChat,"> dealer shuffle - shuffles deck [GM only]");
				send(activeChat,"> dealer restart - puts all cards back into the deck [GM only]");
				send(activeChat,"> dealer setPic <card> <url> - sets an image for a card [GM only]");
				send(activeChat,"> dealer export - saves a deck to xml [GM only]");
				send(activeChat,"> dealer import - loads a deck from xml [GM only]");
			elseif checkCommand(arg[2], "shuffle") then
				if isMestre then
					dealer.deck = shuffle(dealer.deck, dealer.numCards);
					local txt = "<Dealer>: Deck has been shuffled."
					send(activeChat,txt);
					logText(dealer, txt, login);
				else
					send(activeChat,"<Dealer>: Only GM can use this command.");
				end
			elseif checkCommand(arg[2], "export") then
				if isMestre then
					local xml = NDB.exportXML(dealer);

					local export = {};
					local bytes = Utils.binaryEncode(export, "utf8", xml);

					local stream = Utils.newMemoryStream();
					local bytes = stream:write(export);

					Dialogs.saveFile("Salvar Deck como XML", stream, "deck.xml", "application/xml",
					function()
						stream:close();
						showMessage("Deck Exportado.");
					end);
				else
					send(activeChat,"<Dealer>: Only GM can use this command.");
				end
			elseif checkCommand(arg[2], "import") then
				if isMestre then
					Dialogs.openFile("Importar Ficha", "application/xml", false, 
					function(arquivos)
						local arq = arquivos[1];

						local import = {};
						local bytes = arq.stream:read(import, arq.stream.size);

						local xml = Utils.binaryDecode(import, "utf8");

						NDB.importXML(dealer, xml);

						showMessage("Deck Importado.");
					end);
				else
					send(activeChat,"<Dealer>: Only GM can use this command.");
				end
			elseif checkCommand(arg[2], "setPic") then
				if isMestre then
					local card = arg[3];
					local url = "";
					for i=4,numArgs do
						url = url .. " " .. arg[i];
					end
					dealer.deckURL[card] = url;

					local txt = "<Dealer>: " .. card .. " picture has been updated to [§I " .. url .. "].";
					send(activeChat,txt);
					logText(dealer, txt, login);
				else
					send(activeChat,"<Dealer>: Only GM can use this command.");
				end
			elseif checkCommand(arg[2], "restart") then
				if isMestre then
					dealer.numCards = dealer.numCardsSave;
					for i=1,dealer.numCards do
						dealer.deck[i] = dealer.deckSave[i];
					end

					dealer.players = {};
					dealer.hands = {};
					dealer.discard = {};
					dealer.numDiscard = 0;
					dealer.log = ""

					local txt = "<Dealer>: Deck with " .. dealer.numCards .. " card(s) has been reset.";
					send(activeChat,txt);
					logText(dealer, txt, login);

					txt = showDeck(dealer.deck, dealer.numCards, activeChat, dealer.deckURL);
					dealer.deck = shuffle(dealer.deck, dealer.numCards);
					logText(dealer, txt, login);

					txt = "<Dealer>: Deck has been shuffled."
					send(activeChat,txt);
					logText(dealer, txt, login);
				else
					send(activeChat,"<Dealer>: Only GM can use this command.");
				end
			elseif checkCommand(arg[2], "start") then
				if not isMestre then
					send(activeChat,"<Dealer>: Only GM can use this command.");
					return;
				end

				dealer.deck = {};
				dealer.numCards = 0;
				dealer.deckSave = {};
				dealer.numCardsSave = 0;
				dealer.players = {};
				dealer.hands = {};
				dealer.discard = {};
				dealer.numDiscard = 0;
				dealer.log = ""

				local urls = {};
				if checkCommand(arg[3], "tarot") then
					dealer.deck = {"Magician", "High_Priestess", "Empress", "Emperor", "Hierophant", "Lovers", "Chariot", "Strength", "Hermit", "Wheel_of_Fortune", "Justice", "Hanged_Man", "Death", "Temperance", "Devil", "Tower", "Star", "Moon", "Sun", "Judgement", "World", "Fool"};
					dealer.numCards = 22;
					dealer.deckSave = {"Magician", "High_Priestess", "Empress", "Emperor", "Hierophant", "Lovers", "Chariot", "Strength", "Hermit", "Wheel_of_Fortune", "Justice", "Hanged_Man", "Death", "Temperance", "Devil", "Tower", "Star", "Moon", "Sun", "Judgement", "World", "Fool"};
					dealer.numCardsSave = 22;
				elseif checkCommand(arg[3], "french") then
					dealer.deck = {"Ace_of_Clubs", "Two_of_Clubs", "Three_of_Clubs", "Four_of_Clubs", "Five_of_Clubs", "Six_of_Clubs", "Seven_of_Clubs", "Eight_of_Clubs", "Nine_of_Clubs", "Ten_of_Clubs", "Jack_of_Clubs", "Queen_of_Clubs", "King_of_Clubs", "Ace_of_Diamonds", "Two_of_Diamonds", "Three_of_Diamonds", "Four_of_Diamonds", "Five_of_Diamonds", "Six_of_Diamonds", "Seven_of_Diamonds", "Eight_of_Diamonds", "Nine_of_Diamonds", "Ten_of_Diamonds", "Jack_of_Diamonds", "Queen_of_Diamonds", "King_of_Diamonds", "Ace_of_Hearts", "Two_of_Hearts", "Three_of_Hearts", "Four_of_Hearts", "Five_of_Hearts", "Six_of_Hearts", "Seven_of_Hearts", "Eight_of_Hearts", "Nine_of_Hearts", "Ten_of_Hearts", "Jack_of_Hearts", "Queen_of_Hearts", "King_of_Hearts", "Ace_of_Spades", "Two_of_Spades", "Three_of_Spades", "Four_of_Spades", "Five_of_Spades", "Six_of_Spades", "Seven_of_Spades", "Eight_of_Spades", "Nine_of_Spades", "Ten_of_Spades", "Jack_of_Spades", "Queen_of_Spades", "King_of_Spades"};
					dealer.numCards = 52;
					dealer.deckSave = {"Ace_of_Clubs", "Two_of_Clubs", "Three_of_Clubs", "Four_of_Clubs", "Five_of_Clubs", "Six_of_Clubs", "Seven_of_Clubs", "Eight_of_Clubs", "Nine_of_Clubs", "Ten_of_Clubs", "Jack_of_Clubs", "Queen_of_Clubs", "King_of_Clubs", "Ace_of_Diamonds", "Two_of_Diamonds", "Three_of_Diamonds", "Four_of_Diamonds", "Five_of_Diamonds", "Six_of_Diamonds", "Seven_of_Diamonds", "Eight_of_Diamonds", "Nine_of_Diamonds", "Ten_of_Diamonds", "Jack_of_Diamonds", "Queen_of_Diamonds", "King_of_Diamonds", "Ace_of_Hearts", "Two_of_Hearts", "Three_of_Hearts", "Four_of_Hearts", "Five_of_Hearts", "Six_of_Hearts", "Seven_of_Hearts", "Eight_of_Hearts", "Nine_of_Hearts", "Ten_of_Hearts", "Jack_of_Hearts", "Queen_of_Hearts", "King_of_Hearts", "Ace_of_Spades", "Two_of_Spades", "Three_of_Spades", "Four_of_Spades", "Five_of_Spades", "Six_of_Spades", "Seven_of_Spades", "Eight_of_Spades", "Nine_of_Spades", "Ten_of_Spades", "Jack_of_Spades", "Queen_of_Spades", "King_of_Spades"};
					dealer.numCardsSave = 52;
					urls = {"https://github.com/hayeah/playing-cards-assets/blob/master/png/ace_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/2_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/3_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/4_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/5_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/6_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/7_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/8_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/9_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/10_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/jack_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/queen_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/king_of_clubs.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/ace_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/2_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/3_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/4_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/5_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/6_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/7_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/8_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/9_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/10_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/jack_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/queen_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/king_of_diamonds.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/ace_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/2_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/3_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/4_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/5_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/6_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/7_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/8_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/9_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/10_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/jack_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/queen_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/king_of_hearts.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/ace_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/2_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/3_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/4_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/5_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/6_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/7_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/8_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/9_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/10_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/jack_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/queen_of_spades.png?raw=true", "https://github.com/hayeah/playing-cards-assets/blob/master/png/king_of_spades.png?raw=true"};
				elseif checkCommand(arg[3], "uno") then
					dealer.deck = {"Red_0", "Red_1", "Red_1", "Red_2", "Red_2", "Red_3", "Red_3", "Red_4", "Red_4", "Red_5", "Red_5", "Red_6", "Red_6", "Red_7", "Red_7", "Red_8", "Red_8", "Red_9", "Red_9", "Red_+2", "Red_+2", "Red_Reverse", "Red_Reverse", "Red_Skip", "Red_Skip", "Yellow_0", "Yellow_1", "Yellow_1", "Yellow_2", "Yellow_2", "Yellow_3", "Yellow_3", "Yellow_4", "Yellow_4", "Yellow_5", "Yellow_5", "Yellow_6", "Yellow_6", "Yellow_7", "Yellow_7", "Yellow_8", "Yellow_8", "Yellow_9", "Yellow_9", "Yellow_+2", "Yellow_+2", "Yellow_Reverse", "Yellow_Reverse", "Yellow_Skip", "Yellow_Skip", "Green_0", "Green_1", "Green_1", "Green_2", "Green_2", "Green_3", "Green_3", "Green_4", "Green_4", "Green_5", "Green_5", "Green_6", "Green_6", "Green_7", "Green_7", "Green_8", "Green_8", "Green_9", "Green_9", "Green_+2", "Green_+2", "Green_Reverse", "Green_Reverse", "Green_Skip", "Green_Skip", "Blue_0", "Blue_1", "Blue_1", "Blue_2", "Blue_2", "Blue_3", "Blue_3", "Blue_4", "Blue_4", "Blue_5", "Blue_5", "Blue_6", "Blue_6", "Blue_7", "Blue_7", "Blue_8", "Blue_8", "Blue_9", "Blue_9", "Blue_+2", "Blue_+2", "Blue_Reverse", "Blue_Reverse", "Blue_Skip", "Blue_Skip", "Wild", "Wild", "Wild", "Wild", "Wild+4", "Wild+4", "Wild+4", "Wild+4"};
					dealer.numCards = 108;
					dealer.deckSave = {"Red_0", "Red_1", "Red_1", "Red_2", "Red_2", "Red_3", "Red_3", "Red_4", "Red_4", "Red_5", "Red_5", "Red_6", "Red_6", "Red_7", "Red_7", "Red_8", "Red_8", "Red_9", "Red_9", "Red_+2", "Red_+2", "Red_Reverse", "Red_Reverse", "Red_Skip", "Red_Skip", "Yellow_0", "Yellow_1", "Yellow_1", "Yellow_2", "Yellow_2", "Yellow_3", "Yellow_3", "Yellow_4", "Yellow_4", "Yellow_5", "Yellow_5", "Yellow_6", "Yellow_6", "Yellow_7", "Yellow_7", "Yellow_8", "Yellow_8", "Yellow_9", "Yellow_9", "Yellow_+2", "Yellow_+2", "Yellow_Reverse", "Yellow_Reverse", "Yellow_Skip", "Yellow_Skip", "Green_0", "Green_1", "Green_1", "Green_2", "Green_2", "Green_3", "Green_3", "Green_4", "Green_4", "Green_5", "Green_5", "Green_6", "Green_6", "Green_7", "Green_7", "Green_8", "Green_8", "Green_9", "Green_9", "Green_+2", "Green_+2", "Green_Reverse", "Green_Reverse", "Green_Skip", "Green_Skip", "Blue_0", "Blue_1", "Blue_1", "Blue_2", "Blue_2", "Blue_3", "Blue_3", "Blue_4", "Blue_4", "Blue_5", "Blue_5", "Blue_6", "Blue_6", "Blue_7", "Blue_7", "Blue_8", "Blue_8", "Blue_9", "Blue_9", "Blue_+2", "Blue_+2", "Blue_Reverse", "Blue_Reverse", "Blue_Skip", "Blue_Skip", "Wild", "Wild", "Wild", "Wild", "Wild+4", "Wild+4", "Wild+4", "Wild+4"};
					dealer.numCardsSave = 108;
				end

				-- load urls
				for i=1,dealer.numCards do
					dealer.deckURL[dealer.deck[i]] = urls[i];
				end

				for i=4,numArgs,1 do
					dealer.numCards = dealer.numCards + 1;
					dealer.deck[dealer.numCards] = arg[i];
					dealer.numCardsSave = dealer.numCardsSave + 1;
					dealer.deckSave[dealer.numCardsSave] = arg[i];
				end

				local txt = "<Dealer>: New deck created with " .. dealer.numCards .. " card(s).";
				send(activeChat,txt);
				logText(dealer, txt, login);

				txt = showDeck(dealer.deck, dealer.numCards, activeChat, dealer.deckURL);
				dealer.deck = shuffle(dealer.deck, dealer.numCards);
				logText(dealer, txt, login);

				txt = "<Dealer>: Deck has been shuffled."
				send(activeChat,txt);
				logText(dealer, txt, login);
			elseif checkCommand(arg[2], "deck") then
				local txt = "<Dealer>: The deck has " .. dealer.numCards .. " card(s)."
				send(activeChat,txt);
				logText(dealer, txt, login);
				if isMestre then
					local txt = showDeck(dealer.deck, dealer.numCards, activeChat, dealer.deckURL);
					logText(dealer, txt, login);
				end
			elseif checkCommand(arg[2], "draw") then
				local qtd = tonumber(arg[3]) or 1;
				if qtd < 1 then qtd = 1 end;

				if qtd > dealer.numCards then
					local txt = "<Dealer>: Not enough cards in deck: " .. dealer.numCards
					send(activeChat, txt);
					logText(dealer, txt, login);
					return;
				end;

				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				for i=1,qtd,1 do
					dealer.hands[login] = dealer.hands[login] + 1;
					dealer.players[login][dealer.hands[login]] = dealer.deck[dealer.numCards];

					local txt = "<Dealer>: You drawn " .. dealer.deck[dealer.numCards]
					if dealer.deckURL[dealer.deck[dealer.numCards]] ~= nil then
						txt = txt .. "\n" .. "[§I " .. (dealer.deckURL[dealer.deck[dealer.numCards]] or "UnamedCard") .. "]";
					end;
					send(activeChat, txt);
					logText(dealer, txt, login);

					dealer.deck[dealer.numCards] = nil;
					dealer.numCards = dealer.numCards - 1;
				end

				local txt = "<Dealer>: " .. login .. " has drawn " .. qtd .. " card(s). He owns " .. dealer.hands[login] .. " card(s)";
				send(activeChat, txt);
				logText(dealer, txt, login);
			elseif checkCommand(arg[2], "hand") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				local txt = "<Dealer>: You have " .. dealer.hands[login] .. " card(s)"
				send(activeChat, txt);
				logText(dealer, txt, login);

				txt = showDeck(dealer.players[login], dealer.hands[login], activeChat, dealer.deckURL);
				logText(dealer, txt, login);
			elseif checkCommand(arg[2], "discard") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				local id = findId(dealer.players[login], dealer.hands[login], arg[3]);

				if id == 0 then
					local txt = "<Dealer>: You don't have the card."
					send(activeChat, txt);
					logText(dealer, txt, login);
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login], id);

					dealer.numDiscard = dealer.numDiscard + 1;
					dealer.discard[dealer.numDiscard] = arg[3];

					local txt = "<Dealer>: " .. login .. " discarded " .. arg[3]
					if dealer.deckURL[arg[3]] ~= nil then
						txt = txt .. "\n" .. "[§I " .. (dealer.deckURL[arg[3]] or "UnamedCard") .. "]";
					end;
					send(activeChat, txt);
					logText(dealer, txt, login);

					dealer.players[login][dealer.hands[login]] = nil;
					dealer.hands[login] = dealer.hands[login] - 1;
				end;
			elseif checkCommand(arg[2], "discarded") then
				local txt = "<Dealer>: The dicard pile has " .. dealer.numDiscard .. " card(s)."

				send(activeChat, txt);
				logText(dealer, txt, login);

				txt = showDeck(dealer.discard, dealer.numDiscard, activeChat, dealer.deckURL);
				logText(dealer, txt, login);
			elseif checkCommand(arg[2], "give") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;
				if arg[4]==nil then
					local txt = "<Dealer>: I need the target login."
					send(activeChat, txt);
					logText(dealer, txt, login);
					return;
				end;
				if dealer.players[arg[4]] == nil then
					dealer.players[arg[4]] = {};
					dealer.hands[arg[4]] = 0;
				end;

				local id = findId(dealer.players[login], dealer.hands[login], arg[3]);

				if id == 0 then
					local txt = "<Dealer>: You don't have the card."
					send(activeChat, txt);
					logText(dealer, txt, login);
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login], id);

					dealer.hands[arg[4]] = dealer.hands[arg[4]] + 1;
					dealer.players[arg[4]][dealer.hands[arg[4]]] = arg[3];

					local txt = "<Dealer>: " .. login .. " gave a card to " .. arg[4]
					send(activeChat, txt);
					logText(dealer, txt, login);

					dealer.players[login][dealer.hands[login]] = nil;
					dealer.hands[login] = dealer.hands[login] - 1;
				end;
			elseif checkCommand(arg[2], "return") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				local id = findId(dealer.players[login], dealer.hands[login], arg[3]);

				if id == 0 then
					local txt = "<Dealer>: You don't have the card."
					send(activeChat, txt);
					logText(dealer, txt, login);
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login], id);

					dealer.numCards = dealer.numCards + 1;
					dealer.deck[dealer.numCards] = arg[3];
					dealer.players[login][dealer.hands[login]] = nil;
					dealer.hands[login] = dealer.hands[login] - 1;

					dealer.deck = shuffle(dealer.deck, dealer.numCards);

					local txt = "<Dealer>: " .. login .. " returned to the deck " .. arg[3] .. ", and shuffled it."
					if dealer.deckURL[arg[3]] ~= nil then
						txt = txt .. "\n" .. "[§I " .. (dealer.deckURL[arg[3]] or "UnamedCard") .. "]";
					end;
					send(activeChat, txt);
					logText(dealer, txt, login);
				end;
			elseif checkCommand(arg[2], "showAll") then
				if not isMestre then
					send(activeChat,"<Dealer>: Only GM can use this command.");
					return;
				end

				local txt = "<Dealer>: The deck has " .. dealer.numCards .. " card(s)."
				send(activeChat, txt);
				logText(dealer, txt, login);

				txt = showDeck(dealer.deck, dealer.numCards, activeChat, dealer.deckURL);
				logText(dealer, txt, login);

				local txt = "<Dealer>: The dicard pile has " .. dealer.numDiscard .. " card(s)."
				send(activeChat, txt);
				logText(dealer, txt, login);

				txt = showDeck(dealer.discard, dealer.numDiscard, activeChat, dealer.deckURL);
				logText(dealer, txt, login);

				for k,v in pairs(dealer.players) do
					local txt = "<Dealer>: " .. k .." has " .. dealer.hands[k] .. " card(s)."
					send(activeChat,txt);
					logText(dealer, txt, login);

					txt = showDeck(dealer.players[k], dealer.hands[k], activeChat, dealer.deckURL)
					logText(dealer, txt, login);
				end;

			elseif dealer.botEnabled then
				send(activeChat, "<Dealer>: Unknown Command.");
			end;
		end;
	end);


Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		if message.mesa == nil then return end;
		initializeRoom(message.mesa);

		if message.comando == "dealer" then
			local cfgForm = getConfigWindow(message.mesa);

			if (cfgForm) then
				cfgForm:show();
			end;

			message.response = {handled = true};
		elseif message.comando == "dealerOn" then
			dealerDB.rooms[message.mesa.codigoInterno].botEnabled = true;

			message.response = {handled = true};
		elseif message.comando == "dealerOff" then
			dealerDB.rooms[message.mesa.codigoInterno].botEnabled = false;
			message.response = {handled = true};
		end;
	end);

Firecast.Messaging.listen("ListChatCommands",
    function(message)
        message.response = {{comando="dealer help", descricao="Exibe os comandos do dealer."},
        										{comando="/dealer", descricao="Abre o popup de configurações."},
        										{comando="/dealerOn", descricao="Ativa o dealer nessa mesa."},
        										{comando="/dealerOff", descricao="Desliga o dealer nessa mesa."}};
    end);