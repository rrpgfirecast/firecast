require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmLH2_1()
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
    obj:setName("frmLH2_1");
    obj:setWidth(322);
    obj:setHeight(287);
    obj:setTheme("dark");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(1);
    obj.layout1:setTop(1);
    obj.layout1:setWidth(320);
    obj.layout1:setHeight(285);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(320);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(50);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(160);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome_habilidade");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(215);
    obj.label2:setTop(0);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("Max HR");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(265);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("hr_habilidade");
    obj.edit2:setName("edit2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(30);
    obj.layout3:setWidth(320);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(5);
    obj.label3:setTop(0);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Tipo");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(50);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(110);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipo_habilidade");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(165);
    obj.label4:setTop(0);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("TAG");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(210);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(105);
    obj.edit4:setHeight(25);
    obj.edit4:setField("tag_habilidade");
    obj.edit4:setName("edit4");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(55);
    obj.layout4:setWidth(320);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(5);
    obj.label5:setTop(0);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("Teste");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(50);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(110);
    obj.edit5:setHeight(25);
    obj.edit5:setField("teste_habilidade");
    obj.edit5:setName("edit5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setLeft(165);
    obj.label6:setTop(0);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setText("Timming");
    obj.label6:setFontSize(11);
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setLeft(210);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(105);
    obj.edit6:setHeight(25);
    obj.edit6:setField("timming_habilidade");
    obj.edit6:setName("edit6");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(80);
    obj.layout5:setWidth(320);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setLeft(5);
    obj.label7:setTop(0);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setText("Alvo");
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setLeft(50);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(110);
    obj.edit7:setHeight(25);
    obj.edit7:setField("alvo_habilidade");
    obj.edit7:setName("edit7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setLeft(165);
    obj.label8:setTop(0);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("Custo");
    obj.label8:setName("label8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setLeft(210);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(105);
    obj.edit8:setHeight(25);
    obj.edit8:setField("custo_habilidade");
    obj.edit8:setName("edit8");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(105);
    obj.layout6:setWidth(320);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setLeft(5);
    obj.label9:setTop(0);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setText("Alcance");
    obj.label9:setFontSize(12);
    obj.label9:setName("label9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setLeft(50);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(110);
    obj.edit9:setHeight(25);
    obj.edit9:setField("alcance_habilidade");
    obj.edit9:setName("edit9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setLeft(165);
    obj.label10:setTop(0);
    obj.label10:setWidth(100);
    obj.label10:setHeight(25);
    obj.label10:setText("Limite");
    obj.label10:setName("label10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(210);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(105);
    obj.edit10:setHeight(25);
    obj.edit10:setField("limite_habilidade");
    obj.edit10:setName("edit10");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(130);
    obj.layout7:setWidth(320);
    obj.layout7:setHeight(150);
    obj.layout7:setName("layout7");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setLeft(5);
    obj.label11:setTop(0);
    obj.label11:setWidth(320);
    obj.label11:setHeight(25);
    obj.label11:setText("EFEITO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout7);
    obj.button1:setLeft(290);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout7);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(310);
    obj.textEditor1:setHeight(125);
    obj.textEditor1:setField("efeito_habilidade");
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa habilidade?",
            							function (confirmado)
            								if confirmado then
            									ndb.deleteNode(sheet);
            								end;
            						end);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmLH2_1 = {
    newEditor = newfrmLH2_1, 
    new = newfrmLH2_1, 
    name = "frmLH2_1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH2_1 = _frmLH2_1;
rrpg.registrarForm(_frmLH2_1);

return _frmLH2_1;
