require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMagiaItemComCheckbox()
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
    obj:setName("frmMagiaItemComCheckbox");

			
			local function askForDelete()
				dialogs.confirmYesNo("Deseja realmente apagar este item?",
									 function (confirmado)
										if confirmado then
											ndb.deleteNode(self.sheet);
										end;
									 end);
			end;

			local function showMagiaPopup()
				local pop = self:findControlByName("popMagia");
					
				if pop ~= nil then
					pop:setNodeObject(self.sheet);
					pop:showPopupEx("bottomCenter", self.edtNome);
				else
					showMessage("Ops, bug.. nao encontrei o popup de magia para exibir");
				end;				
			end;
			


    obj.imageCheckBox1 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setMargins({});
    obj.imageCheckBox1:setField("marcacao");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.edtNome = gui.fromHandle(_obj_newObject("edit"));
    obj.edtNome:setParent(obj.layout1);
    obj.edtNome:setName("edtNome");
    obj.edtNome:setAlign("client");
    obj.edtNome:setField("nome");
    obj.edtNome:setMargins({left=4, right=4});
    obj.edtNome:setVertTextAlign("center");
    obj.edtNome:setFontSize(15);
    obj.edtNome:setFontColor("white");
    obj.edtNome:setTransparent(true);

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("i");
    obj.button1:setAlign("right");
    obj.button1:setWidth(32);
    obj.button1:setMargins({left=4, right=0, top=2, bottom=2});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setText("Apagar");
    obj.button2:setAlign("right");
    obj.button2:setWidth(60);
    obj.button2:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button2:setName("button2");

self.height=32;


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            showMagiaPopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            askForDelete();
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
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edtNome ~= nil then self.edtNome:destroy(); self.edtNome = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMagiaItemComCheckbox = {
    newEditor = newfrmMagiaItemComCheckbox, 
    new = newfrmMagiaItemComCheckbox, 
    name = "frmMagiaItemComCheckbox", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiaItemComCheckbox = _frmMagiaItemComCheckbox;
rrpg.registrarForm(_frmMagiaItemComCheckbox);

return _frmMagiaItemComCheckbox;
