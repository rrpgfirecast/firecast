let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);


for (var j = 0; j < magic.length; j++) {
	let spell = magic[j];

	// ver quem ta sem level ainda
	if (spell.level == null) console.log(spell.url);

	if (spell.aiming == null) spell.aiming = [];

	if (spell.target){
		if (spell.target.includes("burst")) spell.aiming.push("Burst");
		if (spell.target.includes("cone")) spell.aiming.push("Cone");
		if (spell.target.includes("cylinder")) spell.aiming.push("Cylinder");
		if (spell.target.includes("emanation")) spell.aiming.push("Emanation");
		if (spell.target.includes("line")) spell.aiming.push("Line");
		if (spell.target.includes("ray")) spell.aiming.push("Ray");
		if (spell.target.includes("sphere")) spell.aiming.push("Sphere");
		if (spell.target.includes("spread")) spell.aiming.push("Spread");
		if (spell.target.includes("shapeable")) spell.aiming.push("Shapeable");
	} 
	if (spell.area){
		if (spell.area.includes("burst")) spell.aiming.push("Burst");
		if (spell.area.includes("cone")) spell.aiming.push("Cone");
		if (spell.area.includes("cylinder")) spell.aiming.push("Cylinder");
		if (spell.area.includes("emanation")) spell.aiming.push("Emanation");
		if (spell.area.includes("line")) spell.aiming.push("Line");
		if (spell.area.includes("ray")) spell.aiming.push("Ray");
		if (spell.area.includes("sphere")) spell.aiming.push("Sphere");
		if (spell.area.includes("spread")) spell.aiming.push("Spread");
		if (spell.area.includes("shapeable")) spell.aiming.push("Shapeable");
	}
	if (spell.effect){
		if (spell.effect.includes("burst")) spell.aiming.push("Burst");
		if (spell.effect.includes("cone")) spell.aiming.push("Cone");
		if (spell.effect.includes("cylinder")) spell.aiming.push("Cylinder");
		if (spell.effect.includes("emanation")) spell.aiming.push("Emanation");
		if (spell.effect.includes("line")) spell.aiming.push("Line");
		if (spell.effect.includes("ray")) spell.aiming.push("Ray");
		if (spell.effect.includes("sphere")) spell.aiming.push("Sphere");
		if (spell.effect.includes("spread")) spell.aiming.push("Spread");
		if (spell.effect.includes("shapeable")) spell.aiming.push("Shapeable");
	}
}


let json = JSON.stringify(magic);
fs.writeFile('magic.json', json, 'utf8', (err) => {
  if (err) throw err;
  console.log("magic.json updated.");
});