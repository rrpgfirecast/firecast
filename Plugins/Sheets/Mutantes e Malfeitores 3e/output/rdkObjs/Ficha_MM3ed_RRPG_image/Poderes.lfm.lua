require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFicha_MM3ed_RRPG_Power()
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
    obj:setName("frmFicha_MM3ed_RRPG_Power");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(700);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("#50a48d");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("NOVO PODER");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.rectangle1);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmListaPoderes");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setHeight(30);
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.rectangle1);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setMargins({left=14, right=14});

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("#6cb098");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(500);
    obj.rectangle2:setPadding({top=7, left=7, right=7, bottom=7});
    obj.rectangle2:setName("rectangle2");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle2);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTransparent(true);
    obj.edit1:setAlign("top");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(68);
    obj.edit1:setHeight(31);
    obj.edit1:setField("PoderNome");
    obj.edit1:setFontColor("white");
    obj.edit1:setName("edit1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'PoderNome'});
    obj.dataLink1:setDefaultValues({'NOME DO PODER'});
    obj.dataLink1:setName("dataLink1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setLeft(10);
    obj.layout3:setTop(40);
    obj.layout3:setWidth(350);
    obj.layout3:setHeight(600);
    obj.layout3:setName("layout3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(240);
    obj.layout4:setName("layout4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setWidth(240);
    obj.rectangle3:setHeight(298);
    obj.rectangle3:setColor("#3f8270");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle3);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(14);
    obj.label1:setText("EFEITOS");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setMargins({top=1});
    obj.label1:setName("label1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle3);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("PoderEfeito");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontColor("white");
    obj.textEditor1:setHeight(280);
    obj.textEditor1:setMargins({left=10, right=10});
    obj.textEditor1:setName("textEditor1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle3);
    obj.dataLink2:setFields({'PoderEfeito'});
    obj.dataLink2:setDefaultValues({'Descreva os efeitos que estao associados a este Poder. Aproveite o espaco para anotar detalhes para nao precisar olhar o livro o tempo todo.'});
    obj.dataLink2:setName("dataLink2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setLeft(10);
    obj.layout5:setTop(348);
    obj.layout5:setWidth(350);
    obj.layout5:setHeight(400);
    obj.layout5:setName("layout5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(240);
    obj.layout6:setName("layout6");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setWidth(240);
    obj.rectangle4:setHeight(82);
    obj.rectangle4:setColor("#3f8270");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle4);
    obj.label2:setLeft(5);
    obj.label2:setFontSize(16);
    obj.label2:setText("Notas");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("white");
    obj.label2:setVertTextAlign("center");
    obj.label2:setMargins({left=2});
    obj.label2:setName("label2");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle4);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setField("PoderNotas");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontColor("white");
    obj.textEditor2:setMargins({left=50});
    obj.textEditor2:setHeight(82);
    obj.textEditor2:setName("textEditor2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle4);
    obj.dataLink3:setFields({'PoderNotas'});
    obj.dataLink3:setDefaultValues({'Descreva como o poder funciona na pratica e seus descritores'});
    obj.dataLink3:setName("dataLink3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle2);
    obj.layout7:setLeft(10);
    obj.layout7:setTop(441);
    obj.layout7:setWidth(350);
    obj.layout7:setHeight(300);
    obj.layout7:setName("layout7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(240);
    obj.layout8:setName("layout8");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setWidth(240);
    obj.rectangle5:setColor("#3f8270");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle5);
    obj.label3:setLeft(5);
    obj.label3:setFontSize(16);
    obj.label3:setText("Custo");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("white");
    obj.label3:setVertTextAlign("center");
    obj.label3:setMargins({left=10});
    obj.label3:setName("label3");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle5);
    obj.textEditor3:setAlign("top");
    obj.textEditor3:setField("PoderCusto");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontColor("white");
    obj.textEditor3:setMargins({left=50});
    obj.textEditor3:setName("textEditor3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle5);
    obj.dataLink4:setFields({'PoderCusto'});
    obj.dataLink4:setDefaultValues({'Total de Pontos de Poder investidos = (Grad + Extras - Falhas) x Custo + Extras Fixos - Falhas Fixas.'});
    obj.dataLink4:setName("dataLink4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle2);
    obj.layout9:setLeft(140);
    obj.layout9:setTop(40);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(200);
    obj.layout9:setName("layout9");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout9);
    obj.rectangle6:setAlign("right");
    obj.rectangle6:setWidth(130);
    obj.rectangle6:setColor("#3f8270");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle6);
    obj.label4:setAlign("bottom");
    obj.label4:setFontSize(12);
    obj.label4:setText("IMAGEM");
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setMargins({bottom=1});
    obj.label4:setName("label4");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle6);
    obj.image2:setAlign("right");
    obj.image2:setEditable(true);
    obj.image2:setField("PoderImagem");
    obj.image2:setWidth(130);
    obj.image2:setMargins({top=1});
    obj.image2:setName("image2");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setLeft(260);
    obj.layout10:setTop(252);
    obj.layout10:setWidth(130);
    obj.layout10:setHeight(38);
    obj.layout10:setName("layout10");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout10);
    obj.rectangle7:setAlign("right");
    obj.rectangle7:setWidth(130);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setColor("#3f8270");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle7);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(12);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setText("DEFESA");
    obj.label5:setFontColor("white");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle7);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setField("PoderDefesa");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'NENHUMA', 'ESQUIVA', 'APARAR', 'FORTITUDE', 'VONTADE', 'RESISTENCIA'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle7);
    obj.dataLink5:setFields({'PoderDefesa'});
    obj.dataLink5:setDefaultValues({'NENHUMA'});
    obj.dataLink5:setName("dataLink5");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle2);
    obj.layout11:setLeft(260);
    obj.layout11:setTop(300);
    obj.layout11:setWidth(130);
    obj.layout11:setHeight(38);
    obj.layout11:setName("layout11");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout11);
    obj.rectangle8:setAlign("right");
    obj.rectangle8:setWidth(130);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("#3f8270");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle8);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(12);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setText("ACAO");
    obj.label6:setFontColor("white");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle8);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setField("PoderAcao");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'NENHUMA', 'LIVRE', 'REACAO', 'MOVIMENTO', 'PADRAO'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle8);
    obj.dataLink6:setFields({'PoderAcao'});
    obj.dataLink6:setDefaultValues({'NENHUMA'});
    obj.dataLink6:setName("dataLink6");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setLeft(140);
    obj.layout12:setTop(348);
    obj.layout12:setWidth(250);
    obj.layout12:setHeight(18);
    obj.layout12:setName("layout12");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setAlign("right");
    obj.rectangle9:setWidth(130);
    obj.rectangle9:setColor("#3f8270");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle9);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(12);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("ALCANCE");
    obj.label7:setFontColor("white");
    obj.label7:setName("label7");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setLeft(140);
    obj.layout13:setTop(364);
    obj.layout13:setWidth(250);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout13);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(130);
    obj.edit2:setField("PoderAlcance");
    obj.edit2:setName("edit2");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout13);
    obj.dataLink7:setFields({'PoderAlcance'});
    obj.dataLink7:setDefaultValues({'Pessoal, Perto, Percepcao, ou o valor da tabela de referencia'});
    obj.dataLink7:setName("dataLink7");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setLeft(140);
    obj.layout14:setTop(398);
    obj.layout14:setWidth(250);
    obj.layout14:setHeight(18);
    obj.layout14:setName("layout14");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout14);
    obj.rectangle10:setAlign("right");
    obj.rectangle10:setWidth(130);
    obj.rectangle10:setColor("#3f8270");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle10);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(12);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("DURACAO");
    obj.label8:setFontColor("white");
    obj.label8:setName("label8");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setLeft(140);
    obj.layout15:setTop(414);
    obj.layout15:setWidth(250);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout15);
    obj.edit3:setAlign("right");
    obj.edit3:setWidth(130);
    obj.edit3:setField("PoderDuracao");
    obj.edit3:setName("edit3");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout15);
    obj.dataLink8:setFields({'PoderDuracao'});
    obj.dataLink8:setDefaultValues({'Instantaneo, Sustentado, Continuo ou Permanente'});
    obj.dataLink8:setName("dataLink8");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setLeft(140);
    obj.layout16:setTop(449);
    obj.layout16:setWidth(250);
    obj.layout16:setHeight(18);
    obj.layout16:setName("layout16");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout16);
    obj.rectangle11:setAlign("right");
    obj.rectangle11:setWidth(130);
    obj.rectangle11:setColor("#3f8270");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle11);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(12);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("REFERENCIA");
    obj.label9:setFontColor("white");
    obj.label9:setName("label9");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setLeft(140);
    obj.layout17:setTop(466);
    obj.layout17:setWidth(250);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout17);
    obj.edit4:setAlign("right");
    obj.edit4:setWidth(130);
    obj.edit4:setField("PoderReferencia");
    obj.edit4:setName("edit4");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout17);
    obj.dataLink9:setFields({'PoderReferencia'});
    obj.dataLink9:setDefaultValues({'Pagina e Livro de Ref'});
    obj.dataLink9:setName("dataLink9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event1 = obj.rclListaDosItens:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosItens.selectedNode; 
                                         self.boxDetalhesDoItem.node = node;                       
            
                                          self.boxDetalhesDoItem.visible = (node ~= nil);
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFicha_MM3ed_RRPG_Power = {
    newEditor = newfrmFicha_MM3ed_RRPG_Power, 
    new = newfrmFicha_MM3ed_RRPG_Power, 
    name = "frmFicha_MM3ed_RRPG_Power", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_MM3ed_RRPG_Power = _frmFicha_MM3ed_RRPG_Power;
rrpg.registrarForm(_frmFicha_MM3ed_RRPG_Power);

return _frmFicha_MM3ed_RRPG_Power;
