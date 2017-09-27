require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister02()
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
    obj:setName("frmBibliotecaRPGmeister02");
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
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(605);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(395);
    obj.label1:setHeight(25);
    obj.label1:setText("RAÇAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(50);
    obj.button1:setWidth(200);
    obj.button1:setText("Súmario");
    obj.button1:setName("button1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(70);
    obj.label2:setWidth(395);
    obj.label2:setHeight(25);
    obj.label2:setFontSize(11);
    obj.label2:setText(" - Resumo das raças disponíveis. ");
    obj.label2:setName("label2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(5);
    obj.button2:setTop(100);
    obj.button2:setWidth(200);
    obj.button2:setText("Raças Hibridas");
    obj.button2:setName("button2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(120);
    obj.label3:setWidth(395);
    obj.label3:setHeight(25);
    obj.label3:setFontSize(11);
    obj.label3:setText(" - Raças mestiças e suas regras. ");
    obj.label3:setName("label3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(5);
    obj.button3:setTop(150);
    obj.button3:setWidth(200);
    obj.button3:setText("Raças por Plano");
    obj.button3:setName("button3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(5);
    obj.label4:setTop(170);
    obj.label4:setWidth(395);
    obj.label4:setHeight(25);
    obj.label4:setFontSize(11);
    obj.label4:setText(" - Separação das raças por plano de origem e onde existem.");
    obj.label4:setName("label4");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(5);
    obj.button4:setTop(200);
    obj.button4:setWidth(200);
    obj.button4:setText("Ajuste de Nível");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(55);
    obj.button5:setTop(225);
    obj.button5:setWidth(200);
    obj.button5:setText("Reduzindo o Ajuste");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(5);
    obj.button6:setTop(275);
    obj.button6:setWidth(200);
    obj.button6:setText("Raças");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(55);
    obj.button7:setTop(300);
    obj.button7:setWidth(200);
    obj.button7:setText("Primatas");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(55);
    obj.button8:setTop(325);
    obj.button8:setWidth(200);
    obj.button8:setText("Elfos");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setLeft(55);
    obj.button9:setTop(350);
    obj.button9:setWidth(200);
    obj.button9:setText("Anões");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setLeft(55);
    obj.button10:setTop(375);
    obj.button10:setWidth(200);
    obj.button10:setText("Gnomos");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(55);
    obj.button11:setTop(400);
    obj.button11:setWidth(200);
    obj.button11:setText("Halflings");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(55);
    obj.button12:setTop(425);
    obj.button12:setWidth(200);
    obj.button12:setText("Repteis");
    obj.button12:setName("button12");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setLeft(55);
    obj.button13:setTop(450);
    obj.button13:setWidth(200);
    obj.button13:setText("Leporideos");
    obj.button13:setName("button13");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setLeft(55);
    obj.button14:setTop(475);
    obj.button14:setWidth(200);
    obj.button14:setText("Felinos");
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setLeft(55);
    obj.button15:setTop(500);
    obj.button15:setWidth(200);
    obj.button15:setText("Caninos");
    obj.button15:setName("button15");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle1);
    obj.button16:setLeft(55);
    obj.button16:setTop(525);
    obj.button16:setWidth(200);
    obj.button16:setText("Humanoides Monstruosos");
    obj.button16:setName("button16");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle1);
    obj.button17:setLeft(55);
    obj.button17:setTop(550);
    obj.button17:setWidth(200);
    obj.button17:setText("Fadas");
    obj.button17:setName("button17");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle1);
    obj.button18:setLeft(55);
    obj.button18:setTop(575);
    obj.button18:setWidth(200);
    obj.button18:setText("Extraplanares Nativos");
    obj.button18:setName("button18");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(405);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(605);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(5);
    obj.label5:setTop(5);
    obj.label5:setWidth(395);
    obj.label5:setHeight(25);
    obj.label5:setText("CLASSES");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle2);
    obj.button19:setLeft(5);
    obj.button19:setTop(50);
    obj.button19:setWidth(200);
    obj.button19:setText("Súmario");
    obj.button19:setName("button19");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(5);
    obj.label6:setTop(70);
    obj.label6:setWidth(395);
    obj.label6:setHeight(25);
    obj.label6:setFontSize(10);
    obj.label6:setText(" - Lista das classes e seus planos de origem.");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(5);
    obj.label7:setTop(80);
    obj.label7:setWidth(395);
    obj.label7:setHeight(25);
    obj.label7:setFontSize(10);
    obj.label7:setText(" - Observe que mesmo as classes básicas as vezes possuem alterações.");
    obj.label7:setName("label7");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle2);
    obj.button20:setLeft(5);
    obj.button20:setTop(100);
    obj.button20:setWidth(200);
    obj.button20:setText("Classe Favorecida");
    obj.button20:setName("button20");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(120);
    obj.label8:setWidth(395);
    obj.label8:setHeight(25);
    obj.label8:setFontSize(11);
    obj.label8:setText(" - Nova regra para classes favorecidas. ");
    obj.label8:setName("label8");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle2);
    obj.button21:setLeft(5);
    obj.button21:setTop(150);
    obj.button21:setWidth(200);
    obj.button21:setText("Multiclasse");
    obj.button21:setName("button21");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(5);
    obj.label9:setTop(170);
    obj.label9:setWidth(395);
    obj.label9:setHeight(25);
    obj.label9:setFontSize(11);
    obj.label9:setText(" - Regras da mesa para personagem multiclasse.");
    obj.label9:setName("label9");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle2);
    obj.button22:setLeft(5);
    obj.button22:setTop(200);
    obj.button22:setWidth(200);
    obj.button22:setText("Descrição das Classes");
    obj.button22:setName("button22");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(5);
    obj.label10:setTop(220);
    obj.label10:setWidth(395);
    obj.label10:setHeight(25);
    obj.label10:setFontSize(11);
    obj.label10:setText(" - Descrição individual de cada classe. ");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle2);
    obj.label11:setLeft(5);
    obj.label11:setTop(250);
    obj.label11:setWidth(395);
    obj.label11:setHeight(25);
    obj.label11:setText("Alternativas de Classe");
    obj.label11:setName("label11");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle2);
    obj.button23:setLeft(55);
    obj.button23:setTop(275);
    obj.button23:setWidth(200);
    obj.button23:setText("Companheiro Animal");
    obj.button23:setName("button23");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zc4131x9qj0rh1t/Ra%C3%A7as.docx?dl=0');
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/br7f1g2ahjy6508/Ra%C3%A7as%20hibridas.docx?dl=0');
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/u33asu0jw6xacyt/Ra%C3%A7as%20por%20plano.docx?dl=0');
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/95rrwibxq2icbpg/Ajuste%20de%20N%C3%ADvel.docx?dl=0');
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/3d6fndbbpj67574/Reduzindo%20ajuste%20de%20n%C3%ADvel.docx?dl=0');
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/g80mv7wohkxb5wf/AACcknnLASBp5jeXUg85bLO9a?dl=0');
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/niq3hkmfcuyus8t/AABbUhvHcInnMcLSMniiIoqFa?dl=0');
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ylq1dq1d7z23870/AAAKQVYpkGdmCMPNwaCUsnbZa?dl=0');
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/r7o5fbd85lslou2/AABBSX10dINbsOiAU9WqgTgNa?dl=0');
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/r4xp6imj97hx60t/AABUSzB0apDBtHFrC2-F4EG2a?dl=0');
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/cf1a1sb1s4kw061/AADzGHb5VV7CCX2T1Zq6eIKPa?dl=0');
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/qfrkxqu3bkffpzv/AABFrS8PnadoC6RavbLd2QUka?dl=0');
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/0v5ih8us8g5sdwv/AAC1lkFupID6bxqXpAYduMOUa?dl=0');
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/jgmac3hptgbswze/AABHUfMRwuzoxCyGa7aO8bN1a?dl=0');
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/daftbg5sw3kcje9/AADNDrYtQWXaIlka5ZtS-ccYa?dl=0');
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ozbnjl0ktzzxe0t/AACznpMEeELx-NSNMaPpqUNva?dl=0');
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/l9q0ate5gkg6tvy/AAACvwxQ_WLNw4kbGjsAgrK8a?dl=0');
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/2umf17hzoags2ql/AAB6TzxdzE5VPMmNQa21xDHTa?dl=0');
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/7jn484upuwrs5o9/Classes.docx?dl=0');
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/y58v5caoovnohzv/Classes%20Favorecidas.docx?dl=0');
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fbt7v6i1fssk0i2/Multiclasse.docx?dl=0');
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/fdkfgge18b7grtn/AABBoaLP49SVZm9YH-Vh_fVta?dl=0');
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/srjih41d70ng1g4/Companheiro%20Animal.docx?dl=0');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBibliotecaRPGmeister02 = {
    newEditor = newfrmBibliotecaRPGmeister02, 
    new = newfrmBibliotecaRPGmeister02, 
    name = "frmBibliotecaRPGmeister02", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBibliotecaRPGmeister02 = _frmBibliotecaRPGmeister02;
rrpg.registrarForm(_frmBibliotecaRPGmeister02);

return _frmBibliotecaRPGmeister02;
