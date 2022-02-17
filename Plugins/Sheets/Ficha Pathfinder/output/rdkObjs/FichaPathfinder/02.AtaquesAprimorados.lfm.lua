require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister2a_svg()
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
    obj:setName("frmFichaRPGmeister2a_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(205);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Novo Ataque");
    obj.button1:setAlign("top");
    obj.button1:setHeight(20);
    obj.button1:setMargins({top=2,bottom=2});
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(205);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setPadding({top=2,bottom=2,left=2,right=2});
    obj.rectangle1:setName("rectangle1");

    obj.rclListaDosAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosAtaques:setParent(obj.rectangle1);
    obj.rclListaDosAtaques:setName("rclListaDosAtaques");
    obj.rclListaDosAtaques:setField("campoDosAtaques");
    obj.rclListaDosAtaques:setTemplateForm("frmFichaRPGmeister2AS_svg");
    obj.rclListaDosAtaques:setAlign("client");
    obj.rclListaDosAtaques:setSelectable(true);
    obj.rclListaDosAtaques:setLayout("vertical");
    obj.rclListaDosAtaques:setMinQt(1);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(1134);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setPadding({top=2,bottom=2,left=2,right=2});
    obj.rectangle2:setName("rectangle2");

    obj.boxDetalhesDoAtaque = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoAtaque:setParent(obj.rectangle2);
    obj.boxDetalhesDoAtaque:setName("boxDetalhesDoAtaque");
    obj.boxDetalhesDoAtaque:setVisible(false);
    obj.boxDetalhesDoAtaque:setAlign("client");


					local numeroAtaques = 0;
					local ataquesFeitos = 0;
					local ataqueID=1;
					local weaponID=1;
					local dadoAtaques = {};
					local resultadoAtaques = {};
					local rolando = false;

					local function proximoCritico(rolado)
						ataquesFeitos = ataquesFeitos + 1;

						local personagem = sheet.nome or "personagem";
						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
						local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

						if ataquesFeitos < numeroAtaques then
							ataqueID = ataqueID + 1;
							if ataqueID > weapons[weaponID].numAtaques then
								ataqueID = 1;
								weaponID = weaponID+1;
							end;

							local decisivo = weapons[weaponID].decisivo;
							local armamento = weapons[weaponID].nomeAtaque or "arma";
							local crit = weapons[weaponID].crit;

							if dadoAtaques[ataquesFeitos+1]>=decisivo then
								local rolagem = Firecast.interpretarRolagem(crit);
								mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
									function (rolado)
										proximoCritico(rolado)
								end);
							else
								proximoCritico(nil);
							end;
						else
							rolando = false;
						end;
						-- Fim do Ataque
					end;

					local function proximaConfirmacao(rolado)
						ataquesFeitos = ataquesFeitos + 1;

						local personagem = sheet.nome or "personagem";
						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
						local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

						if ataquesFeitos < numeroAtaques then
							ataqueID = ataqueID + 1;
							if ataqueID > weapons[weaponID].numAtaques then
								ataqueID = 1;
								weaponID = weaponID+1;
							end;

							local acertos = weapons[weaponID].acertos;
							local decisivo = weapons[weaponID].decisivo;
							local armamento = weapons[weaponID].nomeAtaque or "arma";
							local conf = tonumber(weapons[weaponID].confirmacaoAtaq) or 0;
							if dadoAtaques[ataquesFeitos+1]>=decisivo then
								local confirmacao = Firecast.interpretarRolagem("1d20+" .. (acertos[ataqueID] + conf));
								mesaDoPersonagem.activeChat:rolarDados(confirmacao, "Confirmação de Decisivo do ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
									function (rolado)
										proximaConfirmacao(rolado)
								end);
							else
								proximaConfirmacao(nil);
							end;
						else
							-- Causa o dano adicional

							weaponID = 1;
							ataqueID = 1;
							ataquesFeitos = 0;

							local decisivo = weapons[weaponID].decisivo;
							local armamento = weapons[weaponID].nomeAtaque or "arma";
							local crit = weapons[weaponID].crit;

							if dadoAtaques[ataquesFeitos+1]>=decisivo then
								local rolagem = Firecast.interpretarRolagem(crit);
								mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
									function (rolado)
										proximoCritico(rolado)
								end);
							else
								proximoCritico(nil);
							end;
						end;
					end;

					local function proximoDano(rolado)
						ataquesFeitos = ataquesFeitos + 1;

						local personagem = sheet.nome or "personagem";
						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
						local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

						if ataquesFeitos < numeroAtaques then
							ataqueID = ataqueID + 1;
							if ataqueID > weapons[weaponID].numAtaques then
								ataqueID = 1;
								weaponID = weaponID+1;
							end;

							local dano = weapons[weaponID].dado;
							local armamento = weapons[weaponID].nomeAtaque or "arma";

							local rolagem = Firecast.interpretarRolagem(dano);
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximoDano(rolado)
							end);
						else
							-- confirma os criticos

							-- reseta variaveis
							weaponID = 1;
							ataqueID = 1;
							ataquesFeitos = 0;

							local acertos = weapons[weaponID].acertos;
							local decisivo = weapons[weaponID].decisivo;
							local armamento = weapons[weaponID].nomeAtaque or "arma";
							local conf = tonumber(weapons[weaponID].confirmacaoAtaq) or 0;
							if dadoAtaques[ataquesFeitos+1]>=decisivo then
								local confirmacao = Firecast.interpretarRolagem("1d20+" .. (acertos[ataqueID]+conf));
								mesaDoPersonagem.activeChat:rolarDados(confirmacao, "Confirmação de Decisivo do ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
									function (rolado)
										proximaConfirmacao(rolado)
								end);
							else
								proximaConfirmacao(nil);
							end;
						end
					end;

					local function proximoAtaque(rolado)
						ataquesFeitos = ataquesFeitos + 1;
						dadoAtaques[ataquesFeitos] = rolado.ops[1].resultados[1];
						resultadoAtaques[ataquesFeitos] = rolado.resultado;

						local personagem = sheet.nome or "personagem";
						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
						local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

						if ataquesFeitos < numeroAtaques then
							ataqueID = ataqueID + 1;
							if ataqueID > weapons[weaponID].numAtaques then
								ataqueID = 1;
								weaponID = weaponID+1;
							end;

							local acertos = weapons[weaponID].acertos;
							local armamento = weapons[weaponID].nomeAtaque or "arma";

							local rolagem = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximoAtaque(rolado)
							end);

						else
							-- chama o dano

							-- reseta variaveis
							weaponID = 1;
							ataqueID = 1;
							ataquesFeitos = 0;

							local dano = weapons[weaponID].dado;
							local armamento = weapons[weaponID].nomeAtaque or "arma";

							local rolagem = Firecast.interpretarRolagem(dano);
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximoDano(rolado)
							end);
						end
					end;

					


    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalhesDoAtaque);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(55);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(20);
    obj.edit1:setField("nomeAtaque");
    obj.edit1:setName("edit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("Nova Arma");
    obj.button2:setLeft(360);
    obj.button2:setTop(5);
    obj.button2:setWidth(100);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setText("Ataque Total");
    obj.button3:setLeft(465);
    obj.button3:setTop(5);
    obj.button3:setWidth(100);
    obj.button3:setHeight(20);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setText("Cancelar");
    obj.button4:setLeft(570);
    obj.button4:setTop(5);
    obj.button4:setWidth(100);
    obj.button4:setHeight(20);
    obj.button4:setName("button4");

    obj.rclListaDeArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeArmas:setParent(obj.boxDetalhesDoAtaque);
    obj.rclListaDeArmas:setName("rclListaDeArmas");
    obj.rclListaDeArmas:setField("campoDeArmas");
    obj.rclListaDeArmas:setTemplateForm("frmWeaponConfig");
    obj.rclListaDeArmas:setAlign("client");
    obj.rclListaDeArmas:setLayout("vertical");
    obj.rclListaDeArmas:setMinQt(1);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDosAtaques:append();
        end, obj);

    obj._e_event1 = obj.rclListaDosAtaques:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosAtaques.selectedNode;
            						self.boxDetalhesDoAtaque.node = node;
            						self.boxDetalhesDoAtaque.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclListaDosAtaques:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosAtaques.selectedNode == nil and sheet ~= nil then
            							local nodes = NDB.getChildNodes(sheet.campoDosAtaques);               
            							if #nodes > 0 then
            								self.rclListaDosAtaques.selectedNode = nodes[1];
            							end;
            						end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclListaDeArmas:append();
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil then
            								return;
            							end;
            							if rolando then
            								return;
            							end;
            							rolando = true;
            							
            							local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            							local personagem = sheet.nome or "personagem";
            
            							--limpando variaveis do ultimo ataque
            							dadoAtaques = {};
            							resultadoAtaques = {};
            							ataquesFeitos = 0;
            							multMunicao = 0;
            							ataqueID=1;
            							weaponID=1;
            
            							numeroAtaques = 0;
            							for i=1, #weapons, 1 do
            								weapons[i].atualizar = not (weapons[i].atualizar==true);
            								numeroAtaques = numeroAtaques + weapons[i].numAtaques;
            
            								if weapons[i].municao~= nil then
            									local municao = tonumber(weapons[i].municao) or 0;
            									local multMunicao = tonumber(weapons[i].multMunicao) or 0;
            									if numeroAtaques > municao then
            										weapons[i].municao = 0;
            										mesaDoPersonagem.activeChat:enviarMensagem("Esta arma possui apenas " .. municao .. " das " .. numeroAtaques .. " munições necessarias para atacar.");
            									else
            										weapons[i].municao = municao - numeroAtaques - multMunicao;
            									end;
            								end;
            							end;
            
            							--preparando ataque
            							local acertos = weapons[weaponID].acertos;
            							local armamento = weapons[weaponID].nomeAtaque or "arma";
            
            							local rolagem = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
            							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
            								function (rolado)
            									proximoAtaque(rolado)
            							end);
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            rolando =false;
        end, obj);

    function obj:_releaseEvents()
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

        if self.rclListaDeArmas ~= nil then self.rclListaDeArmas:destroy(); self.rclListaDeArmas = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rclListaDosAtaques ~= nil then self.rclListaDosAtaques:destroy(); self.rclListaDosAtaques = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.boxDetalhesDoAtaque ~= nil then self.boxDetalhesDoAtaque:destroy(); self.boxDetalhesDoAtaque = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister2a_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister2a_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister2a_svg = {
    newEditor = newfrmFichaRPGmeister2a_svg, 
    new = newfrmFichaRPGmeister2a_svg, 
    name = "frmFichaRPGmeister2a_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister2a_svg = _frmFichaRPGmeister2a_svg;
Firecast.registrarForm(_frmFichaRPGmeister2a_svg);

return _frmFichaRPGmeister2a_svg;
