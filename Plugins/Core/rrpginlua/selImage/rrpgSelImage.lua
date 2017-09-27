--[[
   Módulo que exibe janela para selecionar uma imagem  
]]


function RRPG_SelImage(defUrl, maxImageSize, callback, cancelCallback)
	local gui = require("gui.lua");
	local frm = gui.newForm("frmSelImagemURL");
	
	frm._defaultUrl = defUrl;
	frm._maxImageSize = maxImageSize;
	frm._callback = callback;
	frm._cancelCallback = cancelCallback;
	
	frm:prepare();
	frm:show();	
end;