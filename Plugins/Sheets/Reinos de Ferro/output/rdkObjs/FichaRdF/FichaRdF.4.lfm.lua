require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRDF4()
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
    obj:setName("frmRDF4");
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
    obj.layout1:setWidth(555);
    obj.layout1:setHeight(610);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(520);
    obj.label1:setHeight(20);
    obj.label1:setText("MAGIAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(545);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Tradição Arcana");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(400);
    obj.edit1:setHeight(25);
    obj.edit1:setField("tradicao_arcana");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(50);
    obj.layout3:setWidth(545);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("NOME");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(200);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("CST");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(250);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("ALC");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(300);
    obj.label6:setTop(5);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("ADE");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(350);
    obj.label7:setTop(5);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("POD");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(400);
    obj.label8:setTop(5);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("MAN");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(450);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("OFE");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(500);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rclMagias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout1);
    obj.rclMagias:setLeft(5);
    obj.rclMagias:setTop(75);
    obj.rclMagias:setWidth(545);
    obj.rclMagias:setHeight(530);
    obj.rclMagias:setMinQt(1);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("frmRDF4_1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(565);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(565);
    obj.layout4:setHeight(610);
    obj.layout4:setName("layout4");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setLeft(5);
    obj.label10:setTop(0);
    obj.label10:setWidth(555);
    obj.label10:setHeight(20);
    obj.label10:setText("MEKÂNICA");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(275);
    obj.layout5:setHeight(145);
    obj.layout5:setName("layout5");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(275);
    obj.label11:setHeight(20);
    obj.label11:setText("Cárter");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout5);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(20);
    obj.textEditor1:setWidth(275);
    obj.textEditor1:setHeight(125);
    obj.textEditor1:setField("mek_carter");
    obj.textEditor1:setName("textEditor1");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setLeft(285);
    obj.layout6:setTop(25);
    obj.layout6:setWidth(275);
    obj.layout6:setHeight(145);
    obj.layout6:setName("layout6");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout6);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(275);
    obj.label12:setHeight(20);
    obj.label12:setText("Placa Rúnica");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout6);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(20);
    obj.textEditor2:setWidth(275);
    obj.textEditor2:setHeight(125);
    obj.textEditor2:setField("mek_placa_runica");
    obj.textEditor2:setName("textEditor2");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(170);
    obj.layout7:setWidth(275);
    obj.layout7:setHeight(145);
    obj.layout7:setName("layout7");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout7);
    obj.label13:setLeft(0);
    obj.label13:setTop(0);
    obj.label13:setWidth(275);
    obj.label13:setHeight(20);
    obj.label13:setText("Capacitor");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout7);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(20);
    obj.textEditor3:setWidth(275);
    obj.textEditor3:setHeight(125);
    obj.textEditor3:setField("mek_capacitor");
    obj.textEditor3:setName("textEditor3");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setLeft(285);
    obj.layout8:setTop(170);
    obj.layout8:setWidth(275);
    obj.layout8:setHeight(145);
    obj.layout8:setName("layout8");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(0);
    obj.label14:setTop(0);
    obj.label14:setWidth(275);
    obj.label14:setHeight(20);
    obj.label14:setText("Placa Rúnica");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout8);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(20);
    obj.textEditor4:setWidth(275);
    obj.textEditor4:setHeight(125);
    obj.textEditor4:setField("mek_placa_runica2");
    obj.textEditor4:setName("textEditor4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(315);
    obj.layout9:setWidth(275);
    obj.layout9:setHeight(145);
    obj.layout9:setName("layout9");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(0);
    obj.label15:setTop(0);
    obj.label15:setWidth(275);
    obj.label15:setHeight(20);
    obj.label15:setText("Notas");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout9);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(20);
    obj.textEditor5:setWidth(275);
    obj.textEditor5:setHeight(125);
    obj.textEditor5:setField("mek_notas");
    obj.textEditor5:setName("textEditor5");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout4);
    obj.layout10:setLeft(285);
    obj.layout10:setTop(315);
    obj.layout10:setWidth(275);
    obj.layout10:setHeight(145);
    obj.layout10:setName("layout10");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(275);
    obj.label16:setHeight(20);
    obj.label16:setText("Beneficio");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout10);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(20);
    obj.textEditor6:setWidth(275);
    obj.textEditor6:setHeight(125);
    obj.textEditor6:setField("mek_beneficio");
    obj.textEditor6:setName("textEditor6");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout4);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(460);
    obj.layout11:setWidth(275);
    obj.layout11:setHeight(145);
    obj.layout11:setName("layout11");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout11);
    obj.label17:setLeft(0);
    obj.label17:setTop(0);
    obj.label17:setWidth(275);
    obj.label17:setHeight(20);
    obj.label17:setText("Capacitores");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout11);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(20);
    obj.textEditor7:setWidth(275);
    obj.textEditor7:setHeight(125);
    obj.textEditor7:setField("mek_capacitores");
    obj.textEditor7:setName("textEditor7");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout4);
    obj.layout12:setLeft(285);
    obj.layout12:setTop(460);
    obj.layout12:setWidth(275);
    obj.layout12:setHeight(145);
    obj.layout12:setName("layout12");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout12);
    obj.label18:setLeft(0);
    obj.label18:setTop(0);
    obj.label18:setWidth(275);
    obj.label18:setHeight(20);
    obj.label18:setText("Cargas");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout12);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(20);
    obj.textEditor8:setWidth(275);
    obj.textEditor8:setHeight(125);
    obj.textEditor8:setField("mek_cargas");
    obj.textEditor8:setName("textEditor8");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclMagias:append();
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

        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRDF4 = {
    newEditor = newfrmRDF4, 
    new = newfrmRDF4, 
    name = "frmRDF4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRDF4 = _frmRDF4;
rrpg.registrarForm(_frmRDF4);

return _frmRDF4;
