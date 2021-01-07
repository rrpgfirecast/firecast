require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmEquipamentoItem()
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
    obj:setName("frmEquipamentoItem");


			local function atualizarDesiredHeight()
				local margins = self.layPrincipal.margins;
				local h = self.fraLayout:getHeight() + 2 + margins.top + margins.bottom;
				local ultObjMenu = self.btnRolarAtaque;
				local mH = ultObjMenu.top + ultObjMenu.height + self.layMenu.top + self.layMenu.margins.bottom;
				
				if h < mH then
					h = mH;
				end;
				
				self.height = h;			
			end;
			
			local function askForDelete()
				dialogs.confirmYesNo("Deseja realmente apagar este item?",
									 function (confirmado)
										if confirmado then
											ndb.deleteNode(self.sheet);
										end;
									 end);
			end;
			
			local function rolarAtaque()
				local personagem = rrpg.getPersonagemDe(sheet);				
				
				if (personagem ~= nil) then
					local mesa = personagem.mesa;
				
					if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
						-- rollar						
						local rolagem = rrpg.interpretarRolagem(sheet.ataque);
						local rolagemDano = rrpg.interpretarRolagem(sheet.dano);
						local ataqueStr = "Ataque";
						local danoStr = "Dano";
						
						if not rolagem.possuiAlgumDado then
							rolagem = rrpg.interpretarRolagem("1d20"):concatenar(rolagem);
						end;
										
						if sheet.nome ~= nil then
							ataqueStr = ataqueStr .. " - " .. sheet.nome .. "";
							danoStr = danoStr .. " - " .. sheet.nome .. "";
						end;
										
						mesa.chat:rolarDados(rolagem, ataqueStr);						
						
						if (#rolagemDano.ops > 0) and (rolagemDano.possuiAlgumDado) then					
							mesa.chat:rolarDados(rolagemDano, danoStr);
						end;
					else
						showMessage("Você não pode rolar dados por este personagem");
					end;
				end;
			end;
				
			


    obj.layMenu = GUI.fromHandle(_obj_newObject("layout"));
    obj.layMenu:setParent(obj);
    obj.layMenu:setAlign("left");
    obj.layMenu:setWidth(64);
    obj.layMenu:setMargins({top=10, left=3, bottom=10});
    obj.layMenu:setName("layMenu");

    obj.btnApagar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnApagar:setParent(obj.layMenu);
    obj.btnApagar:setAlign("top");
    obj.btnApagar:setText("Apagar");
    obj.btnApagar:setName("btnApagar");
    obj.btnApagar:setMargins({bottom=6});
    obj.btnApagar:setHeight(32);

    obj.btnRolarAtaque = GUI.fromHandle(_obj_newObject("button"));
    obj.btnRolarAtaque:setParent(obj.layMenu);
    obj.btnRolarAtaque:setName("btnRolarAtaque");
    obj.btnRolarAtaque:setAlign("top");
    obj.btnRolarAtaque:setText("Rolar");
    obj.btnRolarAtaque:setMargins({bottom=6});
    obj.btnRolarAtaque:setHeight(32);

    obj.layPrincipal = GUI.fromHandle(_obj_newObject("layout"));
    obj.layPrincipal:setParent(obj);
    obj.layPrincipal:setAlign("client");
    obj.layPrincipal:setMargins({top=8, bottom=8});
    obj.layPrincipal:setName("layPrincipal");

    obj.fraLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayout:setParent(obj.layPrincipal);
    obj.fraLayout:setName("fraLayout");
    obj.fraLayout:setAvoidScale(true);
    obj.fraLayout:setAutoHeight(true);
    obj.fraLayout:setVertAlign("trailing");
    obj.fraLayout:setAlign("top");
    obj.fraLayout:setLineSpacing(2);
    obj.fraLayout:setHorzAlign("justify");
    obj.fraLayout:setMargins({left=5, right=5, top=2, bottom=2});
    obj.fraLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraLayout:setMinScaledWidth(300);

    obj.GridCampoSolido1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido1:setParent(obj.fraLayout);
    obj.GridCampoSolido1:setHeight(40);
    obj.GridCampoSolido1:setMinScaledWidth(190);
    obj.GridCampoSolido1:setMinWidth(190);
    obj.GridCampoSolido1:setMaxWidth(400);
    obj.GridCampoSolido1:setMaxScaledWidth(400);
    obj.GridCampoSolido1:setAvoidScale(true);
    obj.GridCampoSolido1:setName("GridCampoSolido1");
    obj.GridCampoSolido1:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido1:setVertAlign("leading");

    obj.edtGridCampoSolido1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.edtGridCampoSolido1:setName("edtGridCampoSolido1");
    obj.edtGridCampoSolido1:setAlign("top");
    obj.edtGridCampoSolido1:setField("nome");
    obj.edtGridCampoSolido1:setFontSize(13);
    obj.edtGridCampoSolido1:setTransparent(false);
    obj.edtGridCampoSolido1:setVertTextAlign("center");
    obj.edtGridCampoSolido1:setHeight(30);
    obj.edtGridCampoSolido1:setWidth(195);
    obj.edtGridCampoSolido1:setFontColor("white");

    obj.labGridCampoSolido1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.labGridCampoSolido1:setName("labGridCampoSolido1");
    obj.labGridCampoSolido1:setAlign("top");
    obj.labGridCampoSolido1:setText("NOME");
    obj.labGridCampoSolido1:setVertTextAlign("leading");
    obj.labGridCampoSolido1:setWordWrap(true);
    obj.labGridCampoSolido1:setTextTrimming("none");
    obj.labGridCampoSolido1:setFontSize(12);
    obj.labGridCampoSolido1:setFontColor("#D0D0D0");

    self.GridCampoSolido1:setHeight(self.edtGridCampoSolido1:getHeight() + self.labGridCampoSolido1:getHeight());


    obj.GridCampoSolido2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido2:setParent(obj.fraLayout);
    obj.GridCampoSolido2:setHeight(40);
    obj.GridCampoSolido2:setMinScaledWidth(50);
    obj.GridCampoSolido2:setMinWidth(50);
    obj.GridCampoSolido2:setMaxWidth(200);
    obj.GridCampoSolido2:setMaxScaledWidth(200);
    obj.GridCampoSolido2:setAvoidScale(true);
    obj.GridCampoSolido2:setName("GridCampoSolido2");
    obj.GridCampoSolido2:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido2:setVertAlign("leading");

    obj.edtGridCampoSolido2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.edtGridCampoSolido2:setName("edtGridCampoSolido2");
    obj.edtGridCampoSolido2:setAlign("top");
    obj.edtGridCampoSolido2:setField("peso");
    obj.edtGridCampoSolido2:setFontSize(13);
    obj.edtGridCampoSolido2:setTransparent(false);
    obj.edtGridCampoSolido2:setVertTextAlign("center");
    obj.edtGridCampoSolido2:setHeight(30);
    obj.edtGridCampoSolido2:setWidth(195);
    obj.edtGridCampoSolido2:setFontColor("white");

    obj.labGridCampoSolido2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.labGridCampoSolido2:setName("labGridCampoSolido2");
    obj.labGridCampoSolido2:setAlign("top");
    obj.labGridCampoSolido2:setText("PESO");
    obj.labGridCampoSolido2:setVertTextAlign("leading");
    obj.labGridCampoSolido2:setWordWrap(true);
    obj.labGridCampoSolido2:setTextTrimming("none");
    obj.labGridCampoSolido2:setFontSize(12);
    obj.labGridCampoSolido2:setFontColor("#D0D0D0");

    self.GridCampoSolido2:setHeight(self.edtGridCampoSolido2:getHeight() + self.labGridCampoSolido2:getHeight());


    obj.GridCampoSolido3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido3:setParent(obj.fraLayout);
    obj.GridCampoSolido3:setHeight(40);
    obj.GridCampoSolido3:setMinScaledWidth(80);
    obj.GridCampoSolido3:setMinWidth(80);
    obj.GridCampoSolido3:setMaxWidth(233);
    obj.GridCampoSolido3:setMaxScaledWidth(233);
    obj.GridCampoSolido3:setAvoidScale(true);
    obj.GridCampoSolido3:setName("GridCampoSolido3");
    obj.GridCampoSolido3:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido3:setVertAlign("leading");

    obj.edtGridCampoSolido3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.edtGridCampoSolido3:setName("edtGridCampoSolido3");
    obj.edtGridCampoSolido3:setAlign("top");
    obj.edtGridCampoSolido3:setField("ataque");
    obj.edtGridCampoSolido3:setFontSize(13);
    obj.edtGridCampoSolido3:setTransparent(false);
    obj.edtGridCampoSolido3:setVertTextAlign("center");
    obj.edtGridCampoSolido3:setHeight(30);
    obj.edtGridCampoSolido3:setWidth(195);
    obj.edtGridCampoSolido3:setFontColor("white");

    obj.labGridCampoSolido3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.labGridCampoSolido3:setName("labGridCampoSolido3");
    obj.labGridCampoSolido3:setAlign("top");
    obj.labGridCampoSolido3:setText("ATAQUE");
    obj.labGridCampoSolido3:setVertTextAlign("leading");
    obj.labGridCampoSolido3:setWordWrap(true);
    obj.labGridCampoSolido3:setTextTrimming("none");
    obj.labGridCampoSolido3:setFontSize(12);
    obj.labGridCampoSolido3:setFontColor("#D0D0D0");

    self.GridCampoSolido3:setHeight(self.edtGridCampoSolido3:getHeight() + self.labGridCampoSolido3:getHeight());


    obj.GridCampoSolido4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido4:setParent(obj.fraLayout);
    obj.GridCampoSolido4:setHeight(40);
    obj.GridCampoSolido4:setMinScaledWidth(80);
    obj.GridCampoSolido4:setMinWidth(80);
    obj.GridCampoSolido4:setMaxWidth(233);
    obj.GridCampoSolido4:setMaxScaledWidth(233);
    obj.GridCampoSolido4:setAvoidScale(true);
    obj.GridCampoSolido4:setName("GridCampoSolido4");
    obj.GridCampoSolido4:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido4:setVertAlign("leading");

    obj.edtGridCampoSolido4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.edtGridCampoSolido4:setName("edtGridCampoSolido4");
    obj.edtGridCampoSolido4:setAlign("top");
    obj.edtGridCampoSolido4:setField("dano");
    obj.edtGridCampoSolido4:setFontSize(13);
    obj.edtGridCampoSolido4:setTransparent(false);
    obj.edtGridCampoSolido4:setVertTextAlign("center");
    obj.edtGridCampoSolido4:setHeight(30);
    obj.edtGridCampoSolido4:setWidth(195);
    obj.edtGridCampoSolido4:setFontColor("white");

    obj.labGridCampoSolido4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.labGridCampoSolido4:setName("labGridCampoSolido4");
    obj.labGridCampoSolido4:setAlign("top");
    obj.labGridCampoSolido4:setText("DANO");
    obj.labGridCampoSolido4:setVertTextAlign("leading");
    obj.labGridCampoSolido4:setWordWrap(true);
    obj.labGridCampoSolido4:setTextTrimming("none");
    obj.labGridCampoSolido4:setFontSize(12);
    obj.labGridCampoSolido4:setFontColor("#D0D0D0");

    self.GridCampoSolido4:setHeight(self.edtGridCampoSolido4:getHeight() + self.labGridCampoSolido4:getHeight());


    obj.GridCampoSolido5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido5:setParent(obj.fraLayout);
    obj.GridCampoSolido5:setHeight(40);
    obj.GridCampoSolido5:setMinScaledWidth(100);
    obj.GridCampoSolido5:setMinWidth(100);
    obj.GridCampoSolido5:setMaxWidth(233);
    obj.GridCampoSolido5:setMaxScaledWidth(233);
    obj.GridCampoSolido5:setAvoidScale(true);
    obj.GridCampoSolido5:setName("GridCampoSolido5");
    obj.GridCampoSolido5:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido5:setVertAlign("leading");

    obj.edtGridCampoSolido5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.edtGridCampoSolido5:setName("edtGridCampoSolido5");
    obj.edtGridCampoSolido5:setAlign("top");
    obj.edtGridCampoSolido5:setField("tipo");
    obj.edtGridCampoSolido5:setFontSize(13);
    obj.edtGridCampoSolido5:setTransparent(false);
    obj.edtGridCampoSolido5:setVertTextAlign("center");
    obj.edtGridCampoSolido5:setHeight(30);
    obj.edtGridCampoSolido5:setWidth(195);
    obj.edtGridCampoSolido5:setFontColor("white");

    obj.labGridCampoSolido5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.labGridCampoSolido5:setName("labGridCampoSolido5");
    obj.labGridCampoSolido5:setAlign("top");
    obj.labGridCampoSolido5:setText("TIPO");
    obj.labGridCampoSolido5:setVertTextAlign("leading");
    obj.labGridCampoSolido5:setWordWrap(true);
    obj.labGridCampoSolido5:setTextTrimming("none");
    obj.labGridCampoSolido5:setFontSize(12);
    obj.labGridCampoSolido5:setFontColor("#D0D0D0");

    self.GridCampoSolido5:setHeight(self.edtGridCampoSolido5:getHeight() + self.labGridCampoSolido5:getHeight());


    obj.GridCampoSolido6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido6:setParent(obj.fraLayout);
    obj.GridCampoSolido6:setHeight(40);
    obj.GridCampoSolido6:setMinScaledWidth(150);
    obj.GridCampoSolido6:setMinWidth(150);
    obj.GridCampoSolido6:setMaxWidth(360);
    obj.GridCampoSolido6:setMaxScaledWidth(360);
    obj.GridCampoSolido6:setAvoidScale(true);
    obj.GridCampoSolido6:setName("GridCampoSolido6");
    obj.GridCampoSolido6:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido6:setVertAlign("leading");

    obj.edtGridCampoSolido6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.edtGridCampoSolido6:setName("edtGridCampoSolido6");
    obj.edtGridCampoSolido6:setAlign("top");
    obj.edtGridCampoSolido6:setField("propriedades");
    obj.edtGridCampoSolido6:setFontSize(13);
    obj.edtGridCampoSolido6:setTransparent(false);
    obj.edtGridCampoSolido6:setVertTextAlign("center");
    obj.edtGridCampoSolido6:setHeight(30);
    obj.edtGridCampoSolido6:setWidth(195);
    obj.edtGridCampoSolido6:setFontColor("white");

    obj.labGridCampoSolido6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.labGridCampoSolido6:setName("labGridCampoSolido6");
    obj.labGridCampoSolido6:setAlign("top");
    obj.labGridCampoSolido6:setText("PROPRIEDADES");
    obj.labGridCampoSolido6:setVertTextAlign("leading");
    obj.labGridCampoSolido6:setWordWrap(true);
    obj.labGridCampoSolido6:setTextTrimming("none");
    obj.labGridCampoSolido6:setFontSize(12);
    obj.labGridCampoSolido6:setFontColor("#D0D0D0");

    self.GridCampoSolido6:setHeight(self.edtGridCampoSolido6:getHeight() + self.labGridCampoSolido6:getHeight());


    obj.GridCampoSolido7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido7:setParent(obj.fraLayout);
    obj.GridCampoSolido7:setHeight(40);
    obj.GridCampoSolido7:setMinScaledWidth(100);
    obj.GridCampoSolido7:setMinWidth(100);
    obj.GridCampoSolido7:setMaxWidth(233);
    obj.GridCampoSolido7:setMaxScaledWidth(233);
    obj.GridCampoSolido7:setAvoidScale(true);
    obj.GridCampoSolido7:setName("GridCampoSolido7");
    obj.GridCampoSolido7:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido7:setVertAlign("leading");

    obj.edtGridCampoSolido7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.edtGridCampoSolido7:setName("edtGridCampoSolido7");
    obj.edtGridCampoSolido7:setAlign("top");
    obj.edtGridCampoSolido7:setField("alcance");
    obj.edtGridCampoSolido7:setFontSize(13);
    obj.edtGridCampoSolido7:setTransparent(false);
    obj.edtGridCampoSolido7:setVertTextAlign("center");
    obj.edtGridCampoSolido7:setHeight(30);
    obj.edtGridCampoSolido7:setWidth(195);
    obj.edtGridCampoSolido7:setFontColor("white");

    obj.labGridCampoSolido7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.labGridCampoSolido7:setName("labGridCampoSolido7");
    obj.labGridCampoSolido7:setAlign("top");
    obj.labGridCampoSolido7:setText("ALCANCE");
    obj.labGridCampoSolido7:setVertTextAlign("leading");
    obj.labGridCampoSolido7:setWordWrap(true);
    obj.labGridCampoSolido7:setTextTrimming("none");
    obj.labGridCampoSolido7:setFontSize(12);
    obj.labGridCampoSolido7:setFontColor("#D0D0D0");

    self.GridCampoSolido7:setHeight(self.edtGridCampoSolido7:getHeight() + self.labGridCampoSolido7:getHeight());


    obj.GridCampoSolido8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido8:setParent(obj.fraLayout);
    obj.GridCampoSolido8:setHeight(40);
    obj.GridCampoSolido8:setMinScaledWidth(100);
    obj.GridCampoSolido8:setMinWidth(100);
    obj.GridCampoSolido8:setMaxWidth(233);
    obj.GridCampoSolido8:setMaxScaledWidth(233);
    obj.GridCampoSolido8:setAvoidScale(true);
    obj.GridCampoSolido8:setName("GridCampoSolido8");
    obj.GridCampoSolido8:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido8:setVertAlign("leading");

    obj.edtGridCampoSolido8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.edtGridCampoSolido8:setName("edtGridCampoSolido8");
    obj.edtGridCampoSolido8:setAlign("top");
    obj.edtGridCampoSolido8:setField("municao");
    obj.edtGridCampoSolido8:setFontSize(13);
    obj.edtGridCampoSolido8:setTransparent(false);
    obj.edtGridCampoSolido8:setVertTextAlign("center");
    obj.edtGridCampoSolido8:setHeight(30);
    obj.edtGridCampoSolido8:setWidth(195);
    obj.edtGridCampoSolido8:setFontColor("white");

    obj.labGridCampoSolido8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.labGridCampoSolido8:setName("labGridCampoSolido8");
    obj.labGridCampoSolido8:setAlign("top");
    obj.labGridCampoSolido8:setText("MUNIÇÃO");
    obj.labGridCampoSolido8:setVertTextAlign("leading");
    obj.labGridCampoSolido8:setWordWrap(true);
    obj.labGridCampoSolido8:setTextTrimming("none");
    obj.labGridCampoSolido8:setFontSize(12);
    obj.labGridCampoSolido8:setFontColor("#D0D0D0");

    self.GridCampoSolido8:setHeight(self.edtGridCampoSolido8:getHeight() + self.labGridCampoSolido8:getHeight());


    obj.GridCampoSolido9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido9:setParent(obj.fraLayout);
    obj.GridCampoSolido9:setHeight(40);
    obj.GridCampoSolido9:setMinScaledWidth(50);
    obj.GridCampoSolido9:setMinWidth(50);
    obj.GridCampoSolido9:setMaxWidth(80);
    obj.GridCampoSolido9:setMaxScaledWidth(80);
    obj.GridCampoSolido9:setAvoidScale(true);
    obj.GridCampoSolido9:setName("GridCampoSolido9");
    obj.GridCampoSolido9:setMargins({left=5, right=5, top=2, bottom=2});
    obj.GridCampoSolido9:setVertAlign("leading");

    obj.edtGridCampoSolido9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.edtGridCampoSolido9:setName("edtGridCampoSolido9");
    obj.edtGridCampoSolido9:setAlign("top");
    obj.edtGridCampoSolido9:setField("qtMunicao");
    obj.edtGridCampoSolido9:setFontSize(13);
    obj.edtGridCampoSolido9:setTransparent(false);
    obj.edtGridCampoSolido9:setVertTextAlign("center");
    obj.edtGridCampoSolido9:setHeight(30);
    obj.edtGridCampoSolido9:setWidth(195);
    obj.edtGridCampoSolido9:setFontColor("white");

    obj.labGridCampoSolido9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.labGridCampoSolido9:setName("labGridCampoSolido9");
    obj.labGridCampoSolido9:setAlign("top");
    obj.labGridCampoSolido9:setText("QT MUN.");
    obj.labGridCampoSolido9:setVertTextAlign("leading");
    obj.labGridCampoSolido9:setWordWrap(true);
    obj.labGridCampoSolido9:setTextTrimming("none");
    obj.labGridCampoSolido9:setFontSize(12);
    obj.labGridCampoSolido9:setFontColor("#D0D0D0");

    self.GridCampoSolido9:setHeight(self.edtGridCampoSolido9:getHeight() + self.labGridCampoSolido9:getHeight());


    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (_)
            local oldNode = rawget(self, "__attachedScopeNode");
            		local mesa = rawget(self, "__attachedMesa");
            		
            		if (oldNode ~= nil) then
            		
            		end;
            		
            		local newNode = self.scopeNode;
            		mesa = nil;
            		
            		if newNode ~= nil then
            			mesa = rrpg.getMesaDe(newNode);
            		end;
            		
            		if mesa ~= nil then
            			self.btnRolarAtaque.visible = true;
            		else
            			self.btnRolarAtaque.visible = false;
            		end;
            		
            		rawset(self, "__attachedScopeNode", newNode);
            		rawget(self, "__attachedMesa", mesa);
        end, obj);

    obj._e_event1 = obj.btnApagar:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.btnRolarAtaque:addEventListener("onClick",
        function (_)
            rolarAtaque();
        end, obj);

    obj._e_event3 = obj.fraLayout:addEventListener("onResize",
        function (_)
            atualizarDesiredHeight();
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

        if self.labGridCampoSolido3 ~= nil then self.labGridCampoSolido3:destroy(); self.labGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido4 ~= nil then self.edtGridCampoSolido4:destroy(); self.edtGridCampoSolido4 = nil; end;
        if self.edtGridCampoSolido7 ~= nil then self.edtGridCampoSolido7:destroy(); self.edtGridCampoSolido7 = nil; end;
        if self.labGridCampoSolido5 ~= nil then self.labGridCampoSolido5:destroy(); self.labGridCampoSolido5 = nil; end;
        if self.layPrincipal ~= nil then self.layPrincipal:destroy(); self.layPrincipal = nil; end;
        if self.GridCampoSolido5 ~= nil then self.GridCampoSolido5:destroy(); self.GridCampoSolido5 = nil; end;
        if self.labGridCampoSolido9 ~= nil then self.labGridCampoSolido9:destroy(); self.labGridCampoSolido9 = nil; end;
        if self.labGridCampoSolido2 ~= nil then self.labGridCampoSolido2:destroy(); self.labGridCampoSolido2 = nil; end;
        if self.labGridCampoSolido8 ~= nil then self.labGridCampoSolido8:destroy(); self.labGridCampoSolido8 = nil; end;
        if self.labGridCampoSolido1 ~= nil then self.labGridCampoSolido1:destroy(); self.labGridCampoSolido1 = nil; end;
        if self.labGridCampoSolido4 ~= nil then self.labGridCampoSolido4:destroy(); self.labGridCampoSolido4 = nil; end;
        if self.edtGridCampoSolido6 ~= nil then self.edtGridCampoSolido6:destroy(); self.edtGridCampoSolido6 = nil; end;
        if self.GridCampoSolido8 ~= nil then self.GridCampoSolido8:destroy(); self.GridCampoSolido8 = nil; end;
        if self.GridCampoSolido3 ~= nil then self.GridCampoSolido3:destroy(); self.GridCampoSolido3 = nil; end;
        if self.GridCampoSolido9 ~= nil then self.GridCampoSolido9:destroy(); self.GridCampoSolido9 = nil; end;
        if self.GridCampoSolido2 ~= nil then self.GridCampoSolido2:destroy(); self.GridCampoSolido2 = nil; end;
        if self.labGridCampoSolido7 ~= nil then self.labGridCampoSolido7:destroy(); self.labGridCampoSolido7 = nil; end;
        if self.btnApagar ~= nil then self.btnApagar:destroy(); self.btnApagar = nil; end;
        if self.labGridCampoSolido6 ~= nil then self.labGridCampoSolido6:destroy(); self.labGridCampoSolido6 = nil; end;
        if self.edtGridCampoSolido5 ~= nil then self.edtGridCampoSolido5:destroy(); self.edtGridCampoSolido5 = nil; end;
        if self.fraLayout ~= nil then self.fraLayout:destroy(); self.fraLayout = nil; end;
        if self.btnRolarAtaque ~= nil then self.btnRolarAtaque:destroy(); self.btnRolarAtaque = nil; end;
        if self.edtGridCampoSolido1 ~= nil then self.edtGridCampoSolido1:destroy(); self.edtGridCampoSolido1 = nil; end;
        if self.edtGridCampoSolido3 ~= nil then self.edtGridCampoSolido3:destroy(); self.edtGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido9 ~= nil then self.edtGridCampoSolido9:destroy(); self.edtGridCampoSolido9 = nil; end;
        if self.edtGridCampoSolido8 ~= nil then self.edtGridCampoSolido8:destroy(); self.edtGridCampoSolido8 = nil; end;
        if self.edtGridCampoSolido2 ~= nil then self.edtGridCampoSolido2:destroy(); self.edtGridCampoSolido2 = nil; end;
        if self.GridCampoSolido7 ~= nil then self.GridCampoSolido7:destroy(); self.GridCampoSolido7 = nil; end;
        if self.GridCampoSolido1 ~= nil then self.GridCampoSolido1:destroy(); self.GridCampoSolido1 = nil; end;
        if self.GridCampoSolido4 ~= nil then self.GridCampoSolido4:destroy(); self.GridCampoSolido4 = nil; end;
        if self.layMenu ~= nil then self.layMenu:destroy(); self.layMenu = nil; end;
        if self.GridCampoSolido6 ~= nil then self.GridCampoSolido6:destroy(); self.GridCampoSolido6 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmEquipamentoItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmEquipamentoItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmEquipamentoItem = {
    newEditor = newfrmEquipamentoItem, 
    new = newfrmEquipamentoItem, 
    name = "frmEquipamentoItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEquipamentoItem = _frmEquipamentoItem;
Firecast.registrarForm(_frmEquipamentoItem);

return _frmEquipamentoItem;
