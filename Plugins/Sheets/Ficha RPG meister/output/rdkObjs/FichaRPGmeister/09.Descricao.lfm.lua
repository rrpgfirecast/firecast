require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister9_svg()
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
    obj:setName("frmFichaRPGmeister9_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1205);
    obj.rectangle1:setHeight(105);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(3);
    obj.label1:setTop(1);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("DESCRIÇÃO");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(10);
    obj.label2:setTop(25);
    obj.label2:setWidth(90);
    obj.label2:setHeight(20);
    obj.label2:setText("TAMANHO");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(100);
    obj.comboBox1:setTop(25);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("tamanho");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Minúsculo', 'Diminuto', 'Miúdo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.comboBox1:setValues({'-4','-3','-2','-1','0','1','2','3','4'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle1);
    obj.checkBox1:setLeft(200);
    obj.checkBox1:setTop(25);
    obj.checkBox1:setWidth(100);
    obj.checkBox1:setField("quadrupede");
    obj.checkBox1:setText("Quadrúpede");
    obj.checkBox1:setName("checkBox1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(10);
    obj.label3:setTop(50);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("ALTURA");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(50);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("altura");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(10);
    obj.label4:setTop(75);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("PESO");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(75);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("peso");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(310);
    obj.label5:setTop(25);
    obj.label5:setWidth(90);
    obj.label5:setHeight(20);
    obj.label5:setText("IDADE");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(400);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("idade");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(310);
    obj.label6:setTop(50);
    obj.label6:setWidth(90);
    obj.label6:setHeight(20);
    obj.label6:setText("SEXO");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(400);
    obj.edit4:setTop(50);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("sexo");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(310);
    obj.label7:setTop(75);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("OUTROS");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(400);
    obj.edit5:setTop(75);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("aparenciaOutros");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(610);
    obj.label8:setTop(25);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("OLHOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(700);
    obj.edit6:setTop(25);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("aparenciaOlhos");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(610);
    obj.label9:setTop(50);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("PELE");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(700);
    obj.edit7:setTop(50);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("pele");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(610);
    obj.label10:setTop(75);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("CABELO");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(700);
    obj.edit8:setTop(75);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("cabelo");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setLeft(910);
    obj.label11:setTop(25);
    obj.label11:setWidth(90);
    obj.label11:setHeight(20);
    obj.label11:setText("PLANO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(1000);
    obj.edit9:setTop(25);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("plano");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setLeft(910);
    obj.label12:setTop(50);
    obj.label12:setWidth(90);
    obj.label12:setHeight(20);
    obj.label12:setText("REGIÃO");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(1000);
    obj.edit10:setTop(50);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("regiao");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle1);
    obj.label13:setLeft(910);
    obj.label13:setTop(75);
    obj.label13:setWidth(90);
    obj.label13:setHeight(20);
    obj.label13:setText("REINO");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(1000);
    obj.edit11:setTop(75);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(25);
    obj.edit11:setField("reino");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'tamanho', 'quadrupede'});
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(110);
    obj.layout1:setWidth(375);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setLeft(5);
    obj.label14:setTop(1);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("APARÊNCIA");
    obj.label14:setName("label14");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(355);
    obj.layout2:setWidth(375);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(5);
    obj.label15:setTop(1);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setText("PERSONALIDADE");
    obj.label15:setName("label15");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(825);
    obj.layout3:setHeight(495);
    obj.layout3:setName("layout3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(5);
    obj.label16:setTop(1);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setText("HISTORIA");
    obj.label16:setName("label16");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(720);
    obj.button1:setTop(1);
    obj.button1:setWidth(100);
    obj.button1:setHeight(20);
    obj.button1:setText("Copiar Antigo");
    obj.button1:setName("button1");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout3);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Tamanho. ");
            						index = index + 1;
            					end;
            					local str = tonumber(sheet.efetFor) or 1;
            					local size = tonumber(sheet.tamanho) or 0;
            					local quad = sheet.quadrupede;
            
            					local mult = 1;
            					local mod1 = 0;
            					local mod2 = 0;
            
            					if size == -4 then
            						if quad then
            							mult = 1 / 4;
            						else
            							mult = 1 / 8;
            						end;
            						mod1 = 8;
            						mod2 = 16;
            					elseif size == -3 then
            						if quad then
            							mult = 1 / 2;
            						else
            							mult = 1 / 4;
            						end;
            						mod1 = 4;
            						mod2 = 12;
            					elseif size == -2 then
            						if quad then
            							mult = 3 / 4;
            						else
            							mult = 1 / 2;
            						end;
            						mod1 = 2;
            						mod2 = 8;
            					elseif size == -1 then
            						if quad then
            							mult = 1;
            						else
            							mult = 3 / 4;
            						end;
            						mod1 = 1;
            						mod2 = 4;
            					elseif size == 0 then
            						if quad then
            							mult = 1.5;
            						else
            							mult = 1;
            						end;
            					elseif size == 1 then
            						if quad then
            							mult = 3;
            						else
            							mult = 2;
            						end;
            						mod1 = -1;
            						mod2 = -4;
            					elseif size == 2 then
            						if quad then
            							mult = 6;
            						else
            							mult = 4;
            						end;
            						mod1 = -2;
            						mod2 = -8;
            					elseif size == 3 then
            						if quad then
            							mult = 12;
            						else
            							mult = 8;
            						end;
            						mod1 = -4;
            						mod2 = -12;
            					elseif size == 4 then
            						if quad then
            							mult = 24;
            						else
            							mult = 16;
            						end;
            						mod1 = -8;
            						mod2 = -16;
            					end;
            
            					while str > 29 do
            						mult = mult * 4;
            						str = str - 10;
            					end;
            
            					if str < 1 then
            						str = 1;
            					end;
            
            					local load = ndb.load("loads.xml");
            
            					local light = (load.light[str] * mult);
            					local medium = (load.medium[str] * mult);
            					local heavy = (load.heavy[str] * mult);
            
            					sheet.cargaLeve = light .. "Kg";
            					sheet.cargaMedia = medium .. "Kg";
            					sheet.cargaPesada = heavy .. "Kg";
            
            					sheet.agarrarTam = 0 - mod2;
            					sheet.tamanhoCa = mod1;
            				end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            System.setClipboardText(sheet.historia);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister9_svg = {
    newEditor = newfrmFichaRPGmeister9_svg, 
    new = newfrmFichaRPGmeister9_svg, 
    name = "frmFichaRPGmeister9_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister9_svg = _frmFichaRPGmeister9_svg;
rrpg.registrarForm(_frmFichaRPGmeister9_svg);

return _frmFichaRPGmeister9_svg;
