-- rollbar <roll> <barNum> <player(opt)> <message(opt)>
-- rolls and remove from player bar
local roll = arg[1]
local bar = tonumber(arg[2])
local user = arg[3]
local msg = arg[4]

while roll==nil do
  roll = inputQuery("Rolagem:")
end

while bar == nil or bar < 1 or bar >4 do
	bar = tonumber(inputQuery("Número da barra a ser afetada. "))
end

local res = rolar(roll, msg)

local target = nil
if user ~= nil then
	for i=1, #players, 1 do
		if (utils.compareStringPtBr(utils.removerFmtChat(players[i].login), utils.removerFmtChat(user))==0 or utils.compareStringPtBr(utils.removerFmtChat(players[i].nick), utils.removerFmtChat(user))==0) then
			target = players[i]
		end
	end
else
	target = myPlayer
end

if target ~= nil then
	local currentValue, maxValue = target:getBarValue(bar)
	if currentValue==nil then currentValue=0 end
	if maxValue==nil then maxValue=0 end
	currentValue = currentValue - res

	target:requestSetBarValue(bar, currentValue, maxValue)
end