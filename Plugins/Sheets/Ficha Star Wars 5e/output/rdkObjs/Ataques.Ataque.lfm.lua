require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAtaque()
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
    obj:setName("frmAtaque");
    obj:setHeight(40);
    obj:setWidth(450);
    obj:setMargins({top=2});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showHabilidadePopup()
			local pop = self:findControlByName("popHabilidade");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("right", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de habilidades para exibir");
			end;				
		end;
		


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(350);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("right");
    obj.button2:setWidth(25);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(75);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setAlign("top");
    obj.label1:setHeight(15);
    obj.label1:setFontSize(10);
    obj.label1:setText("Ataque");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("bottom");
    obj.edit1:setHeight(25);
    obj.edit1:setField("ataque");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(75);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setAlign("top");
    obj.label2:setHeight(15);
    obj.label2:setFontSize(10);
    obj.label2:setText("Dano");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("bottom");
    obj.edit2:setHeight(25);
    obj.edit2:setField("dano");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(50);
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setAlign("top");
    obj.label3:setHeight(15);
    obj.label3:setFontSize(10);
    obj.label3:setText("Alcance");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setAlign("bottom");
    obj.edit3:setHeight(25);
    obj.edit3:setField("alcance");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(50);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setAlign("top");
    obj.label4:setHeight(15);
    obj.label4:setFontSize(10);
    obj.label4:setText("Peso");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setAlign("bottom");
    obj.edit4:setHeight(25);
    obj.edit4:setField("peso");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(50);
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setTop(5);
    obj.layout7:setHeight(15);
    obj.layout7:setWidth(45);
    obj.layout7:setName("layout7");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout7);
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
    obj.ValoresBarrinha:setParent(obj.layout6);
    obj.ValoresBarrinha:setLeft(0);
    obj.ValoresBarrinha:setTop(20);
    obj.ValoresBarrinha:setHeight(15);
    obj.ValoresBarrinha:setWidth(45);
    obj.ValoresBarrinha:setMargins({top=5,bottom=5});
    obj.ValoresBarrinha:setVisible(false);
    obj.ValoresBarrinha:setName("ValoresBarrinha");

    obj.CorBarrinha = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha:setParent(obj.ValoresBarrinha);
    obj.CorBarrinha:setAlign("client");
    obj.CorBarrinha:setXradius(2);
    obj.CorBarrinha:setYradius(2);
    obj.CorBarrinha:setName("CorBarrinha");
    obj.CorBarrinha:setColor("Red");

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
    obj.dataLink1:setParent(obj.layout6);
    obj.dataLink1:setField("CorBarrinha");
    obj.dataLink1:setDefaultValue("Red");
    obj.dataLink1:setName("dataLink1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj);
    obj.layout8:setAlign("client");
    obj.layout8:setWidth(100);
    obj.layout8:setName("layout8");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setAlign("top");
    obj.label5:setHeight(15);
    obj.label5:setFontSize(10);
    obj.label5:setText("Arma");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setAlign("bottom");
    obj.edit5:setHeight(25);
    obj.edit5:setField("arma");
    obj.edit5:setName("edit5");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showHabilidadePopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.Barrinha:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha.color = "Red";
            							self.ValoresBarrinha.visible = true;
            							sheet.InfoBarrinha = (sheet.BarrinhaValor or 0) .. "/"	.. (sheet.BarrinhaValorMax or 0);
        end, obj);

    obj._e_event3 = obj.Barrinha:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha.visible = false;
        end, obj);

    obj._e_event4 = obj.Barrinha:addEventListener("onDblClick",
        function (_)
            sheet.BarrinhaID = sheet.index;
            							sheet.AtributoBarrinha = sheet.arma;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.BarrinhaValor;
            							sheet.ValorTempMaxBarrinha = sheet.BarrinhaValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.BarrinhaValor;
            							sheet.ValorMudadoMaxBarrinha = sheet.BarrinhaValorMax;
            
            							local rec = self:findControlByName("PopupBarColor");
            							if rec~=nil then rec.color = "Red" end;
            							
            							local pop = self:findControlByName("BarPopup");
            							if pop~= nil then
            								pop.scopeNode = sheet;
            								pop:show("top", self.Barrinha);
            								pop.top = (pop.top + 29 + 10);
            							end;
        end, obj);

    obj._e_event5 = obj.InfoBarrinha:addEventListener("onResize",
        function (_)
            self.InfoBarrinha.width = (self.ValoresBarrinha.width - 4);
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha.color = "Red";
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.CorBarrinha ~= nil then self.CorBarrinha:destroy(); self.CorBarrinha = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.Barrinha ~= nil then self.Barrinha:destroy(); self.Barrinha = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.InfoBarrinha ~= nil then self.InfoBarrinha:destroy(); self.InfoBarrinha = nil; end;
        if self.ValoresBarrinha ~= nil then self.ValoresBarrinha:destroy(); self.ValoresBarrinha = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAtaque()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAtaque();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAtaque = {
    newEditor = newfrmAtaque, 
    new = newfrmAtaque, 
    name = "frmAtaque", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAtaque = _frmAtaque;
Firecast.registrarForm(_frmAtaque);

return _frmAtaque;
