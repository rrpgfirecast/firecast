require("firecast.lua");
require("dialogs.lua");
require("gui.lua");
require("fireDrive.lua");
require("utils.lua");
local fireDriveHost = require("firedrive/firedriveHost.lua");


-- A função abaixo é invocada pelo RRPG para exibir as interfaces de criação de personagem.
function RRPG_MenuCriarPersonagem(chaveSal, chaveBieMae)	
	local mesa = Firecast.findMesa(chaveSal);
	
	if mesa == nil then
		return;
	end;
	
	local bibMae = mesa:findBibliotecaItem(chaveBieMae);
	
	if bibMae == nil then
		bibMae = mesa.biblioteca; -- não achei, vamos usar a raiz da biblioteca entao.
	end;

	if bibMae == nil then
		error("[BUG?] Ops, não encontrei a pasta em que o personagem deve ser criado");
	end;
	
	local frm = GUI.newForm("frmNovoPersonagem");
	frm._mesa = mesa;
	frm._bibMae = bibMae;

	GUI.showPopup(frm, {placement="center"});	
end;

function RRPG_GerenciarPlugins()
	GUI.showPopup("frmGerenciarPlugins");
end;


function Firecast_quickUpload(suggestedFileName, mimeType, streamObjectHandle, 
						      successCallback, progressCallback, failureCallback)
	local streamObj = Utils.streamFromHandle(streamObjectHandle);
	
	if type(streamObj) ~= "table" then
		error("Could not open stream for Firecast_quickUpload");
	end;
	
	return FireDrive.quickUpload(suggestedFileName, mimeType, streamObj,
								 successCallback, progressCallback, failureCallback);
end;

function Firecast_firedrive_lang(msg)
	return fireDriveHost.langMessage(msg);
end;