require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmEquipamentoItemDefesa()
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
    obj:setName("frmEquipamentoItemDefesa");


			local function atualizarDesiredHeight()
				local margins = self.layPrincipal.margins;
				local h = self.fraLayout:getHeight() + 2 + margins.top + margins.bottom;
				local ultObjMenu = self.btnApagar;
				local mH = ultObjMenu.top + ultObjMenu.height + self.layMenu.top + self.layMenu.margins.bottom;
				
				if h < mH then
					h = mH;
				end;
				
				self.height = h;			
			end;
			
			local function askForDelete()
				dialogs.confirmYesNo("Deseja realmente apagar este item?",
									 function (confirmado)
										if confirmado then
											ndb.deleteNode(self.sheet);
										end;
									 end);
			end;
				
			


    obj.layMenu = gui.fromHandle(_obj_newObject("layout"));
    obj.layMenu:setParent(obj);
    obj.layMenu:setAlign("left");
    obj.layMenu:setWidth(64);
    obj.layMenu:setMargins({top=10, left=3, bottom=10});
    obj.layMenu:setName("layMenu");

    obj.btnApagar = gui.fromHandle(_obj_newObject("button"));
    obj.btnApagar:setParent(obj.layMenu);
    obj.btnApagar:setAlign("top");
    obj.btnApagar:setText("Apagar");
    obj.btnApagar:setName("btnApagar");
    obj.btnApagar:setMargins({bottom=6});
    obj.btnApagar:setHeight(32);

    obj.layPrincipal = gui.fromHandle(_obj_newObject("layout"));
    obj.layPrincipal:setParent(obj);
    obj.layPrincipal:setAlign("client");
    obj.layPrincipal:setMargins({top=8, bottom=8});
    obj.layPrincipal:setName("layPrincipal");

    obj.fraLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayout:setParent(obj.layPrincipal);
    obj.fraLayout:setName("fraLayout");
    obj.fraLayout:setAvoidScale(true);
    obj.fraLayout:setAutoHeight(true);
    obj.fraLayout:setVertAlign("trailing");
    obj.fraLayout:setAlign("top");
    obj.fraLayout:setLineSpacing(2);
    obj.fraLayout:setHorzAlign("justify");
    obj.fraLayout:setMargins({left=5, right=5, top=2, bottom=2});
    obj.fraLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraLayout:setMinScaledWidth(300);

    obj.GridCampoSolido1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido1:setParent(obj.fraLayout);
    obj.GridCampoSolido1:setHeight(40);
    obj.GridCampoSolido1:setMinScaledWidth(190);
    obj.GridCampoSolido1:setMinWidth(190);
    obj.GridCampoSolido1:setMaxWidth(400);
    obj.GridCampoSolido1:setMaxScaledWidth(400);
    obj.GridCampoSolido1:setAvoidScale(true);
    obj.GridCampoSolido1:setName("GridCampoSolido1");
    obj.GridCampoSolido1:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido1:setVertAlign("leading");

    obj.edtGridCampoSolido1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.edtGridCampoSolido1:setName("edtGridCampoSolido1");
    obj.edtGridCampoSolido1:setAlign("top");
    obj.edtGridCampoSolido1:setField("nome");
    obj.edtGridCampoSolido1:setFontSize(13);
    obj.edtGridCampoSolido1:setTransparent(false);
    obj.edtGridCampoSolido1:setVertTextAlign("center");
    obj.edtGridCampoSolido1:setHeight(30);
    obj.edtGridCampoSolido1:setWidth(195);
    obj.edtGridCampoSolido1:setFontColor("white");

    obj.labGridCampoSolido1 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.labGridCampoSolido1:setName("labGridCampoSolido1");
    obj.labGridCampoSolido1:setAlign("top");
    obj.labGridCampoSolido1:setText("NOME");
    obj.labGridCampoSolido1:setVertTextAlign("leading");
    obj.labGridCampoSolido1:setWordWrap(true);
    obj.labGridCampoSolido1:setTextTrimming("none");
    obj.labGridCampoSolido1:setFontSize(12);
    obj.labGridCampoSolido1:setFontColor("#D0D0D0");

    self.GridCampoSolido1:setHeight(self.edtGridCampoSolido1:getHeight() + self.labGridCampoSolido1:getHeight());


    obj.GridCampoSolido2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido2:setParent(obj.fraLayout);
    obj.GridCampoSolido2:setHeight(40);
    obj.GridCampoSolido2:setMinScaledWidth(50);
    obj.GridCampoSolido2:setMinWidth(50);
    obj.GridCampoSolido2:setMaxWidth(200);
    obj.GridCampoSolido2:setMaxScaledWidth(200);
    obj.GridCampoSolido2:setAvoidScale(true);
    obj.GridCampoSolido2:setName("GridCampoSolido2");
    obj.GridCampoSolido2:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido2:setVertAlign("leading");

    obj.edtGridCampoSolido2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.edtGridCampoSolido2:setName("edtGridCampoSolido2");
    obj.edtGridCampoSolido2:setAlign("top");
    obj.edtGridCampoSolido2:setField("peso");
    obj.edtGridCampoSolido2:setFontSize(13);
    obj.edtGridCampoSolido2:setTransparent(false);
    obj.edtGridCampoSolido2:setVertTextAlign("center");
    obj.edtGridCampoSolido2:setHeight(30);
    obj.edtGridCampoSolido2:setWidth(195);
    obj.edtGridCampoSolido2:setFontColor("white");

    obj.labGridCampoSolido2 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.labGridCampoSolido2:setName("labGridCampoSolido2");
    obj.labGridCampoSolido2:setAlign("top");
    obj.labGridCampoSolido2:setText("PESO");
    obj.labGridCampoSolido2:setVertTextAlign("leading");
    obj.labGridCampoSolido2:setWordWrap(true);
    obj.labGridCampoSolido2:setTextTrimming("none");
    obj.labGridCampoSolido2:setFontSize(12);
    obj.labGridCampoSolido2:setFontColor("#D0D0D0");

    self.GridCampoSolido2:setHeight(self.edtGridCampoSolido2:getHeight() + self.labGridCampoSolido2:getHeight());


    obj.GridCampoSolido3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido3:setParent(obj.fraLayout);
    obj.GridCampoSolido3:setHeight(40);
    obj.GridCampoSolido3:setMinScaledWidth(100);
    obj.GridCampoSolido3:setMinWidth(100);
    obj.GridCampoSolido3:setMaxWidth(233);
    obj.GridCampoSolido3:setMaxScaledWidth(233);
    obj.GridCampoSolido3:setAvoidScale(true);
    obj.GridCampoSolido3:setName("GridCampoSolido3");
    obj.GridCampoSolido3:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido3:setVertAlign("leading");

    obj.edtGridCampoSolido3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.edtGridCampoSolido3:setName("edtGridCampoSolido3");
    obj.edtGridCampoSolido3:setAlign("top");
    obj.edtGridCampoSolido3:setField("tipo");
    obj.edtGridCampoSolido3:setFontSize(13);
    obj.edtGridCampoSolido3:setTransparent(false);
    obj.edtGridCampoSolido3:setVertTextAlign("center");
    obj.edtGridCampoSolido3:setHeight(30);
    obj.edtGridCampoSolido3:setWidth(195);
    obj.edtGridCampoSolido3:setFontColor("white");

    obj.labGridCampoSolido3 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.labGridCampoSolido3:setName("labGridCampoSolido3");
    obj.labGridCampoSolido3:setAlign("top");
    obj.labGridCampoSolido3:setText("TIPO");
    obj.labGridCampoSolido3:setVertTextAlign("leading");
    obj.labGridCampoSolido3:setWordWrap(true);
    obj.labGridCampoSolido3:setTextTrimming("none");
    obj.labGridCampoSolido3:setFontSize(12);
    obj.labGridCampoSolido3:setFontColor("#D0D0D0");

    self.GridCampoSolido3:setHeight(self.edtGridCampoSolido3:getHeight() + self.labGridCampoSolido3:getHeight());


    obj.GridCampoSolido4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido4:setParent(obj.fraLayout);
    obj.GridCampoSolido4:setHeight(40);
    obj.GridCampoSolido4:setMinScaledWidth(100);
    obj.GridCampoSolido4:setMinWidth(100);
    obj.GridCampoSolido4:setMaxWidth(233);
    obj.GridCampoSolido4:setMaxScaledWidth(233);
    obj.GridCampoSolido4:setAvoidScale(true);
    obj.GridCampoSolido4:setName("GridCampoSolido4");
    obj.GridCampoSolido4:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido4:setVertAlign("leading");

    obj.edtGridCampoSolido4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.edtGridCampoSolido4:setName("edtGridCampoSolido4");
    obj.edtGridCampoSolido4:setAlign("top");
    obj.edtGridCampoSolido4:setField("caBonus");
    obj.edtGridCampoSolido4:setFontSize(13);
    obj.edtGridCampoSolido4:setTransparent(false);
    obj.edtGridCampoSolido4:setVertTextAlign("center");
    obj.edtGridCampoSolido4:setHeight(30);
    obj.edtGridCampoSolido4:setWidth(195);
    obj.edtGridCampoSolido4:setFontColor("white");

    obj.labGridCampoSolido4 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.labGridCampoSolido4:setName("labGridCampoSolido4");
    obj.labGridCampoSolido4:setAlign("top");
    obj.labGridCampoSolido4:setText("CA BÔNUS");
    obj.labGridCampoSolido4:setVertTextAlign("leading");
    obj.labGridCampoSolido4:setWordWrap(true);
    obj.labGridCampoSolido4:setTextTrimming("none");
    obj.labGridCampoSolido4:setFontSize(12);
    obj.labGridCampoSolido4:setFontColor("#D0D0D0");

    self.GridCampoSolido4:setHeight(self.edtGridCampoSolido4:getHeight() + self.labGridCampoSolido4:getHeight());


    obj.GridCampoSolido5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido5:setParent(obj.fraLayout);
    obj.GridCampoSolido5:setHeight(40);
    obj.GridCampoSolido5:setMinScaledWidth(32);
    obj.GridCampoSolido5:setMinWidth(32);
    obj.GridCampoSolido5:setMaxWidth(32);
    obj.GridCampoSolido5:setMaxScaledWidth(32);
    obj.GridCampoSolido5:setAvoidScale(true);
    obj.GridCampoSolido5:setName("GridCampoSolido5");
    obj.GridCampoSolido5:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido5:setVertAlign("leading");

    obj.cbxGridCampoSolido5 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.cbxGridCampoSolido5:setAlign("top");
    obj.cbxGridCampoSolido5:setWidth(20);
    obj.cbxGridCampoSolido5:setMargins({});
    obj.cbxGridCampoSolido5:setField("penalidade");
    obj.cbxGridCampoSolido5:setOptimize(false);
    obj.cbxGridCampoSolido5:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido5:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido5:setName("cbxGridCampoSolido5");
    obj.cbxGridCampoSolido5:setHeight(32);

    obj.labGridCampoSolido5 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.labGridCampoSolido5:setName("labGridCampoSolido5");
    obj.labGridCampoSolido5:setAlign("top");
    obj.labGridCampoSolido5:setText("PEN");
    obj.labGridCampoSolido5:setHorzTextAlign("center");
    obj.labGridCampoSolido5:setVertTextAlign("leading");
    obj.labGridCampoSolido5:setWordWrap(true);
    obj.labGridCampoSolido5:setTextTrimming("none");
    obj.labGridCampoSolido5:setFontSize(12);
    obj.labGridCampoSolido5:setFontColor("#D0D0D0");

    self.GridCampoSolido5:setHeight(self.cbxGridCampoSolido5:getHeight() + self.labGridCampoSolido5:getHeight());


    obj.GridCampoSolido6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido6:setParent(obj.fraLayout);
    obj.GridCampoSolido6:setHeight(40);
    obj.GridCampoSolido6:setMinScaledWidth(150);
    obj.GridCampoSolido6:setMinWidth(150);
    obj.GridCampoSolido6:setMaxWidth(360);
    obj.GridCampoSolido6:setMaxScaledWidth(360);
    obj.GridCampoSolido6:setAvoidScale(true);
    obj.GridCampoSolido6:setName("GridCampoSolido6");
    obj.GridCampoSolido6:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido6:setVertAlign("leading");

    obj.edtGridCampoSolido6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.edtGridCampoSolido6:setName("edtGridCampoSolido6");
    obj.edtGridCampoSolido6:setAlign("top");
    obj.edtGridCampoSolido6:setField("propriedades");
    obj.edtGridCampoSolido6:setFontSize(13);
    obj.edtGridCampoSolido6:setTransparent(false);
    obj.edtGridCampoSolido6:setVertTextAlign("center");
    obj.edtGridCampoSolido6:setHeight(30);
    obj.edtGridCampoSolido6:setWidth(195);
    obj.edtGridCampoSolido6:setFontColor("white");

    obj.labGridCampoSolido6 = gui.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.labGridCampoSolido6:setName("labGridCampoSolido6");
    obj.labGridCampoSolido6:setAlign("top");
    obj.labGridCampoSolido6:setText("PROPRIEDADES");
    obj.labGridCampoSolido6:setVertTextAlign("leading");
    obj.labGridCampoSolido6:setWordWrap(true);
    obj.labGridCampoSolido6:setTextTrimming("none");
    obj.labGridCampoSolido6:setFontSize(12);
    obj.labGridCampoSolido6:setFontColor("#D0D0D0");

    self.GridCampoSolido6:setHeight(self.edtGridCampoSolido6:getHeight() + self.labGridCampoSolido6:getHeight());


    obj._e_event0 = obj.btnApagar:addEventListener("onClick",
        function (self)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.fraLayout:addEventListener("onResize",
        function (self)
            atualizarDesiredHeight();
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

        if self.labGridCampoSolido3 ~= nil then self.labGridCampoSolido3:destroy(); self.labGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido4 ~= nil then self.edtGridCampoSolido4:destroy(); self.edtGridCampoSolido4 = nil; end;
        if self.labGridCampoSolido5 ~= nil then self.labGridCampoSolido5:destroy(); self.labGridCampoSolido5 = nil; end;
        if self.btnApagar ~= nil then self.btnApagar:destroy(); self.btnApagar = nil; end;
        if self.layPrincipal ~= nil then self.layPrincipal:destroy(); self.layPrincipal = nil; end;
        if self.GridCampoSolido5 ~= nil then self.GridCampoSolido5:destroy(); self.GridCampoSolido5 = nil; end;
        if self.cbxGridCampoSolido5 ~= nil then self.cbxGridCampoSolido5:destroy(); self.cbxGridCampoSolido5 = nil; end;
        if self.labGridCampoSolido2 ~= nil then self.labGridCampoSolido2:destroy(); self.labGridCampoSolido2 = nil; end;
        if self.labGridCampoSolido6 ~= nil then self.labGridCampoSolido6:destroy(); self.labGridCampoSolido6 = nil; end;
        if self.edtGridCampoSolido1 ~= nil then self.edtGridCampoSolido1:destroy(); self.edtGridCampoSolido1 = nil; end;
        if self.fraLayout ~= nil then self.fraLayout:destroy(); self.fraLayout = nil; end;
        if self.labGridCampoSolido1 ~= nil then self.labGridCampoSolido1:destroy(); self.labGridCampoSolido1 = nil; end;
        if self.edtGridCampoSolido3 ~= nil then self.edtGridCampoSolido3:destroy(); self.edtGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido2 ~= nil then self.edtGridCampoSolido2:destroy(); self.edtGridCampoSolido2 = nil; end;
        if self.labGridCampoSolido4 ~= nil then self.labGridCampoSolido4:destroy(); self.labGridCampoSolido4 = nil; end;
        if self.GridCampoSolido1 ~= nil then self.GridCampoSolido1:destroy(); self.GridCampoSolido1 = nil; end;
        if self.edtGridCampoSolido6 ~= nil then self.edtGridCampoSolido6:destroy(); self.edtGridCampoSolido6 = nil; end;
        if self.GridCampoSolido3 ~= nil then self.GridCampoSolido3:destroy(); self.GridCampoSolido3 = nil; end;
        if self.GridCampoSolido4 ~= nil then self.GridCampoSolido4:destroy(); self.GridCampoSolido4 = nil; end;
        if self.layMenu ~= nil then self.layMenu:destroy(); self.layMenu = nil; end;
        if self.GridCampoSolido2 ~= nil then self.GridCampoSolido2:destroy(); self.GridCampoSolido2 = nil; end;
        if self.GridCampoSolido6 ~= nil then self.GridCampoSolido6:destroy(); self.GridCampoSolido6 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmEquipamentoItemDefesa = {
    newEditor = newfrmEquipamentoItemDefesa, 
    new = newfrmEquipamentoItemDefesa, 
    name = "frmEquipamentoItemDefesa", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEquipamentoItemDefesa = _frmEquipamentoItemDefesa;
rrpg.registrarForm(_frmEquipamentoItemDefesa);

return _frmEquipamentoItemDefesa;
