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
		dealerDB.rooms[mesa.codigoInterno].discard = {};
		dealerDB.rooms[mesa.codigoInterno].numDiscard = 0;
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
	chat:enviarMensagem(tryTranslate(text));
end

local function showDeck(deck, num, chat)
	local text = "Cards: ";
	for i=1,num,1 do
		text = text .. (deck[i] or "UnamedCard") .. " ";
	end
	send(chat, text);
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

-- LISTENER
Firecast.Messaging.listen("ChatMessage",
	function (message)
		initializeRoom(message.mesa);
		local txt =  Utils.removerFmtChat(message.texto, true);
		local arg = {};
		local numArgs = 0;
		for substring in txt:gmatch("%S+") do
   			table.insert(arg, substring)
   			numArgs = numArgs+1;
		end

		if arg[1]=="dealer" then
			local isMestre = message.jogador.isMestre;
			local isJogador = message.jogador.isJogador;
			local login = message.jogador.login;
			local activeChat = message.chat;
			local roomChat = message.mesa.chat;
			local dealer = dealerDB.rooms[message.mesa.codigoInterno];

			if checkCommand(arg[2], "help") then
				send(activeChat,"All Dealer Commands");
				send(activeChat,"All comands will begin with dealer.");
				send(activeChat,"Players, send all your commands in private chat to your GM.");
				send(activeChat,"> dealer help - shows commands");
				send(activeChat,"> dealer showAll - show all hands, deck and discard [GM only]");
				send(activeChat,"> dealer start tarot <cards> - initiates the deck with tarot cards plus card list separeted by space");
				send(activeChat,"> dealer start french <cards> - initiates the deck with the standard 52 plus card list separeted by space");
				send(activeChat,"> dealer start custom <cards> - initiates the deck with card list separeted by space");
				send(activeChat,"> dealer draw - add 1 random card to your hand");
				send(activeChat,"> dealer draw <number> - add number random cards to your hand");
				send(activeChat,"> dealer hand - show your hand on active chat");
				send(activeChat,"> dealer discard <card> - discard the card you named");
				send(activeChat,"> dealer return <card> - put the card you named back to the deck and shuffles it");
				send(activeChat,"> dealer give <card> <login> - gives a card you named to the player");
				send(activeChat,"> dealer deck - says number of cards remaning in deck and [GM only] lists them");
				send(activeChat,"> dealer discarded - says number of cards discarded and lists them");
				send(activeChat,"> dealer shuffle - shuffles deck [GM only]");
			elseif checkCommand(arg[2], "shuffle") then
				if isMestre then
					dealer.deck = shuffle(dealer.deck, dealer.numCards);
					send(roomChat,"<Dealer>: Deck has been shuffled.");
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
				dealer.players = {};
				dealer.hands = {};
				dealer.discard = {};
				dealer.numDiscard = 0;

				if checkCommand(arg[3], "tarot") then
					dealer.deck = {"Magician", "High_Priestess", "Empress", "Emperor", "Hierophant", "Lovers", "Chariot", "Strength", "Hermit", "Wheel_of_Fortune", "Justice", "Hanged_Man", "Death", "Temperance", "Devil", "Tower", "Star", "Moon", "Sun", "Judgement", "World", "Fool"};
					dealer.numCards = 22;
				elseif checkCommand(arg[3], "french") then
					dealer.deck = {"Ace_of_Clubs", "Two_of_Clubs", "Three_of_Clubs", "Four_of_Clubs", "Five_of_Clubs", "Six_of_Clubs", "Seven_of_Clubs", "Eight_of_Clubs", "Nine_of_Clubs", "Ten_of_Clubs", "Jack_of_Clubs", "Queen_of_Clubs", "King_of_Clubs", "Ace_of_Diamonds", "Two_of_Diamonds", "Three_of_Diamonds", "Four_of_Diamonds", "Five_of_Diamonds", "Six_of_Diamonds", "Seven_of_Diamonds", "Eight_of_Diamonds", "Nine_of_Diamonds", "Ten_of_Diamonds", "Jack_of_Diamonds", "Queen_of_Diamonds", "King_of_Diamonds", "Ace_of_Hearts", "Two_of_Hearts", "Three_of_Hearts", "Four_of_Hearts", "Five_of_Hearts", "Six_of_Hearts", "Seven_of_Hearts", "Eight_of_Hearts", "Nine_of_Hearts", "Ten_of_Hearts", "Jack_of_Hearts", "Queen_of_Hearts", "King_of_Hearts", "Ace_of_Spades", "Two_of_Spades", "Three_of_Spades", "Four_of_Spades", "Five_of_Spades", "Six_of_Spades", "Seven_of_Spades", "Eight_of_Spades", "Nine_of_Spades", "Ten_of_Spades", "Jack_of_Spades", "Queen_of_Spades", "King_of_Spades"};
					dealer.numCards = 52;
				end

				for i=4,numArgs,1 do
					dealer.numCards = dealer.numCards + 1;
					dealer.deck[dealer.numCards] = arg[i];
				end

				send(roomChat,"<Dealer>: New deck created with " .. dealer.numCards .. " card(s).");
				showDeck(dealer.deck, dealer.numCards, roomChat);
				dealer.deck = shuffle(dealer.deck, dealer.numCards);
				send(roomChat,"<Dealer>: Deck has been shuffled.");
			elseif checkCommand(arg[2], "deck") then
				send(activeChat,"<Dealer>: The deck has " .. dealer.numCards .. " card(s).");
				if isMestre then
					showDeck(dealer.deck, dealer.numCards, activeChat);
				end
			elseif checkCommand(arg[2], "draw") then
				local qtd = tonumber(arg[3]) or 1;
				if qtd < 1 then qtd = 1 end;

				if qtd > dealer.numCards then
					send(roomChat, "<Dealer>: Not enough cards in deck: " .. dealer.numCards);
					return;
				end;

				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				for i=1,qtd,1 do
					dealer.hands[login] = dealer.hands[login] + 1;
					dealer.players[login][dealer.hands[login]] = dealer.deck[dealer.numCards];
					send(activeChat, "<Dealer>: You drawn " .. dealer.deck[dealer.numCards]);
					dealer.deck[dealer.numCards] = nil;
					dealer.numCards = dealer.numCards - 1;
				end
				send(roomChat, "<Dealer>: " .. login .. " drawn " .. qtd .. " card(s). He owns " .. dealer.hands[login] .. " card(s)");
			elseif checkCommand(arg[2], "hand") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;
				send(activeChat, "<Dealer>: You have " .. dealer.hands[login] .. " card(s)");
				showDeck(dealer.players[login], dealer.hands[login], activeChat);
			elseif checkCommand(arg[2], "discard") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;

				local id = findId(dealer.players[login], dealer.hands[login], arg[3]);

				if id == 0 then
					send(activeChat, "<Dealer>: You don't have the card.");
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login]);

					dealer.numDiscard = dealer.numDiscard + 1;
					dealer.discard[dealer.numDiscard] = arg[3];
					send(roomChat, "<Dealer>: " .. login .. " discarded " .. arg[3]);
					dealer.players[login][dealer.hands[login]] = nil;
					dealer.hands[login] = dealer.hands[login] - 1;
				end;
			elseif checkCommand(arg[2], "discarded") then
				send(activeChat,"<Dealer>: The dicard pile has " .. dealer.numDiscard .. " card(s).");
				showDeck(dealer.discard, dealer.numDiscard, activeChat);
			elseif checkCommand(arg[2], "give") then
				if dealer.players[login] == nil then
					dealer.players[login] = {};
					dealer.hands[login] = 0;
				end;
				if arg[4]==nil then
					send(activeChat, "<Dealer>: I need the target login.");
					return;
				end;
				if dealer.players[arg[4]] == nil then
					dealer.players[arg[4]] = {};
					dealer.hands[arg[4]] = 0;
				end;

				local id = findId(dealer.players[login], dealer.hands[login], arg[3]);

				if id == 0 then
					send(activeChat, "<Dealer>: You don't have the card.");
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login]);

					dealer.hands[arg[4]] = dealer.hands[arg[4]] + 1;
					dealer.players[arg[4]][dealer.hands[arg[4]]] = arg[3];
					send(roomChat, "<Dealer>: " .. login .. " gave a card to " .. arg[4]);
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
					send(activeChat, "<Dealer>: You don't have the card.");
				else
					sendIdToEnd(dealer.players[login], dealer.hands[login]);

					dealer.numCards = dealer.numCards + 1;
					dealer.deck[dealer.numCards] = arg[3];
					dealer.players[login][dealer.hands[login]] = nil;
					dealer.hands[login] = dealer.hands[login] - 1;

					dealer.deck = shuffle(dealer.deck, dealer.numCards);

					send(roomChat, "<Dealer>: " .. login .. " returned to the deck " .. arg[3] .. ", and shuffled it.");
				end;
			elseif checkCommand(arg[2], "showAll") then
				if not isMestre then
					send(activeChat,"<Dealer>: Only GM can use this command.");
					return;
				end

				send(activeChat,"<Dealer>: The deck has " .. dealer.numCards .. " card(s).");
				showDeck(dealer.deck, dealer.numCards, activeChat);
				send(activeChat,"<Dealer>: The dicard pile has " .. dealer.numDiscard .. " card(s).");
				showDeck(dealer.discard, dealer.numDiscard, activeChat);

				for k,v in pairs(dealer.players) do
					send(activeChat,"<Dealer>: " .. k .." has " .. dealer.hands[k] .. " card(s).");
					showDeck(dealer.players[k], dealer.hands[k], activeChat)
				end;

			else
				send(activeChat, "<Dealer>: Unknown Command.");
			end;
		end;
	end);

Firecast.Messaging.listen("ListChatCommands",
    function(message)
        message.response = {{comando="dealer help", descricao="Exibe os comandos do dealer."}};
    end);