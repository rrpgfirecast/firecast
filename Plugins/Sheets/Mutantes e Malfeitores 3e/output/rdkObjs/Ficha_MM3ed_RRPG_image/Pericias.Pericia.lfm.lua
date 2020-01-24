require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaMM3eP_svg()
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
    obj:setName("frmFichaMM3eP_svg");
    obj:setWidth(435);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=2, bottom=2, right=10});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa perícia?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showPericiaPopup()
			local pop = self:findControlByName("popPericia");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("right", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de pericias para exibir");
			end;				
		end;

		local function rollTest()
			local personagem = Firecast.getPersonagemDe(sheet);

					if (personagem ~= nil) then
						local mesa = personagem.mesa;
						
						if ((personagem.dono == mesa.meuJogador) or (mesa.meuJogador.isMestre)) then
							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
							local node = NDB.getRoot(sheet);
						
							local mod = math.floor(tonumber(sheet.totalPericia) or 0) + (tonumber(node.buffPericia) or 0);
							local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);


							local warn = "";
							if sheet.exigeTreino and (tonumber(sheet.graduacaoPericia) or 0)==0 then
								warn = " (Não possuo graduações e exige treinamento)."
							end;

							local tools = "";
							if node.exigeFerramentas then
								tools = " (Também exige ferramentas)."
							end
											
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.nomePericia or "Pericia") .. " de " .. (node.codinome or "Heroi") .. warn .. tools);
						else
							showMessage("Ops, este não é seu personagem...");
						end;
					end;
		end;

			local function updateAtributes(num)
				if sheet==nil then return end;
					local atributoPericia = 0;
					local node = NDB.getRoot(sheet);

					if sheet.chavePericia == "1" then
						atributoPericia = tonumber(node.FORtotal) or 0;
					elseif sheet.chavePericia == "2" then
						atributoPericia = tonumber(node.VIGtotal or 0);
					elseif sheet.chavePericia == "3" then
						atributoPericia = tonumber(node.AGItotal or 0);
					elseif sheet.chavePericia == "4" then
						atributoPericia = tonumber(node.DEStotal or 0);
					elseif sheet.chavePericia == "5" then
						atributoPericia = tonumber(node.LUTtotal or 0);
					elseif sheet.chavePericia == "6" then
						atributoPericia = tonumber(node.INTtotal or 0);
					elseif sheet.chavePericia == "7" then
						atributoPericia = tonumber(node.PROtotal or 0);
					elseif sheet.chavePericia == "8" then
						atributoPericia = tonumber(node.PREtotal or 0);
					end;
					sheet.atributoPericia = atributoPericia;
					
			end;
				
		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#264d43");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(0);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(21);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(138);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nomePericia");
    obj.edit1:setName("edit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(160);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("i");
    obj.button2:setName("button2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(185);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("chavePericia");
    obj.comboBox1:setItems({'FOR', 'VIG', 'AGI', 'DES', 'LUT', 'INT', 'PRO', 'PRE', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.comboBox1);
    obj.dataLink1:setFields({'chavePericia'});
    obj.dataLink1:setDefaultValues({'9'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(248);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(33);
    obj.rectangle2:setHeight(24);
    obj.rectangle2:setColor("#202020");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setField("atributoPericia");
    obj.label1:setText("0");
    obj.label1:setLeft(0);
    obj.label1:setTop(2);
    obj.label1:setWidth(33);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setFields({'atributoPericia'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(283);
    obj.label2:setText("+");
    obj.label2:setTop(3);
    obj.label2:setWidth(8);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(291);
    obj.edit2:setTop(-1);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setField("graduacaoPericia");
    obj.edit2:setType("float");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(321);
    obj.label3:setText("+");
    obj.label3:setTop(3);
    obj.label3:setWidth(8);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(329);
    obj.edit3:setTop(-1);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setField("graduacaoVariavel");
    obj.edit3:setType("float");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(359);
    obj.label4:setText("=");
    obj.label4:setTop(3);
    obj.label4:setWidth(8);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(368);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(35);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("#3f8270");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setField("totalPericia");
    obj.label5:setText("0");
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(35);
    obj.label5:setHeight(25);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(409);
    obj.button3:setTop(1);
    obj.button3:setWidth(23);
    obj.button3:setHeight(23);
    obj.button3:setText("");
    obj.button3:setName("button3");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button3);
    obj.image1:setLeft(1);
    obj.image1:setWidth(20);
    obj.image1:setHeight(21);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/dice.png");
    obj.image1:setName("image1");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'atributoPericia', 'graduacaoPericia', 'graduacaoVariavel', 'penalidesPericia', 'equipamentosPericia', 'poderPericia','condicionalPericia'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'graduacaoPericia'});
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            updateAtributes();
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.edit1:addEventListener("onChange",
        function (_)
            local rcl = self:findControlByName("rclListaDasPericias");
            			if rcl~= nil then
            				rcl:sort();
            			end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            showPericiaPopup();
        end, obj);

    obj._e_event4 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet.chavePericia ~= nil then
            				local atributoPericia = 0;
            				local node = NDB.getRoot(sheet);
            
            				if sheet.chavePericia == "1" then
            					atributoPericia = tonumber(node.FORtotal) or 0;
            				elseif sheet.chavePericia == "2" then
            					atributoPericia = tonumber(node.VIGtotal or 0);
            				elseif sheet.chavePericia == "3" then
            					atributoPericia = tonumber(node.AGItotal or 0);
            				elseif sheet.chavePericia == "4" then
            					atributoPericia = tonumber(node.DEStotal or 0);
            				elseif sheet.chavePericia == "5" then
            					atributoPericia = tonumber(node.LUTtotal or 0);
            				elseif sheet.chavePericia == "6" then
            					atributoPericia = tonumber(node.INTtotal or 0);
            				elseif sheet.chavePericia == "7" then
            					atributoPericia = tonumber(node.PROtotal or 0);
            				elseif sheet.chavePericia == "8" then
            					atributoPericia = tonumber(node.PREtotal or 0);
            				end;
            				sheet.atributoPericia = atributoPericia;
            			end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            rollTest();
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            				local node = NDB.getRoot(sheet);
            				local pen = (tonumber(node.penalidade) or 0)
            
            				local mod;
            				mod = (tonumber(sheet.atributoPericia) or 0) +
            							(tonumber(sheet.graduacaoPericia) or 0) +
            							(tonumber(sheet.graduacaoVariavel) or 0) +
            							(tonumber(sheet.penalidesPericia) or 0) +
            							(tonumber(sheet.equipamentosPericia) or 0) +
            							(tonumber(sheet.condicionalPericia) or 0);
            
            				if sheet.penalidadeArmadura then
            					mod = mod + pen;
            				end;
            				if sheet.penalidadeArmadura2 then
            					mod = mod + pen;
            				end;
            
            				sheet.totalPericia = mod;
            			end;
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            				local node = NDB.getRoot(sheet);
            				local mod = tonumber(node.idiomasGrad) or 0;
            
            				local path = 0;
            				local nodes = NDB.getChildNodes(node.campoDasPericias); 
            				--showMessage(#nodes);
            				for i=1, #nodes, 1 do
            					local mult = 0.5;
            					mod = mod + (tonumber(nodes[i].graduacaoPericia) or 0) * mult;
            					path = path + (tonumber(nodes[i].graduacaoPericia) or 0);
            				end
            
            				node.pontosPericia = mod;
            				node.pontosPericiaPath = path;
            			end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaMM3eP_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaMM3eP_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaMM3eP_svg = {
    newEditor = newfrmFichaMM3eP_svg, 
    new = newfrmFichaMM3eP_svg, 
    name = "frmFichaMM3eP_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaMM3eP_svg = _frmFichaMM3eP_svg;
Firecast.registrarForm(_frmFichaMM3eP_svg);

return _frmFichaMM3eP_svg;
