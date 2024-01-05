require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaPDM()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.czagalo.SotWW_Monsters_and_NPCs");
    obj:setName("frmFichaPDM");
    obj:setTitle("SotWW - Monsters and NPCs");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(760);
    obj.layout1:setHeight(2600);
    obj.layout1:setName("layout1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.layout1);
    obj.scrollBox1:setLeft(0);
    obj.scrollBox1:setTop(0);
    obj.scrollBox1:setWidth(760);
    obj.scrollBox1:setHeight(600);
    obj.scrollBox1:setName("scrollBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(10);
    obj.layout2:setWidth(350);
    obj.layout2:setHeight(1600);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setText("NAME");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("Nome");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(20);
    obj.edit1:setWidth(350);
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(60);
    obj.label2:setText("Difficulty");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setField("Dificuldade");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(80);
    obj.edit2:setWidth(50);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(60);
    obj.label3:setTop(60);
    obj.label3:setText("Size");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setField("Tamanho");
    obj.edit3:setLeft(60);
    obj.edit3:setTop(80);
    obj.edit3:setWidth(25);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(95);
    obj.label4:setTop(60);
    obj.label4:setText("Tags");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setField("Tags");
    obj.edit4:setLeft(95);
    obj.edit4:setTop(80);
    obj.edit4:setWidth(305);
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(0);
    obj.label5:setTop(115);
    obj.label5:setText("Defense");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setField("Defesa");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(135);
    obj.edit5:setWidth(50);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(60);
    obj.label6:setTop(115);
    obj.label6:setText("Armor");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setField("Armadura");
    obj.edit6:setLeft(60);
    obj.edit6:setTop(135);
    obj.edit6:setWidth(100);
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(170);
    obj.label7:setTop(115);
    obj.label7:setText("Special Senses");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setField("Sentidos");
    obj.edit7:setLeft(170);
    obj.edit7:setTop(135);
    obj.edit7:setWidth(200);
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(0);
    obj.label8:setTop(170);
    obj.label8:setText("Speed");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setField("Velocidade");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(190);
    obj.edit8:setWidth(30);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setField("MovimentoEspecial");
    obj.edit9:setLeft(30);
    obj.edit9:setTop(190);
    obj.edit9:setWidth(130);
    obj.edit9:setName("edit9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(170);
    obj.label9:setTop(170);
    obj.label9:setText("Languages");
    obj.label9:setName("label9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setField("idiomas");
    obj.edit10:setLeft(170);
    obj.edit10:setTop(190);
    obj.edit10:setWidth(180);
    obj.edit10:setName("edit10");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(0);
    obj.button1:setTop(232);
    obj.button1:setText("Strength");
    obj.button1:setName("button1");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setField("Forca");
    obj.edit11:setType("number");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(255);
    obj.edit11:setWidth(40);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setField("modForca");
    obj.label10:setLeft(50);
    obj.label10:setTop(262);
    obj.label10:setText("---");
    obj.label10:setWidth(40);
    obj.label10:setName("label10");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("Forca");
    obj.dataLink1:setName("dataLink1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(90);
    obj.button2:setTop(232);
    obj.button2:setText("Agility");
    obj.button2:setName("button2");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setField("Agilidade");
    obj.edit12:setType("number");
    obj.edit12:setLeft(90);
    obj.edit12:setTop(255);
    obj.edit12:setWidth(40);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setField("modAgilidade");
    obj.label11:setLeft(148);
    obj.label11:setTop(262);
    obj.label11:setText("---");
    obj.label11:setWidth(40);
    obj.label11:setName("label11");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("Agilidade");
    obj.dataLink2:setName("dataLink2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(180);
    obj.button3:setTop(232);
    obj.button3:setText("Intellect");
    obj.button3:setName("button3");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setField("Intelecto");
    obj.edit13:setType("number");
    obj.edit13:setLeft(180);
    obj.edit13:setTop(255);
    obj.edit13:setWidth(40);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setField("modIntelecto");
    obj.label12:setLeft(238);
    obj.label12:setTop(262);
    obj.label12:setText("---");
    obj.label12:setWidth(40);
    obj.label12:setName("label12");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout2);
    obj.dataLink3:setField("Intelecto");
    obj.dataLink3:setName("dataLink3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(270);
    obj.button4:setTop(232);
    obj.button4:setText("Will");
    obj.button4:setName("button4");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setField("Vontade");
    obj.edit14:setType("number");
    obj.edit14:setLeft(270);
    obj.edit14:setTop(255);
    obj.edit14:setWidth(40);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setField("modVontade");
    obj.label13:setLeft(328);
    obj.label13:setTop(262);
    obj.label13:setText("---");
    obj.label13:setWidth(40);
    obj.label13:setName("label13");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setField("Vontade");
    obj.dataLink4:setName("dataLink4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(0);
    obj.label14:setTop(290);
    obj.label14:setText("Health");
    obj.label14:setName("label14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setField("Saude");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(310);
    obj.edit15:setWidth(40);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout2);
    obj.button5:setLeft(40);
    obj.button5:setTop(308);
    obj.button5:setHeight(35);
    obj.button5:setText("Traits, Talents, Especial Attacks, End of the Round");
    obj.button5:setWidth(310);
    obj.button5:setName("button5");

    obj.rclTracos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTracos:setParent(obj.layout2);
    obj.rclTracos:setField("Tracos");
    obj.rclTracos:setName("rclTracos");
    obj.rclTracos:setTemplateForm("frmTraits");
    obj.rclTracos:setLeft(0);
    obj.rclTracos:setTop(340);
    obj.rclTracos:setWidth(350);
    obj.rclTracos:setAutoHeight(true);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(369);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(3);
    obj.rectangle1:setHeight(1600);
    obj.rectangle1:setName("rectangle1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(10);
    obj.layout3:setWidth(350);
    obj.layout3:setHeight(1600);
    obj.layout3:setName("layout3");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.layout3);
    obj.flowLayout1:setLeft(0);
    obj.flowLayout1:setTop(0);
    obj.flowLayout1:setWidth(350);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setName("flowLayout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(350);
    obj.rectangle2:setHeight(26);
    obj.rectangle2:setName("rectangle2");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle2);
    obj.label15:setLeft(0);
    obj.label15:setTop(3);
    obj.label15:setText("ATTACKS");
    obj.label15:setName("label15");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle2);
    obj.button6:setLeft(310);
    obj.button6:setTop(0);
    obj.button6:setHeight(25);
    obj.button6:setText("Add");
    obj.button6:setWidth(40);
    obj.button6:setName("button6");

    obj.rclAtaque = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaque:setParent(obj.flowLayout1);
    obj.rclAtaque:setField("Ataque");
    obj.rclAtaque:setName("rclAtaque");
    obj.rclAtaque:setTemplateForm("frmAtaque");
    obj.rclAtaque:setLeft(0);
    obj.rclAtaque:setTop(20);
    obj.rclAtaque:setWidth(350);
    obj.rclAtaque:setAutoHeight(true);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowLayout1);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setWidth(350);
    obj.rectangle3:setHeight(26);
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowLayout1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setColor("gray");
    obj.rectangle4:setWidth(350);
    obj.rectangle4:setHeight(26);
    obj.rectangle4:setName("rectangle4");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setLeft(0);
    obj.label16:setTop(3);
    obj.label16:setText("SPELLS");
    obj.label16:setName("label16");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle4);
    obj.button7:setLeft(310);
    obj.button7:setTop(0);
    obj.button7:setHeight(25);
    obj.button7:setText("Add");
    obj.button7:setWidth(40);
    obj.button7:setName("button7");

    obj.rclMagia = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagia:setParent(obj.flowLayout1);
    obj.rclMagia:setField("Magia");
    obj.rclMagia:setName("rclMagia");
    obj.rclMagia:setTemplateForm("frmMagia");
    obj.rclMagia:setLeft(0);
    obj.rclMagia:setTop(80);
    obj.rclMagia:setWidth(350);
    obj.rclMagia:setAutoHeight(true);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowLayout1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setColor("gray");
    obj.rectangle5:setWidth(350);
    obj.rectangle5:setHeight(26);
    obj.rectangle5:setName("rectangle5");

    obj.popBoonBane = GUI.fromHandle(_obj_newObject("popup"));
    obj.popBoonBane:setParent(obj);
    obj.popBoonBane:setName("popBoonBane");
    obj.popBoonBane:setWidth(400);
    obj.popBoonBane:setHeight(200);
    obj.popBoonBane:setBackOpacity(0.5);

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.popBoonBane);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    lfm_setPropAsString(obj.rectangle6, "corners",  "");
    obj.rectangle6:setXradius(25);
    obj.rectangle6:setYradius(25);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.popBoonBane);
    obj.label17:setText("    BOON / BANE");
    obj.label17:setAlign("left");
    obj.label17:setLeft(180);
    obj.label17:setTop(-100);
    obj.label17:setName("label17");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.popBoonBane);
    obj.edit16:setField("modBoonBane");
    obj.edit16:setAlign("top");
    obj.edit16:setWidth(100);
    obj.edit16:setHeight(100);
    obj.edit16:setType("number");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(40);
    obj.edit16:setName("edit16");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.popBoonBane);
    obj.button8:setAlign("right");
    obj.button8:setWidth(272);
    obj.button8:setText("Rolar");
    obj.button8:setName("button8");


        local valBoonBane = 0;
        local forca = false;
        local agilidade = false;
        local intelecto = false;
        local vontade = false;

        local function ligarForca()
            if sheet.modForca ~= nil then
                forca = true;
                self.popBoonBane:show();
            end;
        end;

        local function ligarAgilidade()
            if sheet.modAgilidade ~= nil then        
                agilidade = true;
                self.popBoonBane:show();
            end;
        end;

        local function ligarIntelecto()
            if sheet.modIntelecto ~= nil then
                intelecto = true;
                self.popBoonBane:show();
            end;
        end;        

        local function ligarVontade()
            if sheet.modVontade ~= nil then
                vontade = true;
                self.popBoonBane:show();
            end;
        end;                
