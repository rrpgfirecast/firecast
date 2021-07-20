require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateSkills()
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
    obj:setName("templateSkills");
    obj:setHeight(30);
    obj:setMargins({top=2,bottom=2});

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setField("MarcadorSkillEscola");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("nomeSkill");
    obj.edit1:setLeft(25);
    obj.edit1:setWidth(190);
    obj.edit1:setHeight(25);
    obj.edit1:setMargins({right=2});
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("tipoSkill");
    obj.edit2:setLeft(220);
    obj.edit2:setHeight(25);
    obj.edit2:setWidth(100);
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setField("rankSkill");
    obj.edit3:setLeft(325);
    obj.edit3:setHeight(25);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setWidth(25);
    obj.edit3:setMargins({right=2});
    obj.edit3:setName("edit3");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(355);
    obj.comboBox1:setItems({'Stamina', 'Willpower', 'Strength', 'Perception', 'Reflexes', 'Awareness', 'Agility', 'Intelligence', 'Void'});
    obj.comboBox1:setField("atributoSkill");
    obj.comboBox1:setValues({'StaminON', 'WillpoweON', 'StrengtON', 'PerceptioON', 'ReflexeON', 'AwarenesON', 'AgilitON', 'IntelligencON', 'VoiON'});
    obj.comboBox1:setName("comboBox1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(460);
    obj.edit4:setField("ROLAGEM");
    obj.edit4:setHeight(25);
    obj.edit4:setWidth(80);
    obj.edit4:setMargins({right=2});
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setField("enfasesSkill");
    obj.edit5:setLeft(545);
    obj.edit5:setHeight(25);
    obj.edit5:setWidth(110);
    obj.edit5:setMargins({right=2});
    obj.edit5:setName("edit5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(660);
    obj.button1:setText("Apagar");
    obj.button1:setWidth(90);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("rankSkill");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
                                                    local node = NDB.getRoot(sheet);
            					local objetos = NDB.getChildNodes(node.pericias);
            					local soma = 0;
            
            					for i=1, #objetos, 1 do 
            						soma = soma + (tonumber(objetos[i].rankSkill) or 0);
            					end;
            
            					node.countSum = soma;
                                            end
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateSkills()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateSkills();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateSkills = {
    newEditor = newtemplateSkills, 
    new = newtemplateSkills, 
    name = "templateSkills", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateSkills = _templateSkills;
Firecast.registrarForm(_templateSkills);

return _templateSkills;
