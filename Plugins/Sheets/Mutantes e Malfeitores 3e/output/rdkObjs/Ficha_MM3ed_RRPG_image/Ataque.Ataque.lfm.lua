require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaMM3eAtaques_svg()
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
    obj:setName("frmFichaMM3eAtaques_svg");
    obj:setWidth(435);
    obj:setHeight(25);
    obj:setTheme("light");
    obj:setMargins({top=2, bottom=2, right=2});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse Ataque?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
		
		


    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(0);
    obj.button1:setTop(-1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(13);
    obj.button1:setHeight(13);
    obj.button1:setText("X");
    obj.button1:setVertTextAlign("center");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#bedbd5");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("leading");
    obj.edit1:setFontColor("#264d43");
    obj.edit1:setLeft(10);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(182);
    obj.edit1:setHeight(28);
    obj.edit1:setField("ATK");
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setLeft(180);
    obj.horzLine1:setTop(13);
    obj.horzLine1:setWidth(26);
    obj.horzLine1:setStrokeColor("#264d43");
    obj.horzLine1:setRotationAngle(90);
    obj.horzLine1:setStrokeSize(0.9);
    obj.horzLine1:setName("horzLine1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(194);
    obj.edit2:setTop(3);
    obj.edit2:setWidth(27);
    obj.edit2:setHeight(19);
    obj.edit2:setField("ATKmod");
    obj.edit2:setName("edit2");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj);
    obj.horzLine2:setLeft(209);
    obj.horzLine2:setTop(13);
    obj.horzLine2:setWidth(26);
    obj.horzLine2:setStrokeColor("#264d43");
    obj.horzLine2:setRotationAngle(90);
    obj.horzLine2:setStrokeSize(0.9);
    obj.horzLine2:setName("horzLine2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(223);
    obj.edit3:setTop(3);
    obj.edit3:setWidth(28);
    obj.edit3:setHeight(19);
    obj.edit3:setField("ATKdano");
    obj.edit3:setName("edit3");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj);
    obj.horzLine3:setLeft(239);
    obj.horzLine3:setTop(13);
    obj.horzLine3:setWidth(26);
    obj.horzLine3:setStrokeColor("#264d43");
    obj.horzLine3:setRotationAngle(90);
    obj.horzLine3:setStrokeSize(0.9);
    obj.horzLine3:setName("horzLine3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(253);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(102);
    obj.edit4:setHeight(28);
    obj.edit4:setField("ATKtipo");
    obj.edit4:setName("edit4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(353);
    obj.comboBox1:setTop(3);
    obj.comboBox1:setWidth(18);
    obj.comboBox1:setHeight(19);
    obj.comboBox1:setField("ATKTesteCD");
    obj.comboBox1:setItems({'-', 'D', 'E', 'A'});
    obj.comboBox1:setValues({'0', '+15', '+10', '23'});
    obj.comboBox1:setHint("Escolha entre Nulo 'D'ano 'A'rea ou 'E'feitos como Aflição ou similares");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'ATKTesteCD'});
    obj.dataLink1:setDefaultValues({'+15'});
    obj.dataLink1:setName("dataLink1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setTop(3);
    obj.button2:setAlign("right");
    obj.button2:setWidth(22);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button2);
    obj.image1:setLeft(1);
    obj.image1:setWidth(20);
    obj.image1:setHeight(21);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local personagem = Firecast.getPersonagemDe(sheet);                                
            						local node = NDB.getRoot(sheet);
            						
            						if (personagem ~= nil) then
            							local mesa = personagem.mesa;
            
            							if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
            								if tonumber(sheet.ATKTesteCD) >= 16 then
            									local tipo = sheet.ATKtipo
            									local dificuldade = math.floor(tonumber(sheet.ATKdano or 0) + tonumber(sheet.ATKdano3 or 10));
            									local descricao = "[§K15]« [§K14]Efeito em Área de " .. (node.codinome or "Heroi") .. ": "  .. sheet.ATK .. " - Efeito: " .. tipo .. " - CD: " .. dificuldade .. "[§K15] »";
            									local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            									
            									mesaDoPersonagem.activeChat:enviarMensagem(descricao, "Oloko");
            									
            								else									
            										if sheet.ATKtipo == nil then
            											sheet.ATKtipo = "-";
            										end;
            										
            										if sheet.ATKdano == nil then
            											sheet.ATKdano = "0";
            										end;
            									
            									local rolagem = Firecast.interpretarRolagem(sheet.ATKmod); 
            									local dificuldade = math.floor(tonumber(sheet.ATKdano or 0) + tonumber(sheet.ATKTesteCD or 0))
            
            									local tipo = sheet.ATKtipo
            									local descricao = "Ataque de " .. (node.codinome or "Heroi") .. ": - Efeito: " .. tipo .. " - Dano: " .. sheet.ATKdano .. " - CD: " .. dificuldade .. "";
            
            									if sheet.ATK ~= nil then
            										   descricao = sheet.ATK ..  " de " .. (node.codinome or "Heroi") .. " - Efeito: " .. tipo .. " - Dano: " .. sheet.ATKdano .. " - CD: " .. dificuldade .. "";
            									end;
            
            									if not rolagem.possuiAlgumDado then
            										   rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            
            									end; 
            
            									local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
            									if mesaDoPersonagem ~= nil then
            										   mesaDoPersonagem.activeChat:rolarDados(rolagem, descricao)
            									end;
            								end;
            							end;
            						end;
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaMM3eAtaques_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaMM3eAtaques_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaMM3eAtaques_svg = {
    newEditor = newfrmFichaMM3eAtaques_svg, 
    new = newfrmFichaMM3eAtaques_svg, 
    name = "frmFichaMM3eAtaques_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaMM3eAtaques_svg = _frmFichaMM3eAtaques_svg;
Firecast.registrarForm(_frmFichaMM3eAtaques_svg);

return _frmFichaMM3eAtaques_svg;
