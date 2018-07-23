require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmConfigDice()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmConfigDice");
    obj:setTitle("Personalizar Dados");
    obj:setWidth(300);
    obj:setHeight(300);
    obj:setResizable(true);


		local DADOS = {"any", "d4", "d6", "d8", "d10", "d10cent", "d12", "d20", "fudge"};
	
		function self:podeEspecificarDados()
			return Firecast.getCurrentUser().isRuby;
		end;
	
		function self:updateSelectedDice()
			local nodeName = self.cmbCDice.value;
			local node = sheet[nodeName];
			
			if node == nil then	
				sheet[nodeName] = {};
				node = sheet[nodeName]; 
			end
			
			if nodeName ~= "any" and not self:podeEspecificarDados() then
				self.scbContent.node = nil;		
				self.scbContent.visible = false;
				self.layRubyOnly.visible = true;
			else	
				if node.bkgColor == nil then
					node.bkgColor = "#eec300ff";
				end;
				
				if node.faceColor == nil then
					node.faceColor = "black";
				end;
				
				if node.bkgType == nil then
					node.bkgType = "color";
				end;
			
				self.scbContent.node = node;		
				self.scbContent.visible = true;
				self.layRubyOnly.visible = false;
			end;		
		end;
	
		function self:configurarInterface() 
			self.title = lang("dice.title");
			self.labCDice.text = lang("dice.choosenDice");
			self.labRubyOnly.text = lang("dice.alert.customizationForRubyOnly");
			self.cbxCustomized.text = lang("dice.use.my.customization");
			self.labCorLetra.text = lang("dice.faceColor");
			self.labBkg.text = lang("dice.texture");
			self.rdbCorSolida.text = lang("dice.bkg.type.color");
			self.rdbImagem.text = lang("dice.bkg.type.image");
			self.labCorFundo.text = lang("dice.bkgColor");
			self.labImagem.text = lang("dice.image");
			
			local valores = {};
			local textos = {};
			
			for i = 1, #DADOS, 1 do
				valores[#valores + 1] = DADOS[i];
				textos[#textos + 1] = lang("dice." .. DADOS[i]);
			end;
			
			self.cmbCDice.items = textos;
			self.cmbCDice.values = valores;
			self.cmbCDice.value = "any";
			self:updateSelectedDice();
		end;
		
	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setMargins({top=5, bottom=5, left = 5, right = 5});
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("client");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setName("layout2");

    obj.labCDice = GUI.fromHandle(_obj_newObject("label"));
    obj.labCDice:setParent(obj.layout2);
    obj.labCDice:setName("labCDice");
    obj.labCDice:setAlign("left");
    obj.labCDice:setWordWrap(false);
    obj.labCDice:setText("Dado:");
    obj.labCDice:setMargins({right=10});
    obj.labCDice:setHorzTextAlign("trailing");
    obj.labCDice:setWidth(50);

    obj.cmbCDice = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbCDice:setParent(obj.layout2);
    obj.cmbCDice:setName("cmbCDice");
    obj.cmbCDice:setAlign("client");

    obj.scbContent = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.scbContent:setParent(obj.layout1);
    obj.scbContent:setName("scbContent");
    obj.scbContent:setAlign("client");
    obj.scbContent:setMargins({top=10, left=5, right=5});

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scbContent);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setName("layout3");

    obj.cbxCustomized = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxCustomized:setParent(obj.layout3);
    obj.cbxCustomized:setName("cbxCustomized");
    obj.cbxCustomized:setLeft(55);
    obj.cbxCustomized:setField("enabled");
    obj.cbxCustomized:setWidth(200);

    obj.layCustomization = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.layCustomization:setParent(obj.scbContent);
    obj.layCustomization:setName("layCustomization");
    obj.layCustomization:setAlign("client");
    obj.layCustomization:setVisible(false);
    obj.layCustomization:setMaxControlsPerLine(1);

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.layCustomization);
    obj.flowPart1:setAlign("top");
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setMaxWidth(9999);
    obj.flowPart1:setName("flowPart1");

    obj.labCorLetra = GUI.fromHandle(_obj_newObject("label"));
    obj.labCorLetra:setParent(obj.flowPart1);
    obj.labCorLetra:setName("labCorLetra");
    obj.labCorLetra:setWordWrap(false);
    obj.labCorLetra:setAlign("left");
    obj.labCorLetra:setWidth(130);
    obj.labCorLetra:setHorzTextAlign("trailing");
    obj.labCorLetra:setMargins({right=5});

    obj.colorComboBox1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox1:setParent(obj.flowPart1);
    obj.colorComboBox1:setAlign("client");
    obj.colorComboBox1:setField("faceColor");
    obj.colorComboBox1:setUseAlpha(false);
    obj.colorComboBox1:setName("colorComboBox1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.layCustomization);
    obj.flowPart2:setAlign("top");
    obj.flowPart2:setHeight(40);
    obj.flowPart2:setMargins({top=5});
    obj.flowPart2:setMaxWidth(9999);
    obj.flowPart2:setName("flowPart2");

    obj.labBkg = GUI.fromHandle(_obj_newObject("label"));
    obj.labBkg:setParent(obj.flowPart2);
    obj.labBkg:setName("labBkg");
    obj.labBkg:setWordWrap(false);
    obj.labBkg:setAlign("left");
    obj.labBkg:setWidth(130);
    obj.labBkg:setHorzTextAlign("trailing");
    obj.labBkg:setMargins({right=5});

    obj.layRadiosBkg = GUI.fromHandle(_obj_newObject("layout"));
    obj.layRadiosBkg:setParent(obj.flowPart2);
    obj.layRadiosBkg:setName("layRadiosBkg");
    obj.layRadiosBkg:setAlign("client");

    obj.rdbCorSolida = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.rdbCorSolida:setParent(obj.layRadiosBkg);
    obj.rdbCorSolida:setName("rdbCorSolida");
    obj.rdbCorSolida:setAlign("top");
    obj.rdbCorSolida:setField("bkgType");
    obj.rdbCorSolida:setFieldValue("color");

    obj.rdbImagem = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.rdbImagem:setParent(obj.layRadiosBkg);
    obj.rdbImagem:setName("rdbImagem");
    obj.rdbImagem:setAlign("top");
    obj.rdbImagem:setField("bkgType");
    obj.rdbImagem:setFieldValue("image");

    obj.layCorSolida = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.layCorSolida:setParent(obj.layCustomization);
    obj.layCorSolida:setName("layCorSolida");
    obj.layCorSolida:setAlign("top");
    obj.layCorSolida:setHeight(35);
    obj.layCorSolida:setMargins({top=5});
    obj.layCorSolida:setVisible(false);
    obj.layCorSolida:setMaxWidth(9999);

    obj.labCorFundo = GUI.fromHandle(_obj_newObject("label"));
    obj.labCorFundo:setParent(obj.layCorSolida);
    obj.labCorFundo:setName("labCorFundo");
    obj.labCorFundo:setWordWrap(false);
    obj.labCorFundo:setAlign("left");
    obj.labCorFundo:setWidth(130);
    obj.labCorFundo:setHorzTextAlign("trailing");
    obj.labCorFundo:setMargins({right=5});

    obj.colorComboBox2 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox2:setParent(obj.layCorSolida);
    obj.colorComboBox2:setAlign("client");
    obj.colorComboBox2:setField("bkgColor");
    obj.colorComboBox2:setUseAlpha(false);
    obj.colorComboBox2:setName("colorComboBox2");

    obj.layImagem = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.layImagem:setParent(obj.layCustomization);
    obj.layImagem:setName("layImagem");
    obj.layImagem:setAlign("top");
    obj.layImagem:setHeight(90);
    obj.layImagem:setMargins({top=5});
    obj.layImagem:setVisible(false);
    obj.layImagem:setMaxWidth(9999);

    obj.labImagem = GUI.fromHandle(_obj_newObject("label"));
    obj.labImagem:setParent(obj.layImagem);
    obj.labImagem:setName("labImagem");
    obj.labImagem:setWordWrap(false);
    obj.labImagem:setAlign("left");
    obj.labImagem:setWidth(130);
    obj.labImagem:setHorzTextAlign("trailing");
    obj.labImagem:setMargins({right=5});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layImagem);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("null");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setAlign("client");
    obj.image1:setField("imageURL");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");


				function self:mostrarBkgType()
					local bkgType = self.scbContent.node.bkgType;
					
					if bkgType == "color" then
						self.layCorSolida.visible = true;
						self.layImagem.visible = false;
					elseif bkgType == "image" then
						self.layImagem.visible = true;					
						self.layCorSolida.visible = false;
					else
						self.layCorSolida.visible = false;
						self.layImagem.visible = false;					
					end;
					
					self.layCustomization:needRealign();
				end;
			


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scbContent);
    obj.dataLink1:setField("enabled");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scbContent);
    obj.dataLink2:setField("bkgType");
    obj.dataLink2:setName("dataLink2");

    obj.layRubyOnly = GUI.fromHandle(_obj_newObject("layout"));
    obj.layRubyOnly:setParent(obj.layout1);
    obj.layRubyOnly:setName("layRubyOnly");
    obj.layRubyOnly:setAlign("client");
    obj.layRubyOnly:setVisible(false);

    obj.labRubyOnly = GUI.fromHandle(_obj_newObject("label"));
    obj.labRubyOnly:setParent(obj.layRubyOnly);
    obj.labRubyOnly:setName("labRubyOnly");
    obj.labRubyOnly:setAlign("client");
    obj.labRubyOnly:setHorzTextAlign("center");
    obj.labRubyOnly:setVertTextAlign("center");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj);
    obj.layout4:setName("layout4");
    obj.layout4:setAlign("bottom");
    obj.layout4:setMargins({top=2, bottom=2});
    obj.layout4:setHeight(40);

    obj.btnFechar1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnFechar1:setParent(obj.layout4);
    obj.btnFechar1:setName("btnFechar1");
    obj.btnFechar1:setText("");
    obj.btnFechar1:setHorzTextAlign("center");
    obj.btnFechar1:setAlign("right");
    obj.btnFechar1:setWidth(100);
    obj.btnFechar1:setMargins({left=4, right=4});

