require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAtaque()
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
    obj:setName("frmAtaque");
    obj:setHeight(110);
    obj:setMargins({top=10,bottom=-0});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("Attack");
    obj.button1:setTop(0);
    obj.button1:setLeft(0);
    obj.button1:setWidth(120);
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("Ataque");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setTop(20);
    obj.edit1:setLeft(0);
    obj.edit1:setWidth(120);
    obj.edit1:setName("edit1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setField("escAtaque");
    obj.comboBox1:setText("Attribute");
    obj.comboBox1:setTop(0);
    obj.comboBox1:setLeft(120);
    obj.comboBox1:setWidth(40);
    obj.comboBox1:setItems({'Str', 'Agi', 'Int', 'Will'});
    obj.comboBox1:setName("comboBox1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setField("modAtaque");
    obj.label1:setLeft(130);
    obj.label1:setTop(25);
    obj.label1:setText("0");
    obj.label1:setWidth(40);
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(168);
    obj.label2:setTop(0);
    obj.label2:setText("Boons");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("modBoons");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTop(20);
    obj.edit2:setLeft(160);
    obj.edit2:setWidth(50);
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(255);
    obj.label3:setTop(0);
    obj.label3:setText("Damage");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setField("dano");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTop(20);
    obj.edit3:setLeft(210);
    obj.edit3:setWidth(60);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setField("Bonus");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTop(20);
    obj.edit4:setLeft(290);
    obj.edit4:setWidth(60);
    obj.edit4:setName("edit4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(275);
    obj.label4:setTop(25);
    obj.label4:setText("+");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(0);
    obj.label5:setTop(57);
    obj.label5:setText("Extra Effect");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setField("danoExtra");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTop(50);
    obj.edit5:setLeft(75);
    obj.edit5:setWidth(275);
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(0);
    obj.label6:setTop(87);
    obj.label6:setText("Properties");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setField("propriedades");
    obj.edit6:setTop(80);
    obj.edit6:setLeft(65);
    obj.edit6:setWidth(245);
    obj.edit6:setName("edit6");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setText("Del");
    obj.button2:setTop(80);
    obj.button2:setLeft(310);
    obj.button2:setWidth(40);
    obj.button2:setHeight(31);
    obj.button2:setName("button2");

    obj.popBoonBaneAtaque = GUI.fromHandle(_obj_newObject("popup"));
    obj.popBoonBaneAtaque:setParent(obj);
    obj.popBoonBaneAtaque:setName("popBoonBaneAtaque");
    obj.popBoonBaneAtaque:setWidth(400);
    obj.popBoonBaneAtaque:setHeight(200);
    obj.popBoonBaneAtaque:setBackOpacity(0.5);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popBoonBaneAtaque);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    lfm_setPropAsString(obj.rectangle1, "corners",  "");
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.popBoonBaneAtaque);
    obj.label7:setText("    BOON / BANE");
    obj.label7:setAlign("left");
    obj.label7:setLeft(180);
    obj.label7:setTop(-100);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.popBoonBaneAtaque);
    obj.edit7:setField("modBoonBaneAtaque");
    obj.edit7:setAlign("top");
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(100);
    obj.edit7:setType("number");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(40);
    obj.edit7:setName("edit7");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.popBoonBaneAtaque);
    obj.button3:setAlign("right");
    obj.button3:setWidth(272);
    obj.button3:setText("Rolar");
    obj.button3:setName("button3");


        local valBoonBane = 0;
        local ligAtaque = false;

        local modForca;
        local modAgilidade;
        local modIntelecto;
        local modVontade;

        local function ligarAtaque()
            ligAtaque = true;
            self.popBoonBaneAtaque:show();            
        end;

