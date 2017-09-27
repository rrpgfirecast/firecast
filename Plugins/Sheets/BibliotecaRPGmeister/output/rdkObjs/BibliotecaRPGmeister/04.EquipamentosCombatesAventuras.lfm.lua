require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister04()
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
    obj:setName("frmBibliotecaRPGmeister04");
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
    obj.label1:setText("EQUIPAMENTOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(50);
    obj.button1:setWidth(200);
    obj.button1:setText("Armas");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(55);
    obj.button2:setTop(75);
    obj.button2:setWidth(200);
    obj.button2:setText("Armas Mágicas");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(55);
    obj.button3:setTop(100);
    obj.button3:setWidth(200);
    obj.button3:setText("Armas Únicas");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(55);
    obj.button4:setTop(125);
    obj.button4:setWidth(200);
    obj.button4:setText("Munição");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(55);
    obj.button5:setTop(150);
    obj.button5:setWidth(200);
    obj.button5:setText("Regras para novas Armas");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(5);
    obj.button6:setTop(200);
    obj.button6:setWidth(200);
    obj.button6:setText("Armaduras e Escudos");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(55);
    obj.button7:setTop(225);
    obj.button7:setWidth(200);
    obj.button7:setText("Armaduras e Escudos Mágicos");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(55);
    obj.button8:setTop(250);
    obj.button8:setWidth(200);
    obj.button8:setText("Armaduras e Escudos Únicos");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setLeft(5);
    obj.button9:setTop(300);
    obj.button9:setWidth(200);
    obj.button9:setText("Equipamento de Aventura");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setLeft(5);
    obj.button10:setTop(350);
    obj.button10:setWidth(200);
    obj.button10:setText("Itens Alquímicos");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setLeft(55);
    obj.button11:setTop(375);
    obj.button11:setWidth(200);
    obj.button11:setText("Capsulas");
    obj.button11:setName("button11");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(400);
    obj.label2:setWidth(395);
    obj.label2:setHeight(25);
    obj.label2:setText("Armadilhas");
    obj.label2:setName("label2");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setLeft(55);
    obj.button12:setTop(425);
    obj.button12:setWidth(200);
    obj.button12:setText("Armadilhas de Bolso");
    obj.button12:setName("button12");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(450);
    obj.label3:setWidth(395);
    obj.label3:setHeight(25);
    obj.label3:setText("Transporte");
    obj.label3:setName("label3");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setLeft(55);
    obj.button13:setTop(475);
    obj.button13:setWidth(200);
    obj.button13:setText("Embarcações");
    obj.button13:setName("button13");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setLeft(55);
    obj.button14:setTop(500);
    obj.button14:setWidth(200);
    obj.button14:setText("Trens");
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setLeft(55);
    obj.button15:setTop(525);
    obj.button15:setWidth(200);
    obj.button15:setText("Montarias");
    obj.button15:setName("button15");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(405);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(605);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(5);
    obj.label4:setTop(5);
    obj.label4:setWidth(395);
    obj.label4:setHeight(25);
    obj.label4:setText("EQUIPAMENTOS");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle2);
    obj.button16:setLeft(5);
    obj.button16:setTop(50);
    obj.button16:setWidth(200);
    obj.button16:setText("Engenhocas a Vapor");
    obj.button16:setName("button16");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle2);
    obj.button17:setLeft(5);
    obj.button17:setTop(100);
    obj.button17:setWidth(200);
    obj.button17:setText("Imóveis");
    obj.button17:setName("button17");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(5);
    obj.label5:setTop(150);
    obj.label5:setWidth(395);
    obj.label5:setHeight(25);
    obj.label5:setText("Itens Mágicos");
    obj.label5:setName("label5");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle2);
    obj.button18:setLeft(55);
    obj.button18:setTop(175);
    obj.button18:setWidth(200);
    obj.button18:setText("Objetos Maravilhosos");
    obj.button18:setName("button18");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle2);
    obj.button19:setLeft(55);
    obj.button19:setTop(200);
    obj.button19:setWidth(200);
    obj.button19:setText("Itens Semi-Mágicos");
    obj.button19:setName("button19");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle2);
    obj.button20:setLeft(55);
    obj.button20:setTop(225);
    obj.button20:setWidth(200);
    obj.button20:setText("Tatuagens");
    obj.button20:setName("button20");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle2);
    obj.button21:setLeft(55);
    obj.button21:setTop(250);
    obj.button21:setWidth(200);
    obj.button21:setText("Pergaminhos de Permanência");
    obj.button21:setName("button21");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle2);
    obj.button22:setLeft(55);
    obj.button22:setTop(275);
    obj.button22:setWidth(200);
    obj.button22:setText("Poções e Óleos");
    obj.button22:setName("button22");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle2);
    obj.button23:setLeft(55);
    obj.button23:setTop(300);
    obj.button23:setWidth(200);
    obj.button23:setText("Criando Itens Mágicos");
    obj.button23:setName("button23");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle2);
    obj.button24:setLeft(105);
    obj.button24:setTop(325);
    obj.button24:setWidth(200);
    obj.button24:setText("Tabela de Preços Comuns");
    obj.button24:setName("button24");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle2);
    obj.button25:setLeft(55);
    obj.button25:setTop(350);
    obj.button25:setWidth(200);
    obj.button25:setText("Artefatos");
    obj.button25:setName("button25");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(5);
    obj.label6:setTop(400);
    obj.label6:setWidth(395);
    obj.label6:setHeight(25);
    obj.label6:setText("Materiais");
    obj.label6:setName("label6");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle2);
    obj.button26:setLeft(55);
    obj.button26:setTop(425);
    obj.button26:setWidth(200);
    obj.button26:setText("Materiais Especiais");
    obj.button26:setName("button26");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle2);
    obj.button27:setLeft(55);
    obj.button27:setTop(450);
    obj.button27:setWidth(200);
    obj.button27:setText("Materiais Especiais Épicos");
    obj.button27:setName("button27");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.rectangle2);
    obj.button28:setLeft(55);
    obj.button28:setTop(475);
    obj.button28:setWidth(200);
    obj.button28:setText("Minérios Especiais");
    obj.button28:setName("button28");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(810);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(400);
    obj.rectangle3:setHeight(200);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setName("rectangle3");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setLeft(5);
    obj.label7:setTop(5);
    obj.label7:setWidth(395);
    obj.label7:setHeight(25);
    obj.label7:setText("COMBATES");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.rectangle3);
    obj.button29:setLeft(5);
    obj.button29:setTop(50);
    obj.button29:setWidth(200);
    obj.button29:setText("Encontros");
    obj.button29:setName("button29");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.rectangle3);
    obj.button30:setLeft(5);
    obj.button30:setTop(100);
    obj.button30:setWidth(200);
    obj.button30:setText("Pontos de Vida");
    obj.button30:setName("button30");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(810);
    obj.rectangle4:setTop(205);
    obj.rectangle4:setWidth(400);
    obj.rectangle4:setHeight(400);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle4);
    obj.label8:setLeft(5);
    obj.label8:setTop(5);
    obj.label8:setWidth(395);
    obj.label8:setHeight(25);
    obj.label8:setText("AVENTURAS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.rectangle4);
    obj.button31:setLeft(5);
    obj.button31:setTop(50);
    obj.button31:setWidth(200);
    obj.button31:setText("Tesouros");
    obj.button31:setName("button31");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.rectangle4);
    obj.button32:setLeft(5);
    obj.button32:setTop(100);
    obj.button32:setWidth(200);
    obj.button32:setText("Reputação");
    obj.button32:setName("button32");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.rectangle4);
    obj.button33:setLeft(5);
    obj.button33:setTop(150);
    obj.button33:setWidth(200);
    obj.button33:setText("Viajantes Planares");
    obj.button33:setName("button33");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.rectangle4);
    obj.button34:setLeft(5);
    obj.button34:setTop(200);
    obj.button34:setWidth(200);
    obj.button34:setText("Aflições");
    obj.button34:setName("button34");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/lndl6jmrulyqnxj/Armas.docx?dl=0');
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ql85oxst00yja9h/Armas%20Magicas.docx?dl=0');
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/7esdqqograh6dfp/Armas%20Especificas.docx?dl=0');
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/rbyy4n626ltke1e/Municao.docx?dl=0');
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/vt4tnzqtx5t2cd0/Criando%20regras%20para%20novas%20armas.docx?dl=0');
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/errboycithawyqy/Armaduras.docx?dl=0');
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/6xx7ea8son0b9m5/Armaduras%20Magicas.docx?dl=0');
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/35q20wcjw39u45u/Armaduras%20Espec%C3%ADficas.docx?dl=0');
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zarfvtto7k9u151/Equipamento%20de%20Aventura.docx?dl=0');
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/r13wz5zjyv0pq39/Itens%20Alquimicos.docx?dl=0');
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j522t8pqeburd16/Capsulas%20Alquimicas%20para%20Armas.docx?dl=0');
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/sw0qq2wqbjvb9yv/Armadilhas%20de%20bolso.docx?dl=0');
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/07ekmm6xjsa4iht/Embarca%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/s2vwy3hbvbjep7r/Trens.docx?dl=0');
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2k9og5zf7ivsenz/Montarias%20e%20animais%20treinados.docx?dl=0');
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/4c9c8emfwy6gsi3/Engenhocas%20a%20Vapor.docx?dl=0');
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/vnpzg60e8310303/Constru%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/s2k4rpegaqw4f2p/Objetos%20Maravilhosos.docx?dl=0');
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zaxd5ctg5j9gn7j/Itens%20Semi%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/si17f1sa6cd2fkz/Tatuagens%20m%C3%A1gicas.docx?dl=0');
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/h74lv8li44m8ydf/Permanencias.docx?dl=0');
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/eq9jn7uq5titrs1/Po%C3%A7%C3%B5es%20e%20%C3%B3leos.docx?dl=0');
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/desamzckfsqwns7/Criando%20Itens%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/mfsud2fmbi4m2gj/Tabela%20de%20pre%C3%A7os%20comuns%20para%20itens.docx?dl=0');
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ugaaq8i5pkwsb07/Artefatos.docx?dl=0');
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2nupgkolby6skii/Materiais%20Especiais.docx?dl=0');
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/q61v9rj8e35ughq/Materiais%20Especiais%20%C3%89picos.docx?dl=0');
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1kqe5xulj4pekvp/Minerios%20Especiais.docx?dl=0');
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fvgux8l7vcc3oyu/Lidando%20com%20Encontros.docx?dl=0');
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fv3s150m8t05txs/Novo%20sistema%20para%20pontos%20de%20vida.docx?dl=0');
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j81pnwwy0nrj528/Dinheiro%20por%20n%C3%ADvel.xlsx?dl=0');
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/qiwhwbcge46sdvn/Reputa%C3%A7%C3%A3o.docx?dl=0');
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/v7xpo0g5i2z0ofp/Viajantes%20Planares.docx?dl=0');
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/y42yy8aap8tmbxw/AAC1A6GGnTCUPfNyp2OpYEtja?dl=0');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
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

        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBibliotecaRPGmeister04 = {
    newEditor = newfrmBibliotecaRPGmeister04, 
    new = newfrmBibliotecaRPGmeister04, 
    name = "frmBibliotecaRPGmeister04", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBibliotecaRPGmeister04 = _frmBibliotecaRPGmeister04;
rrpg.registrarForm(_frmBibliotecaRPGmeister04);

return _frmBibliotecaRPGmeister04;
