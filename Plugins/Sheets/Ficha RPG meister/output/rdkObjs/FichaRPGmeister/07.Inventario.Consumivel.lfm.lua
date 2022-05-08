require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmConsumiveis()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmConsumiveis");
    obj:setHeight(25);
    obj:setWidth(285);
    obj:setMargins({top=2,bottom=2});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse item?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showItemPopup()
			local pop = self:findControlByName("popItem");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("left", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de items para exibir");
			end;				
		end;

		local function use()
			local mesa = Firecast.getMesaDe(sheet);

			local texto = (sheet.nome or "Item") .. " foi usado.";
			if sheet.cd~=nil then
				texto = texto .. " CD: " .. sheet.cd .. ".";
			end;
			
			if sheet.dados~=nil then
				local rolagem = Firecast.interpretarRolagem(sheet.dados);
				
				mesa.activeChat:rolarDados(rolagem, texto);
			end;

			if sheet.BarrinhaValor~=nil then
				sheet.BarrinhaValor = tonumber(sheet.BarrinhaValor) - 1;

				if sheet.dados==nil then
					mesa.activeChat:enviarMensagem(texto);
				end;
			end;
		end;

		local function itemPrice()
			if sheet~= nil then
				local node = NDB.getRoot(sheet);
				local precoItens = 0;
				local nodes = NDB.getChildNodes(node.itensConsumiveis); 
				for i=1, #nodes, 1 do
					precoItens = precoItens + (tonumber(nodes[i].preco) or 0);
				end
				node.precoItens = precoItens;
			end;
		end;
		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#333333");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(50);
    obj.button1:setText("Usar");
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(100);
    obj.label1:setField("nome");
    obj.label1:setName("label1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(75);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setTop(5);
    obj.layout2:setHeight(15);
    obj.layout2:setWidth(45);
    obj.layout2:setName("layout2");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout2);
    obj.imageCheckBox1:setAlign("client");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.Barrinha = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha:setParent(obj.imageCheckBox1);
    obj.Barrinha:setColorMode("hl");
    obj.Barrinha:setWidth(45);
    obj.Barrinha:setHeight(15);
    obj.Barrinha:setMargins({top=5,bottom=5});
    obj.Barrinha:setHitTest(true);
    obj.Barrinha:setMouseGlow(true);
    obj.Barrinha:setColor("Red");
    obj.Barrinha:setName("Barrinha");
    obj.Barrinha:setField("BarrinhaValor");
    obj.Barrinha:setFieldMax("BarrinhaValorMax");

    obj.ValoresBarrinha = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha:setParent(obj.layout1);
    obj.ValoresBarrinha:setLeft(45);
    obj.ValoresBarrinha:setTop(5);
    obj.ValoresBarrinha:setHeight(15);
    obj.ValoresBarrinha:setWidth(30);
    obj.ValoresBarrinha:setMargins({top=5,bottom=5});
    obj.ValoresBarrinha:setVisible(false);
    obj.ValoresBarrinha:setName("ValoresBarrinha");

    obj.CorBarrinha = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha:setParent(obj.ValoresBarrinha);
    obj.CorBarrinha:setAlign("client");
    obj.CorBarrinha:setXradius(2);
    obj.CorBarrinha:setYradius(2);
    obj.CorBarrinha:setName("CorBarrinha");
    obj.CorBarrinha:setColor("Green");

    obj.InfoBarrinha = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha:setParent(obj.CorBarrinha);
    obj.InfoBarrinha:setAlign("left");
    obj.InfoBarrinha:setFontColor("white");
    obj.InfoBarrinha:setFontSize(10);
    obj.InfoBarrinha:setAutoSize(true);
    obj.InfoBarrinha:setTextTrimming("none");
    obj.InfoBarrinha:setWordWrap(false);
    obj.InfoBarrinha:setName("InfoBarrinha");
    obj.InfoBarrinha:setField("InfoBarrinha");
    obj.InfoBarrinha:setHorzTextAlign("center");
    obj.InfoBarrinha:setText("0/0");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("CorBarrinha");
    obj.dataLink1:setDefaultValue("Green");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("BarrinhaValor");
    obj.dataLink2:setName("dataLink2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("right");
    obj.button2:setText("i");
    obj.button2:setWidth(25);
    obj.button2:setMargins({right=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setAlign("right");
    obj.button3:setText("X");
    obj.button3:setWidth(25);
    obj.button3:setName("button3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'preco'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj:addEventListener("onMouseEnter",
        function (_)
            self.background.color = "#444444";
        end, obj);

    obj._e_event1 = obj:addEventListener("onMouseLeave",
        function (_)
            self.background.color = "#333333";
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            use();
        end, obj);

    obj._e_event3 = obj.Barrinha:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha.color = "Green";
            							self.ValoresBarrinha.visible = true;
            							sheet.InfoBarrinha = (sheet.BarrinhaValor or 0) .. "/"	.. (sheet.BarrinhaValorMax or 0);
        end, obj);

    obj._e_event4 = obj.Barrinha:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha.visible = false;
        end, obj);

    obj._e_event5 = obj.Barrinha:addEventListener("onDblClick",
        function (_)
            sheet.BarrinhaID = sheet.index;
            							sheet.AtributoBarrinha = sheet.nome;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.BarrinhaValor;
            							sheet.ValorTempMaxBarrinha = sheet.BarrinhaValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.BarrinhaValor;
            							sheet.ValorMudadoMaxBarrinha = sheet.BarrinhaValorMax;
            
            							local rec = self:findControlByName("PopupBarColor");
            							if rec~=nil then rec.color = "Green" end;
            							
            							local pop = self:findControlByName("BarPopup");
            							if pop~= nil then
            								pop.scopeNode = sheet;
            								pop:show("top", self.Barrinha);
            								pop.top = (pop.top + 29 + 10);
            							end;
        end, obj);

    obj._e_event6 = obj.InfoBarrinha:addEventListener("onResize",
        function (_)
            self.InfoBarrinha.width = (self.ValoresBarrinha.width - 4);
        end, obj);

    obj._e_event7 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            self.Barrinha.color = "Green";
        end, obj);

    obj._e_event8 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.BarrinhaValor==nil then return end;
            					if sheet.BarrinhaValor==0 then 
            						self.Barrinha.color = "Yellow";
            					else
            						self.Barrinha.color = "Green";
            					end;
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            showItemPopup()
        end, obj);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (_)
            askForDelete()
        end, obj);

    obj._e_event11 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            itemPrice()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
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

        if self.Barrinha ~= nil then self.Barrinha:destroy(); self.Barrinha = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.CorBarrinha ~= nil then self.CorBarrinha:destroy(); self.CorBarrinha = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.InfoBarrinha ~= nil then self.InfoBarrinha:destroy(); self.InfoBarrinha = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.ValoresBarrinha ~= nil then self.ValoresBarrinha:destroy(); self.ValoresBarrinha = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmConsumiveis()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmConsumiveis();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmConsumiveis = {
    newEditor = newfrmConsumiveis, 
    new = newfrmConsumiveis, 
    name = "frmConsumiveis", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmConsumiveis = _frmConsumiveis;
Firecast.registrarForm(_frmConsumiveis);

return _frmConsumiveis;
