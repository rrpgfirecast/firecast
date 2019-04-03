let util = require('util');
let fs = require('fs');
let path = require('path');

var magicJson = fs.readFileSync("magic.json");
var magic = JSON.parse(magicJson);

for (var i = 0; i < magic.length; i++) {
	let spell1 = magic[i];
	for (var j = 0; j < magic.length; j++) {
		let spell2 = magic[j];

		if (spell1.name == spell2.name && i!=j){
			console.log("Magia duplicada " + spell1.name);
		}
	}
}