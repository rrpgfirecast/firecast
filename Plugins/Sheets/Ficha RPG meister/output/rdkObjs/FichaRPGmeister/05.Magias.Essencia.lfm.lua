require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasEssencia()
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
    obj:setName("frmMagiasEssencia");
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
    obj.edit1:setField("essence_1");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(25);
    obj.edit2:setField("essence_2");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setAlign("right");
    obj.edit3:setWidth(25);
    obj.edit3:setField("essence_3");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setAlign("right");
    obj.edit4:setWidth(25);
    obj.edit4:setField("essence_4");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setAlign("right");
    obj.edit5:setWidth(25);
    obj.edit5:setField("essence_5");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setAlign("right");
    obj.edit6:setWidth(25);
    obj.edit6:setField("essence_6");
    obj.edit6:setName("edit6");

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

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setAlign("client");
    obj.edit7:setField("nomeMagia");
    obj.edit7:setName("edit7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'nomeMagia','myCD','updateCD'});
    obj.dataLink1:setName("dataLink1");

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
            				if node.campoDasEssencias1 == myRCLfield then sheet.id = 1
            				elseif node.campoDasEssencias2 == myRCLfield then sheet.id = 2
            				elseif node.campoDasEssencias3 == myRCLfield then sheet.id = 3
            				elseif node.campoDasEssencias4 == myRCLfield then sheet.id = 4
            				elseif node.campoDasEssencias5 == myRCLfield then sheet.id = 5
            				elseif node.campoDasEssencias6 == myRCLfield then sheet.id = 6
            				elseif node.campoDasEssencias7 == myRCLfield then sheet.id = 7
            				elseif node.campoDasEssencias8 == myRCLfield then sheet.id = 8
            				elseif node.campoDasEssencias9 == myRCLfield then sheet.id = 9
            				elseif node.campoDasEssencias10 == myRCLfield then sheet.id = 10
            				elseif node.campoDasEssencias11 == myRCLfield then sheet.id = 11
            				elseif node.campoDasEssencias12 == myRCLfield then sheet.id = 12
            				elseif node.campoDasEssencias13 == myRCLfield then sheet.id = 13
            				elseif node.campoDasEssencias14 == myRCLfield then sheet.id = 14
            				elseif node.campoDasEssencias15 == myRCLfield then sheet.id = 15
            				elseif node.campoDasEssencias16 == myRCLfield then sheet.id = 16
            				elseif node.campoDasEssencias17 == myRCLfield then sheet.id = 17
            				elseif node.campoDasEssencias18 == myRCLfield then sheet.id = 18
            				elseif node.campoDasEssencias19 == myRCLfield then sheet.id = 19 end;
            				id = sheet.id;
            
            				if id==nil then return end;
            			end;
            
            			local baseCD = tonumber(node["cd" .. id]) or 10;
            			local ajustCD = tonumber(node.cd) or 0;
            			local myCD = tonumber(sheet.myCD) or 0;
            
            			sheet.cd = baseCD + ajustCD + myCD;
        end, obj);

    function obj:_releaseEvents()
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
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasEssencia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasEssencia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasEssencia = {
    newEditor = newfrmMagiasEssencia, 
    new = newfrmMagiasEssencia, 
    name = "frmMagiasEssencia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasEssencia = _frmMagiasEssencia;
Firecast.registrarForm(_frmMagiasEssencia);

return _frmMagiasEssencia;
