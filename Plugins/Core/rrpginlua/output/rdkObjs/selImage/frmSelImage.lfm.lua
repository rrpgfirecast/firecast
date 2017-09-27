require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSelImagemURL()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmSelImagemURL");
    obj:setTitle("Imagem");
    obj:setHeight(300);
    obj:setWidth(300);
    obj:setResizable(true);

		
		function self:adaptarTamanhoDaTela()
			local sw, sh = system.getScreenSize();
			local dw = 650;
			local dh = 600;
		
			if dw > sw - 15 then
				dw = sw - 15;
			end;
			
			if dh > sh - 15 then
				dh = sh - 15;
			end;
						
			self.width = dw;
			self.height = dh;
		end;
	
		self:adaptarTamanhoDaTela();
	
		local cUser = rrpg.getCurrentUser();
		local canUseFireDrive = cUser.isGold or cUser.isGoldPlus or cUser.isRuby;		
		
		if canUseFireDrive then							
			self.navigator = require("/firedrive/firedriveNavigator.dlua").newFDNavigatorLayout();				
		end;
		
		function self:prepare()
			if self._defaultUrl ~= nil and type(self._defaultUrl) == "string" then
				self.edtURL.text = self._defaultUrl;
			end;
		end;
		
		function self:retornarOK(url)
			self.__retornouOK = true;
		
			if self._callback ~= nil then
				self._callback(url);
			end;
			
			self._cancelCallback = nil;		
			self._callback = nil;						
			self:close();
		end;
		
		function self:retornarCancel(deveFecharForm)
			if not self.__retornouOK and self._cancelCallback ~= ni then
				self._cancelCallback();
			end;
			
			self._cancelCallback = nil;		
			self._callback = nil;
			
			if deveFecharForm then
				self:close();
			end;
		end;
				
		self.onHide = function()
			if not self.__retornouOK then
				self:retornarCancel(false);
			end;
			
			if self.navigator ~= nil then
				self.navigator:finalizar();
				self.navigator = nil;
			end;
		end;
		
		self.onShow = function()
			self.edtURL:setFocus();
			self.rdbURL.checked = true;
		end;
		
		function self:tryDespacharOK()
			if self.rdbFireDrive.checked then
				if self.navigator ~= nil then
					local sel = self.navigator:getSelectedItem();
					
					if (sel ~= nil) and (not sel.uploading) and (not sel.isDir) and (sel.url ~= nil) then
						self:retornarOK(sel.url);
					end;
				end;
			else
				self:retornarOK(self.edtURL.text);
			end;
		end;
		
     


    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Selecione uma imagem");
    obj.label1:setName("label1");
    obj.label1:setFontSize(15);
    obj.label1:setFontColor("#FFCC66");
    obj.label1:setMargins({left=4, right=4, top=3, bottom=3});
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setAlign("top");
    obj.label1:setAutoSize(true);

    obj.flwMain = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flwMain:setParent(obj);
    obj.flwMain:setAlign("client");
    obj.flwMain:setName("flwMain");
    obj.flwMain:setMargins({left=12, right=12, top=1, bottom=5});

    obj.flpImgSite = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flpImgSite:setParent(obj.flwMain);
    obj.flpImgSite:setName("flpImgSite");
    obj.flpImgSite:setHeight(20);
    obj.flpImgSite:setMinWidth(180);
    obj.flpImgSite:setMaxWidth(99999);
    obj.flpImgSite:setMargins({top=10});

    obj.rdbURL = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbURL:setParent(obj.flpImgSite);
    obj.rdbURL:setName("rdbURL");
    obj.rdbURL:setText("Uma imagem de um site ");
    obj.rdbURL:setWidth(175);
    obj.rdbURL:setAlign("left");
    obj.rdbURL:setVertTextAlign("center");

    obj.linha1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linha1:setParent(obj.flpImgSite);
    obj.linha1:setName("linha1");
    obj.linha1:setStrokeColor("white");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flwMain);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flwMain);
    obj.flowPart1:setMargins({left=20, top=5});
    obj.flowPart1:setMinWidth(180);
    obj.flowPart1:setMaxWidth(9999);
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setName("flowPart1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart1);
    obj.label2:setText("URL da imagem: ");
    obj.label2:setAlign("left");
    obj.label2:setAutoSize(true);
    obj.label2:setWordWrap(false);
    obj.label2:setName("label2");

    obj.edtURL = gui.fromHandle(_obj_newObject("edit"));
    obj.edtURL:setParent(obj.flowPart1);
    obj.edtURL:setName("edtURL");
    obj.edtURL:setAlign("client");
    obj.edtURL:setMargins({left=4});

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flwMain);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flpImgFireDrive = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flpImgFireDrive:setParent(obj.flwMain);
    obj.flpImgFireDrive:setName("flpImgFireDrive");
    obj.flpImgFireDrive:setHeight(20);
    obj.flpImgFireDrive:setMinWidth(180);
    obj.flpImgFireDrive:setMaxWidth(99999);
    obj.flpImgFireDrive:setMargins({top=25});

    obj.rdbFireDrive = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbFireDrive:setParent(obj.flpImgFireDrive);
    obj.rdbFireDrive:setName("rdbFireDrive");
    obj.rdbFireDrive:setText("Uma imagem do FireDrive ");
    obj.rdbFireDrive:setWidth(185);
    obj.rdbFireDrive:setAlign("left");
    obj.rdbFireDrive:setVertTextAlign("center");

    obj.linha2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linha2:setParent(obj.flpImgFireDrive);
    obj.linha2:setName("linha2");
    obj.linha2:setStrokeColor("white");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flwMain);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.fireDriveNavigatorContent = gui.fromHandle(_obj_newObject("flowPart"));
    obj.fireDriveNavigatorContent:setParent(obj.flwMain);
    obj.fireDriveNavigatorContent:setName("fireDriveNavigatorContent");
    obj.fireDriveNavigatorContent:setMargins({left=20, top=5});
    obj.fireDriveNavigatorContent:setMinWidth(180);
    obj.fireDriveNavigatorContent:setMaxWidth(9999);
    obj.fireDriveNavigatorContent:setHeight(80);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("bottom");
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setHeight(40);

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Ok");
    obj.button1:setWidth(100);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setAlign("right");
    obj.button1:setName("button1");
    obj.button1:setMargins({left=4, right=4});

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setText("Cancelar");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setAlign("right");
    obj.button2:setName("button2");
    obj.button2:setWidth(100);
    obj.button2:setMargins({left=4, right=4});


		
		if self.navigator ~= nil then
			self.navigator.filter = "image/.+";
			self.navigator:gotoDir('/');
			self.navigator.align = "client";
			self.navigator.parent = self.fireDriveNavigatorContent;		
			
			
			self.navigator.onUIActivity = function()
				if (not self.rdbFireDrive.checked) and self.rdbFireDrive.enabled then
					self.rdbFireDrive.checked = true;
				end;						
			end;
			
			self.navigator.onOpenItem = function(item)
				self:retornarOK(item.url);
			end;
			
			self.navigator.onRequestCancel = function()
				self:retornarCancel(true);
			end;
		else
			self.rdbFireDrive.enabled = false;
			local KG = require("/knowGold/knowGoldPanel.dlua");
			
			self.panKG = KG.newPanel();
			self.panKG:setInfo("FireDrive é uma hospedagem de arquivos na internet exclusiva para assinantes RRPG Gold");
			self.panKG.parent = self.fireDriveNavigatorContent;
		end;
	


    obj._e_event0 = obj.flwMain:addEventListener("onAfterLayoutCalc",
        function (self)
            local fdCH = self.flwMain.height - self.fireDriveNavigatorContent.top - self.flwMain.padding.bottom;
            			
            			if fdCH < 10 then
            				fdCH = 10;
            			end;
            			
            			if fdCH ~= self.fireDriveNavigatorContent.height then
            				self.fireDriveNavigatorContent.height = fdCH;
            			end;
        end, obj);

    obj._e_event1 = obj.flpImgSite:addEventListener("onResize",
        function (self)
            self.linha1.left = self.rdbURL.width;
            				self.linha1.width = self.flpImgSite.width - self.rdbURL.width;
            				self.linha1.top = self.flpImgSite.height / 2 - self.linha1.height / 2;
        end, obj);

    obj._e_event2 = obj.edtURL:addEventListener("onEnter",
        function (self)
            self.rdbURL.checked = true;
        end, obj);

    obj._e_event3 = obj.edtURL:addEventListener("onKeyDown",
        function (self, event)
            if event.keyCode == 13 or event.key == "\n" then
            						event.keyCode = 0;
            						event.key = "";
            						self:tryDespacharOK();
            					elseif event.keyCode == 27 then
            						self:retornarCancel(true);
            						event.keyCode = 0;
            						event.key = "";
            					end;
        end, obj);

    obj._e_event4 = obj.flpImgFireDrive:addEventListener("onResize",
        function (self)
            self.linha2.left = self.rdbFireDrive.width;
            				self.linha2.width = self.flpImgFireDrive.width - self.rdbFireDrive.width;
            				self.linha2.top = self.flpImgFireDrive.height / 2 - self.linha2.height / 2;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (self)
            self:tryDespacharOK()
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (self)
            self:retornarCancel(true)
        end, obj);

    function obj:_releaseEvents()
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

        if self.flwMain ~= nil then self.flwMain:destroy(); self.flwMain = nil; end;
        if self.flpImgSite ~= nil then self.flpImgSite:destroy(); self.flpImgSite = nil; end;
        if self.linha1 ~= nil then self.linha1:destroy(); self.linha1 = nil; end;
        if self.edtURL ~= nil then self.edtURL:destroy(); self.edtURL = nil; end;
        if self.rdbFireDrive ~= nil then self.rdbFireDrive:destroy(); self.rdbFireDrive = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flpImgFireDrive ~= nil then self.flpImgFireDrive:destroy(); self.flpImgFireDrive = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.linha2 ~= nil then self.linha2:destroy(); self.linha2 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rdbURL ~= nil then self.rdbURL:destroy(); self.rdbURL = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.fireDriveNavigatorContent ~= nil then self.fireDriveNavigatorContent:destroy(); self.fireDriveNavigatorContent = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSelImagemURL = {
    newEditor = newfrmSelImagemURL, 
    new = newfrmSelImagemURL, 
    name = "frmSelImagemURL", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Imagem", 
    description=""};

frmSelImagemURL = _frmSelImagemURL;
rrpg.registrarForm(_frmSelImagemURL);

return _frmSelImagemURL;
