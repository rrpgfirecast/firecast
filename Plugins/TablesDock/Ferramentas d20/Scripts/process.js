let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);

for (var j = 0; j < magic.length; j++) {
	let spell = magic[j];

	if (!spell.url){
		console.log("Adicionando url a magia " + spell.name);
		let domain = "https://dndtools.net/spells/";

		let rulebook = {"ELH": "epic-level-handbook","CAd": "complete-adventurer","CAr": "complete-arcane","CD": "complete-divine","CC": "complete-champion","CM": "complete-mage","CS": "complete-scoundrel","CW": "complete-warrior"};
		let rulebook_id = {"ELH": 41,"CAd": 54,"CAr": 55,"CD": 56,"CC": 57,"CM": 58,"CS": 60,"CW": 61};

		let url = domain + rulebook[spell.book[0]] + "--" + rulebook_id[spell.book[0]] + "/" + spell.slug + "--" + spell.id;
		console.log(url);

		spell.url = url;
	} 
}


let json = JSON.stringify(magic);
fs.writeFile('magic.json', json, 'utf8', (err) => {
  if (err) throw err;
  console.log("magic.json updated.");
});