require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador01()
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
    obj:setName("frmGerenciador01");
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
    obj.rectangle1:setWidth(550);
    obj.rectangle1:setHeight(615);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(550);
    obj.label1:setHeight(25);
    obj.label1:setText("SESSÕES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(30);
    obj.label2:setHeight(25);
    obj.label2:setText("Nº");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(35);
    obj.label3:setTop(30);
    obj.label3:setWidth(205);
    obj.label3:setHeight(25);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(240);
    obj.label4:setTop(30);
    obj.label4:setWidth(90);
    obj.label4:setHeight(25);
    obj.label4:setText("PO");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(330);
    obj.label5:setTop(30);
    obj.label5:setWidth(80);
    obj.label5:setHeight(25);
    obj.label5:setText("Data");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(460);
    obj.label6:setTop(30);
    obj.label6:setWidth(40);
    obj.label6:setHeight(25);
    obj.label6:setText("Log");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(495);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("O");
    obj.button1:setHint("Organizar");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(520);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Novo");
    obj.button2:setName("button2");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(55);
    obj.scrollBox2:setWidth(550);
    obj.scrollBox2:setHeight(555);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclSessoes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSessoes:setParent(obj.scrollBox2);
    obj.rclSessoes:setLeft(0);
    obj.rclSessoes:setTop(0);
    obj.rclSessoes:setWidth(530);
    obj.rclSessoes:setHeight(555);
    obj.rclSessoes:setItemHeight(35);
    obj.rclSessoes:setAutoHeight(true);
    obj.rclSessoes:setMinQt(1);
    obj.rclSessoes:setName("rclSessoes");
    obj.rclSessoes:setField("sessoes");
    obj.rclSessoes:setTemplateForm("frmGerenciador01_Sessao");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(555);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(680);
    obj.rectangle2:setHeight(615);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(5);
    obj.label7:setTop(5);
    obj.label7:setWidth(550);
    obj.label7:setHeight(25);
    obj.label7:setText("JOGADORES");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("Jogador");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(105);
    obj.label9:setTop(30);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setText("Personagem");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(205);
    obj.label10:setTop(30);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setText("XP Inicial");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle2);
    obj.label11:setLeft(280);
    obj.label11:setTop(30);
    obj.label11:setWidth(75);
    obj.label11:setHeight(25);
    obj.label11:setText("XP Gasta");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle2);
    obj.label12:setLeft(355);
    obj.label12:setTop(30);
    obj.label12:setWidth(75);
    obj.label12:setHeight(25);
    obj.label12:setText("XP Total");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle2);
    obj.label13:setLeft(430);
    obj.label13:setTop(30);
    obj.label13:setWidth(25);
    obj.label13:setHeight(25);
    obj.label13:setText("NEP");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle2);
    obj.label14:setLeft(455);
    obj.label14:setTop(30);
    obj.label14:setWidth(75);
    obj.label14:setHeight(25);
    obj.label14:setText("PO Inicial");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle2);
    obj.label15:setLeft(530);
    obj.label15:setTop(30);
    obj.label15:setWidth(75);
    obj.label15:setHeight(25);
    obj.label15:setText("PO Total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle2);
    obj.label16:setLeft(605);
    obj.label16:setTop(30);
    obj.label16:setWidth(25);
    obj.label16:setHeight(25);
    obj.label16:setText("Nº");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle2);
    obj.button3:setLeft(600);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("V");
    obj.button3:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle2);
    obj.button4:setLeft(625);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("O");
    obj.button4:setHint("Organizar");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle2);
    obj.button5:setLeft(650);
    obj.button5:setTop(5);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Novo");
    obj.button5:setName("button5");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle2);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(55);
    obj.scrollBox3:setWidth(680);
    obj.scrollBox3:setHeight(440);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclJogadores = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclJogadores:setParent(obj.scrollBox3);
    obj.rclJogadores:setLeft(0);
    obj.rclJogadores:setTop(0);
    obj.rclJogadores:setWidth(660);
    obj.rclJogadores:setHeight(440);
    obj.rclJogadores:setItemHeight(35);
    obj.rclJogadores:setAutoHeight(true);
    obj.rclJogadores:setMinQt(1);
    obj.rclJogadores:setName("rclJogadores");
    obj.rclJogadores:setField("jogadores");
    obj.rclJogadores:setTemplateForm("frmGerenciador01_Jogadores");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSessoes:sort();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local sessoes = ndb.getChildNodes(sheet.sessoes);
            						local num = 1;
            
            						if #sessoes > 0 then
            							num = (tonumber(sessoes[#sessoes].numero) or 0) + 1
            						end;
            
            						local node = self.rclSessoes:append();
            						if node~=nil then
            							node.numero = num;
            							node.data = os.date("%d/%m/%Y", os.time());
            						end;
            
            						self.rclSessoes:sort();
            					end;
        end, obj);

    obj._e_event2 = obj.rclSessoes:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                    return 1;
            		                elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                    return -1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local jogadores = ndb.getChildNodes(sheet.jogadores);
            						local jogadoresNome = "";
            						local mesa = rrpg.getMesaDe(sheet);
            						local usuarios = mesa.jogadores;
            
            						mesa:requestSetModerada(true);
            						for i=1, #jogadores, 1 do
            							jogadoresNome = jogadoresNome .. jogadores[i].jogador .. " ";
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

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclJogadores:sort();
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclJogadores:append();
        end, obj);

    obj._e_event6 = obj.rclJogadores:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            local mod1 = nodeA.xp;
            						local mod2 = nodeB.xp;
            						if mod1==nil then
            							mod1 = "0";
            						end;
            						if mod2==nil then
            							mod2 = "0";
            						end;
            						return (utils.compareStringPtBr(mod1, mod2) * -1);
        end, obj);

    function obj:_releaseEvents()
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
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rclJogadores ~= nil then self.rclJogadores:destroy(); self.rclJogadores = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rclSessoes ~= nil then self.rclSessoes:destroy(); self.rclSessoes = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciador01 = {
    newEditor = newfrmGerenciador01, 
    new = newfrmGerenciador01, 
    name = "frmGerenciador01", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador01 = _frmGerenciador01;
rrpg.registrarForm(_frmGerenciador01);

return _frmGerenciador01;
