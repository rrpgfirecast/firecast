let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);

for (var j = 0; j < magic.length; j++) {
	let spell = magic[j];

	if (spell.verbal_component == 1){
		console.log("Adicionando componente verbal a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("V");
	} 
	spell.verbal_component = null;

	if (spell.somatic_component == 1){
		console.log("Adicionando componente gestual a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("S");
	} 
	spell.somatic_component = null;

	if (spell.material_component == 1){
		console.log("Adicionando componente material a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("M");
	} 
	spell.material_component = null;

	if (spell.arcane_focus_component == 1){
		console.log("Adicionando componente foco a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("F");
	} 
	spell.arcane_focus_component = null;

	if (spell.divine_focus_component == 1){
		console.log("Adicionando componente foco divino a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("DF");
	} 
	spell.divine_focus_component = null;

	if (spell.xp_component == 1){
		console.log("Adicionando componente de XP a magia " + spell.name);

		if (spell.components==null) spell.components = [];
		spell.components.push("XP");
	} 
	spell.xp_component = null;
	
}


let json = JSON.stringify(magic);
fs.writeFile('magic.json', json, 'utf8', (err) => {
  if (err) throw err;
  console.log("magic.json updated.");
});