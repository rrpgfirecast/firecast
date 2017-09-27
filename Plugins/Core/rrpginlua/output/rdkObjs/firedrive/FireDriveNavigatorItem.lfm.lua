require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFireDriveNavigatorItem()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmFireDriveNavigatorItem");
    obj:setWidth(90);
    obj:setHeight(90);
    obj:setMargins({left=2, right=2, top=2, bottom=2});
    obj:setPadding({left=2, right=2, top=2, bottom=2});
    obj:setHitTest(true);
    obj:setCanFocus(true);


		local _imageURL = nil;
	
		local function verificarTipoDoItem()
			if sheet ~= nil then
				local url = nil;
				local extension;
				local useAbsoluteURL = false;
				_imageURL = nil;
			
				if sheet.isDir or sheet.kind == "dir" then
					url = "folder.png";
				else
					local mime = string.lower(sheet.mimeType or "");	
					
					if mime:match("^image/.*$") then
						_imageURL = sheet.url;
					end;
				
					if sheet.urlThumb64 ~= nil then
						url = sheet.urlThumb64;
						useAbsoluteURL = true;
					else
						local name = sheet.name or "";
						
						extension = string.lower(name:match("(%.[^%.\\/]*)$"));
						
						if mime:match("^text/.*$") then
							url = "textFile.png";
						elseif mime:match("^audio/.*$") then
							url = "soundFile.png";
						elseif mime == "application/pdf" then
							url = "pdfFile.png";
						elseif extension == ".txt" then
							url = "textFile.png";
						elseif extension == ".pdf" then
							url = "pdfFile.png";
						elseif extension == ".mp3" or extension == ".wav" then
							url = "soundFile.png";
						end;
					end;
				end;
				
				url = url or "otherFile.png";
				
				if (url ~= nil) and (not useAbsoluteURL) then
					url = "/firedrive/icos/" .. url;
				end;
				
				self.imgIco.src = url or "";
			end;
		end; 
		
		local function abrir()
			if self._navigator ~= nil then
				self._navigator:open(sheet);
			end;
		end;
		
		local function retornarUmNivel()
			if self._navigator ~= nil then
				self._navigator:returnOneLevel();
			end;
		end;
		
		local function exibirMenu()
			if self._navigator ~= nil and sheet ~= nil then
				self._navigator:exibirMenuParaItem(sheet, self);
			end;
		end;
		
		local function checkSelfSize()
			local p = self.padding;
			local h = self.imgIco.height + self.labNome.height + p.top + p.bottom;
			self.height = h;
		end;
		
		
		local function criarUploadStatusComp()
			local ret = gui.newRectangle();
			ret.xradius = 10;
			ret.yradius = 10;
			ret.color = "#000000C0";
			ret.align = "client";
			ret.parent = self.imgIco;
			ret.hitTest = false;
			ret.canFocus = false;
			
			local aniInd = gui.newActivityIndicator();
			aniInd.align = "client";
			aniInd.visible = true;
			aniInd.enabled = true;
			aniInd.parent = ret;
			aniInd.hitTest = false;
			aniInd.canFocus = false;
			aniInd.margins = {left=10, right=10, bottom=10, top=10};
			
			local labPercent = gui.newLabel();
			labPercent.align = "top";
			labPercent.horzTextAlign = "center";
			labPercent.wordWrap = false;
			labPercent.autoSize = true;	
			
			local barra = gui.newProgressBar();
			barra.visible = true;
			barra.hitTest = false;
			barra.height = 20;
			barra.color = "Green";
			
			local imgState = nil;
			
			local function criarImgState();
				imgState = gui.newImage();
				imgState.margins = {left=10, right=10, bottom=10, top=10};
				imgState.align = "client";
				imgState.hitTest = false;
			end;
			
			local recalcPosBarraEPercent = function()
				local margens = 2;
				local barraH = barra.height;
				local imgIcoW = self.imgIco.width;
				local totalH = labPercent.height + barraH + margens;
				local barraW = imgIcoW * 0.8;
				
				local y = self.imgIco.height / 2 - totalH / 2;
				barra.top = y;
				barra.width = barraW;
				barra.left = imgIcoW / 2 - barraW / 2;
				
				labPercent.top = y + barraH + margens;
				labPercent.left = imgIcoW / 2 - labPercent.width / 2;
			end;
			
			ret.onResize = recalcPosBarraEPercent;
			labPercent.onResize = recalcPosBarraEPercent;
			
			local _oldCurrent = 0;
			local _oldMaxBytes = 0;
			
			local configuradoPara = "ani"; -- "ani", "barra" ou "error"
			
			function ret:setProgress(current, maxBytes, errorMsg)								
				maxBytes = maxBytes or 0;
				current = current or 0;			
							
				if errorMsg ~= nil then
					if configuradoPara ~= "error" then
						configuradoPara = "error";
						
						if imgState == nil then
							criarImgState();
						end;
						
						aniInd.enabled = false;
						aniInd.parent = nil;	
						labPercent.parent = nil;
						barra.parent = nil;
						
						imgState.src = "/firedrive/icos/error64.png";
						imgState.parent = ret;
					end;
				elseif current < maxBytes then						
					if configuradoPara ~= "barra" then
						configuradoPara = "barra";						
						aniInd.enabled = false;
						aniInd.parent = nil;						
												
						if imgState ~= nil then
							imgState.parent = nil;
						end;
												
						barra.parent = ret;
						labPercent.parent = ret;
						recalcPosBarraEPercent();
					end;					
										
					if _oldMaxBytes ~= maxBytes then
						barra.max = maxBytes;
						_oldMaxBytes = maxBytes;
					end;
					
					if _oldCurrent ~= current then
						barra.position = current;
						_oldCurrent = current;
					end;
					
					if maxBytes > 0 then
						labPercent.text = string.format("%0.0f%%", (current / maxBytes) * 100);
					end;
				else
					-- usar um indicador de atividade
					
					if configuradoPara ~= "ani" then
						configuradoPara = "ani";
						aniInd.enabled = true;
						aniInd.parent = ret;	
						
						if imgState ~= nil then
							imgState.parent = nil;
						end;

						labPercent.parent = nil;
						barra.parent = nil;
					end;
				end;
			end;
			
			return ret;
		end;
			
		


    obj.imgIco = gui.fromHandle(_obj_newObject("image"));
    obj.imgIco:setParent(obj);
    obj.imgIco:setName("imgIco");
    obj.imgIco:setAlign("top");
    obj.imgIco:setOptimize(true);

