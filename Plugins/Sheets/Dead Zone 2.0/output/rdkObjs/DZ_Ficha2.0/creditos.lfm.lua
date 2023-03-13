require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaCreditos()
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
    obj:setName("frmFichaCreditos");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(500);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("logo_mesa");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(480);
    obj.image2:setTop(0);
    obj.image2:setWidth(350);
    obj.image2:setHeight(125);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("https://i.imgur.com/HNK29eO.png?1");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(500);
    obj.image3:setTop(125);
    obj.image3:setWidth(350);
    obj.image3:setHeight(125);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("https://i.imgur.com/Xp12RUs.png");
    obj.image3:setName("image3");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(460);
    obj.layout1:setTop(290);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(160);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(20);
    obj.label1:setText("Ficha criada por ");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(0);
    obj.label2:setTop(35);
    obj.label2:setWidth(200);
    obj.label2:setHeight(20);
    obj.label2:setText("Marcio F. (Samelfero)");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(0);
    obj.label3:setTop(60);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("para o sistema Dead Zone");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(0);
    obj.label4:setTop(85);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("escrito por");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(0);
    obj.label5:setTop(105);
    obj.label5:setWidth(200);
    obj.label5:setHeight(20);
    obj.label5:setText("Allan (allan_fns)");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(560);
    obj.label6:setTop(480);
    obj.label6:setWidth(210);
    obj.label6:setHeight(20);
    obj.label6:setText("Sua Versão: 2.5");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(555);
    obj.button1:setTop(500);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setHint("Abre as notas de atualização da ficha");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(667);
    obj.button2:setTop(500);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setHint("Baixa a versão mais recente da ficha");
    obj.button2:setName("button2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(680);
    obj.layout2:setTop(290);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(160);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(0);
    obj.label7:setTop(10);
    obj.label7:setWidth(200);
    obj.label7:setHeight(20);
    obj.label7:setText("Mecânicas e implementações");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(0);
    obj.label8:setTop(35);
    obj.label8:setWidth(200);
    obj.label8:setHeight(20);
    obj.label8:setFontSize(11.5);
    obj.label8:setText("Por MestreWill nick: (WillXOkumura)");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(50);
    obj.button3:setTop(60);
    obj.button3:setWidth(100);
    obj.button3:setHeight(20);
    obj.button3:setText("Atualizar");
    obj.button3:setHint("Baixa a versão com mecânicas");
    obj.button3:setFontColor("yellow");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(50);
    obj.button4:setTop(90);
    obj.button4:setWidth(100);
    obj.button4:setHeight(20);
    obj.button4:setText("Meu GitHub");
    obj.button4:setHint("Baixa a versão com mecânicas");
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setFontColor("red");
    obj.button4:setName("button4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(0);
    obj.label9:setTop(120);
    obj.label9:setWidth(200);
    obj.label9:setHeight(20);
    obj.label9:setFontSize(15);
    obj.label9:setText("Atualização provisória");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Dead%20Zone%202.0/README.md')
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/ooicram/DeadZoneRPG/raw/master/Plugins/Sheets/Dead%20Zone%202.0/output/Dead%20Zone%202.0.rpk')
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://dl.dropboxusercontent.com/s/cczyaqmrwjo93r1/Dead_Zone_2.0_1.rpk?dl=0')
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/MestreWilll')
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaCreditos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaCreditos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaCreditos = {
    newEditor = newfrmFichaCreditos, 
    new = newfrmFichaCreditos, 
    name = "frmFichaCreditos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaCreditos = _frmFichaCreditos;
Firecast.registrarForm(_frmFichaCreditos);

return _frmFichaCreditos;