---------------------------------------------------------------------------

        local function rolarForca(boonBane)
            local modBoonBane = boonBane;
            local modForca = sheet.modForca;
            local nome;
            if sheet.Nome == nil then
                nome = " ";
            else
                nome = " de " .. sheet.Nome;
            end;

            local mesaDeRPG = Firecast.getMesaDe(sheet);
            rolagemForca = Firecast.interpretarRolagem("1d20 + " .. modForca + modBoonBane);
            mesaDeRPG.chat:rolarDados(rolagemForca, "Força" .. nome);
        end;

        local function rolarAgilidade(boonBane)
            local modBoonBane = boonBane;
            local modAgilidade = sheet.modAgilidade;
            local nome;
            if sheet.Nome == nil then
                nome = " ";
            else
                nome = " de " .. sheet.Nome;
            end;

            local mesaDeRPG = Firecast.getMesaDe(sheet);
            rolagemAgilidade = Firecast.interpretarRolagem("1d20 + " .. modAgilidade + modBoonBane);
            mesaDeRPG.chat:rolarDados(rolagemAgilidade, "Agilidade" .. nome);
        end;

        local function rolarIntelecto(boonBane)
            local modBoonBane = boonBane;
            local modIntelecto = sheet.modIntelecto;
            local nome;
            if sheet.Nome == nil then
                nome = " ";
            else
                nome = " de " .. sheet.Nome;
            end;

            local mesaDeRPG = Firecast.getMesaDe(sheet);
            rolagemIntelecto = Firecast.interpretarRolagem("1d20 + " .. modIntelecto + modBoonBane);
            mesaDeRPG.chat:rolarDados(rolagemIntelecto, "Intelecto" .. nome);
        end;        

        local function rolarVontade(boonBane)
            local modBoonBane = boonBane;
            local modVontade = sheet.modVontade;
            local nome;
            if sheet.Nome == nil then
                nome = " ";
            else
                nome = " de " .. sheet.Nome;
            end;

            local mesaDeRPG = Firecast.getMesaDe(sheet);
            rolagemVontade = Firecast.interpretarRolagem("1d20 + " .. modVontade + modBoonBane);
            mesaDeRPG.chat:rolarDados(rolagemVontade, "Vontade" .. nome);
        end;                
