require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasMagia()
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
    obj:setName("frmMagiasMagia");
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
    obj.edit1:setAlign("right");
    obj.edit1:setWidth(25);
    obj.edit1:setField("dispMagia");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(25);
    obj.edit2:setField("prepMagia");
    obj.edit2:setName("edit2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("right");
    obj.rectangle1:setWidth(25);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setField("cd");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(12);
    obj.label1:setName("label1");

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

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nomeMagia");
    obj.edit3:setName("edit3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'dispMagia','prepMagia'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'nomeMagia','myCD','updateCD'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showMagiaPopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onUserChange",
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

    obj._e_event3 = obj.dataLink2:addEventListener("onUserChange",
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasMagia = {
    newEditor = newfrmMagiasMagia, 
    new = newfrmMagiasMagia, 
    name = "frmMagiasMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasMagia = _frmMagiasMagia;
Firecast.registrarForm(_frmMagiasMagia);

return _frmMagiasMagia;
