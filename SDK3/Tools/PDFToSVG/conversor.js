
if (window.File && window.FileReader && window.FileList && window.Blob) {
  // Great success! All the File APIs are supported.
} else {
  alert('The File APIs are not fully supported in this browser.');
}

var svgXMLNS = 'http://www.w3.org/2000/svg';
var XHTMLNS = 'http://www.w3.org/1999/xhtml';
var pdfViewPort = null;
var scaleToUse = 1.5;
var defaultFontSize = 9.5;

var pdfObj = null;
var pdfFileName = "";
var pdfFileNameSemExtensao = "";
var currentPage = 1;
var renderAsImage = true;
var convertChoicesParaEdits = true;
var desenharShapesDosAnnotations = true;

function getFieldRect(field) {
    var viewPort = pdfViewPort;
	var fieldRect = viewPort.convertToViewportRectangle(field.rect);
	var rect = PDFJS.Util.normalizeRect(fieldRect);
	var padding = 0;
	
	if (field.borderWidth)
		padding = field.borderWidth * scaleToUse;
	
	return {
		x: Math.round(rect[0] + padding / 2),
		y: Math.round(rect[1]),
		width: Math.round(rect[2] - rect[0] - padding / 2),
		height: Math.round(rect[3] - rect[1])
	};
}

function createFOTag(svgTag, field, inRect) {
	var rect;
	
	if (inRect)
		rect = inRect;		
	else
		rect = getFieldRect(field);

	var tag = document.createElementNS(svgXMLNS, 'foreignObject');
		
	tag.setAttribute('x', rect.x + '');
	tag.setAttribute('y', rect.y + '');
	tag.setAttribute('width', rect.width + '');
	tag.setAttribute('height', rect.height + '');
	
	svgTag.appendChild(tag);
	return tag;
}

function createBodyTag(svgTag, field, rect) {
	var foTag = createFOTag(svgTag, field, rect);
	var bodyTag = document.createElementNS(XHTMLNS, 'body');
	bodyTag.setAttribute('xmlns', XHTMLNS);
	bodyTag.setAttribute('style', 'margin: 0; padding: 0;');
	
	foTag.appendChild(bodyTag);
	return bodyTag;
}

function createInputTag(svgTag, field) {
	var fieldR = getFieldRect(field);
	var htmlTag = createBodyTag(svgTag, field);
	var inputTag = document.createElementNS(XHTMLNS, 'input');
	inputTag.setAttribute('id', field.fullName);
	inputTag.setAttribute('name', field.fullName);
	inputTag.style.width = fieldR.width + "px";
	inputTag.style.height = fieldR.height + "px";	
	inputTag.style.margin = '0';
	inputTag.style.padding = '0';	
		
	//inputTag.setAttribute('style', "font:normal 12.6357565px 'Times New Roman', Times, serif; 	width:249px;	height:21px;  text-align: center;  color: rgb(0,64,85);  background: transparent;  border-color:transparent; vertical-align:text-top; margin: 0; padding: 0;");
	htmlTag.appendChild(inputTag);
	return inputTag;
}

function createTextAreaTag(svgTag, field) {
	var fieldR = getFieldRect(field);
	var offset = 8 * scaleToUse;
	fieldR.y = fieldR.y + offset;
	fieldR.height = fieldR.height - offset;
	
	var htmlTag = createBodyTag(svgTag, field, fieldR);
	var textareaTag = document.createElement('textarea');
	textareaTag.setAttribute('id', field.fullName);
	textareaTag.setAttribute('name', field.fullName);
	textareaTag.style.width = fieldR.width + "px";
	textareaTag.style.height = fieldR.height + "px";	
	textareaTag.style.margin = '0';
	textareaTag.style.padding = '0';
			
	htmlTag.appendChild(textareaTag);
	return textareaTag;
}

