require("firecast.lua"); 
require("dialogs.lua"); 
require("fireDrive.lua");

myButtons = NDB.load("myButtons.xml");

if myButtons.list==nil then
	myButtons.list = {};
end;
if myButtons.qtd==nil then
	myButtons.qtd = 0;
end;

-- botao para adicionar botoes
local addMacro = {};
addMacro.hint = "Cria um atalho para um macro.";
addMacro.icon = "/macro_add.png";
addMacro.priority = 0;
addMacro.group = "macroButtons";
addMacro.groupPriority = 2;

addMacro.callback =
	function(chat)
		local index = myButtons.qtd + 1;
		myButtons.qtd = index;
		myButtons.list[index] = {};
		local canceled = false;

		-- Pega o hint do botão
		Dialogs.inputQuery("Dica", "O que esse macro vai fazer?", "",
			function (hint)
				myButtons.list[index].hint = hint;
			end,	   
			function()
				myButtons.qtd = index - 1;
				myButtons.list[index] = nil;
				canceled = true;
		end);
		if canceled then
			return;
		end;

		-- Pega o macro associado ao botão
		Dialogs.inputQuery("Macro", "Qual o comando do macro?", "",
			function (macro)
				myButtons.list[index].macro = macro;
			end,	   
			function()
				myButtons.qtd = index - 1;
				myButtons.list[index] = nil;
				canceled = true;
		end);
		if canceled then
			return;
		end;

		-- Pega o parametro do botão
		Dialogs.inputQuery("Paramêtro", "Vai usar algum paramêtro?", "",
			function (parametro)
				myButtons.list[index].parametro = parametro;
			end,	   
			function()
				myButtons.qtd = index - 1;
				myButtons.list[index] = nil;
				canceled = true;
			end, true);
		if canceled then
			return;
		end;

		-- escolher o icone associado ao macro
		local options = {"1","2","3","4","5","6","7","8","9","10","d20","personalizado"};
		Dialogs.choose("Qual icone quer usar?", options,
			function(selected, selectedIndex, selectedText)
				if selected then
					if selectedIndex < #options then
						myButtons.list[index].icon = "/" .. selectedText ..".png";

						local button = {};
						button.hint = myButtons.list[index].hint;
						button.icon = myButtons.list[index].icon;
						button.priority = 0;
						button.group = "macroButtons";
						button.groupPriority = 0;
						button.callback = 
							function(chat)
								chat:enviarMensagem("/" .. myButtons.list[index].macro .. " " .. (myButtons.list[index].parametro or ""));
							end;

						myButtons.list[index].toolButtonId = Firecast.registerChatToolButton(button);
					else
						Dialogs.selectImageURL("",
							function(url)
								myButtons.list[index].icon = url;

								local button = {};
								button.hint = myButtons.list[index].hint;
								button.icon = myButtons.list[index].icon;
								button.priority = 0;
								button.group = "macroButtons";
								button.groupPriority = 0;
								button.callback = 
									function(chat)
										chat:enviarMensagem("/" .. myButtons.list[index].macro .. " " .. (myButtons.list[index].parametro or ""));
									end;

								myButtons.list[index].toolButtonId = Firecast.registerChatToolButton(button);
							end,
							function()
								myButtons.qtd = index - 1;
								myButtons.list[index] = nil;
								canceled = true;
							end);
					end;
				else
					myButtons.qtd = index - 1;
					myButtons.list[index] = nil;
					canceled = true;
				end;
			end);
		if canceled then
			return;
		end;
	end;
Firecast.registerChatToolButton(addMacro);

-- remove botao já criado
local removeMacro = {};
removeMacro.hint = "Remove um atalho para um macro.";
removeMacro.icon = "/macro_remove.png";
removeMacro.priority = 0;
removeMacro.group = "macroButtons";
removeMacro.groupPriority = 1;

removeMacro.callback =
	function(chat)
		local options = {};

		for i=1, myButtons.qtd, 1 do
			options[i] = "/" .. myButtons.list[i].macro .. " " .. (myButtons.list[i].parametro or "");
		end;

		Dialogs.choose("Qual atalho de macro quer remover?", options,
				function(selected, selectedIndex, selectedText)
					if selected then
						-- remove botao
						Firecast.unregisterChatToolButton(myButtons.list[selectedIndex].toolButtonId);
						-- copia botao do fim do array
						myButtons.list[selectedIndex].hint = myButtons.list[myButtons.qtd].hint;
						myButtons.list[selectedIndex].icon = myButtons.list[myButtons.qtd].icon;
						myButtons.list[selectedIndex].macro = myButtons.list[myButtons.qtd].macro;
						myButtons.list[selectedIndex].parametro = myButtons.list[myButtons.qtd].parametro;
						myButtons.list[selectedIndex].toolButtonId = myButtons.list[myButtons.qtd].toolButtonId;
						-- apaga botao e diminui qtd
						myButtons.list[myButtons.qtd] = nil;
						myButtons.qtd = myButtons.qtd - 1;
					end;
				end);
	end;
Firecast.registerChatToolButton(removeMacro);

-- Readicionando botões já criados
for i=1, myButtons.qtd, 1 do 
	local button = {};
	button.hint = myButtons.list[i].hint;
	button.icon = myButtons.list[i].icon;
	button.priority = 0;
	button.group = "macroButtons";
	button.groupPriority = 0;
	button.callback = 
		function(chat)
			chat:enviarMensagem("/" .. myButtons.list[i].macro .. " " .. (myButtons.list[i].parametro or ""));
		end;
	myButtons.list[i].toolButtonId = Firecast.registerChatToolButton(button);
end;
