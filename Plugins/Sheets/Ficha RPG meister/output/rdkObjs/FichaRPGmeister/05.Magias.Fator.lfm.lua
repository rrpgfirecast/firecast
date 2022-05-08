require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFator()
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
    obj:setName("frmFator");
    obj:setWidth(225);
    obj:setHeight(25);
    obj:setMargins({top=1});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse fator?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
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
    obj.edit1:setWidth(150);
    obj.edit1:setField("fator");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setField("custo");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'custo','mult'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end;
            
            			local pai = NDB.getParent(sheet);
            			local avo = NDB.getParent(pai);
            			local cd = 0;
            			local mitigation = 0;
            			local mult = 1;
            			
            			local nodes = NDB.getChildNodes(pai); 
            			for i=1, #nodes, 1 do
            				local custo = nodes[i].custo or "";
            				local tipo = string.sub(custo, 1, 1);
            				local value = string.sub(custo, 2);
            				if tipo=="-" then
            					mitigation = mitigation + (tonumber(value) or 0);
            				elseif tipo=="x" then
            					mult = mult + (tonumber(value) or 1) -1;
            				else
            					cd = cd + (tonumber(custo) or 0); 
            				end;
            			end
            
            			local idMagia = cd * mult - mitigation;
            			avo.idMagia = idMagia;
            			avo.mult = mult;
            			avo.po = idMagia * 9000;
            			avo.xp = idMagia * 360;
            
            			local rcl = self:findControlByName("rclFactors");
            			if rcl then rcl:sort() end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFator()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFator();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFator = {
    newEditor = newfrmFator, 
    new = newfrmFator, 
    name = "frmFator", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFator = _frmFator;
Firecast.registrarForm(_frmFator);

return _frmFator;
