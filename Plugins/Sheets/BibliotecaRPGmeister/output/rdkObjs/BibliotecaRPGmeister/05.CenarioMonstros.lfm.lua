require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister05()
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
    obj:setName("frmBibliotecaRPGmeister05");
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
    obj.label1:setText("CENARIO");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(50);
    obj.button1:setWidth(200);
    obj.button1:setText("Os Planos");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(55);
    obj.button2:setTop(75);
    obj.button2:setWidth(200);
    obj.button2:setText("Paraiso");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(55);
    obj.button3:setTop(100);
    obj.button3:setWidth(200);
    obj.button3:setText("Efíria");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(55);
    obj.button4:setTop(125);
    obj.button4:setWidth(200);
    obj.button4:setText("Centelha");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(55);
    obj.button5:setTop(150);
    obj.button5:setWidth(200);
    obj.button5:setText("SobAlec");
    obj.button5:setName("button5");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(80);
    obj.label2:setTop(175);
    obj.label2:setWidth(395);
    obj.label2:setHeight(25);
    obj.label2:setText("Sob");
    obj.label2:setName("label2");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(105);
    obj.button6:setTop(200);
    obj.button6:setWidth(200);
    obj.button6:setText("Republica Arcana");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(55);
    obj.button7:setTop(225);
    obj.button7:setWidth(200);
    obj.button7:setText("Ardeal");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(105);
    obj.button8:setTop(250);
    obj.button8:setWidth(200);
    obj.button8:setText("Imperio do Oriente");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setLeft(55);
    obj.button9:setTop(275);
    obj.button9:setWidth(200);
    obj.button9:setText("Abismo");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setLeft(55);
    obj.button10:setTop(300);
    obj.button10:setWidth(200);
    obj.button10:setText("Diaféle");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(55);
    obj.button11:setTop(325);
    obj.button11:setWidth(200);
    obj.button11:setText("Inferno");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(5);
    obj.button12:setTop(375);
    obj.button12:setWidth(200);
    obj.button12:setText("Escravidão");
    obj.button12:setName("button12");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(405);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(605);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setLeft(5);
    obj.label3:setTop(5);
    obj.label3:setWidth(395);
    obj.label3:setHeight(25);
    obj.label3:setText("MONSTROS");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle2);
    obj.button13:setLeft(5);
    obj.button13:setTop(50);
    obj.button13:setWidth(200);
    obj.button13:setText("Monstros Diferentes");
    obj.button13:setName("button13");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(5);
    obj.label4:setTop(100);
    obj.label4:setWidth(395);
    obj.label4:setHeight(25);
    obj.label4:setText("Novos Monstros");
    obj.label4:setName("label4");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle2);
    obj.button14:setLeft(5);
    obj.button14:setTop(125);
    obj.button14:setWidth(200);
    obj.button14:setText("Espirito Possessor");
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle2);
    obj.button15:setLeft(5);
    obj.button15:setTop(175);
    obj.button15:setWidth(200);
    obj.button15:setText("Progressão Selvagem");
    obj.button15:setName("button15");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1aw740u9b3wvjrt/Os%20Planos.docx?dl=0');
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/9g61gaiqp1w26pj/AAB6L8e2tCRr-SIpuT3USDu8a?dl=0');
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/y2k6m6txanthymt/AABWdGLGGHmf5Zm5SZ5NuyBGa?dl=0');
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/dhm0ej851nwvajd/AABBIgmm9z1vtlTFtv1vzyTFa?dl=0');
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ra93f3459bm1599/AAC8ddVoiSn2s4MAHdtTYkHCa?dl=0');
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/z8d3w39ohi7d30z/AACuzzRRpK7q0i6P8PZMhM8ka?dl=0');
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ufgop6i95f291wt/AAAlAuAEkRhwJR07fDe-OhVZa?dl=0');
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/w9n6kypcgp26tcr/AABo3e-AU3b3iYYBmeSQ2Bq2a?dl=0');
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/qtxprhcc5wg67m7/AAD42F9E38y91g9Vs5-FIccta?dl=0');
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ck4kjvwoyq18mqq/AACdzNfXQecCv3WFS9y5TaPTa?dl=0');
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/wut4r54ypjdsvtm/AAAROtZ746UjrJInElkn_xS9a?dl=0');
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/10b630bqoul2iv1/Como%20a%20Escravid%C3%A3o%20%C3%A9%20vista%20em%20cada%20plano.docx?dl=0');
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/92oujsl7fxdovyw/Monstros%20Diferentes.docx?dl=0');
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/rrr5b02wow5uksp/Espirito%20Possessor.docx?dl=0');
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/e0e1afgbzhv93qk/Progress%C3%B5es%20Selvagens.docx?dl=0');
        end, obj);

    function obj:_releaseEvents()
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
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBibliotecaRPGmeister05 = {
    newEditor = newfrmBibliotecaRPGmeister05, 
    new = newfrmBibliotecaRPGmeister05, 
    name = "frmBibliotecaRPGmeister05", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBibliotecaRPGmeister05 = _frmBibliotecaRPGmeister05;
rrpg.registrarForm(_frmBibliotecaRPGmeister05);

return _frmBibliotecaRPGmeister05;
