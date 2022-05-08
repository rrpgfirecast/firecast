require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister3i_svg()
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
    obj:setName("frmFichaRPGmeister3i_svg");
    obj:setWidth(290);
    obj:setHeight(25);
    obj:setMargins({top=2, bottom=2, right=10});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse idioma?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showIdiomaPopup()
			local pop = self:findControlByName("popIdioma");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottom", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de idiomas para exibir");
			end;				
		end;

		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(110);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nomeIdioma");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(110);
    obj.edit2:setHeight(25);
    obj.edit2:setField("alfabetoIdioma");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(220);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(245);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj._e_event0 = obj.edit1:addEventListener("onUserChange",
        function (_)
            local rcl = self:findControlByName("rclListaDosIdiomas");
            			if rcl~= nil then
            				rcl:sort();
            			end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            showIdiomaPopup();
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

        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister3i_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister3i_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister3i_svg = {
    newEditor = newfrmFichaRPGmeister3i_svg, 
    new = newfrmFichaRPGmeister3i_svg, 
    name = "frmFichaRPGmeister3i_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister3i_svg = _frmFichaRPGmeister3i_svg;
Firecast.registrarForm(_frmFichaRPGmeister3i_svg);

return _frmFichaRPGmeister3i_svg;
