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
-- MACRO [COMPULSÃO V:AM - V5 2.0] RRPG8 by thirteen
-- Necessário que o Clã esteja em uma das linhas editáveis
local fome = rolar("1d10", "Determinando Compulsão");
local compCla = "";
local jogador = nil;
local linhaComCla = 1;

	-- FOME
	if (fome > 0 and fome < 4) then
		enviar("‎‎‎");
		enviar("## [§K1]ℭ𝔬𝔪𝔭𝔲𝔩𝔰𝔞̃𝔬:[§K#ee0058] 𝕱𝖔𝖒𝖊\n[§K14]O vampiro fará qualquer coisa para saciar sua Fome, quer isso signifique violência, subterfúgio ou implorar abertamente. Eles realizam qualquer ação que não conduza imediatamente à alimentação com uma penalidade de dois dados em suas rolagens.\n‎\n[§B][§K1]Esta Compulsão termina quando o vampiro abate pelo menos 1 nível de Fome.");
		end;

	-- DOMINAÇÃO
	if (fome > 3 and fome < 6) then
		enviar("‎‎‎");
		enviar("## [§K1]ℭ𝔬𝔪𝔭𝔲𝔩𝔰𝔞̃𝔬:[§K#824fff] 𝕯𝖔𝖒𝖎𝖓𝖆𝖈̧𝖆̃𝖔\n[§K14]O vampiro transforma sua próxima interação em uma competição, usando todos os meios à sua disposição para terminar vitorioso e esfregar o nariz do perdedor em sua derrota. O vampiro não pode usar de trabalho em equipe e executa qualquer ação que evite estabelecer domínio ou desafiar a autoridade com uma penalidade de dois dados em suas rolagens.\n‎\n[§B][§K1]Esta Compulsão termina quando o vampiro [§T]“vence”[§T] e se vangloria disso.");
		end;

	-- DESTRUIR
	if (fome > 5 and fome < 8) then
		enviar("‎‎‎");
		enviar("## [§K1]ℭ𝔬𝔪𝔭𝔲𝔩𝔰𝔞̃𝔬:[§K#AD0000] 𝕯𝖊𝖘𝖙𝖗𝖚𝖎𝖗\n[§K14]O vampiro executa todas as ações que não resultam imediatamente em alguém ou algo sendo machucado com uma penalidade de dois dados em suas rolagens. Esta Compulsão frequentemente, mas nem sempre, significa dano físico. Também pode envolver tipos mais sutis de dano, como social ou emocional. Se o vampiro se volta contra um objeto, ele deve ter um valor sério para alguém que o vampiro normalmente valoriza, como ele mesmo.\n‎\n[§B][§K1]Esta Compulsão termina quando o vampiro incapacita, destrói ou afasta um alvo.");
		end;
		
	-- PARANOIA
	if (fome > 7 and fome < 10) then
		enviar("‎‎‎");
		enviar("## [§K1]ℭ𝔬𝔪𝔭𝔲𝔩𝔰𝔞̃𝔬:[§K#97262F] 𝕻𝖆𝖗𝖆𝖓𝖔𝖎𝖆\n[§K14]O vampiro tenta se libertar e fugir de qualquer ameaça percebida, suspeitando de tudo e de todos. Qualquer ação não realizada para esse fim imediato incorre na penalidade de dois dados em suas rolagens.\n‎\n[§B][§K1]A Compulsão termina quando o vampiro passa cerca de uma hora em um local seguro.");
		end;
	
	-- COMPULSÃO DE CLÃ
	if (fome == 10) then
		for i=1, #jogadores, 1 do
				if (meuJogador.login == jogadores[i].login) then jogador = jogadores[i]; end;
		end;
		
		if(jogador:getEditableLine(linhaComCla) == "Toreador") then
			compCla = "[§B]Toreador: Obsessão[§B]\n[§K14]Apaixonado pela beleza, o vampiro fica temporariamente obcecado por uma coisa singular e linda, incapaz de pensar em mais nada. Escolha um alvo, como uma pessoa, uma música, uma obra de arte, um respingo de sangue ou até mesmo um nascer do sol. Encantado, o vampiro mal consegue tirar sua atenção disso, e se tentarem conversar com ele, ele só falará sobre esse assunto. Quaisquer outras ações recebem uma penalidade de dois dados em suas rolagens.\n‎\n[§B][§K1]Essa compulsão dura até que eles não consigam mais perceber o objeto amado, ou quando a cena termina.";
		elseif(jogador:getEditableLine(linhaComCla) == "Brujah") then
			compCla = "[§B]Brujah: Rebelião[§B]\n[§K14]O vampiro se posiciona contra aquilo ou aquele que eles percebam como o status quo na situação, seja esse seu líder, um ponto de vista expresso por alguém ou apenas a tarefa que eles deveriam fazer no momento. Até que eles tenham ido contra suas ordens ou expectativas, percebidas ou reais, o vampiro recebe uma penalidade de dois dados em todas as rolagens.\n‎\n[§B][§K1]Esta Compulsão termina quando eles conseguem fazer com que alguém mude de ideia (através de força, se necessário) ou fazem o oposto do que era esperado deles.";
		elseif(jogador:getEditableLine(linhaComCla) == "Gangrel") then
			compCla = "[§B]Gangrel: Instintos Ferais[§B]\n[§K14]Retornando a um estado animalesco, o vampiro regride a um ponto onde a fala é difícil, as roupas são desconfortáveis e as discussões são melhor resolvidas com dentes e garras. Por uma cena, o vampiro ganha uma penalidade de três dados em todos os testes envolvendo Manipulação e Inteligência. Eles só podem falar frases de uma palavra durante esse tempo.\n‎\n[§B][§K1]Esta Compulsão termina ao final da cena.";
		elseif(jogador:getEditableLine(linhaComCla) == "Malkavian") then
			compCla = "[§B]Malkavian: Alucinação[§B]\n[§K14]Com seus dons extra-sensoriais correndo soltos, o vampiro experimenta o que podem ser verdades ou presságios, mas o que outros chamam de invenções da imaginação, exageradas pela Fome. Embora ainda funcional, a mente e as percepções do vampiro são distorcidas. Eles recebem uma penalidade de dois dados em testes envolvendo Destreza, Manipulação, Compostura e Esperteza, bem como em testes para resistir ao frenesi de terror, para uma cena.\n‎\n[§B][§K1]Esta Compulsão termina ao final da cena.";
		elseif(jogador:getEditableLine(linhaComCla) == "Nosferatu") then
			compCla = "[§B]Nosferatu: Criptofilia[§B]\n[§K14]A necessidade de saber permeia o vampiro. São consumidos por uma fome de segredos, de saber o que poucos ou ninguém sabe, quase tão forte quanto o desejo por sangue. Eles também se recusam a compartilhar segredos com outros, exceto em troca estrita por outros maiores. Todas as ações não gastas trabalhando para aprender um segredo, não importa o quão grande ou pequeno, recebem uma penalidade de dois dados.\n‎\n[§B][§K1]A Compulsão termina quando o vampiro aprende um segredo grande o suficiente para ser considerado útil. Compartilhar este segredo é opcional.";
		elseif(jogador:getEditableLine(linhaComCla) == "Tremere") then
			compCla = "[§B]Tremere: Perfeccionismo[§B]\n[§K14]Nada além do melhor satisfaz o vampiro. Qualquer coisa menos do que um desempenho excepcional instila uma profunda sensação de fracasso, e eles costumam repetir tarefas obsessivamente para fazê-las [§T]“da maneira certa”[§T]. Até que o vampiro obtenha um sucesso crítica em um teste de Habilidade ou a cena termine, o vampiro trabalha sob uma penalidade de dois dados em todas as suas rolagens. Reduza a penalidade para um dado por uma ação repetida e remova-a inteiramente em uma segunda repetição.\n‎\n[§B][§K1]Esta Compulsão termina ao final da cena ou com um sucesso crítico.";
		elseif(jogador:getEditableLine(linhaComCla) == "Ventrue") then
			compCla = "[§B]Ventrue: Arrogância[§B]\n[§K14]A necessidade de governar surge no vampiro. Eles não param diante de nada para assumir o comando de uma situação. Alguém deve obedecer a uma ordem do vampiro. Qualquer ação não diretamente associada à liderança recebe uma penalidade de dois dados.\n‎\n[§B][§K1]Essa Compulsão dura até que uma ordem seja obedecida, embora a ordem não deva ser aplicada de forma sobrenatural, como por meio de Dominação.";
		elseif(jogador:getEditableLine(linhaComCla) == "Lasombra") then
			compCla = "[§B]Lasombra: Crueldade[§B]\n[§K14]Fracasso não é uma opção. O Sangue do vampiro o compele a qualquer ato concebível para alcançar seus objetivos, seja imediatamente ou em conspirações duradouras. Qualquer revés é sentido profundamente e eles rapidamente escalam para os métodos mais implacáveis até atingirem seus objetivos. Na próxima vez em que o vampiro falhar em qualquer ação, ele receberá uma penalidade de dois dados em todas e quaisquer jogadas até que uma tentativa futura da mesma ação seja bem-sucedida. Essa penalidade também se aplica a futuras tentativas de ativação da ação.\n‎\n[§B][§K1]Essa Compulsão dura até que o vampiro complete a ação em que falhou inicialmente.";
		elseif(jogador:getEditableLine(linhaComCla) == "Ravnos") then
			compCla = "[§B]Ravnos: Provocando o Destino[§B]\n[§K14]O vampiro é levado por seu Sangue a cortejar o perigo. Danados como estão, por que não? Na próxima vez que o vampiro se deparar com um problema para resolver, qualquer tentativa de solução menor que a mais ousada ou perigosa incorre na penalidade de dois dados. Tentativas adequadamente chamativas e arriscadas podem até merecer dados de bônus para esta ocasião. O vampiro é livre para convencer qualquer companheiro a fazer as coisas à sua maneira, mas é igualmente provável que faça isso sozinho.\n‎\n[§B][§K1]A Compulsão persiste até que o problema seja resolvido ou novas tentativas se tornem impossíveis."
		elseif(jogador:getEditableLine(linhaComCla) == "Tzimisce") then
			compCla = "[§B]Tzimisce: Cobiça[§B]\n[§K14]O vampiro fica obcecado em possuir algo na cena, desejando adicioná-lo à sua coleção. Isso pode ser qualquer coisa, desde um objeto até uma pessoa. Qualquer ação realizada sem este propósito incorre na penalidade de dois dados em sua rolagem.\n‎\n[§B][§K1]A Compulsão persiste até que a propriedade seja estabelecida (o narrador decide o que constitui propriedade no caso de um não-objeto) ou o objeto de desejo se torna inalcançável.";
		elseif(jogador:getEditableLine(linhaComCla) == "Salubri") then
			compCla = "[§B]Salubri: Empatia[§B]\n[§K14]O vampiro fica sobrecarregado com empatia por um problema que aflige alguém na cena, tentanto ajudá-lo com sua solução. O tamanho do problema pessoal não é importante; o Salubri entende que às vezes sofrimento é parte de uma situação acumulativa, não um estímulo isolado. Qualquer ação tomada para qualquer coisa além de resolver essa tragédia pessoal resulta em uma penalidade de dois dados em qualquer rolagens.\n‎\n[§B][§K1]A Compulsão persiste até que o fardo do alvo tenha sido aliviado um pouco, uma crise sobreponha isso ou a cena acabe.";
		elseif(jogador:getEditableLine(linhaComCla) == "Banu Haqim") then
			compCla = "[§B]Banu Haqim: Julgamento[§B]\n[§K14]O vampiro é compelido a punir qualquer um que transgrida seu credo pessoal, tomando seu sangue como vingança pelo crime. Por uma cena, o vampiro deve saciar pelo menos um ponto de Fome de qualquer um, amigo ou inimigo, que atue contra uma Convicção deles. Deixar de fazer isso resulta em uma penalidade de três dados em todas as jogadas.\n‎\n[§B][§K1]A Compulsão dura até que ele reduza 1 de Fome justificadamente ou a cena termine.";
		end;
		
			-- IMPRESSÃO
			enviar("‎‎‎");
			enviar("## [§K1]ℭ𝔬𝔪𝔭𝔲𝔩𝔰𝔞̃𝔬:[§K0] 𝕮𝖔𝖒𝖕𝖚𝖑𝖘𝖆̃𝖔 𝖉𝖊 𝕮𝖑𝖆̃\n[§K1]"..compCla);
	end;