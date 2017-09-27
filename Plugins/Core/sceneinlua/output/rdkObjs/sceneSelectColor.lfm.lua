require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSelColor()
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
    obj:setName("frmSelColor");
    obj:setWidth(300);
    obj:setHeight(160);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);


		require("system.lua");
		
		local options = nil;		
		self.onRetorno = nil; -- preencher este callback para processar		
	


    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flaContent = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContent:setParent(obj.scrollBox1);
    obj.flaContent:setAlign("top");
    obj.flaContent:setAutoHeight(true);
    obj.flaContent:setMaxControlsPerLine(1);
    obj.flaContent:setName("flaContent");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flaContent);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(5000);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader = gui.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader:setParent(obj.flowPart1);
    obj.labGroupHeader:setName("labGroupHeader");
    obj.labGroupHeader:setAlign("left");
    obj.labGroupHeader:setAutoSize(true);
    obj.labGroupHeader:setWordWrap(false);
    obj.labGroupHeader:setHorzTextAlign("leading");
    obj.labGroupHeader:setVertTextAlign("center");
    obj.labGroupHeader:setMargins({left=10, right=5});
    obj.labGroupHeader:setFontSize(15);
    obj.labGroupHeader:setFontColor("#FFCC66");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("#FFCC6670");
    obj.horzLine1:setMargins({left=10});
    obj.horzLine1:setName("horzLine1");


			self.labGroupHeader.text = lang("scene.selectColor.title");
		


    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flaContent);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setHeight(30);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(5000);
    obj.flowPart2:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labDefinirCor = gui.fromHandle(_obj_newObject("label"));
    obj.labDefinirCor:setParent(obj.flowPart2);
    obj.labDefinirCor:setName("labDefinirCor");
    obj.labDefinirCor:setAlign("left");
    obj.labDefinirCor:setWidth(20);
    obj.labDefinirCor:setAutoSize(false);
    obj.labDefinirCor:setHorzTextAlign("trailing");
    obj.labDefinirCor:setVertTextAlign("center");
    obj.labDefinirCor:setMargins({right=5});

    obj.cbxDefinirCor = gui.fromHandle(_obj_newObject("checkBox"));
    obj.cbxDefinirCor:setParent(obj.flowPart2);
    obj.cbxDefinirCor:setName("cbxDefinirCor");
    obj.cbxDefinirCor:setAlign("client");
    obj.cbxDefinirCor:setMargins({right=20});

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flaContent);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setHeight(30);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(5000);
    obj.flowPart3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labACor = gui.fromHandle(_obj_newObject("label"));
    obj.labACor:setParent(obj.flowPart3);
    obj.labACor:setName("labACor");
    obj.labACor:setAlign("left");
    obj.labACor:setWidth(20);
    obj.labACor:setAutoSize(false);
    obj.labACor:setHorzTextAlign("trailing");
    obj.labACor:setVertTextAlign("center");
    obj.labACor:setMargins({right=5});

    obj.cmbCor = gui.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCor:setParent(obj.flowPart3);
    obj.cmbCor:setName("cmbCor");
    obj.cmbCor:setUseAlpha(true);
    obj.cmbCor:setAlign("client");
    obj.cmbCor:setMargins({right=20});

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("bottom");
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setHeight(40);

    obj.btnOk1 = gui.fromHandle(_obj_newObject("button"));
    obj.btnOk1:setParent(obj.layout1);
    obj.btnOk1:setWidth(100);
    obj.btnOk1:setHorzTextAlign("center");
    obj.btnOk1:setAlign("right");
    obj.btnOk1:setName("btnOk1");
    obj.btnOk1:setMargins({left=4, right=4});

    obj.btnCancel1 = gui.fromHandle(_obj_newObject("button"));
    obj.btnCancel1:setParent(obj.layout1);
    obj.btnCancel1:setHorzTextAlign("center");
    obj.btnCancel1:setAlign("right");
    obj.btnCancel1:setName("btnCancel1");
    obj.btnCancel1:setWidth(100);
    obj.btnCancel1:setMargins({left=4, right=4});


			self.btnOk1.text = lang("Ok");
			self.btnCancel1.text = lang("cancelar");
		


	
		self.title = lang('scene.selectColor.title');	
		self.cbxDefinirCor.text = lang("scene.selectColor.defineColor");

		function self:prepareForShow(corInicial, theOptions)
			theOptions = theOptions or {};			
			options = theOptions;
	
			self:beginUpdate();
			
			if theOptions.title ~= nil then
				self.labGroupHeader.text = theOptions.title;
				self.title = theOptions.title;
			else
				self.labGroupHeader.text = lang('scene.selectColor.title');
				self.title = lang('scene.selectColor.title');
			end;
			
			if theOptions.defineTitle ~= nil then
				self.cbxDefinirCor.text = theOptions.defineTitle;
			end;
			
			local isNullColor = corInicial == "Null" or corInicial == "#00000000" or 
			   corInicial == "Transparent" or corInicial == "None" or 
			   corInicial == nil;
			
			if isNullColor then
				if theOptions.defaultColor ~= nil then
					self.cbxDefinirCor.checked = true;
					self.cmbCor.color = theOptions.defaultColor;					
				else			
					self.cbxDefinirCor.checked = false;
					self.cmbCor.color = "#000000FF";
				end;
			else
				self.cbxDefinirCor.checked = true;
				self.cmbCor.color = corInicial;
			end;		
			
			if theOptions.useAlpha ~= nil then
				self.cmbCor.useAlpha = theOptions.useAlpha; 
			end;
			
			self.cmbCor.enabled = self.cbxDefinirCor.checked;			
			self:endUpdate();
		end;		
		
		function self:processarOK()
			if self.onRetorno ~= nil then
				self.onRetorno(self.cmbCor.color, self.cbxDefinirCor.checked);
			end;			
	
			self:close();
		end;
		
		function self:processarCancel()
			self:close();
		end;
		


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (self, event)
            if (event.keyCode == 0x89) or (event.keyCode == 0x1B) then
            			setTimeout(
            				function()
            					self:processarCancel();
            				end, 1);
            			
            			event.keyCode = 0;
            			event.key = "";
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onCancelRequest",
        function (self)
            self:processarCancel();
        end, obj);

    obj._e_event2 = obj.cbxDefinirCor:addEventListener("onChange",
        function (self)
            self.cmbCor.enabled = self.cbxDefinirCor.checked;
        end, obj);

    obj._e_event3 = obj.btnOk1:addEventListener("onClick",
        function (self)
            self:processarOK()
        end, obj);

    obj._e_event4 = obj.btnCancel1:addEventListener("onClick",
        function (self)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.labGroupHeader ~= nil then self.labGroupHeader:destroy(); self.labGroupHeader = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.labACor ~= nil then self.labACor:destroy(); self.labACor = nil; end;
        if self.labDefinirCor ~= nil then self.labDefinirCor:destroy(); self.labDefinirCor = nil; end;
        if self.flaContent ~= nil then self.flaContent:destroy(); self.flaContent = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.cmbCor ~= nil then self.cmbCor:destroy(); self.cmbCor = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.cbxDefinirCor ~= nil then self.cbxDefinirCor:destroy(); self.cbxDefinirCor = nil; end;
        if self.btnOk1 ~= nil then self.btnOk1:destroy(); self.btnOk1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.btnCancel1 ~= nil then self.btnCancel1:destroy(); self.btnCancel1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSelColor = {
    newEditor = newfrmSelColor, 
    new = newfrmSelColor, 
    name = "frmSelColor", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmSelColor = _frmSelColor;
rrpg.registrarForm(_frmSelColor);

return _frmSelColor;
