let util = require('util');
let fs = require('fs');
let path = require('path');

let allDbsPath = path.join("")


// Pega o nome e caminho de todos arquivos da pasta. 
var walkSync = function(dir, filelist) {
	var fs = fs || require('fs'),
		files = fs.readdirSync(dir);
	filelist = filelist || [];
	files.forEach(function(file) {
	if (fs.statSync(dir + file).isDirectory()) {
		filelist = walkSync(dir + file + '/', filelist);
	}
	else {
		filelist.push(dir + file);
	}
	});
	return filelist;
};

function escapeXml(unsafe) {
    return unsafe.replace(/[<>&'"]/g, function (c) {
        switch (c) {
            case '<': return '&lt;';
            case '>': return '&gt;';
            case '&': return '&amp;';
            case '\'': return '&apos;';
            case '"': return '&quot;';
        }
    });
};

var filelist = [];
walkSync(allDbsPath+"\\",filelist);

let xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<root>\n"
for (var i = 0; i < filelist.length; i++) {
	console.log(filelist[i]);
	let fullPath = filelist[i];
	let safePath = escapeXml(fullPath.slice(2));
	let extension = fullPath.split('.').pop();
	if (extension== "lua"){
		xml = xml + "	<element name=\"";
		xml = xml + fullPath.split('/').pop().split('.')[0];
		xml = xml + "\" path=\"" + safePath;
		xml = xml + "\" link=\"" + "https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Macros/" + safePath;

		xml = xml + "\"/>\n";
	}
}
xml = xml + "</root> "

fs.writeFile('macros.xml', xml, 'utf8', (err) => {
  if (err) throw err;
  console.log("lastrun.xml updated.");
});