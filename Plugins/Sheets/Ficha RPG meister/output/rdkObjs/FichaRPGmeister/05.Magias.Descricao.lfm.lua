require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister5D_svg()
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
    obj:setName("frmFichaRPGmeister5D_svg");
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
		


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(1);
    obj.edit1:setWidth(140);
    obj.edit1:setHeight(23);
    obj.edit1:setField("nomeMagia");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(140);
    obj.edit2:setTop(1);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(23);
    obj.edit2:setField("dispMagia");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(170);
    obj.edit3:setTop(1);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(23);
    obj.edit3:setField("prepMagia");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(200);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(225);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj._e_event0 = obj.edit2:addEventListener("onUserChange",
        function (_)
            local rcl = self:findControlByName("rclListaDasMagias0");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias1");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias2");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias3");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias4");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias5");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias6");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias7");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias8");
            			if rcl~= nil then
            				rcl:sort();
            			end;
            			rcl = self:findControlByName("rclListaDasMagias9");
            			if rcl~= nil then
            				rcl:sort();
            			end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            showMagiaPopup();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
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
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister5D_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister5D_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister5D_svg = {
    newEditor = newfrmFichaRPGmeister5D_svg, 
    new = newfrmFichaRPGmeister5D_svg, 
    name = "frmFichaRPGmeister5D_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister5D_svg = _frmFichaRPGmeister5D_svg;
Firecast.registrarForm(_frmFichaRPGmeister5D_svg);

return _frmFichaRPGmeister5D_svg;
