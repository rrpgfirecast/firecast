require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_legados()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setName("legados");
    obj:setHeight(25);
    obj:setAlign("top");
    obj:setMargins({bottom=10});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(85);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.nomeCheckLeg_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLeg_01:setParent(obj.layout2);
    obj.nomeCheckLeg_01:setField("fldCheckLeg_01");
    obj.nomeCheckLeg_01:setName("nomeCheckLeg_01");
    obj.nomeCheckLeg_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckLeg_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckLeg_01:setHeight(25);
    obj.nomeCheckLeg_01:setWidth(14);
    obj.nomeCheckLeg_01:setAlign("right");
    obj.nomeCheckLeg_01:setMargins({left=3});
    obj.nomeCheckLeg_01:setAutoChange(false);

    obj.nomeCheckLeg_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLeg_02:setParent(obj.layout2);
    obj.nomeCheckLeg_02:setField("fldCheckLeg_02");
    obj.nomeCheckLeg_02:setName("nomeCheckLeg_02");
    obj.nomeCheckLeg_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckLeg_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckLeg_02:setHeight(25);
    obj.nomeCheckLeg_02:setWidth(14);
    obj.nomeCheckLeg_02:setAlign("right");
    obj.nomeCheckLeg_02:setMargins({left=3});
    obj.nomeCheckLeg_02:setAutoChange(false);

    obj.nomeCheckLeg_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLeg_03:setParent(obj.layout2);
    obj.nomeCheckLeg_03:setField("fldCheckLeg_03");
    obj.nomeCheckLeg_03:setName("nomeCheckLeg_03");
    obj.nomeCheckLeg_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckLeg_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckLeg_03:setHeight(25);
    obj.nomeCheckLeg_03:setWidth(14);
    obj.nomeCheckLeg_03:setAlign("right");
    obj.nomeCheckLeg_03:setMargins({left=3});
    obj.nomeCheckLeg_03:setAutoChange(false);

    obj.nomeCheckLeg_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLeg_04:setParent(obj.layout2);
    obj.nomeCheckLeg_04:setField("fldCheckLeg_04");
    obj.nomeCheckLeg_04:setName("nomeCheckLeg_04");
    obj.nomeCheckLeg_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckLeg_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckLeg_04:setHeight(25);
    obj.nomeCheckLeg_04:setWidth(14);
    obj.nomeCheckLeg_04:setAlign("right");
    obj.nomeCheckLeg_04:setMargins({left=3});
    obj.nomeCheckLeg_04:setAutoChange(false);

    obj.nomeCheckLeg_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLeg_05:setParent(obj.layout2);
    obj.nomeCheckLeg_05:setField("fldCheckLeg_05");
    obj.nomeCheckLeg_05:setName("nomeCheckLeg_05");
    obj.nomeCheckLeg_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckLeg_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckLeg_05:setHeight(25);
    obj.nomeCheckLeg_05:setWidth(14);
    obj.nomeCheckLeg_05:setAlign("right");
    obj.nomeCheckLeg_05:setMargins({left=3});
    obj.nomeCheckLeg_05:setAutoChange(false);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(308);
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setField("fldLegados");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("fldLegados");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(22);
    obj.layout3:setHeight(22);
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setHint("Apagar Legado");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeCheckLeg_01:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckLeg_01 = not sheet.fldCheckLeg_01;
            				
            				if(sheet.fldCheckLeg_02) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = false; 
            					sheet.fldCheckLeg_03 = false; 
            					sheet.fldCheckLeg_04 = false; 
            					sheet.fldCheckLeg_05 = false; 
            				end;
            			
        end);

    obj._e_event1 = obj.nomeCheckLeg_02:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckLeg_02 = not sheet.fldCheckLeg_02;
            				
            				if(sheet.fldCheckLeg_02) then 
            					sheet.fldCheckLeg_01 = true; 
            				else 
            					sheet.fldCheckLeg_01 = false;
            				end;
            				
            				if(sheet.fldCheckLeg_03) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            					sheet.fldCheckLeg_03 = false; 
            					sheet.fldCheckLeg_04 = false; 
            					sheet.fldCheckLeg_05 = false; 
            				end;
            			
        end);

    obj._e_event2 = obj.nomeCheckLeg_03:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckLeg_03 = not sheet.fldCheckLeg_03;
            				
            				if(sheet.fldCheckLeg_03) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            				else 
            					sheet.fldCheckLeg_01 = false; 
            					sheet.fldCheckLeg_02 = false; 
            				end;
            				
            				if(sheet.fldCheckLeg_04) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            					sheet.fldCheckLeg_03 = true; 
            					sheet.fldCheckLeg_04 = false; 
            					sheet.fldCheckLeg_05 = false; 
            				end;
            			
        end);

    obj._e_event3 = obj.nomeCheckLeg_04:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckLeg_04 = not sheet.fldCheckLeg_04;
            				
            				if(sheet.fldCheckLeg_04) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            					sheet.fldCheckLeg_03 = true; 
            				else 
            					sheet.fldCheckLeg_01 = false; 
            					sheet.fldCheckLeg_02 = false; 
            					sheet.fldCheckLeg_03 = false; 
            				end;
            				
            				if(sheet.fldCheckLeg_05) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            					sheet.fldCheckLeg_03 = true; 
            					sheet.fldCheckLeg_04 = true; 
            					sheet.fldCheckLeg_05 = false; 
            				end;
            			
        end);

    obj._e_event4 = obj.nomeCheckLeg_05:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckLeg_05 = not sheet.fldCheckLeg_05;
            				
            				if(sheet.fldCheckLeg_05) then 
            					sheet.fldCheckLeg_01 = true; 
            					sheet.fldCheckLeg_02 = true; 
            					sheet.fldCheckLeg_03 = true; 
            					sheet.fldCheckLeg_04 = true; 
            				else 
            					sheet.fldCheckLeg_01 = false; 
            					sheet.fldCheckLeg_02 = false; 
            					sheet.fldCheckLeg_03 = false; 
            					sheet.fldCheckLeg_04 = false; 
            				end;
            			
        end);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    function obj:_releaseEvents()
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

        if self.nomeCheckLeg_05 ~= nil then self.nomeCheckLeg_05:destroy(); self.nomeCheckLeg_05 = nil; end;
        if self.nomeCheckLeg_02 ~= nil then self.nomeCheckLeg_02:destroy(); self.nomeCheckLeg_02 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.nomeCheckLeg_04 ~= nil then self.nomeCheckLeg_04:destroy(); self.nomeCheckLeg_04 = nil; end;
        if self.nomeCheckLeg_03 ~= nil then self.nomeCheckLeg_03:destroy(); self.nomeCheckLeg_03 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.nomeCheckLeg_01 ~= nil then self.nomeCheckLeg_01:destroy(); self.nomeCheckLeg_01 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newlegados()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_legados();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _legados = {
    newEditor = newlegados, 
    new = newlegados, 
    name = "legados", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

legados = _legados;
Firecast.registrarForm(_legados);

return _legados;
