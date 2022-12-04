require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmProjetoXII11_svg()
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
    obj:setName("frmProjetoXII11_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");




        -- rolagem do dado
        local function realizarRolagemDoDado1()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.PoderNivel0edit == nil or sheet.PoderNivel0edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d17");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.PoderNivel0edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.PoderNivel0edit);
                end;
        end;




-- Aqui eu vou definir um nivel que se pode clicar no botão

        -- rolagem do dado
        local function realizarRolagemDoDado2()
                -- obter a mesa do personagem
				
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.PoderNivel25edit == nil or sheet.PoderNivel25edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d17");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.PoderNivel25edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;


                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.PoderNivel25edit);
									
			
                end;
        end;





        -- rolagem do dado
        local function realizarRolagemDoDado3()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.PoderNivel80edit == nil or sheet.PoderNivel80edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d17");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.PoderNivel80edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.PoderNivel80edit);
                end;
        end;




        -- rolagem do dado
        local function realizarRolagemDoDado4()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.PoderNivel100edit == nil or sheet.PoderNivel100edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d17");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.PoderNivel100edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.PoderNivel100edit);
                end;
        end;




        -- rolagem do dado
        local function realizarRolagemDoDado5()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.HabNivel0edit == nil or sheet.HabNivel0edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d13");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.HabNivel0edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.HabNivel0edit);
                end;
        end;




        -- rolagem do dado
        local function realizarRolagemDoDado6()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.HabNivel20edit == nil or sheet.HabNivel20edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d13");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.HabNivel20edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.HabNivel20edit);
                end;
        end;




        -- rolagem do dado
        local function realizarRolagemDoDado7()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.HabNivel50edit == nil or sheet.HabNivel50edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d13");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.HabNivel50edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.HabNivel50edit);
                end;
        end;




        -- rolagem do dado
        local function realizarRolagemDoDado8()
                -- obter a mesa do personagem
                local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                if sheet.HabNivel80edit == nil or sheet.HabNivel80edit == '' then
                        -- objeto de rolagem (dado)
                        local rolagem = rrpg.interpretarRolagem("1d13");
                        rolagem:rolarLocalmente();

                        -- guarda o resultado na ficha
                        sheet.HabNivel80edit = rolagem.resultado;

                        if mesaDoPersonagem ~= nil then
                               mesaDoPersonagem.chat:enviarMensagem("Seu poder foi definido para: " .. rolagem.resultado .. "!");
                        end;
                elseif mesaDoPersonagem ~= nil then
                        mesaDoPersonagem.chat:enviarMensagem("OPS! Você já rolou o dado e tirou: " .. sheet.HabNivel80edit);
                end;
        end;



    obj.PoderesEHabilidadesNovo = GUI.fromHandle(_obj_newObject("layout"));
    obj.PoderesEHabilidadesNovo:setParent(obj.scrollBox1);
    obj.PoderesEHabilidadesNovo:setName("PoderesEHabilidadesNovo");
    obj.PoderesEHabilidadesNovo:setLeft(0);
    obj.PoderesEHabilidadesNovo:setTop(0);
    obj.PoderesEHabilidadesNovo:setWidth(829);
    obj.PoderesEHabilidadesNovo:setHeight(654);
    obj.PoderesEHabilidadesNovo:setVisible(true);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.PoderesEHabilidadesNovo);
    obj.image1:setSRC("/imagens/FundoPoderEHabilidade.png");
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(829);
    obj.image1:setHeight(654);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.PoderesEHabilidadesNovo);
    obj.image2:setSRC("/imagens/BordaPoderesEHabilidade.png");
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(829);
    obj.image2:setHeight(654);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.PoderesEHabilidadesNovo);
    obj.image3:setSRC("/imagens/FonteParaPoder.png");
    obj.image3:setLeft(2);
    obj.image3:setTop(37);
    obj.image3:setWidth(160);
    obj.image3:setHeight(72);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.PoderesEHabilidadesNovo);
    obj.image4:setSRC("/imagens/FonteParaHabilidade.png");
    obj.image4:setLeft(7);
    obj.image4:setTop(287);
    obj.image4:setWidth(240);
    obj.image4:setHeight(72);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.PoderesEHabilidadesNovo);
    obj.image5:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image5:setLeft(7);
    obj.image5:setTop(105);
    obj.image5:setWidth(238);
    obj.image5:setHeight(41);
    obj.image5:setName("image5");

    obj.BotaoRolar1 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar1:setParent(obj.image5);
    obj.BotaoRolar1:setName("BotaoRolar1");
    obj.BotaoRolar1:setText("R");
    lfm_setPropAsString(obj.BotaoRolar1, "fontStyle",  "bold");
    obj.BotaoRolar1:setAlign("right");
    obj.BotaoRolar1:setWidth(20);
    obj.BotaoRolar1:setHeight(20);
    obj.BotaoRolar1:setFontColor("orange");
    obj.BotaoRolar1:setMargins({right=-12});
    obj.BotaoRolar1:setVisible(true);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.PoderesEHabilidadesNovo);
    obj.image6:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image6:setLeft(7);
    obj.image6:setTop(148);
    obj.image6:setWidth(238);
    obj.image6:setHeight(41);
    obj.image6:setName("image6");

    obj.BotaoRolar2 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar2:setParent(obj.image6);
    obj.BotaoRolar2:setName("BotaoRolar2");
    obj.BotaoRolar2:setText("R");
    lfm_setPropAsString(obj.BotaoRolar2, "fontStyle",  "bold");
    obj.BotaoRolar2:setAlign("right");
    obj.BotaoRolar2:setWidth(20);
    obj.BotaoRolar2:setHeight(20);
    obj.BotaoRolar2:setFontColor("orange");
    obj.BotaoRolar2:setMargins({right=-12});
    obj.BotaoRolar2:setVisible(false);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.PoderesEHabilidadesNovo);
    obj.image7:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image7:setLeft(7);
    obj.image7:setTop(191);
    obj.image7:setWidth(238);
    obj.image7:setHeight(41);
    obj.image7:setName("image7");

    obj.BotaoRolar3 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar3:setParent(obj.image7);
    obj.BotaoRolar3:setName("BotaoRolar3");
    obj.BotaoRolar3:setText("R");
    lfm_setPropAsString(obj.BotaoRolar3, "fontStyle",  "bold");
    obj.BotaoRolar3:setAlign("right");
    obj.BotaoRolar3:setWidth(20);
    obj.BotaoRolar3:setHeight(20);
    obj.BotaoRolar3:setFontColor("orange");
    obj.BotaoRolar3:setMargins({right=-12});
    obj.BotaoRolar3:setVisible(false);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.PoderesEHabilidadesNovo);
    obj.image8:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image8:setLeft(7);
    obj.image8:setTop(235);
    obj.image8:setWidth(238);
    obj.image8:setHeight(41);
    obj.image8:setName("image8");

    obj.BotaoRolar4 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar4:setParent(obj.image8);
    obj.BotaoRolar4:setName("BotaoRolar4");
    obj.BotaoRolar4:setText("R");
    lfm_setPropAsString(obj.BotaoRolar4, "fontStyle",  "bold");
    obj.BotaoRolar4:setAlign("right");
    obj.BotaoRolar4:setWidth(20);
    obj.BotaoRolar4:setHeight(20);
    obj.BotaoRolar4:setFontColor("orange");
    obj.BotaoRolar4:setMargins({right=-12});
    obj.BotaoRolar4:setVisible(false);

    obj.PoderNivel25 = GUI.fromHandle(_obj_newObject("image"));
    obj.PoderNivel25:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel25:setName("PoderNivel25");
    obj.PoderNivel25:setSRC("/imagens/PoderNivel20.png");
    obj.PoderNivel25:setLeft(7);
    obj.PoderNivel25:setTop(148);
    obj.PoderNivel25:setWidth(238);
    obj.PoderNivel25:setHeight(41);
    obj.PoderNivel25:setVisible(true);

    obj.PoderNivel80 = GUI.fromHandle(_obj_newObject("image"));
    obj.PoderNivel80:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel80:setName("PoderNivel80");
    obj.PoderNivel80:setSRC("/imagens/PoderNivel80.png");
    obj.PoderNivel80:setLeft(7);
    obj.PoderNivel80:setTop(191);
    obj.PoderNivel80:setWidth(238);
    obj.PoderNivel80:setHeight(41);
    obj.PoderNivel80:setVisible(true);

    obj.PoderNivel100 = GUI.fromHandle(_obj_newObject("image"));
    obj.PoderNivel100:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel100:setName("PoderNivel100");
    obj.PoderNivel100:setSRC("/imagens/PoderNivel100.png");
    obj.PoderNivel100:setLeft(7);
    obj.PoderNivel100:setTop(235);
    obj.PoderNivel100:setWidth(238);
    obj.PoderNivel100:setHeight(41);
    obj.PoderNivel100:setVisible(true);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.PoderesEHabilidadesNovo);
    obj.image9:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image9:setLeft(7);
    obj.image9:setTop(361);
    obj.image9:setWidth(238);
    obj.image9:setHeight(41);
    obj.image9:setName("image9");

    obj.BotaoRolar5 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar5:setParent(obj.image9);
    obj.BotaoRolar5:setName("BotaoRolar5");
    obj.BotaoRolar5:setText("R");
    lfm_setPropAsString(obj.BotaoRolar5, "fontStyle",  "bold");
    obj.BotaoRolar5:setAlign("right");
    obj.BotaoRolar5:setWidth(20);
    obj.BotaoRolar5:setHeight(20);
    obj.BotaoRolar5:setFontColor("orange");
    obj.BotaoRolar5:setMargins({right=-12});

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.PoderesEHabilidadesNovo);
    obj.image10:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image10:setLeft(7);
    obj.image10:setTop(404);
    obj.image10:setWidth(238);
    obj.image10:setHeight(41);
    obj.image10:setName("image10");

    obj.BotaoRolar6 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar6:setParent(obj.image10);
    obj.BotaoRolar6:setName("BotaoRolar6");
    obj.BotaoRolar6:setText("R");
    lfm_setPropAsString(obj.BotaoRolar6, "fontStyle",  "bold");
    obj.BotaoRolar6:setAlign("right");
    obj.BotaoRolar6:setWidth(20);
    obj.BotaoRolar6:setHeight(20);
    obj.BotaoRolar6:setFontColor("orange");
    obj.BotaoRolar6:setMargins({right=-12});

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.PoderesEHabilidadesNovo);
    obj.image11:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image11:setLeft(7);
    obj.image11:setTop(448);
    obj.image11:setWidth(238);
    obj.image11:setHeight(41);
    obj.image11:setName("image11");

    obj.BotaoRolar7 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar7:setParent(obj.image11);
    obj.BotaoRolar7:setName("BotaoRolar7");
    obj.BotaoRolar7:setText("R");
    lfm_setPropAsString(obj.BotaoRolar7, "fontStyle",  "bold");
    obj.BotaoRolar7:setAlign("right");
    obj.BotaoRolar7:setWidth(20);
    obj.BotaoRolar7:setHeight(20);
    obj.BotaoRolar7:setFontColor("orange");
    obj.BotaoRolar7:setMargins({right=-12});

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.PoderesEHabilidadesNovo);
    obj.image12:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image12:setLeft(7);
    obj.image12:setTop(492);
    obj.image12:setWidth(238);
    obj.image12:setHeight(41);
    obj.image12:setName("image12");

    obj.BotaoRolar8 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoRolar8:setParent(obj.image12);
    obj.BotaoRolar8:setName("BotaoRolar8");
    obj.BotaoRolar8:setText("R");
    lfm_setPropAsString(obj.BotaoRolar8, "fontStyle",  "bold");
    obj.BotaoRolar8:setAlign("right");
    obj.BotaoRolar8:setWidth(20);
    obj.BotaoRolar8:setHeight(20);
    obj.BotaoRolar8:setFontColor("orange");
    obj.BotaoRolar8:setMargins({right=-12});

    obj.HabNivel20 = GUI.fromHandle(_obj_newObject("image"));
    obj.HabNivel20:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel20:setName("HabNivel20");
    obj.HabNivel20:setSRC("/imagens/HabNivel20.png");
    obj.HabNivel20:setLeft(7);
    obj.HabNivel20:setTop(404);
    obj.HabNivel20:setWidth(238);
    obj.HabNivel20:setHeight(41);
    obj.HabNivel20:setVisible(true);

    obj.HabNivel50 = GUI.fromHandle(_obj_newObject("image"));
    obj.HabNivel50:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel50:setName("HabNivel50");
    obj.HabNivel50:setSRC("/imagens/HabNivel50.png");
    obj.HabNivel50:setLeft(7);
    obj.HabNivel50:setTop(448);
    obj.HabNivel50:setWidth(238);
    obj.HabNivel50:setHeight(41);
    obj.HabNivel50:setVisible(true);

    obj.HabNivel80 = GUI.fromHandle(_obj_newObject("image"));
    obj.HabNivel80:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel80:setName("HabNivel80");
    obj.HabNivel80:setSRC("/imagens/HabNivel80.png");
    obj.HabNivel80:setLeft(7);
    obj.HabNivel80:setTop(492);
    obj.HabNivel80:setWidth(238);
    obj.HabNivel80:setHeight(41);
    obj.HabNivel80:setVisible(true);

    obj.PoderNivel0edit = GUI.fromHandle(_obj_newObject("label"));
    obj.PoderNivel0edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel0edit:setName("PoderNivel0edit");
    obj.PoderNivel0edit:setField("PoderNivel0edit");
    obj.PoderNivel0edit:setLeft(14);
    obj.PoderNivel0edit:setTop(106);
    obj.PoderNivel0edit:setWidth(82);
    obj.PoderNivel0edit:setHeight(39);
    obj.PoderNivel0edit:setVisible(true);
    obj.PoderNivel0edit:setHorzTextAlign("center");
    obj.PoderNivel0edit:setFontSize(30);

    obj.PoderNivel25edit = GUI.fromHandle(_obj_newObject("label"));
    obj.PoderNivel25edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel25edit:setName("PoderNivel25edit");
    obj.PoderNivel25edit:setField("PoderNivel25edit");
    obj.PoderNivel25edit:setLeft(14);
    obj.PoderNivel25edit:setTop(150);
    obj.PoderNivel25edit:setWidth(82);
    obj.PoderNivel25edit:setHeight(39);
    obj.PoderNivel25edit:setVisible(false);
    obj.PoderNivel25edit:setHorzTextAlign("center");
    obj.PoderNivel25edit:setFontSize(30);

    obj.PoderNivel80edit = GUI.fromHandle(_obj_newObject("label"));
    obj.PoderNivel80edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel80edit:setName("PoderNivel80edit");
    obj.PoderNivel80edit:setField("PoderNivel80edit");
    obj.PoderNivel80edit:setLeft(14);
    obj.PoderNivel80edit:setTop(192);
    obj.PoderNivel80edit:setWidth(82);
    obj.PoderNivel80edit:setHeight(39);
    obj.PoderNivel80edit:setVisible(false);
    obj.PoderNivel80edit:setHorzTextAlign("center");
    obj.PoderNivel80edit:setFontSize(30);

    obj.PoderNivel100edit = GUI.fromHandle(_obj_newObject("label"));
    obj.PoderNivel100edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel100edit:setName("PoderNivel100edit");
    obj.PoderNivel100edit:setField("PoderNivel100edit");
    obj.PoderNivel100edit:setLeft(14);
    obj.PoderNivel100edit:setTop(236);
    obj.PoderNivel100edit:setWidth(82);
    obj.PoderNivel100edit:setHeight(39);
    obj.PoderNivel100edit:setVisible(false);
    obj.PoderNivel100edit:setHorzTextAlign("center");
    obj.PoderNivel100edit:setFontSize(30);

    obj.PoderNivel0edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.PoderNivel0edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel0edit1:setName("PoderNivel0edit1");
    obj.PoderNivel0edit1:setField("PoderNivel0edit1");
    obj.PoderNivel0edit1:setLeft(99);
    obj.PoderNivel0edit1:setTop(106);
    obj.PoderNivel0edit1:setWidth(135);
    obj.PoderNivel0edit1:setHeight(39);
    obj.PoderNivel0edit1:setTransparent(true);
    obj.PoderNivel0edit1:setVisible(true);
    obj.PoderNivel0edit1:setFontSize(14);

    obj.PoderNivel25edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.PoderNivel25edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel25edit1:setName("PoderNivel25edit1");
    obj.PoderNivel25edit1:setField("PoderNivel25edit1");
    obj.PoderNivel25edit1:setLeft(99);
    obj.PoderNivel25edit1:setTop(150);
    obj.PoderNivel25edit1:setWidth(135);
    obj.PoderNivel25edit1:setHeight(39);
    obj.PoderNivel25edit1:setTransparent(true);
    obj.PoderNivel25edit1:setVisible(false);
    obj.PoderNivel25edit1:setFontSize(14);

    obj.PoderNivel80edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.PoderNivel80edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel80edit1:setName("PoderNivel80edit1");
    obj.PoderNivel80edit1:setField("PoderNivel80edit1");
    obj.PoderNivel80edit1:setLeft(99);
    obj.PoderNivel80edit1:setTop(193);
    obj.PoderNivel80edit1:setWidth(135);
    obj.PoderNivel80edit1:setHeight(39);
    obj.PoderNivel80edit1:setTransparent(true);
    obj.PoderNivel80edit1:setVisible(false);
    obj.PoderNivel80edit1:setFontSize(14);

    obj.PoderNivel100edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.PoderNivel100edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.PoderNivel100edit1:setName("PoderNivel100edit1");
    obj.PoderNivel100edit1:setField("PoderNivel100edit1");
    obj.PoderNivel100edit1:setLeft(99);
    obj.PoderNivel100edit1:setTop(237);
    obj.PoderNivel100edit1:setWidth(135);
    obj.PoderNivel100edit1:setHeight(39);
    obj.PoderNivel100edit1:setTransparent(true);
    obj.PoderNivel100edit1:setVisible(false);
    obj.PoderNivel100edit1:setFontSize(14);

    obj.HabNivel0edit = GUI.fromHandle(_obj_newObject("label"));
    obj.HabNivel0edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel0edit:setName("HabNivel0edit");
    obj.HabNivel0edit:setField("HabNivel0edit");
    obj.HabNivel0edit:setLeft(14);
    obj.HabNivel0edit:setTop(362);
    obj.HabNivel0edit:setWidth(82);
    obj.HabNivel0edit:setHeight(39);
    obj.HabNivel0edit:setVisible(true);
    obj.HabNivel0edit:setHorzTextAlign("center");
    obj.HabNivel0edit:setFontSize(30);

    obj.HabNivel20edit = GUI.fromHandle(_obj_newObject("label"));
    obj.HabNivel20edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel20edit:setName("HabNivel20edit");
    obj.HabNivel20edit:setField("HabNivel20edit");
    obj.HabNivel20edit:setLeft(14);
    obj.HabNivel20edit:setTop(405);
    obj.HabNivel20edit:setWidth(82);
    obj.HabNivel20edit:setHeight(39);
    obj.HabNivel20edit:setVisible(false);
    obj.HabNivel20edit:setHorzTextAlign("center");
    obj.HabNivel20edit:setFontSize(30);

    obj.HabNivel50edit = GUI.fromHandle(_obj_newObject("label"));
    obj.HabNivel50edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel50edit:setName("HabNivel50edit");
    obj.HabNivel50edit:setField("HabNivel50edit");
    obj.HabNivel50edit:setLeft(14);
    obj.HabNivel50edit:setTop(449);
    obj.HabNivel50edit:setWidth(82);
    obj.HabNivel50edit:setHeight(39);
    obj.HabNivel50edit:setVisible(false);
    obj.HabNivel50edit:setHorzTextAlign("center");
    obj.HabNivel50edit:setFontSize(30);

    obj.HabNivel80edit = GUI.fromHandle(_obj_newObject("label"));
    obj.HabNivel80edit:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel80edit:setName("HabNivel80edit");
    obj.HabNivel80edit:setField("HabNivel80edit");
    obj.HabNivel80edit:setLeft(14);
    obj.HabNivel80edit:setTop(493);
    obj.HabNivel80edit:setWidth(82);
    obj.HabNivel80edit:setHeight(39);
    obj.HabNivel80edit:setVisible(false);
    obj.HabNivel80edit:setHorzTextAlign("center");
    obj.HabNivel80edit:setFontSize(30);

    obj.HabNivel0edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HabNivel0edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel0edit1:setName("HabNivel0edit1");
    obj.HabNivel0edit1:setField("HabNivel0edit1");
    obj.HabNivel0edit1:setLeft(99);
    obj.HabNivel0edit1:setTop(363);
    obj.HabNivel0edit1:setWidth(135);
    obj.HabNivel0edit1:setHeight(39);
    obj.HabNivel0edit1:setTransparent(true);
    obj.HabNivel0edit1:setVisible(true);
    obj.HabNivel0edit1:setFontSize(14);

    obj.HabNivel20edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HabNivel20edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel20edit1:setName("HabNivel20edit1");
    obj.HabNivel20edit1:setField("HabNivel20edit1");
    obj.HabNivel20edit1:setLeft(99);
    obj.HabNivel20edit1:setTop(406);
    obj.HabNivel20edit1:setWidth(135);
    obj.HabNivel20edit1:setHeight(39);
    obj.HabNivel20edit1:setTransparent(true);
    obj.HabNivel20edit1:setVisible(false);
    obj.HabNivel20edit1:setFontSize(14);

    obj.HabNivel50edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HabNivel50edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel50edit1:setName("HabNivel50edit1");
    obj.HabNivel50edit1:setField("HabNivel50edit1");
    obj.HabNivel50edit1:setLeft(99);
    obj.HabNivel50edit1:setTop(450);
    obj.HabNivel50edit1:setWidth(135);
    obj.HabNivel50edit1:setHeight(39);
    obj.HabNivel50edit1:setTransparent(true);
    obj.HabNivel50edit1:setVisible(false);
    obj.HabNivel50edit1:setFontSize(14);

    obj.HabNivel80edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HabNivel80edit1:setParent(obj.PoderesEHabilidadesNovo);
    obj.HabNivel80edit1:setName("HabNivel80edit1");
    obj.HabNivel80edit1:setField("HabNivel80edit1");
    obj.HabNivel80edit1:setLeft(99);
    obj.HabNivel80edit1:setTop(494);
    obj.HabNivel80edit1:setWidth(135);
    obj.HabNivel80edit1:setHeight(39);
    obj.HabNivel80edit1:setTransparent(true);
    obj.HabNivel80edit1:setVisible(false);
    obj.HabNivel80edit1:setFontSize(14);

    obj.poderesEHabilidadesListados = GUI.fromHandle(_obj_newObject("layout"));
    obj.poderesEHabilidadesListados:setParent(obj.PoderesEHabilidadesNovo);
    obj.poderesEHabilidadesListados:setName("poderesEHabilidadesListados");
    obj.poderesEHabilidadesListados:setAlign("client");
    obj.poderesEHabilidadesListados:setVisible(true);

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.poderesEHabilidadesListados);
    obj.image13:setSRC("/imagens/CirculoNave.png");
    obj.image13:setLeft(230);
    obj.image13:setTop(106);
    obj.image13:setWidth(400);
    obj.image13:setHeight(250);
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.poderesEHabilidadesListados);
    obj.image14:setSRC("/imagens/CirculoNave.png");
    obj.image14:setLeft(230);
    obj.image14:setTop(360);
    obj.image14:setWidth(400);
    obj.image14:setHeight(250);
    obj.image14:setName("image14");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox1:setField("PoderNumero1");
    obj.imageCheckBox1:setLeft(262);
    obj.imageCheckBox1:setTop(115);
    obj.imageCheckBox1:setWidth(144);
    obj.imageCheckBox1:setHeight(12);
    obj.imageCheckBox1:setImageChecked("/Poderes/1 - Super Velocidade ON.png");
    obj.imageCheckBox1:setImageUnchecked("/Poderes/1 - Super Velocidade OFF.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.imageCheckBox1);
    obj.button1:setText("Inf");
    obj.button1:setAlign("top");
    obj.button1:setHeight(15);
    obj.button1:setMargins({top=13});
    obj.button1:setName("button1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox2:setField("PoderNumero2");
    obj.imageCheckBox2:setLeft(412);
    obj.imageCheckBox2:setTop(115);
    obj.imageCheckBox2:setWidth(52);
    obj.imageCheckBox2:setHeight(12);
    obj.imageCheckBox2:setImageChecked("/Poderes/2 - Voar ON.png");
    obj.imageCheckBox2:setImageUnchecked("/Poderes/2 - Voar OFF.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.imageCheckBox2);
    obj.button2:setText("Inf");
    obj.button2:setAlign("top");
    obj.button2:setHeight(15);
    obj.button2:setMargins({top=13});
    obj.button2:setName("button2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox3:setField("PoderNumero3");
    obj.imageCheckBox3:setLeft(466);
    obj.imageCheckBox3:setTop(115);
    obj.imageCheckBox3:setWidth(133);
    obj.imageCheckBox3:setHeight(18);
    obj.imageCheckBox3:setImageChecked("/Poderes/3 - Super Força ON.png");
    obj.imageCheckBox3:setImageUnchecked("/Poderes/3 - Super Força OFF.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.imageCheckBox3);
    obj.button3:setText("Inf");
    obj.button3:setAlign("top");
    obj.button3:setHeight(15);
    obj.button3:setMargins({top=13});
    obj.button3:setName("button3");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox4:setField("PoderNumero4");
    obj.imageCheckBox4:setLeft(262);
    obj.imageCheckBox4:setTop(142);
    obj.imageCheckBox4:setWidth(135);
    obj.imageCheckBox4:setHeight(17);
    obj.imageCheckBox4:setImageChecked("/Poderes/4 - Telecinético ON.png");
    obj.imageCheckBox4:setImageUnchecked("/Poderes/4 - Telecinético OFF.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.imageCheckBox4);
    obj.button4:setText("Inf");
    obj.button4:setAlign("top");
    obj.button4:setHeight(15);
    obj.button4:setMargins({top=17});
    obj.button4:setName("button4");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox5:setField("PoderNumero5");
    obj.imageCheckBox5:setLeft(401);
    obj.imageCheckBox5:setTop(146);
    obj.imageCheckBox5:setWidth(136);
    obj.imageCheckBox5:setHeight(12);
    obj.imageCheckBox5:setImageChecked("/Poderes/5 - Parar tempo ON.png");
    obj.imageCheckBox5:setImageUnchecked("/Poderes/5 - Parar tempo OFF.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.imageCheckBox5);
    obj.button5:setText("Inf");
    obj.button5:setAlign("top");
    obj.button5:setHeight(15);
    obj.button5:setMargins({top=13});
    obj.button5:setName("button5");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox6:setField("PoderNumero6");
    obj.imageCheckBox6:setLeft(262);
    obj.imageCheckBox6:setTop(175);
    obj.imageCheckBox6:setWidth(118);
    obj.imageCheckBox6:setHeight(14);
    obj.imageCheckBox6:setImageChecked("/Poderes/6 - Ler mentes ON.png");
    obj.imageCheckBox6:setImageUnchecked("/Poderes/6 - Ler mentes OFF.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.imageCheckBox6);
    obj.button6:setText("Inf");
    obj.button6:setAlign("top");
    obj.button6:setHeight(15);
    obj.button6:setMargins({top=15});
    obj.button6:setName("button6");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox7:setField("PoderNumero7");
    obj.imageCheckBox7:setLeft(385);
    obj.imageCheckBox7:setTop(175);
    obj.imageCheckBox7:setWidth(118);
    obj.imageCheckBox7:setHeight(14);
    obj.imageCheckBox7:setImageChecked("/Poderes/7 - Invisibilidade ON.png");
    obj.imageCheckBox7:setImageUnchecked("/Poderes/7 - Invisibilidade OFF.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.imageCheckBox7);
    obj.button7:setText("Inf");
    obj.button7:setAlign("top");
    obj.button7:setHeight(15);
    obj.button7:setMargins({top=15});
    obj.button7:setName("button7");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox8:setField("PoderNumero8");
    obj.imageCheckBox8:setLeft(262);
    obj.imageCheckBox8:setTop(205);
    obj.imageCheckBox8:setWidth(109);
    obj.imageCheckBox8:setHeight(14);
    obj.imageCheckBox8:setImageChecked("/Poderes/8 - Teleporte ON.png");
    obj.imageCheckBox8:setImageUnchecked("/Poderes/8 - Teleporte OFF.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.imageCheckBox8);
    obj.button8:setText("Inf");
    obj.button8:setAlign("top");
    obj.button8:setHeight(15);
    obj.button8:setMargins({top=15});
    obj.button8:setName("button8");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox9:setField("PoderNumero9");
    obj.imageCheckBox9:setLeft(377);
    obj.imageCheckBox9:setTop(205);
    obj.imageCheckBox9:setWidth(177);
    obj.imageCheckBox9:setHeight(14);
    obj.imageCheckBox9:setImageChecked("/Poderes/9 - Voltar no tempo ON.png");
    obj.imageCheckBox9:setImageUnchecked("/Poderes/9 - Voltar no tempo OFF.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.imageCheckBox9);
    obj.button9:setText("Inf");
    obj.button9:setAlign("top");
    obj.button9:setHeight(15);
    obj.button9:setMargins({top=15});
    obj.button9:setName("button9");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox10:setField("PoderNumero10");
    obj.imageCheckBox10:setLeft(262);
    obj.imageCheckBox10:setTop(235);
    obj.imageCheckBox10:setWidth(200);
    obj.imageCheckBox10:setHeight(14);
    obj.imageCheckBox10:setImageChecked("/Poderes/10 - Controle de mente ON.png");
    obj.imageCheckBox10:setImageUnchecked("/Poderes/10 - Controle de mente OFF.png");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.imageCheckBox10);
    obj.button10:setText("Inf");
    obj.button10:setAlign("top");
    obj.button10:setHeight(15);
    obj.button10:setMargins({top=15});
    obj.button10:setName("button10");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox11:setField("PoderNumero11");
    obj.imageCheckBox11:setLeft(466);
    obj.imageCheckBox11:setTop(235);
    obj.imageCheckBox11:setWidth(118);
    obj.imageCheckBox11:setHeight(14);
    obj.imageCheckBox11:setImageChecked("/Poderes/11 - Metamorfo ON.png");
    obj.imageCheckBox11:setImageUnchecked("/Poderes/11 - Metamorfo OFF.png");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.imageCheckBox11);
    obj.button11:setText("Inf");
    obj.button11:setAlign("top");
    obj.button11:setHeight(15);
    obj.button11:setMargins({top=15});
    obj.button11:setName("button11");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox12:setField("PoderNumero12");
    obj.imageCheckBox12:setLeft(262);
    obj.imageCheckBox12:setTop(265);
    obj.imageCheckBox12:setWidth(68);
    obj.imageCheckBox12:setHeight(14);
    obj.imageCheckBox12:setImageChecked("/Poderes/12 - Ilusão ON.png");
    obj.imageCheckBox12:setImageUnchecked("/Poderes/12 - Ilusão OFF.png");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.imageCheckBox12);
    obj.button12:setText("Inf");
    obj.button12:setAlign("top");
    obj.button12:setHeight(15);
    obj.button12:setMargins({top=15});
    obj.button12:setName("button12");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox13:setField("PoderNumero13");
    obj.imageCheckBox13:setLeft(330);
    obj.imageCheckBox13:setTop(265);
    obj.imageCheckBox13:setWidth(220);
    obj.imageCheckBox13:setHeight(14);
    obj.imageCheckBox13:setImageChecked("/Poderes/13 - Controle de energia ON.png");
    obj.imageCheckBox13:setImageUnchecked("/Poderes/13 - Controle de energia OFF.png");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.imageCheckBox13);
    obj.button13:setText("Inf");
    obj.button13:setAlign("top");
    obj.button13:setHeight(15);
    obj.button13:setMargins({top=15});
    obj.button13:setName("button13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox14:setField("PoderNumero14");
    obj.imageCheckBox14:setLeft(262);
    obj.imageCheckBox14:setTop(294);
    obj.imageCheckBox14:setWidth(161);
    obj.imageCheckBox14:setHeight(14);
    obj.imageCheckBox14:setImageChecked("/Poderes/14 - Corpo elástico ON.png");
    obj.imageCheckBox14:setImageUnchecked("/Poderes/14 - Corpo elástico OFF.png");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.imageCheckBox14);
    obj.button14:setText("Inf");
    obj.button14:setAlign("top");
    obj.button14:setHeight(15);
    obj.button14:setMargins({top=15});
    obj.button14:setName("button14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox15:setField("PoderNumero15");
    obj.imageCheckBox15:setLeft(433);
    obj.imageCheckBox15:setTop(294);
    obj.imageCheckBox15:setWidth(161);
    obj.imageCheckBox15:setHeight(14);
    obj.imageCheckBox15:setImageChecked("/Poderes/15 - Controle de fogo ON.png");
    obj.imageCheckBox15:setImageUnchecked("/Poderes/15 - Controle de fogo OFF.png");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.imageCheckBox15);
    obj.button15:setText("Inf");
    obj.button15:setAlign("top");
    obj.button15:setHeight(15);
    obj.button15:setMargins({top=15});
    obj.button15:setName("button15");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox16:setField("PoderNumero16");
    obj.imageCheckBox16:setLeft(262);
    obj.imageCheckBox16:setTop(324);
    obj.imageCheckBox16:setWidth(84);
    obj.imageCheckBox16:setHeight(14);
    obj.imageCheckBox16:setImageChecked("/Poderes/16 - Hibrido ON.png");
    obj.imageCheckBox16:setImageUnchecked("/Poderes/16 - Hibrido OFF.png");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.imageCheckBox16);
    obj.button16:setText("Inf");
    obj.button16:setAlign("top");
    obj.button16:setHeight(15);
    obj.button16:setMargins({top=15});
    obj.button16:setName("button16");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox17:setField("PoderNumero17");
    obj.imageCheckBox17:setLeft(360);
    obj.imageCheckBox17:setTop(324);
    obj.imageCheckBox17:setWidth(159);
    obj.imageCheckBox17:setHeight(14);
    obj.imageCheckBox17:setImageChecked("/Poderes/17 - Prever futuro ON.png");
    obj.imageCheckBox17:setImageUnchecked("/Poderes/17 - Prever futuro OFF.png");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.imageCheckBox17);
    obj.button17:setText("Inf");
    obj.button17:setAlign("top");
    obj.button17:setHeight(15);
    obj.button17:setMargins({top=15});
    obj.button17:setName("button17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox18:setField("HabilidadeNumero1");
    obj.imageCheckBox18:setLeft(262);
    obj.imageCheckBox18:setTop(366);
    obj.imageCheckBox18:setWidth(204);
    obj.imageCheckBox18:setHeight(17);
    obj.imageCheckBox18:setImageChecked("/Habilidades/1 - Super Resistência ON.png");
    obj.imageCheckBox18:setImageUnchecked("/Habilidades/1 - Super Resistência OFF.png");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.imageCheckBox18);
    obj.button18:setText("Inf");
    obj.button18:setAlign("top");
    obj.button18:setHeight(15);
    obj.button18:setMargins({top=17});
    obj.button18:setName("button18");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox19:setField("HabilidadeNumero2");
    obj.imageCheckBox19:setLeft(468);
    obj.imageCheckBox19:setTop(368);
    obj.imageCheckBox19:setWidth(120);
    obj.imageCheckBox19:setHeight(14);
    obj.imageCheckBox19:setImageChecked("/Habilidades/2 - Super pulo ON.png");
    obj.imageCheckBox19:setImageUnchecked("/Habilidades/2 - Super pulo OFF.png");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.imageCheckBox19);
    obj.button19:setText("Inf");
    obj.button19:setAlign("top");
    obj.button19:setHeight(15);
    obj.button19:setMargins({top=15});
    obj.button19:setName("button19");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox20:setField("HabilidadeNumero3");
    obj.imageCheckBox20:setLeft(262);
    obj.imageCheckBox20:setTop(396);
    obj.imageCheckBox20:setWidth(182);
    obj.imageCheckBox20:setHeight(21);
    obj.imageCheckBox20:setImageChecked("/Habilidades/3 - Super percepção ON.png");
    obj.imageCheckBox20:setImageUnchecked("/Habilidades/3 - Super percepção OFF.png");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.imageCheckBox20);
    obj.button20:setText("Inf");
    obj.button20:setAlign("top");
    obj.button20:setHeight(15);
    obj.button20:setMargins({top=18});
    obj.button20:setName("button20");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox21:setField("HabilidadeNumero4");
    obj.imageCheckBox21:setLeft(262);
    obj.imageCheckBox21:setTop(426);
    obj.imageCheckBox21:setWidth(174);
    obj.imageCheckBox21:setHeight(21);
    obj.imageCheckBox21:setImageChecked("/Habilidades/4 - Alto destruição ON.png");
    obj.imageCheckBox21:setImageUnchecked("/Habilidades/4 - Alto destruição OFF.png");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.imageCheckBox21);
    obj.button21:setText("Inf");
    obj.button21:setAlign("top");
    obj.button21:setHeight(15);
    obj.button21:setMargins({top=18});
    obj.button21:setName("button21");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox22:setField("HabilidadeNumero5");
    obj.imageCheckBox22:setLeft(262);
    obj.imageCheckBox22:setTop(456);
    obj.imageCheckBox22:setWidth(214);
    obj.imageCheckBox22:setHeight(21);
    obj.imageCheckBox22:setImageChecked("/Habilidades/5 - Controle da emoção ON.png");
    obj.imageCheckBox22:setImageUnchecked("/Habilidades/5 - Controle da emoção OFF.png");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.imageCheckBox22);
    obj.button22:setText("Inf");
    obj.button22:setAlign("top");
    obj.button22:setHeight(15);
    obj.button22:setMargins({top=18});
    obj.button22:setName("button22");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox23:setField("HabilidadeNumero6");
    obj.imageCheckBox23:setLeft(262);
    obj.imageCheckBox23:setTop(490);
    obj.imageCheckBox23:setWidth(218);
    obj.imageCheckBox23:setHeight(14);
    obj.imageCheckBox23:setImageChecked("/Habilidades/6 - Controle de animais ON.png");
    obj.imageCheckBox23:setImageUnchecked("/Habilidades/6 - Controle de animais OFF.png");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.imageCheckBox23);
    obj.button23:setText("Inf");
    obj.button23:setAlign("top");
    obj.button23:setHeight(15);
    obj.button23:setMargins({top=15});
    obj.button23:setName("button23");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox24:setField("HabilidadeNumero7");
    obj.imageCheckBox24:setLeft(460);
    obj.imageCheckBox24:setTop(399);
    obj.imageCheckBox24:setWidth(80);
    obj.imageCheckBox24:setHeight(14);
    obj.imageCheckBox24:setImageChecked("/Habilidades/7 - Analise ON.png");
    obj.imageCheckBox24:setImageUnchecked("/Habilidades/7 - Analise OFF.png");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.imageCheckBox24);
    obj.button24:setText("Inf");
    obj.button24:setAlign("top");
    obj.button24:setHeight(15);
    obj.button24:setMargins({top=15});
    obj.button24:setName("button24");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox25:setField("HabilidadeNumero8");
    obj.imageCheckBox25:setLeft(460);
    obj.imageCheckBox25:setTop(428);
    obj.imageCheckBox25:setWidth(125);
    obj.imageCheckBox25:setHeight(14);
    obj.imageCheckBox25:setImageChecked("/Habilidades/8 - Movimentos ON.png");
    obj.imageCheckBox25:setImageUnchecked("/Habilidades/8 - Movimentos OFF.png");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.imageCheckBox25);
    obj.button25:setText("Inf");
    obj.button25:setAlign("top");
    obj.button25:setHeight(15);
    obj.button25:setMargins({top=15});
    obj.button25:setName("button25");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox26:setField("HabilidadeNumero9");
    obj.imageCheckBox26:setLeft(262);
    obj.imageCheckBox26:setTop(520);
    obj.imageCheckBox26:setWidth(109);
    obj.imageCheckBox26:setHeight(14);
    obj.imageCheckBox26:setImageChecked("/Habilidades/9 - Auto cura ON.png");
    obj.imageCheckBox26:setImageUnchecked("/Habilidades/9 - Auto cura OFF.png");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.imageCheckBox26);
    obj.button26:setText("Inf");
    obj.button26:setAlign("top");
    obj.button26:setHeight(15);
    obj.button26:setMargins({top=15});
    obj.button26:setName("button26");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox27:setField("HabilidadeNumero10");
    obj.imageCheckBox27:setLeft(262);
    obj.imageCheckBox27:setTop(550);
    obj.imageCheckBox27:setWidth(203);
    obj.imageCheckBox27:setHeight(14);
    obj.imageCheckBox27:setImageChecked("/Habilidades/10 - Atravessar parede ON.png");
    obj.imageCheckBox27:setImageUnchecked("/Habilidades/10 - Atravessar parede OFF.png");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.imageCheckBox27);
    obj.button27:setText("Inf");
    obj.button27:setAlign("top");
    obj.button27:setHeight(15);
    obj.button27:setMargins({top=15});
    obj.button27:setName("button27");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox28:setField("HabilidadeNumero11");
    obj.imageCheckBox28:setLeft(375);
    obj.imageCheckBox28:setTop(517);
    obj.imageCheckBox28:setWidth(129);
    obj.imageCheckBox28:setHeight(17);
    obj.imageCheckBox28:setImageChecked("/Habilidades/11 - Visão raio x ON.png");
    obj.imageCheckBox28:setImageUnchecked("/Habilidades/11 - Visão raio x OFF.png");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.imageCheckBox28);
    obj.button28:setText("Inf");
    obj.button28:setAlign("top");
    obj.button28:setHeight(15);
    obj.button28:setMargins({top=18});
    obj.button28:setName("button28");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox29:setField("HabilidadeNumero12");
    obj.imageCheckBox29:setLeft(262);
    obj.imageCheckBox29:setTop(578);
    obj.imageCheckBox29:setWidth(171);
    obj.imageCheckBox29:setHeight(14);
    obj.imageCheckBox29:setImageChecked("/Habilidades/12 - Controle de luz ON.png");
    obj.imageCheckBox29:setImageUnchecked("/Habilidades/12 - Controle de luz OFF.png");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.imageCheckBox29);
    obj.button29:setText("Inf");
    obj.button29:setAlign("top");
    obj.button29:setHeight(15);
    obj.button29:setMargins({top=15});
    obj.button29:setName("button29");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.poderesEHabilidadesListados);
    obj.imageCheckBox30:setField("HabilidadeNumero13");
    obj.imageCheckBox30:setLeft(440);
    obj.imageCheckBox30:setTop(578);
    obj.imageCheckBox30:setWidth(141);
    obj.imageCheckBox30:setHeight(14);
    obj.imageCheckBox30:setImageChecked("/Habilidades/13 - Super olfato ON.png");
    obj.imageCheckBox30:setImageUnchecked("/Habilidades/13 - Super olfato OFF.png");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.imageCheckBox30);
    obj.button30:setText("Inf");
    obj.button30:setAlign("top");
    obj.button30:setHeight(15);
    obj.button30:setMargins({top=15});
    obj.button30:setName("button30");

    obj.InfPoderes1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes1:setParent(obj.scrollBox1);
    obj.InfPoderes1:setName("InfPoderes1");
    obj.InfPoderes1:setAlign("client");
    obj.InfPoderes1:setVisible(false);

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.InfPoderes1);
    obj.button31:setText("VOLTAR");
    lfm_setPropAsString(obj.button31, "fontStyle",  "bold");
    obj.button31:setFontColor("#6495ED");
    obj.button31:setLeft(300);
    obj.button31:setTop(88);
    obj.button31:setWidth(70);
    obj.button31:setHeight(30);
    obj.button31:setName("button31");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.InfPoderes1);
    obj.image15:setSRC("/imagens/CirculoNave.png");
    obj.image15:setLeft(293);
    obj.image15:setTop(120);
    obj.image15:setWidth(408);
    obj.image15:setHeight(285);
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.InfPoderes1);
    obj.image16:setSRC("/imagens/NomedoseuPoder.png");
    obj.image16:setLeft(293);
    obj.image16:setTop(116);
    obj.image16:setWidth(218);
    obj.image16:setHeight(43);
    obj.image16:setName("image16");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.InfPoderes1);
    obj.image17:setSRC("/imagens/detalhesdoPoder.png");
    obj.image17:setLeft(293);
    obj.image17:setTop(165);
    obj.image17:setWidth(218);
    obj.image17:setHeight(43);
    obj.image17:setName("image17");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.InfPoderes1);
    obj.image18:setSRC("/imagens/niveisDoPoder.png");
    obj.image18:setLeft(235);
    obj.image18:setTop(270);
    obj.image18:setWidth(218);
    obj.image18:setHeight(43);
    obj.image18:setName("image18");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.InfPoderes1);
    obj.image19:setSRC("/imagens/Anotações.png");
    obj.image19:setLeft(500);
    obj.image19:setTop(117);
    obj.image19:setWidth(218);
    obj.image19:setHeight(43);
    obj.image19:setName("image19");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.InfPoderes1);
    obj.edit1:setLeft(306);
    obj.edit1:setTop(149);
    obj.edit1:setWidth(152);
    obj.edit1:setHeight(27);
    obj.edit1:setReadOnly(true);
    obj.edit1:setText("Super Velocidade");
    obj.edit1:setName("edit1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.InfPoderes1);
    obj.textEditor1:setLeft(306);
    obj.textEditor1:setTop(193);
    obj.textEditor1:setWidth(202);
    obj.textEditor1:setHeight(87);
    obj.textEditor1:setReadOnly(true);
    obj.textEditor1:setText("Iniciante: Corre com uma velocidade impressionante\n\nIntermediário: Corre com uma velocidade impressionante e consegue se movimentar no meio de sua velocidade\n\nAvançado: Corre/movimenta/ diria que é quase como parar o tempo");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.InfPoderes1);
    obj.textEditor2:setLeft(520);
    obj.textEditor2:setTop(149);
    obj.textEditor2:setWidth(169);
    obj.textEditor2:setHeight(246);
    obj.textEditor2:setField("Anotações1");
    obj.textEditor2:setName("textEditor2");

    obj.NivelPoder1 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder1:setParent(obj.InfPoderes1);
    obj.NivelPoder1:setName("NivelPoder1");
    obj.NivelPoder1:setText("1");
    obj.NivelPoder1:setLeft(320);
    obj.NivelPoder1:setTop(324);
    obj.NivelPoder1:setWidth(20);
    obj.NivelPoder1:setHeight(20);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.NivelPoder1);
    obj.checkBox1:setField("NivelPoder1");
    obj.checkBox1:setAlign("top");
    obj.checkBox1:setMargins({top=-15});
    obj.checkBox1:setName("checkBox1");

    obj.NivelPoder2 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder2:setParent(obj.InfPoderes1);
    obj.NivelPoder2:setName("NivelPoder2");
    obj.NivelPoder2:setText("2");
    obj.NivelPoder2:setLeft(340);
    obj.NivelPoder2:setTop(324);
    obj.NivelPoder2:setWidth(20);
    obj.NivelPoder2:setHeight(20);

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.NivelPoder2);
    obj.checkBox2:setField("NivelPoder2");
    obj.checkBox2:setAlign("top");
    obj.checkBox2:setMargins({top=-15});
    obj.checkBox2:setName("checkBox2");

    obj.NivelPoder3 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder3:setParent(obj.InfPoderes1);
    obj.NivelPoder3:setName("NivelPoder3");
    obj.NivelPoder3:setText("3");
    obj.NivelPoder3:setLeft(360);
    obj.NivelPoder3:setTop(324);
    obj.NivelPoder3:setWidth(20);
    obj.NivelPoder3:setHeight(20);

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.NivelPoder3);
    obj.checkBox3:setField("NivelPoder3");
    obj.checkBox3:setAlign("top");
    obj.checkBox3:setMargins({top=-15});
    obj.checkBox3:setName("checkBox3");

    obj.NivelPoder4 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder4:setParent(obj.InfPoderes1);
    obj.NivelPoder4:setName("NivelPoder4");
    obj.NivelPoder4:setText("4");
    obj.NivelPoder4:setLeft(320);
    obj.NivelPoder4:setTop(359);
    obj.NivelPoder4:setWidth(20);
    obj.NivelPoder4:setHeight(20);

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.NivelPoder4);
    obj.checkBox4:setField("NivelPoder4");
    obj.checkBox4:setAlign("top");
    obj.checkBox4:setMargins({top=-15});
    obj.checkBox4:setName("checkBox4");

    obj.NivelPoder5 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder5:setParent(obj.InfPoderes1);
    obj.NivelPoder5:setName("NivelPoder5");
    obj.NivelPoder5:setText("5");
    obj.NivelPoder5:setLeft(340);
    obj.NivelPoder5:setTop(359);
    obj.NivelPoder5:setWidth(20);
    obj.NivelPoder5:setHeight(20);

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.NivelPoder5);
    obj.checkBox5:setField("NivelPoder5");
    obj.checkBox5:setAlign("top");
    obj.checkBox5:setMargins({top=-15});
    obj.checkBox5:setName("checkBox5");

    obj.NivelPoder6 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder6:setParent(obj.InfPoderes1);
    obj.NivelPoder6:setName("NivelPoder6");
    obj.NivelPoder6:setText("6");
    obj.NivelPoder6:setLeft(360);
    obj.NivelPoder6:setTop(359);
    obj.NivelPoder6:setWidth(20);
    obj.NivelPoder6:setHeight(20);

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.NivelPoder6);
    obj.checkBox6:setField("NivelPoder6");
    obj.checkBox6:setAlign("top");
    obj.checkBox6:setMargins({top=-15});
    obj.checkBox6:setName("checkBox6");

    obj.InfPoderes2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes2:setParent(obj.scrollBox1);
    obj.InfPoderes2:setName("InfPoderes2");
    obj.InfPoderes2:setAlign("client");
    obj.InfPoderes2:setVisible(false);

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.InfPoderes2);
    obj.button32:setText("VOLTAR");
    lfm_setPropAsString(obj.button32, "fontStyle",  "bold");
    obj.button32:setFontColor("#6495ED");
    obj.button32:setLeft(300);
    obj.button32:setTop(88);
    obj.button32:setWidth(70);
    obj.button32:setHeight(30);
    obj.button32:setName("button32");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.InfPoderes2);
    obj.image20:setSRC("/imagens/CirculoNave.png");
    obj.image20:setLeft(293);
    obj.image20:setTop(120);
    obj.image20:setWidth(408);
    obj.image20:setHeight(285);
    obj.image20:setName("image20");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.InfPoderes2);
    obj.image21:setSRC("/imagens/NomedoseuPoder.png");
    obj.image21:setLeft(293);
    obj.image21:setTop(116);
    obj.image21:setWidth(218);
    obj.image21:setHeight(43);
    obj.image21:setName("image21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.InfPoderes2);
    obj.image22:setSRC("/imagens/detalhesdoPoder.png");
    obj.image22:setLeft(293);
    obj.image22:setTop(165);
    obj.image22:setWidth(218);
    obj.image22:setHeight(43);
    obj.image22:setName("image22");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.InfPoderes2);
    obj.image23:setSRC("/imagens/niveisDoPoder.png");
    obj.image23:setLeft(235);
    obj.image23:setTop(270);
    obj.image23:setWidth(218);
    obj.image23:setHeight(43);
    obj.image23:setName("image23");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.InfPoderes2);
    obj.image24:setSRC("/imagens/Anotações.png");
    obj.image24:setLeft(500);
    obj.image24:setTop(117);
    obj.image24:setWidth(218);
    obj.image24:setHeight(43);
    obj.image24:setName("image24");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.InfPoderes2);
    obj.edit2:setLeft(306);
    obj.edit2:setTop(149);
    obj.edit2:setWidth(152);
    obj.edit2:setHeight(27);
    obj.edit2:setReadOnly(true);
    obj.edit2:setText("VOAR");
    obj.edit2:setName("edit2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.InfPoderes2);
    obj.textEditor3:setLeft(306);
    obj.textEditor3:setTop(193);
    obj.textEditor3:setWidth(202);
    obj.textEditor3:setHeight(87);
    obj.textEditor3:setReadOnly(true);
    obj.textEditor3:setText("Iniciante: Apenas flutua\n\nIntermediário: Cai com estilo\n\nAvançado: Voa de verdade");
    obj.textEditor3:setName("textEditor3");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.InfPoderes2);
    obj.textEditor4:setLeft(520);
    obj.textEditor4:setTop(149);
    obj.textEditor4:setWidth(169);
    obj.textEditor4:setHeight(246);
    obj.textEditor4:setField("Anotações2");
    obj.textEditor4:setName("textEditor4");

    obj.NivelPoder7 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder7:setParent(obj.InfPoderes2);
    obj.NivelPoder7:setName("NivelPoder7");
    obj.NivelPoder7:setText("1");
    obj.NivelPoder7:setLeft(320);
    obj.NivelPoder7:setTop(324);
    obj.NivelPoder7:setWidth(20);
    obj.NivelPoder7:setHeight(20);

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.NivelPoder7);
    obj.checkBox7:setField("NivelPoder7");
    obj.checkBox7:setAlign("top");
    obj.checkBox7:setMargins({top=-15});
    obj.checkBox7:setName("checkBox7");

    obj.NivelPoder8 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder8:setParent(obj.InfPoderes2);
    obj.NivelPoder8:setName("NivelPoder8");
    obj.NivelPoder8:setText("2");
    obj.NivelPoder8:setLeft(340);
    obj.NivelPoder8:setTop(324);
    obj.NivelPoder8:setWidth(20);
    obj.NivelPoder8:setHeight(20);

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.NivelPoder8);
    obj.checkBox8:setField("NivelPoder8");
    obj.checkBox8:setAlign("top");
    obj.checkBox8:setMargins({top=-15});
    obj.checkBox8:setName("checkBox8");

    obj.NivelPoder9 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder9:setParent(obj.InfPoderes2);
    obj.NivelPoder9:setName("NivelPoder9");
    obj.NivelPoder9:setText("3");
    obj.NivelPoder9:setLeft(360);
    obj.NivelPoder9:setTop(324);
    obj.NivelPoder9:setWidth(20);
    obj.NivelPoder9:setHeight(20);

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.NivelPoder9);
    obj.checkBox9:setField("NivelPoder9");
    obj.checkBox9:setAlign("top");
    obj.checkBox9:setMargins({top=-15});
    obj.checkBox9:setName("checkBox9");

    obj.NivelPoder10 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder10:setParent(obj.InfPoderes2);
    obj.NivelPoder10:setName("NivelPoder10");
    obj.NivelPoder10:setText("4");
    obj.NivelPoder10:setLeft(320);
    obj.NivelPoder10:setTop(359);
    obj.NivelPoder10:setWidth(20);
    obj.NivelPoder10:setHeight(20);

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.NivelPoder10);
    obj.checkBox10:setField("NivelPoder10");
    obj.checkBox10:setAlign("top");
    obj.checkBox10:setMargins({top=-15});
    obj.checkBox10:setName("checkBox10");

    obj.NivelPoder11 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder11:setParent(obj.InfPoderes2);
    obj.NivelPoder11:setName("NivelPoder11");
    obj.NivelPoder11:setText("5");
    obj.NivelPoder11:setLeft(340);
    obj.NivelPoder11:setTop(359);
    obj.NivelPoder11:setWidth(20);
    obj.NivelPoder11:setHeight(20);

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.NivelPoder11);
    obj.checkBox11:setField("NivelPoder11");
    obj.checkBox11:setAlign("top");
    obj.checkBox11:setMargins({top=-15});
    obj.checkBox11:setName("checkBox11");

    obj.NivelPoder12 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder12:setParent(obj.InfPoderes2);
    obj.NivelPoder12:setName("NivelPoder12");
    obj.NivelPoder12:setText("6");
    obj.NivelPoder12:setLeft(360);
    obj.NivelPoder12:setTop(359);
    obj.NivelPoder12:setWidth(20);
    obj.NivelPoder12:setHeight(20);

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.NivelPoder12);
    obj.checkBox12:setField("NivelPoder12");
    obj.checkBox12:setAlign("top");
    obj.checkBox12:setMargins({top=-15});
    obj.checkBox12:setName("checkBox12");

    obj.InfPoderes3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes3:setParent(obj.scrollBox1);
    obj.InfPoderes3:setName("InfPoderes3");
    obj.InfPoderes3:setAlign("client");
    obj.InfPoderes3:setVisible(false);

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.InfPoderes3);
    obj.button33:setText("VOLTAR");
    lfm_setPropAsString(obj.button33, "fontStyle",  "bold");
    obj.button33:setFontColor("#6495ED");
    obj.button33:setLeft(300);
    obj.button33:setTop(88);
    obj.button33:setWidth(70);
    obj.button33:setHeight(30);
    obj.button33:setName("button33");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.InfPoderes3);
    obj.image25:setSRC("/imagens/CirculoNave.png");
    obj.image25:setLeft(293);
    obj.image25:setTop(120);
    obj.image25:setWidth(408);
    obj.image25:setHeight(285);
    obj.image25:setName("image25");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.InfPoderes3);
    obj.image26:setSRC("/imagens/NomedoseuPoder.png");
    obj.image26:setLeft(293);
    obj.image26:setTop(116);
    obj.image26:setWidth(218);
    obj.image26:setHeight(43);
    obj.image26:setName("image26");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.InfPoderes3);
    obj.image27:setSRC("/imagens/detalhesdoPoder.png");
    obj.image27:setLeft(293);
    obj.image27:setTop(165);
    obj.image27:setWidth(218);
    obj.image27:setHeight(43);
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.InfPoderes3);
    obj.image28:setSRC("/imagens/niveisDoPoder.png");
    obj.image28:setLeft(235);
    obj.image28:setTop(270);
    obj.image28:setWidth(218);
    obj.image28:setHeight(43);
    obj.image28:setName("image28");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.InfPoderes3);
    obj.image29:setSRC("/imagens/Anotações.png");
    obj.image29:setLeft(500);
    obj.image29:setTop(117);
    obj.image29:setWidth(218);
    obj.image29:setHeight(43);
    obj.image29:setName("image29");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.InfPoderes3);
    obj.edit3:setLeft(306);
    obj.edit3:setTop(149);
    obj.edit3:setWidth(152);
    obj.edit3:setHeight(27);
    obj.edit3:setReadOnly(true);
    obj.edit3:setText("Super força");
    obj.edit3:setName("edit3");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.InfPoderes3);
    obj.textEditor5:setLeft(306);
    obj.textEditor5:setTop(193);
    obj.textEditor5:setWidth(202);
    obj.textEditor5:setHeight(87);
    obj.textEditor5:setReadOnly(true);
    obj.textEditor5:setText("Iniciante: Pode até arrancar todos os dentes de homem\n\nIntermediário: Pode levantar coisas pequenas e pesadas com apenas uma mão\n\nAvançado: Pode alevantar um carro e joga-lo");
    obj.textEditor5:setName("textEditor5");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.InfPoderes3);
    obj.textEditor6:setLeft(520);
    obj.textEditor6:setTop(149);
    obj.textEditor6:setWidth(169);
    obj.textEditor6:setHeight(246);
    obj.textEditor6:setField("Anotações3");
    obj.textEditor6:setName("textEditor6");

    obj.NivelPoder13 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder13:setParent(obj.InfPoderes3);
    obj.NivelPoder13:setName("NivelPoder13");
    obj.NivelPoder13:setText("1");
    obj.NivelPoder13:setLeft(320);
    obj.NivelPoder13:setTop(324);
    obj.NivelPoder13:setWidth(20);
    obj.NivelPoder13:setHeight(20);

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.NivelPoder13);
    obj.checkBox13:setField("NivelPoder13");
    obj.checkBox13:setAlign("top");
    obj.checkBox13:setMargins({top=-15});
    obj.checkBox13:setName("checkBox13");

    obj.NivelPoder14 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder14:setParent(obj.InfPoderes3);
    obj.NivelPoder14:setName("NivelPoder14");
    obj.NivelPoder14:setText("2");
    obj.NivelPoder14:setLeft(340);
    obj.NivelPoder14:setTop(324);
    obj.NivelPoder14:setWidth(20);
    obj.NivelPoder14:setHeight(20);

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.NivelPoder14);
    obj.checkBox14:setField("NivelPoder14");
    obj.checkBox14:setAlign("top");
    obj.checkBox14:setMargins({top=-15});
    obj.checkBox14:setName("checkBox14");

    obj.NivelPoder15 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder15:setParent(obj.InfPoderes3);
    obj.NivelPoder15:setName("NivelPoder15");
    obj.NivelPoder15:setText("3");
    obj.NivelPoder15:setLeft(360);
    obj.NivelPoder15:setTop(324);
    obj.NivelPoder15:setWidth(20);
    obj.NivelPoder15:setHeight(20);

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.NivelPoder15);
    obj.checkBox15:setField("NivelPoder15");
    obj.checkBox15:setAlign("top");
    obj.checkBox15:setMargins({top=-15});
    obj.checkBox15:setName("checkBox15");

    obj.NivelPoder16 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder16:setParent(obj.InfPoderes3);
    obj.NivelPoder16:setName("NivelPoder16");
    obj.NivelPoder16:setText("4");
    obj.NivelPoder16:setLeft(320);
    obj.NivelPoder16:setTop(359);
    obj.NivelPoder16:setWidth(20);
    obj.NivelPoder16:setHeight(20);

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.NivelPoder16);
    obj.checkBox16:setField("NivelPoder16");
    obj.checkBox16:setAlign("top");
    obj.checkBox16:setMargins({top=-15});
    obj.checkBox16:setName("checkBox16");

    obj.NivelPoder17 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder17:setParent(obj.InfPoderes3);
    obj.NivelPoder17:setName("NivelPoder17");
    obj.NivelPoder17:setText("5");
    obj.NivelPoder17:setLeft(340);
    obj.NivelPoder17:setTop(359);
    obj.NivelPoder17:setWidth(20);
    obj.NivelPoder17:setHeight(20);

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.NivelPoder17);
    obj.checkBox17:setField("NivelPoder17");
    obj.checkBox17:setAlign("top");
    obj.checkBox17:setMargins({top=-15});
    obj.checkBox17:setName("checkBox17");

    obj.NivelPoder18 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder18:setParent(obj.InfPoderes3);
    obj.NivelPoder18:setName("NivelPoder18");
    obj.NivelPoder18:setText("6");
    obj.NivelPoder18:setLeft(360);
    obj.NivelPoder18:setTop(359);
    obj.NivelPoder18:setWidth(20);
    obj.NivelPoder18:setHeight(20);

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.NivelPoder18);
    obj.checkBox18:setField("NivelPoder18");
    obj.checkBox18:setAlign("top");
    obj.checkBox18:setMargins({top=-15});
    obj.checkBox18:setName("checkBox18");

    obj.InfPoderes4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes4:setParent(obj.scrollBox1);
    obj.InfPoderes4:setName("InfPoderes4");
    obj.InfPoderes4:setAlign("client");
    obj.InfPoderes4:setVisible(false);

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.InfPoderes4);
    obj.button34:setText("VOLTAR");
    lfm_setPropAsString(obj.button34, "fontStyle",  "bold");
    obj.button34:setFontColor("#6495ED");
    obj.button34:setLeft(300);
    obj.button34:setTop(88);
    obj.button34:setWidth(70);
    obj.button34:setHeight(30);
    obj.button34:setName("button34");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.InfPoderes4);
    obj.image30:setSRC("/imagens/CirculoNave.png");
    obj.image30:setLeft(293);
    obj.image30:setTop(120);
    obj.image30:setWidth(408);
    obj.image30:setHeight(285);
    obj.image30:setName("image30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.InfPoderes4);
    obj.image31:setSRC("/imagens/NomedoseuPoder.png");
    obj.image31:setLeft(293);
    obj.image31:setTop(116);
    obj.image31:setWidth(218);
    obj.image31:setHeight(43);
    obj.image31:setName("image31");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.InfPoderes4);
    obj.image32:setSRC("/imagens/detalhesdoPoder.png");
    obj.image32:setLeft(293);
    obj.image32:setTop(165);
    obj.image32:setWidth(218);
    obj.image32:setHeight(43);
    obj.image32:setName("image32");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.InfPoderes4);
    obj.image33:setSRC("/imagens/niveisDoPoder.png");
    obj.image33:setLeft(235);
    obj.image33:setTop(270);
    obj.image33:setWidth(218);
    obj.image33:setHeight(43);
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.InfPoderes4);
    obj.image34:setSRC("/imagens/Anotações.png");
    obj.image34:setLeft(500);
    obj.image34:setTop(117);
    obj.image34:setWidth(218);
    obj.image34:setHeight(43);
    obj.image34:setName("image34");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.InfPoderes4);
    obj.edit4:setLeft(306);
    obj.edit4:setTop(149);
    obj.edit4:setWidth(152);
    obj.edit4:setHeight(27);
    obj.edit4:setReadOnly(true);
    obj.edit4:setText("Telecinético");
    obj.edit4:setName("edit4");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.InfPoderes4);
    obj.textEditor7:setLeft(306);
    obj.textEditor7:setTop(193);
    obj.textEditor7:setWidth(202);
    obj.textEditor7:setHeight(87);
    obj.textEditor7:setReadOnly(true);
    obj.textEditor7:setText("Iniciante: Levanta itens de pequeno porte\n\nIntermediário: Levanta itens de tamanho médio\n\nAvançado: Levanta itens pesados e grandes");
    obj.textEditor7:setName("textEditor7");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.InfPoderes4);
    obj.textEditor8:setLeft(520);
    obj.textEditor8:setTop(149);
    obj.textEditor8:setWidth(169);
    obj.textEditor8:setHeight(246);
    obj.textEditor8:setField("Anotações4");
    obj.textEditor8:setName("textEditor8");

    obj.NivelPoder19 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder19:setParent(obj.InfPoderes4);
    obj.NivelPoder19:setName("NivelPoder19");
    obj.NivelPoder19:setText("1");
    obj.NivelPoder19:setLeft(320);
    obj.NivelPoder19:setTop(324);
    obj.NivelPoder19:setWidth(20);
    obj.NivelPoder19:setHeight(20);

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.NivelPoder19);
    obj.checkBox19:setField("NivelPoder19");
    obj.checkBox19:setAlign("top");
    obj.checkBox19:setMargins({top=-15});
    obj.checkBox19:setName("checkBox19");

    obj.NivelPoder20 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder20:setParent(obj.InfPoderes4);
    obj.NivelPoder20:setName("NivelPoder20");
    obj.NivelPoder20:setText("2");
    obj.NivelPoder20:setLeft(340);
    obj.NivelPoder20:setTop(324);
    obj.NivelPoder20:setWidth(20);
    obj.NivelPoder20:setHeight(20);

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.NivelPoder20);
    obj.checkBox20:setField("NivelPoder20");
    obj.checkBox20:setAlign("top");
    obj.checkBox20:setMargins({top=-15});
    obj.checkBox20:setName("checkBox20");

    obj.NivelPoder21 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder21:setParent(obj.InfPoderes4);
    obj.NivelPoder21:setName("NivelPoder21");
    obj.NivelPoder21:setText("3");
    obj.NivelPoder21:setLeft(360);
    obj.NivelPoder21:setTop(324);
    obj.NivelPoder21:setWidth(20);
    obj.NivelPoder21:setHeight(20);

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.NivelPoder21);
    obj.checkBox21:setField("NivelPoder21");
    obj.checkBox21:setAlign("top");
    obj.checkBox21:setMargins({top=-15});
    obj.checkBox21:setName("checkBox21");

    obj.NivelPoder22 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder22:setParent(obj.InfPoderes4);
    obj.NivelPoder22:setName("NivelPoder22");
    obj.NivelPoder22:setText("4");
    obj.NivelPoder22:setLeft(320);
    obj.NivelPoder22:setTop(359);
    obj.NivelPoder22:setWidth(20);
    obj.NivelPoder22:setHeight(20);

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.NivelPoder22);
    obj.checkBox22:setField("NivelPoder22");
    obj.checkBox22:setAlign("top");
    obj.checkBox22:setMargins({top=-15});
    obj.checkBox22:setName("checkBox22");

    obj.NivelPoder23 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder23:setParent(obj.InfPoderes4);
    obj.NivelPoder23:setName("NivelPoder23");
    obj.NivelPoder23:setText("5");
    obj.NivelPoder23:setLeft(340);
    obj.NivelPoder23:setTop(359);
    obj.NivelPoder23:setWidth(20);
    obj.NivelPoder23:setHeight(20);

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.NivelPoder23);
    obj.checkBox23:setField("NivelPoder23");
    obj.checkBox23:setAlign("top");
    obj.checkBox23:setMargins({top=-15});
    obj.checkBox23:setName("checkBox23");

    obj.NivelPoder24 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder24:setParent(obj.InfPoderes4);
    obj.NivelPoder24:setName("NivelPoder24");
    obj.NivelPoder24:setText("6");
    obj.NivelPoder24:setLeft(360);
    obj.NivelPoder24:setTop(359);
    obj.NivelPoder24:setWidth(20);
    obj.NivelPoder24:setHeight(20);

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.NivelPoder24);
    obj.checkBox24:setField("NivelPoder24");
    obj.checkBox24:setAlign("top");
    obj.checkBox24:setMargins({top=-15});
    obj.checkBox24:setName("checkBox24");

    obj.InfPoderes5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes5:setParent(obj.scrollBox1);
    obj.InfPoderes5:setName("InfPoderes5");
    obj.InfPoderes5:setAlign("client");
    obj.InfPoderes5:setVisible(false);

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.InfPoderes5);
    obj.button35:setText("VOLTAR");
    lfm_setPropAsString(obj.button35, "fontStyle",  "bold");
    obj.button35:setFontColor("#6495ED");
    obj.button35:setLeft(300);
    obj.button35:setTop(88);
    obj.button35:setWidth(70);
    obj.button35:setHeight(30);
    obj.button35:setName("button35");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.InfPoderes5);
    obj.image35:setSRC("/imagens/CirculoNave.png");
    obj.image35:setLeft(293);
    obj.image35:setTop(120);
    obj.image35:setWidth(408);
    obj.image35:setHeight(285);
    obj.image35:setName("image35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.InfPoderes5);
    obj.image36:setSRC("/imagens/NomedoseuPoder.png");
    obj.image36:setLeft(293);
    obj.image36:setTop(116);
    obj.image36:setWidth(218);
    obj.image36:setHeight(43);
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.InfPoderes5);
    obj.image37:setSRC("/imagens/detalhesdoPoder.png");
    obj.image37:setLeft(293);
    obj.image37:setTop(165);
    obj.image37:setWidth(218);
    obj.image37:setHeight(43);
    obj.image37:setName("image37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.InfPoderes5);
    obj.image38:setSRC("/imagens/niveisDoPoder.png");
    obj.image38:setLeft(235);
    obj.image38:setTop(270);
    obj.image38:setWidth(218);
    obj.image38:setHeight(43);
    obj.image38:setName("image38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.InfPoderes5);
    obj.image39:setSRC("/imagens/Anotações.png");
    obj.image39:setLeft(500);
    obj.image39:setTop(117);
    obj.image39:setWidth(218);
    obj.image39:setHeight(43);
    obj.image39:setName("image39");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.InfPoderes5);
    obj.edit5:setLeft(306);
    obj.edit5:setTop(149);
    obj.edit5:setWidth(152);
    obj.edit5:setHeight(27);
    obj.edit5:setReadOnly(true);
    obj.edit5:setText("Parar Tempo");
    obj.edit5:setName("edit5");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.InfPoderes5);
    obj.textEditor9:setLeft(306);
    obj.textEditor9:setTop(193);
    obj.textEditor9:setWidth(202);
    obj.textEditor9:setHeight(87);
    obj.textEditor9:setReadOnly(true);
    obj.textEditor9:setText("Iniciante: Talvez você consiga tirar uma meleca do nariz sem ninguém ver.\n\nIntermediário: Deixa tudo em câmera lenta por um tempo\n\nAvançado: Consegue PARAR o tempo totalmente");
    obj.textEditor9:setName("textEditor9");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.InfPoderes5);
    obj.textEditor10:setLeft(520);
    obj.textEditor10:setTop(149);
    obj.textEditor10:setWidth(169);
    obj.textEditor10:setHeight(246);
    obj.textEditor10:setField("Anotações5");
    obj.textEditor10:setName("textEditor10");

    obj.NivelPoder25 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder25:setParent(obj.InfPoderes5);
    obj.NivelPoder25:setName("NivelPoder25");
    obj.NivelPoder25:setText("1");
    obj.NivelPoder25:setLeft(320);
    obj.NivelPoder25:setTop(324);
    obj.NivelPoder25:setWidth(20);
    obj.NivelPoder25:setHeight(20);

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.NivelPoder25);
    obj.checkBox25:setField("NivelPoder25");
    obj.checkBox25:setAlign("top");
    obj.checkBox25:setMargins({top=-15});
    obj.checkBox25:setName("checkBox25");

    obj.NivelPoder26 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder26:setParent(obj.InfPoderes5);
    obj.NivelPoder26:setName("NivelPoder26");
    obj.NivelPoder26:setText("2");
    obj.NivelPoder26:setLeft(340);
    obj.NivelPoder26:setTop(324);
    obj.NivelPoder26:setWidth(20);
    obj.NivelPoder26:setHeight(20);

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.NivelPoder26);
    obj.checkBox26:setField("NivelPoder26");
    obj.checkBox26:setAlign("top");
    obj.checkBox26:setMargins({top=-15});
    obj.checkBox26:setName("checkBox26");

    obj.NivelPoder27 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder27:setParent(obj.InfPoderes5);
    obj.NivelPoder27:setName("NivelPoder27");
    obj.NivelPoder27:setText("3");
    obj.NivelPoder27:setLeft(360);
    obj.NivelPoder27:setTop(324);
    obj.NivelPoder27:setWidth(20);
    obj.NivelPoder27:setHeight(20);

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.NivelPoder27);
    obj.checkBox27:setField("NivelPoder27");
    obj.checkBox27:setAlign("top");
    obj.checkBox27:setMargins({top=-15});
    obj.checkBox27:setName("checkBox27");

    obj.NivelPoder28 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder28:setParent(obj.InfPoderes5);
    obj.NivelPoder28:setName("NivelPoder28");
    obj.NivelPoder28:setText("4");
    obj.NivelPoder28:setLeft(320);
    obj.NivelPoder28:setTop(359);
    obj.NivelPoder28:setWidth(20);
    obj.NivelPoder28:setHeight(20);

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.NivelPoder28);
    obj.checkBox28:setField("NivelPoder28");
    obj.checkBox28:setAlign("top");
    obj.checkBox28:setMargins({top=-15});
    obj.checkBox28:setName("checkBox28");

    obj.NivelPoder29 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder29:setParent(obj.InfPoderes5);
    obj.NivelPoder29:setName("NivelPoder29");
    obj.NivelPoder29:setText("5");
    obj.NivelPoder29:setLeft(340);
    obj.NivelPoder29:setTop(359);
    obj.NivelPoder29:setWidth(20);
    obj.NivelPoder29:setHeight(20);

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.NivelPoder29);
    obj.checkBox29:setField("NivelPoder29");
    obj.checkBox29:setAlign("top");
    obj.checkBox29:setMargins({top=-15});
    obj.checkBox29:setName("checkBox29");

    obj.NivelPoder30 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder30:setParent(obj.InfPoderes5);
    obj.NivelPoder30:setName("NivelPoder30");
    obj.NivelPoder30:setText("6");
    obj.NivelPoder30:setLeft(360);
    obj.NivelPoder30:setTop(359);
    obj.NivelPoder30:setWidth(20);
    obj.NivelPoder30:setHeight(20);

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.NivelPoder30);
    obj.checkBox30:setField("NivelPoder30");
    obj.checkBox30:setAlign("top");
    obj.checkBox30:setMargins({top=-15});
    obj.checkBox30:setName("checkBox30");

    obj.InfPoderes6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes6:setParent(obj.scrollBox1);
    obj.InfPoderes6:setName("InfPoderes6");
    obj.InfPoderes6:setAlign("client");
    obj.InfPoderes6:setVisible(false);

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.InfPoderes6);
    obj.button36:setText("VOLTAR");
    lfm_setPropAsString(obj.button36, "fontStyle",  "bold");
    obj.button36:setFontColor("#6495ED");
    obj.button36:setLeft(300);
    obj.button36:setTop(88);
    obj.button36:setWidth(70);
    obj.button36:setHeight(30);
    obj.button36:setName("button36");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.InfPoderes6);
    obj.image40:setSRC("/imagens/CirculoNave.png");
    obj.image40:setLeft(293);
    obj.image40:setTop(120);
    obj.image40:setWidth(408);
    obj.image40:setHeight(285);
    obj.image40:setName("image40");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.InfPoderes6);
    obj.image41:setSRC("/imagens/NomedoseuPoder.png");
    obj.image41:setLeft(293);
    obj.image41:setTop(116);
    obj.image41:setWidth(218);
    obj.image41:setHeight(43);
    obj.image41:setName("image41");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.InfPoderes6);
    obj.image42:setSRC("/imagens/detalhesdoPoder.png");
    obj.image42:setLeft(293);
    obj.image42:setTop(165);
    obj.image42:setWidth(218);
    obj.image42:setHeight(43);
    obj.image42:setName("image42");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.InfPoderes6);
    obj.image43:setSRC("/imagens/niveisDoPoder.png");
    obj.image43:setLeft(235);
    obj.image43:setTop(270);
    obj.image43:setWidth(218);
    obj.image43:setHeight(43);
    obj.image43:setName("image43");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.InfPoderes6);
    obj.image44:setSRC("/imagens/Anotações.png");
    obj.image44:setLeft(500);
    obj.image44:setTop(117);
    obj.image44:setWidth(218);
    obj.image44:setHeight(43);
    obj.image44:setName("image44");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.InfPoderes6);
    obj.edit6:setLeft(306);
    obj.edit6:setTop(149);
    obj.edit6:setWidth(152);
    obj.edit6:setHeight(27);
    obj.edit6:setReadOnly(true);
    obj.edit6:setText("Ler Mentes");
    obj.edit6:setName("edit6");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.InfPoderes6);
    obj.textEditor11:setLeft(306);
    obj.textEditor11:setTop(193);
    obj.textEditor11:setWidth(202);
    obj.textEditor11:setHeight(87);
    obj.textEditor11:setReadOnly(true);
    obj.textEditor11:setText("Iniciante: Com uma grande concentração e apenas olhando em seus olhos, poderá saber oque ela está pensando em uma recente memoria\n\nIntermediário: Comunicação apenas olhando nos olhos e bem focado, não precisa olhar nos olhos para saber oque a pessoa está pensando.\n\nAvançado: Poderá acessar algumas memorias (Poderá também haver uma comunicação mental sem precisar de olhar nos olhos)");
    obj.textEditor11:setName("textEditor11");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.InfPoderes6);
    obj.textEditor12:setLeft(520);
    obj.textEditor12:setTop(149);
    obj.textEditor12:setWidth(169);
    obj.textEditor12:setHeight(246);
    obj.textEditor12:setField("Anotações6");
    obj.textEditor12:setName("textEditor12");

    obj.NivelPoder31 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder31:setParent(obj.InfPoderes6);
    obj.NivelPoder31:setName("NivelPoder31");
    obj.NivelPoder31:setText("1");
    obj.NivelPoder31:setLeft(320);
    obj.NivelPoder31:setTop(324);
    obj.NivelPoder31:setWidth(20);
    obj.NivelPoder31:setHeight(20);

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.NivelPoder31);
    obj.checkBox31:setField("NivelPoder31");
    obj.checkBox31:setAlign("top");
    obj.checkBox31:setMargins({top=-15});
    obj.checkBox31:setName("checkBox31");

    obj.NivelPoder32 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder32:setParent(obj.InfPoderes6);
    obj.NivelPoder32:setName("NivelPoder32");
    obj.NivelPoder32:setText("2");
    obj.NivelPoder32:setLeft(340);
    obj.NivelPoder32:setTop(324);
    obj.NivelPoder32:setWidth(20);
    obj.NivelPoder32:setHeight(20);

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.NivelPoder32);
    obj.checkBox32:setField("NivelPoder32");
    obj.checkBox32:setAlign("top");
    obj.checkBox32:setMargins({top=-15});
    obj.checkBox32:setName("checkBox32");

    obj.NivelPoder33 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder33:setParent(obj.InfPoderes6);
    obj.NivelPoder33:setName("NivelPoder33");
    obj.NivelPoder33:setText("3");
    obj.NivelPoder33:setLeft(360);
    obj.NivelPoder33:setTop(324);
    obj.NivelPoder33:setWidth(20);
    obj.NivelPoder33:setHeight(20);

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.NivelPoder33);
    obj.checkBox33:setField("NivelPoder33");
    obj.checkBox33:setAlign("top");
    obj.checkBox33:setMargins({top=-15});
    obj.checkBox33:setName("checkBox33");

    obj.NivelPoder34 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder34:setParent(obj.InfPoderes6);
    obj.NivelPoder34:setName("NivelPoder34");
    obj.NivelPoder34:setText("4");
    obj.NivelPoder34:setLeft(320);
    obj.NivelPoder34:setTop(359);
    obj.NivelPoder34:setWidth(20);
    obj.NivelPoder34:setHeight(20);

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.NivelPoder34);
    obj.checkBox34:setField("NivelPoder34");
    obj.checkBox34:setAlign("top");
    obj.checkBox34:setMargins({top=-15});
    obj.checkBox34:setName("checkBox34");

    obj.NivelPoder35 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder35:setParent(obj.InfPoderes6);
    obj.NivelPoder35:setName("NivelPoder35");
    obj.NivelPoder35:setText("5");
    obj.NivelPoder35:setLeft(340);
    obj.NivelPoder35:setTop(359);
    obj.NivelPoder35:setWidth(20);
    obj.NivelPoder35:setHeight(20);

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.NivelPoder35);
    obj.checkBox35:setField("NivelPoder35");
    obj.checkBox35:setAlign("top");
    obj.checkBox35:setMargins({top=-15});
    obj.checkBox35:setName("checkBox35");

    obj.NivelPoder36 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder36:setParent(obj.InfPoderes6);
    obj.NivelPoder36:setName("NivelPoder36");
    obj.NivelPoder36:setText("6");
    obj.NivelPoder36:setLeft(360);
    obj.NivelPoder36:setTop(359);
    obj.NivelPoder36:setWidth(20);
    obj.NivelPoder36:setHeight(20);

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.NivelPoder36);
    obj.checkBox36:setField("NivelPoder36");
    obj.checkBox36:setAlign("top");
    obj.checkBox36:setMargins({top=-15});
    obj.checkBox36:setName("checkBox36");

    obj.InfPoderes7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes7:setParent(obj.scrollBox1);
    obj.InfPoderes7:setName("InfPoderes7");
    obj.InfPoderes7:setAlign("client");
    obj.InfPoderes7:setVisible(false);

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.InfPoderes7);
    obj.button37:setText("VOLTAR");
    lfm_setPropAsString(obj.button37, "fontStyle",  "bold");
    obj.button37:setFontColor("#6495ED");
    obj.button37:setLeft(300);
    obj.button37:setTop(88);
    obj.button37:setWidth(70);
    obj.button37:setHeight(30);
    obj.button37:setName("button37");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.InfPoderes7);
    obj.image45:setSRC("/imagens/CirculoNave.png");
    obj.image45:setLeft(293);
    obj.image45:setTop(120);
    obj.image45:setWidth(408);
    obj.image45:setHeight(285);
    obj.image45:setName("image45");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.InfPoderes7);
    obj.image46:setSRC("/imagens/NomedoseuPoder.png");
    obj.image46:setLeft(293);
    obj.image46:setTop(116);
    obj.image46:setWidth(218);
    obj.image46:setHeight(43);
    obj.image46:setName("image46");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.InfPoderes7);
    obj.image47:setSRC("/imagens/detalhesdoPoder.png");
    obj.image47:setLeft(293);
    obj.image47:setTop(165);
    obj.image47:setWidth(218);
    obj.image47:setHeight(43);
    obj.image47:setName("image47");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.InfPoderes7);
    obj.image48:setSRC("/imagens/niveisDoPoder.png");
    obj.image48:setLeft(235);
    obj.image48:setTop(270);
    obj.image48:setWidth(218);
    obj.image48:setHeight(43);
    obj.image48:setName("image48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.InfPoderes7);
    obj.image49:setSRC("/imagens/Anotações.png");
    obj.image49:setLeft(500);
    obj.image49:setTop(117);
    obj.image49:setWidth(218);
    obj.image49:setHeight(43);
    obj.image49:setName("image49");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.InfPoderes7);
    obj.edit7:setLeft(306);
    obj.edit7:setTop(149);
    obj.edit7:setWidth(152);
    obj.edit7:setHeight(27);
    obj.edit7:setReadOnly(true);
    obj.edit7:setText("Invisibilidade");
    obj.edit7:setName("edit7");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.InfPoderes7);
    obj.textEditor13:setLeft(306);
    obj.textEditor13:setTop(193);
    obj.textEditor13:setWidth(202);
    obj.textEditor13:setHeight(87);
    obj.textEditor13:setReadOnly(true);
    obj.textEditor13:setText("Iniciante: Pode ficar até 3 minutos invisível (Com MUITA concentração pode deixar as coisas invisíveis com seu toque)\n\nIntermediário: Consegue segurar até 10 minutos (Com POUCA concentração pode deixar as coisas invisíveis com seu toque)\n\nAvançado: Pode morrer invisível (Sem concentração pode deixar a lua invisível)");
    obj.textEditor13:setName("textEditor13");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.InfPoderes7);
    obj.textEditor14:setLeft(520);
    obj.textEditor14:setTop(149);
    obj.textEditor14:setWidth(169);
    obj.textEditor14:setHeight(246);
    obj.textEditor14:setField("Anotações7");
    obj.textEditor14:setName("textEditor14");

    obj.NivelPoder37 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder37:setParent(obj.InfPoderes7);
    obj.NivelPoder37:setName("NivelPoder37");
    obj.NivelPoder37:setText("1");
    obj.NivelPoder37:setLeft(320);
    obj.NivelPoder37:setTop(324);
    obj.NivelPoder37:setWidth(20);
    obj.NivelPoder37:setHeight(20);

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.NivelPoder37);
    obj.checkBox37:setField("NivelPoder37");
    obj.checkBox37:setAlign("top");
    obj.checkBox37:setMargins({top=-15});
    obj.checkBox37:setName("checkBox37");

    obj.NivelPoder38 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder38:setParent(obj.InfPoderes7);
    obj.NivelPoder38:setName("NivelPoder38");
    obj.NivelPoder38:setText("2");
    obj.NivelPoder38:setLeft(340);
    obj.NivelPoder38:setTop(324);
    obj.NivelPoder38:setWidth(20);
    obj.NivelPoder38:setHeight(20);

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.NivelPoder38);
    obj.checkBox38:setField("NivelPoder38");
    obj.checkBox38:setAlign("top");
    obj.checkBox38:setMargins({top=-15});
    obj.checkBox38:setName("checkBox38");

    obj.NivelPoder39 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder39:setParent(obj.InfPoderes7);
    obj.NivelPoder39:setName("NivelPoder39");
    obj.NivelPoder39:setText("3");
    obj.NivelPoder39:setLeft(360);
    obj.NivelPoder39:setTop(324);
    obj.NivelPoder39:setWidth(20);
    obj.NivelPoder39:setHeight(20);

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.NivelPoder39);
    obj.checkBox39:setField("NivelPoder39");
    obj.checkBox39:setAlign("top");
    obj.checkBox39:setMargins({top=-15});
    obj.checkBox39:setName("checkBox39");

    obj.NivelPoder40 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder40:setParent(obj.InfPoderes7);
    obj.NivelPoder40:setName("NivelPoder40");
    obj.NivelPoder40:setText("4");
    obj.NivelPoder40:setLeft(320);
    obj.NivelPoder40:setTop(359);
    obj.NivelPoder40:setWidth(20);
    obj.NivelPoder40:setHeight(20);

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.NivelPoder40);
    obj.checkBox40:setField("NivelPoder40");
    obj.checkBox40:setAlign("top");
    obj.checkBox40:setMargins({top=-15});
    obj.checkBox40:setName("checkBox40");

    obj.NivelPoder41 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder41:setParent(obj.InfPoderes7);
    obj.NivelPoder41:setName("NivelPoder41");
    obj.NivelPoder41:setText("5");
    obj.NivelPoder41:setLeft(340);
    obj.NivelPoder41:setTop(359);
    obj.NivelPoder41:setWidth(20);
    obj.NivelPoder41:setHeight(20);

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.NivelPoder41);
    obj.checkBox41:setField("NivelPoder41");
    obj.checkBox41:setAlign("top");
    obj.checkBox41:setMargins({top=-15});
    obj.checkBox41:setName("checkBox41");

    obj.NivelPoder42 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder42:setParent(obj.InfPoderes7);
    obj.NivelPoder42:setName("NivelPoder42");
    obj.NivelPoder42:setText("6");
    obj.NivelPoder42:setLeft(360);
    obj.NivelPoder42:setTop(359);
    obj.NivelPoder42:setWidth(20);
    obj.NivelPoder42:setHeight(20);

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.NivelPoder42);
    obj.checkBox42:setField("NivelPoder42");
    obj.checkBox42:setAlign("top");
    obj.checkBox42:setMargins({top=-15});
    obj.checkBox42:setName("checkBox42");

    obj.InfPoderes8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes8:setParent(obj.scrollBox1);
    obj.InfPoderes8:setName("InfPoderes8");
    obj.InfPoderes8:setAlign("client");
    obj.InfPoderes8:setVisible(false);

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.InfPoderes8);
    obj.button38:setText("VOLTAR");
    lfm_setPropAsString(obj.button38, "fontStyle",  "bold");
    obj.button38:setFontColor("#6495ED");
    obj.button38:setLeft(300);
    obj.button38:setTop(88);
    obj.button38:setWidth(70);
    obj.button38:setHeight(30);
    obj.button38:setName("button38");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.InfPoderes8);
    obj.image50:setSRC("/imagens/CirculoNave.png");
    obj.image50:setLeft(293);
    obj.image50:setTop(120);
    obj.image50:setWidth(408);
    obj.image50:setHeight(285);
    obj.image50:setName("image50");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.InfPoderes8);
    obj.image51:setSRC("/imagens/NomedoseuPoder.png");
    obj.image51:setLeft(293);
    obj.image51:setTop(116);
    obj.image51:setWidth(218);
    obj.image51:setHeight(43);
    obj.image51:setName("image51");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.InfPoderes8);
    obj.image52:setSRC("/imagens/detalhesdoPoder.png");
    obj.image52:setLeft(293);
    obj.image52:setTop(165);
    obj.image52:setWidth(218);
    obj.image52:setHeight(43);
    obj.image52:setName("image52");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.InfPoderes8);
    obj.image53:setSRC("/imagens/niveisDoPoder.png");
    obj.image53:setLeft(235);
    obj.image53:setTop(270);
    obj.image53:setWidth(218);
    obj.image53:setHeight(43);
    obj.image53:setName("image53");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.InfPoderes8);
    obj.image54:setSRC("/imagens/Anotações.png");
    obj.image54:setLeft(500);
    obj.image54:setTop(117);
    obj.image54:setWidth(218);
    obj.image54:setHeight(43);
    obj.image54:setName("image54");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.InfPoderes8);
    obj.edit8:setLeft(306);
    obj.edit8:setTop(149);
    obj.edit8:setWidth(152);
    obj.edit8:setHeight(27);
    obj.edit8:setReadOnly(true);
    obj.edit8:setText("Teleporte");
    obj.edit8:setName("edit8");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.InfPoderes8);
    obj.textEditor15:setLeft(306);
    obj.textEditor15:setTop(193);
    obj.textEditor15:setWidth(202);
    obj.textEditor15:setHeight(87);
    obj.textEditor15:setReadOnly(true);
    obj.textEditor15:setText("Iniciante: Pode apenas para lugares que ele pode ver, em uma pequena distancia \n\nIntermediário: Pode apenas para lugares que ele pode ver, em uma grande distancia e teleporta amigos\n\nAvançado: Pode teleporta para aonde quiser");
    obj.textEditor15:setName("textEditor15");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.InfPoderes8);
    obj.textEditor16:setLeft(520);
    obj.textEditor16:setTop(149);
    obj.textEditor16:setWidth(169);
    obj.textEditor16:setHeight(246);
    obj.textEditor16:setField("Anotações8");
    obj.textEditor16:setName("textEditor16");

    obj.NivelPoder43 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder43:setParent(obj.InfPoderes8);
    obj.NivelPoder43:setName("NivelPoder43");
    obj.NivelPoder43:setText("1");
    obj.NivelPoder43:setLeft(320);
    obj.NivelPoder43:setTop(324);
    obj.NivelPoder43:setWidth(20);
    obj.NivelPoder43:setHeight(20);

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.NivelPoder43);
    obj.checkBox43:setField("NivelPoder43");
    obj.checkBox43:setAlign("top");
    obj.checkBox43:setMargins({top=-15});
    obj.checkBox43:setName("checkBox43");

    obj.NivelPoder44 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder44:setParent(obj.InfPoderes8);
    obj.NivelPoder44:setName("NivelPoder44");
    obj.NivelPoder44:setText("2");
    obj.NivelPoder44:setLeft(340);
    obj.NivelPoder44:setTop(324);
    obj.NivelPoder44:setWidth(20);
    obj.NivelPoder44:setHeight(20);

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.NivelPoder44);
    obj.checkBox44:setField("NivelPoder44");
    obj.checkBox44:setAlign("top");
    obj.checkBox44:setMargins({top=-15});
    obj.checkBox44:setName("checkBox44");

    obj.NivelPoder45 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder45:setParent(obj.InfPoderes8);
    obj.NivelPoder45:setName("NivelPoder45");
    obj.NivelPoder45:setText("3");
    obj.NivelPoder45:setLeft(360);
    obj.NivelPoder45:setTop(324);
    obj.NivelPoder45:setWidth(20);
    obj.NivelPoder45:setHeight(20);

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.NivelPoder45);
    obj.checkBox45:setField("NivelPoder45");
    obj.checkBox45:setAlign("top");
    obj.checkBox45:setMargins({top=-15});
    obj.checkBox45:setName("checkBox45");

    obj.NivelPoder46 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder46:setParent(obj.InfPoderes8);
    obj.NivelPoder46:setName("NivelPoder46");
    obj.NivelPoder46:setText("4");
    obj.NivelPoder46:setLeft(320);
    obj.NivelPoder46:setTop(359);
    obj.NivelPoder46:setWidth(20);
    obj.NivelPoder46:setHeight(20);

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.NivelPoder46);
    obj.checkBox46:setField("NivelPoder46");
    obj.checkBox46:setAlign("top");
    obj.checkBox46:setMargins({top=-15});
    obj.checkBox46:setName("checkBox46");

    obj.NivelPoder47 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder47:setParent(obj.InfPoderes8);
    obj.NivelPoder47:setName("NivelPoder47");
    obj.NivelPoder47:setText("5");
    obj.NivelPoder47:setLeft(340);
    obj.NivelPoder47:setTop(359);
    obj.NivelPoder47:setWidth(20);
    obj.NivelPoder47:setHeight(20);

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.NivelPoder47);
    obj.checkBox47:setField("NivelPoder47");
    obj.checkBox47:setAlign("top");
    obj.checkBox47:setMargins({top=-15});
    obj.checkBox47:setName("checkBox47");

    obj.NivelPoder48 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder48:setParent(obj.InfPoderes8);
    obj.NivelPoder48:setName("NivelPoder48");
    obj.NivelPoder48:setText("6");
    obj.NivelPoder48:setLeft(360);
    obj.NivelPoder48:setTop(359);
    obj.NivelPoder48:setWidth(20);
    obj.NivelPoder48:setHeight(20);

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.NivelPoder48);
    obj.checkBox48:setField("NivelPoder48");
    obj.checkBox48:setAlign("top");
    obj.checkBox48:setMargins({top=-15});
    obj.checkBox48:setName("checkBox48");

    obj.InfPoderes9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes9:setParent(obj.scrollBox1);
    obj.InfPoderes9:setName("InfPoderes9");
    obj.InfPoderes9:setAlign("client");
    obj.InfPoderes9:setVisible(false);

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.InfPoderes9);
    obj.button39:setText("VOLTAR");
    lfm_setPropAsString(obj.button39, "fontStyle",  "bold");
    obj.button39:setFontColor("#6495ED");
    obj.button39:setLeft(300);
    obj.button39:setTop(88);
    obj.button39:setWidth(70);
    obj.button39:setHeight(30);
    obj.button39:setName("button39");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.InfPoderes9);
    obj.image55:setSRC("/imagens/CirculoNave.png");
    obj.image55:setLeft(293);
    obj.image55:setTop(120);
    obj.image55:setWidth(408);
    obj.image55:setHeight(285);
    obj.image55:setName("image55");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.InfPoderes9);
    obj.image56:setSRC("/imagens/NomedoseuPoder.png");
    obj.image56:setLeft(293);
    obj.image56:setTop(116);
    obj.image56:setWidth(218);
    obj.image56:setHeight(43);
    obj.image56:setName("image56");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.InfPoderes9);
    obj.image57:setSRC("/imagens/detalhesdoPoder.png");
    obj.image57:setLeft(293);
    obj.image57:setTop(165);
    obj.image57:setWidth(218);
    obj.image57:setHeight(43);
    obj.image57:setName("image57");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.InfPoderes9);
    obj.image58:setSRC("/imagens/niveisDoPoder.png");
    obj.image58:setLeft(235);
    obj.image58:setTop(270);
    obj.image58:setWidth(218);
    obj.image58:setHeight(43);
    obj.image58:setName("image58");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.InfPoderes9);
    obj.image59:setSRC("/imagens/Anotações.png");
    obj.image59:setLeft(500);
    obj.image59:setTop(117);
    obj.image59:setWidth(218);
    obj.image59:setHeight(43);
    obj.image59:setName("image59");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.InfPoderes9);
    obj.edit9:setLeft(306);
    obj.edit9:setTop(149);
    obj.edit9:setWidth(152);
    obj.edit9:setHeight(27);
    obj.edit9:setReadOnly(true);
    obj.edit9:setText("Voltar no tempo");
    obj.edit9:setName("edit9");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.InfPoderes9);
    obj.textEditor17:setLeft(306);
    obj.textEditor17:setTop(193);
    obj.textEditor17:setWidth(202);
    obj.textEditor17:setHeight(87);
    obj.textEditor17:setReadOnly(true);
    obj.textEditor17:setText("Iniciante: Você pode voltar até 6 horas antes\n\nIntermediário: Você pode voltar até 12 horas antes\n\nAvançado: Você pode voltar até 24 horas antes");
    obj.textEditor17:setName("textEditor17");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.InfPoderes9);
    obj.textEditor18:setLeft(520);
    obj.textEditor18:setTop(149);
    obj.textEditor18:setWidth(169);
    obj.textEditor18:setHeight(246);
    obj.textEditor18:setField("Anotações9");
    obj.textEditor18:setName("textEditor18");

    obj.NivelPoder49 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder49:setParent(obj.InfPoderes9);
    obj.NivelPoder49:setName("NivelPoder49");
    obj.NivelPoder49:setText("1");
    obj.NivelPoder49:setLeft(320);
    obj.NivelPoder49:setTop(324);
    obj.NivelPoder49:setWidth(20);
    obj.NivelPoder49:setHeight(20);

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.NivelPoder49);
    obj.checkBox49:setField("NivelPoder49");
    obj.checkBox49:setAlign("top");
    obj.checkBox49:setMargins({top=-15});
    obj.checkBox49:setName("checkBox49");

    obj.NivelPoder50 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder50:setParent(obj.InfPoderes9);
    obj.NivelPoder50:setName("NivelPoder50");
    obj.NivelPoder50:setText("2");
    obj.NivelPoder50:setLeft(340);
    obj.NivelPoder50:setTop(324);
    obj.NivelPoder50:setWidth(20);
    obj.NivelPoder50:setHeight(20);

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.NivelPoder50);
    obj.checkBox50:setField("NivelPoder50");
    obj.checkBox50:setAlign("top");
    obj.checkBox50:setMargins({top=-15});
    obj.checkBox50:setName("checkBox50");

    obj.NivelPoder51 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder51:setParent(obj.InfPoderes9);
    obj.NivelPoder51:setName("NivelPoder51");
    obj.NivelPoder51:setText("3");
    obj.NivelPoder51:setLeft(360);
    obj.NivelPoder51:setTop(324);
    obj.NivelPoder51:setWidth(20);
    obj.NivelPoder51:setHeight(20);

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.NivelPoder51);
    obj.checkBox51:setField("NivelPoder51");
    obj.checkBox51:setAlign("top");
    obj.checkBox51:setMargins({top=-15});
    obj.checkBox51:setName("checkBox51");

    obj.NivelPoder52 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder52:setParent(obj.InfPoderes9);
    obj.NivelPoder52:setName("NivelPoder52");
    obj.NivelPoder52:setText("4");
    obj.NivelPoder52:setLeft(320);
    obj.NivelPoder52:setTop(359);
    obj.NivelPoder52:setWidth(20);
    obj.NivelPoder52:setHeight(20);

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.NivelPoder52);
    obj.checkBox52:setField("NivelPoder52");
    obj.checkBox52:setAlign("top");
    obj.checkBox52:setMargins({top=-15});
    obj.checkBox52:setName("checkBox52");

    obj.NivelPoder53 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder53:setParent(obj.InfPoderes9);
    obj.NivelPoder53:setName("NivelPoder53");
    obj.NivelPoder53:setText("5");
    obj.NivelPoder53:setLeft(340);
    obj.NivelPoder53:setTop(359);
    obj.NivelPoder53:setWidth(20);
    obj.NivelPoder53:setHeight(20);

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.NivelPoder53);
    obj.checkBox53:setField("NivelPoder53");
    obj.checkBox53:setAlign("top");
    obj.checkBox53:setMargins({top=-15});
    obj.checkBox53:setName("checkBox53");

    obj.NivelPoder54 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder54:setParent(obj.InfPoderes9);
    obj.NivelPoder54:setName("NivelPoder54");
    obj.NivelPoder54:setText("6");
    obj.NivelPoder54:setLeft(360);
    obj.NivelPoder54:setTop(359);
    obj.NivelPoder54:setWidth(20);
    obj.NivelPoder54:setHeight(20);

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.NivelPoder54);
    obj.checkBox54:setField("NivelPoder54");
    obj.checkBox54:setAlign("top");
    obj.checkBox54:setMargins({top=-15});
    obj.checkBox54:setName("checkBox54");

    obj.InfPoderes10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes10:setParent(obj.scrollBox1);
    obj.InfPoderes10:setName("InfPoderes10");
    obj.InfPoderes10:setAlign("client");
    obj.InfPoderes10:setVisible(false);

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.InfPoderes10);
    obj.button40:setText("VOLTAR");
    lfm_setPropAsString(obj.button40, "fontStyle",  "bold");
    obj.button40:setFontColor("#6495ED");
    obj.button40:setLeft(300);
    obj.button40:setTop(88);
    obj.button40:setWidth(70);
    obj.button40:setHeight(30);
    obj.button40:setName("button40");

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.InfPoderes10);
    obj.image60:setSRC("/imagens/CirculoNave.png");
    obj.image60:setLeft(293);
    obj.image60:setTop(120);
    obj.image60:setWidth(408);
    obj.image60:setHeight(285);
    obj.image60:setName("image60");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.InfPoderes10);
    obj.image61:setSRC("/imagens/NomedoseuPoder.png");
    obj.image61:setLeft(293);
    obj.image61:setTop(116);
    obj.image61:setWidth(218);
    obj.image61:setHeight(43);
    obj.image61:setName("image61");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.InfPoderes10);
    obj.image62:setSRC("/imagens/detalhesdoPoder.png");
    obj.image62:setLeft(293);
    obj.image62:setTop(165);
    obj.image62:setWidth(218);
    obj.image62:setHeight(43);
    obj.image62:setName("image62");

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.InfPoderes10);
    obj.image63:setSRC("/imagens/niveisDoPoder.png");
    obj.image63:setLeft(235);
    obj.image63:setTop(270);
    obj.image63:setWidth(218);
    obj.image63:setHeight(43);
    obj.image63:setName("image63");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.InfPoderes10);
    obj.image64:setSRC("/imagens/Anotações.png");
    obj.image64:setLeft(500);
    obj.image64:setTop(117);
    obj.image64:setWidth(218);
    obj.image64:setHeight(43);
    obj.image64:setName("image64");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.InfPoderes10);
    obj.edit10:setLeft(306);
    obj.edit10:setTop(149);
    obj.edit10:setWidth(152);
    obj.edit10:setHeight(27);
    obj.edit10:setReadOnly(true);
    obj.edit10:setText("Controle de mente");
    obj.edit10:setName("edit10");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.InfPoderes10);
    obj.textEditor19:setLeft(306);
    obj.textEditor19:setTop(193);
    obj.textEditor19:setWidth(202);
    obj.textEditor19:setHeight(87);
    obj.textEditor19:setReadOnly(true);
    obj.textEditor19:setText("Iniciante: Pode controlar humanos, fazendo com que ele faça coisas que não desejam (D4 ação de controle) (Apenas olhando em seus olhos) Limitação: Não pode controlar pessoas com um grande poder psicológico.\n\nIntermediário: Pode controlar humanos (Qualquer outro tipo de raça, exceto IMPLA e APLA), fazendo com que ele faça coisas que não desejam (D6 ação de controle) (Apenas olhando em seus olhos) Limitação: Algumas pessoas com poderes psicológicos fortes não podem ser controladas.\n\nAvançado: Pode controlar humanos ou qualquer outro tipo de raça, e implas e aplas, fazendo com que ele faça coisas que não desejam (D20 ação de controle) (Apenas olhando em seus olhos) Limitação: Algumas pessoas com poderes psicológicos fortes não podem ser controladas.");
    obj.textEditor19:setName("textEditor19");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.InfPoderes10);
    obj.textEditor20:setLeft(520);
    obj.textEditor20:setTop(149);
    obj.textEditor20:setWidth(169);
    obj.textEditor20:setHeight(246);
    obj.textEditor20:setField("Anotações10");
    obj.textEditor20:setName("textEditor20");

    obj.NivelPoder55 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder55:setParent(obj.InfPoderes10);
    obj.NivelPoder55:setName("NivelPoder55");
    obj.NivelPoder55:setText("1");
    obj.NivelPoder55:setLeft(320);
    obj.NivelPoder55:setTop(324);
    obj.NivelPoder55:setWidth(20);
    obj.NivelPoder55:setHeight(20);

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.NivelPoder55);
    obj.checkBox55:setField("NivelPoder55");
    obj.checkBox55:setAlign("top");
    obj.checkBox55:setMargins({top=-15});
    obj.checkBox55:setName("checkBox55");

    obj.NivelPoder56 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder56:setParent(obj.InfPoderes10);
    obj.NivelPoder56:setName("NivelPoder56");
    obj.NivelPoder56:setText("2");
    obj.NivelPoder56:setLeft(340);
    obj.NivelPoder56:setTop(324);
    obj.NivelPoder56:setWidth(20);
    obj.NivelPoder56:setHeight(20);

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.NivelPoder56);
    obj.checkBox56:setField("NivelPoder56");
    obj.checkBox56:setAlign("top");
    obj.checkBox56:setMargins({top=-15});
    obj.checkBox56:setName("checkBox56");

    obj.NivelPoder57 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder57:setParent(obj.InfPoderes10);
    obj.NivelPoder57:setName("NivelPoder57");
    obj.NivelPoder57:setText("3");
    obj.NivelPoder57:setLeft(360);
    obj.NivelPoder57:setTop(324);
    obj.NivelPoder57:setWidth(20);
    obj.NivelPoder57:setHeight(20);

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.NivelPoder57);
    obj.checkBox57:setField("NivelPoder57");
    obj.checkBox57:setAlign("top");
    obj.checkBox57:setMargins({top=-15});
    obj.checkBox57:setName("checkBox57");

    obj.NivelPoder58 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder58:setParent(obj.InfPoderes10);
    obj.NivelPoder58:setName("NivelPoder58");
    obj.NivelPoder58:setText("4");
    obj.NivelPoder58:setLeft(320);
    obj.NivelPoder58:setTop(359);
    obj.NivelPoder58:setWidth(20);
    obj.NivelPoder58:setHeight(20);

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.NivelPoder58);
    obj.checkBox58:setField("NivelPoder58");
    obj.checkBox58:setAlign("top");
    obj.checkBox58:setMargins({top=-15});
    obj.checkBox58:setName("checkBox58");

    obj.NivelPoder59 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder59:setParent(obj.InfPoderes10);
    obj.NivelPoder59:setName("NivelPoder59");
    obj.NivelPoder59:setText("5");
    obj.NivelPoder59:setLeft(340);
    obj.NivelPoder59:setTop(359);
    obj.NivelPoder59:setWidth(20);
    obj.NivelPoder59:setHeight(20);

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.NivelPoder59);
    obj.checkBox59:setField("NivelPoder59");
    obj.checkBox59:setAlign("top");
    obj.checkBox59:setMargins({top=-15});
    obj.checkBox59:setName("checkBox59");

    obj.NivelPoder60 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder60:setParent(obj.InfPoderes10);
    obj.NivelPoder60:setName("NivelPoder60");
    obj.NivelPoder60:setText("6");
    obj.NivelPoder60:setLeft(360);
    obj.NivelPoder60:setTop(359);
    obj.NivelPoder60:setWidth(20);
    obj.NivelPoder60:setHeight(20);

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.NivelPoder60);
    obj.checkBox60:setField("NivelPoder60");
    obj.checkBox60:setAlign("top");
    obj.checkBox60:setMargins({top=-15});
    obj.checkBox60:setName("checkBox60");

    obj.InfPoderes11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes11:setParent(obj.scrollBox1);
    obj.InfPoderes11:setName("InfPoderes11");
    obj.InfPoderes11:setAlign("client");
    obj.InfPoderes11:setVisible(false);

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.InfPoderes11);
    obj.button41:setText("VOLTAR");
    lfm_setPropAsString(obj.button41, "fontStyle",  "bold");
    obj.button41:setFontColor("#6495ED");
    obj.button41:setLeft(300);
    obj.button41:setTop(88);
    obj.button41:setWidth(70);
    obj.button41:setHeight(30);
    obj.button41:setName("button41");

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.InfPoderes11);
    obj.image65:setSRC("/imagens/CirculoNave.png");
    obj.image65:setLeft(293);
    obj.image65:setTop(120);
    obj.image65:setWidth(408);
    obj.image65:setHeight(285);
    obj.image65:setName("image65");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.InfPoderes11);
    obj.image66:setSRC("/imagens/NomedoseuPoder.png");
    obj.image66:setLeft(293);
    obj.image66:setTop(116);
    obj.image66:setWidth(218);
    obj.image66:setHeight(43);
    obj.image66:setName("image66");

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.InfPoderes11);
    obj.image67:setSRC("/imagens/detalhesdoPoder.png");
    obj.image67:setLeft(293);
    obj.image67:setTop(165);
    obj.image67:setWidth(218);
    obj.image67:setHeight(43);
    obj.image67:setName("image67");

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.InfPoderes11);
    obj.image68:setSRC("/imagens/niveisDoPoder.png");
    obj.image68:setLeft(235);
    obj.image68:setTop(270);
    obj.image68:setWidth(218);
    obj.image68:setHeight(43);
    obj.image68:setName("image68");

    obj.image69 = GUI.fromHandle(_obj_newObject("image"));
    obj.image69:setParent(obj.InfPoderes11);
    obj.image69:setSRC("/imagens/Anotações.png");
    obj.image69:setLeft(500);
    obj.image69:setTop(117);
    obj.image69:setWidth(218);
    obj.image69:setHeight(43);
    obj.image69:setName("image69");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.InfPoderes11);
    obj.edit11:setLeft(306);
    obj.edit11:setTop(149);
    obj.edit11:setWidth(152);
    obj.edit11:setHeight(27);
    obj.edit11:setReadOnly(true);
    obj.edit11:setText("Metamorfo");
    obj.edit11:setName("edit11");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.InfPoderes11);
    obj.textEditor21:setLeft(306);
    obj.textEditor21:setTop(193);
    obj.textEditor21:setWidth(202);
    obj.textEditor21:setHeight(87);
    obj.textEditor21:setReadOnly(true);
    obj.textEditor21:setText("Iniciante: Apenas se você conhece a pessoa profundamente a ponto de ter ligações com ela\n\nIntermediário: Vendo a pessoa até uma certa distancia\n\nAvançado: Uma lembrança já basta");
    obj.textEditor21:setName("textEditor21");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.InfPoderes11);
    obj.textEditor22:setLeft(520);
    obj.textEditor22:setTop(149);
    obj.textEditor22:setWidth(169);
    obj.textEditor22:setHeight(246);
    obj.textEditor22:setField("Anotações11");
    obj.textEditor22:setName("textEditor22");

    obj.NivelPoder61 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder61:setParent(obj.InfPoderes11);
    obj.NivelPoder61:setName("NivelPoder61");
    obj.NivelPoder61:setText("1");
    obj.NivelPoder61:setLeft(320);
    obj.NivelPoder61:setTop(324);
    obj.NivelPoder61:setWidth(20);
    obj.NivelPoder61:setHeight(20);

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.NivelPoder61);
    obj.checkBox61:setField("NivelPoder61");
    obj.checkBox61:setAlign("top");
    obj.checkBox61:setMargins({top=-15});
    obj.checkBox61:setName("checkBox61");

    obj.NivelPoder62 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder62:setParent(obj.InfPoderes11);
    obj.NivelPoder62:setName("NivelPoder62");
    obj.NivelPoder62:setText("2");
    obj.NivelPoder62:setLeft(340);
    obj.NivelPoder62:setTop(324);
    obj.NivelPoder62:setWidth(20);
    obj.NivelPoder62:setHeight(20);

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.NivelPoder62);
    obj.checkBox62:setField("NivelPoder62");
    obj.checkBox62:setAlign("top");
    obj.checkBox62:setMargins({top=-15});
    obj.checkBox62:setName("checkBox62");

    obj.NivelPoder63 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder63:setParent(obj.InfPoderes11);
    obj.NivelPoder63:setName("NivelPoder63");
    obj.NivelPoder63:setText("3");
    obj.NivelPoder63:setLeft(360);
    obj.NivelPoder63:setTop(324);
    obj.NivelPoder63:setWidth(20);
    obj.NivelPoder63:setHeight(20);

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.NivelPoder63);
    obj.checkBox63:setField("NivelPoder63");
    obj.checkBox63:setAlign("top");
    obj.checkBox63:setMargins({top=-15});
    obj.checkBox63:setName("checkBox63");

    obj.NivelPoder64 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder64:setParent(obj.InfPoderes11);
    obj.NivelPoder64:setName("NivelPoder64");
    obj.NivelPoder64:setText("4");
    obj.NivelPoder64:setLeft(320);
    obj.NivelPoder64:setTop(359);
    obj.NivelPoder64:setWidth(20);
    obj.NivelPoder64:setHeight(20);

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.NivelPoder64);
    obj.checkBox64:setField("NivelPoder64");
    obj.checkBox64:setAlign("top");
    obj.checkBox64:setMargins({top=-15});
    obj.checkBox64:setName("checkBox64");

    obj.NivelPoder65 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder65:setParent(obj.InfPoderes11);
    obj.NivelPoder65:setName("NivelPoder65");
    obj.NivelPoder65:setText("5");
    obj.NivelPoder65:setLeft(340);
    obj.NivelPoder65:setTop(359);
    obj.NivelPoder65:setWidth(20);
    obj.NivelPoder65:setHeight(20);

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.NivelPoder65);
    obj.checkBox65:setField("NivelPoder65");
    obj.checkBox65:setAlign("top");
    obj.checkBox65:setMargins({top=-15});
    obj.checkBox65:setName("checkBox65");

    obj.NivelPoder66 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder66:setParent(obj.InfPoderes11);
    obj.NivelPoder66:setName("NivelPoder66");
    obj.NivelPoder66:setText("6");
    obj.NivelPoder66:setLeft(360);
    obj.NivelPoder66:setTop(359);
    obj.NivelPoder66:setWidth(20);
    obj.NivelPoder66:setHeight(20);

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.NivelPoder66);
    obj.checkBox66:setField("NivelPoder66");
    obj.checkBox66:setAlign("top");
    obj.checkBox66:setMargins({top=-15});
    obj.checkBox66:setName("checkBox66");

    obj.InfPoderes12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes12:setParent(obj.scrollBox1);
    obj.InfPoderes12:setName("InfPoderes12");
    obj.InfPoderes12:setAlign("client");
    obj.InfPoderes12:setVisible(false);

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.InfPoderes12);
    obj.button42:setText("VOLTAR");
    lfm_setPropAsString(obj.button42, "fontStyle",  "bold");
    obj.button42:setFontColor("#6495ED");
    obj.button42:setLeft(300);
    obj.button42:setTop(88);
    obj.button42:setWidth(70);
    obj.button42:setHeight(30);
    obj.button42:setName("button42");

    obj.image70 = GUI.fromHandle(_obj_newObject("image"));
    obj.image70:setParent(obj.InfPoderes12);
    obj.image70:setSRC("/imagens/CirculoNave.png");
    obj.image70:setLeft(293);
    obj.image70:setTop(120);
    obj.image70:setWidth(408);
    obj.image70:setHeight(285);
    obj.image70:setName("image70");

    obj.image71 = GUI.fromHandle(_obj_newObject("image"));
    obj.image71:setParent(obj.InfPoderes12);
    obj.image71:setSRC("/imagens/NomedoseuPoder.png");
    obj.image71:setLeft(293);
    obj.image71:setTop(116);
    obj.image71:setWidth(218);
    obj.image71:setHeight(43);
    obj.image71:setName("image71");

    obj.image72 = GUI.fromHandle(_obj_newObject("image"));
    obj.image72:setParent(obj.InfPoderes12);
    obj.image72:setSRC("/imagens/detalhesdoPoder.png");
    obj.image72:setLeft(293);
    obj.image72:setTop(165);
    obj.image72:setWidth(218);
    obj.image72:setHeight(43);
    obj.image72:setName("image72");

    obj.image73 = GUI.fromHandle(_obj_newObject("image"));
    obj.image73:setParent(obj.InfPoderes12);
    obj.image73:setSRC("/imagens/niveisDoPoder.png");
    obj.image73:setLeft(235);
    obj.image73:setTop(270);
    obj.image73:setWidth(218);
    obj.image73:setHeight(43);
    obj.image73:setName("image73");

    obj.image74 = GUI.fromHandle(_obj_newObject("image"));
    obj.image74:setParent(obj.InfPoderes12);
    obj.image74:setSRC("/imagens/Anotações.png");
    obj.image74:setLeft(500);
    obj.image74:setTop(117);
    obj.image74:setWidth(218);
    obj.image74:setHeight(43);
    obj.image74:setName("image74");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.InfPoderes12);
    obj.edit12:setLeft(306);
    obj.edit12:setTop(149);
    obj.edit12:setWidth(152);
    obj.edit12:setHeight(27);
    obj.edit12:setReadOnly(true);
    obj.edit12:setText("Ilusão");
    obj.edit12:setName("edit12");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.InfPoderes12);
    obj.textEditor23:setLeft(306);
    obj.textEditor23:setTop(193);
    obj.textEditor23:setWidth(202);
    obj.textEditor23:setHeight(87);
    obj.textEditor23:setReadOnly(true);
    obj.textEditor23:setText("Iniciante: Ilusão de objetos pequenos\n\nIntermediário: Ilusão de objetos grandes e intermediário\n\nAvançado: Ilusão de tudo em sua volta");
    obj.textEditor23:setName("textEditor23");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.InfPoderes12);
    obj.textEditor24:setLeft(520);
    obj.textEditor24:setTop(149);
    obj.textEditor24:setWidth(169);
    obj.textEditor24:setHeight(246);
    obj.textEditor24:setField("Anotações12");
    obj.textEditor24:setName("textEditor24");

    obj.NivelPoder67 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder67:setParent(obj.InfPoderes12);
    obj.NivelPoder67:setName("NivelPoder67");
    obj.NivelPoder67:setText("1");
    obj.NivelPoder67:setLeft(320);
    obj.NivelPoder67:setTop(324);
    obj.NivelPoder67:setWidth(20);
    obj.NivelPoder67:setHeight(20);

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.NivelPoder67);
    obj.checkBox67:setField("NivelPoder67");
    obj.checkBox67:setAlign("top");
    obj.checkBox67:setMargins({top=-15});
    obj.checkBox67:setName("checkBox67");

    obj.NivelPoder68 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder68:setParent(obj.InfPoderes12);
    obj.NivelPoder68:setName("NivelPoder68");
    obj.NivelPoder68:setText("2");
    obj.NivelPoder68:setLeft(340);
    obj.NivelPoder68:setTop(324);
    obj.NivelPoder68:setWidth(20);
    obj.NivelPoder68:setHeight(20);

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.NivelPoder68);
    obj.checkBox68:setField("NivelPoder68");
    obj.checkBox68:setAlign("top");
    obj.checkBox68:setMargins({top=-15});
    obj.checkBox68:setName("checkBox68");

    obj.NivelPoder69 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder69:setParent(obj.InfPoderes12);
    obj.NivelPoder69:setName("NivelPoder69");
    obj.NivelPoder69:setText("3");
    obj.NivelPoder69:setLeft(360);
    obj.NivelPoder69:setTop(324);
    obj.NivelPoder69:setWidth(20);
    obj.NivelPoder69:setHeight(20);

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.NivelPoder69);
    obj.checkBox69:setField("NivelPoder69");
    obj.checkBox69:setAlign("top");
    obj.checkBox69:setMargins({top=-15});
    obj.checkBox69:setName("checkBox69");

    obj.NivelPoder70 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder70:setParent(obj.InfPoderes12);
    obj.NivelPoder70:setName("NivelPoder70");
    obj.NivelPoder70:setText("4");
    obj.NivelPoder70:setLeft(320);
    obj.NivelPoder70:setTop(359);
    obj.NivelPoder70:setWidth(20);
    obj.NivelPoder70:setHeight(20);

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.NivelPoder70);
    obj.checkBox70:setField("NivelPoder70");
    obj.checkBox70:setAlign("top");
    obj.checkBox70:setMargins({top=-15});
    obj.checkBox70:setName("checkBox70");

    obj.NivelPoder71 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder71:setParent(obj.InfPoderes12);
    obj.NivelPoder71:setName("NivelPoder71");
    obj.NivelPoder71:setText("5");
    obj.NivelPoder71:setLeft(340);
    obj.NivelPoder71:setTop(359);
    obj.NivelPoder71:setWidth(20);
    obj.NivelPoder71:setHeight(20);

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.NivelPoder71);
    obj.checkBox71:setField("NivelPoder71");
    obj.checkBox71:setAlign("top");
    obj.checkBox71:setMargins({top=-15});
    obj.checkBox71:setName("checkBox71");

    obj.NivelPoder72 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder72:setParent(obj.InfPoderes12);
    obj.NivelPoder72:setName("NivelPoder72");
    obj.NivelPoder72:setText("6");
    obj.NivelPoder72:setLeft(360);
    obj.NivelPoder72:setTop(359);
    obj.NivelPoder72:setWidth(20);
    obj.NivelPoder72:setHeight(20);

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.NivelPoder72);
    obj.checkBox72:setField("NivelPoder72");
    obj.checkBox72:setAlign("top");
    obj.checkBox72:setMargins({top=-15});
    obj.checkBox72:setName("checkBox72");

    obj.InfPoderes13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes13:setParent(obj.scrollBox1);
    obj.InfPoderes13:setName("InfPoderes13");
    obj.InfPoderes13:setAlign("client");
    obj.InfPoderes13:setVisible(false);

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.InfPoderes13);
    obj.button43:setText("VOLTAR");
    lfm_setPropAsString(obj.button43, "fontStyle",  "bold");
    obj.button43:setFontColor("#6495ED");
    obj.button43:setLeft(300);
    obj.button43:setTop(88);
    obj.button43:setWidth(70);
    obj.button43:setHeight(30);
    obj.button43:setName("button43");

    obj.image75 = GUI.fromHandle(_obj_newObject("image"));
    obj.image75:setParent(obj.InfPoderes13);
    obj.image75:setSRC("/imagens/CirculoNave.png");
    obj.image75:setLeft(293);
    obj.image75:setTop(120);
    obj.image75:setWidth(408);
    obj.image75:setHeight(285);
    obj.image75:setName("image75");

    obj.image76 = GUI.fromHandle(_obj_newObject("image"));
    obj.image76:setParent(obj.InfPoderes13);
    obj.image76:setSRC("/imagens/NomedoseuPoder.png");
    obj.image76:setLeft(293);
    obj.image76:setTop(116);
    obj.image76:setWidth(218);
    obj.image76:setHeight(43);
    obj.image76:setName("image76");

    obj.image77 = GUI.fromHandle(_obj_newObject("image"));
    obj.image77:setParent(obj.InfPoderes13);
    obj.image77:setSRC("/imagens/detalhesdoPoder.png");
    obj.image77:setLeft(293);
    obj.image77:setTop(165);
    obj.image77:setWidth(218);
    obj.image77:setHeight(43);
    obj.image77:setName("image77");

    obj.image78 = GUI.fromHandle(_obj_newObject("image"));
    obj.image78:setParent(obj.InfPoderes13);
    obj.image78:setSRC("/imagens/niveisDoPoder.png");
    obj.image78:setLeft(235);
    obj.image78:setTop(270);
    obj.image78:setWidth(218);
    obj.image78:setHeight(43);
    obj.image78:setName("image78");

    obj.image79 = GUI.fromHandle(_obj_newObject("image"));
    obj.image79:setParent(obj.InfPoderes13);
    obj.image79:setSRC("/imagens/Anotações.png");
    obj.image79:setLeft(500);
    obj.image79:setTop(117);
    obj.image79:setWidth(218);
    obj.image79:setHeight(43);
    obj.image79:setName("image79");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.InfPoderes13);
    obj.edit13:setLeft(306);
    obj.edit13:setTop(149);
    obj.edit13:setWidth(152);
    obj.edit13:setHeight(27);
    obj.edit13:setReadOnly(true);
    obj.edit13:setText("Controle de energia");
    obj.edit13:setName("edit13");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.InfPoderes13);
    obj.textEditor25:setLeft(306);
    obj.textEditor25:setTop(193);
    obj.textEditor25:setWidth(202);
    obj.textEditor25:setHeight(87);
    obj.textEditor25:setReadOnly(true);
    obj.textEditor25:setText("Iniciante: Iniciantes podem apenas controlar coisas básicas, como danos com choques elétricos (Não tem controle algum) ou até mesmo hackiar coisas pequenas\n\nIntermediário: Pode controlar quase tudo para dar dano com choque elétrico, e hackiar coisas de porte médio (Controla quando à muita concentração)\n\nAvançado: Total controle as danos elétricos, e pode gerar energia a partir de energia estática, e pode hackiar coisas grandes.");
    obj.textEditor25:setName("textEditor25");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.InfPoderes13);
    obj.textEditor26:setLeft(520);
    obj.textEditor26:setTop(149);
    obj.textEditor26:setWidth(169);
    obj.textEditor26:setHeight(246);
    obj.textEditor26:setField("Anotações13");
    obj.textEditor26:setName("textEditor26");

    obj.NivelPoder73 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder73:setParent(obj.InfPoderes13);
    obj.NivelPoder73:setName("NivelPoder73");
    obj.NivelPoder73:setText("1");
    obj.NivelPoder73:setLeft(320);
    obj.NivelPoder73:setTop(324);
    obj.NivelPoder73:setWidth(20);
    obj.NivelPoder73:setHeight(20);

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.NivelPoder73);
    obj.checkBox73:setField("NivelPoder73");
    obj.checkBox73:setAlign("top");
    obj.checkBox73:setMargins({top=-15});
    obj.checkBox73:setName("checkBox73");

    obj.NivelPoder74 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder74:setParent(obj.InfPoderes13);
    obj.NivelPoder74:setName("NivelPoder74");
    obj.NivelPoder74:setText("2");
    obj.NivelPoder74:setLeft(340);
    obj.NivelPoder74:setTop(324);
    obj.NivelPoder74:setWidth(20);
    obj.NivelPoder74:setHeight(20);

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.NivelPoder74);
    obj.checkBox74:setField("NivelPoder74");
    obj.checkBox74:setAlign("top");
    obj.checkBox74:setMargins({top=-15});
    obj.checkBox74:setName("checkBox74");

    obj.NivelPoder75 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder75:setParent(obj.InfPoderes13);
    obj.NivelPoder75:setName("NivelPoder75");
    obj.NivelPoder75:setText("3");
    obj.NivelPoder75:setLeft(360);
    obj.NivelPoder75:setTop(324);
    obj.NivelPoder75:setWidth(20);
    obj.NivelPoder75:setHeight(20);

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.NivelPoder75);
    obj.checkBox75:setField("NivelPoder75");
    obj.checkBox75:setAlign("top");
    obj.checkBox75:setMargins({top=-15});
    obj.checkBox75:setName("checkBox75");

    obj.NivelPoder76 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder76:setParent(obj.InfPoderes13);
    obj.NivelPoder76:setName("NivelPoder76");
    obj.NivelPoder76:setText("4");
    obj.NivelPoder76:setLeft(320);
    obj.NivelPoder76:setTop(359);
    obj.NivelPoder76:setWidth(20);
    obj.NivelPoder76:setHeight(20);

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.NivelPoder76);
    obj.checkBox76:setField("NivelPoder76");
    obj.checkBox76:setAlign("top");
    obj.checkBox76:setMargins({top=-15});
    obj.checkBox76:setName("checkBox76");

    obj.NivelPoder77 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder77:setParent(obj.InfPoderes13);
    obj.NivelPoder77:setName("NivelPoder77");
    obj.NivelPoder77:setText("5");
    obj.NivelPoder77:setLeft(340);
    obj.NivelPoder77:setTop(359);
    obj.NivelPoder77:setWidth(20);
    obj.NivelPoder77:setHeight(20);

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.NivelPoder77);
    obj.checkBox77:setField("NivelPoder77");
    obj.checkBox77:setAlign("top");
    obj.checkBox77:setMargins({top=-15});
    obj.checkBox77:setName("checkBox77");

    obj.NivelPoder78 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder78:setParent(obj.InfPoderes13);
    obj.NivelPoder78:setName("NivelPoder78");
    obj.NivelPoder78:setText("6");
    obj.NivelPoder78:setLeft(360);
    obj.NivelPoder78:setTop(359);
    obj.NivelPoder78:setWidth(20);
    obj.NivelPoder78:setHeight(20);

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.NivelPoder78);
    obj.checkBox78:setField("NivelPoder78");
    obj.checkBox78:setAlign("top");
    obj.checkBox78:setMargins({top=-15});
    obj.checkBox78:setName("checkBox78");

    obj.InfPoderes14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes14:setParent(obj.scrollBox1);
    obj.InfPoderes14:setName("InfPoderes14");
    obj.InfPoderes14:setAlign("client");
    obj.InfPoderes14:setVisible(false);

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.InfPoderes14);
    obj.button44:setText("VOLTAR");
    lfm_setPropAsString(obj.button44, "fontStyle",  "bold");
    obj.button44:setFontColor("#6495ED");
    obj.button44:setLeft(300);
    obj.button44:setTop(88);
    obj.button44:setWidth(70);
    obj.button44:setHeight(30);
    obj.button44:setName("button44");

    obj.image80 = GUI.fromHandle(_obj_newObject("image"));
    obj.image80:setParent(obj.InfPoderes14);
    obj.image80:setSRC("/imagens/CirculoNave.png");
    obj.image80:setLeft(293);
    obj.image80:setTop(120);
    obj.image80:setWidth(408);
    obj.image80:setHeight(285);
    obj.image80:setName("image80");

    obj.image81 = GUI.fromHandle(_obj_newObject("image"));
    obj.image81:setParent(obj.InfPoderes14);
    obj.image81:setSRC("/imagens/NomedoseuPoder.png");
    obj.image81:setLeft(293);
    obj.image81:setTop(116);
    obj.image81:setWidth(218);
    obj.image81:setHeight(43);
    obj.image81:setName("image81");

    obj.image82 = GUI.fromHandle(_obj_newObject("image"));
    obj.image82:setParent(obj.InfPoderes14);
    obj.image82:setSRC("/imagens/detalhesdoPoder.png");
    obj.image82:setLeft(293);
    obj.image82:setTop(165);
    obj.image82:setWidth(218);
    obj.image82:setHeight(43);
    obj.image82:setName("image82");

    obj.image83 = GUI.fromHandle(_obj_newObject("image"));
    obj.image83:setParent(obj.InfPoderes14);
    obj.image83:setSRC("/imagens/niveisDoPoder.png");
    obj.image83:setLeft(235);
    obj.image83:setTop(270);
    obj.image83:setWidth(218);
    obj.image83:setHeight(43);
    obj.image83:setName("image83");

    obj.image84 = GUI.fromHandle(_obj_newObject("image"));
    obj.image84:setParent(obj.InfPoderes14);
    obj.image84:setSRC("/imagens/Anotações.png");
    obj.image84:setLeft(500);
    obj.image84:setTop(117);
    obj.image84:setWidth(218);
    obj.image84:setHeight(43);
    obj.image84:setName("image84");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.InfPoderes14);
    obj.edit14:setLeft(306);
    obj.edit14:setTop(149);
    obj.edit14:setWidth(152);
    obj.edit14:setHeight(27);
    obj.edit14:setReadOnly(true);
    obj.edit14:setText("Corpo Elástico");
    obj.edit14:setName("edit14");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.InfPoderes14);
    obj.textEditor27:setLeft(306);
    obj.textEditor27:setTop(193);
    obj.textEditor27:setWidth(202);
    obj.textEditor27:setHeight(87);
    obj.textEditor27:setReadOnly(true);
    obj.textEditor27:setText("Iniciante: Você pode esticar algumas partes do corpo, mas sente MUITA dor\n\nIntermediário: Você consegue esticar braços e pernas com pouca dor\n\nAvançado: Você se estica totalmente com muita tranquilidade");
    obj.textEditor27:setName("textEditor27");

    obj.textEditor28 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.InfPoderes14);
    obj.textEditor28:setLeft(520);
    obj.textEditor28:setTop(149);
    obj.textEditor28:setWidth(169);
    obj.textEditor28:setHeight(246);
    obj.textEditor28:setField("Anotações14");
    obj.textEditor28:setName("textEditor28");

    obj.NivelPoder79 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder79:setParent(obj.InfPoderes14);
    obj.NivelPoder79:setName("NivelPoder79");
    obj.NivelPoder79:setText("1");
    obj.NivelPoder79:setLeft(320);
    obj.NivelPoder79:setTop(324);
    obj.NivelPoder79:setWidth(20);
    obj.NivelPoder79:setHeight(20);

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.NivelPoder79);
    obj.checkBox79:setField("NivelPoder79");
    obj.checkBox79:setAlign("top");
    obj.checkBox79:setMargins({top=-15});
    obj.checkBox79:setName("checkBox79");

    obj.NivelPoder80 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder80:setParent(obj.InfPoderes14);
    obj.NivelPoder80:setName("NivelPoder80");
    obj.NivelPoder80:setText("2");
    obj.NivelPoder80:setLeft(340);
    obj.NivelPoder80:setTop(324);
    obj.NivelPoder80:setWidth(20);
    obj.NivelPoder80:setHeight(20);

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.NivelPoder80);
    obj.checkBox80:setField("NivelPoder80");
    obj.checkBox80:setAlign("top");
    obj.checkBox80:setMargins({top=-15});
    obj.checkBox80:setName("checkBox80");

    obj.NivelPoder81 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder81:setParent(obj.InfPoderes14);
    obj.NivelPoder81:setName("NivelPoder81");
    obj.NivelPoder81:setText("3");
    obj.NivelPoder81:setLeft(360);
    obj.NivelPoder81:setTop(324);
    obj.NivelPoder81:setWidth(20);
    obj.NivelPoder81:setHeight(20);

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.NivelPoder81);
    obj.checkBox81:setField("NivelPoder81");
    obj.checkBox81:setAlign("top");
    obj.checkBox81:setMargins({top=-15});
    obj.checkBox81:setName("checkBox81");

    obj.NivelPoder82 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder82:setParent(obj.InfPoderes14);
    obj.NivelPoder82:setName("NivelPoder82");
    obj.NivelPoder82:setText("4");
    obj.NivelPoder82:setLeft(320);
    obj.NivelPoder82:setTop(359);
    obj.NivelPoder82:setWidth(20);
    obj.NivelPoder82:setHeight(20);

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.NivelPoder82);
    obj.checkBox82:setField("NivelPoder82");
    obj.checkBox82:setAlign("top");
    obj.checkBox82:setMargins({top=-15});
    obj.checkBox82:setName("checkBox82");

    obj.NivelPoder83 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder83:setParent(obj.InfPoderes14);
    obj.NivelPoder83:setName("NivelPoder83");
    obj.NivelPoder83:setText("5");
    obj.NivelPoder83:setLeft(340);
    obj.NivelPoder83:setTop(359);
    obj.NivelPoder83:setWidth(20);
    obj.NivelPoder83:setHeight(20);

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.NivelPoder83);
    obj.checkBox83:setField("NivelPoder83");
    obj.checkBox83:setAlign("top");
    obj.checkBox83:setMargins({top=-15});
    obj.checkBox83:setName("checkBox83");

    obj.NivelPoder84 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder84:setParent(obj.InfPoderes14);
    obj.NivelPoder84:setName("NivelPoder84");
    obj.NivelPoder84:setText("6");
    obj.NivelPoder84:setLeft(360);
    obj.NivelPoder84:setTop(359);
    obj.NivelPoder84:setWidth(20);
    obj.NivelPoder84:setHeight(20);

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.NivelPoder84);
    obj.checkBox84:setField("NivelPoder84");
    obj.checkBox84:setAlign("top");
    obj.checkBox84:setMargins({top=-15});
    obj.checkBox84:setName("checkBox84");

    obj.InfPoderes15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes15:setParent(obj.scrollBox1);
    obj.InfPoderes15:setName("InfPoderes15");
    obj.InfPoderes15:setAlign("client");
    obj.InfPoderes15:setVisible(false);

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.InfPoderes15);
    obj.button45:setText("VOLTAR");
    lfm_setPropAsString(obj.button45, "fontStyle",  "bold");
    obj.button45:setFontColor("#6495ED");
    obj.button45:setLeft(300);
    obj.button45:setTop(88);
    obj.button45:setWidth(70);
    obj.button45:setHeight(30);
    obj.button45:setName("button45");

    obj.image85 = GUI.fromHandle(_obj_newObject("image"));
    obj.image85:setParent(obj.InfPoderes15);
    obj.image85:setSRC("/imagens/CirculoNave.png");
    obj.image85:setLeft(293);
    obj.image85:setTop(120);
    obj.image85:setWidth(408);
    obj.image85:setHeight(285);
    obj.image85:setName("image85");

    obj.image86 = GUI.fromHandle(_obj_newObject("image"));
    obj.image86:setParent(obj.InfPoderes15);
    obj.image86:setSRC("/imagens/NomedoseuPoder.png");
    obj.image86:setLeft(293);
    obj.image86:setTop(116);
    obj.image86:setWidth(218);
    obj.image86:setHeight(43);
    obj.image86:setName("image86");

    obj.image87 = GUI.fromHandle(_obj_newObject("image"));
    obj.image87:setParent(obj.InfPoderes15);
    obj.image87:setSRC("/imagens/detalhesdoPoder.png");
    obj.image87:setLeft(293);
    obj.image87:setTop(165);
    obj.image87:setWidth(218);
    obj.image87:setHeight(43);
    obj.image87:setName("image87");

    obj.image88 = GUI.fromHandle(_obj_newObject("image"));
    obj.image88:setParent(obj.InfPoderes15);
    obj.image88:setSRC("/imagens/niveisDoPoder.png");
    obj.image88:setLeft(235);
    obj.image88:setTop(270);
    obj.image88:setWidth(218);
    obj.image88:setHeight(43);
    obj.image88:setName("image88");

    obj.image89 = GUI.fromHandle(_obj_newObject("image"));
    obj.image89:setParent(obj.InfPoderes15);
    obj.image89:setSRC("/imagens/Anotações.png");
    obj.image89:setLeft(500);
    obj.image89:setTop(117);
    obj.image89:setWidth(218);
    obj.image89:setHeight(43);
    obj.image89:setName("image89");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.InfPoderes15);
    obj.edit15:setLeft(306);
    obj.edit15:setTop(149);
    obj.edit15:setWidth(152);
    obj.edit15:setHeight(27);
    obj.edit15:setReadOnly(true);
    obj.edit15:setText("Controle de fogo");
    obj.edit15:setName("edit15");

    obj.textEditor29 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.InfPoderes15);
    obj.textEditor29:setLeft(306);
    obj.textEditor29:setTop(193);
    obj.textEditor29:setWidth(202);
    obj.textEditor29:setHeight(87);
    obj.textEditor29:setReadOnly(true);
    obj.textEditor29:setText("Iniciante: Fogão pra que? Se eu posso fritar meu ovo com minha própria mão\n\nIntermediário: Consegue criar fogo através do roubo de temperatura.\n\nAvançado: Consegue criar fogo através da ALTA temperatura de seu próprio corpo");
    obj.textEditor29:setName("textEditor29");

    obj.textEditor30 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.InfPoderes15);
    obj.textEditor30:setLeft(520);
    obj.textEditor30:setTop(149);
    obj.textEditor30:setWidth(169);
    obj.textEditor30:setHeight(246);
    obj.textEditor30:setField("Anotações15");
    obj.textEditor30:setName("textEditor30");

    obj.NivelPoder85 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder85:setParent(obj.InfPoderes15);
    obj.NivelPoder85:setName("NivelPoder85");
    obj.NivelPoder85:setText("1");
    obj.NivelPoder85:setLeft(320);
    obj.NivelPoder85:setTop(324);
    obj.NivelPoder85:setWidth(20);
    obj.NivelPoder85:setHeight(20);

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.NivelPoder85);
    obj.checkBox85:setField("NivelPoder85");
    obj.checkBox85:setAlign("top");
    obj.checkBox85:setMargins({top=-15});
    obj.checkBox85:setName("checkBox85");

    obj.NivelPoder86 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder86:setParent(obj.InfPoderes15);
    obj.NivelPoder86:setName("NivelPoder86");
    obj.NivelPoder86:setText("2");
    obj.NivelPoder86:setLeft(340);
    obj.NivelPoder86:setTop(324);
    obj.NivelPoder86:setWidth(20);
    obj.NivelPoder86:setHeight(20);

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.NivelPoder86);
    obj.checkBox86:setField("NivelPoder86");
    obj.checkBox86:setAlign("top");
    obj.checkBox86:setMargins({top=-15});
    obj.checkBox86:setName("checkBox86");

    obj.NivelPoder87 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder87:setParent(obj.InfPoderes15);
    obj.NivelPoder87:setName("NivelPoder87");
    obj.NivelPoder87:setText("3");
    obj.NivelPoder87:setLeft(360);
    obj.NivelPoder87:setTop(324);
    obj.NivelPoder87:setWidth(20);
    obj.NivelPoder87:setHeight(20);

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.NivelPoder87);
    obj.checkBox87:setField("NivelPoder87");
    obj.checkBox87:setAlign("top");
    obj.checkBox87:setMargins({top=-15});
    obj.checkBox87:setName("checkBox87");

    obj.NivelPoder88 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder88:setParent(obj.InfPoderes15);
    obj.NivelPoder88:setName("NivelPoder88");
    obj.NivelPoder88:setText("4");
    obj.NivelPoder88:setLeft(320);
    obj.NivelPoder88:setTop(359);
    obj.NivelPoder88:setWidth(20);
    obj.NivelPoder88:setHeight(20);

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.NivelPoder88);
    obj.checkBox88:setField("NivelPoder88");
    obj.checkBox88:setAlign("top");
    obj.checkBox88:setMargins({top=-15});
    obj.checkBox88:setName("checkBox88");

    obj.NivelPoder89 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder89:setParent(obj.InfPoderes15);
    obj.NivelPoder89:setName("NivelPoder89");
    obj.NivelPoder89:setText("5");
    obj.NivelPoder89:setLeft(340);
    obj.NivelPoder89:setTop(359);
    obj.NivelPoder89:setWidth(20);
    obj.NivelPoder89:setHeight(20);

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.NivelPoder89);
    obj.checkBox89:setField("NivelPoder89");
    obj.checkBox89:setAlign("top");
    obj.checkBox89:setMargins({top=-15});
    obj.checkBox89:setName("checkBox89");

    obj.NivelPoder90 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder90:setParent(obj.InfPoderes15);
    obj.NivelPoder90:setName("NivelPoder90");
    obj.NivelPoder90:setText("6");
    obj.NivelPoder90:setLeft(360);
    obj.NivelPoder90:setTop(359);
    obj.NivelPoder90:setWidth(20);
    obj.NivelPoder90:setHeight(20);

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.NivelPoder90);
    obj.checkBox90:setField("NivelPoder90");
    obj.checkBox90:setAlign("top");
    obj.checkBox90:setMargins({top=-15});
    obj.checkBox90:setName("checkBox90");

    obj.InfPoderes16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes16:setParent(obj.scrollBox1);
    obj.InfPoderes16:setName("InfPoderes16");
    obj.InfPoderes16:setAlign("client");
    obj.InfPoderes16:setVisible(false);

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.InfPoderes16);
    obj.button46:setText("VOLTAR");
    lfm_setPropAsString(obj.button46, "fontStyle",  "bold");
    obj.button46:setFontColor("#6495ED");
    obj.button46:setLeft(300);
    obj.button46:setTop(88);
    obj.button46:setWidth(70);
    obj.button46:setHeight(30);
    obj.button46:setName("button46");

    obj.image90 = GUI.fromHandle(_obj_newObject("image"));
    obj.image90:setParent(obj.InfPoderes16);
    obj.image90:setSRC("/imagens/CirculoNave.png");
    obj.image90:setLeft(293);
    obj.image90:setTop(120);
    obj.image90:setWidth(408);
    obj.image90:setHeight(285);
    obj.image90:setName("image90");

    obj.image91 = GUI.fromHandle(_obj_newObject("image"));
    obj.image91:setParent(obj.InfPoderes16);
    obj.image91:setSRC("/imagens/NomedoseuPoder.png");
    obj.image91:setLeft(293);
    obj.image91:setTop(116);
    obj.image91:setWidth(218);
    obj.image91:setHeight(43);
    obj.image91:setName("image91");

    obj.image92 = GUI.fromHandle(_obj_newObject("image"));
    obj.image92:setParent(obj.InfPoderes16);
    obj.image92:setSRC("/imagens/detalhesdoPoder.png");
    obj.image92:setLeft(293);
    obj.image92:setTop(165);
    obj.image92:setWidth(218);
    obj.image92:setHeight(43);
    obj.image92:setName("image92");

    obj.image93 = GUI.fromHandle(_obj_newObject("image"));
    obj.image93:setParent(obj.InfPoderes16);
    obj.image93:setSRC("/imagens/niveisDoPoder.png");
    obj.image93:setLeft(235);
    obj.image93:setTop(270);
    obj.image93:setWidth(218);
    obj.image93:setHeight(43);
    obj.image93:setName("image93");

    obj.image94 = GUI.fromHandle(_obj_newObject("image"));
    obj.image94:setParent(obj.InfPoderes16);
    obj.image94:setSRC("/imagens/Anotações.png");
    obj.image94:setLeft(500);
    obj.image94:setTop(117);
    obj.image94:setWidth(218);
    obj.image94:setHeight(43);
    obj.image94:setName("image94");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.InfPoderes16);
    obj.edit16:setLeft(306);
    obj.edit16:setTop(149);
    obj.edit16:setWidth(152);
    obj.edit16:setHeight(27);
    obj.edit16:setReadOnly(true);
    obj.edit16:setText("Hibrido");
    obj.edit16:setName("edit16");

    obj.textEditor31 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.InfPoderes16);
    obj.textEditor31:setLeft(306);
    obj.textEditor31:setTop(193);
    obj.textEditor31:setWidth(202);
    obj.textEditor31:setHeight(87);
    obj.textEditor31:setReadOnly(true);
    obj.textEditor31:setText("Apenas para aqueles que tirarem a sorte grande.");
    obj.textEditor31:setName("textEditor31");

    obj.textEditor32 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.InfPoderes16);
    obj.textEditor32:setLeft(520);
    obj.textEditor32:setTop(149);
    obj.textEditor32:setWidth(169);
    obj.textEditor32:setHeight(246);
    obj.textEditor32:setField("Anotações16");
    obj.textEditor32:setName("textEditor32");

    obj.NivelPoder91 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder91:setParent(obj.InfPoderes16);
    obj.NivelPoder91:setName("NivelPoder91");
    obj.NivelPoder91:setText("1");
    obj.NivelPoder91:setLeft(320);
    obj.NivelPoder91:setTop(324);
    obj.NivelPoder91:setWidth(20);
    obj.NivelPoder91:setHeight(20);

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.NivelPoder91);
    obj.checkBox91:setField("NivelPoder91");
    obj.checkBox91:setAlign("top");
    obj.checkBox91:setMargins({top=-15});
    obj.checkBox91:setName("checkBox91");

    obj.NivelPoder92 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder92:setParent(obj.InfPoderes16);
    obj.NivelPoder92:setName("NivelPoder92");
    obj.NivelPoder92:setText("2");
    obj.NivelPoder92:setLeft(340);
    obj.NivelPoder92:setTop(324);
    obj.NivelPoder92:setWidth(20);
    obj.NivelPoder92:setHeight(20);

    obj.checkBox92 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.NivelPoder92);
    obj.checkBox92:setField("NivelPoder92");
    obj.checkBox92:setAlign("top");
    obj.checkBox92:setMargins({top=-15});
    obj.checkBox92:setName("checkBox92");

    obj.NivelPoder93 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder93:setParent(obj.InfPoderes16);
    obj.NivelPoder93:setName("NivelPoder93");
    obj.NivelPoder93:setText("3");
    obj.NivelPoder93:setLeft(360);
    obj.NivelPoder93:setTop(324);
    obj.NivelPoder93:setWidth(20);
    obj.NivelPoder93:setHeight(20);

    obj.checkBox93 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.NivelPoder93);
    obj.checkBox93:setField("NivelPoder93");
    obj.checkBox93:setAlign("top");
    obj.checkBox93:setMargins({top=-15});
    obj.checkBox93:setName("checkBox93");

    obj.NivelPoder94 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder94:setParent(obj.InfPoderes16);
    obj.NivelPoder94:setName("NivelPoder94");
    obj.NivelPoder94:setText("4");
    obj.NivelPoder94:setLeft(320);
    obj.NivelPoder94:setTop(359);
    obj.NivelPoder94:setWidth(20);
    obj.NivelPoder94:setHeight(20);

    obj.checkBox94 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.NivelPoder94);
    obj.checkBox94:setField("NivelPoder94");
    obj.checkBox94:setAlign("top");
    obj.checkBox94:setMargins({top=-15});
    obj.checkBox94:setName("checkBox94");

    obj.NivelPoder95 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder95:setParent(obj.InfPoderes16);
    obj.NivelPoder95:setName("NivelPoder95");
    obj.NivelPoder95:setText("5");
    obj.NivelPoder95:setLeft(340);
    obj.NivelPoder95:setTop(359);
    obj.NivelPoder95:setWidth(20);
    obj.NivelPoder95:setHeight(20);

    obj.checkBox95 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.NivelPoder95);
    obj.checkBox95:setField("NivelPoder95");
    obj.checkBox95:setAlign("top");
    obj.checkBox95:setMargins({top=-15});
    obj.checkBox95:setName("checkBox95");

    obj.NivelPoder96 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder96:setParent(obj.InfPoderes16);
    obj.NivelPoder96:setName("NivelPoder96");
    obj.NivelPoder96:setText("6");
    obj.NivelPoder96:setLeft(360);
    obj.NivelPoder96:setTop(359);
    obj.NivelPoder96:setWidth(20);
    obj.NivelPoder96:setHeight(20);

    obj.checkBox96 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.NivelPoder96);
    obj.checkBox96:setField("NivelPoder96");
    obj.checkBox96:setAlign("top");
    obj.checkBox96:setMargins({top=-15});
    obj.checkBox96:setName("checkBox96");

    obj.InfPoderes17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfPoderes17:setParent(obj.scrollBox1);
    obj.InfPoderes17:setName("InfPoderes17");
    obj.InfPoderes17:setAlign("client");
    obj.InfPoderes17:setVisible(false);

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.InfPoderes17);
    obj.button47:setText("VOLTAR");
    lfm_setPropAsString(obj.button47, "fontStyle",  "bold");
    obj.button47:setFontColor("#6495ED");
    obj.button47:setLeft(300);
    obj.button47:setTop(88);
    obj.button47:setWidth(70);
    obj.button47:setHeight(30);
    obj.button47:setName("button47");

    obj.image95 = GUI.fromHandle(_obj_newObject("image"));
    obj.image95:setParent(obj.InfPoderes17);
    obj.image95:setSRC("/imagens/CirculoNave.png");
    obj.image95:setLeft(293);
    obj.image95:setTop(120);
    obj.image95:setWidth(408);
    obj.image95:setHeight(285);
    obj.image95:setName("image95");

    obj.image96 = GUI.fromHandle(_obj_newObject("image"));
    obj.image96:setParent(obj.InfPoderes17);
    obj.image96:setSRC("/imagens/NomedoseuPoder.png");
    obj.image96:setLeft(293);
    obj.image96:setTop(116);
    obj.image96:setWidth(218);
    obj.image96:setHeight(43);
    obj.image96:setName("image96");

    obj.image97 = GUI.fromHandle(_obj_newObject("image"));
    obj.image97:setParent(obj.InfPoderes17);
    obj.image97:setSRC("/imagens/detalhesdoPoder.png");
    obj.image97:setLeft(293);
    obj.image97:setTop(165);
    obj.image97:setWidth(218);
    obj.image97:setHeight(43);
    obj.image97:setName("image97");

    obj.image98 = GUI.fromHandle(_obj_newObject("image"));
    obj.image98:setParent(obj.InfPoderes17);
    obj.image98:setSRC("/imagens/niveisDoPoder.png");
    obj.image98:setLeft(235);
    obj.image98:setTop(270);
    obj.image98:setWidth(218);
    obj.image98:setHeight(43);
    obj.image98:setName("image98");

    obj.image99 = GUI.fromHandle(_obj_newObject("image"));
    obj.image99:setParent(obj.InfPoderes17);
    obj.image99:setSRC("/imagens/Anotações.png");
    obj.image99:setLeft(500);
    obj.image99:setTop(117);
    obj.image99:setWidth(218);
    obj.image99:setHeight(43);
    obj.image99:setName("image99");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.InfPoderes17);
    obj.edit17:setLeft(306);
    obj.edit17:setTop(149);
    obj.edit17:setWidth(152);
    obj.edit17:setHeight(27);
    obj.edit17:setReadOnly(true);
    obj.edit17:setText("Prever futuro");
    obj.edit17:setName("edit17");

    obj.textEditor33 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.InfPoderes17);
    obj.textEditor33:setLeft(306);
    obj.textEditor33:setTop(193);
    obj.textEditor33:setWidth(202);
    obj.textEditor33:setHeight(87);
    obj.textEditor33:setReadOnly(true);
    obj.textEditor33:setText("Iniciante: Tem apenas pressentimentos. Não, você não vai saber o numero da mega-sena\n\nIntermediário: Consegue prever o futuro próximo, mas apenas o seu.\n\nAvançado: Pode prever o futuro distante, e consegue saber tudo oque já aconteceu e oque ainda não aconteceu com uma pessoa a partir do toque.");
    obj.textEditor33:setName("textEditor33");

    obj.textEditor34 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.InfPoderes17);
    obj.textEditor34:setLeft(520);
    obj.textEditor34:setTop(149);
    obj.textEditor34:setWidth(169);
    obj.textEditor34:setHeight(246);
    obj.textEditor34:setField("Anotações17");
    obj.textEditor34:setName("textEditor34");

    obj.NivelPoder97 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder97:setParent(obj.InfPoderes17);
    obj.NivelPoder97:setName("NivelPoder97");
    obj.NivelPoder97:setText("1");
    obj.NivelPoder97:setLeft(320);
    obj.NivelPoder97:setTop(324);
    obj.NivelPoder97:setWidth(20);
    obj.NivelPoder97:setHeight(20);

    obj.checkBox97 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.NivelPoder97);
    obj.checkBox97:setField("NivelPoder97");
    obj.checkBox97:setAlign("top");
    obj.checkBox97:setMargins({top=-15});
    obj.checkBox97:setName("checkBox97");

    obj.NivelPoder98 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder98:setParent(obj.InfPoderes17);
    obj.NivelPoder98:setName("NivelPoder98");
    obj.NivelPoder98:setText("2");
    obj.NivelPoder98:setLeft(340);
    obj.NivelPoder98:setTop(324);
    obj.NivelPoder98:setWidth(20);
    obj.NivelPoder98:setHeight(20);

    obj.checkBox98 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.NivelPoder98);
    obj.checkBox98:setField("NivelPoder98");
    obj.checkBox98:setAlign("top");
    obj.checkBox98:setMargins({top=-15});
    obj.checkBox98:setName("checkBox98");

    obj.NivelPoder99 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder99:setParent(obj.InfPoderes17);
    obj.NivelPoder99:setName("NivelPoder99");
    obj.NivelPoder99:setText("3");
    obj.NivelPoder99:setLeft(360);
    obj.NivelPoder99:setTop(324);
    obj.NivelPoder99:setWidth(20);
    obj.NivelPoder99:setHeight(20);

    obj.checkBox99 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.NivelPoder99);
    obj.checkBox99:setField("NivelPoder99");
    obj.checkBox99:setAlign("top");
    obj.checkBox99:setMargins({top=-15});
    obj.checkBox99:setName("checkBox99");

    obj.NivelPoder100 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder100:setParent(obj.InfPoderes17);
    obj.NivelPoder100:setName("NivelPoder100");
    obj.NivelPoder100:setText("4");
    obj.NivelPoder100:setLeft(320);
    obj.NivelPoder100:setTop(359);
    obj.NivelPoder100:setWidth(20);
    obj.NivelPoder100:setHeight(20);

    obj.checkBox100 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.NivelPoder100);
    obj.checkBox100:setField("NivelPoder100");
    obj.checkBox100:setAlign("top");
    obj.checkBox100:setMargins({top=-15});
    obj.checkBox100:setName("checkBox100");

    obj.NivelPoder101 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder101:setParent(obj.InfPoderes17);
    obj.NivelPoder101:setName("NivelPoder101");
    obj.NivelPoder101:setText("5");
    obj.NivelPoder101:setLeft(340);
    obj.NivelPoder101:setTop(359);
    obj.NivelPoder101:setWidth(20);
    obj.NivelPoder101:setHeight(20);

    obj.checkBox101 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.NivelPoder101);
    obj.checkBox101:setField("NivelPoder101");
    obj.checkBox101:setAlign("top");
    obj.checkBox101:setMargins({top=-15});
    obj.checkBox101:setName("checkBox101");

    obj.NivelPoder102 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelPoder102:setParent(obj.InfPoderes17);
    obj.NivelPoder102:setName("NivelPoder102");
    obj.NivelPoder102:setText("6");
    obj.NivelPoder102:setLeft(360);
    obj.NivelPoder102:setTop(359);
    obj.NivelPoder102:setWidth(20);
    obj.NivelPoder102:setHeight(20);

    obj.checkBox102 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.NivelPoder102);
    obj.checkBox102:setField("NivelPoder102");
    obj.checkBox102:setAlign("top");
    obj.checkBox102:setMargins({top=-15});
    obj.checkBox102:setName("checkBox102");

    obj.InfHabilidades1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades1:setParent(obj.scrollBox1);
    obj.InfHabilidades1:setName("InfHabilidades1");
    obj.InfHabilidades1:setAlign("client");
    obj.InfHabilidades1:setVisible(false);

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.InfHabilidades1);
    obj.button48:setText("VOLTAR");
    lfm_setPropAsString(obj.button48, "fontStyle",  "bold");
    obj.button48:setFontColor("#6495ED");
    obj.button48:setLeft(300);
    obj.button48:setTop(88);
    obj.button48:setWidth(70);
    obj.button48:setHeight(30);
    obj.button48:setName("button48");

    obj.image100 = GUI.fromHandle(_obj_newObject("image"));
    obj.image100:setParent(obj.InfHabilidades1);
    obj.image100:setSRC("/imagens/CirculoNave.png");
    obj.image100:setLeft(293);
    obj.image100:setTop(120);
    obj.image100:setWidth(408);
    obj.image100:setHeight(285);
    obj.image100:setName("image100");

    obj.image101 = GUI.fromHandle(_obj_newObject("image"));
    obj.image101:setParent(obj.InfHabilidades1);
    obj.image101:setSRC("/imagens/nomedaHabilidade.png");
    obj.image101:setLeft(293);
    obj.image101:setTop(119);
    obj.image101:setWidth(218);
    obj.image101:setHeight(43);
    obj.image101:setName("image101");

    obj.image102 = GUI.fromHandle(_obj_newObject("image"));
    obj.image102:setParent(obj.InfHabilidades1);
    obj.image102:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image102:setLeft(297);
    obj.image102:setTop(165);
    obj.image102:setWidth(218);
    obj.image102:setHeight(43);
    obj.image102:setName("image102");

    obj.image103 = GUI.fromHandle(_obj_newObject("image"));
    obj.image103:setParent(obj.InfHabilidades1);
    obj.image103:setSRC("/imagens/niveisDoPoder.png");
    obj.image103:setLeft(235);
    obj.image103:setTop(270);
    obj.image103:setWidth(218);
    obj.image103:setHeight(43);
    obj.image103:setName("image103");

    obj.image104 = GUI.fromHandle(_obj_newObject("image"));
    obj.image104:setParent(obj.InfHabilidades1);
    obj.image104:setSRC("/imagens/Anotações.png");
    obj.image104:setLeft(500);
    obj.image104:setTop(117);
    obj.image104:setWidth(218);
    obj.image104:setHeight(43);
    obj.image104:setName("image104");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.InfHabilidades1);
    obj.edit18:setLeft(306);
    obj.edit18:setTop(149);
    obj.edit18:setWidth(152);
    obj.edit18:setHeight(27);
    obj.edit18:setReadOnly(true);
    obj.edit18:setText("Super Resistência");
    obj.edit18:setName("edit18");

    obj.textEditor35 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.InfHabilidades1);
    obj.textEditor35:setLeft(306);
    obj.textEditor35:setTop(193);
    obj.textEditor35:setWidth(202);
    obj.textEditor35:setHeight(87);
    obj.textEditor35:setReadOnly(true);
    obj.textEditor35:setText("Seria ótimo ter um super pulo, mas a parte ruim é que uma hora você tem que cair, caindo você pode ser automaticamente esmagado pela força da gravidade, mas com a sua super resistência, você tem um corpo preparado para danos fisicos extremamente fortes como a força da gravidade.\n\n[IMPLA ou APLA]");
    obj.textEditor35:setName("textEditor35");

    obj.textEditor36 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.InfHabilidades1);
    obj.textEditor36:setLeft(520);
    obj.textEditor36:setTop(149);
    obj.textEditor36:setWidth(169);
    obj.textEditor36:setHeight(246);
    obj.textEditor36:setField("Anotações18");
    obj.textEditor36:setName("textEditor36");

    obj.NivelHabilidade1 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade1:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade1:setName("NivelHabilidade1");
    obj.NivelHabilidade1:setText("1");
    obj.NivelHabilidade1:setLeft(320);
    obj.NivelHabilidade1:setTop(324);
    obj.NivelHabilidade1:setWidth(20);
    obj.NivelHabilidade1:setHeight(20);

    obj.checkBox103 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.NivelHabilidade1);
    obj.checkBox103:setField("NivelHabilidade1");
    obj.checkBox103:setAlign("top");
    obj.checkBox103:setMargins({top=-15});
    obj.checkBox103:setName("checkBox103");

    obj.NivelHabilidade2 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade2:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade2:setName("NivelHabilidade2");
    obj.NivelHabilidade2:setText("2");
    obj.NivelHabilidade2:setLeft(340);
    obj.NivelHabilidade2:setTop(324);
    obj.NivelHabilidade2:setWidth(20);
    obj.NivelHabilidade2:setHeight(20);

    obj.checkBox104 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.NivelHabilidade2);
    obj.checkBox104:setField("NivelHabilidade2");
    obj.checkBox104:setAlign("top");
    obj.checkBox104:setMargins({top=-15});
    obj.checkBox104:setName("checkBox104");

    obj.NivelHabilidade3 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade3:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade3:setName("NivelHabilidade3");
    obj.NivelHabilidade3:setText("3");
    obj.NivelHabilidade3:setLeft(360);
    obj.NivelHabilidade3:setTop(324);
    obj.NivelHabilidade3:setWidth(20);
    obj.NivelHabilidade3:setHeight(20);

    obj.checkBox105 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.NivelHabilidade3);
    obj.checkBox105:setField("NivelHabilidade3");
    obj.checkBox105:setAlign("top");
    obj.checkBox105:setMargins({top=-15});
    obj.checkBox105:setName("checkBox105");

    obj.NivelHabilidade4 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade4:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade4:setName("NivelHabilidade4");
    obj.NivelHabilidade4:setText("4");
    obj.NivelHabilidade4:setLeft(320);
    obj.NivelHabilidade4:setTop(359);
    obj.NivelHabilidade4:setWidth(20);
    obj.NivelHabilidade4:setHeight(20);

    obj.checkBox106 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.NivelHabilidade4);
    obj.checkBox106:setField("NivelHabilidade4");
    obj.checkBox106:setAlign("top");
    obj.checkBox106:setMargins({top=-15});
    obj.checkBox106:setName("checkBox106");

    obj.NivelHabilidade5 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade5:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade5:setName("NivelHabilidade5");
    obj.NivelHabilidade5:setText("5");
    obj.NivelHabilidade5:setLeft(340);
    obj.NivelHabilidade5:setTop(359);
    obj.NivelHabilidade5:setWidth(20);
    obj.NivelHabilidade5:setHeight(20);

    obj.checkBox107 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.NivelHabilidade5);
    obj.checkBox107:setField("NivelHabilidade5");
    obj.checkBox107:setAlign("top");
    obj.checkBox107:setMargins({top=-15});
    obj.checkBox107:setName("checkBox107");

    obj.NivelHabilidade6 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade6:setParent(obj.InfHabilidades1);
    obj.NivelHabilidade6:setName("NivelHabilidade6");
    obj.NivelHabilidade6:setText("6");
    obj.NivelHabilidade6:setLeft(360);
    obj.NivelHabilidade6:setTop(359);
    obj.NivelHabilidade6:setWidth(20);
    obj.NivelHabilidade6:setHeight(20);

    obj.checkBox108 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.NivelHabilidade6);
    obj.checkBox108:setField("NivelHabilidade6");
    obj.checkBox108:setAlign("top");
    obj.checkBox108:setMargins({top=-15});
    obj.checkBox108:setName("checkBox108");

    obj.InfHabilidades2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades2:setParent(obj.scrollBox1);
    obj.InfHabilidades2:setName("InfHabilidades2");
    obj.InfHabilidades2:setAlign("client");
    obj.InfHabilidades2:setVisible(false);

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.InfHabilidades2);
    obj.button49:setText("VOLTAR");
    lfm_setPropAsString(obj.button49, "fontStyle",  "bold");
    obj.button49:setFontColor("#6495ED");
    obj.button49:setLeft(300);
    obj.button49:setTop(88);
    obj.button49:setWidth(70);
    obj.button49:setHeight(30);
    obj.button49:setName("button49");

    obj.image105 = GUI.fromHandle(_obj_newObject("image"));
    obj.image105:setParent(obj.InfHabilidades2);
    obj.image105:setSRC("/imagens/CirculoNave.png");
    obj.image105:setLeft(293);
    obj.image105:setTop(120);
    obj.image105:setWidth(408);
    obj.image105:setHeight(285);
    obj.image105:setName("image105");

    obj.image106 = GUI.fromHandle(_obj_newObject("image"));
    obj.image106:setParent(obj.InfHabilidades2);
    obj.image106:setSRC("/imagens/nomedaHabilidade.png");
    obj.image106:setLeft(293);
    obj.image106:setTop(119);
    obj.image106:setWidth(218);
    obj.image106:setHeight(43);
    obj.image106:setName("image106");

    obj.image107 = GUI.fromHandle(_obj_newObject("image"));
    obj.image107:setParent(obj.InfHabilidades2);
    obj.image107:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image107:setLeft(297);
    obj.image107:setTop(165);
    obj.image107:setWidth(218);
    obj.image107:setHeight(43);
    obj.image107:setName("image107");

    obj.image108 = GUI.fromHandle(_obj_newObject("image"));
    obj.image108:setParent(obj.InfHabilidades2);
    obj.image108:setSRC("/imagens/niveisDoPoder.png");
    obj.image108:setLeft(235);
    obj.image108:setTop(270);
    obj.image108:setWidth(218);
    obj.image108:setHeight(43);
    obj.image108:setName("image108");

    obj.image109 = GUI.fromHandle(_obj_newObject("image"));
    obj.image109:setParent(obj.InfHabilidades2);
    obj.image109:setSRC("/imagens/Anotações.png");
    obj.image109:setLeft(500);
    obj.image109:setTop(117);
    obj.image109:setWidth(218);
    obj.image109:setHeight(43);
    obj.image109:setName("image109");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.InfHabilidades2);
    obj.edit19:setLeft(306);
    obj.edit19:setTop(149);
    obj.edit19:setWidth(152);
    obj.edit19:setHeight(27);
    obj.edit19:setReadOnly(true);
    obj.edit19:setText("Super Pulo");
    obj.edit19:setName("edit19");

    obj.textEditor37 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.InfHabilidades2);
    obj.textEditor37:setLeft(306);
    obj.textEditor37:setTop(193);
    obj.textEditor37:setWidth(202);
    obj.textEditor37:setHeight(87);
    obj.textEditor37:setReadOnly(true);
    obj.textEditor37:setText("Super pulo pode ajudar o IMPLA a desenvolver um pulo extremamente grande, que com um certo controle e pratica pode chegar até as nuvens.\n\n[IMPLA ou APLA]");
    obj.textEditor37:setName("textEditor37");

    obj.textEditor38 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.InfHabilidades2);
    obj.textEditor38:setLeft(520);
    obj.textEditor38:setTop(149);
    obj.textEditor38:setWidth(169);
    obj.textEditor38:setHeight(246);
    obj.textEditor38:setField("Anotações19");
    obj.textEditor38:setName("textEditor38");

    obj.NivelHabilidade7 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade7:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade7:setName("NivelHabilidade7");
    obj.NivelHabilidade7:setText("1");
    obj.NivelHabilidade7:setLeft(320);
    obj.NivelHabilidade7:setTop(324);
    obj.NivelHabilidade7:setWidth(20);
    obj.NivelHabilidade7:setHeight(20);

    obj.checkBox109 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.NivelHabilidade7);
    obj.checkBox109:setField("NivelHabilidade7");
    obj.checkBox109:setAlign("top");
    obj.checkBox109:setMargins({top=-15});
    obj.checkBox109:setName("checkBox109");

    obj.NivelHabilidade8 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade8:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade8:setName("NivelHabilidade8");
    obj.NivelHabilidade8:setText("2");
    obj.NivelHabilidade8:setLeft(340);
    obj.NivelHabilidade8:setTop(324);
    obj.NivelHabilidade8:setWidth(20);
    obj.NivelHabilidade8:setHeight(20);

    obj.checkBox110 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.NivelHabilidade8);
    obj.checkBox110:setField("NivelHabilidade8");
    obj.checkBox110:setAlign("top");
    obj.checkBox110:setMargins({top=-15});
    obj.checkBox110:setName("checkBox110");

    obj.NivelHabilidade9 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade9:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade9:setName("NivelHabilidade9");
    obj.NivelHabilidade9:setText("3");
    obj.NivelHabilidade9:setLeft(360);
    obj.NivelHabilidade9:setTop(324);
    obj.NivelHabilidade9:setWidth(20);
    obj.NivelHabilidade9:setHeight(20);

    obj.checkBox111 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.NivelHabilidade9);
    obj.checkBox111:setField("NivelHabilidade9");
    obj.checkBox111:setAlign("top");
    obj.checkBox111:setMargins({top=-15});
    obj.checkBox111:setName("checkBox111");

    obj.NivelHabilidade10 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade10:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade10:setName("NivelHabilidade10");
    obj.NivelHabilidade10:setText("4");
    obj.NivelHabilidade10:setLeft(320);
    obj.NivelHabilidade10:setTop(359);
    obj.NivelHabilidade10:setWidth(20);
    obj.NivelHabilidade10:setHeight(20);

    obj.checkBox112 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.NivelHabilidade10);
    obj.checkBox112:setField("NivelHabilidade10");
    obj.checkBox112:setAlign("top");
    obj.checkBox112:setMargins({top=-15});
    obj.checkBox112:setName("checkBox112");

    obj.NivelHabilidade11 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade11:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade11:setName("NivelHabilidade11");
    obj.NivelHabilidade11:setText("5");
    obj.NivelHabilidade11:setLeft(340);
    obj.NivelHabilidade11:setTop(359);
    obj.NivelHabilidade11:setWidth(20);
    obj.NivelHabilidade11:setHeight(20);

    obj.checkBox113 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.NivelHabilidade11);
    obj.checkBox113:setField("NivelHabilidade11");
    obj.checkBox113:setAlign("top");
    obj.checkBox113:setMargins({top=-15});
    obj.checkBox113:setName("checkBox113");

    obj.NivelHabilidade12 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade12:setParent(obj.InfHabilidades2);
    obj.NivelHabilidade12:setName("NivelHabilidade12");
    obj.NivelHabilidade12:setText("6");
    obj.NivelHabilidade12:setLeft(360);
    obj.NivelHabilidade12:setTop(359);
    obj.NivelHabilidade12:setWidth(20);
    obj.NivelHabilidade12:setHeight(20);

    obj.checkBox114 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.NivelHabilidade12);
    obj.checkBox114:setField("NivelHabilidade12");
    obj.checkBox114:setAlign("top");
    obj.checkBox114:setMargins({top=-15});
    obj.checkBox114:setName("checkBox114");

    obj.InfHabilidades3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades3:setParent(obj.scrollBox1);
    obj.InfHabilidades3:setName("InfHabilidades3");
    obj.InfHabilidades3:setAlign("client");
    obj.InfHabilidades3:setVisible(false);

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.InfHabilidades3);
    obj.button50:setText("VOLTAR");
    lfm_setPropAsString(obj.button50, "fontStyle",  "bold");
    obj.button50:setFontColor("#6495ED");
    obj.button50:setLeft(300);
    obj.button50:setTop(88);
    obj.button50:setWidth(70);
    obj.button50:setHeight(30);
    obj.button50:setName("button50");

    obj.image110 = GUI.fromHandle(_obj_newObject("image"));
    obj.image110:setParent(obj.InfHabilidades3);
    obj.image110:setSRC("/imagens/CirculoNave.png");
    obj.image110:setLeft(293);
    obj.image110:setTop(120);
    obj.image110:setWidth(408);
    obj.image110:setHeight(285);
    obj.image110:setName("image110");

    obj.image111 = GUI.fromHandle(_obj_newObject("image"));
    obj.image111:setParent(obj.InfHabilidades3);
    obj.image111:setSRC("/imagens/nomedaHabilidade.png");
    obj.image111:setLeft(293);
    obj.image111:setTop(119);
    obj.image111:setWidth(218);
    obj.image111:setHeight(43);
    obj.image111:setName("image111");

    obj.image112 = GUI.fromHandle(_obj_newObject("image"));
    obj.image112:setParent(obj.InfHabilidades3);
    obj.image112:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image112:setLeft(297);
    obj.image112:setTop(165);
    obj.image112:setWidth(218);
    obj.image112:setHeight(43);
    obj.image112:setName("image112");

    obj.image113 = GUI.fromHandle(_obj_newObject("image"));
    obj.image113:setParent(obj.InfHabilidades3);
    obj.image113:setSRC("/imagens/niveisDoPoder.png");
    obj.image113:setLeft(235);
    obj.image113:setTop(270);
    obj.image113:setWidth(218);
    obj.image113:setHeight(43);
    obj.image113:setName("image113");

    obj.image114 = GUI.fromHandle(_obj_newObject("image"));
    obj.image114:setParent(obj.InfHabilidades3);
    obj.image114:setSRC("/imagens/Anotações.png");
    obj.image114:setLeft(500);
    obj.image114:setTop(117);
    obj.image114:setWidth(218);
    obj.image114:setHeight(43);
    obj.image114:setName("image114");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.InfHabilidades3);
    obj.edit20:setLeft(306);
    obj.edit20:setTop(149);
    obj.edit20:setWidth(152);
    obj.edit20:setHeight(27);
    obj.edit20:setReadOnly(true);
    obj.edit20:setText("Super Percepção");
    obj.edit20:setName("edit20");

    obj.textEditor39 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor39:setParent(obj.InfHabilidades3);
    obj.textEditor39:setLeft(306);
    obj.textEditor39:setTop(193);
    obj.textEditor39:setWidth(202);
    obj.textEditor39:setHeight(87);
    obj.textEditor39:setReadOnly(true);
    obj.textEditor39:setText("Percebe as coisas tão rápido quanto um cão.\n\n[IMPLA]");
    obj.textEditor39:setName("textEditor39");

    obj.textEditor40 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor40:setParent(obj.InfHabilidades3);
    obj.textEditor40:setLeft(520);
    obj.textEditor40:setTop(149);
    obj.textEditor40:setWidth(169);
    obj.textEditor40:setHeight(246);
    obj.textEditor40:setField("Anotações20");
    obj.textEditor40:setName("textEditor40");

    obj.NivelHabilidade13 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade13:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade13:setName("NivelHabilidade13");
    obj.NivelHabilidade13:setText("1");
    obj.NivelHabilidade13:setLeft(320);
    obj.NivelHabilidade13:setTop(324);
    obj.NivelHabilidade13:setWidth(20);
    obj.NivelHabilidade13:setHeight(20);

    obj.checkBox115 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.NivelHabilidade13);
    obj.checkBox115:setField("NivelHabilidade13");
    obj.checkBox115:setAlign("top");
    obj.checkBox115:setMargins({top=-15});
    obj.checkBox115:setName("checkBox115");

    obj.NivelHabilidade14 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade14:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade14:setName("NivelHabilidade14");
    obj.NivelHabilidade14:setText("2");
    obj.NivelHabilidade14:setLeft(340);
    obj.NivelHabilidade14:setTop(324);
    obj.NivelHabilidade14:setWidth(20);
    obj.NivelHabilidade14:setHeight(20);

    obj.checkBox116 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.NivelHabilidade14);
    obj.checkBox116:setField("NivelHabilidade14");
    obj.checkBox116:setAlign("top");
    obj.checkBox116:setMargins({top=-15});
    obj.checkBox116:setName("checkBox116");

    obj.NivelHabilidade15 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade15:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade15:setName("NivelHabilidade15");
    obj.NivelHabilidade15:setText("3");
    obj.NivelHabilidade15:setLeft(360);
    obj.NivelHabilidade15:setTop(324);
    obj.NivelHabilidade15:setWidth(20);
    obj.NivelHabilidade15:setHeight(20);

    obj.checkBox117 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.NivelHabilidade15);
    obj.checkBox117:setField("NivelHabilidade15");
    obj.checkBox117:setAlign("top");
    obj.checkBox117:setMargins({top=-15});
    obj.checkBox117:setName("checkBox117");

    obj.NivelHabilidade16 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade16:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade16:setName("NivelHabilidade16");
    obj.NivelHabilidade16:setText("4");
    obj.NivelHabilidade16:setLeft(320);
    obj.NivelHabilidade16:setTop(359);
    obj.NivelHabilidade16:setWidth(20);
    obj.NivelHabilidade16:setHeight(20);

    obj.checkBox118 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.NivelHabilidade16);
    obj.checkBox118:setField("NivelHabilidade16");
    obj.checkBox118:setAlign("top");
    obj.checkBox118:setMargins({top=-15});
    obj.checkBox118:setName("checkBox118");

    obj.NivelHabilidade17 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade17:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade17:setName("NivelHabilidade17");
    obj.NivelHabilidade17:setText("5");
    obj.NivelHabilidade17:setLeft(340);
    obj.NivelHabilidade17:setTop(359);
    obj.NivelHabilidade17:setWidth(20);
    obj.NivelHabilidade17:setHeight(20);

    obj.checkBox119 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.NivelHabilidade17);
    obj.checkBox119:setField("NivelHabilidade17");
    obj.checkBox119:setAlign("top");
    obj.checkBox119:setMargins({top=-15});
    obj.checkBox119:setName("checkBox119");

    obj.NivelHabilidade18 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade18:setParent(obj.InfHabilidades3);
    obj.NivelHabilidade18:setName("NivelHabilidade18");
    obj.NivelHabilidade18:setText("6");
    obj.NivelHabilidade18:setLeft(360);
    obj.NivelHabilidade18:setTop(359);
    obj.NivelHabilidade18:setWidth(20);
    obj.NivelHabilidade18:setHeight(20);

    obj.checkBox120 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.NivelHabilidade18);
    obj.checkBox120:setField("NivelHabilidade18");
    obj.checkBox120:setAlign("top");
    obj.checkBox120:setMargins({top=-15});
    obj.checkBox120:setName("checkBox120");

    obj.InfHabilidades4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades4:setParent(obj.scrollBox1);
    obj.InfHabilidades4:setName("InfHabilidades4");
    obj.InfHabilidades4:setAlign("client");
    obj.InfHabilidades4:setVisible(false);

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.InfHabilidades4);
    obj.button51:setText("VOLTAR");
    lfm_setPropAsString(obj.button51, "fontStyle",  "bold");
    obj.button51:setFontColor("#6495ED");
    obj.button51:setLeft(300);
    obj.button51:setTop(88);
    obj.button51:setWidth(70);
    obj.button51:setHeight(30);
    obj.button51:setName("button51");

    obj.image115 = GUI.fromHandle(_obj_newObject("image"));
    obj.image115:setParent(obj.InfHabilidades4);
    obj.image115:setSRC("/imagens/CirculoNave.png");
    obj.image115:setLeft(293);
    obj.image115:setTop(120);
    obj.image115:setWidth(408);
    obj.image115:setHeight(285);
    obj.image115:setName("image115");

    obj.image116 = GUI.fromHandle(_obj_newObject("image"));
    obj.image116:setParent(obj.InfHabilidades4);
    obj.image116:setSRC("/imagens/nomedaHabilidade.png");
    obj.image116:setLeft(293);
    obj.image116:setTop(119);
    obj.image116:setWidth(218);
    obj.image116:setHeight(43);
    obj.image116:setName("image116");

    obj.image117 = GUI.fromHandle(_obj_newObject("image"));
    obj.image117:setParent(obj.InfHabilidades4);
    obj.image117:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image117:setLeft(297);
    obj.image117:setTop(165);
    obj.image117:setWidth(218);
    obj.image117:setHeight(43);
    obj.image117:setName("image117");

    obj.image118 = GUI.fromHandle(_obj_newObject("image"));
    obj.image118:setParent(obj.InfHabilidades4);
    obj.image118:setSRC("/imagens/niveisDoPoder.png");
    obj.image118:setLeft(235);
    obj.image118:setTop(270);
    obj.image118:setWidth(218);
    obj.image118:setHeight(43);
    obj.image118:setName("image118");

    obj.image119 = GUI.fromHandle(_obj_newObject("image"));
    obj.image119:setParent(obj.InfHabilidades4);
    obj.image119:setSRC("/imagens/Anotações.png");
    obj.image119:setLeft(500);
    obj.image119:setTop(117);
    obj.image119:setWidth(218);
    obj.image119:setHeight(43);
    obj.image119:setName("image119");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.InfHabilidades4);
    obj.edit21:setLeft(306);
    obj.edit21:setTop(149);
    obj.edit21:setWidth(152);
    obj.edit21:setHeight(27);
    obj.edit21:setReadOnly(true);
    obj.edit21:setText("Alto destruição");
    obj.edit21:setName("edit21");

    obj.textEditor41 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor41:setParent(obj.InfHabilidades4);
    obj.textEditor41:setLeft(306);
    obj.textEditor41:setTop(193);
    obj.textEditor41:setWidth(202);
    obj.textEditor41:setHeight(87);
    obj.textEditor41:setReadOnly(true);
    obj.textEditor41:setText("Cansei de viver, quero ser a destruição em pessoa.\n\n[APLA]");
    obj.textEditor41:setName("textEditor41");

    obj.textEditor42 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor42:setParent(obj.InfHabilidades4);
    obj.textEditor42:setLeft(520);
    obj.textEditor42:setTop(149);
    obj.textEditor42:setWidth(169);
    obj.textEditor42:setHeight(246);
    obj.textEditor42:setField("Anotações21");
    obj.textEditor42:setName("textEditor42");

    obj.NivelHabilidade19 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade19:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade19:setName("NivelHabilidade19");
    obj.NivelHabilidade19:setText("1");
    obj.NivelHabilidade19:setLeft(320);
    obj.NivelHabilidade19:setTop(324);
    obj.NivelHabilidade19:setWidth(20);
    obj.NivelHabilidade19:setHeight(20);

    obj.checkBox121 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.NivelHabilidade19);
    obj.checkBox121:setField("NivelHabilidade19");
    obj.checkBox121:setAlign("top");
    obj.checkBox121:setMargins({top=-15});
    obj.checkBox121:setName("checkBox121");

    obj.NivelHabilidade20 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade20:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade20:setName("NivelHabilidade20");
    obj.NivelHabilidade20:setText("2");
    obj.NivelHabilidade20:setLeft(340);
    obj.NivelHabilidade20:setTop(324);
    obj.NivelHabilidade20:setWidth(20);
    obj.NivelHabilidade20:setHeight(20);

    obj.checkBox122 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.NivelHabilidade20);
    obj.checkBox122:setField("NivelHabilidade20");
    obj.checkBox122:setAlign("top");
    obj.checkBox122:setMargins({top=-15});
    obj.checkBox122:setName("checkBox122");

    obj.NivelHabilidade21 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade21:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade21:setName("NivelHabilidade21");
    obj.NivelHabilidade21:setText("3");
    obj.NivelHabilidade21:setLeft(360);
    obj.NivelHabilidade21:setTop(324);
    obj.NivelHabilidade21:setWidth(20);
    obj.NivelHabilidade21:setHeight(20);

    obj.checkBox123 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.NivelHabilidade21);
    obj.checkBox123:setField("NivelHabilidade21");
    obj.checkBox123:setAlign("top");
    obj.checkBox123:setMargins({top=-15});
    obj.checkBox123:setName("checkBox123");

    obj.NivelHabilidade22 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade22:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade22:setName("NivelHabilidade22");
    obj.NivelHabilidade22:setText("4");
    obj.NivelHabilidade22:setLeft(320);
    obj.NivelHabilidade22:setTop(359);
    obj.NivelHabilidade22:setWidth(20);
    obj.NivelHabilidade22:setHeight(20);

    obj.checkBox124 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.NivelHabilidade22);
    obj.checkBox124:setField("NivelHabilidade22");
    obj.checkBox124:setAlign("top");
    obj.checkBox124:setMargins({top=-15});
    obj.checkBox124:setName("checkBox124");

    obj.NivelHabilidade23 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade23:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade23:setName("NivelHabilidade23");
    obj.NivelHabilidade23:setText("5");
    obj.NivelHabilidade23:setLeft(340);
    obj.NivelHabilidade23:setTop(359);
    obj.NivelHabilidade23:setWidth(20);
    obj.NivelHabilidade23:setHeight(20);

    obj.checkBox125 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.NivelHabilidade23);
    obj.checkBox125:setField("NivelHabilidade23");
    obj.checkBox125:setAlign("top");
    obj.checkBox125:setMargins({top=-15});
    obj.checkBox125:setName("checkBox125");

    obj.NivelHabilidade24 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade24:setParent(obj.InfHabilidades4);
    obj.NivelHabilidade24:setName("NivelHabilidade24");
    obj.NivelHabilidade24:setText("6");
    obj.NivelHabilidade24:setLeft(360);
    obj.NivelHabilidade24:setTop(359);
    obj.NivelHabilidade24:setWidth(20);
    obj.NivelHabilidade24:setHeight(20);

    obj.checkBox126 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.NivelHabilidade24);
    obj.checkBox126:setField("NivelHabilidade24");
    obj.checkBox126:setAlign("top");
    obj.checkBox126:setMargins({top=-15});
    obj.checkBox126:setName("checkBox126");

    obj.InfHabilidades5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades5:setParent(obj.scrollBox1);
    obj.InfHabilidades5:setName("InfHabilidades5");
    obj.InfHabilidades5:setAlign("client");
    obj.InfHabilidades5:setVisible(false);

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.InfHabilidades5);
    obj.button52:setText("VOLTAR");
    lfm_setPropAsString(obj.button52, "fontStyle",  "bold");
    obj.button52:setFontColor("#6495ED");
    obj.button52:setLeft(300);
    obj.button52:setTop(88);
    obj.button52:setWidth(70);
    obj.button52:setHeight(30);
    obj.button52:setName("button52");

    obj.image120 = GUI.fromHandle(_obj_newObject("image"));
    obj.image120:setParent(obj.InfHabilidades5);
    obj.image120:setSRC("/imagens/CirculoNave.png");
    obj.image120:setLeft(293);
    obj.image120:setTop(120);
    obj.image120:setWidth(408);
    obj.image120:setHeight(285);
    obj.image120:setName("image120");

    obj.image121 = GUI.fromHandle(_obj_newObject("image"));
    obj.image121:setParent(obj.InfHabilidades5);
    obj.image121:setSRC("/imagens/nomedaHabilidade.png");
    obj.image121:setLeft(293);
    obj.image121:setTop(119);
    obj.image121:setWidth(218);
    obj.image121:setHeight(43);
    obj.image121:setName("image121");

    obj.image122 = GUI.fromHandle(_obj_newObject("image"));
    obj.image122:setParent(obj.InfHabilidades5);
    obj.image122:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image122:setLeft(297);
    obj.image122:setTop(165);
    obj.image122:setWidth(218);
    obj.image122:setHeight(43);
    obj.image122:setName("image122");

    obj.image123 = GUI.fromHandle(_obj_newObject("image"));
    obj.image123:setParent(obj.InfHabilidades5);
    obj.image123:setSRC("/imagens/niveisDoPoder.png");
    obj.image123:setLeft(235);
    obj.image123:setTop(270);
    obj.image123:setWidth(218);
    obj.image123:setHeight(43);
    obj.image123:setName("image123");

    obj.image124 = GUI.fromHandle(_obj_newObject("image"));
    obj.image124:setParent(obj.InfHabilidades5);
    obj.image124:setSRC("/imagens/Anotações.png");
    obj.image124:setLeft(500);
    obj.image124:setTop(117);
    obj.image124:setWidth(218);
    obj.image124:setHeight(43);
    obj.image124:setName("image124");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.InfHabilidades5);
    obj.edit22:setLeft(306);
    obj.edit22:setTop(149);
    obj.edit22:setWidth(152);
    obj.edit22:setHeight(27);
    obj.edit22:setReadOnly(true);
    obj.edit22:setText("Controle da emoção");
    obj.edit22:setName("edit22");

    obj.textEditor43 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor43:setParent(obj.InfHabilidades5);
    obj.textEditor43:setLeft(306);
    obj.textEditor43:setTop(193);
    obj.textEditor43:setWidth(202);
    obj.textEditor43:setHeight(87);
    obj.textEditor43:setReadOnly(true);
    obj.textEditor43:setText("Estou tão triste, nervoso, estressado, quase perdendo o controle. Basta apenas fechar os olhos e pronto, tudo sumiu tão rápido, agora continue fazendo oque estava fazendo com tranquilidade.\n\n[IMPLA ou APLA]");
    obj.textEditor43:setName("textEditor43");

    obj.textEditor44 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor44:setParent(obj.InfHabilidades5);
    obj.textEditor44:setLeft(520);
    obj.textEditor44:setTop(149);
    obj.textEditor44:setWidth(169);
    obj.textEditor44:setHeight(246);
    obj.textEditor44:setField("Anotações22");
    obj.textEditor44:setName("textEditor44");

    obj.NivelHabilidade25 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade25:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade25:setName("NivelHabilidade25");
    obj.NivelHabilidade25:setText("1");
    obj.NivelHabilidade25:setLeft(320);
    obj.NivelHabilidade25:setTop(324);
    obj.NivelHabilidade25:setWidth(20);
    obj.NivelHabilidade25:setHeight(20);

    obj.checkBox127 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.NivelHabilidade25);
    obj.checkBox127:setField("NivelHabilidade25");
    obj.checkBox127:setAlign("top");
    obj.checkBox127:setMargins({top=-15});
    obj.checkBox127:setName("checkBox127");

    obj.NivelHabilidade26 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade26:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade26:setName("NivelHabilidade26");
    obj.NivelHabilidade26:setText("2");
    obj.NivelHabilidade26:setLeft(340);
    obj.NivelHabilidade26:setTop(324);
    obj.NivelHabilidade26:setWidth(20);
    obj.NivelHabilidade26:setHeight(20);

    obj.checkBox128 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.NivelHabilidade26);
    obj.checkBox128:setField("NivelHabilidade26");
    obj.checkBox128:setAlign("top");
    obj.checkBox128:setMargins({top=-15});
    obj.checkBox128:setName("checkBox128");

    obj.NivelHabilidade27 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade27:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade27:setName("NivelHabilidade27");
    obj.NivelHabilidade27:setText("3");
    obj.NivelHabilidade27:setLeft(360);
    obj.NivelHabilidade27:setTop(324);
    obj.NivelHabilidade27:setWidth(20);
    obj.NivelHabilidade27:setHeight(20);

    obj.checkBox129 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.NivelHabilidade27);
    obj.checkBox129:setField("NivelHabilidade27");
    obj.checkBox129:setAlign("top");
    obj.checkBox129:setMargins({top=-15});
    obj.checkBox129:setName("checkBox129");

    obj.NivelHabilidade28 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade28:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade28:setName("NivelHabilidade28");
    obj.NivelHabilidade28:setText("4");
    obj.NivelHabilidade28:setLeft(320);
    obj.NivelHabilidade28:setTop(359);
    obj.NivelHabilidade28:setWidth(20);
    obj.NivelHabilidade28:setHeight(20);

    obj.checkBox130 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.NivelHabilidade28);
    obj.checkBox130:setField("NivelHabilidade28");
    obj.checkBox130:setAlign("top");
    obj.checkBox130:setMargins({top=-15});
    obj.checkBox130:setName("checkBox130");

    obj.NivelHabilidade29 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade29:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade29:setName("NivelHabilidade29");
    obj.NivelHabilidade29:setText("5");
    obj.NivelHabilidade29:setLeft(340);
    obj.NivelHabilidade29:setTop(359);
    obj.NivelHabilidade29:setWidth(20);
    obj.NivelHabilidade29:setHeight(20);

    obj.checkBox131 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.NivelHabilidade29);
    obj.checkBox131:setField("NivelHabilidade29");
    obj.checkBox131:setAlign("top");
    obj.checkBox131:setMargins({top=-15});
    obj.checkBox131:setName("checkBox131");

    obj.NivelHabilidade30 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade30:setParent(obj.InfHabilidades5);
    obj.NivelHabilidade30:setName("NivelHabilidade30");
    obj.NivelHabilidade30:setText("6");
    obj.NivelHabilidade30:setLeft(360);
    obj.NivelHabilidade30:setTop(359);
    obj.NivelHabilidade30:setWidth(20);
    obj.NivelHabilidade30:setHeight(20);

    obj.checkBox132 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.NivelHabilidade30);
    obj.checkBox132:setField("NivelHabilidade30");
    obj.checkBox132:setAlign("top");
    obj.checkBox132:setMargins({top=-15});
    obj.checkBox132:setName("checkBox132");

    obj.InfHabilidades6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades6:setParent(obj.scrollBox1);
    obj.InfHabilidades6:setName("InfHabilidades6");
    obj.InfHabilidades6:setAlign("client");
    obj.InfHabilidades6:setVisible(false);

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.InfHabilidades6);
    obj.button53:setText("VOLTAR");
    lfm_setPropAsString(obj.button53, "fontStyle",  "bold");
    obj.button53:setFontColor("#6495ED");
    obj.button53:setLeft(300);
    obj.button53:setTop(88);
    obj.button53:setWidth(70);
    obj.button53:setHeight(30);
    obj.button53:setName("button53");

    obj.image125 = GUI.fromHandle(_obj_newObject("image"));
    obj.image125:setParent(obj.InfHabilidades6);
    obj.image125:setSRC("/imagens/CirculoNave.png");
    obj.image125:setLeft(293);
    obj.image125:setTop(120);
    obj.image125:setWidth(408);
    obj.image125:setHeight(285);
    obj.image125:setName("image125");

    obj.image126 = GUI.fromHandle(_obj_newObject("image"));
    obj.image126:setParent(obj.InfHabilidades6);
    obj.image126:setSRC("/imagens/nomedaHabilidade.png");
    obj.image126:setLeft(293);
    obj.image126:setTop(119);
    obj.image126:setWidth(218);
    obj.image126:setHeight(43);
    obj.image126:setName("image126");

    obj.image127 = GUI.fromHandle(_obj_newObject("image"));
    obj.image127:setParent(obj.InfHabilidades6);
    obj.image127:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image127:setLeft(297);
    obj.image127:setTop(165);
    obj.image127:setWidth(218);
    obj.image127:setHeight(43);
    obj.image127:setName("image127");

    obj.image128 = GUI.fromHandle(_obj_newObject("image"));
    obj.image128:setParent(obj.InfHabilidades6);
    obj.image128:setSRC("/imagens/niveisDoPoder.png");
    obj.image128:setLeft(235);
    obj.image128:setTop(270);
    obj.image128:setWidth(218);
    obj.image128:setHeight(43);
    obj.image128:setName("image128");

    obj.image129 = GUI.fromHandle(_obj_newObject("image"));
    obj.image129:setParent(obj.InfHabilidades6);
    obj.image129:setSRC("/imagens/Anotações.png");
    obj.image129:setLeft(500);
    obj.image129:setTop(117);
    obj.image129:setWidth(218);
    obj.image129:setHeight(43);
    obj.image129:setName("image129");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.InfHabilidades6);
    obj.edit23:setLeft(306);
    obj.edit23:setTop(149);
    obj.edit23:setWidth(152);
    obj.edit23:setHeight(27);
    obj.edit23:setReadOnly(true);
    obj.edit23:setText("Controle de animais");
    obj.edit23:setName("edit23");

    obj.textEditor45 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor45:setParent(obj.InfHabilidades6);
    obj.textEditor45:setLeft(306);
    obj.textEditor45:setTop(193);
    obj.textEditor45:setWidth(202);
    obj.textEditor45:setHeight(87);
    obj.textEditor45:setReadOnly(true);
    obj.textEditor45:setText("Posso fazer com que cães, cobras, ou outros tipos de animais, me obedeça, com apenas um olhar.\n\n[IMPLA]");
    obj.textEditor45:setName("textEditor45");

    obj.textEditor46 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor46:setParent(obj.InfHabilidades6);
    obj.textEditor46:setLeft(520);
    obj.textEditor46:setTop(149);
    obj.textEditor46:setWidth(169);
    obj.textEditor46:setHeight(246);
    obj.textEditor46:setField("Anotações23");
    obj.textEditor46:setName("textEditor46");

    obj.NivelHabilidade31 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade31:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade31:setName("NivelHabilidade31");
    obj.NivelHabilidade31:setText("1");
    obj.NivelHabilidade31:setLeft(320);
    obj.NivelHabilidade31:setTop(324);
    obj.NivelHabilidade31:setWidth(20);
    obj.NivelHabilidade31:setHeight(20);

    obj.checkBox133 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.NivelHabilidade31);
    obj.checkBox133:setField("NivelHabilidade31");
    obj.checkBox133:setAlign("top");
    obj.checkBox133:setMargins({top=-15});
    obj.checkBox133:setName("checkBox133");

    obj.NivelHabilidade32 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade32:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade32:setName("NivelHabilidade32");
    obj.NivelHabilidade32:setText("2");
    obj.NivelHabilidade32:setLeft(340);
    obj.NivelHabilidade32:setTop(324);
    obj.NivelHabilidade32:setWidth(20);
    obj.NivelHabilidade32:setHeight(20);

    obj.checkBox134 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.NivelHabilidade32);
    obj.checkBox134:setField("NivelHabilidade32");
    obj.checkBox134:setAlign("top");
    obj.checkBox134:setMargins({top=-15});
    obj.checkBox134:setName("checkBox134");

    obj.NivelHabilidade33 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade33:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade33:setName("NivelHabilidade33");
    obj.NivelHabilidade33:setText("3");
    obj.NivelHabilidade33:setLeft(360);
    obj.NivelHabilidade33:setTop(324);
    obj.NivelHabilidade33:setWidth(20);
    obj.NivelHabilidade33:setHeight(20);

    obj.checkBox135 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.NivelHabilidade33);
    obj.checkBox135:setField("NivelHabilidade33");
    obj.checkBox135:setAlign("top");
    obj.checkBox135:setMargins({top=-15});
    obj.checkBox135:setName("checkBox135");

    obj.NivelHabilidade34 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade34:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade34:setName("NivelHabilidade34");
    obj.NivelHabilidade34:setText("4");
    obj.NivelHabilidade34:setLeft(320);
    obj.NivelHabilidade34:setTop(359);
    obj.NivelHabilidade34:setWidth(20);
    obj.NivelHabilidade34:setHeight(20);

    obj.checkBox136 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.NivelHabilidade34);
    obj.checkBox136:setField("NivelHabilidade34");
    obj.checkBox136:setAlign("top");
    obj.checkBox136:setMargins({top=-15});
    obj.checkBox136:setName("checkBox136");

    obj.NivelHabilidade35 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade35:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade35:setName("NivelHabilidade35");
    obj.NivelHabilidade35:setText("5");
    obj.NivelHabilidade35:setLeft(340);
    obj.NivelHabilidade35:setTop(359);
    obj.NivelHabilidade35:setWidth(20);
    obj.NivelHabilidade35:setHeight(20);

    obj.checkBox137 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.NivelHabilidade35);
    obj.checkBox137:setField("NivelHabilidade35");
    obj.checkBox137:setAlign("top");
    obj.checkBox137:setMargins({top=-15});
    obj.checkBox137:setName("checkBox137");

    obj.NivelHabilidade36 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade36:setParent(obj.InfHabilidades6);
    obj.NivelHabilidade36:setName("NivelHabilidade36");
    obj.NivelHabilidade36:setText("6");
    obj.NivelHabilidade36:setLeft(360);
    obj.NivelHabilidade36:setTop(359);
    obj.NivelHabilidade36:setWidth(20);
    obj.NivelHabilidade36:setHeight(20);

    obj.checkBox138 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.NivelHabilidade36);
    obj.checkBox138:setField("NivelHabilidade36");
    obj.checkBox138:setAlign("top");
    obj.checkBox138:setMargins({top=-15});
    obj.checkBox138:setName("checkBox138");

    obj.InfHabilidades7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades7:setParent(obj.scrollBox1);
    obj.InfHabilidades7:setName("InfHabilidades7");
    obj.InfHabilidades7:setAlign("client");
    obj.InfHabilidades7:setVisible(false);

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.InfHabilidades7);
    obj.button54:setText("VOLTAR");
    lfm_setPropAsString(obj.button54, "fontStyle",  "bold");
    obj.button54:setFontColor("#6495ED");
    obj.button54:setLeft(300);
    obj.button54:setTop(88);
    obj.button54:setWidth(70);
    obj.button54:setHeight(30);
    obj.button54:setName("button54");

    obj.image130 = GUI.fromHandle(_obj_newObject("image"));
    obj.image130:setParent(obj.InfHabilidades7);
    obj.image130:setSRC("/imagens/CirculoNave.png");
    obj.image130:setLeft(293);
    obj.image130:setTop(120);
    obj.image130:setWidth(408);
    obj.image130:setHeight(285);
    obj.image130:setName("image130");

    obj.image131 = GUI.fromHandle(_obj_newObject("image"));
    obj.image131:setParent(obj.InfHabilidades7);
    obj.image131:setSRC("/imagens/nomedaHabilidade.png");
    obj.image131:setLeft(293);
    obj.image131:setTop(119);
    obj.image131:setWidth(218);
    obj.image131:setHeight(43);
    obj.image131:setName("image131");

    obj.image132 = GUI.fromHandle(_obj_newObject("image"));
    obj.image132:setParent(obj.InfHabilidades7);
    obj.image132:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image132:setLeft(297);
    obj.image132:setTop(165);
    obj.image132:setWidth(218);
    obj.image132:setHeight(43);
    obj.image132:setName("image132");

    obj.image133 = GUI.fromHandle(_obj_newObject("image"));
    obj.image133:setParent(obj.InfHabilidades7);
    obj.image133:setSRC("/imagens/niveisDoPoder.png");
    obj.image133:setLeft(235);
    obj.image133:setTop(270);
    obj.image133:setWidth(218);
    obj.image133:setHeight(43);
    obj.image133:setName("image133");

    obj.image134 = GUI.fromHandle(_obj_newObject("image"));
    obj.image134:setParent(obj.InfHabilidades7);
    obj.image134:setSRC("/imagens/Anotações.png");
    obj.image134:setLeft(500);
    obj.image134:setTop(117);
    obj.image134:setWidth(218);
    obj.image134:setHeight(43);
    obj.image134:setName("image134");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.InfHabilidades7);
    obj.edit24:setLeft(306);
    obj.edit24:setTop(149);
    obj.edit24:setWidth(152);
    obj.edit24:setHeight(27);
    obj.edit24:setReadOnly(true);
    obj.edit24:setText("Analise");
    obj.edit24:setName("edit24");

    obj.textEditor47 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor47:setParent(obj.InfHabilidades7);
    obj.textEditor47:setLeft(306);
    obj.textEditor47:setTop(193);
    obj.textEditor47:setWidth(202);
    obj.textEditor47:setHeight(87);
    obj.textEditor47:setReadOnly(true);
    obj.textEditor47:setText("Posso resolver um caso policial com apenas um olhar, sabendo assim que aquelas mínis moléculas que estavam em sua jaqueta seja o sangue de um inocente, isso faz de mim um analista de primeira. \n\n[APLA ou IMPLA]");
    obj.textEditor47:setName("textEditor47");

    obj.textEditor48 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor48:setParent(obj.InfHabilidades7);
    obj.textEditor48:setLeft(520);
    obj.textEditor48:setTop(149);
    obj.textEditor48:setWidth(169);
    obj.textEditor48:setHeight(246);
    obj.textEditor48:setField("Anotações24");
    obj.textEditor48:setName("textEditor48");

    obj.NivelHabilidade37 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade37:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade37:setName("NivelHabilidade37");
    obj.NivelHabilidade37:setText("1");
    obj.NivelHabilidade37:setLeft(320);
    obj.NivelHabilidade37:setTop(324);
    obj.NivelHabilidade37:setWidth(20);
    obj.NivelHabilidade37:setHeight(20);

    obj.checkBox139 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.NivelHabilidade37);
    obj.checkBox139:setField("NivelHabilidade37");
    obj.checkBox139:setAlign("top");
    obj.checkBox139:setMargins({top=-15});
    obj.checkBox139:setName("checkBox139");

    obj.NivelHabilidade38 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade38:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade38:setName("NivelHabilidade38");
    obj.NivelHabilidade38:setText("2");
    obj.NivelHabilidade38:setLeft(340);
    obj.NivelHabilidade38:setTop(324);
    obj.NivelHabilidade38:setWidth(20);
    obj.NivelHabilidade38:setHeight(20);

    obj.checkBox140 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.NivelHabilidade38);
    obj.checkBox140:setField("NivelHabilidade38");
    obj.checkBox140:setAlign("top");
    obj.checkBox140:setMargins({top=-15});
    obj.checkBox140:setName("checkBox140");

    obj.NivelHabilidade39 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade39:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade39:setName("NivelHabilidade39");
    obj.NivelHabilidade39:setText("3");
    obj.NivelHabilidade39:setLeft(360);
    obj.NivelHabilidade39:setTop(324);
    obj.NivelHabilidade39:setWidth(20);
    obj.NivelHabilidade39:setHeight(20);

    obj.checkBox141 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.NivelHabilidade39);
    obj.checkBox141:setField("NivelHabilidade39");
    obj.checkBox141:setAlign("top");
    obj.checkBox141:setMargins({top=-15});
    obj.checkBox141:setName("checkBox141");

    obj.NivelHabilidade40 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade40:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade40:setName("NivelHabilidade40");
    obj.NivelHabilidade40:setText("4");
    obj.NivelHabilidade40:setLeft(320);
    obj.NivelHabilidade40:setTop(359);
    obj.NivelHabilidade40:setWidth(20);
    obj.NivelHabilidade40:setHeight(20);

    obj.checkBox142 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.NivelHabilidade40);
    obj.checkBox142:setField("NivelHabilidade40");
    obj.checkBox142:setAlign("top");
    obj.checkBox142:setMargins({top=-15});
    obj.checkBox142:setName("checkBox142");

    obj.NivelHabilidade41 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade41:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade41:setName("NivelHabilidade41");
    obj.NivelHabilidade41:setText("5");
    obj.NivelHabilidade41:setLeft(340);
    obj.NivelHabilidade41:setTop(359);
    obj.NivelHabilidade41:setWidth(20);
    obj.NivelHabilidade41:setHeight(20);

    obj.checkBox143 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.NivelHabilidade41);
    obj.checkBox143:setField("NivelHabilidade41");
    obj.checkBox143:setAlign("top");
    obj.checkBox143:setMargins({top=-15});
    obj.checkBox143:setName("checkBox143");

    obj.NivelHabilidade42 = GUI.fromHandle(_obj_newObject("button"));
    obj.NivelHabilidade42:setParent(obj.InfHabilidades7);
    obj.NivelHabilidade42:setName("NivelHabilidade42");
    obj.NivelHabilidade42:setText("6");
    obj.NivelHabilidade42:setLeft(360);
    obj.NivelHabilidade42:setTop(359);
    obj.NivelHabilidade42:setWidth(20);
    obj.NivelHabilidade42:setHeight(20);

    obj.checkBox144 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.NivelHabilidade42);
    obj.checkBox144:setField("NivelHabilidade42");
    obj.checkBox144:setAlign("top");
    obj.checkBox144:setMargins({top=-15});
    obj.checkBox144:setName("checkBox144");

    obj.InfHabilidades8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades8:setParent(obj.scrollBox1);
    obj.InfHabilidades8:setName("InfHabilidades8");
    obj.InfHabilidades8:setAlign("client");
    obj.InfHabilidades8:setVisible(false);

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.InfHabilidades8);
    obj.button55:setText("VOLTAR");
    lfm_setPropAsString(obj.button55, "fontStyle",  "bold");
    obj.button55:setFontColor("#6495ED");
    obj.button55:setLeft(300);
    obj.button55:setTop(88);
    obj.button55:setWidth(70);
    obj.button55:setHeight(30);
    obj.button55:setName("button55");

    obj.image135 = GUI.fromHandle(_obj_newObject("image"));
    obj.image135:setParent(obj.InfHabilidades8);
    obj.image135:setSRC("/imagens/CirculoNave.png");
    obj.image135:setLeft(293);
    obj.image135:setTop(120);
    obj.image135:setWidth(408);
    obj.image135:setHeight(285);
    obj.image135:setName("image135");

    obj.image136 = GUI.fromHandle(_obj_newObject("image"));
    obj.image136:setParent(obj.InfHabilidades8);
    obj.image136:setSRC("/imagens/nomedaHabilidade.png");
    obj.image136:setLeft(293);
    obj.image136:setTop(119);
    obj.image136:setWidth(218);
    obj.image136:setHeight(43);
    obj.image136:setName("image136");

    obj.image137 = GUI.fromHandle(_obj_newObject("image"));
    obj.image137:setParent(obj.InfHabilidades8);
    obj.image137:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image137:setLeft(297);
    obj.image137:setTop(165);
    obj.image137:setWidth(218);
    obj.image137:setHeight(43);
    obj.image137:setName("image137");

    obj.image138 = GUI.fromHandle(_obj_newObject("image"));
    obj.image138:setParent(obj.InfHabilidades8);
    obj.image138:setSRC("/imagens/niveisDoPoder.png");
    obj.image138:setLeft(235);
    obj.image138:setTop(270);
    obj.image138:setWidth(218);
    obj.image138:setHeight(43);
    obj.image138:setName("image138");

    obj.image139 = GUI.fromHandle(_obj_newObject("image"));
    obj.image139:setParent(obj.InfHabilidades8);
    obj.image139:setSRC("/imagens/Anotações.png");
    obj.image139:setLeft(500);
    obj.image139:setTop(117);
    obj.image139:setWidth(218);
    obj.image139:setHeight(43);
    obj.image139:setName("image139");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.InfHabilidades8);
    obj.edit25:setLeft(306);
    obj.edit25:setTop(149);
    obj.edit25:setWidth(152);
    obj.edit25:setHeight(27);
    obj.edit25:setReadOnly(true);
    obj.edit25:setText("Movimentos");
    obj.edit25:setName("edit25");

    obj.textEditor49 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor49:setParent(obj.InfHabilidades8);
    obj.textEditor49:setLeft(306);
    obj.textEditor49:setTop(193);
    obj.textEditor49:setWidth(202);
    obj.textEditor49:setHeight(87);
    obj.textEditor49:setReadOnly(true);
    obj.textEditor49:setText("Quem não gostaria de sair pulando de prédio em prédio como a mulher gato? Com movimentos, você pode aprender qualquer tipo de movimento e imitar, sendo parkour ou algum tipo de luta.\n\n[IMPLA ou APLA]");
    obj.textEditor49:setName("textEditor49");

    obj.textEditor50 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor50:setParent(obj.InfHabilidades8);
    obj.textEditor50:setLeft(520);
    obj.textEditor50:setTop(149);
    obj.textEditor50:setWidth(169);
    obj.textEditor50:setHeight(246);
    obj.textEditor50:setField("Anotações24");
    obj.textEditor50:setName("textEditor50");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.InfHabilidades8);
    obj.button56:setText("1");
    obj.button56:setLeft(320);
    obj.button56:setTop(324);
    obj.button56:setWidth(20);
    obj.button56:setHeight(20);
    obj.button56:setName("button56");

    obj.checkBox145 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.button56);
    obj.checkBox145:setField("NivelHabilidade43");
    obj.checkBox145:setAlign("top");
    obj.checkBox145:setMargins({top=-15});
    obj.checkBox145:setName("checkBox145");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.InfHabilidades8);
    obj.button57:setText("2");
    obj.button57:setLeft(340);
    obj.button57:setTop(324);
    obj.button57:setWidth(20);
    obj.button57:setHeight(20);
    obj.button57:setName("button57");

    obj.checkBox146 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.button57);
    obj.checkBox146:setField("NivelHabilidade44");
    obj.checkBox146:setAlign("top");
    obj.checkBox146:setMargins({top=-15});
    obj.checkBox146:setName("checkBox146");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.InfHabilidades8);
    obj.button58:setText("3");
    obj.button58:setLeft(360);
    obj.button58:setTop(324);
    obj.button58:setWidth(20);
    obj.button58:setHeight(20);
    obj.button58:setName("button58");

    obj.checkBox147 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.button58);
    obj.checkBox147:setField("NivelHabilidade45");
    obj.checkBox147:setAlign("top");
    obj.checkBox147:setMargins({top=-15});
    obj.checkBox147:setName("checkBox147");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.InfHabilidades8);
    obj.button59:setText("4");
    obj.button59:setLeft(320);
    obj.button59:setTop(359);
    obj.button59:setWidth(20);
    obj.button59:setHeight(20);
    obj.button59:setName("button59");

    obj.checkBox148 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.button59);
    obj.checkBox148:setField("NivelHabilidade46");
    obj.checkBox148:setAlign("top");
    obj.checkBox148:setMargins({top=-15});
    obj.checkBox148:setName("checkBox148");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.InfHabilidades8);
    obj.button60:setText("5");
    obj.button60:setLeft(340);
    obj.button60:setTop(359);
    obj.button60:setWidth(20);
    obj.button60:setHeight(20);
    obj.button60:setName("button60");

    obj.checkBox149 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.button60);
    obj.checkBox149:setField("NivelHabilidade47");
    obj.checkBox149:setAlign("top");
    obj.checkBox149:setMargins({top=-15});
    obj.checkBox149:setName("checkBox149");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.InfHabilidades8);
    obj.button61:setText("6");
    obj.button61:setLeft(360);
    obj.button61:setTop(359);
    obj.button61:setWidth(20);
    obj.button61:setHeight(20);
    obj.button61:setName("button61");

    obj.checkBox150 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.button61);
    obj.checkBox150:setField("NivelHabilidade48");
    obj.checkBox150:setAlign("top");
    obj.checkBox150:setMargins({top=-15});
    obj.checkBox150:setName("checkBox150");

    obj.InfHabilidades9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades9:setParent(obj.scrollBox1);
    obj.InfHabilidades9:setName("InfHabilidades9");
    obj.InfHabilidades9:setAlign("client");
    obj.InfHabilidades9:setVisible(false);

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.InfHabilidades9);
    obj.button62:setText("VOLTAR");
    lfm_setPropAsString(obj.button62, "fontStyle",  "bold");
    obj.button62:setFontColor("#6495ED");
    obj.button62:setLeft(300);
    obj.button62:setTop(88);
    obj.button62:setWidth(70);
    obj.button62:setHeight(30);
    obj.button62:setName("button62");

    obj.image140 = GUI.fromHandle(_obj_newObject("image"));
    obj.image140:setParent(obj.InfHabilidades9);
    obj.image140:setSRC("/imagens/CirculoNave.png");
    obj.image140:setLeft(293);
    obj.image140:setTop(120);
    obj.image140:setWidth(408);
    obj.image140:setHeight(285);
    obj.image140:setName("image140");

    obj.image141 = GUI.fromHandle(_obj_newObject("image"));
    obj.image141:setParent(obj.InfHabilidades9);
    obj.image141:setSRC("/imagens/nomedaHabilidade.png");
    obj.image141:setLeft(293);
    obj.image141:setTop(119);
    obj.image141:setWidth(218);
    obj.image141:setHeight(43);
    obj.image141:setName("image141");

    obj.image142 = GUI.fromHandle(_obj_newObject("image"));
    obj.image142:setParent(obj.InfHabilidades9);
    obj.image142:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image142:setLeft(297);
    obj.image142:setTop(165);
    obj.image142:setWidth(218);
    obj.image142:setHeight(43);
    obj.image142:setName("image142");

    obj.image143 = GUI.fromHandle(_obj_newObject("image"));
    obj.image143:setParent(obj.InfHabilidades9);
    obj.image143:setSRC("/imagens/niveisDoPoder.png");
    obj.image143:setLeft(235);
    obj.image143:setTop(270);
    obj.image143:setWidth(218);
    obj.image143:setHeight(43);
    obj.image143:setName("image143");

    obj.image144 = GUI.fromHandle(_obj_newObject("image"));
    obj.image144:setParent(obj.InfHabilidades9);
    obj.image144:setSRC("/imagens/Anotações.png");
    obj.image144:setLeft(500);
    obj.image144:setTop(117);
    obj.image144:setWidth(218);
    obj.image144:setHeight(43);
    obj.image144:setName("image144");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.InfHabilidades9);
    obj.edit26:setLeft(306);
    obj.edit26:setTop(149);
    obj.edit26:setWidth(152);
    obj.edit26:setHeight(27);
    obj.edit26:setReadOnly(true);
    obj.edit26:setText("Auto cura");
    obj.edit26:setName("edit26");

    obj.textEditor51 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor51:setParent(obj.InfHabilidades9);
    obj.textEditor51:setLeft(306);
    obj.textEditor51:setTop(193);
    obj.textEditor51:setWidth(202);
    obj.textEditor51:setHeight(87);
    obj.textEditor51:setReadOnly(true);
    obj.textEditor51:setText("Sendo um IMPLA ou um APLA, eu posso simplesmente me curar, não preciso de médicos mediócres, eu sou a própria definição de saudê.\n\n[IMPLA ou APLA]");
    obj.textEditor51:setName("textEditor51");

    obj.textEditor52 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor52:setParent(obj.InfHabilidades9);
    obj.textEditor52:setLeft(520);
    obj.textEditor52:setTop(149);
    obj.textEditor52:setWidth(169);
    obj.textEditor52:setHeight(246);
    obj.textEditor52:setField("Anotações25");
    obj.textEditor52:setName("textEditor52");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.InfHabilidades9);
    obj.button63:setText("1");
    obj.button63:setLeft(320);
    obj.button63:setTop(324);
    obj.button63:setWidth(20);
    obj.button63:setHeight(20);
    obj.button63:setName("button63");

    obj.checkBox151 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.button63);
    obj.checkBox151:setField("NivelHabilidade49");
    obj.checkBox151:setAlign("top");
    obj.checkBox151:setMargins({top=-15});
    obj.checkBox151:setName("checkBox151");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.InfHabilidades9);
    obj.button64:setText("2");
    obj.button64:setLeft(340);
    obj.button64:setTop(324);
    obj.button64:setWidth(20);
    obj.button64:setHeight(20);
    obj.button64:setName("button64");

    obj.checkBox152 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.button64);
    obj.checkBox152:setField("NivelHabilidade50");
    obj.checkBox152:setAlign("top");
    obj.checkBox152:setMargins({top=-15});
    obj.checkBox152:setName("checkBox152");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.InfHabilidades9);
    obj.button65:setText("3");
    obj.button65:setLeft(360);
    obj.button65:setTop(324);
    obj.button65:setWidth(20);
    obj.button65:setHeight(20);
    obj.button65:setName("button65");

    obj.checkBox153 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.button65);
    obj.checkBox153:setField("NivelHabilidade51");
    obj.checkBox153:setAlign("top");
    obj.checkBox153:setMargins({top=-15});
    obj.checkBox153:setName("checkBox153");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.InfHabilidades9);
    obj.button66:setText("4");
    obj.button66:setLeft(320);
    obj.button66:setTop(359);
    obj.button66:setWidth(20);
    obj.button66:setHeight(20);
    obj.button66:setName("button66");

    obj.checkBox154 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.button66);
    obj.checkBox154:setField("NivelHabilidade52");
    obj.checkBox154:setAlign("top");
    obj.checkBox154:setMargins({top=-15});
    obj.checkBox154:setName("checkBox154");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.InfHabilidades9);
    obj.button67:setText("5");
    obj.button67:setLeft(340);
    obj.button67:setTop(359);
    obj.button67:setWidth(20);
    obj.button67:setHeight(20);
    obj.button67:setName("button67");

    obj.checkBox155 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.button67);
    obj.checkBox155:setField("NivelHabilidade53");
    obj.checkBox155:setAlign("top");
    obj.checkBox155:setMargins({top=-15});
    obj.checkBox155:setName("checkBox155");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.InfHabilidades9);
    obj.button68:setText("6");
    obj.button68:setLeft(360);
    obj.button68:setTop(359);
    obj.button68:setWidth(20);
    obj.button68:setHeight(20);
    obj.button68:setName("button68");

    obj.checkBox156 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.button68);
    obj.checkBox156:setField("NivelHabilidade54");
    obj.checkBox156:setAlign("top");
    obj.checkBox156:setMargins({top=-15});
    obj.checkBox156:setName("checkBox156");

    obj.InfHabilidades10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades10:setParent(obj.scrollBox1);
    obj.InfHabilidades10:setName("InfHabilidades10");
    obj.InfHabilidades10:setAlign("client");
    obj.InfHabilidades10:setVisible(false);

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.InfHabilidades10);
    obj.button69:setText("VOLTAR");
    lfm_setPropAsString(obj.button69, "fontStyle",  "bold");
    obj.button69:setFontColor("#6495ED");
    obj.button69:setLeft(300);
    obj.button69:setTop(88);
    obj.button69:setWidth(70);
    obj.button69:setHeight(30);
    obj.button69:setName("button69");

    obj.image145 = GUI.fromHandle(_obj_newObject("image"));
    obj.image145:setParent(obj.InfHabilidades10);
    obj.image145:setSRC("/imagens/CirculoNave.png");
    obj.image145:setLeft(293);
    obj.image145:setTop(120);
    obj.image145:setWidth(408);
    obj.image145:setHeight(285);
    obj.image145:setName("image145");

    obj.image146 = GUI.fromHandle(_obj_newObject("image"));
    obj.image146:setParent(obj.InfHabilidades10);
    obj.image146:setSRC("/imagens/nomedaHabilidade.png");
    obj.image146:setLeft(293);
    obj.image146:setTop(119);
    obj.image146:setWidth(218);
    obj.image146:setHeight(43);
    obj.image146:setName("image146");

    obj.image147 = GUI.fromHandle(_obj_newObject("image"));
    obj.image147:setParent(obj.InfHabilidades10);
    obj.image147:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image147:setLeft(297);
    obj.image147:setTop(165);
    obj.image147:setWidth(218);
    obj.image147:setHeight(43);
    obj.image147:setName("image147");

    obj.image148 = GUI.fromHandle(_obj_newObject("image"));
    obj.image148:setParent(obj.InfHabilidades10);
    obj.image148:setSRC("/imagens/niveisDoPoder.png");
    obj.image148:setLeft(235);
    obj.image148:setTop(270);
    obj.image148:setWidth(218);
    obj.image148:setHeight(43);
    obj.image148:setName("image148");

    obj.image149 = GUI.fromHandle(_obj_newObject("image"));
    obj.image149:setParent(obj.InfHabilidades10);
    obj.image149:setSRC("/imagens/Anotações.png");
    obj.image149:setLeft(500);
    obj.image149:setTop(117);
    obj.image149:setWidth(218);
    obj.image149:setHeight(43);
    obj.image149:setName("image149");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.InfHabilidades10);
    obj.edit27:setLeft(306);
    obj.edit27:setTop(149);
    obj.edit27:setWidth(152);
    obj.edit27:setHeight(27);
    obj.edit27:setReadOnly(true);
    obj.edit27:setText("Atravessar parede");
    obj.edit27:setName("edit27");

    obj.textEditor53 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor53:setParent(obj.InfHabilidades10);
    obj.textEditor53:setLeft(306);
    obj.textEditor53:setTop(193);
    obj.textEditor53:setWidth(202);
    obj.textEditor53:setHeight(87);
    obj.textEditor53:setReadOnly(true);
    obj.textEditor53:setText("Se imagine atravessando uma parede, seria uma forma mais rápida de fugir de uma cadeia, ou até mesmo chegar em lugares, roubar um banco.\n\n[IMPLA]");
    obj.textEditor53:setName("textEditor53");

    obj.textEditor54 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor54:setParent(obj.InfHabilidades10);
    obj.textEditor54:setLeft(520);
    obj.textEditor54:setTop(149);
    obj.textEditor54:setWidth(169);
    obj.textEditor54:setHeight(246);
    obj.textEditor54:setField("Anotações25");
    obj.textEditor54:setName("textEditor54");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.InfHabilidades10);
    obj.button70:setText("1");
    obj.button70:setLeft(320);
    obj.button70:setTop(324);
    obj.button70:setWidth(20);
    obj.button70:setHeight(20);
    obj.button70:setName("button70");

    obj.checkBox157 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.button70);
    obj.checkBox157:setField("NivelHabilidade55");
    obj.checkBox157:setAlign("top");
    obj.checkBox157:setMargins({top=-15});
    obj.checkBox157:setName("checkBox157");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.InfHabilidades10);
    obj.button71:setText("2");
    obj.button71:setLeft(340);
    obj.button71:setTop(324);
    obj.button71:setWidth(20);
    obj.button71:setHeight(20);
    obj.button71:setName("button71");

    obj.checkBox158 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.button71);
    obj.checkBox158:setField("NivelHabilidade56");
    obj.checkBox158:setAlign("top");
    obj.checkBox158:setMargins({top=-15});
    obj.checkBox158:setName("checkBox158");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.InfHabilidades10);
    obj.button72:setText("3");
    obj.button72:setLeft(360);
    obj.button72:setTop(324);
    obj.button72:setWidth(20);
    obj.button72:setHeight(20);
    obj.button72:setName("button72");

    obj.checkBox159 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.button72);
    obj.checkBox159:setField("NivelHabilidade57");
    obj.checkBox159:setAlign("top");
    obj.checkBox159:setMargins({top=-15});
    obj.checkBox159:setName("checkBox159");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.InfHabilidades10);
    obj.button73:setText("4");
    obj.button73:setLeft(320);
    obj.button73:setTop(359);
    obj.button73:setWidth(20);
    obj.button73:setHeight(20);
    obj.button73:setName("button73");

    obj.checkBox160 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.button73);
    obj.checkBox160:setField("NivelHabilidade58");
    obj.checkBox160:setAlign("top");
    obj.checkBox160:setMargins({top=-15});
    obj.checkBox160:setName("checkBox160");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.InfHabilidades10);
    obj.button74:setText("5");
    obj.button74:setLeft(340);
    obj.button74:setTop(359);
    obj.button74:setWidth(20);
    obj.button74:setHeight(20);
    obj.button74:setName("button74");

    obj.checkBox161 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.button74);
    obj.checkBox161:setField("NivelHabilidade59");
    obj.checkBox161:setAlign("top");
    obj.checkBox161:setMargins({top=-15});
    obj.checkBox161:setName("checkBox161");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.InfHabilidades10);
    obj.button75:setText("6");
    obj.button75:setLeft(360);
    obj.button75:setTop(359);
    obj.button75:setWidth(20);
    obj.button75:setHeight(20);
    obj.button75:setName("button75");

    obj.checkBox162 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.button75);
    obj.checkBox162:setField("NivelHabilidade60");
    obj.checkBox162:setAlign("top");
    obj.checkBox162:setMargins({top=-15});
    obj.checkBox162:setName("checkBox162");

    obj.InfHabilidades11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades11:setParent(obj.scrollBox1);
    obj.InfHabilidades11:setName("InfHabilidades11");
    obj.InfHabilidades11:setAlign("client");
    obj.InfHabilidades11:setVisible(false);

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.InfHabilidades11);
    obj.button76:setText("VOLTAR");
    lfm_setPropAsString(obj.button76, "fontStyle",  "bold");
    obj.button76:setFontColor("#6495ED");
    obj.button76:setLeft(300);
    obj.button76:setTop(88);
    obj.button76:setWidth(70);
    obj.button76:setHeight(30);
    obj.button76:setName("button76");

    obj.image150 = GUI.fromHandle(_obj_newObject("image"));
    obj.image150:setParent(obj.InfHabilidades11);
    obj.image150:setSRC("/imagens/CirculoNave.png");
    obj.image150:setLeft(293);
    obj.image150:setTop(120);
    obj.image150:setWidth(408);
    obj.image150:setHeight(285);
    obj.image150:setName("image150");

    obj.image151 = GUI.fromHandle(_obj_newObject("image"));
    obj.image151:setParent(obj.InfHabilidades11);
    obj.image151:setSRC("/imagens/nomedaHabilidade.png");
    obj.image151:setLeft(293);
    obj.image151:setTop(119);
    obj.image151:setWidth(218);
    obj.image151:setHeight(43);
    obj.image151:setName("image151");

    obj.image152 = GUI.fromHandle(_obj_newObject("image"));
    obj.image152:setParent(obj.InfHabilidades11);
    obj.image152:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image152:setLeft(297);
    obj.image152:setTop(165);
    obj.image152:setWidth(218);
    obj.image152:setHeight(43);
    obj.image152:setName("image152");

    obj.image153 = GUI.fromHandle(_obj_newObject("image"));
    obj.image153:setParent(obj.InfHabilidades11);
    obj.image153:setSRC("/imagens/niveisDoPoder.png");
    obj.image153:setLeft(235);
    obj.image153:setTop(270);
    obj.image153:setWidth(218);
    obj.image153:setHeight(43);
    obj.image153:setName("image153");

    obj.image154 = GUI.fromHandle(_obj_newObject("image"));
    obj.image154:setParent(obj.InfHabilidades11);
    obj.image154:setSRC("/imagens/Anotações.png");
    obj.image154:setLeft(500);
    obj.image154:setTop(117);
    obj.image154:setWidth(218);
    obj.image154:setHeight(43);
    obj.image154:setName("image154");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.InfHabilidades11);
    obj.edit28:setLeft(306);
    obj.edit28:setTop(149);
    obj.edit28:setWidth(152);
    obj.edit28:setHeight(27);
    obj.edit28:setReadOnly(true);
    obj.edit28:setText("Visão raio x");
    obj.edit28:setName("edit28");

    obj.textEditor55 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor55:setParent(obj.InfHabilidades11);
    obj.textEditor55:setLeft(306);
    obj.textEditor55:setTop(193);
    obj.textEditor55:setWidth(202);
    obj.textEditor55:setHeight(87);
    obj.textEditor55:setReadOnly(true);
    obj.textEditor55:setText("Seria legal ver através das paredes.\n\n[IMPLA]");
    obj.textEditor55:setName("textEditor55");

    obj.textEditor56 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor56:setParent(obj.InfHabilidades11);
    obj.textEditor56:setLeft(520);
    obj.textEditor56:setTop(149);
    obj.textEditor56:setWidth(169);
    obj.textEditor56:setHeight(246);
    obj.textEditor56:setField("Anotações26");
    obj.textEditor56:setName("textEditor56");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.InfHabilidades11);
    obj.button77:setText("1");
    obj.button77:setLeft(320);
    obj.button77:setTop(324);
    obj.button77:setWidth(20);
    obj.button77:setHeight(20);
    obj.button77:setName("button77");

    obj.checkBox163 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.button77);
    obj.checkBox163:setField("NivelHabilidade61");
    obj.checkBox163:setAlign("top");
    obj.checkBox163:setMargins({top=-15});
    obj.checkBox163:setName("checkBox163");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.InfHabilidades11);
    obj.button78:setText("2");
    obj.button78:setLeft(340);
    obj.button78:setTop(324);
    obj.button78:setWidth(20);
    obj.button78:setHeight(20);
    obj.button78:setName("button78");

    obj.checkBox164 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.button78);
    obj.checkBox164:setField("NivelHabilidade62");
    obj.checkBox164:setAlign("top");
    obj.checkBox164:setMargins({top=-15});
    obj.checkBox164:setName("checkBox164");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.InfHabilidades11);
    obj.button79:setText("3");
    obj.button79:setLeft(360);
    obj.button79:setTop(324);
    obj.button79:setWidth(20);
    obj.button79:setHeight(20);
    obj.button79:setName("button79");

    obj.checkBox165 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.button79);
    obj.checkBox165:setField("NivelHabilidade63");
    obj.checkBox165:setAlign("top");
    obj.checkBox165:setMargins({top=-15});
    obj.checkBox165:setName("checkBox165");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.InfHabilidades11);
    obj.button80:setText("4");
    obj.button80:setLeft(320);
    obj.button80:setTop(359);
    obj.button80:setWidth(20);
    obj.button80:setHeight(20);
    obj.button80:setName("button80");

    obj.checkBox166 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.button80);
    obj.checkBox166:setField("NivelHabilidade64");
    obj.checkBox166:setAlign("top");
    obj.checkBox166:setMargins({top=-15});
    obj.checkBox166:setName("checkBox166");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.InfHabilidades11);
    obj.button81:setText("5");
    obj.button81:setLeft(340);
    obj.button81:setTop(359);
    obj.button81:setWidth(20);
    obj.button81:setHeight(20);
    obj.button81:setName("button81");

    obj.checkBox167 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.button81);
    obj.checkBox167:setField("NivelHabilidade65");
    obj.checkBox167:setAlign("top");
    obj.checkBox167:setMargins({top=-15});
    obj.checkBox167:setName("checkBox167");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.InfHabilidades11);
    obj.button82:setText("6");
    obj.button82:setLeft(360);
    obj.button82:setTop(359);
    obj.button82:setWidth(20);
    obj.button82:setHeight(20);
    obj.button82:setName("button82");

    obj.checkBox168 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.button82);
    obj.checkBox168:setField("NivelHabilidade66");
    obj.checkBox168:setAlign("top");
    obj.checkBox168:setMargins({top=-15});
    obj.checkBox168:setName("checkBox168");

    obj.InfHabilidades12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades12:setParent(obj.scrollBox1);
    obj.InfHabilidades12:setName("InfHabilidades12");
    obj.InfHabilidades12:setAlign("client");
    obj.InfHabilidades12:setVisible(false);

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.InfHabilidades12);
    obj.button83:setText("VOLTAR");
    lfm_setPropAsString(obj.button83, "fontStyle",  "bold");
    obj.button83:setFontColor("#6495ED");
    obj.button83:setLeft(300);
    obj.button83:setTop(88);
    obj.button83:setWidth(70);
    obj.button83:setHeight(30);
    obj.button83:setName("button83");

    obj.image155 = GUI.fromHandle(_obj_newObject("image"));
    obj.image155:setParent(obj.InfHabilidades12);
    obj.image155:setSRC("/imagens/CirculoNave.png");
    obj.image155:setLeft(293);
    obj.image155:setTop(120);
    obj.image155:setWidth(408);
    obj.image155:setHeight(285);
    obj.image155:setName("image155");

    obj.image156 = GUI.fromHandle(_obj_newObject("image"));
    obj.image156:setParent(obj.InfHabilidades12);
    obj.image156:setSRC("/imagens/nomedaHabilidade.png");
    obj.image156:setLeft(293);
    obj.image156:setTop(119);
    obj.image156:setWidth(218);
    obj.image156:setHeight(43);
    obj.image156:setName("image156");

    obj.image157 = GUI.fromHandle(_obj_newObject("image"));
    obj.image157:setParent(obj.InfHabilidades12);
    obj.image157:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image157:setLeft(297);
    obj.image157:setTop(165);
    obj.image157:setWidth(218);
    obj.image157:setHeight(43);
    obj.image157:setName("image157");

    obj.image158 = GUI.fromHandle(_obj_newObject("image"));
    obj.image158:setParent(obj.InfHabilidades12);
    obj.image158:setSRC("/imagens/niveisDoPoder.png");
    obj.image158:setLeft(235);
    obj.image158:setTop(270);
    obj.image158:setWidth(218);
    obj.image158:setHeight(43);
    obj.image158:setName("image158");

    obj.image159 = GUI.fromHandle(_obj_newObject("image"));
    obj.image159:setParent(obj.InfHabilidades12);
    obj.image159:setSRC("/imagens/Anotações.png");
    obj.image159:setLeft(500);
    obj.image159:setTop(117);
    obj.image159:setWidth(218);
    obj.image159:setHeight(43);
    obj.image159:setName("image159");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.InfHabilidades12);
    obj.edit29:setLeft(306);
    obj.edit29:setTop(149);
    obj.edit29:setWidth(152);
    obj.edit29:setHeight(27);
    obj.edit29:setReadOnly(true);
    obj.edit29:setText("Controle de luz");
    obj.edit29:setName("edit29");

    obj.textEditor57 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor57:setParent(obj.InfHabilidades12);
    obj.textEditor57:setLeft(306);
    obj.textEditor57:setTop(193);
    obj.textEditor57:setWidth(202);
    obj.textEditor57:setHeight(87);
    obj.textEditor57:setReadOnly(true);
    obj.textEditor57:setText("Que aja LUZ! Você pode controlar a luz, fazer luz, dependendo da sua concentração. O mais útil desse poder, é pode controlar a luz interior dentro das pessoas, você pode simplesmente apagar a luz dentro de alguém causando uma depressão tão forte que faria com que a pessoa tenta-se um suicídio no mesmo momento.\n\n[IMPLA]");
    obj.textEditor57:setName("textEditor57");

    obj.textEditor58 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor58:setParent(obj.InfHabilidades12);
    obj.textEditor58:setLeft(520);
    obj.textEditor58:setTop(149);
    obj.textEditor58:setWidth(169);
    obj.textEditor58:setHeight(246);
    obj.textEditor58:setField("Anotações26");
    obj.textEditor58:setName("textEditor58");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.InfHabilidades12);
    obj.button84:setText("1");
    obj.button84:setLeft(320);
    obj.button84:setTop(324);
    obj.button84:setWidth(20);
    obj.button84:setHeight(20);
    obj.button84:setName("button84");

    obj.checkBox169 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.button84);
    obj.checkBox169:setField("NivelHabilidade67");
    obj.checkBox169:setAlign("top");
    obj.checkBox169:setMargins({top=-15});
    obj.checkBox169:setName("checkBox169");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.InfHabilidades12);
    obj.button85:setText("2");
    obj.button85:setLeft(340);
    obj.button85:setTop(324);
    obj.button85:setWidth(20);
    obj.button85:setHeight(20);
    obj.button85:setName("button85");

    obj.checkBox170 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.button85);
    obj.checkBox170:setField("NivelHabilidade68");
    obj.checkBox170:setAlign("top");
    obj.checkBox170:setMargins({top=-15});
    obj.checkBox170:setName("checkBox170");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.InfHabilidades12);
    obj.button86:setText("3");
    obj.button86:setLeft(360);
    obj.button86:setTop(324);
    obj.button86:setWidth(20);
    obj.button86:setHeight(20);
    obj.button86:setName("button86");

    obj.checkBox171 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.button86);
    obj.checkBox171:setField("NivelHabilidade69");
    obj.checkBox171:setAlign("top");
    obj.checkBox171:setMargins({top=-15});
    obj.checkBox171:setName("checkBox171");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.InfHabilidades12);
    obj.button87:setText("4");
    obj.button87:setLeft(320);
    obj.button87:setTop(359);
    obj.button87:setWidth(20);
    obj.button87:setHeight(20);
    obj.button87:setName("button87");

    obj.checkBox172 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.button87);
    obj.checkBox172:setField("NivelHabilidade70");
    obj.checkBox172:setAlign("top");
    obj.checkBox172:setMargins({top=-15});
    obj.checkBox172:setName("checkBox172");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.InfHabilidades12);
    obj.button88:setText("5");
    obj.button88:setLeft(340);
    obj.button88:setTop(359);
    obj.button88:setWidth(20);
    obj.button88:setHeight(20);
    obj.button88:setName("button88");

    obj.checkBox173 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.button88);
    obj.checkBox173:setField("NivelHabilidade71");
    obj.checkBox173:setAlign("top");
    obj.checkBox173:setMargins({top=-15});
    obj.checkBox173:setName("checkBox173");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.InfHabilidades12);
    obj.button89:setText("6");
    obj.button89:setLeft(360);
    obj.button89:setTop(359);
    obj.button89:setWidth(20);
    obj.button89:setHeight(20);
    obj.button89:setName("button89");

    obj.checkBox174 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.button89);
    obj.checkBox174:setField("NivelHabilidade72");
    obj.checkBox174:setAlign("top");
    obj.checkBox174:setMargins({top=-15});
    obj.checkBox174:setName("checkBox174");

    obj.InfHabilidades13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.InfHabilidades13:setParent(obj.scrollBox1);
    obj.InfHabilidades13:setName("InfHabilidades13");
    obj.InfHabilidades13:setAlign("client");
    obj.InfHabilidades13:setVisible(false);

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.InfHabilidades13);
    obj.button90:setText("VOLTAR");
    lfm_setPropAsString(obj.button90, "fontStyle",  "bold");
    obj.button90:setFontColor("#6495ED");
    obj.button90:setLeft(300);
    obj.button90:setTop(88);
    obj.button90:setWidth(70);
    obj.button90:setHeight(30);
    obj.button90:setName("button90");

    obj.image160 = GUI.fromHandle(_obj_newObject("image"));
    obj.image160:setParent(obj.InfHabilidades13);
    obj.image160:setSRC("/imagens/CirculoNave.png");
    obj.image160:setLeft(293);
    obj.image160:setTop(120);
    obj.image160:setWidth(408);
    obj.image160:setHeight(285);
    obj.image160:setName("image160");

    obj.image161 = GUI.fromHandle(_obj_newObject("image"));
    obj.image161:setParent(obj.InfHabilidades13);
    obj.image161:setSRC("/imagens/nomedaHabilidade.png");
    obj.image161:setLeft(293);
    obj.image161:setTop(119);
    obj.image161:setWidth(218);
    obj.image161:setHeight(43);
    obj.image161:setName("image161");

    obj.image162 = GUI.fromHandle(_obj_newObject("image"));
    obj.image162:setParent(obj.InfHabilidades13);
    obj.image162:setSRC("/imagens/detalheDaHabilidade.png");
    obj.image162:setLeft(297);
    obj.image162:setTop(165);
    obj.image162:setWidth(218);
    obj.image162:setHeight(43);
    obj.image162:setName("image162");

    obj.image163 = GUI.fromHandle(_obj_newObject("image"));
    obj.image163:setParent(obj.InfHabilidades13);
    obj.image163:setSRC("/imagens/niveisDoPoder.png");
    obj.image163:setLeft(235);
    obj.image163:setTop(270);
    obj.image163:setWidth(218);
    obj.image163:setHeight(43);
    obj.image163:setName("image163");

    obj.image164 = GUI.fromHandle(_obj_newObject("image"));
    obj.image164:setParent(obj.InfHabilidades13);
    obj.image164:setSRC("/imagens/Anotações.png");
    obj.image164:setLeft(500);
    obj.image164:setTop(117);
    obj.image164:setWidth(218);
    obj.image164:setHeight(43);
    obj.image164:setName("image164");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.InfHabilidades13);
    obj.edit30:setLeft(306);
    obj.edit30:setTop(149);
    obj.edit30:setWidth(152);
    obj.edit30:setHeight(27);
    obj.edit30:setReadOnly(true);
    obj.edit30:setText("Super olfato");
    obj.edit30:setName("edit30");

    obj.textEditor59 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor59:setParent(obj.InfHabilidades13);
    obj.textEditor59:setLeft(306);
    obj.textEditor59:setTop(193);
    obj.textEditor59:setWidth(202);
    obj.textEditor59:setHeight(87);
    obj.textEditor59:setReadOnly(true);
    obj.textEditor59:setText("Pode sentir cheiro como um cão\n\n[APLA]");
    obj.textEditor59:setName("textEditor59");

    obj.textEditor60 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor60:setParent(obj.InfHabilidades13);
    obj.textEditor60:setLeft(520);
    obj.textEditor60:setTop(149);
    obj.textEditor60:setWidth(169);
    obj.textEditor60:setHeight(246);
    obj.textEditor60:setField("Anotações26");
    obj.textEditor60:setName("textEditor60");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.InfHabilidades13);
    obj.button91:setText("1");
    obj.button91:setLeft(320);
    obj.button91:setTop(324);
    obj.button91:setWidth(20);
    obj.button91:setHeight(20);
    obj.button91:setName("button91");

    obj.checkBox175 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.button91);
    obj.checkBox175:setField("NivelHabilidade73");
    obj.checkBox175:setAlign("top");
    obj.checkBox175:setMargins({top=-15});
    obj.checkBox175:setName("checkBox175");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.InfHabilidades13);
    obj.button92:setText("2");
    obj.button92:setLeft(340);
    obj.button92:setTop(324);
    obj.button92:setWidth(20);
    obj.button92:setHeight(20);
    obj.button92:setName("button92");

    obj.checkBox176 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.button92);
    obj.checkBox176:setField("NivelHabilidade74");
    obj.checkBox176:setAlign("top");
    obj.checkBox176:setMargins({top=-15});
    obj.checkBox176:setName("checkBox176");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.InfHabilidades13);
    obj.button93:setText("3");
    obj.button93:setLeft(360);
    obj.button93:setTop(324);
    obj.button93:setWidth(20);
    obj.button93:setHeight(20);
    obj.button93:setName("button93");

    obj.checkBox177 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.button93);
    obj.checkBox177:setField("NivelHabilidade75");
    obj.checkBox177:setAlign("top");
    obj.checkBox177:setMargins({top=-15});
    obj.checkBox177:setName("checkBox177");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.InfHabilidades13);
    obj.button94:setText("4");
    obj.button94:setLeft(320);
    obj.button94:setTop(359);
    obj.button94:setWidth(20);
    obj.button94:setHeight(20);
    obj.button94:setName("button94");

    obj.checkBox178 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.button94);
    obj.checkBox178:setField("NivelHabilidade76");
    obj.checkBox178:setAlign("top");
    obj.checkBox178:setMargins({top=-15});
    obj.checkBox178:setName("checkBox178");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.InfHabilidades13);
    obj.button95:setText("5");
    obj.button95:setLeft(340);
    obj.button95:setTop(359);
    obj.button95:setWidth(20);
    obj.button95:setHeight(20);
    obj.button95:setName("button95");

    obj.checkBox179 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.button95);
    obj.checkBox179:setField("NivelHabilidade77");
    obj.checkBox179:setAlign("top");
    obj.checkBox179:setMargins({top=-15});
    obj.checkBox179:setName("checkBox179");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.InfHabilidades13);
    obj.button96:setText("6");
    obj.button96:setLeft(360);
    obj.button96:setTop(359);
    obj.button96:setWidth(20);
    obj.button96:setHeight(20);
    obj.button96:setName("button96");

    obj.checkBox180 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.button96);
    obj.checkBox180:setField("NivelHabilidade78");
    obj.checkBox180:setAlign("top");
    obj.checkBox180:setMargins({top=-15});
    obj.checkBox180:setName("checkBox180");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("nivelatributo");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setField("nivelatributo");
    obj.dataLink2:setName("dataLink2");

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.scrollBox1);
    obj.button97:setText("Conteudo Antigo");
    obj.button97:setLeft(0);
    obj.button97:setTop(0);
    obj.button97:setFontColor("blue");
    obj.button97:setWidth(119);
    obj.button97:setHeight(21.91);
    obj.button97:setName("button97");

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.scrollBox1);
    obj.button98:setText("Conteudo Novo");
    obj.button98:setLeft(119);
    obj.button98:setFontColor("yellow");
    lfm_setPropAsString(obj.button98, "fontStyle",  "bold");
    obj.button98:setTop(0);
    obj.button98:setWidth(119);
    obj.button98:setHeight(21.91);
    obj.button98:setName("button98");

    obj.PoderesEHabilidadesAntigo = GUI.fromHandle(_obj_newObject("layout"));
    obj.PoderesEHabilidadesAntigo:setParent(obj.scrollBox1);
    obj.PoderesEHabilidadesAntigo:setName("PoderesEHabilidadesAntigo");
    obj.PoderesEHabilidadesAntigo:setAlign("client");
    obj.PoderesEHabilidadesAntigo:setVisible(false);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.PoderesEHabilidadesAntigo);
    obj.label1:setText("Seja bem vindo a area que você irá descobrir seus poderes.");
    obj.label1:setTop(0);
    obj.label1:setLeft(505);
    obj.label1:setAutoSize(false);
    obj.label1:setWordWrap(true);
    obj.label1:setWidth(999);
    obj.label1:setHeight(100);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontSize(18);
    obj.label1:setName("label1");

    obj.rolarPoder = GUI.fromHandle(_obj_newObject("button"));
    obj.rolarPoder:setParent(obj.PoderesEHabilidadesAntigo);
    obj.rolarPoder:setName("rolarPoder");
    obj.rolarPoder:setText("Poder");
    lfm_setPropAsString(obj.rolarPoder, "fontStyle",  "bold");
    obj.rolarPoder:setTop(90);
    obj.rolarPoder:setLeft(505);
    obj.rolarPoder:setFontColor("Chartreuse");

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.PoderesEHabilidadesAntigo);
    obj.button99:setText("Habilidade");
    lfm_setPropAsString(obj.button99, "fontStyle",  "bold");
    obj.button99:setTop(150);
    obj.button99:setLeft(575);
    obj.button99:setFontColor("DarkRed");
    obj.button99:setName("button99");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.PoderesEHabilidadesAntigo);
    obj.edit31:setField("Poder1");
    obj.edit31:setTop(90);
    obj.edit31:setLeft(590);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(50);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(22);
    lfm_setPropAsString(obj.edit31, "fontStyle",  "bold");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.PoderesEHabilidadesAntigo);
    obj.edit32:setField("Habilidade1");
    obj.edit32:setTop(150);
    obj.edit32:setLeft(660);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(50);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(22);
    lfm_setPropAsString(obj.edit32, "fontStyle",  "bold");
    obj.edit32:setName("edit32");

    obj.AreaqSeraApagada = GUI.fromHandle(_obj_newObject("label"));
    obj.AreaqSeraApagada:setParent(obj.PoderesEHabilidadesAntigo);
    obj.AreaqSeraApagada:setLeft(200);
    obj.AreaqSeraApagada:setTop(200);
    obj.AreaqSeraApagada:setName("AreaqSeraApagada");
    obj.AreaqSeraApagada:setAlign("client");
    obj.AreaqSeraApagada:setHorzTextAlign("center");
    obj.AreaqSeraApagada:setFontSize(50);
    obj.AreaqSeraApagada:setText("Essa área sera apagada em breve!");

    obj._e_event0 = obj.BotaoRolar1:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado1()
        end, obj);

    obj._e_event1 = obj.BotaoRolar2:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado2()
        end, obj);

    obj._e_event2 = obj.BotaoRolar3:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado3()
        end, obj);

    obj._e_event3 = obj.BotaoRolar4:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado4()
        end, obj);

    obj._e_event4 = obj.BotaoRolar5:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado5()
        end, obj);

    obj._e_event5 = obj.BotaoRolar6:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado6()
        end, obj);

    obj._e_event6 = obj.BotaoRolar7:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado7()
        end, obj);

    obj._e_event7 = obj.BotaoRolar8:addEventListener("onClick",
        function (_)
            realizarRolagemDoDado8()
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes1.visible = true;
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes2.visible = true;
        end, obj);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes3.visible = true;
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes4.visible = true;
        end, obj);

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes5.visible = true;
        end, obj);

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes6.visible = true;
        end, obj);

    obj._e_event14 = obj.button7:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes7.visible = true;
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes8.visible = true;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes9.visible = true;
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes10.visible = true;
        end, obj);

    obj._e_event18 = obj.button11:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes11.visible = true;
        end, obj);

    obj._e_event19 = obj.button12:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes12.visible = true;
        end, obj);

    obj._e_event20 = obj.button13:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes13.visible = true;
        end, obj);

    obj._e_event21 = obj.button14:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes14.visible = true;
        end, obj);

    obj._e_event22 = obj.button15:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes15.visible = true;
        end, obj);

    obj._e_event23 = obj.button16:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes16.visible = true;
        end, obj);

    obj._e_event24 = obj.button17:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfPoderes17.visible = true;
        end, obj);

    obj._e_event25 = obj.button18:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades1.visible = true;
        end, obj);

    obj._e_event26 = obj.button19:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades2.visible = true;
        end, obj);

    obj._e_event27 = obj.button20:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades3.visible = true;
        end, obj);

    obj._e_event28 = obj.button21:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;	
            			   self.InfHabilidades4.visible = true;
        end, obj);

    obj._e_event29 = obj.button22:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades5.visible = true;
        end, obj);

    obj._e_event30 = obj.button23:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades6.visible = true;
        end, obj);

    obj._e_event31 = obj.button24:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades7.visible = true;
        end, obj);

    obj._e_event32 = obj.button25:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades8.visible = true;
        end, obj);

    obj._e_event33 = obj.button26:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades9.visible = true;
        end, obj);

    obj._e_event34 = obj.button27:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades10.visible = true;
        end, obj);

    obj._e_event35 = obj.button28:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades11.visible = true;
        end, obj);

    obj._e_event36 = obj.button29:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades12.visible = true;
        end, obj);

    obj._e_event37 = obj.button30:addEventListener("onClick",
        function (_)
            self.poderesEHabilidadesListados.visible = false;
            			   self.InfHabilidades13.visible = true;
        end, obj);

    obj._e_event38 = obj.button31:addEventListener("onClick",
        function (_)
            self.InfPoderes1.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event39 = obj.button32:addEventListener("onClick",
        function (_)
            self.InfPoderes2.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event40 = obj.button33:addEventListener("onClick",
        function (_)
            self.InfPoderes3.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event41 = obj.button34:addEventListener("onClick",
        function (_)
            self.InfPoderes4.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event42 = obj.button35:addEventListener("onClick",
        function (_)
            self.InfPoderes5.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event43 = obj.button36:addEventListener("onClick",
        function (_)
            self.InfPoderes6.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event44 = obj.button37:addEventListener("onClick",
        function (_)
            self.InfPoderes7.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event45 = obj.button38:addEventListener("onClick",
        function (_)
            self.InfPoderes8.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event46 = obj.button39:addEventListener("onClick",
        function (_)
            self.InfPoderes9.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event47 = obj.button40:addEventListener("onClick",
        function (_)
            self.InfPoderes10.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event48 = obj.button41:addEventListener("onClick",
        function (_)
            self.InfPoderes11.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event49 = obj.button42:addEventListener("onClick",
        function (_)
            self.InfPoderes12.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event50 = obj.button43:addEventListener("onClick",
        function (_)
            self.InfPoderes13.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event51 = obj.button44:addEventListener("onClick",
        function (_)
            self.InfPoderes14.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event52 = obj.button45:addEventListener("onClick",
        function (_)
            self.InfPoderes15.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event53 = obj.button46:addEventListener("onClick",
        function (_)
            self.InfPoderes16.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event54 = obj.button47:addEventListener("onClick",
        function (_)
            self.InfPoderes17.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event55 = obj.button48:addEventListener("onClick",
        function (_)
            self.InfHabilidades1.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event56 = obj.button49:addEventListener("onClick",
        function (_)
            self.InfHabilidades2.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event57 = obj.button50:addEventListener("onClick",
        function (_)
            self.InfHabilidades3.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event58 = obj.button51:addEventListener("onClick",
        function (_)
            self.InfHabilidades4.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event59 = obj.button52:addEventListener("onClick",
        function (_)
            self.InfHabilidades5.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event60 = obj.button53:addEventListener("onClick",
        function (_)
            self.InfHabilidades6.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event61 = obj.button54:addEventListener("onClick",
        function (_)
            self.InfHabilidades7.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event62 = obj.button55:addEventListener("onClick",
        function (_)
            self.InfHabilidades8.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event63 = obj.button62:addEventListener("onClick",
        function (_)
            self.InfHabilidades9.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event64 = obj.button69:addEventListener("onClick",
        function (_)
            self.InfHabilidades10.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event65 = obj.button76:addEventListener("onClick",
        function (_)
            self.InfHabilidades11.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event66 = obj.button83:addEventListener("onClick",
        function (_)
            self.InfHabilidades12.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event67 = obj.button90:addEventListener("onClick",
        function (_)
            self.InfHabilidades13.visible = false;
            	   self.poderesEHabilidadesListados.visible = true;
        end, obj);

    obj._e_event68 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelatributo >= 25 then
            	  self.PoderNivel25.visible = false;
            	  self.PoderNivel25edit.visible = true;
            	  self.PoderNivel25edit1.visible = true;
            	   else
            	  self.PoderNivel25.visible = true;
            	  self.PoderNivel25edit.visible = false;
            	  self.PoderNivel25edit1.visible = false;
            	  end;
                  if sheet.nivelatributo >= 85 then
            	  self.PoderNivel80.visible = false;
            	  self.PoderNivel80edit.visible = true;
            	  self.PoderNivel80edit1.visible = true;
            	   else
            	  self.PoderNivel80.visible = true;
            	  self.PoderNivel80edit.visible = false;
            	  self.PoderNivel80edit1.visible = false;
            	  end;
                  if sheet.nivelatributo >= 100 then
            	  self.PoderNivel100.visible = false;
            	  self.PoderNivel100edit.visible = true;
            	  self.PoderNivel100edit1.visible = true;
            	   else
            	  self.PoderNivel100.visible = true;
            	  self.PoderNivel100edit.visible = false;
            	  self.PoderNivel100edit1.visible = false;
            	  end;
            	  
                  if sheet.nivelatributo >= 20 then
            	  self.HabNivel20.visible = false;
            	  self.HabNivel20edit.visible = true;
            	  self.HabNivel20edit1.visible = true;
            	   else
            	  self.HabNivel20.visible = true;
            	  self.HabNivel20edit.visible = false;
            	  self.HabNivel20edit1.visible = false;
            	  end;
            	  
                  if sheet.nivelatributo >= 50 then
            	  self.HabNivel50.visible = false;
            	  self.HabNivel50edit.visible = true;
            	  self.HabNivel50edit1.visible = true;
            	   else
            	  self.HabNivel50.visible = true;
            	  self.HabNivel50edit.visible = false;
            	  self.HabNivel50edit1.visible = false;
            	  end;
            	  
                  if sheet.nivelatributo >= 80 then
            	  self.HabNivel80.visible = false;
            	  self.HabNivel80edit.visible = true;
            	  self.HabNivel80edit1.visible = true;
            	   else
            	  self.HabNivel80.visible = true;
            	  self.HabNivel80edit.visible = false;
            	  self.HabNivel80edit1.visible = false;
            	  end;
        end, obj);

    obj._e_event69 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelatributo >= 25 then
            	  self.BotaoRolar2.visible = true;
            	  else
            	  self.BotaoRolar2.visible = false;
                  end;
            	  if sheet.nivelatributo >= 80 then
            	  self.BotaoRolar3.visible = true;
            	  else
            	  self.BotaoRolar3.visible = false;	  
                  end;
            	  if sheet.nivelatributo >= 100 then
            	  self.BotaoRolar4.visible = true;
            	  else
            	  self.BotaoRolar4.visible = false;	  
                  end;
            	  
              	  if sheet.nivelatributo >= 20 then
            	  self.BotaoRolar6.visible = true;
            	  else
            	  self.BotaoRolar6.visible = false;
                  end;
            	  if sheet.nivelatributo >= 50 then
            	  self.BotaoRolar7.visible = true;
            	  else
            	  self.BotaoRolar7.visible = false;	  
                  end;
            	  if sheet.nivelatributo >= 80 then
            	  self.BotaoRolar8.visible = true;
            	  else
            	  self.BotaoRolar8.visible = false;	  
                  end;
        end, obj);

    obj._e_event70 = obj.button97:addEventListener("onClick",
        function (_)
            self.PoderesEHabilidadesAntigo.visible = true;
            			 self.PoderesEHabilidadesNovo.visible = false;
            			 self.InfPoderes1.visible = false;
            			 self.InfPoderes2.visible = false;
            			 self.InfPoderes3.visible = false;
            			 self.InfPoderes4.visible = false;
            			 self.InfPoderes5.visible = false;
            			 self.InfPoderes6.visible = false;
            			 self.InfPoderes7.visible = false;
            			 self.InfPoderes8.visible = false;
            			 self.InfPoderes9.visible = false;
            			 self.InfPoderes10.visible = false;
            			 self.InfPoderes11.visible = false;
            			 self.InfPoderes12.visible = false;
            			 self.InfPoderes13.visible = false;
            			 self.InfPoderes14.visible = false;
            			 self.InfPoderes15.visible = false;
            			 self.InfPoderes16.visible = false;
            			 self.InfPoderes17.visible = false;
            	         self.InfHabilidades1.visible = false;
            	         self.InfHabilidades2.visible = false;
            	         self.InfHabilidades3.visible = false;
            	         self.InfHabilidades4.visible = false;
            	         self.InfHabilidades5.visible = false;
            	         self.InfHabilidades6.visible = false;
            	         self.InfHabilidades7.visible = false;
            	         self.InfHabilidades8.visible = false;
            	         self.InfHabilidades9.visible = false;
            	         self.InfHabilidades10.visible = false;
        end, obj);

    obj._e_event71 = obj.button98:addEventListener("onClick",
        function (_)
            self.PoderesEHabilidadesAntigo.visible = false;
            			 self.PoderesEHabilidadesNovo.visible = true;
        end, obj);

    obj._e_event72 = obj.rolarPoder:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d17");
                                   rolagem:rolarLocalmente();
                                   sheet.Poder1 = rolagem.resultado;
            
                                   local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("você tirou " .. rolagem.resultado .. " Conteudo antigo, esse não conta!");
                                   end;
        end, obj);

    obj._e_event73 = obj.button99:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d17");
                                   rolagem:rolarLocalmente();
                                   sheet.Habilidade1 = rolagem.resultado;
                                   local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("você tirou " .. rolagem.resultado .. " Conteudo antigo, esse não conta!");
                                   end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
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

        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.image94 ~= nil then self.image94:destroy(); self.image94 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.image117 ~= nil then self.image117:destroy(); self.image117 = nil; end;
        if self.NivelHabilidade37 ~= nil then self.NivelHabilidade37:destroy(); self.NivelHabilidade37 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.NivelPoder17 ~= nil then self.NivelPoder17:destroy(); self.NivelPoder17 = nil; end;
        if self.NivelHabilidade13 ~= nil then self.NivelHabilidade13:destroy(); self.NivelHabilidade13 = nil; end;
        if self.InfPoderes3 ~= nil then self.InfPoderes3:destroy(); self.InfPoderes3 = nil; end;
        if self.image135 ~= nil then self.image135:destroy(); self.image135 = nil; end;
        if self.image157 ~= nil then self.image157:destroy(); self.image157 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.image136 ~= nil then self.image136:destroy(); self.image136 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.InfPoderes7 ~= nil then self.InfPoderes7:destroy(); self.InfPoderes7 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.image70 ~= nil then self.image70:destroy(); self.image70 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.NivelPoder27 ~= nil then self.NivelPoder27:destroy(); self.NivelPoder27 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.BotaoRolar6 ~= nil then self.BotaoRolar6:destroy(); self.BotaoRolar6 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.textEditor48 ~= nil then self.textEditor48:destroy(); self.textEditor48 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.InfHabilidades5 ~= nil then self.InfHabilidades5:destroy(); self.InfHabilidades5 = nil; end;
        if self.NivelPoder26 ~= nil then self.NivelPoder26:destroy(); self.NivelPoder26 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.NivelPoder28 ~= nil then self.NivelPoder28:destroy(); self.NivelPoder28 = nil; end;
        if self.NivelPoder71 ~= nil then self.NivelPoder71:destroy(); self.NivelPoder71 = nil; end;
        if self.HabNivel20edit1 ~= nil then self.HabNivel20edit1:destroy(); self.HabNivel20edit1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.InfPoderes6 ~= nil then self.InfPoderes6:destroy(); self.InfPoderes6 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.image107 ~= nil then self.image107:destroy(); self.image107 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.InfHabilidades3 ~= nil then self.InfHabilidades3:destroy(); self.InfHabilidades3 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.NivelPoder1 ~= nil then self.NivelPoder1:destroy(); self.NivelPoder1 = nil; end;
        if self.InfHabilidades1 ~= nil then self.InfHabilidades1:destroy(); self.InfHabilidades1 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.image95 ~= nil then self.image95:destroy(); self.image95 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.textEditor58 ~= nil then self.textEditor58:destroy(); self.textEditor58 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.NivelHabilidade1 ~= nil then self.NivelHabilidade1:destroy(); self.NivelHabilidade1 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.image91 ~= nil then self.image91:destroy(); self.image91 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.NivelHabilidade21 ~= nil then self.NivelHabilidade21:destroy(); self.NivelHabilidade21 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.InfPoderes16 ~= nil then self.InfPoderes16:destroy(); self.InfPoderes16 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image103 ~= nil then self.image103:destroy(); self.image103 = nil; end;
        if self.image140 ~= nil then self.image140:destroy(); self.image140 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.textEditor54 ~= nil then self.textEditor54:destroy(); self.textEditor54 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.NivelHabilidade28 ~= nil then self.NivelHabilidade28:destroy(); self.NivelHabilidade28 = nil; end;
        if self.textEditor43 ~= nil then self.textEditor43:destroy(); self.textEditor43 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.NivelPoder19 ~= nil then self.NivelPoder19:destroy(); self.NivelPoder19 = nil; end;
        if self.image123 ~= nil then self.image123:destroy(); self.image123 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.InfPoderes1 ~= nil then self.InfPoderes1:destroy(); self.InfPoderes1 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.InfHabilidades9 ~= nil then self.InfHabilidades9:destroy(); self.InfHabilidades9 = nil; end;
        if self.NivelPoder46 ~= nil then self.NivelPoder46:destroy(); self.NivelPoder46 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.image133 ~= nil then self.image133:destroy(); self.image133 = nil; end;
        if self.textEditor55 ~= nil then self.textEditor55:destroy(); self.textEditor55 = nil; end;
        if self.InfHabilidades8 ~= nil then self.InfHabilidades8:destroy(); self.InfHabilidades8 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.NivelPoder6 ~= nil then self.NivelPoder6:destroy(); self.NivelPoder6 = nil; end;
        if self.InfPoderes8 ~= nil then self.InfPoderes8:destroy(); self.InfPoderes8 = nil; end;
        if self.textEditor40 ~= nil then self.textEditor40:destroy(); self.textEditor40 = nil; end;
        if self.image161 ~= nil then self.image161:destroy(); self.image161 = nil; end;
        if self.NivelHabilidade20 ~= nil then self.NivelHabilidade20:destroy(); self.NivelHabilidade20 = nil; end;
        if self.NivelHabilidade23 ~= nil then self.NivelHabilidade23:destroy(); self.NivelHabilidade23 = nil; end;
        if self.image132 ~= nil then self.image132:destroy(); self.image132 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.textEditor47 ~= nil then self.textEditor47:destroy(); self.textEditor47 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.image145 ~= nil then self.image145:destroy(); self.image145 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.NivelPoder64 ~= nil then self.NivelPoder64:destroy(); self.NivelPoder64 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.NivelPoder3 ~= nil then self.NivelPoder3:destroy(); self.NivelPoder3 = nil; end;
        if self.NivelPoder52 ~= nil then self.NivelPoder52:destroy(); self.NivelPoder52 = nil; end;
        if self.HabNivel0edit1 ~= nil then self.HabNivel0edit1:destroy(); self.HabNivel0edit1 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.InfHabilidades12 ~= nil then self.InfHabilidades12:destroy(); self.InfHabilidades12 = nil; end;
        if self.InfHabilidades11 ~= nil then self.InfHabilidades11:destroy(); self.InfHabilidades11 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.NivelPoder2 ~= nil then self.NivelPoder2:destroy(); self.NivelPoder2 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.image75 ~= nil then self.image75:destroy(); self.image75 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.NivelPoder80 ~= nil then self.NivelPoder80:destroy(); self.NivelPoder80 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.image144 ~= nil then self.image144:destroy(); self.image144 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.NivelPoder94 ~= nil then self.NivelPoder94:destroy(); self.NivelPoder94 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.image105 ~= nil then self.image105:destroy(); self.image105 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.NivelPoder57 ~= nil then self.NivelPoder57:destroy(); self.NivelPoder57 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.NivelHabilidade32 ~= nil then self.NivelHabilidade32:destroy(); self.NivelHabilidade32 = nil; end;
        if self.image76 ~= nil then self.image76:destroy(); self.image76 = nil; end;
        if self.image100 ~= nil then self.image100:destroy(); self.image100 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.InfPoderes12 ~= nil then self.InfPoderes12:destroy(); self.InfPoderes12 = nil; end;
        if self.NivelPoder35 ~= nil then self.NivelPoder35:destroy(); self.NivelPoder35 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.NivelHabilidade30 ~= nil then self.NivelHabilidade30:destroy(); self.NivelHabilidade30 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.textEditor51 ~= nil then self.textEditor51:destroy(); self.textEditor51 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.image149 ~= nil then self.image149:destroy(); self.image149 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.NivelPoder63 ~= nil then self.NivelPoder63:destroy(); self.NivelPoder63 = nil; end;
        if self.PoderNivel100edit ~= nil then self.PoderNivel100edit:destroy(); self.PoderNivel100edit = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.InfPoderes9 ~= nil then self.InfPoderes9:destroy(); self.InfPoderes9 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.NivelHabilidade24 ~= nil then self.NivelHabilidade24:destroy(); self.NivelHabilidade24 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.NivelPoder4 ~= nil then self.NivelPoder4:destroy(); self.NivelPoder4 = nil; end;
        if self.NivelPoder69 ~= nil then self.NivelPoder69:destroy(); self.NivelPoder69 = nil; end;
        if self.NivelPoder73 ~= nil then self.NivelPoder73:destroy(); self.NivelPoder73 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.NivelPoder10 ~= nil then self.NivelPoder10:destroy(); self.NivelPoder10 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.NivelPoder84 ~= nil then self.NivelPoder84:destroy(); self.NivelPoder84 = nil; end;
        if self.NivelPoder7 ~= nil then self.NivelPoder7:destroy(); self.NivelPoder7 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.NivelPoder40 ~= nil then self.NivelPoder40:destroy(); self.NivelPoder40 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.textEditor46 ~= nil then self.textEditor46:destroy(); self.textEditor46 = nil; end;
        if self.image109 ~= nil then self.image109:destroy(); self.image109 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.NivelHabilidade11 ~= nil then self.NivelHabilidade11:destroy(); self.NivelHabilidade11 = nil; end;
        if self.PoderNivel100edit1 ~= nil then self.PoderNivel100edit1:destroy(); self.PoderNivel100edit1 = nil; end;
        if self.NivelHabilidade29 ~= nil then self.NivelHabilidade29:destroy(); self.NivelHabilidade29 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.image120 ~= nil then self.image120:destroy(); self.image120 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.image137 ~= nil then self.image137:destroy(); self.image137 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.textEditor42 ~= nil then self.textEditor42:destroy(); self.textEditor42 = nil; end;
        if self.HabNivel0edit ~= nil then self.HabNivel0edit:destroy(); self.HabNivel0edit = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.NivelHabilidade34 ~= nil then self.NivelHabilidade34:destroy(); self.NivelHabilidade34 = nil; end;
        if self.HabNivel20edit ~= nil then self.HabNivel20edit:destroy(); self.HabNivel20edit = nil; end;
        if self.NivelPoder38 ~= nil then self.NivelPoder38:destroy(); self.NivelPoder38 = nil; end;
        if self.NivelHabilidade33 ~= nil then self.NivelHabilidade33:destroy(); self.NivelHabilidade33 = nil; end;
        if self.NivelHabilidade7 ~= nil then self.NivelHabilidade7:destroy(); self.NivelHabilidade7 = nil; end;
        if self.InfPoderes17 ~= nil then self.InfPoderes17:destroy(); self.InfPoderes17 = nil; end;
        if self.textEditor49 ~= nil then self.textEditor49:destroy(); self.textEditor49 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.NivelPoder93 ~= nil then self.NivelPoder93:destroy(); self.NivelPoder93 = nil; end;
        if self.image81 ~= nil then self.image81:destroy(); self.image81 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.BotaoRolar5 ~= nil then self.BotaoRolar5:destroy(); self.BotaoRolar5 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.NivelPoder33 ~= nil then self.NivelPoder33:destroy(); self.NivelPoder33 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.image88 ~= nil then self.image88:destroy(); self.image88 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.textEditor52 ~= nil then self.textEditor52:destroy(); self.textEditor52 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.NivelPoder29 ~= nil then self.NivelPoder29:destroy(); self.NivelPoder29 = nil; end;
        if self.NivelHabilidade41 ~= nil then self.NivelHabilidade41:destroy(); self.NivelHabilidade41 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.NivelPoder98 ~= nil then self.NivelPoder98:destroy(); self.NivelPoder98 = nil; end;
        if self.HabNivel80 ~= nil then self.HabNivel80:destroy(); self.HabNivel80 = nil; end;
        if self.NivelPoder24 ~= nil then self.NivelPoder24:destroy(); self.NivelPoder24 = nil; end;
        if self.image152 ~= nil then self.image152:destroy(); self.image152 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.HabNivel80edit ~= nil then self.HabNivel80edit:destroy(); self.HabNivel80edit = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.image78 ~= nil then self.image78:destroy(); self.image78 = nil; end;
        if self.NivelHabilidade22 ~= nil then self.NivelHabilidade22:destroy(); self.NivelHabilidade22 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.NivelPoder59 ~= nil then self.NivelPoder59:destroy(); self.NivelPoder59 = nil; end;
        if self.NivelPoder95 ~= nil then self.NivelPoder95:destroy(); self.NivelPoder95 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.image83 ~= nil then self.image83:destroy(); self.image83 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.NivelPoder89 ~= nil then self.NivelPoder89:destroy(); self.NivelPoder89 = nil; end;
        if self.NivelPoder54 ~= nil then self.NivelPoder54:destroy(); self.NivelPoder54 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.NivelPoder97 ~= nil then self.NivelPoder97:destroy(); self.NivelPoder97 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.image122 ~= nil then self.image122:destroy(); self.image122 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.textEditor45 ~= nil then self.textEditor45:destroy(); self.textEditor45 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.image82 ~= nil then self.image82:destroy(); self.image82 = nil; end;
        if self.InfHabilidades2 ~= nil then self.InfHabilidades2:destroy(); self.InfHabilidades2 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.PoderNivel25edit1 ~= nil then self.PoderNivel25edit1:destroy(); self.PoderNivel25edit1 = nil; end;
        if self.NivelPoder88 ~= nil then self.NivelPoder88:destroy(); self.NivelPoder88 = nil; end;
        if self.image139 ~= nil then self.image139:destroy(); self.image139 = nil; end;
        if self.image129 ~= nil then self.image129:destroy(); self.image129 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image147 ~= nil then self.image147:destroy(); self.image147 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.NivelPoder56 ~= nil then self.NivelPoder56:destroy(); self.NivelPoder56 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.image77 ~= nil then self.image77:destroy(); self.image77 = nil; end;
        if self.image158 ~= nil then self.image158:destroy(); self.image158 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.image127 ~= nil then self.image127:destroy(); self.image127 = nil; end;
        if self.PoderesEHabilidadesAntigo ~= nil then self.PoderesEHabilidadesAntigo:destroy(); self.PoderesEHabilidadesAntigo = nil; end;
        if self.PoderNivel80 ~= nil then self.PoderNivel80:destroy(); self.PoderNivel80 = nil; end;
        if self.NivelHabilidade39 ~= nil then self.NivelHabilidade39:destroy(); self.NivelHabilidade39 = nil; end;
        if self.NivelPoder58 ~= nil then self.NivelPoder58:destroy(); self.NivelPoder58 = nil; end;
        if self.InfHabilidades7 ~= nil then self.InfHabilidades7:destroy(); self.InfHabilidades7 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.NivelPoder77 ~= nil then self.NivelPoder77:destroy(); self.NivelPoder77 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.NivelPoder102 ~= nil then self.NivelPoder102:destroy(); self.NivelPoder102 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.InfPoderes11 ~= nil then self.InfPoderes11:destroy(); self.InfPoderes11 = nil; end;
        if self.NivelPoder15 ~= nil then self.NivelPoder15:destroy(); self.NivelPoder15 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.NivelHabilidade40 ~= nil then self.NivelHabilidade40:destroy(); self.NivelHabilidade40 = nil; end;
        if self.NivelPoder72 ~= nil then self.NivelPoder72:destroy(); self.NivelPoder72 = nil; end;
        if self.NivelPoder18 ~= nil then self.NivelPoder18:destroy(); self.NivelPoder18 = nil; end;
        if self.image84 ~= nil then self.image84:destroy(); self.image84 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.InfHabilidades6 ~= nil then self.InfHabilidades6:destroy(); self.InfHabilidades6 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.PoderNivel25 ~= nil then self.PoderNivel25:destroy(); self.PoderNivel25 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.image143 ~= nil then self.image143:destroy(); self.image143 = nil; end;
        if self.image131 ~= nil then self.image131:destroy(); self.image131 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.NivelPoder92 ~= nil then self.NivelPoder92:destroy(); self.NivelPoder92 = nil; end;
        if self.NivelPoder34 ~= nil then self.NivelPoder34:destroy(); self.NivelPoder34 = nil; end;
        if self.image116 ~= nil then self.image116:destroy(); self.image116 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.NivelHabilidade14 ~= nil then self.NivelHabilidade14:destroy(); self.NivelHabilidade14 = nil; end;
        if self.NivelPoder42 ~= nil then self.NivelPoder42:destroy(); self.NivelPoder42 = nil; end;
        if self.NivelPoder12 ~= nil then self.NivelPoder12:destroy(); self.NivelPoder12 = nil; end;
        if self.PoderNivel80edit ~= nil then self.PoderNivel80edit:destroy(); self.PoderNivel80edit = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.NivelHabilidade15 ~= nil then self.NivelHabilidade15:destroy(); self.NivelHabilidade15 = nil; end;
        if self.NivelHabilidade17 ~= nil then self.NivelHabilidade17:destroy(); self.NivelHabilidade17 = nil; end;
        if self.PoderesEHabilidadesNovo ~= nil then self.PoderesEHabilidadesNovo:destroy(); self.PoderesEHabilidadesNovo = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.image104 ~= nil then self.image104:destroy(); self.image104 = nil; end;
        if self.NivelHabilidade16 ~= nil then self.NivelHabilidade16:destroy(); self.NivelHabilidade16 = nil; end;
        if self.BotaoRolar4 ~= nil then self.BotaoRolar4:destroy(); self.BotaoRolar4 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.image113 ~= nil then self.image113:destroy(); self.image113 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.image112 ~= nil then self.image112:destroy(); self.image112 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.textEditor57 ~= nil then self.textEditor57:destroy(); self.textEditor57 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.NivelPoder39 ~= nil then self.NivelPoder39:destroy(); self.NivelPoder39 = nil; end;
        if self.NivelHabilidade25 ~= nil then self.NivelHabilidade25:destroy(); self.NivelHabilidade25 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.image102 ~= nil then self.image102:destroy(); self.image102 = nil; end;
        if self.image148 ~= nil then self.image148:destroy(); self.image148 = nil; end;
        if self.image74 ~= nil then self.image74:destroy(); self.image74 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.PoderNivel100 ~= nil then self.PoderNivel100:destroy(); self.PoderNivel100 = nil; end;
        if self.image142 ~= nil then self.image142:destroy(); self.image142 = nil; end;
        if self.NivelPoder14 ~= nil then self.NivelPoder14:destroy(); self.NivelPoder14 = nil; end;
        if self.NivelHabilidade3 ~= nil then self.NivelHabilidade3:destroy(); self.NivelHabilidade3 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.image80 ~= nil then self.image80:destroy(); self.image80 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.image155 ~= nil then self.image155:destroy(); self.image155 = nil; end;
        if self.image126 ~= nil then self.image126:destroy(); self.image126 = nil; end;
        if self.NivelPoder9 ~= nil then self.NivelPoder9:destroy(); self.NivelPoder9 = nil; end;
        if self.image110 ~= nil then self.image110:destroy(); self.image110 = nil; end;
        if self.image151 ~= nil then self.image151:destroy(); self.image151 = nil; end;
        if self.image101 ~= nil then self.image101:destroy(); self.image101 = nil; end;
        if self.image85 ~= nil then self.image85:destroy(); self.image85 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.InfPoderes2 ~= nil then self.InfPoderes2:destroy(); self.InfPoderes2 = nil; end;
        if self.NivelPoder79 ~= nil then self.NivelPoder79:destroy(); self.NivelPoder79 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.NivelPoder85 ~= nil then self.NivelPoder85:destroy(); self.NivelPoder85 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.NivelPoder11 ~= nil then self.NivelPoder11:destroy(); self.NivelPoder11 = nil; end;
        if self.NivelPoder67 ~= nil then self.NivelPoder67:destroy(); self.NivelPoder67 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.image154 ~= nil then self.image154:destroy(); self.image154 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.NivelHabilidade6 ~= nil then self.NivelHabilidade6:destroy(); self.NivelHabilidade6 = nil; end;
        if self.poderesEHabilidadesListados ~= nil then self.poderesEHabilidadesListados:destroy(); self.poderesEHabilidadesListados = nil; end;
        if self.image124 ~= nil then self.image124:destroy(); self.image124 = nil; end;
        if self.image79 ~= nil then self.image79:destroy(); self.image79 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.image118 ~= nil then self.image118:destroy(); self.image118 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.NivelPoder25 ~= nil then self.NivelPoder25:destroy(); self.NivelPoder25 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.image106 ~= nil then self.image106:destroy(); self.image106 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.NivelPoder20 ~= nil then self.NivelPoder20:destroy(); self.NivelPoder20 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.PoderNivel80edit1 ~= nil then self.PoderNivel80edit1:destroy(); self.PoderNivel80edit1 = nil; end;
        if self.InfPoderes4 ~= nil then self.InfPoderes4:destroy(); self.InfPoderes4 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.NivelPoder76 ~= nil then self.NivelPoder76:destroy(); self.NivelPoder76 = nil; end;
        if self.NivelPoder44 ~= nil then self.NivelPoder44:destroy(); self.NivelPoder44 = nil; end;
        if self.NivelHabilidade9 ~= nil then self.NivelHabilidade9:destroy(); self.NivelHabilidade9 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.NivelPoder5 ~= nil then self.NivelPoder5:destroy(); self.NivelPoder5 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.NivelPoder75 ~= nil then self.NivelPoder75:destroy(); self.NivelPoder75 = nil; end;
        if self.BotaoRolar8 ~= nil then self.BotaoRolar8:destroy(); self.BotaoRolar8 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.NivelPoder65 ~= nil then self.NivelPoder65:destroy(); self.NivelPoder65 = nil; end;
        if self.NivelPoder70 ~= nil then self.NivelPoder70:destroy(); self.NivelPoder70 = nil; end;
        if self.textEditor56 ~= nil then self.textEditor56:destroy(); self.textEditor56 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.NivelHabilidade35 ~= nil then self.NivelHabilidade35:destroy(); self.NivelHabilidade35 = nil; end;
        if self.image92 ~= nil then self.image92:destroy(); self.image92 = nil; end;
        if self.image153 ~= nil then self.image153:destroy(); self.image153 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.HabNivel50 ~= nil then self.HabNivel50:destroy(); self.HabNivel50 = nil; end;
        if self.PoderNivel0edit ~= nil then self.PoderNivel0edit:destroy(); self.PoderNivel0edit = nil; end;
        if self.NivelPoder99 ~= nil then self.NivelPoder99:destroy(); self.NivelPoder99 = nil; end;
        if self.image97 ~= nil then self.image97:destroy(); self.image97 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.NivelPoder61 ~= nil then self.NivelPoder61:destroy(); self.NivelPoder61 = nil; end;
        if self.InfPoderes5 ~= nil then self.InfPoderes5:destroy(); self.InfPoderes5 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.NivelPoder66 ~= nil then self.NivelPoder66:destroy(); self.NivelPoder66 = nil; end;
        if self.InfHabilidades10 ~= nil then self.InfHabilidades10:destroy(); self.InfHabilidades10 = nil; end;
        if self.image125 ~= nil then self.image125:destroy(); self.image125 = nil; end;
        if self.NivelPoder91 ~= nil then self.NivelPoder91:destroy(); self.NivelPoder91 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.image96 ~= nil then self.image96:destroy(); self.image96 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.NivelPoder96 ~= nil then self.NivelPoder96:destroy(); self.NivelPoder96 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.image99 ~= nil then self.image99:destroy(); self.image99 = nil; end;
        if self.NivelPoder101 ~= nil then self.NivelPoder101:destroy(); self.NivelPoder101 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.NivelPoder41 ~= nil then self.NivelPoder41:destroy(); self.NivelPoder41 = nil; end;
        if self.HabNivel50edit1 ~= nil then self.HabNivel50edit1:destroy(); self.HabNivel50edit1 = nil; end;
        if self.image146 ~= nil then self.image146:destroy(); self.image146 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.image108 ~= nil then self.image108:destroy(); self.image108 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.image89 ~= nil then self.image89:destroy(); self.image89 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.image93 ~= nil then self.image93:destroy(); self.image93 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.image90 ~= nil then self.image90:destroy(); self.image90 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.image159 ~= nil then self.image159:destroy(); self.image159 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.NivelHabilidade5 ~= nil then self.NivelHabilidade5:destroy(); self.NivelHabilidade5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.image134 ~= nil then self.image134:destroy(); self.image134 = nil; end;
        if self.NivelHabilidade42 ~= nil then self.NivelHabilidade42:destroy(); self.NivelHabilidade42 = nil; end;
        if self.BotaoRolar3 ~= nil then self.BotaoRolar3:destroy(); self.BotaoRolar3 = nil; end;
        if self.NivelPoder81 ~= nil then self.NivelPoder81:destroy(); self.NivelPoder81 = nil; end;
        if self.NivelHabilidade26 ~= nil then self.NivelHabilidade26:destroy(); self.NivelHabilidade26 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image121 ~= nil then self.image121:destroy(); self.image121 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.image73 ~= nil then self.image73:destroy(); self.image73 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.NivelHabilidade19 ~= nil then self.NivelHabilidade19:destroy(); self.NivelHabilidade19 = nil; end;
        if self.NivelHabilidade8 ~= nil then self.NivelHabilidade8:destroy(); self.NivelHabilidade8 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.NivelPoder74 ~= nil then self.NivelPoder74:destroy(); self.NivelPoder74 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.textEditor59 ~= nil then self.textEditor59:destroy(); self.textEditor59 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.NivelPoder49 ~= nil then self.NivelPoder49:destroy(); self.NivelPoder49 = nil; end;
        if self.NivelPoder60 ~= nil then self.NivelPoder60:destroy(); self.NivelPoder60 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.NivelPoder78 ~= nil then self.NivelPoder78:destroy(); self.NivelPoder78 = nil; end;
        if self.image72 ~= nil then self.image72:destroy(); self.image72 = nil; end;
        if self.NivelPoder83 ~= nil then self.NivelPoder83:destroy(); self.NivelPoder83 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.NivelPoder68 ~= nil then self.NivelPoder68:destroy(); self.NivelPoder68 = nil; end;
        if self.image71 ~= nil then self.image71:destroy(); self.image71 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.NivelHabilidade27 ~= nil then self.NivelHabilidade27:destroy(); self.NivelHabilidade27 = nil; end;
        if self.textEditor50 ~= nil then self.textEditor50:destroy(); self.textEditor50 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image119 ~= nil then self.image119:destroy(); self.image119 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.NivelPoder36 ~= nil then self.NivelPoder36:destroy(); self.NivelPoder36 = nil; end;
        if self.NivelPoder23 ~= nil then self.NivelPoder23:destroy(); self.NivelPoder23 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.NivelPoder16 ~= nil then self.NivelPoder16:destroy(); self.NivelPoder16 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.image111 ~= nil then self.image111:destroy(); self.image111 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.image98 ~= nil then self.image98:destroy(); self.image98 = nil; end;
        if self.NivelPoder45 ~= nil then self.NivelPoder45:destroy(); self.NivelPoder45 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.textEditor60 ~= nil then self.textEditor60:destroy(); self.textEditor60 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.HabNivel80edit1 ~= nil then self.HabNivel80edit1:destroy(); self.HabNivel80edit1 = nil; end;
        if self.image156 ~= nil then self.image156:destroy(); self.image156 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.NivelPoder31 ~= nil then self.NivelPoder31:destroy(); self.NivelPoder31 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image138 ~= nil then self.image138:destroy(); self.image138 = nil; end;
        if self.NivelPoder32 ~= nil then self.NivelPoder32:destroy(); self.NivelPoder32 = nil; end;
        if self.image163 ~= nil then self.image163:destroy(); self.image163 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.image141 ~= nil then self.image141:destroy(); self.image141 = nil; end;
        if self.image164 ~= nil then self.image164:destroy(); self.image164 = nil; end;
        if self.image115 ~= nil then self.image115:destroy(); self.image115 = nil; end;
        if self.NivelPoder21 ~= nil then self.NivelPoder21:destroy(); self.NivelPoder21 = nil; end;
        if self.NivelPoder48 ~= nil then self.NivelPoder48:destroy(); self.NivelPoder48 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.InfHabilidades4 ~= nil then self.InfHabilidades4:destroy(); self.InfHabilidades4 = nil; end;
        if self.NivelHabilidade31 ~= nil then self.NivelHabilidade31:destroy(); self.NivelHabilidade31 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.image150 ~= nil then self.image150:destroy(); self.image150 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.NivelPoder8 ~= nil then self.NivelPoder8:destroy(); self.NivelPoder8 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.NivelHabilidade4 ~= nil then self.NivelHabilidade4:destroy(); self.NivelHabilidade4 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image86 ~= nil then self.image86:destroy(); self.image86 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.BotaoRolar2 ~= nil then self.BotaoRolar2:destroy(); self.BotaoRolar2 = nil; end;
        if self.HabNivel20 ~= nil then self.HabNivel20:destroy(); self.HabNivel20 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.NivelPoder37 ~= nil then self.NivelPoder37:destroy(); self.NivelPoder37 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.AreaqSeraApagada ~= nil then self.AreaqSeraApagada:destroy(); self.AreaqSeraApagada = nil; end;
        if self.image114 ~= nil then self.image114:destroy(); self.image114 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor41 ~= nil then self.textEditor41:destroy(); self.textEditor41 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.NivelPoder86 ~= nil then self.NivelPoder86:destroy(); self.NivelPoder86 = nil; end;
        if self.InfPoderes14 ~= nil then self.InfPoderes14:destroy(); self.InfPoderes14 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.NivelHabilidade2 ~= nil then self.NivelHabilidade2:destroy(); self.NivelHabilidade2 = nil; end;
        if self.image160 ~= nil then self.image160:destroy(); self.image160 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.NivelHabilidade10 ~= nil then self.NivelHabilidade10:destroy(); self.NivelHabilidade10 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.NivelPoder50 ~= nil then self.NivelPoder50:destroy(); self.NivelPoder50 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.textEditor39 ~= nil then self.textEditor39:destroy(); self.textEditor39 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.PoderNivel0edit1 ~= nil then self.PoderNivel0edit1:destroy(); self.PoderNivel0edit1 = nil; end;
        if self.NivelPoder13 ~= nil then self.NivelPoder13:destroy(); self.NivelPoder13 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.NivelPoder22 ~= nil then self.NivelPoder22:destroy(); self.NivelPoder22 = nil; end;
        if self.NivelHabilidade36 ~= nil then self.NivelHabilidade36:destroy(); self.NivelHabilidade36 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.NivelPoder53 ~= nil then self.NivelPoder53:destroy(); self.NivelPoder53 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.image128 ~= nil then self.image128:destroy(); self.image128 = nil; end;
        if self.HabNivel50edit ~= nil then self.HabNivel50edit:destroy(); self.HabNivel50edit = nil; end;
        if self.NivelPoder30 ~= nil then self.NivelPoder30:destroy(); self.NivelPoder30 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.NivelPoder55 ~= nil then self.NivelPoder55:destroy(); self.NivelPoder55 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.PoderNivel25edit ~= nil then self.PoderNivel25edit:destroy(); self.PoderNivel25edit = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.NivelPoder100 ~= nil then self.NivelPoder100:destroy(); self.NivelPoder100 = nil; end;
        if self.NivelPoder62 ~= nil then self.NivelPoder62:destroy(); self.NivelPoder62 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.NivelPoder51 ~= nil then self.NivelPoder51:destroy(); self.NivelPoder51 = nil; end;
        if self.NivelPoder82 ~= nil then self.NivelPoder82:destroy(); self.NivelPoder82 = nil; end;
        if self.InfHabilidades13 ~= nil then self.InfHabilidades13:destroy(); self.InfHabilidades13 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.NivelHabilidade12 ~= nil then self.NivelHabilidade12:destroy(); self.NivelHabilidade12 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.image69 ~= nil then self.image69:destroy(); self.image69 = nil; end;
        if self.textEditor44 ~= nil then self.textEditor44:destroy(); self.textEditor44 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.image87 ~= nil then self.image87:destroy(); self.image87 = nil; end;
        if self.NivelPoder87 ~= nil then self.NivelPoder87:destroy(); self.NivelPoder87 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.image162 ~= nil then self.image162:destroy(); self.image162 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.InfPoderes15 ~= nil then self.InfPoderes15:destroy(); self.InfPoderes15 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.image130 ~= nil then self.image130:destroy(); self.image130 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.NivelHabilidade18 ~= nil then self.NivelHabilidade18:destroy(); self.NivelHabilidade18 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.BotaoRolar1 ~= nil then self.BotaoRolar1:destroy(); self.BotaoRolar1 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.NivelPoder43 ~= nil then self.NivelPoder43:destroy(); self.NivelPoder43 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.NivelPoder47 ~= nil then self.NivelPoder47:destroy(); self.NivelPoder47 = nil; end;
        if self.InfPoderes13 ~= nil then self.InfPoderes13:destroy(); self.InfPoderes13 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.NivelPoder90 ~= nil then self.NivelPoder90:destroy(); self.NivelPoder90 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.rolarPoder ~= nil then self.rolarPoder:destroy(); self.rolarPoder = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.textEditor53 ~= nil then self.textEditor53:destroy(); self.textEditor53 = nil; end;
        if self.BotaoRolar7 ~= nil then self.BotaoRolar7:destroy(); self.BotaoRolar7 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.NivelHabilidade38 ~= nil then self.NivelHabilidade38:destroy(); self.NivelHabilidade38 = nil; end;
        if self.InfPoderes10 ~= nil then self.InfPoderes10:destroy(); self.InfPoderes10 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmProjetoXII11_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmProjetoXII11_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmProjetoXII11_svg = {
    newEditor = newfrmProjetoXII11_svg, 
    new = newfrmProjetoXII11_svg, 
    name = "frmProjetoXII11_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmProjetoXII11_svg = _frmProjetoXII11_svg;
Firecast.registrarForm(_frmProjetoXII11_svg);

return _frmProjetoXII11_svg;