function createSelectTag(svgTag, field) {
	var fieldR = getFieldRect(field);
	var htmlTag = createBodyTag(svgTag, field);
	var selectTag = document.createElementNS(XHTMLNS, 'select');
	selectTag.setAttribute('id', field.fullName);
	selectTag.setAttribute('name', field.fullName);
	selectTag.style.width = fieldR.width + "px";
	selectTag.style.height = fieldR.height + "px";	
	selectTag.style.margin = '0';
	selectTag.style.padding = '0';	
			
	htmlTag.appendChild(selectTag);
	return selectTag;
}

function tryExtractFontSizeFromField(field) {
	var retVal = defaultFontSize;
	var val = field.defaultAppearance;
	
	if (typeof val == "string") {
		var nn = val.match(/[0-9]+/);
		
		if (nn && nn.length > 0) {
			retVal = nn[0];
			
			if (!retVal || retVal <= 0.1) {
				retVal = defaultFontSize;
			}
		}
	}
	
	return retVal * scaleToUse;
};

function tryExtractColorFromField(field) {
	var retVal = [0, 0, 0];
	var val = field.defaultAppearance;
	
	if (typeof val == "string") {
		var nn = val.match(/[0-9.]+\s+[0-9.]+\s+[0-9.]+\s+rg/);
		
		if (nn && nn.length > 0) {
			nn = nn[0].match(/[0-9.]+/g);
			
			if (nn && nn.length >= 3) {
				retVal[0] = parseFloat(nn[0]);
				retVal[1] = parseFloat(nn[1]);
				retVal[2] = parseFloat(nn[2]);
			}
		}
	}
	
	return retVal;
}

function colorToRgb(color) {
	return 'rgb(' + Math.round(color[0] * 255) + ',' + Math.round(color[1] * 255) + ', ' + Math.round(color[2] * 255) + ')';
}

function addEditField(svgTag, field) {
	var tag;
	
	if (field.fieldFlags & (1 << 12)) {
		// textArea
		tag = createTextAreaTag(svgTag, field);
		
	} else {	
		tag = createInputTag(svgTag, field);
		tag.setAttribute('type', 'text');	
		
		if (field.textAlignment == 1) 
			tag.style['text-align'] = 'center';
		else
			if (field.textAlignment == null || typeof field.textAlignment == "undefined")
				tag.style['text-align'] = 'left';
		
		if (field.fieldValue && field.fieldValue != "") {
			tag.setAttribute('value', field.fieldValue);
		}
	}
	
	/*tag.style['margin-top'] = "0px";
	tag.style['margin-bottom'] = "0px";
	
	if (field.borderWidth) {
		tag.style['margin-left'] = field.borderWidth * scaleToUse + 'px';
		tag.style['margin-right'] = field.borderWidth * scaleToUse + 'px';
	}*/
	
	tag.style.background = 'transparent';
	tag.style['border-color'] = 'transparent';	
	tag.style['font-size'] = (tryExtractFontSizeFromField(field)) + 'px';
	
	var fColor = tryExtractColorFromField(field);
	tag.style['color'] = colorToRgb(fColor);	
}

function addChoiceField(svgTag, field) {
	var tag;
	
	tag = createSelectTag(svgTag, field);
	tag.style['text-align'] = 'center'	
	
	if (field.fieldValue && field.fieldValue != "") {
		tag.setAttribute('value', field.fieldValue);
	}
	
	tag.style.background = 'transparent';
	tag.style['border-color'] = 'transparent';	
	tag.style['font-size'] = (tryExtractFontSizeFromField(field)) + 'px';
	
	var fColor = tryExtractColorFromField(field);
	tag.style['color'] = colorToRgb(fColor);	
}

function addCheckBoxField(svgTag, field) {
	var tag = createInputTag(svgTag, field);
	
	if (field.fieldFlags & (1 << 16)) {
		tag.setAttribute('type', 'button');
	} else {
		tag.setAttribute('type', 'checkbox');	
	}
}

function addField(svgTag, field) { 
	switch(field.fieldType) {
		case 'Tx': addEditField(svgTag, field); break;
		case 'Cb': addCheckBoxField(svgTag, field); break;
		case 'Ch': 
			if (convertChoicesParaEdits)
				addEditField(svgTag, field);
			else					
				addChoiceField(svgTag, field); 
			
			break;
		/*case 'Rd': _addRadioButton.call(this, field); break;
		case 'Btn':_addLinkButton.call(this, field); break;
		case 'Ch': _addSelect.call(this, field); break;*/
	}
};

