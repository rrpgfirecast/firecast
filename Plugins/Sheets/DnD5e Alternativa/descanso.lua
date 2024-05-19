descanso = {};

function descanso.curto(ficha)
	local personagem = Firecast.getPersonagemDe(ficha);
	if (personagem ~= nil) then
		local mesa = personagem.mesa;
		if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
			mesa.chat:enviarAcao("fez um descanso curto");
			ficha.descansoCurto = true;
			ficha.descansoCurto = false;
		else
			showMessage("Você não pode fazer descansos por este personagem");
		end;
	end;
end;

function descanso.longo(ficha)
	local personagem = Firecast.getPersonagemDe(ficha);
	if (personagem ~= nil) then
		local mesa = personagem.mesa;
		if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
			mesa.chat:enviarAcao("fez um descanso longo");
			ficha.descansoLongo = true;
			ficha.descansoLongo = false;
		else
			showMessage("Você não pode fazer descansos por este personagem");
		end;
	end;
end;
