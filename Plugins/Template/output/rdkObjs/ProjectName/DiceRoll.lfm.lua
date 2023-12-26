require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDiceRoll()
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
    obj:setName("frmDiceRoll");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			



			local function rolagemCallback(rolagem)
				local msg = "";
				for i = 1, #rolagem.ops, 1 do  
					local operacao = rolagem.ops[i];      

					-- Vamos verificar que tipo de operação é esta.      
					if operacao.tipo == "dado" then        
					        -- Adicionar à mensagem informações sobre este conjunto de dados.
					        msg = msg .. operacao.quantidade .. "d" .. operacao.face .. ": \n  ";               

					       -- Loop percorrendo cada um dos resultados individuais deste conjunto de dados.
					        for j = 1, #operacao.resultados, 1 do
					                msg = msg .. "  " .. math.floor(operacao.resultados[j]);
					        end;               

					        msg = msg .. "\n";
					elseif operacao.tipo == "imediato" then
					        msg = msg .. "Valor imediato: " .. operacao.valor .. "\n";
					end;
				end; 
				-- Concatenar à mensagem o resultado final da rolagem
				msg = msg .. "------------------- \nResultado Final: " .. rolagem.resultado; 

				-- Escrever resultado na mesa só para o usuario
				local mesa = Firecast.getMesaDe(sheet);
				mesa.activeChat:escrever(msg);
			end;
			



		


    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("R");
    obj.button1:setHint("Botao que faz rolagem de teste");
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(25);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(75);
    obj.edit1:setHeight(25);
    obj.edit1:setField("roll");
    obj.edit1:setName("edit1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_, event)
            local roll = sheet.roll or "1d1-1";
            	    		local rolagem = Firecast.interpretarRolagem(roll);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDiceRoll()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDiceRoll();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDiceRoll = {
    newEditor = newfrmDiceRoll, 
    new = newfrmDiceRoll, 
    name = "frmDiceRoll", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDiceRoll = _frmDiceRoll;
Firecast.registrarForm(_frmDiceRoll);

return _frmDiceRoll;
