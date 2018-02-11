require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBackpackItem()
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
    obj:setName("frmBackpackItem");

			
			local function askForDelete()
				dialogs.confirmYesNo("Deseja realmente apagar este item?",
									 function (confirmado)
										if confirmado then
											ndb.deleteNode(self.sheet);
										end;
									 end);
			end;

			


    obj.edtNome = gui.fromHandle(_obj_newObject("edit"));
    obj.edtNome:setParent(obj);
    obj.edtNome:setName("edtNome");
    obj.edtNome:setAlign("client");
    obj.edtNome:setField("nome");
    obj.edtNome:setMargins({left=4, right=4});
    obj.edtNome:setVertTextAlign("center");
    obj.edtNome:setFontSize(15);
    obj.edtNome:setFontColor("white");
    obj.edtNome:setTransparent(true);

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("Apagar");
    obj.button1:setAlign("right");
    obj.button1:setWidth(60);
    obj.button1:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button1:setName("button1");

self.height=32;


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edtNome ~= nil then self.edtNome:destroy(); self.edtNome = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBackpackItem = {
    newEditor = newfrmBackpackItem, 
    new = newfrmBackpackItem, 
    name = "frmBackpackItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBackpackItem = _frmBackpackItem;
rrpg.registrarForm(_frmBackpackItem);

return _frmBackpackItem;
