require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSpellItem()
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
    obj:setName("frmSpellItem");
    obj:setHeight(225);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.spellName = GUI.fromHandle(_obj_newObject("label"));
    obj.spellName:setParent(obj.layout1);
    obj.spellName:setAlign("client");
    obj.spellName:setWidth(375);
    obj.spellName:setField("name");
    obj.spellName:setName("spellName");
    obj.spellName:setHorzTextAlign("center");
    lfm_setPropAsString(obj.spellName, "fontStyle",  "bold");
    obj.spellName:setHitTest(true);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setAlign("left");
    obj.label1:setWidth(75);
    obj.label1:setText("Escola: ");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setMargins({right=2});
    obj.label1:setName("label1");

    obj.school = GUI.fromHandle(_obj_newObject("label"));
    obj.school:setParent(obj.layout2);
    obj.school:setAlign("left");
    obj.school:setWidth(110);
    obj.school:setField("school");
    obj.school:setName("school");
    obj.school:setHitTest(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(75);
    obj.label2:setText("Subescola: ");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setMargins({right=2});
    obj.label2:setName("label2");

    obj.subschool = GUI.fromHandle(_obj_newObject("label"));
    obj.subschool:setParent(obj.layout2);
    obj.subschool:setAlign("left");
    obj.subschool:setWidth(110);
    obj.subschool:setField("subschool");
    obj.subschool:setName("subschool");
    obj.subschool:setHitTest(true);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.descriptor = GUI.fromHandle(_obj_newObject("label"));
    obj.descriptor:setParent(obj.layout3);
    obj.descriptor:setAlign("client");
    obj.descriptor:setWidth(375);
    obj.descriptor:setField("descriptor");
    obj.descriptor:setName("descriptor");
    obj.descriptor:setHorzTextAlign("center");
    obj.descriptor:setHitTest(true);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.level = GUI.fromHandle(_obj_newObject("label"));
    obj.level:setParent(obj.layout4);
    obj.level:setAlign("client");
    obj.level:setWidth(375);
    obj.level:setField("level");
    obj.level:setName("level");
    obj.level:setHorzTextAlign("center");
    obj.level:setHitTest(true);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.components = GUI.fromHandle(_obj_newObject("label"));
    obj.components:setParent(obj.layout5);
    obj.components:setAlign("client");
    obj.components:setWidth(375);
    obj.components:setField("components");
    obj.components:setName("components");
    obj.components:setHorzTextAlign("center");
    obj.components:setHitTest(true);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.duration = GUI.fromHandle(_obj_newObject("label"));
    obj.duration:setParent(obj.layout6);
    obj.duration:setAlign("left");
    obj.duration:setWidth(187);
    obj.duration:setField("duration");
    obj.duration:setName("duration");
    obj.duration:setHorzTextAlign("center");
    obj.duration:setHitTest(true);

    obj.aiming = GUI.fromHandle(_obj_newObject("label"));
    obj.aiming:setParent(obj.layout6);
    obj.aiming:setAlign("left");
    obj.aiming:setWidth(187);
    obj.aiming:setField("aiming");
    obj.aiming:setName("aiming");
    obj.aiming:setHorzTextAlign("center");
    obj.aiming:setHitTest(true);

    obj.paizo = GUI.fromHandle(_obj_newObject("label"));
    obj.paizo:setParent(obj.layout6);
    obj.paizo:setAlign("left");
    obj.paizo:setWidth(187);
    obj.paizo:setField("paizo");
    obj.paizo:setName("paizo");
    obj.paizo:setHorzTextAlign("center");
    obj.paizo:setHitTest(true);

    obj.mythic = GUI.fromHandle(_obj_newObject("label"));
    obj.mythic:setParent(obj.layout6);
    obj.mythic:setAlign("left");
    obj.mythic:setWidth(187);
    obj.mythic:setField("mythic");
    obj.mythic:setName("mythic");
    obj.mythic:setHorzTextAlign("center");
    obj.mythic:setHitTest(true);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.range = GUI.fromHandle(_obj_newObject("label"));
    obj.range:setParent(obj.layout7);
    obj.range:setAlign("left");
    obj.range:setWidth(125);
    obj.range:setField("range");
    obj.range:setName("range");
    obj.range:setHorzTextAlign("center");
    obj.range:setHitTest(true);

    obj.save = GUI.fromHandle(_obj_newObject("label"));
    obj.save:setParent(obj.layout7);
    obj.save:setAlign("left");
    obj.save:setWidth(125);
    obj.save:setField("save");
    obj.save:setName("save");
    obj.save:setHorzTextAlign("center");
    obj.save:setHitTest(true);

    obj.sr = GUI.fromHandle(_obj_newObject("label"));
    obj.sr:setParent(obj.layout7);
    obj.sr:setAlign("left");
    obj.sr:setWidth(125);
    obj.sr:setField("sr");
    obj.sr:setName("sr");
    obj.sr:setHorzTextAlign("center");
    obj.sr:setHitTest(true);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.book = GUI.fromHandle(_obj_newObject("label"));
    obj.book:setParent(obj.layout8);
    obj.book:setAlign("client");
    obj.book:setWidth(375);
    obj.book:setField("book");
    obj.book:setName("book");
    obj.book:setHorzTextAlign("center");
    obj.book:setHitTest(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(125);
    obj.layout10:setName("layout10");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setAlign("left");
    obj.button1:setWidth(125);
    obj.button1:setText("Abrir na Web");
    obj.button1:setName("button1");

    obj.btDesc = GUI.fromHandle(_obj_newObject("button"));
    obj.btDesc:setParent(obj.layout9);
    obj.btDesc:setAlign("left");
    obj.btDesc:setWidth(125);
    obj.btDesc:setText("Descrição");
    obj.btDesc:setName("btDesc");
    obj.btDesc:setVisible(false);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("name");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("description");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("school");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("subschool");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("level");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("descriptor");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("components");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("range");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("duration");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("aiming");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("save");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setField("sr");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setField("book");
    obj.dataLink13:setName("dataLink13");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser(sheet.url);
        end, obj);

    obj._e_event1 = obj.btDesc:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDescription");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("center", self);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup para exibir");
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.spellName.hint = sheet.name;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.description==nil or sheet.description=="" then 
            				-- remove popup button
            				self.btDesc.visible = false;
            			else
            				-- add popup button
            				self.btDesc.visible = true;
            			end;
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.school.hint = sheet.school;
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.subschool.hint = sheet.subschool;
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.level.hint = sheet.level;
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.descriptor.hint = sheet.descriptor;
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.components.hint = sheet.components;
        end, obj);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.range.hint = sheet.range;
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.duration.hint = sheet.duration;
        end, obj);

    obj._e_event11 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.aiming.hint = sheet.aiming;
        end, obj);

    obj._e_event12 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.save.hint = sheet.save;
        end, obj);

    obj._e_event13 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.sr.hint = sheet.sr;
        end, obj);

    obj._e_event14 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			self.book.hint = sheet.book;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
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

        if self.school ~= nil then self.school:destroy(); self.school = nil; end;
        if self.aiming ~= nil then self.aiming:destroy(); self.aiming = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.book ~= nil then self.book:destroy(); self.book = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.level ~= nil then self.level:destroy(); self.level = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.range ~= nil then self.range:destroy(); self.range = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.descriptor ~= nil then self.descriptor:destroy(); self.descriptor = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.spellName ~= nil then self.spellName:destroy(); self.spellName = nil; end;
        if self.subschool ~= nil then self.subschool:destroy(); self.subschool = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.duration ~= nil then self.duration:destroy(); self.duration = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.mythic ~= nil then self.mythic:destroy(); self.mythic = nil; end;
        if self.btDesc ~= nil then self.btDesc:destroy(); self.btDesc = nil; end;
        if self.components ~= nil then self.components:destroy(); self.components = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.paizo ~= nil then self.paizo:destroy(); self.paizo = nil; end;
        if self.sr ~= nil then self.sr:destroy(); self.sr = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.save ~= nil then self.save:destroy(); self.save = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSpellItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSpellItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSpellItem = {
    newEditor = newfrmSpellItem, 
    new = newfrmSpellItem, 
    name = "frmSpellItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSpellItem = _frmSpellItem;
Firecast.registrarForm(_frmSpellItem);

return _frmSpellItem;
