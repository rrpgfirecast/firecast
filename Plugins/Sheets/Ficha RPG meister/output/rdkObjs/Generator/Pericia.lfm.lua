require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneratorSkill()
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
    obj:setName("frmGeneratorSkill");
    obj:setHeight(25);
    obj:setWidth(600);
    obj:setMargins({top=2});

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("isClass");
    obj.checkBox1:setMargins({left=5});
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nomePericia");
    obj.edit1:setMargins({left=5});
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(50);
    obj.edit2:setField("graduacaoPericia");
    obj.edit2:setMargins({left=5});
    obj.edit2:setName("edit2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setAlign("right");
    obj.label1:setWidth(50);
    obj.label1:setField("racialPericia");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setMargins({left=5});
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(50);
    obj.button1:setText("Max");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setWidth(50);
    obj.button2:setText("X");
    obj.button2:setMargins({left=5,right=5});
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'nomePericia'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'graduacaoPericia', 'isClass'});
    obj.dataLink2:setName("dataLink2");

			
			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar essa perícia?",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(sheet);
										end;
									 end);
			end;		
		


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local pts = tonumber(generatorSheet.npc.pontosPericia) or 0
            			local max = tonumber(generatorSheet.npc.skillsMax) or 0
            			local lvl = tonumber(generatorSheet.npc.lvl) or 1
            
            			local pts = math.min((max-pts), lvl+3)
            			if not sheet.isClass then pts = math.floor(pts/2) end
            
            			if pts==0 then return end
            			
            			sheet.graduacaoPericia = pts
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            			
            			local rcl = self:findControlByName("rclListaDasPericias");
            			if rcl~=nil then rcl:sort() end
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end
            			local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias); 
            			local pts = 0
            			--showMessage(#nodes);
            			for i=1, #nodes, 1 do
            				local mult = 1;
            				if not nodes[i].isClass then
            					mult = 2;
            				end;
            				pts = pts + (tonumber(nodes[i].graduacaoPericia) or 0) * mult;
            			end
            	
            			generatorSheet.npc.pontosPericia = pts;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneratorSkill()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneratorSkill();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneratorSkill = {
    newEditor = newfrmGeneratorSkill, 
    new = newfrmGeneratorSkill, 
    name = "frmGeneratorSkill", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneratorSkill = _frmGeneratorSkill;
Firecast.registrarForm(_frmGeneratorSkill);

return _frmGeneratorSkill;