-- --------------------------------------------------------------

        local function rolarAtaque(boonBane)
            local modBoonBane = boonBane;
            local modAtaque;

            if sheet.escAtaque == nil then
                showMessage("Informe o atributo do ataque");
            end;

            if sheet.escAtaque ~= nil then
                if sheet.escAtaque == "Str" then
                    local node = NDB.getRoot(sheet);
                    local arma = sheet.Ataque;
                    
                    local nome;
                    if node.Nome == nil then
                        nome = " ";
                    else
                        nome = " de " .. node.Nome;
                    end;

                    if node.Forca == nil then
                        showMessage("Preencha o valor de Força no campo Strength");
                    end;

                    if node.Forca ~= nil then
                        modAtaque = node.modForca;
                        local efeitoExtra = " ";
                        if sheet.danoExtra ~= nil then 
                            efeitoExtra = sheet.danoExtra;
                        end;

                        local mesaDeRPG = Firecast.getMesaDe(sheet);
                        rolagemForca = Firecast.interpretarRolagem("1d20 + " .. modAtaque + modBoonBane);
                        mesaDeRPG.chat:rolarDados(rolagemForca, arma .. nome, 
                            function (rolado)
                                local dano;
                                if sheet.Dano ~= nil then
                                    for i = 1, 1, 1 do
                                        dano = string.sub(sheet.Dano, i, i);
                                        
                                        if sheet.Bonus ~= nil then
                                            bonus = sheet.Bonus;
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6 +" .. bonus);
                                        else
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6");
                                        end;

                                    end;
                                    mesaDeRPG.chat:rolarDados(rolagemDano, "Dano de " .. arma) 
                                end;

                                if efeitoExtra ~= " " then
                                    mesaDeRPG.chat:enviarMensagem("Efeito Extra ( " .. efeitoExtra .. " )");                            
                                end;    
                        end);
                    end;
                end;

                if sheet.escAtaque == "Agi" then
                    local node = NDB.getRoot(sheet);
                    local arma = sheet.Ataque;
                    
                    local nome;
                    if node.Nome == nil then
                        nome = " ";
                    else
                        nome = " de " .. node.Nome;
                    end;

                    if node.Agilidade == nil then
                        showMessage("Preencha o valor de Agilidade no campo Agility");
                    end;

                    if node.Agilidade ~= nil then
                        modAtaque = node.modAgilidade;
                        local efeitoExtra = " ";
                        if sheet.danoExtra ~= nil then 
                            efeitoExtra = sheet.danoExtra;
                        end;

                        local mesaDeRPG = Firecast.getMesaDe(sheet);
                        rolagemAgilidade = Firecast.interpretarRolagem("1d20 + " .. modAtaque + modBoonBane);
                        mesaDeRPG.chat:rolarDados(rolagemAgilidade, arma .. nome, 
                            function (rolado)
                                local dano;
                                if sheet.Dano ~= nil then
                                    for i = 1, 1, 1 do
                                        dano = string.sub(sheet.Dano, i, i);
                                        
                                        if sheet.Bonus ~= nil then
                                            bonus = sheet.Bonus;
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6 +" .. bonus);
                                        else
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6");
                                        end;

                                    end;
                                    mesaDeRPG.chat:rolarDados(rolagemDano, "Dano de " .. arma) 
                                end;

                                if efeitoExtra ~= " " then
                                    mesaDeRPG.chat:enviarMensagem("Efeito Extra ( " .. efeitoExtra .. " )");                            
                                end;    
                        end);
                    end;
                end;

                if sheet.escAtaque == "Int" then
                    local node = NDB.getRoot(sheet);
                    local arma = sheet.Ataque;
                    
                    local nome;
                    if node.Nome == nil then
                        nome = " ";
                    else
                        nome = " de " .. node.Nome;
                    end;

                    if node.Intelecto == nil then
                        showMessage("Preencha o valor de Intelecto no campo Intellect");
                    end;

                    if node.Intelecto ~= nil then
                        modAtaque = node.modIntelecto;
                        local efeitoExtra = " ";
                        if sheet.danoExtra ~= nil then 
                            efeitoExtra = sheet.danoExtra;
                        end;

                        local mesaDeRPG = Firecast.getMesaDe(sheet);
                        rolagemIntelecto = Firecast.interpretarRolagem("1d20 + " .. modAtaque + modBoonBane);
                        mesaDeRPG.chat:rolarDados(rolagemIntelecto, arma .. nome, 
                            function (rolado)
                                local dano;
                                if sheet.Dano ~= nil then
                                    for i = 1, 1, 1 do
                                        dano = string.sub(sheet.Dano, i, i);
                                        
                                        if sheet.Bonus ~= nil then
                                            bonus = sheet.Bonus;
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6 +" .. bonus);
                                        else
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6");
                                        end;

                                    end;
                                    mesaDeRPG.chat:rolarDados(rolagemDano, "Dano de " .. arma) 
                                end;

                                if efeitoExtra ~= " " then
                                    mesaDeRPG.chat:enviarMensagem("Efeito Extra ( " .. efeitoExtra .. " )");                            
                                end;    
                        end);
                    end;
                end;

                if sheet.escAtaque == "Will" then
                    local node = NDB.getRoot(sheet);
                    local arma = sheet.Ataque;
                    
                    local nome;
                    if node.Nome == nil then
                        nome = " ";
                    else
                        nome = " de " .. node.Nome;
                    end;

                    if node.Vontade == nil then
                        showMessage("Preencha o valor de Vontade no campo Will");
                    end;

                    if node.Vontade ~= nil then
                        modAtaque = node.modVontade;
                        local efeitoExtra = " ";
                        if sheet.danoExtra ~= nil then 
                            efeitoExtra = sheet.danoExtra;
                        end;

                        local mesaDeRPG = Firecast.getMesaDe(sheet);
                        rolagemVontade = Firecast.interpretarRolagem("1d20 + " .. modAtaque + modBoonBane);
                        mesaDeRPG.chat:rolarDados(rolagemVontade, arma .. nome, 
                            function (rolado)
                                local dano;
                                if sheet.Dano ~= nil then
                                    for i = 1, 1, 1 do
                                        dano = string.sub(sheet.Dano, i, i);
                                        
                                        if sheet.Bonus ~= nil then
                                            bonus = sheet.Bonus;
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6 +" .. bonus);
                                        else
                                            rolagemDano = Firecast.interpretarRolagem(dano .. "d6");
                                        end;

                                    end;
                                    mesaDeRPG.chat:rolarDados(rolagemDano, "Dano de " .. arma) 
                                end;

                                if efeitoExtra ~= " " then
                                    mesaDeRPG.chat:enviarMensagem("Efeito Extra ( " .. efeitoExtra .. " )");                            
                                end;    
                        end);
                    end;
                end;

            end;
        end;


