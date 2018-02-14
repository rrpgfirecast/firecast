require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmJogadores()
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
    obj:setName("frmJogadores");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(240);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(25);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("V");
    obj.button2:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button2:setName("button2");

    obj.rclSelector = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.scrollBox1);
    obj.rclSelector:setLeft(0);
    obj.rclSelector:setTop(25);
    obj.rclSelector:setWidth(240);
    obj.rclSelector:setHeight(575);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeJogadores");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setLeft(250);
    obj.boxDetalhesDoItem:setTop(0);
    obj.boxDetalhesDoItem:setWidth(1000);
    obj.boxDetalhesDoItem:setHeight(600);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.boxDetalhesDoItem);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(990);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(20);
    obj.label1:setText("Login");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(70);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("login");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(200);
    obj.label2:setTop(5);
    obj.label2:setWidth(70);
    obj.label2:setHeight(20);
    obj.label2:setText("Personagem");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(12);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(275);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setField("personagem");
    obj.edit2:setName("edit2");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalhesDoItem);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(170);
    obj.layout2:setHeight(300);
    obj.layout2:setName("layout2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button3:setName("button3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(10);
    obj.label3:setTop(5);
    obj.label3:setWidth(70);
    obj.label3:setHeight(20);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(70);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(70);
    obj.label4:setTop(0);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setField("XP");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("XP");
    obj.dataLink1:setName("dataLink1");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(0);
    obj.label5:setTop(30);
    obj.label5:setWidth(35);
    obj.label5:setHeight(20);
    obj.label5:setText("NEP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(35);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setWidth(25);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(35);
    obj.label6:setTop(25);
    obj.label6:setWidth(25);
    obj.label6:setHeight(25);
    obj.label6:setField("nep");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(70);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(70);
    obj.label7:setTop(25);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setField("alvo");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(50);
    obj.rectangle6:setWidth(170);
    obj.rectangle6:setHeight(250);
    obj.rectangle6:setColor("#191919");
    obj.rectangle6:setName("rectangle6");

    obj.rclExperience = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclExperience:setParent(obj.layout2);
    obj.rclExperience:setLeft(0);
    obj.rclExperience:setTop(50);
    obj.rclExperience:setWidth(170);
    obj.rclExperience:setHeight(250);
    obj.rclExperience:setName("rclExperience");
    obj.rclExperience:setField("listaDeExperiencia");
    obj.rclExperience:setTemplateForm("frmRecordListFormExperience");
    obj.rclExperience:setLayout("vertical");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxDetalhesDoItem);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(30);
    obj.layout3:setWidth(170);
    obj.layout3:setHeight(300);
    obj.layout3:setName("layout3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(0);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button4:setName("button4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(10);
    obj.label8:setTop(5);
    obj.label8:setWidth(70);
    obj.label8:setHeight(20);
    obj.label8:setText("PO");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(70);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(70);
    obj.label9:setTop(0);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setField("PO");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(25);
    obj.rectangle8:setWidth(170);
    obj.rectangle8:setHeight(275);
    obj.rectangle8:setColor("#191919");
    obj.rectangle8:setName("rectangle8");

    obj.rclDinheiro = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclDinheiro:setParent(obj.layout3);
    obj.rclDinheiro:setLeft(0);
    obj.rclDinheiro:setTop(25);
    obj.rclDinheiro:setWidth(170);
    obj.rclDinheiro:setHeight(275);
    obj.rclDinheiro:setName("rclDinheiro");
    obj.rclDinheiro:setField("listaDeDinheiro");
    obj.rclDinheiro:setTemplateForm("frmRecordListFormDinheiro");
    obj.rclDinheiro:setLayout("vertical");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.boxDetalhesDoItem);
    obj.rectangle9:setLeft(405);
    obj.rectangle9:setTop(30);
    obj.rectangle9:setWidth(310);
    obj.rectangle9:setHeight(185);
    obj.rectangle9:setColor("#212121");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle9);
    obj.label10:setLeft(5);
    obj.label10:setTop(5);
    obj.label10:setWidth(150);
    obj.label10:setHeight(25);
    obj.label10:setText("Presença");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle9);
    obj.label11:setLeft(5);
    obj.label11:setTop(30);
    obj.label11:setWidth(150);
    obj.label11:setHeight(25);
    obj.label11:setText("Atraso Justificado");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle9);
    obj.label12:setLeft(5);
    obj.label12:setTop(55);
    obj.label12:setWidth(150);
    obj.label12:setHeight(25);
    obj.label12:setText("Atraso");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle9);
    obj.label13:setLeft(5);
    obj.label13:setTop(80);
    obj.label13:setWidth(150);
    obj.label13:setHeight(25);
    obj.label13:setText("Falta Justificada");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle9);
    obj.label14:setLeft(5);
    obj.label14:setTop(105);
    obj.label14:setWidth(150);
    obj.label14:setHeight(25);
    obj.label14:setText("Falta");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle9);
    obj.label15:setLeft(5);
    obj.label15:setTop(130);
    obj.label15:setWidth(150);
    obj.label15:setHeight(25);
    obj.label15:setText("Uso");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle9);
    obj.label16:setLeft(5);
    obj.label16:setTop(155);
    obj.label16:setWidth(150);
    obj.label16:setHeight(25);
    obj.label16:setText("Desperdicio");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle9);
    obj.edit3:setLeft(155);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("presenca");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle9);
    obj.edit4:setLeft(155);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("atrasoJustificado");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle9);
    obj.edit5:setLeft(155);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atraso");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle9);
    obj.edit6:setLeft(155);
    obj.edit6:setTop(80);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("faltaJustificada");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle9);
    obj.edit7:setLeft(155);
    obj.edit7:setTop(105);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("falta");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle9);
    obj.edit8:setLeft(155);
    obj.edit8:setTop(130);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("usos");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle9);
    obj.edit9:setLeft(155);
    obj.edit9:setTop(155);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("desperdicio");
    obj.edit9:setName("edit9");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setLeft(205);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setWidth(100);
    obj.rectangle10:setHeight(150);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle9);
    obj.label17:setLeft(205);
    obj.label17:setTop(35);
    obj.label17:setWidth(100);
    obj.label17:setHeight(25);
    obj.label17:setText("PH");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(30);
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle9);
    obj.label18:setLeft(205);
    obj.label18:setTop(70);
    obj.label18:setWidth(100);
    obj.label18:setHeight(25);
    obj.label18:setField("ph");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(30);
    obj.label18:setName("label18");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle9);
    obj.horzLine1:setLeft(230);
    obj.horzLine1:setTop(105);
    obj.horzLine1:setWidth(50);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle9);
    obj.label19:setLeft(205);
    obj.label19:setTop(105);
    obj.label19:setWidth(100);
    obj.label19:setHeight(25);
    obj.label19:setField("pontos");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle9);
    obj.dataLink2:setFields({'presenca', 'atrasoJustificado', 'atraso', 'falta', 'usos', 'desperdicio'});
    obj.dataLink2:setName("dataLink2");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setLeft(405);
    obj.rectangle11:setTop(225);
    obj.rectangle11:setWidth(310);
    obj.rectangle11:setHeight(310);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle11);
    obj.label20:setLeft(0);
    obj.label20:setTop(145);
    obj.label20:setWidth(310);
    obj.label20:setHeight(20);
    obj.label20:setText("Avatar");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle11);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setHitTest(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSelector:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            					local jogadores = rrpg.getMesaDe(sheet).jogadores;
            					local current = nil;
            					for i = 1, #jogadores, 1 do
            						if jogadores[i].login==rrpg.getCurrentUser().login then
            							current = jogadores[i];
            						end;
            					end;
            					if not current.isMestre then return end;
            
            					local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            
            					local jogadoresNome = "";
            					local mesa = rrpg.getMesaDe(sheet);
            					local usuarios = mesa.jogadores;
            
            					mesa:requestSetModerada(true);
            					for i=1, #jogadores, 1 do
            						jogadoresNome = jogadoresNome .. jogadores[i].login .. " ";
            					end;
            
            					for i=1, #usuarios, 1 do 
            						if string.find(jogadoresNome, usuarios[i].login)== nil then
            							if not usuarios[i].isMestre then
            								usuarios[i]:requestSetJogador(false);
            								usuarios[i]:requestSetVoz(false);
            							end
            						else
            							usuarios[i]:requestSetJogador(true);
            							usuarios[i]:requestSetVoz(true);
            						end;
            					end;
            				end;
        end, obj);

    obj._e_event2 = obj.rclSelector:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				return utils.compareStringPtBr(nodeA.login, nodeB.login);
        end, obj);

    obj._e_event3 = obj.rclSelector:addEventListener("onSelect",
        function (self)
            local node = self.rclSelector.selectedNode;
            					self.boxDetalhesDoItem.node = node; 
            					self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event4 = obj.rclSelector:addEventListener("onEndEnumeration",
        function (self)
            if self.rclSelector.selectedNode == nil and sheet ~= nil then
            			        local nodes = ndb.getChildNodes(sheet.listaDeJogadores);               
            
            			        if #nodes > 0 then
            			            self.rclSelector.selectedNode = nodes[1];
            			        end;
            			    end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            -- Aumenta um contador enquanto adiciona um objeto
            						if self.boxDetalhesDoItem.node~=nil then
            							local objetos = ndb.getChildNodes(self.boxDetalhesDoItem.node.listaDeExperiencia);
            
            							local node = self.rclExperience:append();
            							if node~=nil then
            								local contador = 0;
            								for i=1, #objetos, 1 do
            									local aux = tonumber(objetos[i].contador) or 0;
            									if aux > contador then
            										contador = aux;
            									end;
            								end;
            								node.contador = contador + 1;
            							end;
            
            							self.rclExperience:sort();
            						end;
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = self.boxDetalhesDoItem.node.XP or "0";
            						mod = string.gsub(mod, "%.", "");
            						mod = (tonumber(mod) or 0);
            						local mod2 = 0;
            						local mod3 = 0;
            						while mod>=mod2 do
            							mod3 = mod3+1;
            							mod2 = mod2 + mod3*1000;
            						end
            						
            						while true do  
            							mod2, k = string.gsub(mod2, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						mod2 = string.gsub(mod2, ",", ".");
            						
            						self.boxDetalhesDoItem.node.nep = mod3;
            						self.boxDetalhesDoItem.node.alvo = mod2;
        end, obj);

    obj._e_event7 = obj.rclExperience:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            				        if (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            				            return -1;
            				        elseif (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            				            return 1;
            				        else   
            				            return 0;
            				        end;
        end, obj);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (self)
            -- Aumenta um contador enquanto adiciona um objeto
            						if self.boxDetalhesDoItem.node~=nil then
            							local objetos = ndb.getChildNodes(self.boxDetalhesDoItem.node.listaDeDinheiro);
            
            							local node = self.rclDinheiro:append();
            							if node~=nil then
            								local contador = 0;
            								for i=1, #objetos, 1 do
            									local aux = tonumber(objetos[i].contador) or 0;
            									if aux > contador then
            										contador = aux;
            									end;
            								end;
            								node.contador = contador + 1;
            							end;
            
            							self.rclDinheiro:sort();
            						end;
        end, obj);

    obj._e_event9 = obj.rclDinheiro:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            				        if (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            				            return -1;
            				        elseif (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            				            return 1;
            				        else   
            				            return 0;
            				        end;
        end, obj);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = (tonumber(self.boxDetalhesDoItem.node.presenca) or 0)*4 + 
            										(tonumber(self.boxDetalhesDoItem.node.atrasoJustificado) or 0)*2 + 
            										(tonumber(self.boxDetalhesDoItem.node.atraso) or 0)*1 -   
            										(tonumber(self.boxDetalhesDoItem.node.falta) or 0)*10 -  
            										(tonumber(self.boxDetalhesDoItem.node.usos) or 0)*10 - 
            										(tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0);
            						self.boxDetalhesDoItem.node.pontos = mod;								
            						self.boxDetalhesDoItem.node.ph = math.max(math.floor(mod/10), 0);
            
            						if mod > 40 then
            							self.boxDetalhesDoItem.node.desperdicio = (tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0) + (mod - 40);
            						end;
        end, obj);

    obj._e_event11 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    function obj:_releaseEvents()
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
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.rclExperience ~= nil then self.rclExperience:destroy(); self.rclExperience = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclDinheiro ~= nil then self.rclDinheiro:destroy(); self.rclDinheiro = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmJogadores = {
    newEditor = newfrmJogadores, 
    new = newfrmJogadores, 
    name = "frmJogadores", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmJogadores = _frmJogadores;
rrpg.registrarForm(_frmJogadores);

return _frmJogadores;
