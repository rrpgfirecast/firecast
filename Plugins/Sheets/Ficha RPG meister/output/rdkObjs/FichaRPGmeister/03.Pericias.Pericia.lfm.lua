require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister3p_svg()
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
    obj:setName("frmFichaRPGmeister3p_svg");
    obj:setWidth(435);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=2, bottom=2, right=10});

			
		local function askForDelete()
			dialogs.confirmYesNo("Deseja realmente apagar essa perícia?",
								 function (confirmado)
									if confirmado then
										ndb.deleteNode(sheet);
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
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local node = ndb.getRoot(sheet);

			local mod = math.floor(tonumber(sheet.totalPericia) or 0) + (tonumber(node.buffPericia) or 0);
			local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);

			local warn = "";
			if sheet.exigeTreino and (tonumber(sheet.graduacaoPericia) or 0)==0 then
				warn = " (não possui graduações)."
			end;

			mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.nomePericia or "Pericia") .. " de " .. (node.nome or "Nome") .. warn);
		end;

		


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setLeft(1);
    obj.checkBox1:setTop(5);
    obj.checkBox1:setWidth(19);
    obj.checkBox1:setHeight(15);
    obj.checkBox1:setField("isClass");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(21);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(138);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nomePericia");
    obj.edit1:setName("edit1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(165);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("chavePericia");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(240);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setField("totalPericia");
    obj.label1:setText("0");
    obj.label1:setLeft(240);
    obj.label1:setTop(0);
    obj.label1:setWidth(35);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(280);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(33);
    obj.rectangle3:setHeight(24);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setField("atributoPericia");
    obj.label2:setText("0");
    obj.label2:setLeft(280);
    obj.label2:setTop(0);
    obj.label2:setWidth(33);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(320);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setField("graduacaoPericia");
    obj.edit2:setType("float");
    obj.edit2:setName("edit2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(360);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(385);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("i");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(410);
    obj.button3:setTop(1);
    obj.button3:setWidth(23);
    obj.button3:setHeight(23);
    obj.button3:setText("X");
    obj.button3:setName("button3");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'atributoPericia', 'graduacaoPericia', 'penalidesPericia', 'racialPericia', 'sinergiaPericia', 'equipamentosPericia', 'magicoPericia', 'outrosPericia', 'penalidadeArmadura', 'penalidadeArmadura2', 'talentosPericia', 'classePericia', 'condicionalPericia'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'graduacaoPericia', 'isClass'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.comboBox1:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            				if debug then
            					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Atributo Pericia. ");
            					index = index + 1;
            				end;
            				local atributoPericia = 0;
            				local node = ndb.getRoot(sheet);
            
            				if sheet.chavePericia == "1" then
            					atributoPericia = tonumber(node.efetModFor) or 0;
            				elseif sheet.chavePericia == "2" then
            					atributoPericia = tonumber(node.efetModDes) or 0;
            				elseif sheet.chavePericia == "3" then
            					atributoPericia = tonumber(node.efetModCon) or 0;
            				elseif sheet.chavePericia == "4" then
            					atributoPericia = tonumber(node.efetModInt) or 0;
            				elseif sheet.chavePericia == "5" then
            					atributoPericia = tonumber(node.efetModSab) or 0;
            				elseif sheet.chavePericia == "6" then
            					atributoPericia = tonumber(node.efetModCar) or 0;
            				end;
            				sheet.atributoPericia = atributoPericia;
            			end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            rollTest();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            showPericiaPopup();
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            askForDelete();
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            				if debug then
            					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando total Pericia. ");
            					index = index + 1;
            				end;
            				local node = ndb.getRoot(sheet);
            				local pen = (tonumber(node.penalidade) or 0)
            
            				local mod = 0;
            				mod = (tonumber(sheet.atributoPericia) or 0) +
            							(tonumber(sheet.graduacaoPericia) or 0) +
            							(tonumber(sheet.penalidesPericia) or 0) +
            							(tonumber(sheet.racialPericia) or 0) +
            							(tonumber(sheet.sinergiaPericia) or 0) +
            							(tonumber(sheet.equipamentosPericia) or 0) +
            							(tonumber(sheet.magicoPericia) or 0) +
            							(tonumber(sheet.outrosPericia) or 0) + 
            							(tonumber(sheet.talentosPericia) or 0) +
            							(tonumber(sheet.classePericia) or 0) +
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

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            				if debug then
            					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Pontos de Pericia. ");
            					index = index + 1;
            				end;
            				local node = ndb.getRoot(sheet);
            				local mod = tonumber(node.idiomasGrad) or 0;
            				if not node.idiomasIsClass then
            					mod = mod + (tonumber(node.idiomasGrad) or 0);
            				end;
            				local path = 0;
            				local nodes = ndb.getChildNodes(node.campoDasPericias); 
            				--showMessage(#nodes);
            				for i=1, #nodes, 1 do
            					local mult = 1;
            					if not nodes[i].isClass then
            						mult = 2;
            					end;
            					mod = mod + (tonumber(nodes[i].graduacaoPericia) or 0) * mult;
            					path = path + (tonumber(nodes[i].graduacaoPericia) or 0);
            				end
            
            				if node.idiomasIsClass then
            					mod = mod + (tonumber(nodes.idiomasGrad) or 0);
            				else
            					mod = mod + (tonumber(nodes.idiomasGrad) or 0) * 2;
            				end;
            
            				node.pontosPericia = mod;
            				node.pontosPericiaPath = path;
            			end;
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister3p_svg = {
    newEditor = newfrmFichaRPGmeister3p_svg, 
    new = newfrmFichaRPGmeister3p_svg, 
    name = "frmFichaRPGmeister3p_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister3p_svg = _frmFichaRPGmeister3p_svg;
rrpg.registrarForm(_frmFichaRPGmeister3p_svg);

return _frmFichaRPGmeister3p_svg;
