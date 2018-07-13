require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmAtaqueItem()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmAtaqueItem");
    obj:setWidth(180);
    obj:setHeight(90);
    obj:setMargins({bottom=5});
    obj:setTheme("dark");

    obj.weapon = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.weapon:setParent(obj);
    obj.weapon:setWidth(1240);
    obj.weapon:setHeight(90);
    obj.weapon:setColor("black");
    obj.weapon:setName("weapon");
    obj.weapon:setVisible(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.weapon);
    obj.rectangle1:setLeft(869);
    obj.rectangle1:setTop(4);
    obj.rectangle1:setWidth(332);
    obj.rectangle1:setHeight(77);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.weapon);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.weapon);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(55);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(220);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.weapon);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(50);
    obj.label2:setHeight(25);
    obj.label2:setText("ARMA");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.weapon);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(55);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(220);
    obj.edit2:setHeight(25);
    obj.edit2:setField("arma");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.weapon);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setText("TIPO");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.weapon);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(55);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(220);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipo");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.weapon);
    obj.button1:setLeft(279);
    obj.button1:setTop(6);
    obj.button1:setWidth(73);
    obj.button1:setText("ATAQUE");
    obj.button1:setFontSize(11);
    obj.button1:setName("button1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.weapon);
    obj.rectangle2:setLeft(352);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(40);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.weapon);
    obj.label4:setLeft(352);
    obj.label4:setTop(5);
    obj.label4:setWidth(41);
    obj.label4:setHeight(25);
    obj.label4:setField("ataque");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.weapon);
    obj.edit4:setType("number");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(394);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("ataqueBonus");
    obj.edit4:setName("edit4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.weapon);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(434);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("chaveAtributo1");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.weapon);
    obj.comboBox2:setVertTextAlign("center");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setLeft(494);
    obj.comboBox2:setTop(5);
    obj.comboBox2:setWidth(60);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("chaveAtributo2");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.weapon);
    obj.dataLink1:setFields({'ataqueBonus','atributo1','atributo2','ajuste'});
    obj.dataLink1:setName("dataLink1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.weapon);
    obj.button2:setLeft(279);
    obj.button2:setTop(31);
    obj.button2:setWidth(73);
    obj.button2:setText("DANO");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.weapon);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(352);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(82);
    obj.edit5:setHeight(25);
    obj.edit5:setField("dano");
    obj.edit5:setName("edit5");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.weapon);
    obj.button3:setLeft(434);
    obj.button3:setTop(31);
    obj.button3:setWidth(60);
    obj.button3:setText("DECISIVO");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.weapon);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(495);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(60);
    obj.edit6:setHeight(25);
    obj.edit6:setField("danoCritico");
    obj.edit6:setName("edit6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.weapon);
    obj.label5:setLeft(580);
    obj.label5:setTop(5);
    obj.label5:setWidth(80);
    obj.label5:setHeight(25);
    obj.label5:setText("CATEGORIA");
    obj.label5:setName("label5");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.weapon);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(660);
    obj.edit7:setTop(5);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("categoria");
    obj.edit7:setName("edit7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.weapon);
    obj.label6:setLeft(610);
    obj.label6:setTop(30);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("OBS");
    obj.label6:setName("label6");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.weapon);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(660);
    obj.edit8:setTop(30);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("obs");
    obj.edit8:setName("edit8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.weapon);
    obj.label7:setLeft(590);
    obj.label7:setTop(55);
    obj.label7:setWidth(80);
    obj.label7:setHeight(25);
    obj.label7:setText("MUNIÇÃO");
    obj.label7:setName("label7");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.weapon);
    obj.edit9:setType("number");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(660);
    obj.edit9:setTop(55);
    obj.edit9:setWidth(69);
    obj.edit9:setHeight(25);
    obj.edit9:setField("municao");
    obj.edit9:setName("edit9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.weapon);
    obj.label8:setLeft(735);
    obj.label8:setTop(55);
    obj.label8:setWidth(70);
    obj.label8:setHeight(25);
    obj.label8:setText("ALCANCE");
    obj.label8:setName("label8");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.weapon);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(795);
    obj.edit10:setTop(55);
    obj.edit10:setWidth(65);
    obj.edit10:setHeight(25);
    obj.edit10:setField("alcance");
    obj.edit10:setName("edit10");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.weapon);
    obj.label9:setLeft(870);
    obj.label9:setTop(25);
    obj.label9:setWidth(330);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Clique para adicionar imagem");
    obj.label9:setName("label9");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.weapon);
    obj.image1:setField("imagemArma");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(870);
    obj.image1:setTop(5);
    obj.image1:setWidth(330);
    obj.image1:setHeight(75);
    obj.image1:setName("image1");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.weapon);
    obj.button4:setLeft(1205);
    obj.button4:setTop(4);
    obj.button4:setWidth(30);
    obj.button4:setHeight(77);
    obj.button4:setText("X");
    obj.button4:setName("button4");


		local function pos(rolado)
			local dado = rolado.ops[1].resultados[1];
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local valor = rolado.resultado;
			
			if dado<20 then
				mesaDoPersonagem.activeChat:rolarDados(dano, "Dano com " .. (armamento or "arma") .. " de " .. (sheet.nome or "NOME"));
			else
				local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico);
				if sheet.buffDanoCritico ~= nil then
					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
				end;
				
				local armamento = sheet.nome;
				if armamento==nil then
					armamento = sheet.arma;
				end;
				if danoCritico.possuiAlgumDado then
					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano decisivo com " .. (armamento or "arma") .. " de " .. (sheet.nome or "NOME"));
				else
					mesaDoPersonagem.activeChat:enviarNarracao("Dano decisivo: " .. (sheet.danoCritico or 1));
				end;
			end;	
		end;
		


    obj.add = GUI.fromHandle(_obj_newObject("button"));
    obj.add:setParent(obj);
    obj.add:setWidth(1240);
    obj.add:setHeight(90);
    obj.add:setFontSize(25);
    obj.add:setText("+");
    obj.add:setName("add");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("enabled");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            i = 1;
            				max = 1;
            				danoAlvo1 = 0;
            				danoAlvo2 = 0;
            				danoAlvo3 = 0;
            				danoAlvo4 = 0;
            				danoAlvo5 = 0;
            				fimRolagem = false;
            				
            				array = {sheet.ataque};
            				
            				dano = rrpg.interpretarRolagem(sheet.dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				danoCritico = rrpg.interpretarRolagem(sheet.danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				armamento = sheet.nome;
            				municao = tonumber(sheet.municao);
            				if armamento==nil then
            					armamento = sheet.arma;
            				end;
            				
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					while array[max]~=nil do
            					max = max + 1;
            				end;
            				
            				local mod = tonumber(array[1]);
            				if mod~=nil then
            					rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            					if sheet.buffAtaque ~= nil then
            						rolagem = rolagem:concatenar(sheet.buffAtaque);
            					end;
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. (armamento or "arma") .. " de " .. (sheet.nome or "NOME"), 
            						function (rolado)
            							pos(rolado)
            						end);
            					if municao~=nil then
            						sheet.municao = municao-max+1;
            					end;
            				end;
        end, obj);

    obj._e_event1 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local atributo1 = 0;
            					local node = ndb.getRoot(sheet);
            
            					if sheet.chaveAtributo1 == "1" then
            						atributo1 = tonumber(node.efetModFor) or 0;
            					elseif sheet.chaveAtributo1 == "2" then
            						atributo1 = tonumber(node.efetModDes) or 0;
            					elseif sheet.chaveAtributo1 == "3" then
            						atributo1 = tonumber(node.efetModCon) or 0;
            					elseif sheet.chaveAtributo1 == "4" then
            						atributo1 = tonumber(node.efetModInt) or 0;
            					elseif sheet.chaveAtributo1 == "5" then
            						atributo1 = tonumber(node.efetModSab) or 0;
            					elseif sheet.chaveAtributo1 == "6" then
            						atributo1 = tonumber(node.efetModCar) or 0;
            					end;
            					sheet.atributo1 = atributo1;
            				end;
        end, obj);

    obj._e_event2 = obj.comboBox2:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local atributo2 = 0;
            					local node = ndb.getRoot(sheet);
            
            					if sheet.chaveAtributo2 == "1" then
            						atributo2 = tonumber(node.efetModFor) or 0;
            					elseif sheet.chaveAtributo2 == "2" then
            						atributo2 = tonumber(node.efetModDes) or 0;
            					elseif sheet.chaveAtributo2 == "3" then
            						atributo2 = tonumber(node.efetModCon) or 0;
            					elseif sheet.chaveAtributo2 == "4" then
            						atributo2 = tonumber(node.efetModInt) or 0;
            					elseif sheet.chaveAtributo2 == "5" then
            						atributo2 = tonumber(node.efetModSab) or 0;
            					elseif sheet.chaveAtributo2 == "6" then
            						atributo2 = tonumber(node.efetModCar) or 0;
            					end;
            					sheet.atributo2 = atributo2;
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.ataque = 	(tonumber(sheet.ataqueBonus) or 0) + 
            								(tonumber(sheet.atributo1) or 0) + 
            								(tonumber(sheet.atributo2) or 0) + 
            								(tonumber(sheet.ajuste) or 0);
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				local dano = rrpg.interpretarRolagem(sheet.dano);
            				if sheet.buffDano ~= nil then
            					dano = dano:concatenar(sheet.buffDano);
            				end;
            				
            				local armamento = sheet.nome;
            				if armamento==nil then
            					armamento = sheet.arma;
            				end;
            				
            				mesaDoPersonagem.activeChat:rolarDados(dano, "Dano com " .. (armamento or "arma") .. " de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				local danoCritico = rrpg.interpretarRolagem(sheet.danoCritico);
            				if sheet.buffDanoCritico ~= nil then
            					danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            				end;
            				
            				local armamento = sheet.nome;
            				if armamento==nil then
            					armamento = sheet.arma;
            				end;
            				if danoCritico.possuiAlgumDado then
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Decisivo" .. " com " .. (armamento or "arma") .. " de " .. (sheet.nome or "NOME"));
            				else
            					mesaDoPersonagem.activeChat:enviarNarracao("Dano decisivo: " .. (sheet.danoCritico or 1));
            				end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse ataque?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event7 = obj.add:addEventListener("onClick",
        function (_)
            sheet.enabled = true;
            			local node = ndb.getRoot(sheet);
            			node.addWeapon = 1;
        end, obj);

    obj._e_event8 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.enabled==true then
            				self.weapon.visible = true;
            				self.add.visible = false;
            			else
            				self.weapon.visible = false;
            				self.add.visible = true;
            			end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.weapon ~= nil then self.weapon:destroy(); self.weapon = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.add ~= nil then self.add:destroy(); self.add = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAtaqueItem = {
    newEditor = newfrmAtaqueItem, 
    new = newfrmAtaqueItem, 
    name = "frmAtaqueItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAtaqueItem = _frmAtaqueItem;
Firecast.registrarForm(_frmAtaqueItem);

return _frmAtaqueItem;