local p = self.padding; self.imgIco.height = self.width - p.left - p.right - 20;


    obj.labNome = gui.fromHandle(_obj_newObject("label"));
    obj.labNome:setParent(obj);
    obj.labNome:setName("labNome");
    obj.labNome:setAlign("top");
    obj.labNome:setField("name");
    obj.labNome:setVertTextAlign("leading");
    obj.labNome:setHorzTextAlign("center");
    obj.labNome:setWordWrap(true);
    obj.labNome:setAutoSize(true);
    obj.labNome:setTextTrimming("none");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("urlThumb64");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'uploading', 'uploadSent', 'uploadMax', 'errorMsg'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (self)
            verificarTipoDoItem();
        end, obj);

    obj._e_event1 = obj:addEventListener("onDblClick",
        function (self)
            abrir();
        end, obj);

    obj._e_event2 = obj:addEventListener("onMenu",
        function (self, x, y)
            exibirMenu();
        end, obj);

    obj._e_event3 = obj:addEventListener("onKeyDown",
        function (self, event)
            if event.keyCode == 13 or event.key == "\13" then
            			-- ENTER
            			event.key = 0;
            			event.keyCode = 0;
            			abrir();
            		elseif event.keyCode == 8 then
            			-- BackSpace	
            			event.key = 0;
            			event.keyCode = 0;
            			retornarUmNivel();
            		elseif event.keyCode == 27 then			
            			event.key = "";
            			event.keyCode = 0;
            			
            			if self._navigator ~= nil then
            				self._navigator:notifyRequestCancel();
            			end;			
            		end;
        end, obj);

    obj._e_event4 = obj:addEventListener("onStartDrag",
        function (self, drag, x, y)
            if _imageURL ~= nil then
            			drag:addData("imageURL", _imageURL);
            		end;
        end, obj);

    obj._e_event5 = obj.labNome:addEventListener("onResize",
        function (self)
            checkSelfSize();
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            verificarTipoDoItem();
        end, obj);

    obj._e_event7 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local status = self._uploadStatus;
            		
            			if sheet.uploading then		
            				if status == nil then
            					status = criarUploadStatusComp();
            					self._uploadStatus = status;
            				end;
            				
            				if status.parent == nil then
            					status.parent = self.imgIco;
            				end;
            				
            				status:setProgress(sheet.uploadSent or 0, sheet.uploadMax or 0, sheet.errorMsg);
            			else
            				if status ~= nil then
            					--self._uploadStatus = nil;
            					status.parent = nil;
            					--status:destroy();
            				end;
            			end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.imgIco ~= nil then self.imgIco:destroy(); self.imgIco = nil; end;
        if self.labNome ~= nil then self.labNome:destroy(); self.labNome = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFireDriveNavigatorItem = {
    newEditor = newfrmFireDriveNavigatorItem, 
    new = newfrmFireDriveNavigatorItem, 
    name = "frmFireDriveNavigatorItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFireDriveNavigatorItem = _frmFireDriveNavigatorItem;
rrpg.registrarForm(_frmFireDriveNavigatorItem);

return _frmFireDriveNavigatorItem;
