require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciarSimpleMacrosItem()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmGerenciarSimpleMacrosItem");
    obj:setTitle("Gerenciar Plugins");
    obj:setHeight(30);
    obj:setMargins({left=4, right=4, top=1, bottom=1});


		local function editarMacro()
			local frm = self:findControlByName("frmGerenciarSimpleMacros");
			
			if frm ~= nil then
				frm.editarMacroNode(sheet);
			end;
		end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({top=2, left=2});
    obj.layout1:setName("layout1");

    obj.labMacro = gui.fromHandle(_obj_newObject("label"));
    obj.labMacro:setParent(obj.layout1);
    obj.labMacro:setName("labMacro");
    obj.labMacro:setAlign("client");
    obj.labMacro:setText("(Macro Vazia)");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("Editar...");
    obj.button1:setMargins({left=4, right=4, top=1, bottom=1});
    obj.button1:setWidth(75);
    obj.button1:setName("button1");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setMargins({top=2});
    obj.horzLine1:setName("horzLine1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("macro");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            editarMacro();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.labMacro.text = sheet.macro or "(Macro Vazia)";
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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.labMacro ~= nil then self.labMacro:destroy(); self.labMacro = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciarSimpleMacrosItem = {
    newEditor = newfrmGerenciarSimpleMacrosItem, 
    new = newfrmGerenciarSimpleMacrosItem, 
    name = "frmGerenciarSimpleMacrosItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "Gerenciar Plugins", 
    description=""};

frmGerenciarSimpleMacrosItem = _frmGerenciarSimpleMacrosItem;
rrpg.registrarForm(_frmGerenciarSimpleMacrosItem);

return _frmGerenciarSimpleMacrosItem;