self.btnFechar1.text = lang('fc.BottomClosePopupPanel.close');


    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            self:configurarInterface();
        end, obj);

    obj._e_event1 = obj.cmbCDice:addEventListener("onChange",
        function (_)
            self:updateSelectedDice()
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.layCustomization.visible = self.scbContent.node.enabled;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self:mostrarBkgType();
        end, obj);

    obj._e_event4 = obj.btnFechar1:addEventListener("onClick",
        function (_)
            GUI.closePopup(self);
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

        if self.labCDice ~= nil then self.labCDice:destroy(); self.labCDice = nil; end;
        if self.labImagem ~= nil then self.labImagem:destroy(); self.labImagem = nil; end;
        if self.labCorLetra ~= nil then self.labCorLetra:destroy(); self.labCorLetra = nil; end;
        if self.layCorSolida ~= nil then self.layCorSolida:destroy(); self.layCorSolida = nil; end;
        if self.labCorFundo ~= nil then self.labCorFundo:destroy(); self.labCorFundo = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.cmbCDice ~= nil then self.cmbCDice:destroy(); self.cmbCDice = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rdbImagem ~= nil then self.rdbImagem:destroy(); self.rdbImagem = nil; end;
        if self.cbxCustomized ~= nil then self.cbxCustomized:destroy(); self.cbxCustomized = nil; end;
        if self.labBkg ~= nil then self.labBkg:destroy(); self.labBkg = nil; end;
        if self.layRubyOnly ~= nil then self.layRubyOnly:destroy(); self.layRubyOnly = nil; end;
        if self.rdbCorSolida ~= nil then self.rdbCorSolida:destroy(); self.rdbCorSolida = nil; end;
        if self.layImagem ~= nil then self.layImagem:destroy(); self.layImagem = nil; end;
        if self.layCustomization ~= nil then self.layCustomization:destroy(); self.layCustomization = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layRadiosBkg ~= nil then self.layRadiosBkg:destroy(); self.layRadiosBkg = nil; end;
        if self.colorComboBox2 ~= nil then self.colorComboBox2:destroy(); self.colorComboBox2 = nil; end;
        if self.labRubyOnly ~= nil then self.labRubyOnly:destroy(); self.labRubyOnly = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.scbContent ~= nil then self.scbContent:destroy(); self.scbContent = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.btnFechar1 ~= nil then self.btnFechar1:destroy(); self.btnFechar1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.colorComboBox1 ~= nil then self.colorComboBox1:destroy(); self.colorComboBox1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmConfigDice()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmConfigDice();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmConfigDice = {
    newEditor = newfrmConfigDice, 
    new = newfrmConfigDice, 
    name = "frmConfigDice", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Personalizar Dados", 
    description=""};

frmConfigDice = _frmConfigDice;
Firecast.registrarForm(_frmConfigDice);

return _frmConfigDice;
