require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplateDescription()
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
    obj:setName("frmTemplateDescription");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1205);
    obj.rectangle1:setHeight(105);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("top");
    obj.label1:setHeight(20);
    obj.label1:setText("DESCRIÇÃO");
    obj.label1:setName("label1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(380);
    obj.layout2:setMargins({right=10});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(90);
    obj.label2:setText("NACIONALIDADE");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(10);
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(290);
    obj.edit1:setField("nacionalidade");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(380);
    obj.layout3:setMargins({right=10});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(90);
    obj.label3:setText("IDADE");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(290);
    obj.edit2:setField("idade");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(380);
    obj.layout4:setMargins({right=10});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setWidth(90);
    obj.label4:setText("OLHOS");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(290);
    obj.edit3:setField("aparenciaOlhos");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(380);
    obj.layout6:setMargins({right=10});
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setAlign("left");
    obj.label5:setWidth(90);
    obj.label5:setText("ALTURA");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(290);
    obj.edit4:setField("altura");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout5);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(380);
    obj.layout7:setMargins({right=10});
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setAlign("left");
    obj.label6:setWidth(90);
    obj.label6:setText("GÊNERO");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(290);
    obj.edit5:setField("genero");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout5);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(380);
    obj.layout8:setMargins({right=10});
    obj.layout8:setName("layout8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setAlign("left");
    obj.label7:setWidth(90);
    obj.label7:setText("PELE");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(290);
    obj.edit6:setField("pele");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(380);
    obj.layout10:setMargins({right=10});
    obj.layout10:setName("layout10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout10);
    obj.label8:setAlign("left");
    obj.label8:setWidth(90);
    obj.label8:setText("PESO");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(13);
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(290);
    obj.edit7:setField("peso");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout9);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(380);
    obj.layout11:setMargins({right=10});
    obj.layout11:setName("layout11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout11);
    obj.label9:setAlign("left");
    obj.label9:setWidth(90);
    obj.label9:setText("OUTROS");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(13);
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(290);
    obj.edit8:setField("aparenciaOutros");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout9);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(380);
    obj.layout12:setMargins({right=10});
    obj.layout12:setName("layout12");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout12);
    obj.label10:setAlign("left");
    obj.label10:setWidth(90);
    obj.label10:setText("CABELO");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(13);
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(290);
    obj.edit9:setField("cabelo");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(110);
    obj.layout13:setWidth(375);
    obj.layout13:setHeight(240);
    obj.layout13:setName("layout13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout13);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout13);
    obj.label11:setLeft(5);
    obj.label11:setTop(1);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("APARÊNCIA");
    obj.label11:setName("label11");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout13);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(355);
    obj.layout14:setWidth(375);
    obj.layout14:setHeight(250);
    obj.layout14:setName("layout14");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout14);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout14);
    obj.label12:setLeft(5);
    obj.label12:setTop(1);
    obj.label12:setWidth(100);
    obj.label12:setHeight(20);
    obj.label12:setText("PERSONALIDADE");
    obj.label12:setName("label12");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout14);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(380);
    obj.layout15:setTop(110);
    obj.layout15:setWidth(825);
    obj.layout15:setHeight(495);
    obj.layout15:setName("layout15");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout15);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout15);
    obj.label13:setLeft(5);
    obj.label13:setTop(1);
    obj.label13:setWidth(100);
    obj.label13:setHeight(20);
    obj.label13:setText("HISTORIA");
    obj.label13:setName("label13");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout15);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplateDescription()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplateDescription();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplateDescription = {
    newEditor = newfrmTemplateDescription, 
    new = newfrmTemplateDescription, 
    name = "frmTemplateDescription", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTemplateDescription = _frmTemplateDescription;
Firecast.registrarForm(_frmTemplateDescription);

return _frmTemplateDescription;
