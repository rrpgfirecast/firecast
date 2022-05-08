require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaVeiculos()
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
    obj:setName("frmFichaVeiculos");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Starfinder.Veiculos");
    obj:setTitle("Ficha Starfinder (Veículos)");
    obj:setAlign("client");
    obj:setTheme("dark");



        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        local function findPopup(myPop)
            local pop = self:findControlByName(myPop);
                
            if pop ~= nil and sheet ~= nil then
                pop:setNodeObject(sheet);
                pop:showPopupEx("center", self);
            elseif pop == nil then
                showMessage("Ops, bug.. nao encontrei o popup para exibir");
            end;                
        end;

        local function rollDanoExtra(atk, num, max)
            if atk[num].crit then
                local rolagem = Firecast.interpretarRolagem(atk[num].dano);

                atk[num].mesa.activeChat:rolarDados(rolagem, "Dano Extra " .. num .. " com " .. atk[num].nome .. " de " .. (sheet.nome or "Veículo"), 
                    function (rolado)
                        if num < max then
                            rollDanoExtra(atk,num+1,max);
                        end;
                    end);
            elseif num<max then
                rollDanoExtra(atk, num+1, max);
            end;
        end;

        local function rollCrit(atk, num, max)
            local dado = atk[num].rolAtk.ops[1].resultados[1];
            if dado == 20 and num==max then
                -- Auto Crit + Fim de Fase
                atk[num].crit = true;
                rollDanoExtra(atk, 1, max);
            elseif dado == 20 then
                -- Auto Crit
                atk[num].crit = true;
                rollCrit(atk, num+1, max);
            elseif dado >= atk[num].margem then
                -- Confirmar Crit
                local rolagem = Firecast.interpretarRolagem("1d20 + " .. atk[num].bonus);

                atk[num].mesa.activeChat:rolarDados(rolagem, "Confirmação de Crítico " .. num .. " com " .. atk[num].nome .. " de " .. (sheet.nome or "Veículo"), 
                    function (rolado)
                        atk[num].crit = true;

                        if num == max then
                            rollDanoExtra(atk,1,max);
                        else
                            rollCrit(atk,num+1,max);
                        end;
                    end);
            elseif num == max then
                rollDanoExtra(atk, 1, max);
            else
                rollCrit(atk, num+1,max);
            end;
        end;

        local function rollDano(atk, num, max)
            local dado = atk[num].rolAtk.ops[1].resultados[1];
            if dado == 1 and num == max then
                rollCrit(atk, 1, max);
            elseif dado == 1 then
                rollDano(atk, num+1, max);
            else
                local rolagem = Firecast.interpretarRolagem(atk[num].dano);

                atk[num].mesa.activeChat:rolarDados(rolagem, "Dano " .. num .. " com " .. atk[num].nome .. " de " .. (sheet.nome or "Veículo"), 
                    function (rolado)
                        if num == max then
                            rollCrit(atk,1,max);
                        else
                            rollDano(atk,num+1,max);
                        end;
                    end);
            end;
        end;

        local function rollAtaque(atk, num, max)
            local rolagem = Firecast.interpretarRolagem("1d20 + " .. atk[num].bonus);

            atk[num].mesa.activeChat:rolarDados(rolagem, "Ataque " .. num .. " com " .. atk[num].nome .. " de " .. (sheet.nome or "Veículo"), 
                function (rolado)
                    atk[num].rolAtk = rolado;

                    if num == max then
                        rollDano(atk,1,max);
                    else
                        rollAtaque(atk,num+1,max);
                    end;
                end);
        end;

        local function prepareAtaque()
            if sheet.piloto == nil then return end;
            if sheet==nil then return end;

            local armas = NDB.getChildNodes(sheet.listaAtaqs);
            if #armas < 1 then return end;
            local atk = {};
            local index = 0;
            local mesa = Firecast.getMesaDe(sheet);

            -- Penalidades ou bonus por ataque em movimento vs parado
            local pen = 0;
            local ataquePen = tonumber(sheet.ataquePen) or 0;
            if sheet.atkTotal and ataquePen < 0 then
                pen = ataquePen;
            elseif not sheet.atkTotal and ataquePen > 0 then
                pen = ataquePen;
            end;
            -- Destreza do piloto
            local des = tonumber(sheet.piloto.efetModDes) or 0;

            -- Penalides por dano na estrutura
            local qPen = 0;
            local qPenDano = "";
            if sheet.quebrado then
                qPen = -2;
                qPenDano = "-2";
            end;

            -- Bonus temporarios
            local tempAtaq = tonumber(sheet.tempAtaque) or 0
            local tempDano = sheet.tempDano or ""

            for i=1, #armas, 1 do
                if armas[i].ativo then
                    index = index + 1;
                    atk[index] = {};
                    atk[index].mesa = mesa;
                    atk[index].bonus = (tonumber(armas[i].ataque) or 0) + pen + des + qPen + tempAtaq;
                    atk[index].dano = (armas[i].dano or "1d1") .. qPenDano .. tempDano;
                    atk[index].nome = armas[i].nome or "arma";
                    atk[index].margem = tonumber(armas[i].margem) or 20;

                    local ammo = tonumber(armas[i].municao);
                    if ammo ~= nil then
                        ammo = ammo -1;
                        if ammo==0 then
                            mesa.activeChat:enviarMensagem("Ataque " .. index .. " com " .. atk[index].nome .. " de " .. (sheet.nome or "Veículo") .. " última munição.");
                        elseif ammo < 0 then
                            mesa.activeChat:enviarMensagem("Ataque " .. index .. " com " .. atk[index].nome .. " de " .. (sheet.nome or "Veículo") .. " sem munição.");
                        end;
                        armas[i].municao = ammo;
                    end;
                end;
            end;

            rollAtaque(atk, 1, index);
        end;

        function recursiveEnumPersonagensEmBibItem(bibItem, dest, dono)
            if bibItem.tipo == "personagem" and dono == nil and dono.loginDono == nil then
                if (bibItem.loginDono ~= nil) and (bibItem.loginDono ~= "") then
                    dest[#dest + 1] = bibItem;
                end;
            elseif bibItem.tipo == "personagem" then
                --showMessage(bibItem.dataType)
                if (bibItem.loginDono == dono.loginDono) and (bibItem.codigoInterno ~= dono.codigoInterno) then
                    dest[#dest + 1] = bibItem;
                end;
            else
                local filhos = bibItem.filhos;
                
                for i = 1, #filhos, 1 do
                    recursiveEnumPersonagensEmBibItem(filhos[i], dest, dono);
                end;
            end;
        end;

        function listAllCharacters()
            local mesa = Firecast.getMesaDe(sheet);
            local dono = Firecast.getPersonagemDe(sheet); -- Objeto Personagem
            --showMessage(dono.dataType); -- Nil
            --showMessage(dono.loginDono); -- ""

            local personagens = {};
            recursiveEnumPersonagensEmBibItem(mesa.biblioteca, personagens, dono);
            
            table.sort(personagens,
                function(left, right)
                    return Utils.compareStringPtBr(left.nome, right.nome) < 0;
                end);
                
            local nomes = {};
            local valores = {};
            
            nomes[1] = "-";
            valores[1] = "0";
            
            for i = 1, #personagens, 1 do
                nomes[#nomes + 1] = personagens[i].nome;
                valores[#valores + 1] = tostring(personagens[i].codigoInterno);
            end;
            
            self.cmbPersonagem.items = nomes;
            self.cmbPersonagem.values = valores;

            if #personagens == 1 then
                sheet.cmbPersonagem = valores[2];
                self.cmbPersonagem.text = nomes[2];
            end;
        end;

        


    obj.addPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.addPop:setParent(obj);
    obj.addPop:setName("addPop");
    obj.addPop:setWidth(455);
    obj.addPop:setHeight(310);
    obj.addPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.addPop, "autoScopeNode",  "false");
    obj.addPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.addPop);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("Estrutura (PV)");
    obj.label1:setWidth(210);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setText("CAE");
    obj.label2:setWidth(70);
    obj.label2:setMargins({right=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setAlign("left");
    obj.label3:setText("CAC");
    obj.label3:setWidth(70);
    obj.label3:setMargins({right=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setAlign("left");
    obj.label4:setText("Proteção");
    obj.label4:setWidth(70);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.addPop);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setText("+%");
    obj.label5:setWidth(100);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setTop(20);
    obj.edit1:setField("pvMult");
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setText("Fixo");
    obj.label6:setWidth(100);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(20);
    obj.edit2:setField("pvAdd");
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(35);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setText("+%");
    obj.label7:setWidth(35);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setTop(20);
    obj.edit3:setField("caeMult");
    obj.edit3:setWidth(35);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(35);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setText("Fixo");
    obj.label8:setWidth(35);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(11);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setTop(20);
    obj.edit4:setField("caeAdd");
    obj.edit4:setWidth(35);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(35);
    obj.layout7:setMargins({right=5});
    obj.layout7:setName("layout7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setText("+%");
    obj.label9:setWidth(35);
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setFontSize(11);
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setTop(20);
    obj.edit5:setField("cacMult");
    obj.edit5:setWidth(35);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(35);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setText("Fixo");
    obj.label10:setWidth(35);
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTop(20);
    obj.edit6:setField("cacAdd");
    obj.edit6:setWidth(35);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(35);
    obj.layout9:setMargins({right=5});
    obj.layout9:setName("layout9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setText("+%");
    obj.label11:setWidth(35);
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTop(20);
    obj.edit7:setField("protMult");
    obj.edit7:setWidth(35);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(35);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setText("Fixo");
    obj.label12:setWidth(35);
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTop(20);
    obj.edit8:setField("protAdd");
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(25);
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.addPop);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setAlign("left");
    obj.label13:setText("Modificadores");
    obj.label13:setWidth(210);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("left");
    obj.label14:setText("Deslocamento");
    obj.label14:setHeight(210);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.addPop);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(100);
    obj.layout13:setMargins({right=5});
    obj.layout13:setName("layout13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("Pilotar");
    obj.label15:setWidth(100);
    obj.label15:setHorzTextAlign("leading");
    obj.label15:setFontSize(13);
    obj.label15:setName("label15");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setTop(20);
    obj.edit9:setField("pilotarAdd");
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(25);
    obj.edit9:setName("edit9");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout12);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(100);
    obj.layout14:setMargins({right=5});
    obj.layout14:setName("layout14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout14);
    obj.label16:setText("Ataque");
    obj.label16:setWidth(100);
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10:setTop(20);
    obj.edit10:setField("ataqueAdd");
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setName("edit10");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout12);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(100);
    obj.layout15:setMargins({right=5});
    obj.layout15:setName("layout15");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setText("+%");
    obj.label17:setWidth(100);
    obj.label17:setHorzTextAlign("leading");
    obj.label17:setFontSize(13);
    obj.label17:setName("label17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setTop(20);
    obj.edit11:setField("deslMult");
    obj.edit11:setWidth(100);
    obj.edit11:setHeight(25);
    obj.edit11:setName("edit11");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout12);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(100);
    obj.layout16:setMargins({right=5});
    obj.layout16:setName("layout16");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout16);
    obj.label18:setText("Fixo (q)");
    obj.label18:setWidth(100);
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout16);
    obj.edit12:setTop(20);
    obj.edit12:setField("deslAdd");
    obj.edit12:setWidth(100);
    obj.edit12:setHeight(25);
    obj.edit12:setName("edit12");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.addPop);
    obj.label19:setAlign("top");
    obj.label19:setText("Preço");
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.addPop);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(60);
    obj.layout18:setMargins({right=5});
    obj.layout18:setName("layout18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout18);
    obj.label20:setText("Total");
    obj.label20:setWidth(60);
    obj.label20:setHorzTextAlign("leading");
    obj.label20:setFontSize(11);
    obj.label20:setName("label20");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout18);
    obj.rectangle1:setTop(20);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setWidth(60);
    obj.rectangle1:setColor("#F0FFFF");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle1);
    obj.label21:setAlign("client");
    obj.label21:setField("precoTotal");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("center");
    lfm_setPropAsString(obj.label21, "format",  "%d C");
    obj.label21:setName("label21");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(60);
    obj.layout19:setMargins({right=5});
    obj.layout19:setName("layout19");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setText("Level");
    obj.label22:setWidth(60);
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setTop(20);
    obj.edit13:setField("precoPorLevel");
    obj.edit13:setWidth(60);
    obj.edit13:setHeight(25);
    obj.edit13:setName("edit13");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(60);
    obj.layout20:setMargins({right=5});
    obj.layout20:setName("layout20");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout20);
    obj.label23:setText("");
    obj.label23:setWidth(60);
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout20);
    obj.rectangle2:setTop(20);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setWidth(60);
    obj.rectangle2:setColor("#F0FFFF");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle2);
    obj.label24:setAlign("client");
    obj.label24:setField("precoLevel");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("center");
    lfm_setPropAsString(obj.label24, "format",  "%d C");
    obj.label24:setName("label24");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout17);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(60);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout21);
    obj.label25:setText("Tam");
    obj.label25:setWidth(60);
    obj.label25:setHorzTextAlign("leading");
    obj.label25:setFontSize(11);
    obj.label25:setName("label25");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout21);
    obj.edit14:setTop(20);
    obj.edit14:setField("precoPorTam");
    obj.edit14:setWidth(60);
    obj.edit14:setHeight(25);
    obj.edit14:setName("edit14");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout17);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(60);
    obj.layout22:setMargins({right=5});
    obj.layout22:setName("layout22");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout22);
    obj.label26:setText("");
    obj.label26:setWidth(60);
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setFontSize(11);
    obj.label26:setName("label26");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout22);
    obj.rectangle3:setTop(20);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setWidth(60);
    obj.rectangle3:setColor("#F0FFFF");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle3);
    obj.label27:setAlign("client");
    obj.label27:setField("precoTam");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    lfm_setPropAsString(obj.label27, "format",  "%d C");
    obj.label27:setName("label27");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout17);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(60);
    obj.layout23:setMargins({right=5});
    obj.layout23:setName("layout23");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout23);
    obj.label28:setText("Fixo");
    obj.label28:setWidth(60);
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setTop(20);
    obj.edit15:setField("precoAdd");
    obj.edit15:setWidth(60);
    obj.edit15:setHeight(25);
    obj.edit15:setName("edit15");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout17);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(60);
    obj.layout24:setMargins({right=5});
    obj.layout24:setName("layout24");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout24);
    obj.label29:setText("+%");
    obj.label29:setWidth(60);
    obj.label29:setHorzTextAlign("leading");
    obj.label29:setFontSize(11);
    obj.label29:setName("label29");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout24);
    obj.edit16:setTop(20);
    obj.edit16:setField("precoMult");
    obj.edit16:setWidth(60);
    obj.edit16:setHeight(25);
    obj.edit16:setName("edit16");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.addPop);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("detalhes");
    obj.textEditor1:setName("textEditor1");

    obj.costPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.costPop:setParent(obj);
    obj.costPop:setName("costPop");
    obj.costPop:setWidth(325);
    obj.costPop:setHeight(60);
    obj.costPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.costPop, "autoScopeNode",  "false");
    obj.costPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.costPop);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(50);
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(75);
    obj.layout26:setMargins({right=5});
    obj.layout26:setName("layout26");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout26);
    obj.label30:setText("Base");
    obj.label30:setWidth(75);
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout26);
    obj.edit17:setTop(20);
    obj.edit17:setField("precoBase");
    obj.edit17:setWidth(75);
    obj.edit17:setHeight(25);
    obj.edit17:setName("edit17");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(75);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout27);
    obj.label31:setText("Multiplicador");
    obj.label31:setWidth(75);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setFontSize(9);
    obj.label31:setName("label31");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout27);
    obj.rectangle4:setTop(20);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setColor("#F0FFFF");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle4);
    obj.label32:setAlign("client");
    obj.label32:setField("precoMult");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setVertTextAlign("center");
    lfm_setPropAsString(obj.label32, "format",  "%.2f");
    obj.label32:setName("label32");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(75);
    obj.layout28:setMargins({right=5});
    obj.layout28:setName("layout28");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout28);
    obj.label33:setText("Adicionais");
    obj.label33:setWidth(75);
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setFontSize(11);
    obj.label33:setName("label33");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout28);
    obj.rectangle5:setTop(20);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setWidth(75);
    obj.rectangle5:setColor("#F0FFFF");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setAlign("client");
    obj.label34:setField("precoMod");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    lfm_setPropAsString(obj.label34, "format",  "%d C");
    obj.label34:setName("label34");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout25);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(75);
    obj.layout29:setMargins({right=5});
    obj.layout29:setName("layout29");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout29);
    obj.label35:setText("Outros");
    obj.label35:setWidth(75);
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setFontSize(11);
    obj.label35:setName("label35");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout29);
    obj.edit18:setTop(20);
    obj.edit18:setField("precoOutros");
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(25);
    obj.edit18:setName("edit18");

    obj.deslPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.deslPop:setParent(obj);
    obj.deslPop:setName("deslPop");
    obj.deslPop:setWidth(395);
    obj.deslPop:setHeight(60);
    obj.deslPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.deslPop, "autoScopeNode",  "false");
    obj.deslPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.deslPop);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(60);
    obj.layout31:setMargins({right=5});
    obj.layout31:setName("layout31");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout31);
    obj.label36:setText("Base (q)");
    obj.label36:setWidth(60);
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setFontSize(11);
    obj.label36:setName("label36");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout31);
    obj.edit19:setTop(20);
    obj.edit19:setField("deslBase");
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(25);
    obj.edit19:setName("edit19");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(60);
    obj.layout32:setMargins({right=5});
    obj.layout32:setName("layout32");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout32);
    obj.label37:setText("Viagem (Km/h)");
    obj.label37:setWidth(60);
    obj.label37:setHorzTextAlign("leading");
    obj.label37:setFontSize(9);
    obj.label37:setName("label37");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout32);
    obj.edit20:setTop(20);
    obj.edit20:setField("deslBaseViagem");
    obj.edit20:setWidth(60);
    obj.edit20:setHeight(25);
    obj.edit20:setName("edit20");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(60);
    obj.layout33:setMargins({right=5});
    obj.layout33:setName("layout33");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout33);
    obj.label38:setText("Multiplicador");
    obj.label38:setWidth(60);
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontSize(9);
    obj.label38:setName("label38");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout33);
    obj.rectangle6:setTop(20);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setWidth(60);
    obj.rectangle6:setColor("#F0FFFF");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle6);
    obj.label39:setAlign("client");
    obj.label39:setField("deslMult");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("center");
    lfm_setPropAsString(obj.label39, "format",  "%.2f");
    obj.label39:setName("label39");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(60);
    obj.layout34:setMargins({right=5});
    obj.layout34:setName("layout34");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout34);
    obj.label40:setText("Adicionais (q)");
    obj.label40:setWidth(60);
    obj.label40:setHorzTextAlign("leading");
    obj.label40:setFontSize(9);
    obj.label40:setName("label40");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout34);
    obj.rectangle7:setTop(20);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setWidth(60);
    obj.rectangle7:setColor("#F0FFFF");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle7);
    obj.label41:setAlign("client");
    obj.label41:setField("deslAdd");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");
    lfm_setPropAsString(obj.label41, "format",  "");
    obj.label41:setName("label41");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout30);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(60);
    obj.layout35:setMargins({right=5});
    obj.layout35:setName("layout35");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout35);
    obj.label42:setText("Outros (q)");
    obj.label42:setWidth(60);
    obj.label42:setHorzTextAlign("leading");
    obj.label42:setFontSize(11);
    obj.label42:setName("label42");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout35);
    obj.edit21:setTop(20);
    obj.edit21:setField("deslOutros");
    obj.edit21:setWidth(60);
    obj.edit21:setHeight(25);
    obj.edit21:setName("edit21");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout30);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(60);
    obj.layout36:setMargins({right=5});
    obj.layout36:setName("layout36");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout36);
    obj.label43:setText("Outros (Km/h)");
    obj.label43:setWidth(60);
    obj.label43:setHorzTextAlign("leading");
    obj.label43:setFontSize(9);
    obj.label43:setName("label43");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout36);
    obj.edit22:setTop(20);
    obj.edit22:setField("deslOutrosViagem");
    obj.edit22:setWidth(60);
    obj.edit22:setHeight(25);
    obj.edit22:setName("edit22");

    obj.modPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.modPop:setParent(obj);
    obj.modPop:setName("modPop");
    obj.modPop:setWidth(200);
    obj.modPop:setHeight(160);
    obj.modPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.modPop, "autoScopeNode",  "false");
    obj.modPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.modPop);
    obj.label44:setAlign("top");
    obj.label44:setText("Pilotagem");
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.modPop);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(50);
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(60);
    obj.layout38:setMargins({right=5});
    obj.layout38:setName("layout38");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout38);
    obj.label45:setText("Base");
    obj.label45:setWidth(60);
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setFontSize(11);
    obj.label45:setName("label45");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout38);
    obj.edit23:setTop(20);
    obj.edit23:setField("pilBase");
    obj.edit23:setWidth(60);
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(60);
    obj.layout39:setMargins({right=5});
    obj.layout39:setName("layout39");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout39);
    obj.label46:setText("Adicional");
    obj.label46:setWidth(60);
    obj.label46:setHorzTextAlign("leading");
    obj.label46:setFontSize(9);
    obj.label46:setName("label46");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout39);
    obj.rectangle8:setTop(20);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setWidth(60);
    obj.rectangle8:setColor("#F0FFFF");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle8);
    obj.label47:setAlign("client");
    obj.label47:setField("pilotarAdd");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    lfm_setPropAsString(obj.label47, "format",  "");
    obj.label47:setName("label47");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout37);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(60);
    obj.layout40:setMargins({right=5});
    obj.layout40:setName("layout40");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout40);
    obj.label48:setText("Outros");
    obj.label48:setWidth(60);
    obj.label48:setHorzTextAlign("leading");
    obj.label48:setFontSize(11);
    obj.label48:setName("label48");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout40);
    obj.edit24:setTop(20);
    obj.edit24:setField("pilOutros");
    obj.edit24:setWidth(60);
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.modPop);
    obj.label49:setAlign("top");
    obj.label49:setText("Ataque");
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.modPop);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(50);
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(60);
    obj.layout42:setMargins({right=5});
    obj.layout42:setName("layout42");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout42);
    obj.label50:setText("Base");
    obj.label50:setWidth(60);
    obj.label50:setHorzTextAlign("leading");
    obj.label50:setFontSize(11);
    obj.label50:setName("label50");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout42);
    obj.edit25:setTop(20);
    obj.edit25:setField("atkBase");
    obj.edit25:setWidth(60);
    obj.edit25:setHeight(25);
    obj.edit25:setName("edit25");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(60);
    obj.layout43:setMargins({right=5});
    obj.layout43:setName("layout43");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout43);
    obj.label51:setText("Adicional");
    obj.label51:setWidth(60);
    obj.label51:setHorzTextAlign("leading");
    obj.label51:setFontSize(9);
    obj.label51:setName("label51");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout43);
    obj.rectangle9:setTop(20);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setWidth(60);
    obj.rectangle9:setColor("#F0FFFF");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle9);
    obj.label52:setAlign("client");
    obj.label52:setField("ataqueAdd");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("center");
    lfm_setPropAsString(obj.label52, "format",  "");
    obj.label52:setName("label52");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(60);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout44);
    obj.label53:setText("Outros");
    obj.label53:setWidth(60);
    obj.label53:setHorzTextAlign("leading");
    obj.label53:setFontSize(11);
    obj.label53:setName("label53");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout44);
    obj.edit26:setTop(20);
    obj.edit26:setField("atkOutros");
    obj.edit26:setWidth(60);
    obj.edit26:setHeight(25);
    obj.edit26:setName("edit26");

    obj.caPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.caPop:setParent(obj);
    obj.caPop:setName("caPop");
    obj.caPop:setWidth(265);
    obj.caPop:setHeight(235);
    obj.caPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.caPop, "autoScopeNode",  "false");
    obj.caPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.caPop);
    obj.label54:setAlign("top");
    obj.label54:setText("CAE");
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.caPop);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(50);
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(60);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout46);
    obj.label55:setText("Base");
    obj.label55:setWidth(60);
    obj.label55:setHorzTextAlign("leading");
    obj.label55:setFontSize(11);
    obj.label55:setName("label55");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout46);
    obj.edit27:setTop(20);
    obj.edit27:setField("caeBase");
    obj.edit27:setWidth(60);
    obj.edit27:setHeight(25);
    obj.edit27:setName("edit27");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout45);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(60);
    obj.layout47:setMargins({right=5});
    obj.layout47:setName("layout47");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout47);
    obj.label56:setText("Adicional");
    obj.label56:setWidth(60);
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setFontSize(9);
    obj.label56:setName("label56");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout47);
    obj.rectangle10:setTop(20);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setWidth(60);
    obj.rectangle10:setColor("#F0FFFF");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle10);
    obj.label57:setAlign("client");
    obj.label57:setField("caeAdd");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setVertTextAlign("center");
    lfm_setPropAsString(obj.label57, "format",  "");
    obj.label57:setName("label57");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout45);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(60);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout48);
    obj.label58:setText("Multiplicador");
    obj.label58:setWidth(60);
    obj.label58:setHorzTextAlign("leading");
    obj.label58:setFontSize(9);
    obj.label58:setName("label58");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout48);
    obj.rectangle11:setTop(20);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setWidth(60);
    obj.rectangle11:setColor("#F0FFFF");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle11);
    obj.label59:setAlign("client");
    obj.label59:setField("caeMult");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("center");
    lfm_setPropAsString(obj.label59, "format",  "");
    obj.label59:setName("label59");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout45);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(60);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout49);
    obj.label60:setText("Outros");
    obj.label60:setWidth(60);
    obj.label60:setHorzTextAlign("leading");
    obj.label60:setFontSize(11);
    obj.label60:setName("label60");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout49);
    obj.edit28:setTop(20);
    obj.edit28:setField("caeOutros");
    obj.edit28:setWidth(60);
    obj.edit28:setHeight(25);
    obj.edit28:setName("edit28");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.caPop);
    obj.label61:setAlign("top");
    obj.label61:setText("CAC");
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.caPop);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(60);
    obj.layout51:setMargins({right=5});
    obj.layout51:setName("layout51");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout51);
    obj.label62:setText("Base");
    obj.label62:setWidth(60);
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setFontSize(11);
    obj.label62:setName("label62");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout51);
    obj.edit29:setTop(20);
    obj.edit29:setField("cacBase");
    obj.edit29:setWidth(60);
    obj.edit29:setHeight(25);
    obj.edit29:setName("edit29");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(60);
    obj.layout52:setMargins({right=5});
    obj.layout52:setName("layout52");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout52);
    obj.label63:setText("Adicional");
    obj.label63:setWidth(60);
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setFontSize(9);
    obj.label63:setName("label63");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout52);
    obj.rectangle12:setTop(20);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setWidth(60);
    obj.rectangle12:setColor("#F0FFFF");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle12);
    obj.label64:setAlign("client");
    obj.label64:setField("cacAdd");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("center");
    lfm_setPropAsString(obj.label64, "format",  "");
    obj.label64:setName("label64");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(60);
    obj.layout53:setMargins({right=5});
    obj.layout53:setName("layout53");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout53);
    obj.label65:setText("Multiplicador");
    obj.label65:setWidth(60);
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setFontSize(9);
    obj.label65:setName("label65");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout53);
    obj.rectangle13:setTop(20);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setWidth(60);
    obj.rectangle13:setColor("#F0FFFF");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle13);
    obj.label66:setAlign("client");
    obj.label66:setField("cacMult");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("center");
    lfm_setPropAsString(obj.label66, "format",  "");
    obj.label66:setName("label66");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(60);
    obj.layout54:setMargins({right=5});
    obj.layout54:setName("layout54");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout54);
    obj.label67:setText("Outros");
    obj.label67:setWidth(60);
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setFontSize(11);
    obj.label67:setName("label67");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout54);
    obj.edit30:setTop(20);
    obj.edit30:setField("cacOutros");
    obj.edit30:setWidth(60);
    obj.edit30:setHeight(25);
    obj.edit30:setName("edit30");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.caPop);
    obj.label68:setAlign("top");
    obj.label68:setText("Proteção");
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.caPop);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(50);
    obj.layout55:setName("layout55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(60);
    obj.layout56:setMargins({right=5});
    obj.layout56:setName("layout56");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout56);
    obj.label69:setText("Base");
    obj.label69:setWidth(60);
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setFontSize(11);
    obj.label69:setName("label69");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout56);
    obj.edit31:setTop(20);
    obj.edit31:setField("protBase");
    obj.edit31:setWidth(60);
    obj.edit31:setHeight(25);
    obj.edit31:setName("edit31");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout55);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(60);
    obj.layout57:setMargins({right=5});
    obj.layout57:setName("layout57");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout57);
    obj.label70:setText("Adicional");
    obj.label70:setWidth(60);
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setFontSize(9);
    obj.label70:setName("label70");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout57);
    obj.rectangle14:setTop(20);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setWidth(60);
    obj.rectangle14:setColor("#F0FFFF");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle14);
    obj.label71:setAlign("client");
    obj.label71:setField("protAdd");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setVertTextAlign("center");
    lfm_setPropAsString(obj.label71, "format",  "");
    obj.label71:setName("label71");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(60);
    obj.layout58:setMargins({right=5});
    obj.layout58:setName("layout58");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout58);
    obj.label72:setText("Multiplicador");
    obj.label72:setWidth(60);
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setFontSize(9);
    obj.label72:setName("label72");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout58);
    obj.rectangle15:setTop(20);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setWidth(60);
    obj.rectangle15:setColor("#F0FFFF");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle15);
    obj.label73:setAlign("client");
    obj.label73:setField("protMult");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setVertTextAlign("center");
    lfm_setPropAsString(obj.label73, "format",  "");
    obj.label73:setName("label73");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout55);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(60);
    obj.layout59:setMargins({right=5});
    obj.layout59:setName("layout59");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout59);
    obj.label74:setText("Outros");
    obj.label74:setWidth(60);
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setFontSize(11);
    obj.label74:setName("label74");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout59);
    obj.edit32:setTop(20);
    obj.edit32:setField("protOutros");
    obj.edit32:setWidth(60);
    obj.edit32:setHeight(25);
    obj.edit32:setName("edit32");

    obj.healthPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.healthPop:setParent(obj);
    obj.healthPop:setName("healthPop");
    obj.healthPop:setWidth(370);
    obj.healthPop:setHeight(85);
    obj.healthPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.healthPop, "autoScopeNode",  "false");
    obj.healthPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.healthPop);
    obj.label75:setAlign("top");
    obj.label75:setText("Estrutura");
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.healthPop);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(50);
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(60);
    obj.layout61:setMargins({right=5});
    obj.layout61:setName("layout61");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout61);
    obj.label76:setText("Base");
    obj.label76:setWidth(60);
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setFontSize(11);
    obj.label76:setName("label76");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout61);
    obj.edit33:setTop(20);
    obj.edit33:setField("pvBase");
    obj.edit33:setWidth(60);
    obj.edit33:setHeight(25);
    obj.edit33:setName("edit33");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(60);
    obj.layout62:setMargins({right=5});
    obj.layout62:setName("layout62");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout62);
    obj.label77:setText("Adicional");
    obj.label77:setWidth(60);
    obj.label77:setHorzTextAlign("leading");
    obj.label77:setFontSize(9);
    obj.label77:setName("label77");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout62);
    obj.rectangle16:setTop(20);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setWidth(60);
    obj.rectangle16:setColor("#F0FFFF");
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle16);
    obj.label78:setAlign("client");
    obj.label78:setField("pvAdd");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");
    lfm_setPropAsString(obj.label78, "format",  "");
    obj.label78:setName("label78");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(60);
    obj.layout63:setMargins({right=5});
    obj.layout63:setName("layout63");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout63);
    obj.label79:setText("Multiplicador");
    obj.label79:setWidth(60);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setFontSize(9);
    obj.label79:setName("label79");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout63);
    obj.rectangle17:setTop(20);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setWidth(60);
    obj.rectangle17:setColor("#F0FFFF");
    obj.rectangle17:setStrokeColor("black");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle17);
    obj.label80:setAlign("client");
    obj.label80:setField("pvMult");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("center");
    lfm_setPropAsString(obj.label80, "format",  "");
    obj.label80:setName("label80");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout60);
    obj.layout64:setAlign("left");
    obj.layout64:setWidth(60);
    obj.layout64:setMargins({right=5});
    obj.layout64:setName("layout64");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout64);
    obj.label81:setText("Outros");
    obj.label81:setWidth(60);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setFontSize(11);
    obj.label81:setName("label81");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout64);
    obj.edit34:setTop(20);
    obj.edit34:setField("pvOutros");
    obj.edit34:setWidth(60);
    obj.edit34:setHeight(25);
    obj.edit34:setName("edit34");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout60);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(100);
    obj.layout65:setMargins({right=5});
    obj.layout65:setName("layout65");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout65);
    obj.label82:setText("Cobertura");
    obj.label82:setWidth(100);
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.cobertura = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cobertura:setParent(obj.layout65);
    obj.cobertura:setTop(20);
    obj.cobertura:setField("cobertura");
    obj.cobertura:setName("cobertura");
    obj.cobertura:setWidth(100);
    obj.cobertura:setHeight(25);
    obj.cobertura:setItems({'Nenhuma', 'Parcial', 'Completa'});
    obj.cobertura:setValues({'25','50','75'});
    obj.cobertura:setFontSize(13);

    obj.popEquip = GUI.fromHandle(_obj_newObject("popup"));
    obj.popEquip:setParent(obj);
    obj.popEquip:setName("popEquip");
    obj.popEquip:setWidth(200);
    obj.popEquip:setHeight(250);
    obj.popEquip:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popEquip, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popEquip);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart1);
    obj.label83:setAlign("top");
    obj.label83:setFontSize(10);
    obj.label83:setText("NOME");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setWordWrap(true);
    obj.label83:setTextTrimming("none");
    obj.label83:setAutoSize(true);
    obj.label83:setHint("");
    obj.label83:setHitTest(true);
    obj.label83:setName("label83");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart1);
    obj.edit35:setAlign("client");
    obj.edit35:setField("nome");
    obj.edit35:setFontSize(12);
    obj.edit35:setName("edit35");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart2);
    obj.label84:setAlign("top");
    obj.label84:setFontSize(10);
    obj.label84:setText("Nível");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setWordWrap(true);
    obj.label84:setTextTrimming("none");
    obj.label84:setAutoSize(true);
    obj.label84:setHint("");
    obj.label84:setHitTest(true);
    obj.label84:setName("label84");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart2);
    obj.edit36:setAlign("client");
    obj.edit36:setField("nivel");
    obj.edit36:setFontSize(12);
    obj.edit36:setName("edit36");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart3);
    obj.label85:setAlign("top");
    obj.label85:setFontSize(10);
    obj.label85:setText("Vol");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setWordWrap(true);
    obj.label85:setTextTrimming("none");
    obj.label85:setAutoSize(true);
    obj.label85:setHint("");
    obj.label85:setHitTest(true);
    obj.label85:setName("label85");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart3);
    obj.edit37:setAlign("client");
    obj.edit37:setField("peso");
    obj.edit37:setFontSize(12);
    obj.edit37:setName("edit37");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(90);
    obj.flowPart4:setMaxWidth(100);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart4);
    obj.label86:setAlign("top");
    obj.label86:setFontSize(10);
    obj.label86:setText("$");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setWordWrap(true);
    obj.label86:setTextTrimming("none");
    obj.label86:setAutoSize(true);
    obj.label86:setHint("");
    obj.label86:setHitTest(true);
    obj.label86:setName("label86");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart4);
    obj.edit38:setAlign("client");
    obj.edit38:setField("preco");
    obj.edit38:setFontSize(12);
    obj.edit38:setName("edit38");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popEquip);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox1);
    obj.layout66:setWidth(1275);
    obj.layout66:setHeight(620);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(765);
    obj.layout67:setMargins({bottom=5});
    obj.layout67:setName("layout67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(200);
    obj.layout68:setMargins({bottom=5});
    obj.layout68:setName("layout68");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout68);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(200);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle18);
    obj.image1:setAlign("client");
    obj.image1:setField("avatarComp");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout68);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(210);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setMargins({right=5});
    obj.rectangle19:setName("rectangle19");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle19);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(50);
    obj.layout69:setName("layout69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(5);
    obj.layout70:setName("layout70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(95);
    obj.layout71:setMargins({right=5});
    obj.layout71:setName("layout71");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout71);
    obj.label87:setText("Nome");
    obj.label87:setWidth(95);
    obj.label87:setHorzTextAlign("leading");
    obj.label87:setFontSize(13);
    obj.label87:setName("label87");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout71);
    obj.edit39:setTop(20);
    obj.edit39:setField("nome");
    obj.edit39:setWidth(95);
    obj.edit39:setHeight(25);
    obj.edit39:setName("edit39");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout69);
    obj.layout72:setAlign("left");
    obj.layout72:setWidth(95);
    obj.layout72:setMargins({right=5});
    obj.layout72:setName("layout72");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout72);
    obj.label88:setText("Piloto");
    obj.label88:setWidth(95);
    obj.label88:setHorzTextAlign("leading");
    obj.label88:setFontSize(13);
    obj.label88:setName("label88");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.label88);
    obj.button1:setAlign("right");
    obj.button1:setWidth(15);
    obj.button1:setMargins({top=2});
    obj.button1:setText("o");
    obj.button1:setFontSize(9);
    obj.button1:setName("button1");

    obj.cmbPersonagem = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbPersonagem:setParent(obj.layout72);
    obj.cmbPersonagem:setTop(20);
    obj.cmbPersonagem:setField("cmbPersonagem");
    obj.cmbPersonagem:setName("cmbPersonagem");
    obj.cmbPersonagem:setWidth(95);
    obj.cmbPersonagem:setHeight(25);
    obj.cmbPersonagem:setItems({});
    obj.cmbPersonagem:setValues({});
    obj.cmbPersonagem:setFontSize(13);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout69);
    obj.dataLink1:setField("cmbPersonagem");
    obj.dataLink1:setName("dataLink1");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle19);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(50);
    obj.layout73:setName("layout73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout73);
    obj.layout74:setAlign("left");
    obj.layout74:setWidth(5);
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout73);
    obj.layout75:setAlign("left");
    obj.layout75:setWidth(95);
    obj.layout75:setMargins({right=5});
    obj.layout75:setName("layout75");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout75);
    obj.label89:setText("Level/Ranque");
    obj.label89:setWidth(95);
    obj.label89:setHorzTextAlign("leading");
    obj.label89:setFontSize(13);
    obj.label89:setName("label89");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout75);
    obj.edit40:setTop(20);
    obj.edit40:setField("level");
    obj.edit40:setWidth(95);
    obj.edit40:setHeight(25);
    obj.edit40:setName("edit40");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout73);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(95);
    obj.layout76:setMargins({right=5});
    obj.layout76:setName("layout76");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout76);
    obj.label90:setText("Tipo");
    obj.label90:setWidth(95);
    obj.label90:setHorzTextAlign("leading");
    obj.label90:setFontSize(13);
    obj.label90:setName("label90");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout76);
    obj.edit41:setTop(20);
    obj.edit41:setField("tipo");
    obj.edit41:setWidth(95);
    obj.edit41:setHeight(25);
    obj.edit41:setName("edit41");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle19);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(50);
    obj.layout77:setName("layout77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout77);
    obj.layout78:setAlign("left");
    obj.layout78:setWidth(5);
    obj.layout78:setName("layout78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout77);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(95);
    obj.layout79:setMargins({right=5});
    obj.layout79:setName("layout79");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout79);
    obj.label91:setText("Preço");
    obj.label91:setWidth(70);
    obj.label91:setHorzTextAlign("leading");
    obj.label91:setFontSize(13);
    obj.label91:setName("label91");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout79);
    obj.button2:setLeft(70);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("i");
    obj.button2:setName("button2");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout79);
    obj.rectangle20:setTop(20);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setWidth(95);
    obj.rectangle20:setColor("#F0FFFF");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle20);
    obj.label92:setAlign("client");
    obj.label92:setField("preco");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setVertTextAlign("center");
    lfm_setPropAsString(obj.label92, "format",  "");
    lfm_setPropAsString(obj.label92, "formatFloat",  ",0.# C");
    obj.label92:setName("label92");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout77);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(95);
    obj.layout80:setMargins({right=5});
    obj.layout80:setName("layout80");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout80);
    obj.label93:setText("Tamanho");
    obj.label93:setWidth(95);
    obj.label93:setHorzTextAlign("leading");
    obj.label93:setFontSize(13);
    obj.label93:setName("label93");

    obj.tamanho = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.tamanho:setParent(obj.layout80);
    obj.tamanho:setTop(20);
    obj.tamanho:setField("tamanho");
    obj.tamanho:setName("tamanho");
    obj.tamanho:setWidth(95);
    obj.tamanho:setHeight(25);
    obj.tamanho:setItems({'Minúsculo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.tamanho:setValues({'1','2','3','4','5','6','7'});
    obj.tamanho:setFontSize(13);

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle19);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(50);
    obj.layout81:setName("layout81");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout81);
    obj.layout82:setAlign("left");
    obj.layout82:setWidth(5);
    obj.layout82:setName("layout82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout81);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(95);
    obj.layout83:setMargins({right=5});
    obj.layout83:setName("layout83");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout83);
    obj.label94:setText("Passageiros");
    obj.label94:setWidth(95);
    obj.label94:setHorzTextAlign("leading");
    obj.label94:setFontSize(13);
    obj.label94:setName("label94");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout83);
    obj.edit42:setTop(20);
    obj.edit42:setField("passageiros");
    obj.edit42:setWidth(95);
    obj.edit42:setHeight(25);
    obj.edit42:setName("edit42");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout81);
    obj.layout84:setAlign("left");
    obj.layout84:setWidth(95);
    obj.layout84:setMargins({right=5});
    obj.layout84:setName("layout84");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout84);
    obj.label95:setText("Carga");
    obj.label95:setWidth(95);
    obj.label95:setHorzTextAlign("leading");
    obj.label95:setFontSize(13);
    obj.label95:setName("label95");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout84);
    obj.edit43:setTop(20);
    obj.edit43:setField("carga");
    obj.edit43:setWidth(95);
    obj.edit43:setHeight(25);
    obj.edit43:setName("edit43");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout68);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(340);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setMargins({right=5});
    obj.rectangle21:setPadding({top=5,bottom=5});
    obj.rectangle21:setName("rectangle21");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle21);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout85);
    obj.layout86:setAlign("left");
    obj.layout86:setWidth(125);
    obj.layout86:setMargins({right=5});
    obj.layout86:setName("layout86");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout86);
    obj.button3:setAlign("left");
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("i");
    obj.button3:setMargins({top=2.5,left=2.5,right=2.5});
    obj.button3:setName("button3");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout86);
    obj.label96:setAlign("left");
    obj.label96:setText("PV");
    obj.label96:setWidth(50);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setFontSize(13);
    obj.label96:setName("label96");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout86);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle22);
    obj.label97:setAlign("client");
    obj.label97:setField("pv");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setVertTextAlign("center");
    lfm_setPropAsString(obj.label97, "format",  "");
    obj.label97:setName("label97");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout85);
    obj.layout87:setAlign("left");
    obj.layout87:setWidth(100);
    obj.layout87:setMargins({right=5});
    obj.layout87:setName("layout87");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout87);
    obj.label98:setAlign("left");
    obj.label98:setText("PE");
    obj.label98:setWidth(50);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontSize(13);
    obj.label98:setName("label98");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout87);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle23);
    obj.label99:setAlign("client");
    obj.label99:setField("pe");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setVertTextAlign("center");
    lfm_setPropAsString(obj.label99, "format",  "");
    obj.label99:setName("label99");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout85);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setText("Quebrado");
    obj.checkBox1:setField("quebrado");
    obj.checkBox1:setName("checkBox1");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle21);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(125);
    obj.layout89:setMargins({right=5});
    obj.layout89:setName("layout89");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout89);
    obj.button4:setAlign("left");
    obj.button4:setWidth(20);
    obj.button4:setHeight(20);
    obj.button4:setText("i");
    obj.button4:setMargins({top=2.5,left=2.5,right=2.5});
    obj.button4:setName("button4");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout89);
    obj.label100:setAlign("left");
    obj.label100:setText("CAE");
    obj.label100:setWidth(50);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setFontSize(13);
    obj.label100:setName("label100");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout89);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.rectangle24);
    obj.label101:setAlign("client");
    obj.label101:setField("cae");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setVertTextAlign("center");
    lfm_setPropAsString(obj.label101, "format",  "%d");
    obj.label101:setName("label101");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout88);
    obj.layout90:setAlign("left");
    obj.layout90:setWidth(100);
    obj.layout90:setMargins({right=5});
    obj.layout90:setName("layout90");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout90);
    obj.label102:setAlign("left");
    obj.label102:setText("CAC");
    obj.label102:setWidth(50);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setFontSize(13);
    obj.label102:setName("label102");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout90);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle25);
    obj.label103:setAlign("client");
    obj.label103:setField("cac");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setVertTextAlign("center");
    lfm_setPropAsString(obj.label103, "format",  "%d");
    obj.label103:setName("label103");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout88);
    obj.layout91:setAlign("left");
    obj.layout91:setWidth(100);
    obj.layout91:setMargins({right=5});
    obj.layout91:setName("layout91");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout91);
    obj.label104:setAlign("left");
    obj.label104:setText("Proteção");
    obj.label104:setWidth(50);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setFontSize(10);
    obj.label104:setName("label104");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout91);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle26);
    obj.label105:setAlign("client");
    obj.label105:setField("protecao");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setVertTextAlign("center");
    lfm_setPropAsString(obj.label105, "format",  "%d");
    obj.label105:setName("label105");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle21);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setAlign("left");
    obj.layout93:setWidth(125);
    obj.layout93:setMargins({right=5});
    obj.layout93:setName("layout93");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout93);
    obj.button5:setAlign("left");
    obj.button5:setWidth(20);
    obj.button5:setHeight(20);
    obj.button5:setText("i");
    obj.button5:setMargins({top=2.5,left=2.5,right=2.5});
    obj.button5:setName("button5");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout93);
    obj.label106:setAlign("left");
    obj.label106:setText("Pilotar");
    obj.label106:setWidth(50);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setFontSize(13);
    obj.label106:setName("label106");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout93);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle27);
    obj.label107:setAlign("client");
    obj.label107:setField("pilotarPen");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setVertTextAlign("center");
    lfm_setPropAsString(obj.label107, "format",  "");
    obj.label107:setName("label107");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout92);
    obj.layout94:setAlign("left");
    obj.layout94:setWidth(100);
    obj.layout94:setMargins({right=5});
    obj.layout94:setName("layout94");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout94);
    obj.label108:setAlign("left");
    obj.label108:setText("Ataque");
    obj.label108:setWidth(50);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setFontSize(13);
    obj.label108:setName("label108");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout94);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle28);
    obj.label109:setAlign("client");
    obj.label109:setField("ataquePen");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setVertTextAlign("center");
    lfm_setPropAsString(obj.label109, "format",  "");
    obj.label109:setName("label109");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout92);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setText("Ataque Mov.");
    obj.checkBox2:setField("atkTotal");
    obj.checkBox2:setName("checkBox2");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle21);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout95);
    obj.layout96:setAlign("left");
    obj.layout96:setWidth(175);
    obj.layout96:setMargins({right=5});
    obj.layout96:setName("layout96");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout96);
    obj.button6:setAlign("left");
    obj.button6:setWidth(20);
    obj.button6:setHeight(20);
    obj.button6:setText("i");
    obj.button6:setMargins({top=2.5,left=2.5,right=2.5});
    obj.button6:setName("button6");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout96);
    obj.label110:setAlign("left");
    obj.label110:setText("Deslocamento");
    obj.label110:setWidth(105);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setFontSize(13);
    obj.label110:setName("label110");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout96);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(45);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle29);
    obj.label111:setAlign("client");
    obj.label111:setField("deslQuadrados");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setVertTextAlign("center");
    lfm_setPropAsString(obj.label111, "format",  "%d q");
    obj.label111:setName("label111");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout95);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setMargins({right=5});
    obj.rectangle30:setName("rectangle30");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle30);
    obj.label112:setAlign("client");
    obj.label112:setField("deslMetros");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setVertTextAlign("center");
    lfm_setPropAsString(obj.label112, "formatFloat",  "0.# m");
    obj.label112:setFontSize(10);
    obj.label112:setName("label112");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout95);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(100);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setMargins({right=5});
    obj.rectangle31:setName("rectangle31");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle31);
    obj.label113:setAlign("client");
    obj.label113:setField("deslViagem");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setVertTextAlign("center");
    lfm_setPropAsString(obj.label113, "formatFloat",  "0.## Km/h");
    obj.label113:setFontSize(11);
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle21);
    obj.label114:setAlign("top");
    obj.label114:setHeight(25);
    obj.label114:setText("Bônus Temporarios");
    obj.label114:setMargins({left=5});
    obj.label114:setName("label114");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle21);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(50);
    obj.layout97:setName("layout97");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout97);
    obj.layout98:setAlign("left");
    obj.layout98:setWidth(5);
    obj.layout98:setName("layout98");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout97);
    obj.layout99:setAlign("left");
    obj.layout99:setWidth(50);
    obj.layout99:setMargins({right=5});
    obj.layout99:setName("layout99");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout99);
    obj.label115:setText("Ataque");
    obj.label115:setWidth(50);
    obj.label115:setHorzTextAlign("leading");
    obj.label115:setFontSize(11);
    obj.label115:setName("label115");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout99);
    obj.edit44:setTop(20);
    obj.edit44:setField("tempAtaque");
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setName("edit44");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout97);
    obj.layout100:setAlign("left");
    obj.layout100:setWidth(100);
    obj.layout100:setMargins({right=5});
    obj.layout100:setName("layout100");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout100);
    obj.label116:setText("Dano");
    obj.label116:setWidth(100);
    obj.label116:setHorzTextAlign("leading");
    obj.label116:setFontSize(11);
    obj.label116:setName("label116");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout100);
    obj.edit45:setTop(20);
    obj.edit45:setField("tempDano");
    obj.edit45:setWidth(100);
    obj.edit45:setHeight(25);
    obj.edit45:setName("edit45");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout97);
    obj.layout101:setAlign("left");
    obj.layout101:setWidth(50);
    obj.layout101:setMargins({right=5});
    obj.layout101:setName("layout101");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout101);
    obj.label117:setText("CA");
    obj.label117:setWidth(50);
    obj.label117:setHorzTextAlign("leading");
    obj.label117:setFontSize(11);
    obj.label117:setName("label117");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout101);
    obj.edit46:setTop(20);
    obj.edit46:setField("tempCA");
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setName("edit46");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout67);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(200);
    obj.layout102:setMargins({bottom=5});
    obj.layout102:setName("layout102");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout102);
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(380);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setMargins({right=5});
    obj.rectangle32:setPadding({top=5,bottom=5});
    obj.rectangle32:setName("rectangle32");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle32);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(20);
    obj.layout103:setName("layout103");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout103);
    obj.button7:setAlign("left");
    obj.button7:setWidth(20);
    obj.button7:setHeight(20);
    obj.button7:setText("+");
    obj.button7:setMargins({left=5});
    obj.button7:setName("button7");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout103);
    obj.label118:setAlign("left");
    obj.label118:setText("Modificações");
    obj.label118:setWidth(100);
    obj.label118:setMargins({left=5});
    obj.label118:setName("label118");

    obj.rclMods = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMods:setParent(obj.rectangle32);
    obj.rclMods:setName("rclMods");
    obj.rclMods:setField("listaMods");
    obj.rclMods:setTemplateForm("frmVehicleMod");
    obj.rclMods:setAlign("client");
    obj.rclMods:setWidth(465);
    obj.rclMods:setMargins({left=5,right=5});
    obj.rclMods:setLayout("vertical");
    obj.rclMods:setMinQt(1);

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout102);
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(375);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setMargins({right=5});
    obj.rectangle33:setPadding({top=5,bottom=5});
    obj.rectangle33:setName("rectangle33");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle33);
    obj.layout104:setAlign("top");
    obj.layout104:setHeight(20);
    obj.layout104:setName("layout104");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout104);
    obj.button8:setAlign("left");
    obj.button8:setWidth(20);
    obj.button8:setHeight(20);
    obj.button8:setText("+");
    obj.button8:setMargins({left=5});
    obj.button8:setName("button8");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout104);
    obj.label119:setAlign("left");
    obj.label119:setText("Equipamentos");
    obj.label119:setWidth(100);
    obj.label119:setMargins({left=5});
    obj.label119:setName("label119");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.rectangle33);
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setField("listaEquips");
    obj.rclEquips:setTemplateForm("frmVehicleMod");
    obj.rclEquips:setAlign("client");
    obj.rclEquips:setWidth(465);
    obj.rclEquips:setMargins({left=5,right=5});
    obj.rclEquips:setLayout("vertical");
    obj.rclEquips:setMinQt(1);

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout67);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(200);
    obj.layout105:setMargins({bottom=5});
    obj.layout105:setName("layout105");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout105);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setWidth(340);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setMargins({right=5});
    obj.rectangle34:setPadding({top=5,bottom=5});
    obj.rectangle34:setName("rectangle34");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle34);
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(20);
    obj.layout106:setName("layout106");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout106);
    obj.button9:setAlign("left");
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setText("+");
    obj.button9:setMargins({left=5});
    obj.button9:setName("button9");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout106);
    obj.label120:setAlign("left");
    obj.label120:setText("Ataques");
    obj.label120:setWidth(50);
    obj.label120:setMargins({left=5});
    obj.label120:setName("label120");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout106);
    obj.button10:setAlign("left");
    obj.button10:setWidth(20);
    obj.button10:setHeight(20);
    obj.button10:setText("R");
    obj.button10:setMargins({left=5});
    obj.button10:setName("button10");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout106);
    obj.label121:setAlign("right");
    obj.label121:setText("Lugar");
    obj.label121:setWidth(100);
    obj.label121:setMargins({left=0});
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout106);
    obj.layout107:setAlign("right");
    obj.layout107:setWidth(270);
    obj.layout107:setName("layout107");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout107);
    obj.label122:setAlign("right");
    obj.label122:setText("Bônus");
    obj.label122:setWidth(40);
    obj.label122:setMargins({left=0});
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout107);
    obj.label123:setAlign("right");
    obj.label123:setText("Dano");
    obj.label123:setWidth(40);
    obj.label123:setMargins({left=0});
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout107);
    obj.label124:setAlign("right");
    obj.label124:setText("Crítico");
    obj.label124:setWidth(40);
    obj.label124:setMargins({left=0});
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout107);
    obj.label125:setAlign("right");
    obj.label125:setText("Mult.");
    obj.label125:setWidth(40);
    obj.label125:setMargins({left=0});
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout107);
    obj.label126:setAlign("right");
    obj.label126:setText("Alcance");
    obj.label126:setWidth(40);
    obj.label126:setMargins({left=0});
    obj.label126:setFontSize(9);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout107);
    obj.label127:setAlign("right");
    obj.label127:setText("Munição");
    obj.label127:setWidth(40);
    obj.label127:setMargins({left=0,right=30});
    obj.label127:setFontSize(9);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.rclAtaqs = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaqs:setParent(obj.rectangle34);
    obj.rclAtaqs:setName("rclAtaqs");
    obj.rclAtaqs:setField("listaAtaqs");
    obj.rclAtaqs:setTemplateForm("frmVehicleArma");
    obj.rclAtaqs:setAlign("client");
    obj.rclAtaqs:setWidth(465);
    obj.rclAtaqs:setMargins({left=5,right=5});
    obj.rclAtaqs:setLayout("vertical");
    obj.rclAtaqs:setMinQt(1);

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout66);
    obj.layout108:setAlign("left");
    obj.layout108:setWidth(500);
    obj.layout108:setMargins({bottom=5});
    obj.layout108:setName("layout108");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(405);
    obj.layout109:setMargins({bottom=5});
    obj.layout109:setName("layout109");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout109);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setWidth(340);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setMargins({right=5});
    obj.rectangle35:setPadding({top=5,bottom=5});
    obj.rectangle35:setName("rectangle35");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle35);
    obj.textEditor3:setAlign("top");
    obj.textEditor3:setHeight(200);
    obj.textEditor3:setField("detalhes");
    obj.textEditor3:setMargins({left=5,right=5,bottom=5});
    obj.textEditor3:setName("textEditor3");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle35);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("anotacoes");
    obj.textEditor4:setMargins({left=5,right=5});
    obj.textEditor4:setName("textEditor4");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(200);
    obj.layout110:setMargins({bottom=5});
    obj.layout110:setName("layout110");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout110);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setWidth(340);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setMargins({right=5});
    obj.rectangle36:setPadding({top=5,bottom=5});
    obj.rectangle36:setName("rectangle36");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle36);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(20);
    obj.layout111:setName("layout111");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout111);
    obj.button11:setAlign("left");
    obj.button11:setWidth(20);
    obj.button11:setHeight(20);
    obj.button11:setText("+");
    obj.button11:setMargins({left=5});
    obj.button11:setName("button11");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout111);
    obj.label128:setAlign("left");
    obj.label128:setText("Inventario");
    obj.label128:setWidth(100);
    obj.label128:setMargins({left=5});
    obj.label128:setName("label128");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle36);
    obj.layout112:setAlign("bottom");
    obj.layout112:setHeight(20);
    obj.layout112:setMargins({top=5});
    obj.layout112:setName("layout112");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout112);
    obj.label129:setLeft(5);
    obj.label129:setTop(0);
    obj.label129:setWidth(50);
    obj.label129:setHeight(20);
    obj.label129:setText("Vol");
    obj.label129:setName("label129");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout112);
    obj.rectangle37:setLeft(25);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(70);
    obj.rectangle37:setHeight(20);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout112);
    obj.label130:setVertTextAlign("center");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setLeft(25);
    obj.label130:setTop(0);
    obj.label130:setWidth(70);
    obj.label130:setHeight(20);
    obj.label130:setField("pesoInv");
    lfm_setPropAsString(obj.label130, "formatFloat",  ",0.##");
    obj.label130:setName("label130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout112);
    obj.label131:setLeft(105);
    obj.label131:setTop(0);
    obj.label131:setWidth(50);
    obj.label131:setHeight(20);
    obj.label131:setText("$");
    obj.label131:setName("label131");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout112);
    obj.rectangle38:setLeft(120);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(91);
    obj.rectangle38:setHeight(20);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout112);
    obj.label132:setVertTextAlign("center");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setLeft(120);
    obj.label132:setTop(0);
    obj.label132:setWidth(91);
    obj.label132:setHeight(20);
    obj.label132:setField("precoInv");
    lfm_setPropAsString(obj.label132, "formatFloat",  ",0.## C");
    obj.label132:setName("label132");

    obj.rclInv = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInv:setParent(obj.rectangle36);
    obj.rclInv:setName("rclInv");
    obj.rclInv:setField("listaInv");
    obj.rclInv:setTemplateForm("frmVehicleItem");
    obj.rclInv:setAlign("client");
    obj.rclInv:setWidth(465);
    obj.rclInv:setMargins({left=5,right=5});
    obj.rclInv:setLayout("vertical");
    obj.rclInv:setMinQt(1);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Anotações");
    obj.tab2:setName("tab2");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab2);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");

		
		local function fullResize()
			local height = self.notes.height / 3;
			
			self.anotacoes1.height = height-25;
			self.anotacoes1Part.height = height;
			self.anotacoes2.height = height-25;
			self.anotacoes2Part.height = height;
			self.anotacoes3.height = height-25;
			self.anotacoes3Part.height = height;
			self.anotacoes4.height = height-25;
			self.anotacoes4Part.height = height;
			self.anotacoes5.height = height-25;
			self.anotacoes5Part.height = height;
			self.anotacoes6.height = height-25;
			self.anotacoes6Part.height = height;
			self.anotacoes7.height = height-25;
			self.anotacoes7Part.height = height;
			self.anotacoes8.height = height-25;
			self.anotacoes8Part.height = height;
			self.anotacoes9.height = height-25;
			self.anotacoes9Part.height = height;
		end;
	


    obj.notes = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.notes:setParent(obj.frmFichaRPGmeister10_svg);
    obj.notes:setAlign("client");
    obj.notes:setName("notes");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.notes);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(3);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.anotacoes1Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes1Part:setParent(obj.flowLayout2);
    obj.anotacoes1Part:setMinWidth(300);
    obj.anotacoes1Part:setMaxWidth(600);
    obj.anotacoes1Part:setMinScaledWidth(280);
    obj.anotacoes1Part:setName("anotacoes1Part");
    obj.anotacoes1Part:setAdjustHeightToLine(false);
    obj.anotacoes1Part:setMargins({left=5});

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.anotacoes1Part);
    obj.label133:setAlign("top");
    obj.label133:setHeight(25);
    obj.label133:setText("ANOTAÇÕES");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.anotacoes1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes1:setParent(obj.anotacoes1Part);
    obj.anotacoes1:setAlign("top");
    obj.anotacoes1:setField("anotacoes1");
    obj.anotacoes1:setHeight(52);
    obj.anotacoes1:setName("anotacoes1");

    obj.anotacoes2Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes2Part:setParent(obj.flowLayout2);
    obj.anotacoes2Part:setMinWidth(300);
    obj.anotacoes2Part:setMaxWidth(600);
    obj.anotacoes2Part:setMinScaledWidth(280);
    obj.anotacoes2Part:setName("anotacoes2Part");
    obj.anotacoes2Part:setAdjustHeightToLine(false);
    obj.anotacoes2Part:setMargins({left=5});

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.anotacoes2Part);
    obj.label134:setAlign("top");
    obj.label134:setHeight(25);
    obj.label134:setText("ANOTAÇÕES");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.anotacoes2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes2:setParent(obj.anotacoes2Part);
    obj.anotacoes2:setAlign("top");
    obj.anotacoes2:setField("anotacoes2");
    obj.anotacoes2:setHeight(52);
    obj.anotacoes2:setName("anotacoes2");

    obj.anotacoes3Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes3Part:setParent(obj.flowLayout2);
    obj.anotacoes3Part:setMinWidth(300);
    obj.anotacoes3Part:setMaxWidth(600);
    obj.anotacoes3Part:setMinScaledWidth(280);
    obj.anotacoes3Part:setName("anotacoes3Part");
    obj.anotacoes3Part:setAdjustHeightToLine(false);
    obj.anotacoes3Part:setMargins({left=5});

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.anotacoes3Part);
    obj.label135:setAlign("top");
    obj.label135:setHeight(25);
    obj.label135:setText("ANOTAÇÕES");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.anotacoes3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes3:setParent(obj.anotacoes3Part);
    obj.anotacoes3:setAlign("top");
    obj.anotacoes3:setField("anotacoes3");
    obj.anotacoes3:setHeight(52);
    obj.anotacoes3:setName("anotacoes3");

    obj.anotacoes4Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes4Part:setParent(obj.flowLayout2);
    obj.anotacoes4Part:setMinWidth(300);
    obj.anotacoes4Part:setMaxWidth(600);
    obj.anotacoes4Part:setMinScaledWidth(280);
    obj.anotacoes4Part:setName("anotacoes4Part");
    obj.anotacoes4Part:setAdjustHeightToLine(false);
    obj.anotacoes4Part:setMargins({left=5});

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.anotacoes4Part);
    obj.label136:setAlign("top");
    obj.label136:setHeight(25);
    obj.label136:setText("ANOTAÇÕES");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.anotacoes4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes4:setParent(obj.anotacoes4Part);
    obj.anotacoes4:setAlign("top");
    obj.anotacoes4:setField("anotacoes4");
    obj.anotacoes4:setHeight(52);
    obj.anotacoes4:setName("anotacoes4");

    obj.anotacoes5Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes5Part:setParent(obj.flowLayout2);
    obj.anotacoes5Part:setMinWidth(300);
    obj.anotacoes5Part:setMaxWidth(600);
    obj.anotacoes5Part:setMinScaledWidth(280);
    obj.anotacoes5Part:setName("anotacoes5Part");
    obj.anotacoes5Part:setAdjustHeightToLine(false);
    obj.anotacoes5Part:setMargins({left=5});

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.anotacoes5Part);
    obj.label137:setAlign("top");
    obj.label137:setHeight(25);
    obj.label137:setText("ANOTAÇÕES");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.anotacoes5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes5:setParent(obj.anotacoes5Part);
    obj.anotacoes5:setAlign("top");
    obj.anotacoes5:setField("anotacoes5");
    obj.anotacoes5:setHeight(52);
    obj.anotacoes5:setName("anotacoes5");

    obj.anotacoes6Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes6Part:setParent(obj.flowLayout2);
    obj.anotacoes6Part:setMinWidth(300);
    obj.anotacoes6Part:setMaxWidth(600);
    obj.anotacoes6Part:setMinScaledWidth(280);
    obj.anotacoes6Part:setName("anotacoes6Part");
    obj.anotacoes6Part:setAdjustHeightToLine(false);
    obj.anotacoes6Part:setMargins({left=5});

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.anotacoes6Part);
    obj.label138:setAlign("top");
    obj.label138:setHeight(25);
    obj.label138:setText("ANOTAÇÕES");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.anotacoes6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes6:setParent(obj.anotacoes6Part);
    obj.anotacoes6:setAlign("top");
    obj.anotacoes6:setField("anotacoes6");
    obj.anotacoes6:setHeight(52);
    obj.anotacoes6:setName("anotacoes6");

    obj.anotacoes7Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes7Part:setParent(obj.flowLayout2);
    obj.anotacoes7Part:setMinWidth(300);
    obj.anotacoes7Part:setMaxWidth(600);
    obj.anotacoes7Part:setMinScaledWidth(280);
    obj.anotacoes7Part:setName("anotacoes7Part");
    obj.anotacoes7Part:setAdjustHeightToLine(false);
    obj.anotacoes7Part:setMargins({left=5});

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.anotacoes7Part);
    obj.label139:setAlign("top");
    obj.label139:setHeight(25);
    obj.label139:setText("ANOTAÇÕES");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.anotacoes7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes7:setParent(obj.anotacoes7Part);
    obj.anotacoes7:setAlign("top");
    obj.anotacoes7:setField("anotacoes7");
    obj.anotacoes7:setHeight(52);
    obj.anotacoes7:setName("anotacoes7");

    obj.anotacoes8Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes8Part:setParent(obj.flowLayout2);
    obj.anotacoes8Part:setMinWidth(300);
    obj.anotacoes8Part:setMaxWidth(600);
    obj.anotacoes8Part:setMinScaledWidth(280);
    obj.anotacoes8Part:setName("anotacoes8Part");
    obj.anotacoes8Part:setAdjustHeightToLine(false);
    obj.anotacoes8Part:setMargins({left=5});

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.anotacoes8Part);
    obj.label140:setAlign("top");
    obj.label140:setHeight(25);
    obj.label140:setText("ANOTAÇÕES");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.anotacoes8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes8:setParent(obj.anotacoes8Part);
    obj.anotacoes8:setAlign("top");
    obj.anotacoes8:setField("anotacoes8");
    obj.anotacoes8:setHeight(52);
    obj.anotacoes8:setName("anotacoes8");

    obj.anotacoes9Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes9Part:setParent(obj.flowLayout2);
    obj.anotacoes9Part:setMinWidth(300);
    obj.anotacoes9Part:setMaxWidth(600);
    obj.anotacoes9Part:setMinScaledWidth(280);
    obj.anotacoes9Part:setName("anotacoes9Part");
    obj.anotacoes9Part:setAdjustHeightToLine(false);
    obj.anotacoes9Part:setMargins({left=5});

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.anotacoes9Part);
    obj.label141:setAlign("top");
    obj.label141:setHeight(25);
    obj.label141:setText("ANOTAÇÕES");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.anotacoes9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes9:setParent(obj.anotacoes9Part);
    obj.anotacoes9:setAlign("top");
    obj.anotacoes9:setField("anotacoes9");
    obj.anotacoes9:setHeight(52);
    obj.anotacoes9:setName("anotacoes9");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Creditos");
    obj.tab3:setName("tab3");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab3);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				if node:getClassName() == "recordList" then
					children = rclKids(node);
					--write(children[1]:getClassName());

					children = rclKids(children[1]);
				end;
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			function rclKids(rcl)
				local ret = {};
				local i;
				local childCount = _obj_getProp(rcl.handle, "ChildrenCount");
				local child;
				local childHandle;
				local idxDest = 1;
					
				for i = 0, childCount - 1, 1 do
					childHandle = _gui_getChild(rcl.handle, i);
					
					if (childHandle ~= nil) then							
						child = gui.fromHandle(childHandle);
						
						if (type(child) == "table") then							
							ret[idxDest] = child;
							idxDest = idxDest + 1;
						end
					end;	
				end
				
				return ret;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(600);
    obj.image2:setHeight(600);
    obj.image2:setSRC("/FichaVeiculos/images/RPGmeister.jpg");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.scrollBox2);
    obj.layout113:setLeft(620);
    obj.layout113:setTop(10);
    obj.layout113:setWidth(200);
    obj.layout113:setHeight(220);
    obj.layout113:setName("layout113");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout113);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(15);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout113);
    obj.label142:setLeft(0);
    obj.label142:setTop(10);
    obj.label142:setWidth(200);
    obj.label142:setHeight(20);
    obj.label142:setText("Programador: Vinny (Ambesek)");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout113);
    obj.label143:setLeft(0);
    obj.label143:setTop(170);
    obj.label143:setWidth(200);
    obj.label143:setHeight(20);
    obj.label143:setText("Ficha feita para a mesa: ");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout113);
    obj.label144:setLeft(0);
    obj.label144:setTop(195);
    obj.label144:setWidth(200);
    obj.label144:setHeight(20);
    obj.label144:setText("StarTech");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.scrollBox2);
    obj.layout114:setLeft(620);
    obj.layout114:setTop(240);
    obj.layout114:setWidth(200);
    obj.layout114:setHeight(150);
    obj.layout114:setName("layout114");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout114);
    obj.rectangle40:setLeft(0);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(200);
    obj.rectangle40:setHeight(150);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout114);
    obj.label145:setLeft(0);
    obj.label145:setTop(10);
    obj.label145:setWidth(80);
    obj.label145:setHeight(20);
    obj.label145:setText("Tema:");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout114);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout114);
    obj.dataLink2:setField("theme");
    obj.dataLink2:setDefaultValue("Escuro");
    obj.dataLink2:setName("dataLink2");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout114);
    obj.label146:setLeft(0);
    obj.label146:setTop(35);
    obj.label146:setWidth(90);
    obj.label146:setHeight(20);
    obj.label146:setText("Cores: ");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout114);
    obj.label147:setLeft(0);
    obj.label147:setTop(60);
    obj.label147:setWidth(90);
    obj.label147:setHeight(20);
    obj.label147:setText("Fundo ");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout114);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout114);
    obj.dataLink3:setField("colorBackground");
    obj.dataLink3:setDefaultValue("#000000");
    obj.dataLink3:setName("dataLink3");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout114);
    obj.label148:setLeft(0);
    obj.label148:setTop(85);
    obj.label148:setWidth(90);
    obj.label148:setHeight(20);
    obj.label148:setText("Linhas ");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout114);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout114);
    obj.dataLink4:setField("colorStroke");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout114);
    obj.label149:setLeft(0);
    obj.label149:setTop(110);
    obj.label149:setWidth(90);
    obj.label149:setHeight(20);
    obj.label149:setText("Fonte ");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout114);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout114);
    obj.dataLink5:setField("colorFont");
    obj.dataLink5:setDefaultValue("#FFFFFF");
    obj.dataLink5:setName("dataLink5");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox2);
    obj.layout115:setLeft(830);
    obj.layout115:setTop(0);
    obj.layout115:setWidth(400);
    obj.layout115:setHeight(350);
    obj.layout115:setName("layout115");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout115);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout115);
    obj.label150:setLeft(0);
    obj.label150:setTop(0);
    obj.label150:setWidth(400);
    obj.label150:setHeight(20);
    obj.label150:setText("ANOTAÇÕES DO MESTRE");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout115);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(320);
    obj.textEditor5:setField("anotacoes_do_mestre");
    obj.textEditor5:setName("textEditor5");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.scrollBox2);
    obj.label151:setLeft(630);
    obj.label151:setTop(400);
    obj.label151:setWidth(200);
    obj.label151:setHeight(20);
    obj.label151:setText("SUA VERSÃO:");
    obj.label151:setField("versionInstalled");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.scrollBox2);
    obj.label152:setLeft(630);
    obj.label152:setTop(420);
    obj.label152:setWidth(200);
    obj.label152:setHeight(20);
    obj.label152:setText("VERSÃO ATUAL:");
    obj.label152:setField("versionDownloaded");
    obj.label152:setName("label152");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.scrollBox2);
    obj.checkBox3:setLeft(620);
    obj.checkBox3:setTop(440);
    obj.checkBox3:setWidth(200);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setField("noUpdate");
    obj.checkBox3:setText("Não pedir para atualizar.");
    obj.checkBox3:setName("checkBox3");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox2);
    obj.button12:setLeft(620);
    obj.button12:setTop(475);
    obj.button12:setWidth(100);
    obj.button12:setText("Change Log");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox2);
    obj.button13:setLeft(730);
    obj.button13:setTop(475);
    obj.button13:setWidth(100);
    obj.button13:setText("Atualizar");
    obj.button13:setName("button13");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.scrollBox2);
    obj.label153:setLeft(620);
    obj.label153:setTop(525);
    obj.label153:setWidth(120);
    obj.label153:setHeight(20);
    obj.label153:setText("CONHEÇA A MESA:");
    obj.label153:setFontSize(11);
    obj.label153:setName("label153");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox2);
    obj.button14:setLeft(730);
    obj.button14:setTop(525);
    obj.button14:setWidth(100);
    obj.button14:setText("RPGmeister");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox2);
    obj.button15:setLeft(840);
    obj.button15:setTop(525);
    obj.button15:setWidth(100);
    obj.button15:setText("StarTech");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox2);
    obj.button16:setLeft(730);
    obj.button16:setTop(550);
    obj.button16:setWidth(100);
    obj.button16:setHeight(20);
    obj.button16:setText("Exportar Ficha");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox2);
    obj.button17:setLeft(840);
    obj.button17:setTop(550);
    obj.button17:setWidth(100);
    obj.button17:setHeight(20);
    obj.button17:setText("Importar Ficha");
    obj.button17:setName("button17");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("level");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("tamanho");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'precoBase','precoMult','precoMod','precoOutros','level'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'deslBase','deslBaseViagem','deslAdd','deslMult','deslOutros','deslOutrosViagem','quebrado'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'pilBase','pilotarAdd','pilOutros','quebrado'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'atkBase','ataqueAdd','atkOutros'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'caeBase','caeAdd','caeMult','caeOutros','quebrado', 'tamanho','tempCA'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setFields({'cacBase','cacAdd','cacMult','cacOutros','quebrado','tamanho','tempCA'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setFields({'protBase','protAdd','protMult','protOutros','quebrado'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setFields({'pvBase','pvAdd','pvMult','pvOutros','cobertura'});
    obj.dataLink15:setName("dataLink15");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão(" .. info.version .. ") da Ficha Starfinder. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,
                        "checkForModification");
        end, obj);

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (_)
            listAllCharacters();
        end, obj);

    obj._e_event2 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatarComp);
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            listAllCharacters();
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                                                        if tonumber(sheet.cmbPersonagem) == 0 then return end;
            
                                                        local personagem;
                                                        
                                                        local mesa = Firecast.getMesaDe(sheet);
                                                        local dono = Firecast.getPersonagemDe(sheet); -- Objeto Personagem
            
                                                        local personagens = {};
                                                        recursiveEnumPersonagensEmBibItem(mesa.biblioteca, personagens, dono);
            
                                                        for i = 1, #personagens, 1 do
                                                            if personagens[i].codigoInterno == tonumber(sheet.cmbPersonagem) then
                                                                personagem = personagens[i];
                                                            end;
                                                        end;
                                                        if personagem ~= nil then
                                                            personagem:loadSheetNDB(
                                                                function (piloto)
                                                                    sheet.piloto = piloto;
                                                                end);
                                                        end;
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (_)
            findPopup("costPop");
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (_)
            findPopup("healthPop");
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            findPopup("caPop");
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (_)
            findPopup("modPop");
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (_)
            findPopup("deslPop");
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclMods:append();
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclEquips:append();
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclAtaqs:append();
        end, obj);

    obj._e_event13 = obj.button10:addEventListener("onClick",
        function (_)
            prepareAtaque();
        end, obj);

    obj._e_event14 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclInv:append();
        end, obj);

    obj._e_event15 = obj.notes:addEventListener("onResize",
        function (_)
            fullResize()
        end, obj);

    obj._e_event16 = obj.anotacoes1:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event17 = obj.anotacoes1:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event18 = obj.anotacoes1:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event19 = obj.anotacoes1:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event20 = obj.anotacoes2:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event21 = obj.anotacoes2:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event22 = obj.anotacoes2:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event23 = obj.anotacoes2:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event24 = obj.anotacoes3:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event25 = obj.anotacoes3:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event26 = obj.anotacoes3:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event27 = obj.anotacoes3:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event28 = obj.anotacoes4:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event29 = obj.anotacoes4:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event30 = obj.anotacoes4:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event31 = obj.anotacoes4:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event32 = obj.anotacoes5:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event33 = obj.anotacoes5:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event34 = obj.anotacoes5:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event35 = obj.anotacoes5:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event36 = obj.anotacoes6:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event37 = obj.anotacoes6:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event38 = obj.anotacoes6:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event39 = obj.anotacoes6:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event40 = obj.anotacoes7:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event41 = obj.anotacoes7:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event42 = obj.anotacoes7:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event43 = obj.anotacoes7:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event44 = obj.anotacoes8:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event45 = obj.anotacoes8:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event46 = obj.anotacoes8:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event47 = obj.anotacoes8:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event48 = obj.anotacoes9:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event49 = obj.anotacoes9:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event50 = obj.anotacoes9:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event51 = obj.anotacoes9:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event52 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event53 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event54 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            		            local horzLines = findClass("horzLine");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
            					for i=1, #horzLines, 1 do 
            						horzLines[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event55 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event56 = obj.button12:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/README.md')
        end, obj);

    obj._e_event57 = obj.button13:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true')
        end, obj);

    obj._e_event58 = obj.button14:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event59 = obj.button15:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=195975');
        end, obj);

    obj._e_event60 = obj.button16:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event61 = obj.button17:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(sheet, xml);
            					end);
        end, obj);

    obj._e_event62 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local level = tonumber(sheet.level) or 0;
            
                        local nodes = NDB.getChildNodes(sheet.listaMods); 
                        for i=1, #nodes, 1 do
                            nodes[i].level = level;
                        end;
                        nodes = NDB.getChildNodes(sheet.listaEquips); 
                        for i=1, #nodes, 1 do
                            nodes[i].level = level;
                        end
        end, obj);

    obj._e_event63 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local tamanho = tonumber(sheet.tamanho) or 0;
            
                        local nodes = NDB.getChildNodes(sheet.listaMods); 
                        for i=1, #nodes, 1 do
                            nodes[i].tamanho = tamanho;
                        end;
                        nodes = NDB.getChildNodes(sheet.listaEquips); 
                        for i=1, #nodes, 1 do
                            nodes[i].tamanho = tamanho;
                        end
        end, obj);

    obj._e_event64 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local level = tonumber(sheet.level) or 1;
                        local precoBase = tonumber(sheet.precoBase) or 0;
                        local precoMult = tonumber(sheet.precoMult) or 1;
                        local precoMod = tonumber(sheet.precoMod) or 0;
                        local precoOutros = tonumber(sheet.precoOutros) or 0;
            
                        sheet.preco = level * precoBase * precoMult + precoMod + precoOutros;
        end, obj);

    obj._e_event65 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local deslBase = tonumber(sheet.deslBase) or 0;
                        local deslBaseViagem = tonumber(sheet.deslBaseViagem) or 0;
                        local deslAdd = tonumber(sheet.deslAdd) or 0;
                        local deslMult = tonumber(sheet.deslMult) or 1;
                        local deslOutros = tonumber(sheet.deslOutros) or 0;
                        local deslOutrosViagem = tonumber(sheet.deslOutrosViagem) or 0;
            
                        if sheet.quebrado then deslMult = deslMult * 0.5 end;
            
                        local desl = math.floor((deslBase + deslAdd) * deslMult + deslOutros);
                        sheet.deslQuadrados = desl;
                        sheet.deslMetros = desl * 1.5;
                        sheet.deslViagem = deslBaseViagem * deslMult + deslOutrosViagem;
        end, obj);

    obj._e_event66 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local pilBase = tonumber(sheet.pilBase) or 0;
                        local pilotarAdd = tonumber(sheet.pilotarAdd) or 0;
                        local pilOutros = tonumber(sheet.pilOutros) or 0;
            
                        local pen = 0;
                        if sheet.quebrado then pen = -2 end;
            
                        sheet.pilotarPen = pilBase + pilotarAdd + pilOutros + pen;
        end, obj);

    obj._e_event67 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local atkBase = tonumber(sheet.atkBase) or 0;
                        local ataqueAdd = tonumber(sheet.ataqueAdd) or 0;
                        local atkOutros = tonumber(sheet.atkOutros) or 0;
            
                        sheet.ataquePen = atkBase + ataqueAdd + atkOutros;
        end, obj);

    obj._e_event68 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local caeBase = tonumber(sheet.caeBase) or 0;
                        local caeAdd = tonumber(sheet.caeAdd) or 0;
                        local caeMult = tonumber(sheet.caeMult) or 1;
                        local caeOutros = tonumber(sheet.caeOutros) or 0;
                        local caTemp = tonumber(sheet.tempCA) or 0;
            
                        local tam = tonumber(sheet.tamanho) or 1
                        local tamTable = {2,1,0,-1,-2,-4,-8}
                        local tamanho = tamTable[tam]
            
                        if sheet.quebrado then caeMult = caeMult * 0.5 end;
            
                        sheet.cae = math.floor((caeBase + caeAdd) * caeMult + caeOutros + tamanho + caTemp);
        end, obj);

    obj._e_event69 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local cacBase = tonumber(sheet.cacBase) or 0;
                        local cacAdd = tonumber(sheet.cacAdd) or 0;
                        local cacMult = tonumber(sheet.cacMult) or 1;
                        local cacOutros = tonumber(sheet.cacOutros) or 0;
                        local caTemp = tonumber(sheet.tempCA) or 0;
            
                        local tam = tonumber(sheet.tamanho) or 1
                        local tamTable = {2,1,0,-1,-2,-4,-8}
                        local tamanho = tamTable[tam]
            
                        if sheet.quebrado then cacMult = cacMult * 0.5 end;
            
                        sheet.cac = math.floor((cacBase + cacAdd) * cacMult + cacOutros + tamanho + caTemp);
        end, obj);

    obj._e_event70 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local protBase = tonumber(sheet.protBase) or 0;
                        local protAdd = tonumber(sheet.protAdd) or 0;
                        local protMult = tonumber(sheet.protMult) or 1;
                        local protOutros = tonumber(sheet.protOutros) or 0;
            
                        if sheet.quebrado then protMult = protMult * 0.5 end;
            
                        sheet.protecao = math.floor((protBase + protAdd) * protMult + protOutros);
        end, obj);

    obj._e_event71 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local pvBase = tonumber(sheet.pvBase) or 0;
                        local pvAdd = tonumber(sheet.pvAdd) or 0;
                        local pvMult = tonumber(sheet.pvMult) or 1;
                        local pvOutros = tonumber(sheet.pvOutros) or 0;
                        local cobertura = tonumber(sheet.cobertura) or 25;
            
                        local total = math.floor((pvBase + pvAdd) * pvMult + pvOutros);
            
                        local pv = math.floor(total * (100-cobertura) / 100)
                        sheet.pv = pv;
                        sheet.pe = total - pv;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rclAtaqs ~= nil then self.rclAtaqs:destroy(); self.rclAtaqs = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.anotacoes2 ~= nil then self.anotacoes2:destroy(); self.anotacoes2 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.anotacoes6Part ~= nil then self.anotacoes6Part:destroy(); self.anotacoes6Part = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.anotacoes8Part ~= nil then self.anotacoes8Part:destroy(); self.anotacoes8Part = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.anotacoes2Part ~= nil then self.anotacoes2Part:destroy(); self.anotacoes2Part = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.anotacoes3 ~= nil then self.anotacoes3:destroy(); self.anotacoes3 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.cobertura ~= nil then self.cobertura:destroy(); self.cobertura = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclMods ~= nil then self.rclMods:destroy(); self.rclMods = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.anotacoes9Part ~= nil then self.anotacoes9Part:destroy(); self.anotacoes9Part = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.anotacoes1 ~= nil then self.anotacoes1:destroy(); self.anotacoes1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rclInv ~= nil then self.rclInv:destroy(); self.rclInv = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.anotacoes4 ~= nil then self.anotacoes4:destroy(); self.anotacoes4 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.modPop ~= nil then self.modPop:destroy(); self.modPop = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.healthPop ~= nil then self.healthPop:destroy(); self.healthPop = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.popEquip ~= nil then self.popEquip:destroy(); self.popEquip = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.anotacoes7Part ~= nil then self.anotacoes7Part:destroy(); self.anotacoes7Part = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.anotacoes3Part ~= nil then self.anotacoes3Part:destroy(); self.anotacoes3Part = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tamanho ~= nil then self.tamanho:destroy(); self.tamanho = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.anotacoes9 ~= nil then self.anotacoes9:destroy(); self.anotacoes9 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.anotacoes4Part ~= nil then self.anotacoes4Part:destroy(); self.anotacoes4Part = nil; end;
        if self.costPop ~= nil then self.costPop:destroy(); self.costPop = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.anotacoes1Part ~= nil then self.anotacoes1Part:destroy(); self.anotacoes1Part = nil; end;
        if self.deslPop ~= nil then self.deslPop:destroy(); self.deslPop = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.anotacoes8 ~= nil then self.anotacoes8:destroy(); self.anotacoes8 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.anotacoes6 ~= nil then self.anotacoes6:destroy(); self.anotacoes6 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.anotacoes7 ~= nil then self.anotacoes7:destroy(); self.anotacoes7 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.anotacoes5 ~= nil then self.anotacoes5:destroy(); self.anotacoes5 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.addPop ~= nil then self.addPop:destroy(); self.addPop = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.caPop ~= nil then self.caPop:destroy(); self.caPop = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.anotacoes5Part ~= nil then self.anotacoes5Part:destroy(); self.anotacoes5Part = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.cmbPersonagem ~= nil then self.cmbPersonagem:destroy(); self.cmbPersonagem = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.notes ~= nil then self.notes:destroy(); self.notes = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaVeiculos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaVeiculos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaVeiculos = {
    newEditor = newfrmFichaVeiculos, 
    new = newfrmFichaVeiculos, 
    name = "frmFichaVeiculos", 
    dataType = "Ambesek.Starfinder.Veiculos", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Starfinder (Veículos)", 
    description=""};

frmFichaVeiculos = _frmFichaVeiculos;
Firecast.registrarForm(_frmFichaVeiculos);
Firecast.registrarDataType(_frmFichaVeiculos);

return _frmFichaVeiculos;
