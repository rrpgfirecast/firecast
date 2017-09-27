require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister01()
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
    obj:setName("frmBibliotecaRPGmeister01");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(600);
    obj.image1:setHeight(600);
    obj.image1:setSRC("/BibliotecaRPGmeister/images/RPGmeister.jpg");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(620);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(150);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(10);
    obj.label1:setTop(5);
    obj.label1:setWidth(590);
    obj.label1:setHeight(140);
    obj.label1:setText("Sumario:\nAba 2: Racas e Classes\nAba 3: Pericias, Talentos, Magias e Descricoes\nAba 4: Equipamentos, Combates e Aventuras\nAba 5: Cenario e Monstros.");
    obj.label1:setName("label1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(620);
    obj.layout1:setTop(450);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(150);
    obj.layout1:setName("layout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(5);
    obj.label2:setTop(5);
    obj.label2:setWidth(190);
    obj.label2:setHeight(140);
    obj.label2:setFontSize(12);
    obj.label2:setAutoSize(true);
    obj.label2:setText(" Programador: Vinny (Ambesek)\n\n  Esse plugin foi criando tanto para\n  facilitar o acesso aos links do\n  dropbox quanto para permitir o\n  acesso por jogadores mobile da\n  biblioteca do cenario.");
    obj.label2:setName("label2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(840);
    obj.button1:setTop(475);
    obj.button1:setWidth(100);
    obj.button1:setText("Plugin Ficha");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(950);
    obj.button2:setTop(475);
    obj.button2:setWidth(100);
    obj.button2:setText("Copiar Link");
    obj.button2:setName("button2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(851);
    obj.label3:setTop(500);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("SUA VERSAO:");
    obj.label3:setName("label3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(950);
    obj.rectangle3:setTop(499);
    obj.rectangle3:setWidth(102);
    obj.rectangle3:setHeight(22);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(951);
    obj.image2:setTop(500);
    obj.image2:setWidth(100);
    obj.image2:setHeight(20);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao02.png");
    obj.image2:setName("image2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(851);
    obj.label4:setTop(525);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("VERSAO ATUAL:");
    obj.label4:setName("label4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(950);
    obj.rectangle4:setTop(524);
    obj.rectangle4:setWidth(102);
    obj.rectangle4:setHeight(22);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(951);
    obj.image3:setTop(525);
    obj.image3:setWidth(100);
    obj.image3:setHeight(20);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/release.png");
    obj.image3:setName("image3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(840);
    obj.button3:setTop(550);
    obj.button3:setWidth(100);
    obj.button3:setText("Change Log");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(950);
    obj.button4:setTop(550);
    obj.button4:setWidth(100);
    obj.button4:setText("Atualizar");
    obj.button4:setName("button4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(830);
    obj.label5:setTop(575);
    obj.label5:setWidth(120);
    obj.label5:setHeight(20);
    obj.label5:setText("CONHECA A MESA:");
    obj.label5:setName("label5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(950);
    obj.button5:setTop(575);
    obj.button5:setWidth(100);
    obj.button5:setText("RPGmeister");
    obj.button5:setName("button5");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/Ficha%20RPG%20meister.rpk')
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            system.setClipboardText('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/Ficha%20RPG%20meister.rpk')
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/BibliotecaRPGmeister.rpk')
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBibliotecaRPGmeister01 = {
    newEditor = newfrmBibliotecaRPGmeister01, 
    new = newfrmBibliotecaRPGmeister01, 
    name = "frmBibliotecaRPGmeister01", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBibliotecaRPGmeister01 = _frmBibliotecaRPGmeister01;
rrpg.registrarForm(_frmBibliotecaRPGmeister01);

return _frmBibliotecaRPGmeister01;