function isWidgetSupported(field) {
	var retVal = false;

	switch(field.fieldType) {
		case 'Tx': retVal = true; break; //text input
		case 'Cb':
		case 'Rd':
			retVal = true;
			break;
			
		case 'Btn':
			if (field.flags & 32768) {
				field.fieldType = 'Rd'; //radio button
			}
			else if (field.flags & 65536) {
				field.fieldType = 'Btn'; //push button
			}
			else {
				field.fieldType = 'Cb'; //checkbox
			}
			retVal = true;
			break;
		case 'Ch': retVal = true; break; //drop down
		default:
			console.log(": field.fieldType of " + field.fieldType + " is not supported.");
			break;
	}

	return retVal;
};

function isFormElement(field) {
	var retVal = false;
	switch(field.subtype) {
		case 'Widget': 
			retVal = isWidgetSupported(field); 
			break;
			
		default:
			console.log(": field.type of " + field.type + " is not supported.");
			break;
	}
	return retVal;
}

function processAnnotation(svgTag, field) {
	if (isFormElement(field))
		addField(svgTag, field);
}

function setupForm(svgTag, fields) {
	for (var i = 0; i < fields.length; i++)
		processAnnotation(svgTag, fields[i]);
};

function dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}

function createSVGTagForStaticImagePage(page, viewport, endCallback) {
	var svg = document.createElementNS(svgXMLNS, 'svg');
	svg.setAttribute('xmlns:xlink', 'http://www.w3.org/1999/xlink');
	svg.setAttribute('xmlns', svgXMLNS);	
	svg.setAttribute('version', '1.1');
	svg.setAttribute('width', Math.round(viewport.width) + 'px');
	svg.setAttribute('height', Math.round(viewport.height) + 'px');
	
	var canvas = document.createElement('canvas');
	canvas.width = Math.round(viewport.width);
	canvas.height = Math.round(viewport.height);
	var context = canvas.getContext('2d');
	
	globalParamPDFJS_DesenharAnnotations = false;
	
	for (var i = 0; i < PDFJS.OPS_Shapes.length; i++)
		PDFJS.OPS_IgnoreWithIgnoreOnAnnotation[PDFJS.OPS_Shapes[i]] = !desenharShapesDosAnnotations;
	
	var renderContext = {canvasContext: context, viewport: viewport};
	page.render(renderContext).then(function() {
			globalParamPDFJS_DesenharAnnotations = true;
	
			var tagImage = document.createElementNS(svgXMLNS, 'image');
			tagImage.setAttributeNS('http://www.w3.org/1999/xlink', 'xlink:href', URL.createObjectURL(dataURItoBlob(canvas.toDataURL('image/png', 1))));
			tagImage.setAttribute('width', Math.round(viewport.width) + '');
			tagImage.setAttribute('height', Math.round(viewport.height) + '');
			tagImage.setAttribute('x', '0');
			tagImage.setAttribute('y', '0');
			svg.appendChild(tagImage);
	
			if (endCallback)
				endCallback(svg);
		})
}

function renderThePage(pageNumber, container, callback) {
	var pdf = pdfObj;
	
	if  (!pdf)
		return;

	pdf.getPage(pageNumber).then(function getPageHelloWorld(page) {
		var scale = scaleToUse;
		var viewport = page.getViewport(scale);
		pdfViewPort = viewport;
		
		container.innerHTML = "";
	  
		if (renderAsImage) {
			// Renderizar elementos em uma imagem estática
			createSVGTagForStaticImagePage(page, viewport, function(svg) {
					container.appendChild(svg);
					
					page.getAnnotations().then(function (fields) {
													setupForm(svg, fields);
													
													if (callback)
														callback(pageNumber, page);
											   });					
				});
			
		} else {
			// Renderizar elementos para elementos SVG
			return page.getOperatorList().then(function (opList) {
				  var svgGfx = new PDFJS.SVGGraphics(page.commonObjs, page.objs);
				  svgGfx.embedFonts = true;
				  svgGfx.svgIgnoreFontFamily = true;
				  
				  return svgGfx.getSVG(opList, viewport).then(function (svg) {
									
					container.appendChild(svg);
					
					page.getAnnotations().then(function (fields) {
													setupForm(svg, fields);
													
													if (callback)
														callback(pageNumber, page);
											   });
				  })
			});	
		}		
	});
}

