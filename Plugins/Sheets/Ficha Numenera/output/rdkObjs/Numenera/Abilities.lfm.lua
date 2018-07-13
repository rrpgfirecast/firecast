require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmAbilities()
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
    obj:setName("frmAbilities");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(370);
    obj.rectangle1:setHeight(35);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(25);
    obj.label1:setText("GRAU");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(50);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("grau");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(110);
    obj.label2:setTop(5);
    obj.label2:setWidth(50);
    obj.label2:setHeight(25);
    obj.label2:setText("ESFORÇO");
    obj.label2:setFontSize(10);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(160);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("esforco");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(215);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(265);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("xp");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(45);
    obj.rectangle2:setWidth(370);
    obj.rectangle2:setHeight(110);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(55);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("POTÊNCIA");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(160);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("VELOCIDADE");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(265);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setText("INTELECTO");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(55);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("potencia");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(160);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("velocidade");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(265);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("intelecto");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(5);
    obj.label7:setTop(55);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setText("Margem");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(80);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("potenciaMargem");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(185);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("velocidadeMargem");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(290);
    obj.edit9:setTop(55);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("intelectoMargem");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(80);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("Reserva");
    obj.label8:setName("label8");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(80);
    obj.edit10:setTop(80);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("potenciaReserva");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle2);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(185);
    obj.edit11:setTop(80);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("velocidadeReserva");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle2);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(290);
    obj.edit12:setTop(80);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("intelectoReserva");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(165);
    obj.rectangle3:setWidth(370);
    obj.rectangle3:setHeight(60);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle3);
    obj.label9:setLeft(35);
    obj.label9:setTop(5);
    obj.label9:setWidth(200);
    obj.label9:setHeight(25);
    obj.label9:setText("DANO");
    obj.label9:setName("label9");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle3);
    obj.checkBox1:setField("dano0");
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(35);
    obj.checkBox1:setWidth(180);
    obj.checkBox1:setText("ENFRAQUECIDO");
    obj.checkBox1:setHint("Esforço custa  ponto extra por nível aplicado. Todos os efeitos maiores e menores rolados são ignorados. 17-20 +1 Dano.");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle3);
    obj.checkBox2:setField("dano1");
    obj.checkBox2:setLeft(180);
    obj.checkBox2:setTop(35);
    obj.checkBox2:setWidth(180);
    obj.checkBox2:setText("DEBILITADO");
    obj.checkBox2:setHint("Não pode realizar ações exceto mover / rastejar. Não pode se mover se velocidade for zero. ");
    obj.checkBox2:setName("checkBox2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(235);
    obj.rectangle4:setWidth(370);
    obj.rectangle4:setHeight(60);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle4);
    obj.label10:setLeft(35);
    obj.label10:setTop(5);
    obj.label10:setWidth(100);
    obj.label10:setHeight(25);
    obj.label10:setText("RECUPERAÇÃO");
    obj.label10:setName("label10");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle4);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(130);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("recuperacao");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle4);
    obj.checkBox3:setField("recuperacao0");
    obj.checkBox3:setLeft(5);
    obj.checkBox3:setTop(35);
    obj.checkBox3:setWidth(90);
    obj.checkBox3:setText("1 Ação");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle4);
    obj.checkBox4:setField("recuperacao1");
    obj.checkBox4:setLeft(90);
    obj.checkBox4:setTop(35);
    obj.checkBox4:setWidth(90);
    obj.checkBox4:setText("10 Minutos");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle4);
    obj.checkBox5:setField("recuperacao2");
    obj.checkBox5:setLeft(180);
    obj.checkBox5:setTop(35);
    obj.checkBox5:setWidth(90);
    obj.checkBox5:setText("1 Hora");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectangle4);
    obj.checkBox6:setField("recuperacao3");
    obj.checkBox6:setLeft(270);
    obj.checkBox6:setTop(35);
    obj.checkBox6:setWidth(90);
    obj.checkBox6:setText("10 Horas");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setName("checkBox6");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(305);
    obj.rectangle5:setWidth(370);
    obj.rectangle5:setHeight(35);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setLeft(35);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(25);
    obj.label11:setText("ARMADURA");
    obj.label11:setName("label11");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle5);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(130);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("armadura");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(380);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(520);
    obj.rectangle6:setHeight(340);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle6);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar Pericia");
    obj.button1:setName("button1");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle6);
    obj.label12:setLeft(35);
    obj.label12:setTop(5);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setText("PERÍCIAS");
    obj.label12:setName("label12");

    obj.rclPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle6);
    obj.rclPericias:setLeft(5);
    obj.rclPericias:setTop(30);
    obj.rclPericias:setWidth(510);
    obj.rclPericias:setHeight(300);
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaDePericias");
    obj.rclPericias:setTemplateForm("frmSkillItem");
    obj.rclPericias:setLayout("verticalTiles");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclPericias:append();
        end, obj);

    obj._e_event1 = obj.rclPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAbilities = {
    newEditor = newfrmAbilities, 
    new = newfrmAbilities, 
    name = "frmAbilities", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAbilities = _frmAbilities;
Firecast.registrarForm(_frmAbilities);

return _frmAbilities;
