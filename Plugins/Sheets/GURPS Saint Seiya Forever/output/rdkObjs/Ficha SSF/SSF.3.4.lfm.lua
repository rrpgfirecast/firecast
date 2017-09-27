require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSSF3_4()
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
    obj:setName("frmSSF3_4");
    obj:setWidth(320);
    obj:setHeight(110);
    obj:setTheme("dark");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(0);
    obj.button1:setTop(30);
    obj.button1:setWidth(25);
    obj.button1:setHeight(50);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(25);
    obj.rectangle1:setTop(1);
    obj.rectangle1:setWidth(295);
    obj.rectangle1:setHeight(108);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(30);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(290);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(40);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(245);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome_arma");
    obj.edit1:setName("edit1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setLeft(30);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(290);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(0);
    obj.button2:setTop(2);
    obj.button2:setWidth(40);
    obj.button2:setHeight(20);
    obj.button2:setFontSize(11);
    obj.button2:setText("Dano");
    obj.button2:setName("button2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(40);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("dano_arma");
    obj.edit2:setName("edit2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(100);
    obj.label2:setTop(5);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setText("Alcan.");
    obj.label2:setName("label2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(145);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(55);
    obj.edit3:setHeight(25);
    obj.edit3:setField("alcance_arma");
    obj.edit3:setName("edit3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(205);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setText("Prec.");
    obj.label3:setName("label3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(245);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("precisao_arma");
    obj.edit4:setName("edit4");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setLeft(30);
    obj.layout3:setTop(55);
    obj.layout3:setWidth(290);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("Tiros");
    obj.label4:setName("label4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setLeft(40);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("tiros_arma");
    obj.edit5:setName("edit5");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(100);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("Magnit.");
    obj.label5:setName("label5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setLeft(145);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(55);
    obj.edit6:setHeight(25);
    obj.edit6:setField("magnitude_arma");
    obj.edit6:setName("edit6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(205);
    obj.label6:setTop(5);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("CdT");
    obj.label6:setName("label6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(245);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("cdt_arma");
    obj.edit7:setName("edit7");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj);
    obj.layout4:setLeft(30);
    obj.layout4:setTop(80);
    obj.layout4:setWidth(290);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout4);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Peso");
    obj.label7:setName("label7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(40);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("peso_arma");
    obj.edit8:setName("edit8");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(100);
    obj.label8:setTop(5);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("Aparar");
    obj.label8:setName("label8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setLeft(145);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(55);
    obj.edit9:setHeight(25);
    obj.edit9:setField("aparar_arma");
    obj.edit9:setName("edit9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setLeft(205);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("ST");
    obj.label9:setName("label9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout4);
    obj.edit10:setLeft(245);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("st_arma");
    obj.edit10:setName("edit10");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa arma?",
            				function (confirmado)
            					if confirmado then
            						ndb.deleteNode(sheet);
            					end;
            			end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            			
            				rolagem = rrpg.interpretarRolagem(sheet.dano_arma);
            				mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. (sheet.nome_arma or 0),
            					function (rolagem)
            						if sheet~=nil then
            							local maximo = 0;
            							local media = 0;
            							local minimo = 0;
            							local efetividade = 0;
            							local resultado = rolagem.resultado;
            							local color = 1;
            
            							for i = 1, #rolagem.ops, 1 do 
            								local operacao = rolagem.ops[i]; 
            								if operacao.tipo == "dado" then   
            									maximo = maximo + (operacao.quantidade * operacao.face);
            									media = media + (operacao.quantidade * (operacao.face+1)/2);
            									minimo = minimo + operacao.quantidade;
            								elseif operacao.tipo == "imediato" then
            									maximo = maximo + operacao.valor;
            									media = media + operacao.valor;
            									minimo = minimo + operacao.valor;
            								end;
            							end;
            
            							efetividade = math.floor( (resultado-minimo)/(maximo-minimo) * 100);
            							if efetividade < 20 then
            								color = 4;
            							elseif efetividade < 40 then
            								color = 7;
            							elseif efetividade < 60 then
            								color = 8;
            							elseif efetividade < 80 then
            								color = 12;
            							else
            								color = 9;
            							end;
            
            							local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            							mesaDoPersonagem.activeChat:enviarMensagem("[§K" .. color .. "]O golpe atingiu " .. efetividade .. "% de seu poder total!");
            						end;
            
            					end);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSSF3_4 = {
    newEditor = newfrmSSF3_4, 
    new = newfrmSSF3_4, 
    name = "frmSSF3_4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSSF3_4 = _frmSSF3_4;
rrpg.registrarForm(_frmSSF3_4);

return _frmSSF3_4;
