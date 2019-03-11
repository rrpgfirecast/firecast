let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);

let levels = ["bard","cleric","druid","paladin","ranger","sorcerer","wizard","adept","assassin","blackguard","ninja","scout","spellthief","warlock","warmage","wu-jen","favored","shugenja","spirit","hexblade","archivist","air","animal","chaos","death","destruction","earth","evil","fire","good","healing","knowledge","law","luck","magic","plant","protection","strength","sun","travel","trickery","war","water","liberation","cold","creation","dream","mind","madness","domination","force","glory","purification","pact","pestilence","celerity","weather","courage"];
let schools = ["Abjuration","Conjuration","Calling","Creation","Healing","Summoning","Teleportation","Divination","Scrying","Enchantment","Charm","Compulsion","Evocation","Illusion","Figment","Glamer","Pattern","Phantasm","Shadow","Necromancy","Transmutation","Universal"];
let tags = ["Acid","Air","Chaotic","Cold","Darkness","Death","Earth","Electricity","Evil","Fear","Fire","Force","Good","Language-Dependent","Lawful","Light","Mind-Affecting","Sonic","Water"];
let components = ["V", "S", "M", "F", "DF", "XP"];
let ranges = ["3m", "6m", "9m", "12m", "15m", "18m", "Close", "Medium", "Long", "Personal", "Touch", "Special","Adjacent"];
let durations = ["Concentration", "Dismissible", "Instantaneous", "Rounds", "Minutes", "Hours", "Days", "Permanent", "Special"];
let targets = ["Area","Effect","Target","Burst","Cone","Cylinder","Emanation","Line","Ray","Sphere","Spread","Shapeable", "Special"];
let trs = ["Fortitude","Reflex","Will","None","Special"];
let srs = ["Yes", "No"];
let books = ["PHB","ELH","CAd","CAr","CD","CC","CM","CS","CW"];

for (var j = 0; j < magic.length; j++) {
	let spell=magic[j];

	for(var key in spell.level){
		if(!levels.includes(key)) console.log(spell.name + " tem como classe " + key);
	}

	if (!schools.includes(spell.school)) console.log(spell.name + " tem como escola " + spell.school);
	if (!schools.includes(spell.subschool) && spell.subschool) console.log(spell.name + " tem como subescola " + spell.subschool);

	for (var i = 0; spell.components && i < spell.components.length; i++) {
		if (!components.includes(spell.components[i])) console.log(spell.name + " tem como componente " + spell.components[i]);
	}

	if (!ranges.includes(spell.range)) console.log(spell.name + " tem como alcance " + spell.range);

	for (var i = 0; spell.duration && i < spell.duration.length; i++) {
		if (!durations.includes(spell.duration[i])) console.log(spell.name + " tem como duração " + spell.duration[i]);
	}
	for (var i = 0; spell.aiming && i < spell.aiming.length; i++) {
		if (!targets.includes(spell.aiming[i])) console.log(spell.name + " tem como mira " + spell.aiming[i]);
	}
	for (var i = 0; spell.save && i < spell.save.length; i++) {
		if (!trs.includes(spell.save[i])) console.log(spell.name + " tem como tr " + spell.save[i]);
	}
	for (var i = 0; spell.sr && i < spell.sr.length; i++) {
		if (!srs.includes(spell.sr[i])) console.log(spell.name + " tem como sr " + spell.sr[i]);
	}
	for (var i = 0; spell.book && i < spell.book.length; i++) {
		if (!books.includes(spell.book[i])) console.log(spell.name + " tem como livro " + spell.book[i]);
	}
	
}