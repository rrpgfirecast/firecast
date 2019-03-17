require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemEffect()
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
    obj:setName("frmItemEffect");
    obj:setHeight(50);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setVisible(true);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(50);
    obj.label1:setText("Tipo");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(65);
    obj.comboBox1:setField("tipo");
    obj.comboBox1:setItems({'Efeito','Fixo'});
    obj.comboBox1:setHint("Efeito: efeito baseado em magia. \nFixo: bônus númerico fixo.");
    obj.comboBox1:setName("comboBox1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(50);
    obj.label2:setText("Posição");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setWidth(85);
    obj.comboBox2:setField("posicao");
    obj.comboBox2:setItems({'Base','Adicional', 'Livre'});
    obj.comboBox2:setValues({'1','2','3'});
    obj.comboBox2:setHint("Base: efeito mais caro do item (preço x1). \nAdicional: efeito secundario (preço x1.5). \nLivre: efeito de item que não oculpa espaços (preço x2).");
    obj.comboBox2:setName("comboBox2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setWidth(40);
    obj.label3:setText("Valor");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setAlign("left");
    obj.label4:setWidth(60);
    obj.label4:setField("preco");
    obj.label4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label4, "formatFloat",  ",0.## PO");
    obj.label4:setFontSize(10);
    obj.label4:setName("label4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.efeito = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.efeito:setParent(obj);
    obj.efeito:setAlign("client");
    obj.efeito:setColor("#212121");
    obj.efeito:setVisible(true);
    obj.efeito:setName("efeito");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.efeito);
    obj.label5:setAlign("left");
    obj.label5:setWidth(50);
    obj.label5:setText("NC");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.efeito);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(30);
    obj.edit1:setField("nc");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.efeito);
    obj.label6:setAlign("left");
    obj.label6:setWidth(50);
    obj.label6:setText("Nível");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.efeito);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(30);
    obj.edit2:setField("nivel");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.efeito);
    obj.label7:setAlign("left");
    obj.label7:setWidth(50);
    obj.label7:setText("Usos");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.efeito);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setWidth(40);
    obj.comboBox3:setField("usos");
    obj.comboBox3:setItems({'1','2', '3','4','5','-','x2','x4'});
    obj.comboBox3:setHint("1 a 5: Quantidade de usos diarios. \n-: efeito continuo. \nx2 ou x4: efeito de uso continuo com custo elevado. ");
    obj.comboBox3:setName("comboBox3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.efeito);
    obj.label8:setAlign("left");
    obj.label8:setWidth(50);
    obj.label8:setText("Ativação");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(10);
    obj.label8:setName("label8");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.efeito);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setWidth(75);
    obj.comboBox4:setField("ativacao");
    obj.comboBox4:setItems({'Livre','Padrão'});
    obj.comboBox4:setValues({'1','2'});
    obj.comboBox4:setHint("Livre: ativar os efeitos do item é uma ação livre. \nAtivar os efeitos do item requer um comando [ação padrão].");
    obj.comboBox4:setName("comboBox4");

    obj.fixo = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.fixo:setParent(obj);
    obj.fixo:setAlign("client");
    obj.fixo:setColor("#212121");
    obj.fixo:setVisible(false);
    obj.fixo:setName("fixo");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.fixo);
    obj.label9:setAlign("left");
    obj.label9:setWidth(50);
    obj.label9:setText("Bônus");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.fixo);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(50);
    obj.edit3:setField("bonus");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.fixo);
    obj.label10:setAlign("left");
    obj.label10:setWidth(50);
    obj.label10:setText("Efeito");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.fixo);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setWidth(225);
    obj.comboBox5:setField("efeito");
    obj.comboBox5:setItems({'Atributos (Melhoria)','Armadura (Melhoria)','Magia Adicional','CA (Deflexão)','CA (Outro)','Armadura Natural (Melhoria)','Resistencia','Resistencia (Outro)','Pericia (Competencia)','Pericia Parcial (Competencia)','Resistencia a Magia','Deslocamento','Carga (Fácil)','Carga'});
    obj.comboBox5:setValues({'1','2','3','4','5','6','7','8','9','10','11','12','13','14'});
    obj.comboBox5:setHint("Atributos (Melhoria): Bônus de melhoria em atributos. Multiplos de 2, max. 6. \nArmadura (Melhoria): Bônus de melhoria na armadura. Max. 10 \nMagia Adicional: Recupera magia do nível indicado. Max. 9.\nCA (Deflexão): Bônus deflexão na CA. Max. 5.\nCA (Outro): Outro bônus na CA. Max. 1.\nArmadura Natural (Melhoria): Bônus de melhoria na armadura natural. Max. 5.\nResistencia: Bônus em testes de resistência. Max. 5.\nResistencia (Outro): Outros bônus em testes de resistÊncia. Max. 1.\nPericia (Competencia): Bônus de competencia em testes de pericia. Max. 10.\nPericia Parcial (Competencia): Bônus de competencia em certos usos da pericia. Max. 10.\nResistencia a Magia: Valor fixo de resistencia a magia. Sem limite.\nDeslocamento: Cada 1 equivale a +1,5m para deslocamento de escavar; +3m para deslocamento terrestre, natação, escalar ou voo perfeito;\n +6 de voo bom; +9m de voo medio; +12m de voo ruim; ou +15m de voo desajeitado. Max. 3.\nCarga (Fácil): Carga reduzida de 25:1 e até 100Kg. Recuperar item é ação de movimento.\nCarga: Carga reduzida de 25:1 e até 1.000Kg. Recuperar item é até ação de rodada.");
    obj.comboBox5:setName("comboBox5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'tipo'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'tipo','nc','nivel','usos','posicao','ativacao'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'tipo','efeito','bonus','posicao'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'preco'});
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse efeito?",
            					function (confirmado)
            						if confirmado then
            							NDB.deleteNode(sheet);
            						end;
            					end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.tipo=="Efeito" then
            				self.efeito.visible = true;
            				self.fixo.visible = false;
            			else
            				self.efeito.visible = false;
            				self.fixo.visible = true;
            			end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.tipo~="Efeito" then return end;
            
            			local nc = tonumber(sheet.nc) or 1;
            			local nivel = tonumber(sheet.nivel) or 1;
            
            			-- Calcular multiplicador base da quantidade de usos
            			local mult = tonumber(sheet.usos) or 5;
            			if sheet.usos == "x2" then mult = 10 end;
            			if sheet.usos == "x4" then mult = 20 end;
            
            			-- Calcular multiplicador de posição do efeito
            			local posicao = tonumber(sheet.posicao) or 1;
            			local mults = {1,1.5,2};
            			local mult2 = mults[posicao];
            
            			-- Calcular preço base
            			local base = 360;
            			if sheet.ativacao=="1" then base=400 end;
            
            			local preco = nivel * nc * mult * mult2 * base;
            			sheet.preco = preco;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.tipo~="Fixo" then return end;
            
            			local bonus = tonumber(sheet.bonus) or 1;
            			local sel = tonumber(sheet.efeito) or 1;
            			local base = {1000,1000,1000,2000,2500,2000,1000,2000,100,50,1000,3000,30,20};
            
            			-- Calcular multiplicador base do tipo de bonus
            			local mult = 1;
            			local limit = {6,10,9,5,1,5,5,1,10,10,-1,6,100,1000};
            			if bonus > limit[sel] then mult = 10 end;
            
            			-- Calcular multiplicador de posição do efeito
            			local posicao = tonumber(sheet.posicao) or 1;
            			local mults = {1,1.5,2};
            			local mult2 = mults[posicao];
            
            			local preco;
            			if sel == 11 then
            				preco = (bonus-12) * base[sel] * mult * mult2;
            			elseif sel==13 or sel==14 then
            				preco = bonus * base[sel] * mult * mult2;
            			else
            				preco = bonus * bonus * base[sel] * mult * mult2;
            			end;
            
            			sheet.preco = preco;
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local node = toolSheet;
            
            			local sum = 0;
            			local nodes = NDB.getChildNodes(node.effectList); 
            			for i=1, #nodes, 1 do
            				sum = sum + (tonumber(nodes[i].preco) or 0);
            			end;
            			node.precoWoundrous = sum;
            
            			node.custoWoundrous = sum/2;
            
            			local xp = math.ceil(sum/25)
            			node.xpWoundrous = xp;
        end, obj);

    function obj:_releaseEvents()
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

        if self.fixo ~= nil then self.fixo:destroy(); self.fixo = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.efeito ~= nil then self.efeito:destroy(); self.efeito = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemEffect()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemEffect();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemEffect = {
    newEditor = newfrmItemEffect, 
    new = newfrmItemEffect, 
    name = "frmItemEffect", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItemEffect = _frmItemEffect;
Firecast.registrarForm(_frmItemEffect);

return _frmItemEffect;
