require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmImagem()
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
    obj:setName("frmImagem");
    obj:setWidth(440);
    obj:setHeight(198);
    obj:setTheme("dark");
    obj:setMargins({top=1});


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa imagem?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(15);
    obj.rectangle1:setTop(1);
    obj.rectangle1:setWidth(195);
    obj.rectangle1:setHeight(195);
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("Gray");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setMargins({left=10, right=10, top=10, bottom=10});
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setAlign("client");
    obj.image1:setStyle("proportional");
    obj.image1:setSRC("/imagens/Logo.png");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setOpacity(0.5);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setAlign("client");
    obj.image2:setField("imgEx");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    lfm_setPropAsString(obj.image2, "animate",  "true");
    obj.image2:setName("image2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(187);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.imgEx);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
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

        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmImagem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmImagem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmImagem = {
    newEditor = newfrmImagem, 
    new = newfrmImagem, 
    name = "frmImagem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmImagem = _frmImagem;
Firecast.registrarForm(_frmImagem);

return _frmImagem;
