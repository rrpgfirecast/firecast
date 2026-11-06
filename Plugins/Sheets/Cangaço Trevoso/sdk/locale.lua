Locale = require("delayedLoad.dlua").new("localeCore.dlua");

function LANG(idTxt)
	return Locale.lang(idTxt);
end

function lang(idTxt)
	return Locale.lang(idTxt);
end

function tryLang(idTxt)
	return Locale.tryLang(idTxt);
end

function tryLANG(idTxt)
	return Locale.tryLang(idTxt);
end

return Locale;
