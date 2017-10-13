-- Bastão das Maravilhas
local resultado = rolar("1d100", "Bastão das Maravilhas"); 

if resultado <= 5 then
	enviar("Target affected by slow for 10 rounds (Will DC 15 negates).");
elseif resultado <= 10 then
	enviar("Faerie fire surrounds the target.");
elseif resultado <= 15 then
	enviar("Deludes the wielder for 1 round into believing the rod functions as indicated by a second die roll (no save).");
	invoke("bastao", "");
elseif resultado <= 20 then
	enviar("Gust of wind, but at windstorm force (Fortitude DC 14 negates).");
elseif resultado <= 25 then
	enviar("Wielder learns the target’s surface thoughts (as with detect thoughts) for 1d4 rounds (no save).");
	local duracao = rolar("1d4", "Duration");
elseif resultado <= 30 then
	enviar("Stinking cloud appears at 30-foot range (Fortitude DC 15 negates).");
elseif resultado <= 33 then
	enviar("Heavy rain falls for 1 round in 60-foot radius centered on the rod wielder.");
elseif resultado <= 36 then
	enviar("Summons an animal—a rhino (01—25 on d%), elephant (26—50), or mouse (51—100).");
	local resultado = rolar("1d100", "Rinho, Elephant or Mouse"); 
	if resultado <= 25 then
		enviar("Rinho");
	elseif resultado <= 50 then
		enviar("Elephant");
	else
		enviar("Mouse");
	end;
elseif resultado <= 46 then
	enviar("Lightning bolt (70 foot long, 5 foot wide), 6d6 points of damage (Reflex DC 15 half).");
	local dano = rolar("6d6", "Lightning Damage");
elseif resultado <= 49 then
	enviar("A stream of 600 large butterflies pours forth and flutters around for 2 rounds, blinding everyone within 25 foot (Reflex DC 14 negates).");
elseif resultado <= 53 then
	enviar("Target is affected by enlarge person if within 60 feet of rod (Fortitude DC 13 negates).");
elseif resultado <= 58 then
	enviar("Darkness, 30-foot-diameter hemisphere, centered 30 feet away from rod.");
elseif resultado <= 62 then
	enviar("Grass grows in 160-square-foot area before the rod, or grass existing there grows to 10 times its normal size.");
elseif resultado <= 65 then
	enviar("Any nonliving object of up to 1,000 pounds of mass and up to 30 cubic feet in size turns ethereal.");
elseif resultado <= 69 then
	enviar("Reduce wielder two size categories (no save) for 1 day.");
elseif resultado <= 79 then
	enviar("Fireball at target or 100 feet straight ahead, 6d6 points of damage (Reflex DC 15 half).");
	local dano = rolar("6d6", "Fireball Damage");
elseif resultado <= 84 then
	enviar("Invisibility covers the rod’s wielder.");
elseif resultado <= 87 then
	enviar("Leaves grow from the target if within 60 feet of the rod. These last 24 hours.");
elseif resultado <= 90 then
	enviar("10—40 gems, value 1 gp each, shoot forth in a 30-foot-long stream. Each gem deals 1 point of damage to any creature in its path: roll 5d4 for the number of hits and divide them among the available targets.");
	local gems = rolar("1d31+9", "Number of Gems");
elseif resultado <= 95 then
	enviar("Shimmering colors dance and play over a 40-foot-by-30-foot area in front of rod. Creatures therein are blinded for 1d6 rounds (Fortitude DC 15 negates).");
	local duracao = rolar("1d6", "Duration");
elseif resultado <= 97 then
	enviar("Wielder (50% chance) or the target (50% chance) turns permanently blue, green, or purple (no save).");
	local resultado = rolar("1d100", "Wielder or Target"); 
	if resultado <= 50 then
		enviar("Wielder");
	else
		target("Target");
	end;
else
	enviar("Flesh to stone (or stone to flesh if the target is stone already) if the target is within 60 feet (Fortitude DC 18 negates).");
end