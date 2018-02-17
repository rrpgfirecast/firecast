require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSkills()
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
    obj:setName("frmSkills");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(285);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(285);
    obj.label1:setHeight(20);
    obj.label1:setText("ACTIVE SKILLS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.rclSkillList = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSkillList:setParent(obj.layout1);
    obj.rclSkillList:setName("rclSkillList");
    obj.rclSkillList:setField("skillList");
    obj.rclSkillList:setTemplateForm("frmActiveSkill");
    obj.rclSkillList:setLeft(5);
    obj.rclSkillList:setTop(25);
    obj.rclSkillList:setWidth(275);
    obj.rclSkillList:setHeight(650);
    obj.rclSkillList:setLayout("vertical");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(290);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(285);
    obj.layout2:setHeight(685);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(0);
    obj.label2:setWidth(285);
    obj.label2:setHeight(20);
    obj.label2:setText("KNOWLEDGE SKILLS");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(5);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.rclKnowledgeList = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclKnowledgeList:setParent(obj.layout2);
    obj.rclKnowledgeList:setName("rclKnowledgeList");
    obj.rclKnowledgeList:setField("knowledgeList");
    obj.rclKnowledgeList:setTemplateForm("frmKnowledgeSkill");
    obj.rclKnowledgeList:setLeft(5);
    obj.rclKnowledgeList:setTop(25);
    obj.rclKnowledgeList:setWidth(275);
    obj.rclKnowledgeList:setHeight(650);
    obj.rclKnowledgeList:setLayout("vertical");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(580);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(285);
    obj.layout3:setHeight(685);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(5);
    obj.label3:setTop(0);
    obj.label3:setWidth(285);
    obj.label3:setHeight(20);
    obj.label3:setText("LANGUAGE SKILLS");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(5);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.rclLanguageList = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclLanguageList:setParent(obj.layout3);
    obj.rclLanguageList:setName("rclLanguageList");
    obj.rclLanguageList:setField("languageList");
    obj.rclLanguageList:setTemplateForm("frmLanguageSkill");
    obj.rclLanguageList:setLeft(5);
    obj.rclLanguageList:setTop(25);
    obj.rclLanguageList:setWidth(275);
    obj.rclLanguageList:setHeight(650);
    obj.rclLanguageList:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSkillList:append();
        end, obj);

    obj._e_event1 = obj.rclSkillList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if utils.compareStringPtBr(nodeA.skill_group_name, nodeB.skill_group_name)== 0 then
            						return utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
            					else 
            		            	return utils.compareStringPtBr(nodeA.skill_group_name, nodeB.skill_group_name);
            		            end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclKnowledgeList:append();
        end, obj);

    obj._e_event3 = obj.rclKnowledgeList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclLanguageList:append();
        end, obj);

    obj._e_event5 = obj.rclLanguageList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
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

        if self.rclLanguageList ~= nil then self.rclLanguageList:destroy(); self.rclLanguageList = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rclKnowledgeList ~= nil then self.rclKnowledgeList:destroy(); self.rclKnowledgeList = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclSkillList ~= nil then self.rclSkillList:destroy(); self.rclSkillList = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSkills = {
    newEditor = newfrmSkills, 
    new = newfrmSkills, 
    name = "frmSkills", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSkills = _frmSkills;
rrpg.registrarForm(_frmSkills);

return _frmSkills;