var imgNumberGenerator = 1;

function dumpSingleImage(node, zip, endCallback) {
 // Create an empty canvas element
	var w = node.width.baseVal.value;
	var h = node.height.baseVal.value;
	
	var imgTag = document.createElement('img');
	imgTag.width = w;
	imgTag.height = h;
	imgTag.onload = function (){		
		var canvas = document.createElement("canvas");
		canvas.width = w;
		canvas.height = h;

		// Copy the image contents to the canvas
		var ctx = canvas.getContext("2d");
		//ctx.clearRect(0, 0, w, h);		
		ctx.drawImage(imgTag, 0, 0);		
		
		// Get the data-URL formatted image
		// Firefox supports PNG and JPEG. You could check img.src to
		// guess the original format, but be aware the using "image/jpg"
		// will re-encode the image.
		var dataURL = canvas.toDataURL("image/png", 1);
		dataURL = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		
		var fileName = 'images/' + imgNumberGenerator + '.png';
		imgNumberGenerator++;
		
		zip.file(fileName, dataURL, {'base64': true});
		node.setAttribute('xlink:href', fileName);
		
		if (endCallback)
			endCallback();
	}
	
	imgTag.src = node.getAttribute('xlink:href');
}

function dumpImages(nodes, zip, startIdx, endCallback) {
	if (nodes.length <= 0 || startIdx > nodes.length - 1) {
		if (endCallback)
			endCallback();
	
		return;
	}		
	
	dumpSingleImage(nodes[startIdx], zip, 
		function () {
			dumpImages(nodes, zip, startIdx + 1, endCallback);
		});	
}

function enumerateImagesToDump(node, destArr) {
	if (node.nodeType != 1) {
		return;
	}
		
	if (node.nodeName == "image") {
		destArr[destArr.length] = node;
	}
		
	var childs = node.childNodes;
	var currIdx = 0;
	
	for (var i = 0; i < childs.length; i++)
		enumerateImagesToDump(childs[i], destArr);
}

function limparAttributesVaziosDeNode(node) {
	var attributes = node.attributes;
		
	for (var i = attributes.length -1; i >= 0; i--) {
		var att = attributes.item(i);
		var	value = att.value;
		var valueStr = String(att.value);
		
		if (typeof value == "undefined" || typeof value == "null" || String(att.value).trim().length == 0) {
			node.removeAttribute(att.name);
		}
	}
}

function removerNodePreservandoFilhos(node)  {
	var childs = node.childNodes;
	var lastNode = node;
	
	for (var i = childs.length - 1; i >= 0; i--) {
		var cn = childs[i];
		node.removeChild(cn);
		node.parentNode.insertBefore(cn, lastNode);
		lastNode = cn;
	}
	
	node.parentNode.removeChild(node);
}

function prepareNodeForDump(node, zip) {
	if (node.nodeType != 1)
		return;
		
	limparAttributesVaziosDeNode(node);
		
	var childNodes = node.childNodes;
	
	for (var i = childNodes.length - 1; i >= 0; i--) {
		var cn = childNodes[i];
		prepareNodeForDump(childNodes[i], zip);
		
		if (cn.nodeType == 1 && cn.nodeName == "g") 
			if (cn.attributes.length == 0) 
				removerNodePreservandoFilhos(cn); // tag <g> sem atributos.. vamos remover ela e repassar os filhos..
			
	}
}

