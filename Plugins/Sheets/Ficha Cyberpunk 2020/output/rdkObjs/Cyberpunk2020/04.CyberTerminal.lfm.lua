require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmCyberTerminal()
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
    obj:setName("frmCyberTerminal");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(50);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setWidth(30);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclListaTerminais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaTerminais:setParent(obj.layout1);
    obj.rclListaTerminais:setName("rclListaTerminais");
    obj.rclListaTerminais:setField("campoDosTerminais");
    obj.rclListaTerminais:setTemplateForm("frmDataboxSeletor");
    obj.rclListaTerminais:setAlign("client");
    obj.rclListaTerminais:setSelectable(true);
    obj.rclListaTerminais:setLayout("horizontal");

    obj.boxDetalheTerminal = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalheTerminal:setParent(obj.scrollBox1);
    obj.boxDetalheTerminal:setName("boxDetalheTerminal");
    obj.boxDetalheTerminal:setVisible(false);
    obj.boxDetalheTerminal:setAlign("client");
    obj.boxDetalheTerminal:setHeight(550);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalheTerminal);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(635);
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("TIPO");
    obj.label1:setLeft(5);
    obj.label1:setTop(1);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("UM");
    obj.label2:setLeft(105);
    obj.label2:setTop(1);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setText("FORÇA");
    obj.label3:setLeft(155);
    obj.label3:setTop(1);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setText("PREÇO");
    obj.label4:setLeft(205);
    obj.label4:setTop(1);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(255);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.rclCyberTerminal = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCyberTerminal:setParent(obj.layout2);
    obj.rclCyberTerminal:setName("rclCyberTerminal");
    obj.rclCyberTerminal:setField("cyberTerminalList");
    obj.rclCyberTerminal:setTemplateForm("frmCyberTerminalItem");
    obj.rclCyberTerminal:setLeft(5);
    obj.rclCyberTerminal:setTop(25);
    obj.rclCyberTerminal:setWidth(300);
    obj.rclCyberTerminal:setHeight(600);
    obj.rclCyberTerminal:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxDetalheTerminal);
    obj.layout3:setLeft(315);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(410);
    obj.layout3:setHeight(215);
    obj.layout3:setName("layout3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(5);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Modelo");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(105);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("modelo");
    obj.edit1:setName("edit1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(305);
    obj.label6:setTop(5);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("# de CPU");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(11);
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(355);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("modeloNum");
    obj.edit2:setName("edit2");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout3);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(30);
    obj.checkBox1:setWidth(80);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("cyberTypeCelphone");
    obj.checkBox1:setText("Celular");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout3);
    obj.checkBox2:setLeft(85);
    obj.checkBox2:setTop(30);
    obj.checkBox2:setWidth(80);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("cyberTypePortable");
    obj.checkBox2:setText("Portátil");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout3);
    obj.checkBox3:setLeft(165);
    obj.checkBox3:setTop(30);
    obj.checkBox3:setWidth(80);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setField("cyberTypeCombat");
    obj.checkBox3:setText("Combate");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout3);
    obj.checkBox4:setLeft(245);
    obj.checkBox4:setTop(30);
    obj.checkBox4:setWidth(80);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setField("cyberTypeCyber");
    obj.checkBox4:setText("Cibermembro");
    obj.checkBox4:setFontSize(10);
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout3);
    obj.checkBox5:setLeft(325);
    obj.checkBox5:setTop(30);
    obj.checkBox5:setWidth(80);
    obj.checkBox5:setHeight(20);
    obj.checkBox5:setField("cyberTypeDefault");
    obj.checkBox5:setText("Padrão");
    obj.checkBox5:setName("checkBox5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(5);
    obj.label7:setTop(60);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("Preço Total");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(105);
    obj.edit3:setTop(60);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("teminalPrice");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(205);
    obj.label8:setTop(60);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("Força do Muro de Dados");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(8);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(305);
    obj.edit4:setTop(60);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("strength");
    obj.edit4:setName("edit4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(5);
    obj.label9:setTop(85);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("Força Portão de Acesso");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(10);
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setLeft(105);
    obj.edit5:setTop(85);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("strengthGate");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(205);
    obj.label10:setTop(85);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("Velocidade");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setLeft(305);
    obj.edit6:setTop(85);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("speed");
    obj.edit6:setName("edit6");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(5);
    obj.label11:setTop(110);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("Memória");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(105);
    obj.edit7:setTop(110);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setField("memory");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout3);
    obj.checkBox6:setLeft(5);
    obj.checkBox6:setTop(135);
    obj.checkBox6:setWidth(100);
    obj.checkBox6:setHeight(20);
    obj.checkBox6:setField("cyberExtra0");
    obj.checkBox6:setText("Trodos");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout3);
    obj.checkBox7:setLeft(105);
    obj.checkBox7:setTop(135);
    obj.checkBox7:setWidth(100);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setField("cyberExtra1");
    obj.checkBox7:setText("Teclado");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout3);
    obj.checkBox8:setLeft(205);
    obj.checkBox8:setTop(135);
    obj.checkBox8:setWidth(100);
    obj.checkBox8:setHeight(20);
    obj.checkBox8:setField("cyberExtra2");
    obj.checkBox8:setText("Monitor");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout3);
    obj.checkBox9:setLeft(305);
    obj.checkBox9:setTop(135);
    obj.checkBox9:setWidth(100);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setField("cyberExtra3");
    obj.checkBox9:setText("Impressora");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout3);
    obj.checkBox10:setLeft(5);
    obj.checkBox10:setTop(160);
    obj.checkBox10:setWidth(100);
    obj.checkBox10:setHeight(20);
    obj.checkBox10:setField("cyberExtra4");
    obj.checkBox10:setText("Leitor de Chips");
    obj.checkBox10:setFontSize(10);
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout3);
    obj.checkBox11:setLeft(105);
    obj.checkBox11:setTop(160);
    obj.checkBox11:setWidth(100);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setField("cyberExtra5");
    obj.checkBox11:setText("Caixa de Voz");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout3);
    obj.checkBox12:setLeft(205);
    obj.checkBox12:setTop(160);
    obj.checkBox12:setWidth(100);
    obj.checkBox12:setHeight(20);
    obj.checkBox12:setField("cyberExtra6");
    obj.checkBox12:setText("Scanner");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout3);
    obj.checkBox13:setLeft(305);
    obj.checkBox13:setTop(160);
    obj.checkBox13:setWidth(100);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setField("cyberExtra7");
    obj.checkBox13:setText("Chips Extra");
    obj.checkBox13:setName("checkBox13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(5);
    obj.label12:setTop(185);
    obj.label12:setWidth(100);
    obj.label12:setHeight(20);
    obj.label12:setText("Ícone");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(105);
    obj.edit8:setTop(185);
    obj.edit8:setWidth(300);
    obj.edit8:setHeight(25);
    obj.edit8:setField("icon");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaTerminais:append();
        end, obj);

    obj._e_event1 = obj.rclListaTerminais:addEventListener("onSelect",
        function (_)
            local node = self.rclListaTerminais.selectedNode;
            					self.boxDetalheTerminal.node = node;
            					self.boxDetalheTerminal.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclListaTerminais:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaTerminais.selectedNode == nil and sheet ~= nil then
            						local nodes = NDB.getChildNodes(sheet.campoDosTerminais);               
            						if #nodes > 0 then
            							self.rclListaTerminais.selectedNode = nodes[1];
            						end;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclCyberTerminal:append();
        end, obj);

    obj._e_event4 = obj.rclCyberTerminal:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rclListaTerminais ~= nil then self.rclListaTerminais:destroy(); self.rclListaTerminais = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclCyberTerminal ~= nil then self.rclCyberTerminal:destroy(); self.rclCyberTerminal = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.boxDetalheTerminal ~= nil then self.boxDetalheTerminal:destroy(); self.boxDetalheTerminal = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmCyberTerminal()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmCyberTerminal();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmCyberTerminal = {
    newEditor = newfrmCyberTerminal, 
    new = newfrmCyberTerminal, 
    name = "frmCyberTerminal", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmCyberTerminal = _frmCyberTerminal;
Firecast.registrarForm(_frmCyberTerminal);

return _frmCyberTerminal;
