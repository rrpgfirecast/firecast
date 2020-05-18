require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasFoco()
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
    obj:setName("frmMagiasFoco");
    obj:setWidth(250);
    obj:setHeight(25);
    obj:setMargins({top=1});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa magia?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showMagiaPopup()
			local pop = self:findControlByName("popMagia");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de magia para exibir");
			end;				
		end;

		local function write(str)
            local mesa = Firecast.getMesaDe(sheet);
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;
		


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(25);
    obj.edit1:setField("nivelHabilidade");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setWidth(25);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("right");
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
    obj.Barrinha:setColor("Green");
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

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("client");
    obj.edit2:setField("nomeMagia");
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'dispMagia','prepMagia'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'nomeMagia','myCD','updateCD'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showMagiaPopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.Barrinha:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha.color = "Green";
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
            						sheet.AtributoBarrinha = sheet.nomeMagia;
            						
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

    obj._e_event5 = obj.InfoBarrinha:addEventListener("onResize",
        function (_)
            self.InfoBarrinha.width = (self.ValoresBarrinha.width - 4);
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha.color = "Green";
        end, obj);

    obj._e_event7 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local id = sheet.id;
            			local box = self:findControlByName("boxDetalhesDaMagia");
            			local node = box.node;
            
            			if node == nil then return end;
            
            			-- Since last version did not store the id we will need to find it in old sheets.
            			if id==nil then 
            				local myRCLfield = NDB.getParent(sheet);
            				if node.campoDasMagias0 == myRCLfield then sheet.id = 0
            				elseif node.campoDasMagias1 == myRCLfield then sheet.id = 1
            				elseif node.campoDasMagias2 == myRCLfield then sheet.id = 2
            				elseif node.campoDasMagias3 == myRCLfield then sheet.id = 3
            				elseif node.campoDasMagias4 == myRCLfield then sheet.id = 4
            				elseif node.campoDasMagias5 == myRCLfield then sheet.id = 5
            				elseif node.campoDasMagias6 == myRCLfield then sheet.id = 6
            				elseif node.campoDasMagias7 == myRCLfield then sheet.id = 7
            				elseif node.campoDasMagias8 == myRCLfield then sheet.id = 8
            				elseif node.campoDasMagias9 == myRCLfield then sheet.id = 9
            				elseif node.campoDasMagias10 == myRCLfield then sheet.id = 10
            				elseif node.campoDasMagias11 == myRCLfield then sheet.id = 11
            				elseif node.campoDasMagias12 == myRCLfield then sheet.id = 12
            				elseif node.campoDasMagias13 == myRCLfield then sheet.id = 13
            				elseif node.campoDasMagias14 == myRCLfield then sheet.id = 14
            				elseif node.campoDasMagias15 == myRCLfield then sheet.id = 15
            				elseif node.campoDasMagias16 == myRCLfield then sheet.id = 16
            				elseif node.campoDasMagias17 == myRCLfield then sheet.id = 17
            				elseif node.campoDasMagias18 == myRCLfield then sheet.id = 18
            				elseif node.campoDasMagias19 == myRCLfield then sheet.id = 19 end;
            				id = sheet.id;
            
            				if id==nil then return end;
            			end;
            
            			-- sort list
            			local rcl = self:findControlByName("rclmagicList" .. id);
            			if rcl~= nil then
            				rcl:sort();
            			end;
            
            			-- calculate sum os prepared and used
            
            			local preparadas = 0;
            			local usadas = 0;
            			local nodes = NDB.getChildNodes(node["campoDasMagias" .. id]); 
            			for i=1, #nodes, 1 do
            				preparadas = preparadas + (tonumber(nodes[i].dispMagia) or 0);
            				usadas = usadas + (tonumber(nodes[i].prepMagia) or 0);
            			end
            			node["prep" .. id] = preparadas;
            			node["used" .. id] = usadas;
        end, obj);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local id = sheet.id;
            			local box = self:findControlByName("boxDetalhesDaMagia");
            			local node = box.node;
            
            			if node == nil then return end;
            
            			-- Since last version did not store the id we will need to find it in old sheets.
            			if id==nil then 
            				local myRCLfield = NDB.getParent(sheet);
            				if node.campoDasMagias0 == myRCLfield then sheet.id = 0
            				elseif node.campoDasMagias1 == myRCLfield then sheet.id = 1
            				elseif node.campoDasMagias2 == myRCLfield then sheet.id = 2
            				elseif node.campoDasMagias3 == myRCLfield then sheet.id = 3
            				elseif node.campoDasMagias4 == myRCLfield then sheet.id = 4
            				elseif node.campoDasMagias5 == myRCLfield then sheet.id = 5
            				elseif node.campoDasMagias6 == myRCLfield then sheet.id = 6
            				elseif node.campoDasMagias7 == myRCLfield then sheet.id = 7
            				elseif node.campoDasMagias8 == myRCLfield then sheet.id = 8
            				elseif node.campoDasMagias9 == myRCLfield then sheet.id = 9
            				elseif node.campoDasMagias10 == myRCLfield then sheet.id = 10
            				elseif node.campoDasMagias11 == myRCLfield then sheet.id = 11
            				elseif node.campoDasMagias12 == myRCLfield then sheet.id = 12
            				elseif node.campoDasMagias13 == myRCLfield then sheet.id = 13
            				elseif node.campoDasMagias14 == myRCLfield then sheet.id = 14
            				elseif node.campoDasMagias15 == myRCLfield then sheet.id = 15
            				elseif node.campoDasMagias16 == myRCLfield then sheet.id = 16
            				elseif node.campoDasMagias17 == myRCLfield then sheet.id = 17
            				elseif node.campoDasMagias18 == myRCLfield then sheet.id = 18
            				elseif node.campoDasMagias19 == myRCLfield then sheet.id = 19 end;
            				id = sheet.id;
            
            				if id==nil then return end;
            			end;
            
            			local baseCD = tonumber(node["cd" .. id]) or 10;
            			local ajustCD = tonumber(node.cd) or 0;
            			local myCD = tonumber(sheet.myCD) or 0;
            
            			sheet.cd = baseCD + ajustCD + myCD;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.CorBarrinha ~= nil then self.CorBarrinha:destroy(); self.CorBarrinha = nil; end;
        if self.InfoBarrinha ~= nil then self.InfoBarrinha:destroy(); self.InfoBarrinha = nil; end;
        if self.ValoresBarrinha ~= nil then self.ValoresBarrinha:destroy(); self.ValoresBarrinha = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.Barrinha ~= nil then self.Barrinha:destroy(); self.Barrinha = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasFoco()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasFoco();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasFoco = {
    newEditor = newfrmMagiasFoco, 
    new = newfrmMagiasFoco, 
    name = "frmMagiasFoco", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasFoco = _frmMagiasFoco;
Firecast.registrarForm(_frmMagiasFoco);

return _frmMagiasFoco;