-- ---------------------------------------------------------------------------
        
        local function confirmarBoonBane()
            local modBoonBane = sheet.modBoonBane;
            if modBoonBane ~= nil then
                local valorAnterior = 0;
                
                local mesaDeRPG = Firecast.getMesaDe(sheet);

                self.popBoonBane:close();

                -- boon / bane == 0
                if modBoonBane == 0 then
                    valBoonBane = modBoonBane;

                    if forca == true then
                        rolarForca(valBoonBane);
                        forca = false;
                    end;

                    if agilidade == true then
                        rolarAgilidade(valBoonBane);
                        agilidade = false;
                    end;

                    if intelecto == true then
                        rolarIntelecto(valBoonBane);
                        intelecto = false;
                    end;                

                    if vontade == true then
                        rolarVontade(valBoonBane);
                        vontade = false;
                    end;                                
                end;

                -- bane -1 a -infinito
                if modBoonBane < 0 then
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
                                    if forca == true then
                                        rolarForca(valBoonBane * -1);
                                        forca = false;
                                        valBoonBane = 0;
                                    end;

                                    if agilidade == true then
                                        rolarAgilidade(valBoonBane * -1);
                                        agilidade = false;
                                        valBoonBane = 0;
                                    end;                                

                                    if intelecto == true then
                                        rolarIntelecto(valBoonBane * -1);
                                        intelecto = false;
                                        valBoonBane = 0;
                                    end;                                                                

                                    if vontade == true then
                                        rolarVontade(valBoonBane * -1);
                                        vontade = false;
                                        valBoonBane = 0;
                                    end;                                                                                                
                                end;
                        end);
                    end;                                
                end;

                -- boon 1 a infinito
                if modBoonBane > 0 then
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
                                    if forca == true then
                                        rolarForca(valBoonBane);
                                        forca = false;
                                        valBoonBane = 0;
                                    end;

                                    if agilidade == true then
                                        rolarAgilidade(valBoonBane);
                                        agilidade = false;
                                        valBoonBane = 0;
                                    end;                                                                

                                    if intelecto == true then
                                        rolarIntelecto(valBoonBane);
                                        intelecto = false;
                                        valBoonBane = 0;
                                    end;                                                                                                

                                    if vontade == true then
                                        rolarVontade(valBoonBane);
                                        vontade = false;
                                        valBoonBane = 0;
                                    end;                                                                                                                                
                                end;
                        end);
                    end;                                
                end;
            end;
        end;
