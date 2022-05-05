-- Macro base para magias na ficha de D&D 5E nativa do firecast
-- Preparada pelo Marcola42
-- precisa ser editada uma vez para cada nova magias, basta editar o primeiro bloco que a macro faz o resto

-- Edite o nome da magia abaixo
local nomemagia = "Bola de fogo"

-- Selecione o nível inicial da magia, 0 para cantrips
local nivelmagia = 3

-- defina o atributo base para usar a magia: 1-INT, 2-WIS, 3-CHA
local atributobase = 1

-- diga se a magia precisa de uma rolagem de ataque ou não: 0-NÃO, 1-SIM
local rolaataque = 0

-- diga se a magia provoca uma rolagem de dano ou não: 0-NÃO, 1-SIM
local roladano = 1

-- diga qual o dano base da magia, no nível minimo dela
local danobase = "8d6"

-- diga se a magia inclui o bônus de atributo no dano (como eldritch blast em alguns casos): 0-NÃO, 1-SIM
local danoatributo = 0

-- diga se o dano da magia escala se for utilizada com um nível de magia superior: 0-NÃO, 1-SIM
-- Esse parâmetro não se aplica para cantrips, apenas para magias de nível 1 ou superior
local magiaescala = 1

-- diga quanto o dano da magia sobe a cada nível além do mínimo
-- Esse parâmetro não se aplica para cantrips, apenas para magias de nível 1 ou superior
local danoescalado = "1d6"

-- Apenas cantrips: diga se o dado dano da magia escala se for utilizada com um nível de magia superior: 0-NÃO, 1-SIM
-- No caso de escalar com mais raios deixe esse parãmetro em NÃO e role a macro mais vezes
local cantripescala=0

-- diga se deseja que essa magia seja acompanhada do texto de descrição: 0-NÃO, 1-SIM
local escrevedesc = 1

-- escreve a descrição da magia
local descmagia = "Bola de fogo faz boom!"


-- Agora não precisa mais editar nada daqui para baixo, a menos que queira alterar a macro
-- os comentários são superficiais para dizer mais ou menos o que o código fáz

-- Se é uma magia que escala, a macro pede qual o nível com o qual a magia vai ser castada
nivelfinal = nivelmagia
if nivelmagia > 0 then
	if magiaescala==1 then
		nivelfinal = tonumber(inputQuery("Com que nível deseja usar essa magia?", nivelmagia))
	end
end

-- declara a magia que está sendo usada no chat
agir(nomemagia)

-- seleciona o atributo do bônus de ataque baseado no que o usuário selecionou
local bonusbase = 0
local bonusbasestr = ""
if atributobase==1 then
	bonusbase = sheet.atributos.modinteligencia
end
if atributobase==2 then
	bonusbase = sheet.atributos.modsabedoria
end
if atributobase==3 then
	bonusbase = sheet.atributos.modcarisma
end
-- inclui o atributo no dano, caso o usuário configure
if danoatributo==1 then
	danobase = danobase .. "+" .. bonusbase
end

-- se a magia precisa de um ataque a macro rola o d20 + atributo + proficiência
if rolaataque==1 then
	roll("1d20+" .. bonusbase .. "+" .. sheet.bonusProficiencia ,"Rolagem normal")
	roll("1d20+" .. bonusbase .. "+" .. sheet.bonusProficiencia ,"Rolagem com (des)Vantagem")
end

-- Para magias nível 1+: rola dano base
if nivelmagia>0 then
	if roladano==1 then
		roll(danobase ,"Dano base")
	end
end

-- Para magias nível 1+: rola dano de escalação de nível
if nivelfinal>nivelmagia then
	roll( string.rep("+"..danoescalado,nivelfinal-nivelmagia),"Dano por nível superior")
end

-- Para cantrips: verifica o nível do jogador, em caso de cantrips que escalam dado
local nivelchar = tonumber(sheet.DadosDeVidaTotal)
local repetedado = 1
if nivelchar > 4 then
	repetedado=repetedado+1
end
if nivelchar > 10 then
	repetedado=repetedado+1
end
if nivelchar > 16 then
	repetedado=repetedado+1
end
-- Para cantrips: rola o dano (escalado ou não, numa única rolagem)
if nivelmagia==0 then
	if cantripescala==0 then
		roll(danobase ,"Dano base")
	end
	if cantripescala==1 then
		roll(string.rep("+"..danobase, repetedado),"Dano base")
	end
end

-- Escreve o CD da magia, para aquelas que não envolvem rolagem de ataque como bola de fogo
if rolaataque==0 then
	enviar("CD para resistir à magia: " .. (8+sheet.bonusProficiencia+bonusbase))
end

-- Escreve a descrição, se o jogador quiser
if escrevedesc==1 then
	enviar(descmagia)
end