-- ----------------------------------------------------------------

        local function confirmarBoonBane()
            local node = NDB.getRoot(sheet);
            
            if node.modBoonBaneAtaque ~= nil then
            -- local node = NDB.getRoot(sheet);
                
                local boonBaneAtaque;
                if sheet.modBoons == nil then
                    boonBaneAtaque = "0d6";
                else 
                    boonBaneAtaque = sheet.modBoons;
                end;
                
                local numBoonBane;
                for i = 1, 1, 1 do
                    numBoonBane = string.sub(boonBaneAtaque, i, i)
                end;
                local modBoonBane = node.modBoonBaneAtaque + numBoonBane;
                
                local valorAnterior = 0;

                local mesaDeRPG = Firecast.getMesaDe(sheet);

                self.popBoonBaneAtaque:close();

                -- boon / bane == 0
                if modBoonBane == 0 or modBoonBane == nil then
                    valBoonBane = 0;

                    if ligAtaque == true then
                        rolarAtaque(valBoonBane);
                        ligAtaque = false;
                    end;

                end;

                -- bane -1 a -infinito
                if modBoonBane < 0 and modBoonBane > -13 then
                    local cont = 0;
                    for i = - 1, modBoonBane, -1 do
                        mesaDeRPG.chat:rolarDados("1d6", "Bane", 
                            function (rolado)
                                valorAnterior = rolado.resultado;
                    
                                if valorAnterior > valBoonBane then
                                    valBoonBane = valorAnterior;
                                end;
                    
                                cont = cont - 1;
                                if cont == modBoonBane then
                                    if ligAtaque == true then
                                        rolarAtaque(valBoonBane * -1);
                                        ligAtaque = false;
                                        valBoonBane = 0;
                                    end;
                                end;
                        end);

                    end;
                end;

                -- boon 1 a infinito
                if modBoonBane > 0 and modBoonBane < 13 then
                    local cont = 0;
                    for i = 1, modBoonBane, 1 do
                        mesaDeRPG.chat:rolarDados("1d6", "Boon", 
                            function (rolado)
                                valorAnterior = rolado.resultado;
                    
                                if valorAnterior > valBoonBane then
                                    valBoonBane = valorAnterior;
                                end;
                    
                                cont = cont + 1;
                                if cont == modBoonBane then
                                    if ligAtaque == true then
                                        rolarAtaque(valBoonBane);
                                        ligAtaque = false;
                                        valBoonBane = 0;
                                    end;

                                end;
                        end);
                    
                    end;                                
                end;
            end; 
        end;


----------------------------------------------------------------

        local function escolherAtributo()
            local node = NDB.getRoot(sheet);
            modForca = node.modForca;
            modAgilidade = node.modAgilidade;
            modIntelecto = node.modIntelecto;
            modVontade = node.modVontade;
            -- local modForca = modificadorForca;

            if sheet.escAtaque == "Str" then
                sheet.modAtaque = modForca;
            end;

            if sheet.escAtaque == "Agi" then
                sheet.modAtaque = modAgilidade;
            end;            

            if sheet.escAtaque == "Int" then
                sheet.modAtaque = modIntelecto;
            end;                       
            
            if sheet.escAtaque == "Will" then
                sheet.modAtaque = modVontade;
            end;                        

        end;
    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ligarAtaque()
        end, obj);

    obj._e_event1 = obj.comboBox1:addEventListener("onChange",
        function (_)
            escolherAtributo()
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            confirmarBoonBane()
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.popBoonBaneAtaque ~= nil then self.popBoonBaneAtaque:destroy(); self.popBoonBaneAtaque = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAtaque()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAtaque();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAtaque = {
    newEditor = newfrmAtaque, 
    new = newfrmAtaque, 
    name = "frmAtaque", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAtaque = _frmAtaque;
Firecast.registrarForm(_frmAtaque);

return _frmAtaque;