-- ----------------------------------------------------------------------------
        
    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ligarForca()
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.modForca = math.floor(sheet.Forca - 10);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            ligarAgilidade()
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.modAgilidade = math.floor(sheet.Agilidade - 10);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            ligarIntelecto()
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.modIntelecto = math.floor(sheet.Intelecto - 10);
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            ligarVontade()
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.modVontade = math.floor(sheet.Vontade - 10);
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclTracos:append();
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclAtaque:append();
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclMagia:append();
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (_)
            confirmarBoonBane()
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

        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.popBoonBane ~= nil then self.popBoonBane:destroy(); self.popBoonBane = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rclMagia ~= nil then self.rclMagia:destroy(); self.rclMagia = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rclTracos ~= nil then self.rclTracos:destroy(); self.rclTracos = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclAtaque ~= nil then self.rclAtaque:destroy(); self.rclAtaque = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaPDM()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaPDM();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaPDM = {
    newEditor = newfrmFichaPDM, 
    new = newfrmFichaPDM, 
    name = "frmFichaPDM", 
    dataType = "br.com.czagalo.SotWW_Monsters_and_NPCs", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "SotWW - Monsters and NPCs", 
    description=""};

frmFichaPDM = _frmFichaPDM;
Firecast.registrarForm(_frmFichaPDM);
Firecast.registrarDataType(_frmFichaPDM);

return _frmFichaPDM;
