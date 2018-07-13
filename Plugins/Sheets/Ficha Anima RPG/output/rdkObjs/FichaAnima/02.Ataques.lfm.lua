require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmFichaRPGmeister2_svg()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmFichaRPGmeister2_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.attackList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.attackList:setParent(obj.scrollBox1);
    obj.attackList:setAlign("client");
    obj.attackList:setField("attackList");
    obj.attackList:setName("attackList");
    obj.attackList:setTemplateForm("frmAtaqueItem");
    obj.attackList:setLayout("vertical");
    obj.attackList:setMinQt(1);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("addWeapon");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.attackList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            				elseif nodeA.enabled then
            					return -1;
            				elseif nodeB.enabled then
            					return 1;
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local addWeapon = tonumber(sheet.addWeapon) or 0;
            				if addWeapon>0 then
            					sheet.addWeapon = 0;
            					local item = self.attackList:append();
            					item.enabled = false;
            				end;
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

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.attackList ~= nil then self.attackList:destroy(); self.attackList = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister2_svg = {
    newEditor = newfrmFichaRPGmeister2_svg, 
    new = newfrmFichaRPGmeister2_svg, 
    name = "frmFichaRPGmeister2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister2_svg = _frmFichaRPGmeister2_svg;
Firecast.registrarForm(_frmFichaRPGmeister2_svg);

return _frmFichaRPGmeister2_svg;
