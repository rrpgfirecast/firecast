require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmLH7()
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
    obj:setName("frmLH7");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(400);
    obj.layout1:setHeight(280);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(280);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(400);
    obj.label1:setHeight(20);
    obj.label1:setText("Conexões Públicas");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(240);
    obj.textEditor1:setField("anotacoes1");
    obj.textEditor1:setName("textEditor1");

    obj.con_priv = gui.fromHandle(_obj_newObject("layout"));
    obj.con_priv:setParent(obj.scrollBox1);
    obj.con_priv:setName("con_priv");
    obj.con_priv:setVisible(false);
    obj.con_priv:setLeft(410);
    obj.con_priv:setTop(0);
    obj.con_priv:setWidth(400);
    obj.con_priv:setHeight(280);

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.con_priv);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(280);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.con_priv);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(400);
    obj.label2:setHeight(20);
    obj.label2:setText("Conexões Privadas");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.con_priv);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(240);
    obj.textEditor2:setField("anotacoes2");
    obj.textEditor2:setName("textEditor2");

    obj.anot = gui.fromHandle(_obj_newObject("layout"));
    obj.anot:setParent(obj.scrollBox1);
    obj.anot:setName("anot");
    obj.anot:setVisible(false);
    obj.anot:setLeft(0);
    obj.anot:setTop(285);
    obj.anot:setWidth(400);
    obj.anot:setHeight(280);

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.anot);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(400);
    obj.rectangle3:setHeight(280);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.anot);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(400);
    obj.label3:setHeight(20);
    obj.label3:setText("Anotações");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.anot);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(240);
    obj.textEditor3:setField("anotacoes3");
    obj.textEditor3:setName("textEditor3");

    obj.memoria = gui.fromHandle(_obj_newObject("layout"));
    obj.memoria:setParent(obj.scrollBox1);
    obj.memoria:setName("memoria");
    obj.memoria:setVisible(false);
    obj.memoria:setLeft(410);
    obj.memoria:setTop(285);
    obj.memoria:setWidth(400);
    obj.memoria:setHeight(280);

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.memoria);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(400);
    obj.rectangle4:setHeight(280);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(15);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.memoria);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(400);
    obj.label4:setHeight(20);
    obj.label4:setText("Memória do Personagem");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.memoria);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(240);
    obj.textEditor4:setField("anotacoes4");
    obj.textEditor4:setName("textEditor4");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.con_priv ~= nil then self.con_priv:destroy(); self.con_priv = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.memoria ~= nil then self.memoria:destroy(); self.memoria = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.anot ~= nil then self.anot:destroy(); self.anot = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmLH7 = {
    newEditor = newfrmLH7, 
    new = newfrmLH7, 
    name = "frmLH7", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH7 = _frmLH7;
rrpg.registrarForm(_frmLH7);

return _frmLH7;