function dumpContainerToZip(container, pageNumber, zip, endCallback) {
	var fc = container.firstChild;
	
	if (fc) {
		prepareNodeForDump(fc, zip);
	
		var tagImages = [];
		enumerateImagesToDump(fc, tagImages);
	
		dumpImages(tagImages, zip, 0, 
		 function() {
			var svgContent = nodeToXmlString(fc, svgXMLNS, {'xmlns:xlink': 'http://www.w3.org/1999/xlink'});
			zip.file(pageNumber + ".svg", svgContent);			
			
			if (endCallback)
				endCallback();
		 });		
	}
};

function startDownload(zip) {
	var blob = zip.generate({type:"blob"});
	
	if (navigator.appVersion.toString().indexOf('.NET') > 0) {
		// Internet explorer
        window.navigator.msSaveBlob(blob, pdfFileNameSemExtensao + ".zip");
	} else {	
		// outros browsers
		var link = document.createElement("a");
		link.href = window.URL.createObjectURL(blob);
		link.download = pdfFileNameSemExtensao + ".zip";
		
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	}
};

function savePage(pageNumber, zip) {
	if (pageNumber > pdfObj.numPages) {
		startDownload(zip);
		return;
	}

	var container = document.createElement("div");	
				
	renderThePage(pageNumber, container, function (currentPageNumber) {			
			dumpContainerToZip(container, currentPageNumber, zip, 
				function (){
					savePage(pageNumber + 1, zip);
				});
			}
		);
}

function saveAllPages() {	
	if (!pdfObj)
		return;
		
	imgNumberGenerator = 1;
	var zip = new JSZip();		
	savePage(1, zip);
}

function showPage(pageNumber) {
	currentPage = pageNumber;

	renderThePage(pageNumber, document.getElementById("svgTarget"), 
		function (cPageNumber, page) {
			var divTarget = document.getElementById("svgTarget");
			var viewport = page.getViewport(scaleToUse);
			divTarget.style.width = viewport.width + "px";
			
			var spanDimensoes = document.getElementById("spanDimensoes");
			spanDimensoes.textContent = "Dimensões: " + Math.round(viewport.width) + "x" + Math.round(viewport.height) + " (Use a escala acima para alterar o tamanho)";
			
			currentPage = pageNumber;
		});
}

function setupPageLinks(){
	var container = document.getElementById('pagesLinks');
	container.innerHTML = "";
	
	for (var i = 0; i < pdfObj.numPages; i++) {
		var link = document.createElement('a');
		link.textContent = i + 1;
		link.style['margin'] = "5px";
		link.setAttribute('href', '#');
		link.setAttribute('onclick', 'showPage(' + (i + 1) + ')');
		
		container.appendChild(link);
	}
	
	var saveLink = document.createElement("a");
	saveLink.textContent = "-=[ Salvar todas as páginas ]=-";
	saveLink.style['margin-left'] = "15px";
	saveLink.setAttribute('href', '#');
	saveLink.setAttribute('onclick', 'saveAllPages()');	
	container.appendChild(saveLink);
}

function extractPureFileName(fileName){
	if (typeof fileName != "string") 
		return fileName;
			
	var fileExt = /[^.]+$/.exec(fileName);
	
	if (!fileExt)
		fileExt = "";
	
	var newFileName = fileName.substring(0, fileName.length - fileExt.length - 3);
	return newFileName;
}

function iniciarConversor(url, fileName) {	
	pdfObj = null;	
	pdfFileName = fileName;
	pdfFileNameSemExtensao = extractPureFileName(fileName);
	
	if (typeof pdfFileNameSemExtensao != "string")
		pdfFileNameSemExtensao = "UmPdf";
	
	document.getElementById('pagesLinks').innerHTML = "";

	 PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
		pdfObj = pdf;
		setupPageLinks();		
		showPage(1);
	  });
};


function alterarEscala(novaEscala) {
	if (novaEscala >= 0.05 && novaEscala <= 50) 
		scaleToUse = novaEscala;
	else
		scaleToUse = 1.5;
		
	if (pdfObj)
		showPage(currentPage);
}
