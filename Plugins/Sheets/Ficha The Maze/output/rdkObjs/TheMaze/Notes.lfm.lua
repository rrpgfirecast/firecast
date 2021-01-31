require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplateNotes()
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
    obj:setName("frmTemplateNotes");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(400);
    obj.layout1:setHeight(290);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(290);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(400);
    obj.label1:setHeight(20);
    obj.label1:setText("Anotações Gerais");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(250);
    obj.textEditor1:setField("anotacoes1");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(410);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(290);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(290);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(400);
    obj.label2:setHeight(20);
    obj.label2:setText("Tarefas");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(250);
    obj.textEditor2:setField("anotacoes2");
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(820);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(290);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(400);
    obj.rectangle3:setHeight(290);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(400);
    obj.label3:setHeight(20);
    obj.label3:setText("Diário da Irmandade");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout3);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(250);
    obj.textEditor3:setField("anotacoes3");
    obj.textEditor3:setName("textEditor3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(295);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(290);
    obj.layout4:setName("layout4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(400);
    obj.rectangle4:setHeight(290);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(400);
    obj.label4:setHeight(20);
    obj.label4:setText("Labirinto/Torre");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout4);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(250);
    obj.textEditor4:setField("anotacoes4");
    obj.textEditor4:setName("textEditor4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(410);
    obj.layout5:setTop(295);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(290);
    obj.layout5:setName("layout5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(400);
    obj.rectangle5:setHeight(290);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(400);
    obj.label5:setHeight(20);
    obj.label5:setText("Privilégios");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout5);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(250);
    obj.textEditor5:setField("anotacoes5");
    obj.textEditor5:setName("textEditor5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(820);
    obj.layout6:setTop(295);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(290);
    obj.layout6:setName("layout6");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(400);
    obj.rectangle6:setHeight(290);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(15);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setWidth(400);
    obj.label6:setHeight(20);
    obj.label6:setText("Reputação");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout6);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(250);
    obj.textEditor6:setField("anotacoes6");
    obj.textEditor6:setName("textEditor6");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplateNotes()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplateNotes();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplateNotes = {
    newEditor = newfrmTemplateNotes, 
    new = newfrmTemplateNotes, 
    name = "frmTemplateNotes", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTemplateNotes = _frmTemplateNotes;
Firecast.registrarForm(_frmTemplateNotes);

return _frmTemplateNotes;
