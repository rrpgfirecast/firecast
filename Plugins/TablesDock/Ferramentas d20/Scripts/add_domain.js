let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);

var levelJson = fs.readFileSync("domain.json");
var level = JSON.parse(levelJson);

for (var i = 0; i < level.length; i++) {
	let lvl = level[i];
	for (var j = 0; j < magic.length; j++) {
		let spell = magic[j];

		if (spell.id == lvl.spell_id){
			console.log("Adicionando dominio " + lvl.slug + " " + lvl.level + " a magia " + spell.name);

			if (spell.level==null) spell.level = {};
			spell.level[lvl.slug] = ("" + lvl.level);
		} 
	}
}

let json = JSON.stringify(magic);
fs.writeFile('magic.json', json, 'utf8', (err) => {
  if (err) throw err;
  console.log("magic.json updated.");
});