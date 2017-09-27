require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister03()
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
    obj:setName("frmBibliotecaRPGmeister03");
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
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(395);
    obj.label1:setHeight(25);
    obj.label1:setText("PERICIAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(50);
    obj.label2:setWidth(395);
    obj.label2:setHeight(25);
    obj.label2:setText("Usos Diferentes");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(75);
    obj.label3:setWidth(395);
    obj.label3:setHeight(25);
    obj.label3:setFontSize(11);
    obj.label3:setText(" - Algumas perícias podem ter uso diferente do padrão.");
    obj.label3:setName("label3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(55);
    obj.button1:setTop(100);
    obj.button1:setWidth(200);
    obj.button1:setText("Diplomacia");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(55);
    obj.button2:setTop(125);
    obj.button2:setWidth(200);
    obj.button2:setText("Falar Idioma");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(5);
    obj.button3:setTop(150);
    obj.button3:setWidth(200);
    obj.button3:setText("Perícias Raciais");
    obj.button3:setName("button3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(205);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(400);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(5);
    obj.label4:setTop(5);
    obj.label4:setWidth(395);
    obj.label4:setHeight(25);
    obj.label4:setText("TALENTOS");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle2);
    obj.button4:setLeft(5);
    obj.button4:setTop(50);
    obj.button4:setWidth(200);
    obj.button4:setText("Novos Talentos");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle2);
    obj.button5:setLeft(5);
    obj.button5:setTop(100);
    obj.button5:setWidth(200);
    obj.button5:setText("Novos Talentos Épicos");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle2);
    obj.button6:setLeft(5);
    obj.button6:setTop(150);
    obj.button6:setWidth(200);
    obj.button6:setText("Talentos Equivalentes");
    obj.button6:setName("button6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(5);
    obj.label5:setTop(170);
    obj.label5:setWidth(395);
    obj.label5:setHeight(25);
    obj.label5:setFontSize(11);
    obj.label5:setText(" - Regras para habilidades pegas múltiplas vezes por conta de características de classe duplicadas.");
    obj.label5:setName("label5");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(405);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(400);
    obj.rectangle3:setHeight(605);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setName("rectangle3");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setLeft(5);
    obj.label6:setTop(5);
    obj.label6:setWidth(395);
    obj.label6:setHeight(25);
    obj.label6:setText("MAGIAS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle3);
    obj.button7:setLeft(5);
    obj.button7:setTop(50);
    obj.button7:setWidth(200);
    obj.button7:setText("Signos");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle3);
    obj.button8:setLeft(55);
    obj.button8:setTop(75);
    obj.button8:setWidth(200);
    obj.button8:setText("Doutrinas");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle3);
    obj.button9:setLeft(5);
    obj.button9:setTop(125);
    obj.button9:setWidth(200);
    obj.button9:setText("Domínios");
    obj.button9:setName("button9");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setLeft(5);
    obj.label7:setTop(175);
    obj.label7:setWidth(395);
    obj.label7:setHeight(25);
    obj.label7:setText("Listas de Magias de Classe");
    obj.label7:setName("label7");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle3);
    obj.button10:setLeft(55);
    obj.button10:setTop(200);
    obj.button10:setWidth(200);
    obj.button10:setText("Alquimista");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle3);
    obj.button11:setLeft(55);
    obj.button11:setTop(225);
    obj.button11:setWidth(200);
    obj.button11:setText("Cultivador");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle3);
    obj.button12:setLeft(55);
    obj.button12:setTop(250);
    obj.button12:setWidth(200);
    obj.button12:setText("Duelista Arcano");
    obj.button12:setName("button12");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle3);
    obj.button13:setLeft(55);
    obj.button13:setTop(275);
    obj.button13:setWidth(200);
    obj.button13:setText("Elementalista");
    obj.button13:setName("button13");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle3);
    obj.button14:setLeft(55);
    obj.button14:setTop(300);
    obj.button14:setWidth(200);
    obj.button14:setText("Execrador");
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle3);
    obj.button15:setLeft(55);
    obj.button15:setTop(325);
    obj.button15:setWidth(200);
    obj.button15:setText("Executor");
    obj.button15:setName("button15");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle3);
    obj.button16:setLeft(55);
    obj.button16:setTop(350);
    obj.button16:setWidth(200);
    obj.button16:setText("Lâmina Arcana");
    obj.button16:setName("button16");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle3);
    obj.button17:setLeft(55);
    obj.button17:setTop(375);
    obj.button17:setWidth(200);
    obj.button17:setText("Mestre dos Itens Mágicos");
    obj.button17:setName("button17");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(810);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(400);
    obj.rectangle4:setHeight(605);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle4);
    obj.label8:setLeft(5);
    obj.label8:setTop(5);
    obj.label8:setWidth(395);
    obj.label8:setHeight(25);
    obj.label8:setText("DESCRIÇÕES");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle4);
    obj.button18:setLeft(5);
    obj.button18:setTop(50);
    obj.button18:setWidth(200);
    obj.button18:setText("Tendência");
    obj.button18:setName("button18");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle4);
    obj.label9:setLeft(5);
    obj.label9:setTop(100);
    obj.label9:setWidth(395);
    obj.label9:setHeight(25);
    obj.label9:setText("Religião");
    obj.label9:setName("label9");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle4);
    obj.button19:setLeft(55);
    obj.button19:setTop(125);
    obj.button19:setWidth(200);
    obj.button19:setText("Cultos");
    obj.button19:setName("button19");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle4);
    obj.button20:setLeft(55);
    obj.button20:setTop(150);
    obj.button20:setWidth(200);
    obj.button20:setText("Relações entre Cultos");
    obj.button20:setName("button20");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle4);
    obj.label10:setLeft(55);
    obj.label10:setTop(170);
    obj.label10:setWidth(395);
    obj.label10:setHeight(25);
    obj.label10:setFontSize(11);
    obj.label10:setText(" - A tabela está incompleta.");
    obj.label10:setName("label10");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle4);
    obj.button21:setLeft(55);
    obj.button21:setTop(200);
    obj.button21:setWidth(200);
    obj.button21:setText("Panteões");
    obj.button21:setName("button21");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle4);
    obj.button22:setLeft(5);
    obj.button22:setTop(250);
    obj.button22:setWidth(200);
    obj.button22:setText("Idades");
    obj.button22:setName("button22");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/9tfqbf4hwcu0j6t/Diplomacia.docx?dl=0');
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/16l6yd03ksqikcg/Idiomas.docx?dl=0');
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ifavh0i1ysypxqm/Pericias%20Raciais.docx?dl=0');
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/alp56fyooxhaks0/Novos%20Talentos.docx?dl=0');
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/p2ipjp3z88to50h/Novos%20Talentos%20%C3%89picos.docx?dl=0');
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ikiwxpl01h7cvqn/Talentos%20equivalentes.docx?dl=0');
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/c0iuyky0cpsdedv/Signos.docx?dl=0');
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/jimcg230bymgqv4/Doutrinas.docx?dl=0');
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/v6p4wgd4z6391a4/Novos%20dominios.docx?dl=0');
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/yym7ur8l7ogire8/Lista%20de%20formulas%20do%20alquimista.docx?dl=0');
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/30q95h1mw2mvbky/Extratos%20de%20Essencias.docx?dl=0');
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/risnouhziu69oj4/Magias%20do%20Duelista%20Arcano.docx?dl=0');
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ptdzac0l271e7jv/Elementalismo.docx?dl=0');
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ydb523lhcmn768q/Magias%20do%20Execrador.docx?dl=0');
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/izeyj7s6i5s0dq4/Lista%20de%20formulas%20do%20executor.docx?dl=0');
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/bkr407bs379n2pt/Magias%20do%20L%C3%A2mina%20Arcana.docx?dl=0');
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/skdiw7e179audqy/Magias%20do%20Mestre%20dos%20Itens%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/8tyws2w55r8yirw/Tend%C3%AAncias.docx?dl=0');
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1t2alvgjonoad3y/Religi%C3%A3o.docx?dl=0');
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2vpa4samjs0moxk/Rela%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j2o8ucsmjuv9smy/Pante%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/wnkzixhjjfyte3m/Idades.docx?dl=0');
        end, obj);

    function obj:_releaseEvents()
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
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
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

local _frmBibliotecaRPGmeister03 = {
    newEditor = newfrmBibliotecaRPGmeister03, 
    new = newfrmBibliotecaRPGmeister03, 
    name = "frmBibliotecaRPGmeister03", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBibliotecaRPGmeister03 = _frmBibliotecaRPGmeister03;
rrpg.registrarForm(_frmBibliotecaRPGmeister03);

return _frmBibliotecaRPGmeister03;
