require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_vantagens()
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
    obj:setName("vantagens");
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
    obj.layout2:setMargins({right=10});
    obj.layout2:setName("layout2");

    obj.nomeCheckVant_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckVant_01:setParent(obj.layout2);
    obj.nomeCheckVant_01:setField("fldCheckVant_01");
    obj.nomeCheckVant_01:setName("nomeCheckVant_01");
    obj.nomeCheckVant_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckVant_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckVant_01:setHeight(25);
    obj.nomeCheckVant_01:setWidth(14);
    obj.nomeCheckVant_01:setAlign("right");
    obj.nomeCheckVant_01:setMargins({right=3});
    obj.nomeCheckVant_01:setAutoChange(false);

    obj.nomeCheckVant_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckVant_02:setParent(obj.layout2);
    obj.nomeCheckVant_02:setField("fldCheckVant_02");
    obj.nomeCheckVant_02:setName("nomeCheckVant_02");
    obj.nomeCheckVant_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckVant_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckVant_02:setHeight(25);
    obj.nomeCheckVant_02:setWidth(14);
    obj.nomeCheckVant_02:setAlign("right");
    obj.nomeCheckVant_02:setMargins({right=3});
    obj.nomeCheckVant_02:setAutoChange(false);

    obj.nomeCheckVant_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckVant_03:setParent(obj.layout2);
    obj.nomeCheckVant_03:setField("fldCheckVant_03");
    obj.nomeCheckVant_03:setName("nomeCheckVant_03");
    obj.nomeCheckVant_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckVant_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckVant_03:setHeight(25);
    obj.nomeCheckVant_03:setWidth(14);
    obj.nomeCheckVant_03:setAlign("right");
    obj.nomeCheckVant_03:setMargins({right=3});
    obj.nomeCheckVant_03:setAutoChange(false);

    obj.nomeCheckVant_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckVant_04:setParent(obj.layout2);
    obj.nomeCheckVant_04:setField("fldCheckVant_04");
    obj.nomeCheckVant_04:setName("nomeCheckVant_04");
    obj.nomeCheckVant_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckVant_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckVant_04:setHeight(25);
    obj.nomeCheckVant_04:setWidth(14);
    obj.nomeCheckVant_04:setAlign("right");
    obj.nomeCheckVant_04:setMargins({right=3});
    obj.nomeCheckVant_04:setAutoChange(false);

    obj.nomeCheckVant_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckVant_05:setParent(obj.layout2);
    obj.nomeCheckVant_05:setField("fldCheckVant_05");
    obj.nomeCheckVant_05:setName("nomeCheckVant_05");
    obj.nomeCheckVant_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckVant_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckVant_05:setHeight(25);
    obj.nomeCheckVant_05:setWidth(14);
    obj.nomeCheckVant_05:setAlign("right");
    obj.nomeCheckVant_05:setMargins({right=3});
    obj.nomeCheckVant_05:setAutoChange(false);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(277);
    obj.edit1:setField("fldVantagem");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("white");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("fldVantagem");
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
    obj.button1:setHint("Apagar Vantagem");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeCheckVant_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheckVant_01 = not sheet.fldCheckVant_01;
            				
            				if(sheet.fldCheckVant_02) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = false; 
            					sheet.fldCheckVant_03 = false; 
            					sheet.fldCheckVant_04 = false; 
            					sheet.fldCheckVant_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event1 = obj.nomeCheckVant_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheckVant_02 = not sheet.fldCheckVant_02;
            				
            				if(sheet.fldCheckVant_02) then 
            					sheet.fldCheckVant_01 = true; 
            				else 
            					sheet.fldCheckVant_01 = false;
            				end;
            				
            				if(sheet.fldCheckVant_03) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            					sheet.fldCheckVant_03 = false; 
            					sheet.fldCheckVant_04 = false; 
            					sheet.fldCheckVant_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event2 = obj.nomeCheckVant_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheckVant_03 = not sheet.fldCheckVant_03;
            				
            				if(sheet.fldCheckVant_03) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            				else 
            					sheet.fldCheckVant_01 = false; 
            					sheet.fldCheckVant_02 = false; 
            				end;
            				
            				if(sheet.fldCheckVant_04) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            					sheet.fldCheckVant_03 = true; 
            					sheet.fldCheckVant_04 = false; 
            					sheet.fldCheckVant_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event3 = obj.nomeCheckVant_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheckVant_04 = not sheet.fldCheckVant_04;
            				
            				if(sheet.fldCheckVant_04) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            					sheet.fldCheckVant_03 = true; 
            				else 
            					sheet.fldCheckVant_01 = false; 
            					sheet.fldCheckVant_02 = false; 
            					sheet.fldCheckVant_03 = false; 
            				end;
            				
            				if(sheet.fldCheckVant_05) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            					sheet.fldCheckVant_03 = true; 
            					sheet.fldCheckVant_04 = true; 
            					sheet.fldCheckVant_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event4 = obj.nomeCheckVant_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheckVant_05 = not sheet.fldCheckVant_05;
            				
            				if(sheet.fldCheckVant_05) then 
            					sheet.fldCheckVant_01 = true; 
            					sheet.fldCheckVant_02 = true; 
            					sheet.fldCheckVant_03 = true; 
            					sheet.fldCheckVant_04 = true; 
            				else 
            					sheet.fldCheckVant_01 = false; 
            					sheet.fldCheckVant_02 = false; 
            					sheet.fldCheckVant_03 = false; 
            					sheet.fldCheckVant_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

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

        if self.nomeCheckVant_04 ~= nil then self.nomeCheckVant_04:destroy(); self.nomeCheckVant_04 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.nomeCheckVant_03 ~= nil then self.nomeCheckVant_03:destroy(); self.nomeCheckVant_03 = nil; end;
        if self.nomeCheckVant_05 ~= nil then self.nomeCheckVant_05:destroy(); self.nomeCheckVant_05 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.nomeCheckVant_01 ~= nil then self.nomeCheckVant_01:destroy(); self.nomeCheckVant_01 = nil; end;
        if self.nomeCheckVant_02 ~= nil then self.nomeCheckVant_02:destroy(); self.nomeCheckVant_02 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newvantagens()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_vantagens();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _vantagens = {
    newEditor = newvantagens, 
    new = newvantagens, 
    name = "vantagens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

vantagens = _vantagens;
Firecast.registrarForm(_vantagens);

return _vantagens;
