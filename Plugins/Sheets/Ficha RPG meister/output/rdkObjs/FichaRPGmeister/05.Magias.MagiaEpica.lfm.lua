require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasMagiaEpica()
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
    obj:setName("frmMagiasMagiaEpica");
    obj:setWidth(400);
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
			local pop = self:findControlByName("popMagiaEpica");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de magia épica para exibir");
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
    obj.label1:setField("idMagia");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(12);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("right");
    obj.edit1:setWidth(25);
    obj.edit1:setField("used");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setAlign("right");
    obj.rectangle2:setWidth(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setAlign("client");
    obj.label2:setField("cd");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(12);
    obj.label2:setName("label2");

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

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("client");
    obj.edit2:setField("nomeMagia");
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'myCD', 'atr', 'cdExtra'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'used'});
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
            local cd = (tonumber(sheet.myCD) or 0) +
            						(tonumber(sheet.cdExtra) or 0) + 
            						(tonumber(sheet.atr) or 0) + 20;
            			sheet.cd = cd;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end;
            
            			local pai = NDB.getParent(sheet);
            			local avo = NDB.getParent(pai);
            
            			local used = 0;
            			local nodes = NDB.getChildNodes(pai); 
            			for i=1, #nodes, 1 do
            				used = used + (tonumber(nodes[i].used) or 0);
            			end;
            
            			avo.usedEpic = used;
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasMagiaEpica()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasMagiaEpica();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasMagiaEpica = {
    newEditor = newfrmMagiasMagiaEpica, 
    new = newfrmMagiasMagiaEpica, 
    name = "frmMagiasMagiaEpica", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasMagiaEpica = _frmMagiasMagiaEpica;
Firecast.registrarForm(_frmMagiasMagiaEpica);

return _frmMagiasMagiaEpica;
