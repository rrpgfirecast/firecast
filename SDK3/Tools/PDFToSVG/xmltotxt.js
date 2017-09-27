
function encodeXmlString(v) {
	var str = v.replace(/&/g, '&amp;');
	str = str.replace(/"/g, '&quot;');
	str = str.replace(/'/g, '&apos;');
	str = str.replace(/</g, '&lt;');
	str = str.replace(/>/g, '&gt;');
	return str;
}

function nodeAttributeToString(nodeName, nodeValue) {
	return nodeName + '="' + encodeXmlString(nodeValue) + '"';
}

function nodeTextToString(node) {
	if (node.parentNode.nodeName != "style")
		return encodeXmlString(node.nodeValue);
	else
		return node.nodeValue;
}

function nodeElementToString(node, extraAts, cIdent) {
	if (!cIdent) 
		cIdent = "";

	var nodeName = node.nodeName;
	
	if (nodeName == "BODY" || nodeName == "INPUT" || nodeName == "TEXTAREA")
		nodeName = nodeName.toLowerCase();
	
	var str = "<" + nodeName;
	var atts = node.attributes;
	
	if ((atts && atts.length >= 0) || (extraAts)) {
		
		if (extraAts) 
			for(var propt in extraAts)
				str += ' ' + nodeAttributeToString(propt, extraAts[propt]);				
			
		for (var i = 0; i < atts.length; i++) {
			var attNome = atts.item(i).nodeName;
			var attValue = atts.item(i).nodeValue;
			
			if (!extraAts || !extraAts[attNome])
				str += ' ' + nodeAttributeToString(attNome, attValue);	
		}
	}
			
	var childs = node.childNodes;
	var newIdent = cIdent + "    ";
	var ultimoEhElement = false;
	
	if (childs.length > 0) {
		str += ">";
		
		for (var i = 0; i < childs.length; i++) {
			var cnode = childs[i];
			ultimoEhElement = false;
			
			switch(cnode.nodeType) {
				case 1: // elemento					
					str += "\n" + newIdent + nodeElementToString(cnode, null, newIdent);
					ultimoEhElement = true;
					break;
					
				case 3: // text node
					str += nodeTextToString(cnode);
					break;
			}
		}
		
		if (ultimoEhElement)
			str += "\n" + cIdent;
		
		str += '</' + nodeName + '>';
	} else {
		str += '/>';
	}	
	
	return str;
}

function nodeToXmlString(node, xmlns, extraAts) {
	var str = '<?xml version="1.0" encoding="UTF-8"?>';	
	
	var exAts = extraAts;
	
	if (!exAts)
		exAts = {};
	
	if (xmlns) {	
		exAts.xmlns = xmlns;
	}
	
	var nodeTxt = nodeElementToString(node, exAts);
	
	str = str + nodeTxt;
	return str;
}